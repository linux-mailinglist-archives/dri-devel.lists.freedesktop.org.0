Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0024890495
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 17:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F806E351;
	Fri, 16 Aug 2019 15:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B666E34A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 15:22:07 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 18164724-1500050 
 for multiple; Fri, 16 Aug 2019 16:21:54 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dma-fence: Simply wrap dma_fence_signal_locked with
 dma_fence_signal
Date: Fri, 16 Aug 2019 16:21:52 +0100
Message-Id: <20190816152152.27550-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190816152152.27550-1-chris@chris-wilson.co.uk>
References: <20190816152152.27550-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudGx5IGRtYV9mZW5jZV9zaWduYWwoKSB0cmllcyB0byBhdm9pZCB0aGUgc3BpbmxvY2sg
YW5kIG9ubHkgdGFrZXMKaXQgaWYgYWJzb2x1dGVseSByZXF1aXJlZCB0byB3YWxrIHRoZSBjYWxs
YmFjayBsaXN0LiBIb3dldmVyLCB0byBhbGxvdwpmb3Igc29tZSB1c2VycyB0byBzdXJyZXB0aXRp
b3VzbHkgaW5zZXJ0IGxhenkgc2lnbmFsIGNhbGxiYWNrcyB0aGF0CmRvIG5vdCBkZXBlbmQgb24g
ZW5hYmxpbmcgdGhlIHNpZ25hbGluZyBtZWNoYW5pc20gYXJvdW5kIGV2ZXJ5IGZlbmNlLAp3ZSBh
bHdheXMgbmVlZCB0byBub3RpZnkgdGhlIGNhbGxiYWNrcyBvbiBzaWduYWxpbmcuIEFzIHN1Y2gs
IHdlIHdpbGwKYWx3YXlzIG5lZWQgdG8gdGFrZSB0aGUgc3BpbmxvY2sgYW5kIGRtYV9mZW5jZV9z
aWduYWwoKSBlZmZlY3RpdmVseQpiZWNvbWVzIGEgY2xvbmUgb2YgZG1hX2ZlbmNlX3NpZ25hbF9s
b2NrZWQoKS4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLmMgfCAxOSArKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKaW5kZXgg
ZmYwY2Q2ZWFlNzY2Li5mMjNlYjlmMTliNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKQEAgLTE3Niw2ICsx
NzYsNyBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkKTsKIGludCBkbWFf
ZmVuY2Vfc2lnbmFsKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQogewogCXVuc2lnbmVkIGxvbmcg
ZmxhZ3M7CisJaW50IHJldDsKIAogCWlmICghZmVuY2UpCiAJCXJldHVybiAtRUlOVkFMOwpAQCAt
MTgzLDIxICsxODQsMTEgQEAgaW50IGRtYV9mZW5jZV9zaWduYWwoc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2UpCiAJaWYgKHRlc3RfYW5kX3NldF9iaXQoRE1BX0ZFTkNFX0ZMQUdfU0lHTkFMRURfQklU
LCAmZmVuY2UtPmZsYWdzKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlmZW5jZS0+dGltZXN0YW1w
ID0ga3RpbWVfZ2V0KCk7Ci0Jc2V0X2JpdChETUFfRkVOQ0VfRkxBR19USU1FU1RBTVBfQklULCAm
ZmVuY2UtPmZsYWdzKTsKLQl0cmFjZV9kbWFfZmVuY2Vfc2lnbmFsZWQoZmVuY2UpOwotCi0JaWYg
KHRlc3RfYml0KERNQV9GRU5DRV9GTEFHX0VOQUJMRV9TSUdOQUxfQklULCAmZmVuY2UtPmZsYWdz
KSkgewotCQlzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjdXIsICp0bXA7CisJc3Bpbl9sb2NrX2lycXNh
dmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsKKwlyZXQgPSBkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZChm
ZW5jZSk7CisJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZShmZW5jZS0+bG9jaywgZmxhZ3MpOwogCi0J
CXNwaW5fbG9ja19pcnFzYXZlKGZlbmNlLT5sb2NrLCBmbGFncyk7Ci0JCWxpc3RfZm9yX2VhY2hf
ZW50cnlfc2FmZShjdXIsIHRtcCwgJmZlbmNlLT5jYl9saXN0LCBub2RlKSB7Ci0JCQlsaXN0X2Rl
bF9pbml0KCZjdXItPm5vZGUpOwotCQkJY3VyLT5mdW5jKGZlbmNlLCBjdXIpOwotCQl9Ci0JCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoZmVuY2UtPmxvY2ssIGZsYWdzKTsKLQl9Ci0JcmV0dXJuIDA7
CisJcmV0dXJuIHJldDsKIH0KIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX3NpZ25hbCk7CiAKLS0g
CjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
