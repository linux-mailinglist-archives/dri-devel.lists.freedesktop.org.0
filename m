Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55093620B1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1108994D;
	Mon,  8 Jul 2019 14:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117D18994D;
 Mon,  8 Jul 2019 14:42:13 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MWiYo-1hzqv148xk-00X1Le; Mon, 08 Jul 2019 16:42:08 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] amdgpu: make pmu support optional
Date: Mon,  8 Jul 2019 16:41:43 +0200
Message-Id: <20190708144205.2770771-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:TL1q7iyD5PpIZrvVCvrRvHAEqENf6QOhISgByGYYJX9jV/rf/xg
 M406DVe1lGcgSljrSAf61pEusIKkC3qSIQ+fLZSMbU3brdrpcG2nHgEwYkia6rDBUCq2ZdZ
 Ag8tQzIQs5OwrZE2DI7ZuF7dvJosR20rVcUecDsFwHtc/2KjOzZCJ7I9hVY7OkhpKGBqGat
 A1j3Rt2ErvZmbhjIQ4x+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lnFTjrpE41c=:9mQYtLxFcpzQV2qFm/8yIE
 SoJ/ip22hyZDDdbyqQRhP1ar5J85GrRy0ziq8mkxbDL6ImsU+PRvY7t2xMVKx/rwh1XyU94de
 jbLARyZH1ZtsMfRLZkRR5soBdlxdutLlFwwOGzoz4+dTivWjZinLfkdzHHht3wBtlG9UTL9fx
 R+lDMHwCBjULSVCwQA8ok0YBWjywIs9uJDnrcu9k7+7JKXNWqbiTDOFgDiUYOVZ9dy8PjkVnT
 lquSTfbKQOf4desKeysg/LijtPf6zgJgGFAj20D3FUGSKMrEt79X7YbQeYHKALF0S7i7pyMGG
 Azboq2UifUADzZOy/SqwCm5gAZ6OnsSNxDvYvNLB9EXNH2X5TR7rHq47HecfTvRh+02LOBoaA
 Ns6LI8KM7pnmYn2nMCATam+RFzvUbkh5VpOc874UZEvvmJ7mY/y1Yco9ZfZ4K33wIYpYdMU2Z
 M54SC6ZNmKKtY6i6ARl1I1ahJl4jq9NoGiC9uCAN+gQK/QRvDakzR/kK/Xw2rGXOueiT3ME1H
 maqnFEa4jdvcSoU5Ql83Y9R/HCkrRQInX2yjnb3NDPKg7yLdMCZDOuPikOO7+lJzc77BgR9/X
 8FFwGxKCtdu6wMVEFKVnpGq5c9/Ddi152/IFttm742ujmFIRR7sFzDTCUIvIVEaTbP/mHjpIu
 N1BT3MKSASMJiYypWubm5ww5IKJj7yu6E6eoK4NgYLsrXiFoblrf+v2a6ToGTFzvNK/spe5hR
 IN2J/smOH2L/OpQ/5IZ2wa98hRbURz8AeGrGpQ==
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Jonathan Kim <Jonathan.Kim@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Felix Kuehling <Felix.Kuehling@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Emily Deng <Emily.Deng@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Rex Zhu <Rex.Zhu@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBDT05GSUdfUEVSRl9FVkVOVFMgaXMgZGlzYWJsZWQsIHdlIGNhbm5vdCBjb21waWxlIHRo
ZSBwbXUKcG9ydGlvbiBvZiB0aGUgYW1kZ3B1IGRyaXZlcjoKCmRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9wbXUuYzo0ODozODogZXJyb3I6IG5vIG1lbWJlciBuYW1lZCAnaHcnIGlu
ICdzdHJ1Y3QgcGVyZl9ldmVudCcKICAgICAgICBzdHJ1Y3QgaHdfcGVyZl9ldmVudCAqaHdjID0g
JmV2ZW50LT5odzsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+ICBe
CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzo1MToxMzogZXJyb3I6IG5v
IG1lbWJlciBuYW1lZCAnYXR0cicgaW4gJ3N0cnVjdCBwZXJmX2V2ZW50JwogICAgICAgIGlmIChl
dmVudC0+YXR0ci50eXBlICE9IGV2ZW50LT5wbXUtPnR5cGUpCiAgICAgICAgICAgIH5+fn5+ICBe
Ci4uLgoKVXNlIGNvbmRpdGlvbmFsIGNvbXBpbGF0aW9uIGZvciB0aGlzIGZpbGUuCgpGaXhlczog
OWM3Yzg1ZjdlYTFmICgiZHJtL2FtZGdwdTogYWRkIHBtdSBjb3VudGVycyIpClNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvTWFrZWZpbGUgICAgICAgIHwgNCArKystCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA2ICsrKystLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9NYWtlZmlsZQpp
bmRleCAzYTE1YTQ2YjRlY2IuLjNmNTMyOTkwNmZjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
TWFrZWZpbGUKQEAgLTU0LDcgKzU0LDkgQEAgYW1kZ3B1LXkgKz0gYW1kZ3B1X2RldmljZS5vIGFt
ZGdwdV9rbXMubyBcCiAJYW1kZ3B1X2d0dF9tZ3IubyBhbWRncHVfdnJhbV9tZ3IubyBhbWRncHVf
dmlydC5vIGFtZGdwdV9hdG9tZmlybXdhcmUubyBcCiAJYW1kZ3B1X3ZmX2Vycm9yLm8gYW1kZ3B1
X3NjaGVkLm8gYW1kZ3B1X2RlYnVnZnMubyBhbWRncHVfaWRzLm8gXAogCWFtZGdwdV9nbWMubyBh
bWRncHVfeGdtaS5vIGFtZGdwdV9jc2EubyBhbWRncHVfcmFzLm8gYW1kZ3B1X3ZtX2NwdS5vIFwK
LQlhbWRncHVfdm1fc2RtYS5vIGFtZGdwdV9wbXUubyBhbWRncHVfZGlzY292ZXJ5Lm8KKwlhbWRn
cHVfdm1fc2RtYS5vIGFtZGdwdV9kaXNjb3ZlcnkubworCithbWRncHUtJChDT05GSUdfUEVSRl9F
VkVOVFMpICs9IGFtZGdwdV9wbXUubwogCiAjIGFkZCBhc2ljIHNwZWNpZmljIGJsb2NrCiBhbWRn
cHUtJChDT05GSUdfRFJNX0FNREdQVV9DSUspKz0gY2lrLm8gY2lrX2loLm8ga3Zfc21jLm8ga3Zf
ZHBtLm8gXApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4
IDMwOTg5YjQ1NTA0Ny4uYTAyY2NjZTdiZjUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2RldmljZS5jCkBAIC0yODE2LDcgKzI4MTYsOCBAQCBpbnQgYW1kZ3B1X2Rldmlj
ZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQlyZXR1cm4gcjsKIAl9CiAKLQly
ID0gYW1kZ3B1X3BtdV9pbml0KGFkZXYpOworCWlmIChJU19FTkFCTEVEKENPTkZJR19QRVJGX0VW
RU5UUykpCisJCXIgPSBhbWRncHVfcG11X2luaXQoYWRldik7CiAJaWYgKHIpCiAJCWRldl9lcnIo
YWRldi0+ZGV2LCAiYW1kZ3B1X3BtdV9pbml0IGZhaWxlZFxuIik7CiAKQEAgLTI4ODgsNyArMjg4
OSw4IEBAIHZvaWQgYW1kZ3B1X2RldmljZV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KQogCWFtZGdwdV9kZWJ1Z2ZzX3JlZ3NfY2xlYW51cChhZGV2KTsKIAlkZXZpY2VfcmVtb3ZlX2Zp
bGUoYWRldi0+ZGV2LCAmZGV2X2F0dHJfcGNpZV9yZXBsYXlfY291bnQpOwogCWFtZGdwdV91Y29k
ZV9zeXNmc19maW5pKGFkZXYpOwotCWFtZGdwdV9wbXVfZmluaShhZGV2KTsKKwlpZiAoSVNfRU5B
QkxFRChDT05GSUdfUEVSRl9FVkVOVFMpKQorCQlhbWRncHVfcG11X2ZpbmkoYWRldik7CiAJYW1k
Z3B1X2RlYnVnZnNfcHJlZW1wdF9jbGVhbnVwKGFkZXYpOwogCWlmIChhbWRncHVfZGlzY292ZXJ5
KQogCQlhbWRncHVfZGlzY292ZXJ5X2ZpbmkoYWRldik7Ci0tIAoyLjIwLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
