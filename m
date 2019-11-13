Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6CDFB473
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 16:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973F26ED75;
	Wed, 13 Nov 2019 15:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5DBE898B6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:59:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D96FAED6;
 Wed, 13 Nov 2019 15:59:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, kraxel@redhat.com, sam@ravnborg.org
Subject: [PATCH 2/2] drm/ast: Call struct drm_driver.{load,
 unload} before registering device
Date: Wed, 13 Nov 2019 16:58:57 +0100
Message-Id: <20191113155857.9507-3-tzimmermann@suse.de>
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

Qm90aCBjYWxsYmFja3MgYXJlIGRlcHJlY2F0ZWQuIFJlbW92ZSB0aGVtIGFuZCBjYWxsIGZ1bmN0
aW9ucyBleHBsaWNpdGx5LgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMgfCAxMyAr
KysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMKaW5kZXggNzhjOTBhM2M5MDNiLi45ZGEyNjc1MGEyMmQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hc3QvYXN0X2Rydi5jCkBAIC0xMDQsMTcgKzEwNCwyNCBAQCBzdGF0aWMgaW50IGFz
dF9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNl
X2lkICplbnQpCiAJZGV2LT5wZGV2ID0gcGRldjsKIAlwY2lfc2V0X2RydmRhdGEocGRldiwgZGV2
KTsKIAotCXJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZGV2LCBlbnQtPmRyaXZlcl9kYXRhKTsKKwly
ZXQgPSBhc3RfZHJpdmVyX2xvYWQoZGV2LCBlbnQtPmRyaXZlcl9kYXRhKTsKIAlpZiAocmV0KQog
CQlnb3RvIGVycl9kcm1fZGV2X3B1dDsKIAorCXJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZGV2LCBl
bnQtPmRyaXZlcl9kYXRhKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9hc3RfZHJpdmVyX3VubG9h
ZDsKKwogCXJldHVybiAwOwogCitlcnJfYXN0X2RyaXZlcl91bmxvYWQ6CisJYXN0X2RyaXZlcl91
bmxvYWQoZGV2KTsKIGVycl9kcm1fZGV2X3B1dDoKIAlkcm1fZGV2X3B1dChkZXYpOwogZXJyX3Bj
aV9kaXNhYmxlX2RldmljZToKIAlwY2lfZGlzYWJsZV9kZXZpY2UocGRldik7CiAJcmV0dXJuIHJl
dDsKKwogfQogCiBzdGF0aWMgdm9pZApAQCAtMTIzLDYgKzEzMCw3IEBAIGFzdF9wY2lfcmVtb3Zl
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0
X2RydmRhdGEocGRldik7CiAKIAlkcm1fZGV2X3VucmVnaXN0ZXIoZGV2KTsKKwlhc3RfZHJpdmVy
X3VubG9hZChkZXYpOwogCWRybV9kZXZfcHV0KGRldik7CiB9CiAKQEAgLTIyOCw5ICsyMzYsNiBA
QCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewogCQkJICAgRFJJVkVSX0dFTSB8
CiAJCQkgICBEUklWRVJfTU9ERVNFVCwKIAotCS5sb2FkID0gYXN0X2RyaXZlcl9sb2FkLAotCS51
bmxvYWQgPSBhc3RfZHJpdmVyX3VubG9hZCwKLQogCS5mb3BzID0gJmFzdF9mb3BzLAogCS5uYW1l
ID0gRFJJVkVSX05BTUUsCiAJLmRlc2MgPSBEUklWRVJfREVTQywKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
