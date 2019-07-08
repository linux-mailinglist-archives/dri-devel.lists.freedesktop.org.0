Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EF61D33
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 12:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2B689C68;
	Mon,  8 Jul 2019 10:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352D89C68
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 10:45:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68AjUVA050868;
 Mon, 8 Jul 2019 05:45:30 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68AjT1W030529
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Jul 2019 05:45:29 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:45:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:45:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68AjS64094793;
 Mon, 8 Jul 2019 05:45:29 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 2/8] drm/omap: add omap_gem_unpin_locked()
Date: Mon, 8 Jul 2019 12:45:14 +0200
Message-ID: <20190708104520.24217-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708104520.24217-1-jjhiblot@ti.com>
References: <20190708104520.24217-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562582730;
 bh=BMALSdC3eHlLBbEzztt6cvZKxUhSacOKg+qlcp7idFc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=O4AfInWAcTdAqV3H0atZIMCmmq8eHg13E4oTuUtFfZWDeSgwFI+svJiy07yBxsOfO
 AGlAAbUHu6UFCGDWiIheY7vOZASoCR/1+b49dAb964ne8AhJ4q0h09LUeoin0M5jRw
 HIhEXyXAVmjQuSeicyXb1S/SuOiCp5Cxe7ybXqEs=
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

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFkZCBvbWFwX2dl
bV91bnBpbl9sb2NrZWQoKSB3aGljaCBpcyBhIHZlcnNpb24gb2Ygb21hcF9nZW1fdW5waW4oKSB0
aGF0CmV4cGVjdHMgdGhlIGNhbGxlciB0byBob2xkIHRoZSBvbWFwX29iaiBsb2NrLgoKU2lnbmVk
LW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgMjQgKysrKysrKysrKysrKysrKystLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIGIvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwppbmRleCAwYjZlZWYxMjBjYzkuLjMwNzFlODE1ZGE3
MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCkBAIC04MzIsMjAgKzgzMiwxNiBAQCBp
bnQgb21hcF9nZW1fcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBkbWFfYWRkcl90ICpk
bWFfYWRkcikKIH0KIAogLyoqCi0gKiBvbWFwX2dlbV91bnBpbigpIC0gVW5waW4gYSBHRU0gb2Jq
ZWN0IGZyb20gbWVtb3J5CisgKiBvbWFwX2dlbV91bnBpbl9sb2NrZWQoKSAtIFVucGluIGEgR0VN
IG9iamVjdCBmcm9tIG1lbW9yeQogICogQG9iajogdGhlIEdFTSBvYmplY3QKICAqCi0gKiBVbnBp
biB0aGUgZ2l2ZW4gR0VNIG9iamVjdCBwcmV2aW91c2x5IHBpbm5lZCB3aXRoIG9tYXBfZ2VtX3Bp
bigpLiBQaW5zIGFyZQotICogcmVmZXJlbmNlLWNvdW50ZWQsIHRoZSBhY3R1YWx5IHVucGluIHdp
bGwgb25seSBiZSBwZXJmb3JtZWQgd2hlbiB0aGUgbnVtYmVyCi0gKiBvZiBjYWxscyB0byB0aGlz
IGZ1bmN0aW9uIG1hdGNoZXMgdGhlIG51bWJlciBvZiBjYWxscyB0byBvbWFwX2dlbV9waW4oKS4K
KyAqIG9tYXBfZ2VtX3VucGluKCkgd2l0aG91dCBsb2NraW5nLgogICovCi12b2lkIG9tYXBfZ2Vt
X3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQorc3RhdGljIHZvaWQgb21hcF9nZW1f
dW5waW5fbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogewogCXN0cnVjdCBvbWFw
X2dlbV9vYmplY3QgKm9tYXBfb2JqID0gdG9fb21hcF9ibyhvYmopOwogCWludCByZXQ7CiAKLQlt
dXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7Ci0KIAlpZiAocmVmY291bnRfZGVjX2FuZF90ZXN0
KCZvbWFwX29iai0+ZG1hX2FkZHJfY250KSkgewogCQlyZXQgPSB0aWxlcl91bnBpbihvbWFwX29i
ai0+YmxvY2spOwogCQlpZiAocmV0KSB7CkBAIC04NjIsNiArODU4LDIwIEBAIHZvaWQgb21hcF9n
ZW1fdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJfQogfQogCisvKioKKyAqIG9t
YXBfZ2VtX3VucGluKCkgLSBVbnBpbiBhIEdFTSBvYmplY3QgZnJvbSBtZW1vcnkKKyAqIEBvYmo6
IHRoZSBHRU0gb2JqZWN0CisgKgorICogVW5waW4gdGhlIGdpdmVuIEdFTSBvYmplY3QgcHJldmlv
dXNseSBwaW5uZWQgd2l0aCBvbWFwX2dlbV9waW4oKS4gUGlucyBhcmUKKyAqIHJlZmVyZW5jZS1j
b3VudGVkLCB0aGUgYWN0dWFsIHVucGluIHdpbGwgb25seSBiZSBwZXJmb3JtZWQgd2hlbiB0aGUg
bnVtYmVyCisgKiBvZiBjYWxscyB0byB0aGlzIGZ1bmN0aW9uIG1hdGNoZXMgdGhlIG51bWJlciBv
ZiBjYWxscyB0byBvbWFwX2dlbV9waW4oKS4KKyAqLwordm9pZCBvbWFwX2dlbV91bnBpbihzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3sKKwlzdHJ1Y3Qgb21hcF9nZW1fb2JqZWN0ICpvbWFw
X29iaiA9IHRvX29tYXBfYm8ob2JqKTsKKworCW11dGV4X2xvY2soJm9tYXBfb2JqLT5sb2NrKTsK
KwlvbWFwX2dlbV91bnBpbl9sb2NrZWQob2JqKTsKIAltdXRleF91bmxvY2soJm9tYXBfb2JqLT5s
b2NrKTsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
