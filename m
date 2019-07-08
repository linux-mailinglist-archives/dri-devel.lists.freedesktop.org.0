Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35CE61D38
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D3789C89;
	Mon,  8 Jul 2019 10:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136A289C82
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:45:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68Aja1Q045636;
 Mon, 8 Jul 2019 05:45:36 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AjaD2031749
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:45:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:45:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:45:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AjYw3052658;
 Mon, 8 Jul 2019 05:45:35 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 7/8] drm/omap: add omap_gem_validate_flags()
Date: Mon, 8 Jul 2019 12:45:19 +0200
Message-ID: <20190708104520.24217-8-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708104520.24217-1-jjhiblot@ti.com>
References: <20190708104520.24217-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562582736;
 bh=6R45qTVqa1K0ls6ScU6rgzv4DoVIhiFBUKSk72AUW5c=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ImhuiSW1r/m8KeLnXOWXeZWZ4CBGK1WfUrCXt2PRUwFoYG0e1FzK7+tuA6wZ4MQ4D
 PC1SUVpnb1cGbR3xCg87+xh72k377+uzt6HSfJbehPOHmJTQsuQ60HIUqY3dItvEVK
 g1tMjj8l75C4SqJ6ss8GOYmJWQlC93Y4npE+7G1A=
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
Cc: jsarha@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFkZCBhIGhlbHBl
ciBmdW5jdGlvbiBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncygpIHdoaWNoIHZhbGlkYXRlcyB0aGUK
b21hcF9ibyBmbGFncyBwYXNzZWQgZnJvbSB0aGUgdXNlcnNwYWNlLgoKQWxzbyBkcm9wIHRoZSBk
ZXZfZXJyKCkgbWVzc2FnZSwgYXMgdGhlIHVzZXJzcGFjZSBjYW4gY2F1c2UgdGhhdCBhdAp3aWxs
LgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgNDAgKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dl
bS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCA1YzRjZGY2MTgz
NDcuLmNhZmE5ZDBiZjNjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCkBAIC0xMTMx
LDYgKzExMzEsMzggQEAgdm9pZCBvbWFwX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaikKIAlrZnJlZShvbWFwX29iaik7CiB9CiAKK3N0YXRpYyBib29sIG9tYXBfZ2Vt
X3ZhbGlkYXRlX2ZsYWdzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHUzMiBmbGFncykKK3sKKwlz
dHJ1Y3Qgb21hcF9kcm1fcHJpdmF0ZSAqcHJpdiA9IGRldi0+ZGV2X3ByaXZhdGU7CisKKwlzd2l0
Y2ggKGZsYWdzICYgT01BUF9CT19DQUNIRV9NQVNLKSB7CisJY2FzZSBPTUFQX0JPX0NBQ0hFRDoK
KwljYXNlIE9NQVBfQk9fV0M6CisJY2FzZSBPTUFQX0JPX0NBQ0hFX01BU0s6CisJCWJyZWFrOwor
CisJZGVmYXVsdDoKKwkJcmV0dXJuIGZhbHNlOworCX0KKworCWlmIChmbGFncyAmIE9NQVBfQk9f
VElMRURfTUFTSykgeworCQlpZiAoIXByaXYtPnVzZXJnYXJ0KQorCQkJcmV0dXJuIGZhbHNlOwor
CisJCXN3aXRjaCAoZmxhZ3MgJiBPTUFQX0JPX1RJTEVEX01BU0spIHsKKwkJY2FzZSBPTUFQX0JP
X1RJTEVEXzg6CisJCWNhc2UgT01BUF9CT19USUxFRF8xNjoKKwkJY2FzZSBPTUFQX0JPX1RJTEVE
XzMyOgorCQkJYnJlYWs7CisKKwkJZGVmYXVsdDoKKwkJCXJldHVybiBmYWxzZTsKKwkJfQorCX0K
KworCXJldHVybiB0cnVlOworfQorCiAvKiBHRU0gYnVmZmVyIG9iamVjdCBjb25zdHJ1Y3RvciAq
Lwogc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKIAkJdW5pb24gb21hcF9nZW1fc2l6ZSBnc2l6ZSwgdTMyIGZsYWdzKQpAQCAtMTE0Miwx
MyArMTE3NCwxMSBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9tYXBfZ2VtX25ldyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogCXNpemVfdCBzaXplOwogCWludCByZXQ7CiAKKwlpZiAoIW9tYXBf
Z2VtX3ZhbGlkYXRlX2ZsYWdzKGRldiwgZmxhZ3MpKQorCQlyZXR1cm4gTlVMTDsKKwogCS8qIFZh
bGlkYXRlIHRoZSBmbGFncyBhbmQgY29tcHV0ZSB0aGUgbWVtb3J5IGFuZCBjYWNoZSBmbGFncy4g
Ki8KIAlpZiAoZmxhZ3MgJiBPTUFQX0JPX1RJTEVEX01BU0spIHsKLQkJaWYgKCFwcml2LT51c2Vy
Z2FydCkgewotCQkJZGV2X2VycihkZXYtPmRldiwgIlRpbGVkIGJ1ZmZlcnMgcmVxdWlyZSBETU1c
biIpOwotCQkJcmV0dXJuIE5VTEw7Ci0JCX0KLQogCQkvKgogCQkgKiBUaWxlZCBidWZmZXJzIGFy
ZSBhbHdheXMgc2htZW0gcGFnZWQgYmFja2VkLiBXaGVuIHRoZXkgYXJlCiAJCSAqIHNjYW5uZWQg
b3V0LCB0aGV5IGFyZSByZW1hcHBlZCBpbnRvIERNTS9USUxFUi4KLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
