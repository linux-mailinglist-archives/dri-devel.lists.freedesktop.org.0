Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B134714
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 14:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567E18911F;
	Tue,  4 Jun 2019 12:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C928911F;
 Tue,  4 Jun 2019 12:40:56 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 16788264-1500050 
 for multiple; Tue, 04 Jun 2019 13:39:52 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Discard old fence_excl on retrying get_fences_rcu
 for realloc
Date: Tue,  4 Jun 2019 13:39:47 +0100
Message-Id: <20190604123947.20713-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgd2UgaGF2ZSB0byBkcm9wIHRoZSBzZXFjb3VudCAmIHJjdSBsb2NrIHRvIHBlcmZvcm0gYSBr
cmVhbGxvYywgd2UKaGF2ZSB0byByZXN0YXJ0IHRoZSBsb29wLiBJbiBkb2luZyBzbywgYmUgY2Fy
ZWZ1bCBub3QgdG8gbG9zZSB0cmFjayBvZgp0aGUgYWxyZWFkeSBhY3F1aXJlZCBleGNsdXNpdmUg
ZmVuY2UuCgpGaXhlczogZmVkZjU0MTMyZDI0ICgiZG1hLWJ1ZjogUmVzdGFydCByZXNlcnZhdGlv
bl9vYmplY3RfZ2V0X2ZlbmNlc19yY3UoKSBhZnRlciB3cml0ZXMiKSAjdjQuMTAKU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNj
OiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9u
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2Vy
dmF0aW9uLmMKaW5kZXggNGQzMmUyYzY3ODYyLi43MDQ1MDNkZjQ4OTIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZh
dGlvbi5jCkBAIC0zNjUsNiArMzY1LDEyIEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfZ2V0X2Zl
bmNlc19yY3Uoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCQkJCQkgICBHRlBfTk9X
QUlUIHwgX19HRlBfTk9XQVJOKTsKIAkJCWlmICghbnNoYXJlZCkgewogCQkJCXJjdV9yZWFkX3Vu
bG9jaygpOworCisJCQkJaWYgKGZlbmNlX2V4Y2wpIHsKKwkJCQkJZG1hX2ZlbmNlX3B1dChmZW5j
ZV9leGNsKTsKKwkJCQkJZmVuY2VfZXhjbCA9IE5VTEw7CisJCQkJfQorCiAJCQkJbnNoYXJlZCA9
IGtyZWFsbG9jKHNoYXJlZCwgc3osIEdGUF9LRVJORUwpOwogCQkJCWlmIChuc2hhcmVkKSB7CiAJ
CQkJCXNoYXJlZCA9IG5zaGFyZWQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
