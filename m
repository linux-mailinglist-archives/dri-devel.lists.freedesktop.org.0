Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC361D37
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB99289C82;
	Mon,  8 Jul 2019 10:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D02D89C6E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:45:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AjYHQ005789;
 Mon, 8 Jul 2019 05:45:34 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AjYQ1089707
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:45:34 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:45:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:45:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AjXYV069997;
 Mon, 8 Jul 2019 05:45:34 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/8] drm/omap: cleanup OMAP_BO_SCANOUT use
Date: Mon, 8 Jul 2019 12:45:18 +0200
Message-ID: <20190708104520.24217-7-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708104520.24217-1-jjhiblot@ti.com>
References: <20190708104520.24217-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562582734;
 bh=SKYZVWcWwJ5ZLLgc5LOACp4zuj8TdGUjmf+/iSNIXL4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MgWtCpiGe0Ff1JBev6hWBr3jXgSH++mvGhP4zZbUf8pLNFMiYcFvvrNBBRxblGWVP
 X+IIfvaTdUOoJ/VPqpkq7zoCzsDt9RaevKzwpEEUyy6MxLH35iHvOmxmZ57j1qk078
 AZMfgiyTy11ykYZ3z0dmEYzNaoyiSBKaCMaBY73Y=
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

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCm9tYXBfZ2VtX25l
dygpIGhhcyBhIGNvbW1lbnQgYWJvdXQgT01BUF9CT19TQ0FOT1VUIHdoaWNoIGRvZXMgbm90IG1h
a2UKc2Vuc2UuIEFsc28sIGZvciB0aGUgVElMRVIgY2FzZSwgd2UgZHJvcCBPTUFQX0JPX1NDQU5P
VVQgZmxhZyBmb3Igc29tZQpyZWFzb24uCgpJdCdzIG5vdCBjbGVhciB3aGF0IHRoZSBvcmlnaW5h
bCBwdXJwb3NlIG9mIE9NQVBfQk9fU0NBTk9VVCBpcywgYnV0CnByZXN1bWluZyBpdCBtZWFucyAi
c2Nhbm91dCBidWZmZXIsIHNvbWV0aGluZyB0aGF0IGNhbiBiZSBjb25zdW1lZCBieQpEU1MiLCB0
aGlzIHBhdGNoIGNsZWFucyB1cCB0aGUgYWJvdmUgaXNzdWVzLgoKU2lnbmVkLW9mZi1ieTogVG9t
aSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
b21hcGRybS9vbWFwX2dlbS5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXgg
MDdkYmEzMDBlYzA3Li41YzRjZGY2MTgzNDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9v
bWFwZHJtL29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0u
YwpAQCAtMTE1Myw3ICsxMTUzLDYgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9u
ZXcoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJICogVGlsZWQgYnVmZmVycyBhcmUgYWx3YXlz
IHNobWVtIHBhZ2VkIGJhY2tlZC4gV2hlbiB0aGV5IGFyZQogCQkgKiBzY2FubmVkIG91dCwgdGhl
eSBhcmUgcmVtYXBwZWQgaW50byBETU0vVElMRVIuCiAJCSAqLwotCQlmbGFncyAmPSB+T01BUF9C
T19TQ0FOT1VUOwogCQlmbGFncyB8PSBPTUFQX0JPX01FTV9TSE1FTTsKIAogCQkvKgpAQCAtMTE2
NCw5ICsxMTYzLDggQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvbWFwX2dlbV9uZXcoc3RydWN0
IGRybV9kZXZpY2UgKmRldiwKIAkJZmxhZ3MgfD0gdGlsZXJfZ2V0X2NwdV9jYWNoZV9mbGFncygp
OwogCX0gZWxzZSBpZiAoKGZsYWdzICYgT01BUF9CT19TQ0FOT1VUKSAmJiAhcHJpdi0+aGFzX2Rt
bSkgewogCQkvKgotCQkgKiBPTUFQX0JPX1NDQU5PVVQgaGludHMgdGhhdCB0aGUgYnVmZmVyIGRv
ZXNuJ3QgbmVlZCB0byBiZQotCQkgKiB0aWxlZC4gSG93ZXZlciwgdG8gbG93ZXIgdGhlIHByZXNz
dXJlIG9uIG1lbW9yeSBhbGxvY2F0aW9uLAotCQkgKiB1c2UgY29udGlndW91cyBtZW1vcnkgb25s
eSBpZiBubyBUSUxFUiBpcyBhdmFpbGFibGUuCisJCSAqIElmIHdlIGRvbid0IGhhdmUgRE1NLCB3
ZSBtdXN0IGFsbG9jYXRlIHNjYW5vdXQgYnVmZmVycworCQkgKiBmcm9tIGNvbnRpZ3VvdXMgRE1B
IG1lbW9yeS4KIAkJICovCiAJCWZsYWdzIHw9IE9NQVBfQk9fTUVNX0RNQV9BUEk7CiAJfSBlbHNl
IGlmICghKGZsYWdzICYgT01BUF9CT19NRU1fRE1BQlVGKSkgewotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
