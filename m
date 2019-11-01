Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D62EC378
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 14:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202266E21E;
	Fri,  1 Nov 2019 13:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E124F6E21E
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 13:05:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so8742601wmf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 06:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImCE5nJq/DYo2Ok76YGyMffnMJmXxt+3gqtE07/WUSI=;
 b=fENz8N7m0OeqmbL0srL3jgpsAWcGW89zAbsj1eh+8XilIcoU8LhwYamoqQhJVCZYmC
 RhEM3wXNLhb9aezBsPWCZjzGI2spPKkZ0rMQhpyVi1m26I6gkhyyy27mm3mPffxhii6V
 g5Dqox9BHMBdooLz6tTiiprZjpB6+3xQ3IFn2pyqt3pguwIhK31DdD3WENcJxNKQfQmh
 qt5WWQO6MyXQtoHUyi/8ZFrFDJttUgbR2aRCv3PycTCXV+LoF1aElXS48kmwZpHKWL0g
 hDehs0mYvAz496QTR/+DbdR7DC8NJSGt95hBO6a9XyqP/S4S2Vx9YqvHOE7NeDniLeRh
 yYsw==
X-Gm-Message-State: APjAAAXOPEROPSdXulAC+/RDCxN9D+3RkVISMU6cD+BQlCuo6FaY+9uW
 +0ptE6qJuFU7HniODUHz3ENJlkRK
X-Google-Smtp-Source: APXvYqzjnXie8oyxobwQdtqji8WUXzhYkb/Dr5sBkWbjmRgNCHXCiWC9TGVN5+TnSeZinkv4jFySfA==
X-Received: by 2002:a1c:16:: with SMTP id 22mr10887064wma.0.1572613507589;
 Fri, 01 Nov 2019 06:05:07 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id a15sm2450562wmm.12.2019.11.01.06.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 06:05:06 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/vmwgfx: move the require_exist handling together
Date: Fri,  1 Nov 2019 13:03:09 +0000
Message-Id: <20191101130313.8862-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImCE5nJq/DYo2Ok76YGyMffnMJmXxt+3gqtE07/WUSI=;
 b=cCjLvEeoKSNZfi/JAs0L9/InfUMN4ecIybnYK42YHI6MLFXrXIC4LXE1aFJq4B97sW
 bIWR4g3Uo1dtzB+LqvF4plqP+DyJZ7PmEnNYc0btx04TSQCTglCY7jtuHT/BR3/dVaZg
 4JS4bLmnXXt6a90AtZOvSGFhigKCXXvtCWboggskiyoRi1rlBHZYtjBXwlO06ZXa0ejD
 rtfk7QomTER+TWhctwADWdIzVQTZOJ7k/SUkh+klx1Mr78ZtoA9qgTDmN0tYGMfqJ/63
 AUpH9x/hvJj526j3Upl+s4FvNtDoOTE1RXr0ehpQ3KcICY3QvmtN2eDdgPtxPhY/ksBQ
 KIcw==
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
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCk1vdmUgdGhl
IHJlbmRlcl9jbGllbnQgaHVuayBmb3IgcmVxdWlyZV9leGlzdCBhbG9uZ3NpZGUgdGhlIHJlc3Qu
CktlZXBpbmcgYWxsIHRoZSByZWFzb25zIHdoeSBhbiBleGlzdGluZyBvYmplY3QgaXMgbmVlZGVk
LCBpbiBhIHNpbmdsZQpwbGFjZSBtYWtlcyBpdCBlYXNpZXIgdG8gZm9sbG93LgoKQ2M6IFZNd2Fy
ZSBHcmFwaGljcyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPgpDYzogVGhv
bWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3N1cmZhY2UuYwppbmRleCAyOWQ4Nzk0ZjA0MjEuLjFmOTg5ZjM2MDVjOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwpAQCAtOTA5LDE2ICs5MDksMTIgQEAgdm13
X3N1cmZhY2VfaGFuZGxlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2LAog
CXVpbnQzMl90IGhhbmRsZTsKIAlzdHJ1Y3QgdHRtX2Jhc2Vfb2JqZWN0ICpiYXNlOwogCWludCBy
ZXQ7Ci0JYm9vbCByZXF1aXJlX2V4aXN0ID0gZmFsc2U7CiAKIAlpZiAoaGFuZGxlX3R5cGUgPT0g
RFJNX1ZNV19IQU5ETEVfUFJJTUUpIHsKIAkJcmV0ID0gdHRtX3ByaW1lX2ZkX3RvX2hhbmRsZSh0
ZmlsZSwgdV9oYW5kbGUsICZoYW5kbGUpOwogCQlpZiAodW5saWtlbHkocmV0ICE9IDApKQogCQkJ
cmV0dXJuIHJldDsKIAl9IGVsc2UgewotCQlpZiAodW5saWtlbHkoZHJtX2lzX3JlbmRlcl9jbGll
bnQoZmlsZV9wcml2KSkpCi0JCQlyZXF1aXJlX2V4aXN0ID0gdHJ1ZTsKLQogCQloYW5kbGUgPSB1
X2hhbmRsZTsKIAl9CiAKQEAgLTkzNSw2ICs5MzEsOCBAQCB2bXdfc3VyZmFjZV9oYW5kbGVfcmVm
ZXJlbmNlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJfQogCiAJaWYgKGhhbmRsZV90
eXBlICE9IERSTV9WTVdfSEFORExFX1BSSU1FKSB7CisJCWJvb2wgcmVxdWlyZV9leGlzdCA9IGZh
bHNlOworCiAJCXVzZXJfc3JmID0gY29udGFpbmVyX29mKGJhc2UsIHN0cnVjdCB2bXdfdXNlcl9z
dXJmYWNlLAogCQkJCQlwcmltZS5iYXNlKTsKIApAQCAtOTQ2LDYgKzk0NCw5IEBAIHZtd19zdXJm
YWNlX2hhbmRsZV9yZWZlcmVuY2Uoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKIAkJICAg
IHVzZXJfc3JmLT5tYXN0ZXIgIT0gZmlsZV9wcml2LT5tYXN0ZXIpCiAJCQlyZXF1aXJlX2V4aXN0
ID0gdHJ1ZTsKIAorCQlpZiAodW5saWtlbHkoZHJtX2lzX3JlbmRlcl9jbGllbnQoZmlsZV9wcml2
KSkpCisJCQlyZXF1aXJlX2V4aXN0ID0gdHJ1ZTsKKwogCQlyZXQgPSB0dG1fcmVmX29iamVjdF9h
ZGQodGZpbGUsIGJhc2UsIFRUTV9SRUZfVVNBR0UsIE5VTEwsCiAJCQkJCSByZXF1aXJlX2V4aXN0
KTsKIAkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkgewotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
