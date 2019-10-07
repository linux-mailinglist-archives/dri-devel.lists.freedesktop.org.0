Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60CCE059
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D36F6E56D;
	Mon,  7 Oct 2019 11:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F0C6E563
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:26:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ96o122326;
 Mon, 7 Oct 2019 06:26:09 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97BQ9pW122338
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 06:26:09 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 06:26:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 06:26:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97BQ893059149;
 Mon, 7 Oct 2019 06:26:08 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v3 7/8] drm/omap: add omap_gem_validate_flags()
Date: Mon, 7 Oct 2019 13:25:54 +0200
Message-ID: <20191007112555.25278-8-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007112555.25278-1-jjhiblot@ti.com>
References: <20191007112555.25278-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570447569;
 bh=pycRfH8VPF2OS9FSA4yi7t+1mn2Akj4iv8sbt8eEBUQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=crieUR4VTMHOBzx7HS/kyReSWohncGqXpJX3+C7qEvqEM2+PxvYwH8ffXaGYwp5HT
 NJ5Iykb9zdY+8c1wHhB9yVEERqCJIdMTq4K7bsN/aCwIaRtpOaAQ+w6/QADlN3w/+4
 JMtvYtRAIDcM9a0qwnQRWoL9ZYFsNQfhbvaaAUI0=
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
Cc: jsarha@ti.com, dri-devel@lists.freedesktop.org
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
bS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCAyN2UwYTJmODUw
OGEuLmU1MThkOTNjYTZkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCkBAIC0xMTMz
LDYgKzExMzMsMzggQEAgdm9pZCBvbWFwX2dlbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9v
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
KmRldiwKIAkJdW5pb24gb21hcF9nZW1fc2l6ZSBnc2l6ZSwgdTMyIGZsYWdzKQpAQCAtMTE0NCwx
MyArMTE3NiwxMSBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9tYXBfZ2VtX25ldyhzdHJ1Y3Qg
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
