Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66238E6E1F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 09:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC346E4A1;
	Mon, 28 Oct 2019 08:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CFB6E290
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 17:32:46 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id d83so5970424ilk.7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Oct 2019 10:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/THBluCK4a0IYFuUyIU3vJcJ1O4y+B87o6Voa+J9XIQ=;
 b=p1Kxpu3cBauHMFWxjNqOAR5t616zmPA4iR61mHcSc7AN274sYdQR7ZouQn5BjVp3kw
 E2Tjt9gXc+bKs9Qn418U89o/9uqisB+adefv/NB0sJEpT77pO+qgGqiR2t2GejaSS3oz
 OlBaMG96jw/5f0AG+rmsL7ge5fKEHBunqVM1uXk/Qy8GCpHuFE/FtV/Ronkx0F0BpOQ+
 Qj1KmPq5+JMr0k5gb2mWqrXDA9t/FWzDaR1BRMZGFAZoz/qb6ZhqX2/tmaxji3JHI2o4
 uHDfG+AQAJduLfBIbLnV8UE9BtxKh9Pru/mO1sM983Mgx6LEvy6E8DVVtPF4l3dH2NJL
 emCQ==
X-Gm-Message-State: APjAAAWKm03SOPR4hSSxVh3q+89w5c/P9FMG1NmdsmL9Jnb4cmJ7F4vh
 5V0wCf3gLddRSny5d99T4jV5SqERCP4=
X-Google-Smtp-Source: APXvYqw+eu2LqivL3BGcAfUb+Q0Ese3CVcbVz82roiTlWwTrVlRRUIQP7KRcO2KqF3jIial50+tN/g==
X-Received: by 2002:a92:190b:: with SMTP id 11mr16909100ilz.39.1572197565994; 
 Sun, 27 Oct 2019 10:32:45 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id y5sm1196784ill.86.2019.10.27.10.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 10:32:45 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/tinydrm: Fix memroy leak in hx8357d_probe
Date: Sun, 27 Oct 2019 12:32:33 -0500
Message-Id: <20191027173234.6449-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Oct 2019 08:23:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/THBluCK4a0IYFuUyIU3vJcJ1O4y+B87o6Voa+J9XIQ=;
 b=ZWPKYvPbYBDdIJSfu5YyppHyQaRlcSw5idapnoCgxEOcGwePqoJIPQEjHI62ck0cQ7
 e6IZKSNWPOe1wpvhHn9g0acn1jmeBv7qkS+wjLYJnbDR5CBBE95OcSls/a7+OEcV5sKd
 Y+PeesFwmQ7OSN0aKD3rvW26UYbxu880wJBxhcnt1UCBazacbA6fbGSkKIx7o4YMogfV
 ivkQiuq1unCJtup2LtPFercUpPGAoLbTb3PXloOoiEJN2jT3HBP3fViCgj+q7fPBy9Fs
 nKs3ButM9wGbtLY0aKalybRBUBGRi/5cBngEuJOV9xWqTDGihPJtkmDCWVDMkljmgQRy
 E7nA==
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, emamd001@umn.edu, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIGh4ODM1N2RfcHJvYmUoKSB0aGUgYWxsb2NhdGVkIG1l
bW9yeSBmb3IgZGJpZGV2CmlzIGxlYWtlZCB3aGVuIGFuIGVycm9yIGhhcHBlbnMuIFJlbGVhc2Ug
ZGJpZGV2IGlmIGFueSBvZiB0aGUgIGZvbGxvd2luZwpjYWxscyBmYWlsOiBkZXZtX2dwaW9kX2dl
dCgpLCBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KCksCm1pcGlfZGJpX3NwaV9pbml0KCksIG1pcGlf
ZGJpX2luaXQoKSwgZHJtX2Rldl9yZWdpc3RlcigpLgoKRml4ZXM6IGYzMDBjODZlMzNhNiAoImRy
bTogQWRkIGFuIGh4ODM2N2QgdGlueWRybSBkcml2ZXIuIikKU2lnbmVkLW9mZi1ieTogTmF2aWQg
RW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90aW55L2h4ODM1N2QuYyB8IDI1ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGlueS9oeDgzNTdkLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9oeDgz
NTdkLmMKaW5kZXggOWFmOGZmODQ5NzRmLi5kYTVlYzk0NGY0N2UgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90aW55L2h4ODM1N2QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9oeDgz
NTdkLmMKQEAgLTIzMiw0NCArMjMyLDQ5IEBAIHN0YXRpYyBpbnQgaHg4MzU3ZF9wcm9iZShzdHJ1
Y3Qgc3BpX2RldmljZSAqc3BpKQogCiAJZHJtID0gJmRiaWRldi0+ZHJtOwogCXJldCA9IGRldm1f
ZHJtX2Rldl9pbml0KGRldiwgZHJtLCAmaHg4MzU3ZF9kcml2ZXIpOwotCWlmIChyZXQpIHsKLQkJ
a2ZyZWUoZGJpZGV2KTsKLQkJcmV0dXJuIHJldDsKLQl9CisJaWYgKHJldCkKKwkJZ290byBmcmVl
X2RiaWRldjsKIAogCWRybV9tb2RlX2NvbmZpZ19pbml0KGRybSk7CiAKIAlkYyA9IGRldm1fZ3Bp
b2RfZ2V0KGRldiwgImRjIiwgR1BJT0RfT1VUX0xPVyk7CiAJaWYgKElTX0VSUihkYykpIHsKIAkJ
RFJNX0RFVl9FUlJPUihkZXYsICJGYWlsZWQgdG8gZ2V0IGdwaW8gJ2RjJ1xuIik7Ci0JCXJldHVy
biBQVFJfRVJSKGRjKTsKKwkJcmV0ID0gUFRSX0VSUihkYyk7CisJCWdvdG8gZnJlZV9kYmlkZXY7
CiAJfQogCiAJZGJpZGV2LT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KGRldik7
Ci0JaWYgKElTX0VSUihkYmlkZXYtPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKGRiaWRl
di0+YmFja2xpZ2h0KTsKKwlpZiAoSVNfRVJSKGRiaWRldi0+YmFja2xpZ2h0KSkgeworCQlyZXQg
PSBQVFJfRVJSKGRiaWRldi0+YmFja2xpZ2h0KTsKKwkJZ290byBmcmVlX2RiaWRldjsKKwl9CiAK
IAlkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAicm90YXRpb24iLCAmcm90YXRpb24pOwog
CiAJcmV0ID0gbWlwaV9kYmlfc3BpX2luaXQoc3BpLCAmZGJpZGV2LT5kYmksIGRjKTsKIAlpZiAo
cmV0KQotCQlyZXR1cm4gcmV0OworCQlnb3RvIGZyZWVfZGJpZGV2OwogCiAJcmV0ID0gbWlwaV9k
YmlfZGV2X2luaXQoZGJpZGV2LCAmaHg4MzU3ZF9waXBlX2Z1bmNzLCAmeXgzNTBodjE1X21vZGUs
IHJvdGF0aW9uKTsKIAlpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCQlnb3RvIGZyZWVfZGJpZGV2
OwogCiAJZHJtX21vZGVfY29uZmlnX3Jlc2V0KGRybSk7CiAKIAlyZXQgPSBkcm1fZGV2X3JlZ2lz
dGVyKGRybSwgMCk7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBmcmVlX2RiaWRl
djsKIAogCXNwaV9zZXRfZHJ2ZGF0YShzcGksIGRybSk7CiAKIAlkcm1fZmJkZXZfZ2VuZXJpY19z
ZXR1cChkcm0sIDApOwogCiAJcmV0dXJuIDA7CisKK2ZyZWVfZGJpZGV2OgorCWtmcmVlKGRiaWRl
dik7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIGludCBoeDgzNTdkX3JlbW92ZShzdHJ1Y3Qg
c3BpX2RldmljZSAqc3BpKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
