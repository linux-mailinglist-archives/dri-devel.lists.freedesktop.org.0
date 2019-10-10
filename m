Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E1D288D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 14:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980886EB0B;
	Thu, 10 Oct 2019 12:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEE16EB0B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 12:00:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0ASx043470;
 Thu, 10 Oct 2019 07:00:10 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AC0AYq016934;
 Thu, 10 Oct 2019 07:00:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 10
 Oct 2019 07:00:06 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 10 Oct 2019 07:00:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9AC08ij121674;
 Thu, 10 Oct 2019 07:00:09 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v5 2/8] drm/omap: add omap_gem_unpin_locked()
Date: Thu, 10 Oct 2019 13:59:54 +0200
Message-ID: <20191010120000.1421-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191010120000.1421-1-jjhiblot@ti.com>
References: <20191010120000.1421-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570708810;
 bh=jURwAB1QUaF+ZHV6PUO9XNEuGkNY8qCFsc3a86GgHpk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=yxPr4tvfzc8NfGW4k1/XcSIKBIijhvPaYLWAQcZO75/C55P+17SakiePzH1ea1WEJ
 kBIN7vBylbxBya0StWqzXaLijKNdmYhDQOKtHjLXSWbmirGI1VsND+X0N5vLb95UAj
 gDYYD/Q1VPvKDhrv6cxgt2vtD+wFms5n36q0caX0=
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

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFkZCBvbWFwX2dl
bV91bnBpbl9sb2NrZWQoKSB3aGljaCBpcyBhIHZlcnNpb24gb2Ygb21hcF9nZW1fdW5waW4oKSB0
aGF0CmV4cGVjdHMgdGhlIGNhbGxlciB0byBob2xkIHRoZSBvbWFwX29iaiBsb2NrLgoKU2lnbmVk
LW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQt
Ynk6IEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgMjUgKysrKysrKysrKysrKysrKysrLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXggNjFjYWE3YTFhMjRiLi45MjAxYzIxZTIwNmYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwpAQCAtODM0LDIwICs4MzQsMTYgQEAgaW50IG9t
YXBfZ2VtX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgZG1hX2FkZHJfdCAqZG1hX2Fk
ZHIpCiB9CiAKIC8qKgotICogb21hcF9nZW1fdW5waW4oKSAtIFVucGluIGEgR0VNIG9iamVjdCBm
cm9tIG1lbW9yeQorICogb21hcF9nZW1fdW5waW5fbG9ja2VkKCkgLSBVbnBpbiBhIEdFTSBvYmpl
Y3QgZnJvbSBtZW1vcnkKICAqIEBvYmo6IHRoZSBHRU0gb2JqZWN0CiAgKgotICogVW5waW4gdGhl
IGdpdmVuIEdFTSBvYmplY3QgcHJldmlvdXNseSBwaW5uZWQgd2l0aCBvbWFwX2dlbV9waW4oKS4g
UGlucyBhcmUKLSAqIHJlZmVyZW5jZS1jb3VudGVkLCB0aGUgYWN0dWFseSB1bnBpbiB3aWxsIG9u
bHkgYmUgcGVyZm9ybWVkIHdoZW4gdGhlIG51bWJlcgotICogb2YgY2FsbHMgdG8gdGhpcyBmdW5j
dGlvbiBtYXRjaGVzIHRoZSBudW1iZXIgb2YgY2FsbHMgdG8gb21hcF9nZW1fcGluKCkuCisgKiBv
bWFwX2dlbV91bnBpbigpIHdpdGhvdXQgbG9ja2luZy4KICAqLwotdm9pZCBvbWFwX2dlbV91bnBp
bihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3N0YXRpYyB2b2lkIG9tYXBfZ2VtX3VucGlu
X2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIHsKIAlzdHJ1Y3Qgb21hcF9nZW1f
b2JqZWN0ICpvbWFwX29iaiA9IHRvX29tYXBfYm8ob2JqKTsKIAlpbnQgcmV0OwogCi0JbXV0ZXhf
bG9jaygmb21hcF9vYmotPmxvY2spOwotCiAJaWYgKHJlZmNvdW50X2RlY19hbmRfdGVzdCgmb21h
cF9vYmotPmRtYV9hZGRyX2NudCkpIHsKIAkJcmV0ID0gdGlsZXJfdW5waW4ob21hcF9vYmotPmJs
b2NrKTsKIAkJaWYgKHJldCkgewpAQCAtODYyLDcgKzg1OCwyMiBAQCB2b2lkIG9tYXBfZ2VtX3Vu
cGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCQlvbWFwX29iai0+ZG1hX2FkZHIgPSAw
OwogCQlvbWFwX29iai0+YmxvY2sgPSBOVUxMOwogCX0KK30KIAorLyoqCisgKiBvbWFwX2dlbV91
bnBpbigpIC0gVW5waW4gYSBHRU0gb2JqZWN0IGZyb20gbWVtb3J5CisgKiBAb2JqOiB0aGUgR0VN
IG9iamVjdAorICoKKyAqIFVucGluIHRoZSBnaXZlbiBHRU0gb2JqZWN0IHByZXZpb3VzbHkgcGlu
bmVkIHdpdGggb21hcF9nZW1fcGluKCkuIFBpbnMgYXJlCisgKiByZWZlcmVuY2UtY291bnRlZCwg
dGhlIGFjdHVhbCB1bnBpbiB3aWxsIG9ubHkgYmUgcGVyZm9ybWVkIHdoZW4gdGhlIG51bWJlcgor
ICogb2YgY2FsbHMgdG8gdGhpcyBmdW5jdGlvbiBtYXRjaGVzIHRoZSBudW1iZXIgb2YgY2FsbHMg
dG8gb21hcF9nZW1fcGluKCkuCisgKi8KK3ZvaWQgb21hcF9nZW1fdW5waW4oc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmopCit7CisJc3RydWN0IG9tYXBfZ2VtX29iamVjdCAqb21hcF9vYmogPSB0
b19vbWFwX2JvKG9iaik7CisKKwltdXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7CisJb21hcF9n
ZW1fdW5waW5fbG9ja2VkKG9iaik7CiAJbXV0ZXhfdW5sb2NrKCZvbWFwX29iai0+bG9jayk7CiB9
CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
