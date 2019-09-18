Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC8B65FB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36F36F58F;
	Wed, 18 Sep 2019 14:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCB56F4B4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:23:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8FAD7B686;
 Wed, 18 Sep 2019 14:23:13 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org,
 yc_chen@aspeedtech.com, corbet@lwn.net
Subject: [PATCH 08/11] drm/mgag200: Add separate move-cursor function
Date: Wed, 18 Sep 2019 16:23:04 +0200
Message-Id: <20190918142307.27127-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkaW5nIG1nYWcyMDBfbW92ZV9jdXJzb3IoKSBtYWtlcyB0aGUgY3Vyc29yIGNvZGUgbW9yZSBj
b25zaXN0ZW50IGFuZAp3aWxsIGJlY29tZSBoYW5keSB3aGVuIHdlIG1vdmUgdG8gdW5pdmVyc2Fs
IGN1cnNvciBwbGFuZXMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNv
ci5jIHwgMjkgKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIw
MF9jdXJzb3IuYwppbmRleCBjNmE3YWQxMWNhNzIuLmFhYmFjZGQzZTQwMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9jdXJzb3IuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2N1cnNvci5jCkBAIC0yNCw2ICsyNCwyNCBAQCBzdGF0aWMg
dm9pZCBtZ2FnMjAwX2hpZGVfY3Vyc29yKHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2KQogCW1kZXYt
PmN1cnNvci5waXhlbHNfY3VycmVudCA9IE5VTEw7CiB9CiAKK3N0YXRpYyB2b2lkIG1nYWcyMDBf
bW92ZV9jdXJzb3Ioc3RydWN0IG1nYV9kZXZpY2UgKm1kZXYsIGludCB4LCBpbnQgeSkKK3sKKwlp
ZiAoV0FSTl9PTih4IDw9IDApKQorCQlyZXR1cm47CisJaWYgKFdBUk5fT04oeSA8PSAwKSkKKwkJ
cmV0dXJuOworCWlmIChXQVJOX09OKHggJiB+MHhmZmZmKSkKKwkJcmV0dXJuOworCWlmIChXQVJO
X09OKHkgJiB+MHhmZmZmKSkKKwkJcmV0dXJuOworCisJV1JFRzgoTUdBX0NVUlBPU1hMLCB4ICYg
MHhmZik7CisJV1JFRzgoTUdBX0NVUlBPU1hILCAoeD4+OCkgJiAweGZmKTsKKworCVdSRUc4KE1H
QV9DVVJQT1NZTCwgeSAmIDB4ZmYpOworCVdSRUc4KE1HQV9DVVJQT1NZSCwgKHk+PjgpICYgMHhm
Zik7Cit9CisKIGludCBtZ2FnMjAwX2N1cnNvcl9pbml0KHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2
KQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtZGV2LT5kZXY7CkBAIC0yNTEsMTkgKzI2
OSwxMiBAQCBpbnQgbWdhZzIwMF9jcnRjX2N1cnNvcl9zZXQoc3RydWN0IGRybV9jcnRjICpjcnRj
LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKIGludCBtZ2FnMjAwX2NydGNfY3Vyc29yX21v
dmUoc3RydWN0IGRybV9jcnRjICpjcnRjLCBpbnQgeCwgaW50IHkpCiB7CiAJc3RydWN0IG1nYV9k
ZXZpY2UgKm1kZXYgPSAoc3RydWN0IG1nYV9kZXZpY2UgKiljcnRjLT5kZXYtPmRldl9wcml2YXRl
OworCiAJLyogT3VyIG9yaWdpbiBpcyBhdCAoNjQsNjQpICovCiAJeCArPSA2NDsKIAl5ICs9IDY0
OwogCi0JQlVHX09OKHggPD0gMCk7Ci0JQlVHX09OKHkgPD0gMCk7Ci0JQlVHX09OKHggJiB+MHhm
ZmZmKTsKLQlCVUdfT04oeSAmIH4weGZmZmYpOworCW1nYWcyMDBfbW92ZV9jdXJzb3IobWRldiwg
eCwgeSk7CiAKLQlXUkVHOChNR0FfQ1VSUE9TWEwsIHggJiAweGZmKTsKLQlXUkVHOChNR0FfQ1VS
UE9TWEgsICh4Pj44KSAmIDB4ZmYpOwotCi0JV1JFRzgoTUdBX0NVUlBPU1lMLCB5ICYgMHhmZik7
Ci0JV1JFRzgoTUdBX0NVUlBPU1lILCAoeT4+OCkgJiAweGZmKTsKIAlyZXR1cm4gMDsKIH0KLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
