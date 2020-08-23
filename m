Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE6E24ECDB
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955F26E4C1;
	Sun, 23 Aug 2020 10:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD5F6E4A7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:10 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v9so6452450ljk.6
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ms+vSs7TQLQTH9okRwORUwhTV9LkYUiiCyhq8TlkX0Y=;
 b=daNcE8X/FU5KqHBjaevNeNJsYRSzAfH0mYvQxEgYjicqQAKPSNeu4hUPj7FYVqjI37
 Irby/sx6p4+GK25onyTheNAdM/JkSadvETNeZNfk89xJZnZEKaZ5W5u4h+ALORZLB10w
 u0fCxKdUmgXnlOGnw7kAom46WOoF84jvucnelvs2cAhfk1aL8Gg6qWM4bmUHLak3kjRm
 nhScsqn0jof0sdlfR7MnrxsbRGg0GE4N9XvlhAD/humrepF14h+ltbGgihzZYyh+ccB0
 h1WuWVq/ttHa2vS3HWOTgxZgQTfhote0IgPahii9adTeKdRBtnSw5KF09C7E+4Yp0GYb
 irEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ms+vSs7TQLQTH9okRwORUwhTV9LkYUiiCyhq8TlkX0Y=;
 b=hmS2uJ6rE3gmxfeKmHUW6jERIB1+UKp8pFLjDOBwyDaLOFfXffK1X3fdv14LMtrfQa
 sFus+RVN2KLYDJOdanl8iDIBf3HUBzY2N6mMtPnOvuYBW/WtAobu+fM9UNlN9CirduNl
 KQkAODhE1KOst1yiahA+/LbZKrz+gTQe5iZ1omC3Zul1efwBXV18ieMSRo64sC73yxP5
 lTP+aLvr2j4VvfmUrBCs6Dy7hcJbrvIYO92MGEBzjYdCVWSSByCA9Z8IBqxB+ZuJRUUP
 T/u+iofsnL24+ZVutqv9vRrdoiYHHTNbfocBPtoa351jMkHqGc7gJng9Mbc8HGGhzePX
 DPbg==
X-Gm-Message-State: AOAM532xTeNyenSsKhUythXDIis/89Ciu26PC7rZNtGs3tiZSD+U5XAr
 AzDupjWZVabQ1eq/MLZCV1bei0P2xFKPTA==
X-Google-Smtp-Source: ABdhPJxiiQlHKf1d7n8sav95arTYgW60M9ZNhCDgSHQd0EzV3RT1NSlt8+gXCsmLT5PMBtCQOeKCjA==
X-Received: by 2002:a2e:9019:: with SMTP id h25mr445850ljg.186.1598179568686; 
 Sun, 23 Aug 2020 03:46:08 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:08 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 13/24] drm/panel: samsung-s6e63m0: Backlight update
Date: Sun, 23 Aug 2020 12:45:21 +0200
Message-Id: <20200823104532.1024798-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBVc2UgZHJtX3BhbmVsIGJhY2tsaWdodCBzdXBwb3J0Ci0gVXNlIG1hY3JvIGZvciBiYWNrbGln
aHQgaW5pdGlhbGl6YXRpb24KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KQ2M6IFBhd2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNv
bT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0g
UmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLXNhbXN1bmctczZlNjNtMC5jIHwgMjUgKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC5jCmluZGV4IGE1Zjc2ZWI0ZmEyNS4uZTMw
ZWY2NTVhM2MzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3Vu
Zy1zNmU2M20wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZl
NjNtMC5jCkBAIC04OSw3ICs4OSw2IEBAIHN0YXRpYyB1OCBjb25zdCBzNmU2M20wX2dhbW1hXzIy
W05VTV9HQU1NQV9MRVZFTFNdW0dBTU1BX1RBQkxFX0NPVU5UXSA9IHsKIHN0cnVjdCBzNmU2M20w
IHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJc3RydWN0IGRybV9wYW5lbCBwYW5lbDsKLQlzdHJ1
Y3QgYmFja2xpZ2h0X2RldmljZSAqYmxfZGV2OwogCiAJc3RydWN0IHJlZ3VsYXRvcl9idWxrX2Rh
dGEgc3VwcGxpZXNbMl07CiAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsKQEAgLTI5Myw4
ICsyOTIsNiBAQCBzdGF0aWMgaW50IHM2ZTYzbTBfZGlzYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpw
YW5lbCkKIAlpZiAoIWN0eC0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKLQliYWNrbGlnaHRfZGlz
YWJsZShjdHgtPmJsX2Rldik7Ci0KIAlzNmU2M20wX2Rjc193cml0ZV9zZXFfc3RhdGljKGN0eCwg
TUlQSV9EQ1NfRU5URVJfU0xFRVBfTU9ERSk7CiAJbXNsZWVwKDIwMCk7CiAKQEAgLTM1NSw4ICsz
NTIsNiBAQCBzdGF0aWMgaW50IHM2ZTYzbTBfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVs
KQogCiAJczZlNjNtMF9kY3Nfd3JpdGVfc2VxX3N0YXRpYyhjdHgsIE1JUElfRENTX1NFVF9ESVNQ
TEFZX09OKTsKIAotCWJhY2tsaWdodF9lbmFibGUoY3R4LT5ibF9kZXYpOwotCiAJY3R4LT5lbmFi
bGVkID0gdHJ1ZTsKIAogCXJldHVybiAwOwpAQCAtMzk1LDcgKzM5MCw3IEBAIHN0YXRpYyBpbnQg
czZlNjNtMF9zZXRfYnJpZ2h0bmVzcyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmQpCiB7CiAJ
c3RydWN0IHM2ZTYzbTAgKmN0eCA9IGJsX2dldF9kYXRhKGJkKTsKIAotCWludCBicmlnaHRuZXNz
ID0gYmQtPnByb3BzLmJyaWdodG5lc3M7CisJaW50IGJyaWdodG5lc3MgPSBiYWNrbGlnaHRfZ2V0
X2JyaWdodG5lc3MoYmQpOwogCiAJLyogZGlzYWJsZSBhbmQgc2V0IG5ldyBnYW1tYSAqLwogCXM2
ZTYzbTBfZGNzX3dyaXRlKGN0eCwgczZlNjNtMF9nYW1tYV8yMlticmlnaHRuZXNzXSwKQEAgLTQx
MywyMyArNDA4LDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBzNmU2M20w
X2JhY2tsaWdodF9vcHMgPSB7CiAKIHN0YXRpYyBpbnQgczZlNjNtMF9iYWNrbGlnaHRfcmVnaXN0
ZXIoc3RydWN0IHM2ZTYzbTAgKmN0eCkKIHsKLQlzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMg
cHJvcHMgPSB7Ci0JCS50eXBlCQk9IEJBQ0tMSUdIVF9SQVcsCi0JCS5icmlnaHRuZXNzCT0gTUFY
X0JSSUdIVE5FU1MsCi0JCS5tYXhfYnJpZ2h0bmVzcyA9IE1BWF9CUklHSFRORVNTCi0JfTsKKwlE
RUNMQVJFX0JBQ0tMSUdIVF9JTklUX1JBVyhwcm9wcywgTUFYX0JSSUdIVE5FU1MsIE1BWF9CUklH
SFRORVNTKTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBjdHgtPmRldjsKKwlzdHJ1Y3QgYmFja2xp
Z2h0X2RldmljZSAqYmQ7CiAJaW50IHJldCA9IDA7CiAKLQljdHgtPmJsX2RldiA9IGRldm1fYmFj
a2xpZ2h0X2RldmljZV9yZWdpc3RlcihkZXYsICJwYW5lbCIsIGRldiwgY3R4LAotCQkJCQkJICAg
ICAmczZlNjNtMF9iYWNrbGlnaHRfb3BzLAotCQkJCQkJICAgICAmcHJvcHMpOwotCWlmIChJU19F
UlIoY3R4LT5ibF9kZXYpKSB7Ci0JCXJldCA9IFBUUl9FUlIoY3R4LT5ibF9kZXYpOworCWJkID0g
ZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKGRldiwgInBhbmVsIiwgZGV2LCBjdHgsCisJ
CQkJCSAgICAmczZlNjNtMF9iYWNrbGlnaHRfb3BzLCAmcHJvcHMpOworCWlmIChJU19FUlIoYmQp
KSB7CisJCXJldCA9IFBUUl9FUlIoYmQpOwogCQlEUk1fREVWX0VSUk9SKGRldiwgImVycm9yIHJl
Z2lzdGVyaW5nIGJhY2tsaWdodCBkZXZpY2UgKCVkKVxuIiwKIAkJCSAgICAgIHJldCk7CisJCXJl
dHVybiByZXQ7CiAJfQogCisJY3R4LT5wYW5lbC5iYWNrbGlnaHQgPSBiZDsKIAlyZXR1cm4gcmV0
OwogfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
