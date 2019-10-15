Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135FD78AD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2586E81C;
	Tue, 15 Oct 2019 14:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849FA6E81C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:30 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so20542675wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a2hFJfPcmU+1QME3yiyJJOlkCwdCvnL+/eU6hsH1/xM=;
 b=hV4+VvEv2qCMGur+he58rRJfnx1eTqHOyQYpBwh+XrHXPYFz7J7Y8mOVP2Rc9icWIS
 5Pe9knDaIiHSuzcO0oj+ktpF2lWhWfA+j8NL96YRyb3ZpElWDpRunCc5+ULVORw/VmI0
 e0w5qfCNFuWQ5GjUAO0jN1ACMmYhMf0zAGZ4TCqfEa2e7vB6IlW/4TSSJS2Dk1AqPXgZ
 Jo4N/R+8tp5IN4P3w1IvuAaNzM/o5RYd582dOirA5R+hB29oC0R8r0VmEQrsL2YfrWXU
 75r3sb5uBG/zeBVp4wLKUX+MvU7N1SCRd9RbhuiUFilX9RNmyWJh6MqGUag/LkyVvcMy
 Te6w==
X-Gm-Message-State: APjAAAUgSNat9bMSVmJt75442cY1EJnolWyNz9V3/q48Q5Inlg27eGuN
 dJRiHR/+bntbCu+d3XFSTDaKEziV
X-Google-Smtp-Source: APXvYqyG8ZJDYhlRz8xzD3q5UjwyYYcYdk9Co8NNcHZ4SonAmzGDYGViXfTTEKkaKbExcNLisqcAFA==
X-Received: by 2002:a1c:2604:: with SMTP id m4mr21064690wmm.112.1571150127841; 
 Tue, 15 Oct 2019 07:35:27 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id q3sm18859548wru.33.2019.10.15.07.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/15] drm/dp: Read AUX read interval from DPCD
Date: Tue, 15 Oct 2019 16:35:00 +0200
Message-Id: <20191015143509.1104985-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a2hFJfPcmU+1QME3yiyJJOlkCwdCvnL+/eU6hsH1/xM=;
 b=n4ZdjQJ5+1N8NMZJGAnQUC2bULBinPT1lmz3XLjzTYSSBal+VvlH5DQdvEstv0l5gm
 BmjNI3OM7D00V6YpWNba6fgtkwylyW9JpYk79jYnBOBQppRp6SPtkF+vFhMJqD58M7kt
 qSM86jMUWSNvnip+XbHaHc8jnyX9vwVrv7O6WH+hRR6NM5PKdY3oIp+U0uqn2A89+P6C
 f6gemC03t86o17wW0ySAymZZa/QgA5hLk/9hnpO1JQf+O6ghkzJzdgYsTmueyxrnjbVp
 FUWYXOaM0TSuDislojBq6YLcan8Q+Rh7bkw10pHBqIcVvuby4ddDngrpNHoRP8Jx7uT+
 FGrA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN0b3JlIHRoZSBBVVgg
cmVhZCBpbnRlcnZhbCBmcm9tIERQQ0QsIHNvIHRoYXQgaXQgY2FuIGJlIHVzZWQgdG8gd2FpdApm
b3IgdGhlIGR1cmF0aW9ucyBnaXZlbiBpbiB0aGUgc3BlY2lmaWNhdGlvbiBkdXJpbmcgbGluayB0
cmFpbmluZy4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5j
b20+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgMzMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaAppbmRleCA3YTUzN2ZmYzJmYjEuLjZjMTJkZTZmN2U0NiAxMDA2NDQKLS0tIGEv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxw
ZXIuaApAQCAtMjUsOCArMjUsMTEgQEAKIAogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5j
bHVkZSA8bGludXgvaTJjLmg+CisjaW5jbHVkZSA8bGludXgvdGltZTY0Lmg+CiAjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4KIAorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KKwogLyoKICAqIFVu
bGVzcyBvdGhlcndpc2Ugbm90ZWQsIGFsbCB2YWx1ZXMgYXJlIGZyb20gdGhlIERQIDEuMWEgc3Bl
Yy4gIE5vdGUgdGhhdAogICogRFAgYW5kIERQQ0QgdmVyc2lvbnMgYXJlIGluZGVwZW5kZW50LiAg
RGlmZmVyZW5jZXMgZnJvbSAxLjAgYXJlIG5vdCBub3RlZCwKQEAgLTEyOTcsNiArMTMwMCwzNiBA
QCBkcm1fZHBfYWx0ZXJuYXRlX3NjcmFtYmxlcl9yZXNldF9jYXAoY29uc3QgdTggZHBjZFtEUF9S
RUNFSVZFUl9DQVBfU0laRV0pCiAJCQlEUF9BTFRFUk5BVEVfU0NSQU1CTEVSX1JFU0VUX0NBUDsK
IH0KIAorLyoqCisgKiBkcm1fZHBfcmVhZF9hdXhfaW50ZXJ2YWwoKSAtIHJlYWQgdGhlIEFVWCBy
ZWFkIGludGVydmFsIGZyb20gdGhlIERQQ0QKKyAqIEBkcGNkOiByZWNlaXZlciBjYXBhY2l0eSBi
dWZmZXIKKyAqCisgKiBSZWFkcyB0aGUgQVVYIHJlYWQgaW50ZXJ2YWwgKGluIG1pY3Jvc2Vjb25k
cykgZnJvbSB0aGUgRFBDRC4gTm90ZSB0aGF0IHRoZQorICogVFJBSU5JTkdfQVVYX1JEX0lOVEVS
VkFMIHN0b3JlcyB0aGUgdmFsdWUgaW4gdW5pdHMgb2YgNCBtaWxsaXNlY29uZHMuIElmIG5vCisg
KiByZWFkIGludGVydmFsIGlzIHNwZWNpZmllZCBhbmQgZm9yIERQQ0QgdjEuNCBhbmQgbGF0ZXIs
IHRoZSByZWFkIGludGVydmFsCisgKiBpcyBhbHdheXMgMTAwIG1pY3Jvc2Vjb25kcy4KKyAqCisg
KiBSZXR1cm5zOgorICogVGhlIHJlYWQgQVVYIGludGVydmFsIGluIG1pY3Jvc2Vjb25kcy4KKyAq
Lworc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQKK2RybV9kcF9hdXhfcmRfaW50ZXJ2YWwoY29u
c3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCit7CisJdW5zaWduZWQgaW50IHJkX2lu
dGVydmFsID0gZHBjZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKKwkJCQkJRFBfVFJB
SU5JTkdfQVVYX1JEX01BU0s7CisKKwlpZiAocmRfaW50ZXJ2YWwgPiA0KQorCQlEUk1fREVCVUdf
S01TKCJBVVggaW50ZXJ2YWwgJXUsIG91dCBvZiByYW5nZSAobWF4OiA0KVxuIiwKKwkJCSAgICAg
IHJkX2ludGVydmFsKTsKKworCWlmIChyZF9pbnRlcnZhbCA+IDAgJiYgZHBjZFtEUF9EUENEX1JF
Vl0gPCBEUF9EUENEX1JFVl8xNCkKKwkJcmRfaW50ZXJ2YWwgKj0gNCAqIFVTRUNfUEVSX01TRUM7
CisJZWxzZQorCQlyZF9pbnRlcnZhbCA9IDEwMDsKKworCXJldHVybiByZF9pbnRlcnZhbDsKK30K
KwogLyoKICAqIERpc3BsYXlQb3J0IEFVWCBjaGFubmVsCiAgKi8KLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
