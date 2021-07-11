//
//  LoginViewController.swift
//  geekTime
//
//  Created by vpjacob on 2021/7/11.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber {
    func validatesPhoneNumber(_ phoneNumber:String) -> Bool
}
protocol ValidatesPwd {
    func validatesPwd(_ pwd:String) -> Bool
}

extension ValidatesPhoneNumber{
    func validatesPhoneNumber(_ phoneNumber:String) -> Bool{
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatesPwd{
    func validatesPwd(_ pwd:String) -> Bool{
        if (pwd.count < 6 || pwd.count > 12) {
            return false
        }
        return true
    }
}

class LoginViewController: BaseViewController ,ValidatesPhoneNumber,ValidatesPwd{

    var phoneTextField: UITextField!
    var passwordTextField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logView = UIImageView(image: R.image.logo())
        view.addSubview(logView)
        logView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }

        
        let phoneIcon = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIcon
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.borderWidth = 1
        phoneTextField.placeholder = "请输入手机号"
        phoneTextField.layer.masksToBounds = true
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logView.snp_bottom).offset(20)
            make.height.equalTo(50)
        }

        let passwordIconView = UIImageView(image: R.image.icon_pwd())

        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.masksToBounds = true
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp_bottom).offset(15)
            make.height.equalTo(50)
        }

        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor.hexColor(0xf8892e)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        
        
    }
    
    @objc func didClickLoginButton()  {
        if validatesPhoneNumber(phoneTextField.text ?? "") &&
            validatesPwd(passwordTextField.text ?? ""){
            
        }else{
            self.showToast()
        }
    }
    
    func showToast()  {
        let alertVC = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            alertVC.dismiss(animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
