Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898FED2894
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:00:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C506EB11;
	Thu, 10 Oct 2019 12:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0089686
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:00:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0G4C041475;
 Thu, 10 Oct 2019 07:00:16 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9AC0GQX059314
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Oct 2019 07:00:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 07:00:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 07:00:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0EA8121926;
 Thu, 10 Oct 2019 07:00:15 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 7/8] drm/omap: add omap_gem_validate_flags()
Date: Thu, 10 Oct 2019 13:59:59 +0200
Message-ID: <20191010120000.1421-8-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010120000.1421-1-jjhiblot@ti.com>
References: <20191010120000.1421-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570708816;
 bh=hgiOK3v3py7fj6u+5PXs9D8dCCW3BjQ3YCS1fnNsvV8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=pimc5pGk7rQS1u2C217P/RpLldR9bHM/UzLV2kLPby5a46J07W4cyXttQsLRcru7c
 5/buruJRn46FTyxVdBkjSHse8mpuEvjH9F2oBLpxirUw5sxLmuohFUXVi/0FVeJeL0
 iuG0KErGMFlxbvCJvkqknRZMXDD0GFX+2l4Sr+24=
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
Cc: jjhiblot@ti.com, jsarha@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFkZCBhIGhlbHBl
ciBmdW5jdGlvbiBvbWFwX2dlbV92YWxpZGF0ZV9mbGFncygpIHdoaWNoIHZhbGlkYXRlcyB0aGUK
b21hcF9ibyBmbGFncyBwYXNzZWQgZnJvbSB0aGUgdXNlcnNwYWNlLgoKQWxzbyBkcm9wIHRoZSBk
ZXZfZXJyKCkgbWVzc2FnZSwgYXMgdGhlIHVzZXJzcGFjZSBjYW4gY2F1c2UgdGhhdCBhdAp3aWxs
LgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4K
UmV2aWV3ZWQtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgNDAgKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCAyN2UwYTJmODUwOGEuLmU1
MThkOTNjYTZkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCkBAIC0xMTMzLDYgKzEx
MzMsMzggQEAgdm9pZCBvbWFwX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikKIAlrZnJlZShvbWFwX29iaik7CiB9CiAKK3N0YXRpYyBib29sIG9tYXBfZ2VtX3ZhbGlk
YXRlX2ZsYWdzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHUzMiBmbGFncykKK3sKKwlzdHJ1Y3Qg
b21hcF9kcm1fcHJpdmF0ZSAqcHJpdiA9IGRldi0+ZGV2X3ByaXZhdGU7CisKKwlzd2l0Y2ggKGZs
YWdzICYgT01BUF9CT19DQUNIRV9NQVNLKSB7CisJY2FzZSBPTUFQX0JPX0NBQ0hFRDoKKwljYXNl
IE9NQVBfQk9fV0M6CisJY2FzZSBPTUFQX0JPX0NBQ0hFX01BU0s6CisJCWJyZWFrOworCisJZGVm
YXVsdDoKKwkJcmV0dXJuIGZhbHNlOworCX0KKworCWlmIChmbGFncyAmIE9NQVBfQk9fVElMRURf
TUFTSykgeworCQlpZiAoIXByaXYtPnVzZXJnYXJ0KQorCQkJcmV0dXJuIGZhbHNlOworCisJCXN3
aXRjaCAoZmxhZ3MgJiBPTUFQX0JPX1RJTEVEX01BU0spIHsKKwkJY2FzZSBPTUFQX0JPX1RJTEVE
Xzg6CisJCWNhc2UgT01BUF9CT19USUxFRF8xNjoKKwkJY2FzZSBPTUFQX0JPX1RJTEVEXzMyOgor
CQkJYnJlYWs7CisKKwkJZGVmYXVsdDoKKwkJCXJldHVybiBmYWxzZTsKKwkJfQorCX0KKworCXJl
dHVybiB0cnVlOworfQorCiAvKiBHRU0gYnVmZmVyIG9iamVjdCBjb25zdHJ1Y3RvciAqLwogc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwK
IAkJdW5pb24gb21hcF9nZW1fc2l6ZSBnc2l6ZSwgdTMyIGZsYWdzKQpAQCAtMTE0NCwxMyArMTE3
NiwxMSBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9tYXBfZ2VtX25ldyhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCXNpemVfdCBzaXplOwogCWludCByZXQ7CiAKKwlpZiAoIW9tYXBfZ2VtX3Zh
bGlkYXRlX2ZsYWdzKGRldiwgZmxhZ3MpKQorCQlyZXR1cm4gTlVMTDsKKwogCS8qIFZhbGlkYXRl
IHRoZSBmbGFncyBhbmQgY29tcHV0ZSB0aGUgbWVtb3J5IGFuZCBjYWNoZSBmbGFncy4gKi8KIAlp
ZiAoZmxhZ3MgJiBPTUFQX0JPX1RJTEVEX01BU0spIHsKLQkJaWYgKCFwcml2LT51c2VyZ2FydCkg
ewotCQkJZGV2X2VycihkZXYtPmRldiwgIlRpbGVkIGJ1ZmZlcnMgcmVxdWlyZSBETU1cbiIpOwot
CQkJcmV0dXJuIE5VTEw7Ci0JCX0KLQogCQkvKgogCQkgKiBUaWxlZCBidWZmZXJzIGFyZSBhbHdh
eXMgc2htZW0gcGFnZWQgYmFja2VkLiBXaGVuIHRoZXkgYXJlCiAJCSAqIHNjYW5uZWQgb3V0LCB0
aGV5IGFyZSByZW1hcHBlZCBpbnRvIERNTS9USUxFUi4KLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
