Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2286373
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 15:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E1A883C5;
	Thu,  8 Aug 2019 13:44:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D196E854;
 Thu,  8 Aug 2019 13:44:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A80FC315C01C;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CB3660BE1;
 Thu,  8 Aug 2019 13:44:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E77EE9CAC; Thu,  8 Aug 2019 15:44:20 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 15/17] drm/qxl: switch qxl to drm_gem_object_funcs->mmap
 codepath
Date: Thu,  8 Aug 2019 15:44:15 +0200
Message-Id: <20190808134417.10610-16-kraxel@redhat.com>
In-Reply-To: <20190808134417.10610-1-kraxel@redhat.com>
References: <20190808134417.10610-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 08 Aug 2019 13:44:24 +0000 (UTC)
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
Cc: tzimmermann@suse.de, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Li4uIHVzaW5nIHRoZSB1c2UgZHJtX2dlbV90dG1fbW1hcCgpIGhlbHBlciBmdW5jdGlvbi4KClNp
Z25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oICAgIHwgIDEgLQogZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfZHJ2LmMgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgfCAg
MSArCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyAgICB8IDE2IC0tLS0tLS0tLS0tLS0t
LS0KIDQgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9xeGwvcXhsX2Rydi5oCmluZGV4IDgyZWZiZTc2MDYyYS4uZGMzNjQ3OWE1NGYyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
cXhsL3F4bF9kcnYuaApAQCAtMzUyLDcgKzM1Miw2IEBAIGludCBxeGxfbW9kZV9kdW1iX2NyZWF0
ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwKIC8qIHF4bCB0dG0gKi8KIGludCBxeGxfdHRt
X2luaXQoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYpOwogdm9pZCBxeGxfdHRtX2Zpbmkoc3RydWN0
IHF4bF9kZXZpY2UgKnFkZXYpOwotaW50IHF4bF9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7CiAKIC8qIHF4bCBpbWFnZSAqLwogCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X2Rydi5jCmluZGV4IDM4NDY3NDc4YzdiMi4uMmZiMTY0MWM4MTdlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9k
cnYuYwpAQCAtMTM5LDcgKzEzOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRp
b25zIHF4bF9mb3BzID0gewogCS51bmxvY2tlZF9pb2N0bCA9IGRybV9pb2N0bCwKIAkucG9sbCA9
IGRybV9wb2xsLAogCS5yZWFkID0gZHJtX3JlYWQsCi0JLm1tYXAgPSBxeGxfbW1hcCwKKwkubW1h
cCA9IGRybV9nZW1fbW1hcCwKIH07CiAKIHN0YXRpYyBpbnQgcXhsX2RybV9mcmVlemUoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29i
amVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKaW5kZXggMjlhYWI3YjE0
NTEzLi41YzUwMzgyOWM1ODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29i
amVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCkBAIC04Niw2ICs4
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgcXhsX29iamVj
dF9mdW5jcyA9IHsKIAkuZ2V0X3NnX3RhYmxlID0gcXhsX2dlbV9wcmltZV9nZXRfc2dfdGFibGUs
CiAJLnZtYXAgPSBxeGxfZ2VtX3ByaW1lX3ZtYXAsCiAJLnZ1bm1hcCA9IHF4bF9nZW1fcHJpbWVf
dnVubWFwLAorCS5tbWFwID0gZHJtX2dlbV90dG1fbW1hcCwKIH07CiAKIGludCBxeGxfYm9fY3Jl
YXRlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwppbmRleCA0MWVk
YmRlMGUzN2UuLmRiYWVkMGU2N2MyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9x
eGxfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKQEAgLTQ4LDIyICs0
OCw2IEBAIHN0YXRpYyBzdHJ1Y3QgcXhsX2RldmljZSAqcXhsX2dldF9xZGV2KHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2KQogCXJldHVybiBxZGV2OwogfQogCi1pbnQgcXhsX21tYXAoc3RydWN0
IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQotewotCXN0cnVjdCBkcm1f
ZmlsZSAqZmlsZV9wcml2ID0gZmlscC0+cHJpdmF0ZV9kYXRhOwotCXN0cnVjdCBxeGxfZGV2aWNl
ICpxZGV2ID0gZmlsZV9wcml2LT5taW5vci0+ZGV2LT5kZXZfcHJpdmF0ZTsKLQotCWlmIChxZGV2
ID09IE5VTEwpIHsKLQkJRFJNX0VSUk9SKAotCQkgImZpbHAtPnByaXZhdGVfZGF0YS0+bWlub3It
PmRldi0+ZGV2X3ByaXZhdGUgPT0gTlVMTFxuIik7Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KLQlE
Uk1fREVCVUdfRFJJVkVSKCJmaWxwLT5wcml2YXRlX2RhdGEgPSAweCVwLCB2bWEtPnZtX3Bnb2Zm
ID0gJWx4XG4iLAotCQkgIGZpbHAtPnByaXZhdGVfZGF0YSwgdm1hLT52bV9wZ29mZik7Ci0KLQly
ZXR1cm4gdHRtX2JvX21tYXAoZmlscCwgdm1hLCAmcWRldi0+bW1hbi5iZGV2KTsKLX0KLQogc3Rh
dGljIGludCBxeGxfaW52YWxpZGF0ZV9jYWNoZXMoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYs
IHVpbnQzMl90IGZsYWdzKQogewogCXJldHVybiAwOwotLSAKMi4xOC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
