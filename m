Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CE75F385
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514666E28B;
	Thu,  4 Jul 2019 07:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB166E15A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 15:55:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63FtiVI015509;
 Wed, 3 Jul 2019 10:55:44 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63Ftiea064846
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 3 Jul 2019 10:55:44 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 3 Jul
 2019 10:55:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 3 Jul 2019 10:55:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63Fth81001306;
 Wed, 3 Jul 2019 10:55:43 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/omap: add omap_gem_unpin_locked()
Date: Wed, 3 Jul 2019 17:55:30 +0200
Message-ID: <20190703155536.28339-3-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703155536.28339-1-jjhiblot@ti.com>
References: <20190703155536.28339-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1562169344;
 bh=TvaYb0Rh4N6CqRqeNnFVOyMwXm8L1ETqUol/LNEx+cY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=YIqBq7K9C5RUfWBiNTCe4F6sIm0xv5ZCRdOUxjXw4Pl/VDCIXwbclosEg6XbyWh0M
 DgtOnCbsKXGY5UcSi+7SiKqDTlYbT+/R9DpvDngct7FZQUHwY0pM8Hbe1bskEtZWAN
 x7RVNrQ/nM5e7fjRbEEto2j3pJIL7noCIEZwYMZk=
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
ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgMjUgKysrKysrKysrKysrKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKaW5kZXggZThhYWZjZjBmMjA5Li4yYjc0NWIwY2Zi
NzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwpAQCAtODMwLDIwICs4MzAsMTYgQEAg
aW50IG9tYXBfZ2VtX3BpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgZG1hX2FkZHJfdCAq
ZG1hX2FkZHIpCiB9CiAKIC8qKgotICogb21hcF9nZW1fdW5waW4oKSAtIFVucGluIGEgR0VNIG9i
amVjdCBmcm9tIG1lbW9yeQorICogb21hcF9nZW1fdW5waW5fbG9ja2VkKCkgLSBVbnBpbiBhIEdF
TSBvYmplY3QgZnJvbSBtZW1vcnkKICAqIEBvYmo6IHRoZSBHRU0gb2JqZWN0CiAgKgotICogVW5w
aW4gdGhlIGdpdmVuIEdFTSBvYmplY3QgcHJldmlvdXNseSBwaW5uZWQgd2l0aCBvbWFwX2dlbV9w
aW4oKS4gUGlucyBhcmUKLSAqIHJlZmVyZW5jZS1jb3VudGVkLCB0aGUgYWN0dWFseSB1bnBpbiB3
aWxsIG9ubHkgYmUgcGVyZm9ybWVkIHdoZW4gdGhlIG51bWJlcgotICogb2YgY2FsbHMgdG8gdGhp
cyBmdW5jdGlvbiBtYXRjaGVzIHRoZSBudW1iZXIgb2YgY2FsbHMgdG8gb21hcF9nZW1fcGluKCku
CisgKiBvbWFwX2dlbV91bnBpbigpIHdpdGhvdXQgbG9ja2luZy4KICAqLwotdm9pZCBvbWFwX2dl
bV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3N0YXRpYyB2b2lkIG9tYXBfZ2Vt
X3VucGluX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIHsKIAlzdHJ1Y3Qgb21h
cF9nZW1fb2JqZWN0ICpvbWFwX29iaiA9IHRvX29tYXBfYm8ob2JqKTsKIAlpbnQgcmV0OwogCi0J
bXV0ZXhfbG9jaygmb21hcF9vYmotPmxvY2spOwotCiAJaWYgKHJlZmNvdW50X2RlY19hbmRfdGVz
dCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkpIHsKIAkJcmV0ID0gdGlsZXJfdW5waW4ob21hcF9v
YmotPmJsb2NrKTsKIAkJaWYgKHJldCkgewpAQCAtODU5LDcgKzg1NSwyMiBAQCB2b2lkIG9tYXBf
Z2VtX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCQlvbWFwX29iai0+YmxvY2sg
PSBOVUxMOwogCX0KIH0KK30KIAorLyoqCisgKiBvbWFwX2dlbV91bnBpbigpIC0gVW5waW4gYSBH
RU0gb2JqZWN0IGZyb20gbWVtb3J5CisgKiBAb2JqOiB0aGUgR0VNIG9iamVjdAorICoKKyAqIFVu
cGluIHRoZSBnaXZlbiBHRU0gb2JqZWN0IHByZXZpb3VzbHkgcGlubmVkIHdpdGggb21hcF9nZW1f
cGluKCkuIFBpbnMgYXJlCisgKiByZWZlcmVuY2UtY291bnRlZCwgdGhlIGFjdHVhbCB1bnBpbiB3
aWxsIG9ubHkgYmUgcGVyZm9ybWVkIHdoZW4gdGhlIG51bWJlcgorICogb2YgY2FsbHMgdG8gdGhp
cyBmdW5jdGlvbiBtYXRjaGVzIHRoZSBudW1iZXIgb2YgY2FsbHMgdG8gb21hcF9nZW1fcGluKCku
CisgKi8KK3ZvaWQgb21hcF9nZW1fdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCit7
CisJc3RydWN0IG9tYXBfZ2VtX29iamVjdCAqb21hcF9vYmogPSB0b19vbWFwX2JvKG9iaik7CisK
KwltdXRleF9sb2NrKCZvbWFwX29iai0+bG9jayk7CisJb21hcF9nZW1fdW5waW5fbG9ja2VkKG9i
aik7CiAJbXV0ZXhfdW5sb2NrKCZvbWFwX29iai0+bG9jayk7CiB9CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
