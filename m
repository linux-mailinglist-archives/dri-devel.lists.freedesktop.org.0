Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54A3FB472
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7206ED6F;
	Wed, 13 Nov 2019 15:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9476ED6F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:59:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20E18AEB3;
 Wed, 13 Nov 2019 15:59:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 1/2] drm/ast: Replace drm_get_pci_device() and drm_put_dev()
Date: Wed, 13 Nov 2019 16:58:56 +0100
Message-Id: <20191113155857.9507-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113155857.9507-1-tzimmermann@suse.de>
References: <20191113155857.9507-1-tzimmermann@suse.de>
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

Qm90aCBmdW5jdGlvbnMgYXJlIGRlcHJlY2F0ZWQuIE9wZW4tY29kZSB0aGVtIHRoZW0gaW4gcHJl
cGFyYXRpb24Kb2YgcmVtb3Zpbmcgc3RydWN0IGRybV9kcml2ZXIue2xvYWQsdW5sb2FkfS4KClNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9kcnYuYwppbmRleCBkNzYzZGE2ZjA4MzQuLjc4YzkwYTNjOTAzYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FzdC9hc3RfZHJ2LmMKQEAgLTg2LDkgKzg2LDM1IEBAIHN0YXRpYyB2b2lkIGFzdF9r
aWNrX291dF9maXJtd2FyZV9mYihzdHJ1Y3QgcGNpX2RldiAqcGRldikKIAogc3RhdGljIGludCBh
c3RfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2Rldmlj
ZV9pZCAqZW50KQogeworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXY7CisJaW50IHJldDsKKwogCWFz
dF9raWNrX291dF9maXJtd2FyZV9mYihwZGV2KTsKIAotCXJldHVybiBkcm1fZ2V0X3BjaV9kZXYo
cGRldiwgZW50LCAmZHJpdmVyKTsKKwlyZXQgPSBwY2lfZW5hYmxlX2RldmljZShwZGV2KTsKKwlp
ZiAocmV0KQorCQlyZXR1cm4gcmV0OworCisJZGV2ID0gZHJtX2Rldl9hbGxvYygmZHJpdmVyLCAm
cGRldi0+ZGV2KTsKKwlpZiAoSVNfRVJSKGRldikpIHsKKwkJcmV0ID0gUFRSX0VSUihkZXYpOwor
CQlnb3RvIGVycl9wY2lfZGlzYWJsZV9kZXZpY2U7CisJfQorCisJZGV2LT5wZGV2ID0gcGRldjsK
KwlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2KTsKKworCXJldCA9IGRybV9kZXZfcmVnaXN0ZXIo
ZGV2LCBlbnQtPmRyaXZlcl9kYXRhKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9kcm1fZGV2X3B1
dDsKKworCXJldHVybiAwOworCitlcnJfZHJtX2Rldl9wdXQ6CisJZHJtX2Rldl9wdXQoZGV2KTsK
K2Vycl9wY2lfZGlzYWJsZV9kZXZpY2U6CisJcGNpX2Rpc2FibGVfZGV2aWNlKHBkZXYpOworCXJl
dHVybiByZXQ7CiB9CiAKIHN0YXRpYyB2b2lkCkBAIC05Niw3ICsxMjIsOCBAQCBhc3RfcGNpX3Jl
bW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0g
cGNpX2dldF9kcnZkYXRhKHBkZXYpOwogCi0JZHJtX3B1dF9kZXYoZGV2KTsKKwlkcm1fZGV2X3Vu
cmVnaXN0ZXIoZGV2KTsKKwlkcm1fZGV2X3B1dChkZXYpOwogfQogCiBzdGF0aWMgaW50IGFzdF9k
cm1fZnJlZXplKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCi0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
