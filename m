Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA4113525
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 19:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35BC6F468;
	Wed,  4 Dec 2019 18:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9366F468
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 18:46:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED583B20B;
 Wed,  4 Dec 2019 18:46:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/gma500: Call psb_driver_{load,
 unload}() before registering device
Date: Wed,  4 Dec 2019 19:46:17 +0100
Message-Id: <20191204184617.22201-1-tzimmermann@suse.de>
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
ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvcHNiX2Rydi5jCmluZGV4IDE5MmEzOWU1MjYxNy4uNTI1OTE0MTZm
OGZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYwpAQCAtMjMsNyArMjMsNiBAQAogI2luY2x1
ZGUgPGRybS9kcm1fZmlsZS5oPgogI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2lycS5oPgotI2luY2x1ZGUgPGRybS9kcm1fcGNpLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9wY2lpZHMuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgoKQEAgLTQyNywxNCAr
NDI2LDQ4IEBAIHN0YXRpYyBsb25nIHBzYl91bmxvY2tlZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmls
cCwgdW5zaWduZWQgaW50IGNtZCwKCiBzdGF0aWMgaW50IHBzYl9wY2lfcHJvYmUoc3RydWN0IHBj
aV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiB7Ci0JcmV0dXJu
IGRybV9nZXRfcGNpX2RldihwZGV2LCBlbnQsICZkcml2ZXIpOwotfQorCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXY7CisJaW50IHJldDsKKworCXJldCA9IHBjaV9lbmFibGVfZGV2aWNlKHBkZXYpOwor
CWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKKwlkZXYgPSBkcm1fZGV2X2FsbG9jKCZkcml2ZXIs
ICZwZGV2LT5kZXYpOworCWlmIChJU19FUlIoZGV2KSkgeworCQlyZXQgPSBQVFJfRVJSKGRldik7
CisJCWdvdG8gZXJyX3BjaV9kaXNhYmxlX2RldmljZTsKKwl9CisKKwlkZXYtPnBkZXYgPSBwZGV2
OworCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOworCisJcmV0ID0gcHNiX2RyaXZlcl9sb2Fk
KGRldiwgZW50LT5kcml2ZXJfZGF0YSk7CisJaWYgKHJldCkKKwkJZ290byBlcnJfZHJtX2Rldl9w
dXQ7CgorCXJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZGV2LCBlbnQtPmRyaXZlcl9kYXRhKTsKKwlp
ZiAocmV0KQorCQlnb3RvIGVycl9wc2JfZHJpdmVyX3VubG9hZDsKKworCXJldHVybiAwOworCitl
cnJfcHNiX2RyaXZlcl91bmxvYWQ6CisJcHNiX2RyaXZlcl91bmxvYWQoZGV2KTsKK2Vycl9kcm1f
ZGV2X3B1dDoKKwlkcm1fZGV2X3B1dChkZXYpOworZXJyX3BjaV9kaXNhYmxlX2RldmljZToKKwlw
Y2lfZGlzYWJsZV9kZXZpY2UocGRldik7CisJcmV0dXJuIHJldDsKK30KCiBzdGF0aWMgdm9pZCBw
c2JfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIHsKIAlzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwotCWRybV9wdXRfZGV2KGRldik7CisKKwlk
cm1fZGV2X3VucmVnaXN0ZXIoZGV2KTsKKwlwc2JfZHJpdmVyX3VubG9hZChkZXYpOworCWRybV9k
ZXZfcHV0KGRldik7CiB9Cgogc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHBzYl9wbV9v
cHMgPSB7CkBAIC00NjcsOCArNTAwLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJh
dGlvbnMgcHNiX2dlbV9mb3BzID0gewoKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBkcml2ZXIg
PSB7CiAJLmRyaXZlcl9mZWF0dXJlcyA9IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX0dFTSwKLQku
bG9hZCA9IHBzYl9kcml2ZXJfbG9hZCwKLQkudW5sb2FkID0gcHNiX2RyaXZlcl91bmxvYWQsCiAJ
Lmxhc3RjbG9zZSA9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3NlLAoKIAkubnVtX2lvY3RscyA9IEFS
UkFZX1NJWkUocHNiX2lvY3RscyksCi0tCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
