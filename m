Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FFC113D80
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 10:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063D76E98B;
	Thu,  5 Dec 2019 09:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31E46E98B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 09:02:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F8CDAFF0;
 Thu,  5 Dec 2019 09:02:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH] drm/mgag200: Call mgag200_driver_{load,
 unload}() before registering device
Date: Thu,  5 Dec 2019 10:02:52 +0100
Message-Id: <20191205090252.5711-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGxvYWQvdW5sb2FkIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlciBhcmUgZGVwcmVj
YXRlZC4gUmVtb3ZlCnRoZW0gYW5kIGNhbGwgZnVuY3Rpb25zIGV4cGxpY2l0bHkuCgpTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIHwgNDQgKysrKysrKysrKysrKysrKysr
KysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuYwppbmRleCBkNDM5NTFjYWVlYTAu
LjMwYjNiODI3YWRmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jCkBAIC02
LDEzICs2LDEzIEBACiAgKiAgICAgICAgICBEYXZlIEFpcmxpZQogICovCgotI2luY2x1ZGUgPGxp
bnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L2NvbnNvbGUuaD4KKyNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9wY2kuaD4KCiAjaW5jbHVkZSA8ZHJtL2RybV9k
cnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2lvY3Rs
Lmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9wY2kuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3BjaWlkcy5o
PgoKICNpbmNsdWRlICJtZ2FnMjAwX2Rydi5oIgpAQCAtNDgsMTYgKzQ4LDUwIEBAIE1PRFVMRV9E
RVZJQ0VfVEFCTEUocGNpLCBwY2lpZGxpc3QpOwoKIHN0YXRpYyBpbnQgbWdhX3BjaV9wcm9iZShz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkKIHsK
KwlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2OworCWludCByZXQ7CisKIAlkcm1fZmJfaGVscGVyX3Jl
bW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKHBkZXYsICJtZ2FnMjAwZHJtZmIiKTsK
Ci0JcmV0dXJuIGRybV9nZXRfcGNpX2RldihwZGV2LCBlbnQsICZkcml2ZXIpOworCXJldCA9IHBj
aV9lbmFibGVfZGV2aWNlKHBkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlkZXYg
PSBkcm1fZGV2X2FsbG9jKCZkcml2ZXIsICZwZGV2LT5kZXYpOworCWlmIChJU19FUlIoZGV2KSkg
eworCQlyZXQgPSBQVFJfRVJSKGRldik7CisJCWdvdG8gZXJyX3BjaV9kaXNhYmxlX2RldmljZTsK
Kwl9CisKKwlkZXYtPnBkZXYgPSBwZGV2OworCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOwor
CisJcmV0ID0gbWdhZzIwMF9kcml2ZXJfbG9hZChkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOworCWlm
IChyZXQpCisJCWdvdG8gZXJyX2RybV9kZXZfcHV0OworCisJcmV0ID0gZHJtX2Rldl9yZWdpc3Rl
cihkZXYsIGVudC0+ZHJpdmVyX2RhdGEpOworCWlmIChyZXQpCisJCWdvdG8gZXJyX21nYWcyMDBf
ZHJpdmVyX3VubG9hZDsKKworCXJldHVybiAwOworCitlcnJfbWdhZzIwMF9kcml2ZXJfdW5sb2Fk
OgorCW1nYWcyMDBfZHJpdmVyX3VubG9hZChkZXYpOworZXJyX2RybV9kZXZfcHV0OgorCWRybV9k
ZXZfcHV0KGRldik7CitlcnJfcGNpX2Rpc2FibGVfZGV2aWNlOgorCXBjaV9kaXNhYmxlX2Rldmlj
ZShwZGV2KTsKKwlyZXR1cm4gcmV0OwogfQoKIHN0YXRpYyB2b2lkIG1nYV9wY2lfcmVtb3ZlKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0
X2RydmRhdGEocGRldik7CgotCWRybV9wdXRfZGV2KGRldik7CisJZHJtX2Rldl91bnJlZ2lzdGVy
KGRldik7CisJbWdhZzIwMF9kcml2ZXJfdW5sb2FkKGRldik7CisJZHJtX2Rldl9wdXQoZGV2KTsK
IH0KCiBERUZJTkVfRFJNX0dFTV9GT1BTKG1nYWcyMDBfZHJpdmVyX2ZvcHMpOwpAQCAtOTMsOCAr
MTI3LDYgQEAgaW50IG1nYWcyMDBfZHJpdmVyX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSwKCiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewogCS5kcml2ZXJfZmVh
dHVyZXMgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQsCi0JLmxvYWQgPSBtZ2FnMjAwX2Ry
aXZlcl9sb2FkLAotCS51bmxvYWQgPSBtZ2FnMjAwX2RyaXZlcl91bmxvYWQsCiAJLmZvcHMgPSAm
bWdhZzIwMF9kcml2ZXJfZm9wcywKIAkubmFtZSA9IERSSVZFUl9OQU1FLAogCS5kZXNjID0gRFJJ
VkVSX0RFU0MsCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
