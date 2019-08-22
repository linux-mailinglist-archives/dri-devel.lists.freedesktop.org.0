Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7AE98FF3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 11:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70626EAEC;
	Thu, 22 Aug 2019 09:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21426EAEC
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 09:47:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A7B77FDCD;
 Thu, 22 Aug 2019 09:47:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9338F6B49C;
 Thu, 22 Aug 2019 09:46:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CFB4C16E32; Thu, 22 Aug 2019 11:46:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/virtio: add plane check
Date: Thu, 22 Aug 2019 11:46:57 +0200
Message-Id: <20190822094657.27483-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 22 Aug 2019 09:47:01 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKCkKdG8gc2FuaXR5IGNoZWNr
IHRoZSBwbGFuZSBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEBy
ZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jIHwg
MTcgKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYwppbmRleCBh
NDkyYWMzZjRhN2UuLmZlNWVmYjJkZTkwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X3BsYW5lLmMKQEAgLTg0LDcgKzg0LDIyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5l
X2Z1bmNzIHZpcnRpb19ncHVfcGxhbmVfZnVuY3MgPSB7CiBzdGF0aWMgaW50IHZpcnRpb19ncHVf
cGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJCQkgc3RydWN0
IGRybV9wbGFuZV9zdGF0ZSAqc3RhdGUpCiB7Ci0JcmV0dXJuIDA7CisJYm9vbCBpc19jdXJzb3Ig
PSBwbGFuZS0+dHlwZSA9PSBEUk1fUExBTkVfVFlQRV9DVVJTT1I7CisJc3RydWN0IGRybV9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlOworCWludCByZXQ7CisKKwlpZiAoIXN0YXRlLT5mYiB8fCAhc3Rh
dGUtPmNydGMpCisJCXJldHVybiAwOworCisJY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X2Ny
dGNfc3RhdGUoc3RhdGUtPnN0YXRlLCBzdGF0ZS0+Y3J0Yyk7CisJaWYgKElTX0VSUihjcnRjX3N0
YXRlKSkKKyAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjcnRjX3N0YXRlKTsKKworCXJl
dCA9IGRybV9hdG9taWNfaGVscGVyX2NoZWNrX3BsYW5lX3N0YXRlKHN0YXRlLCBjcnRjX3N0YXRl
LAorCQkJCQkJICBEUk1fUExBTkVfSEVMUEVSX05PX1NDQUxJTkcsCisJCQkJCQkgIERSTV9QTEFO
RV9IRUxQRVJfTk9fU0NBTElORywKKwkJCQkJCSAgaXNfY3Vyc29yLCB0cnVlKTsKKwlyZXR1cm4g
cmV0OwogfQogCiBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3ByaW1hcnlfcGxhbmVfdXBkYXRlKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
