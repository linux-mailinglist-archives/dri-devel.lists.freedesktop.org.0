Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB2FC112
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D72A6E186;
	Thu, 14 Nov 2019 08:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E026E186
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:03:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAE83qVD118533;
 Thu, 14 Nov 2019 02:03:52 -0600
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE83qWo105830;
 Thu, 14 Nov 2019 02:03:52 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 02:03:51 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 02:03:51 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAE83nLM117686;
 Thu, 14 Nov 2019 02:03:50 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH] drm/omap: fix dma_addr refcounting
Date: Thu, 14 Nov 2019 10:03:43 +0200
Message-ID: <20191114080343.30704-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1573718632;
 bh=xrNN+1fSFg7BhDQ0s6YIVwKBL/mmvsIj1e6cCTdyZHE=;
 h=From:To:CC:Subject:Date;
 b=fpyRXjC4IsRiy/B+RlLmpNlJyGKbmPh4dL1hcixkkT/vII9HqJl3Xfxo7mmIvfS+T
 MtoeMNxImb/004BzNn37muykBrAr7/yAXCUp+JL39ifTWlHMPOsx6GlMIxenXsXYhX
 Ee1CPdY3uIohF1EfyB6Nt3cSN3zTlhmL2bXMMT+8=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Y2VjNGZhNzUxMWVmN2E3M2ViNjM1ODM0ZTlkODViMjVhNWI0N2E5OCAoImRybS9vbWFwOiB1c2Ug
cmVmY291bnQgQVBJIHRvCnRyYWNrIHRoZSBudW1iZXIgb2YgdXNlcnMgb2YgZG1hX2FkZHIiKSBj
aGFuZ2VkIG9tYXBfZ2VtLmMgdG8gdXNlCnJlZmNvdW50aW5nIEFQSSB0byB0cmFjayBkbWFfYWRk
ciB1c2VzLiAgSG93ZXZlciwgdGhlIGRyaXZlciBvbmx5IHRyYWNrcwp0aGUgcmVmY291bnRzIGZv
ciBub24tY29udGlndW91cyBidWZmZXJzLCBhbmQgdGhlIHBhdGNoIGRpZG4ndCBmdWxseQp0YWtl
IHRoaXMgaW4gYWNjb3VudC4KCkFmdGVyIHRoZSBwYXRjaCwgdGhlIGRyaXZlciBhbHdheXMgZGVj
cmVhc2VkIHJlZmNvdW50IGluIG9tYXBfZ2VtX3VucGluLAppbnN0ZWFkIG9mIGRlY3JlYXNpbmcg
dGhlIHJlZmNvdW50IG9ubHkgZm9yIG5vbi1jb250aWd1b3VzIGJ1ZmZlcnMuIFRoaXMKbGVhZHMg
dG8gcmVmY291bnRpbmcgbWlzbWF0Y2guCgpBcyBmb3IgdGhlIGNvbnRpZ3VvdXMgY2FzZXMgdGhl
IHJlZmNvdW50IGlzIG5ldmVyIGluY3JlYXNlZCwgZml4IHRoaXMKaXNzdWUgYnkgcmV0dXJuaW5n
IGZyb20gb21hcF9nZW1fdW5waW4gaWYgdGhlIGJ1ZmZlciBiZWluZyB1bnBpbm5lZCBpcwpjb250
aWd1b3VzLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRp
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jIHwgNCArKysrCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2Vt
LmMKaW5kZXggZTUxOGQ5M2NhNmRmLi5kMDhhZTk1ZWNjMGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
b21hcF9nZW0uYwpAQCAtODQzLDkgKzg0MywxMyBAQCBpbnQgb21hcF9nZW1fcGluKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqLCBkbWFfYWRkcl90ICpkbWFfYWRkcikKICAqLwogc3RhdGljIHZv
aWQgb21hcF9nZW1fdW5waW5fbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogewor
CXN0cnVjdCBvbWFwX2RybV9wcml2YXRlICpwcml2ID0gb2JqLT5kZXYtPmRldl9wcml2YXRlOwog
CXN0cnVjdCBvbWFwX2dlbV9vYmplY3QgKm9tYXBfb2JqID0gdG9fb21hcF9ibyhvYmopOwogCWlu
dCByZXQ7CiAKKwlpZiAob21hcF9nZW1faXNfY29udGlndW91cyhvbWFwX29iaikgfHwgIXByaXYt
Pmhhc19kbW0pCisJCXJldHVybjsKKwogCWlmIChyZWZjb3VudF9kZWNfYW5kX3Rlc3QoJm9tYXBf
b2JqLT5kbWFfYWRkcl9jbnQpKSB7CiAJCXJldCA9IHRpbGVyX3VucGluKG9tYXBfb2JqLT5ibG9j
ayk7CiAJCWlmIChyZXQpIHsKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtr
YWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUy
MS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
