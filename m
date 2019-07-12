Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074B6682B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA97C6E2EC;
	Fri, 12 Jul 2019 08:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40DBE6E2EC;
 Fri, 12 Jul 2019 08:03:28 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17241151-1500050 
 for multiple; Fri, 12 Jul 2019 09:03:15 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] dma-buf: Relax the write-seqlock for reallocating the
 shared fence list
Date: Fri, 12 Jul 2019 09:03:14 +0100
Message-Id: <20190712080314.21018-2-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190712080314.21018-1-chris@chris-wilson.co.uk>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgdGhlIHNldCBvZiBzaGFyZWQgZmVuY2VzIGlzIG5vdCBiZWluZyBjaGFuZ2VkIGR1cmluZyBy
ZWFsbG9jYXRpb24gb2YKdGhlIHJlc2VydmF0aW9uIGxpc3QsIHdlIGNhbiBza2lwIHVwZGF0aW5n
IHRoZSB3cml0ZV9zZXFsb2NrLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jIHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRp
b24uYwppbmRleCA4MGVjYzEyODNkMTUuLmM3MWI4NWM4YzE1OSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9u
LmMKQEAgLTE1NywxNSArMTU3LDE1IEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9z
aGFyZWQoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCQkoa3NpemUobmV3KSAtIG9m
ZnNldG9mKHR5cGVvZigqbmV3KSwgc2hhcmVkKSkgLwogCQlzaXplb2YoKm5ldy0+c2hhcmVkKTsK
IAotCXByZWVtcHRfZGlzYWJsZSgpOwotCXdyaXRlX3NlcWNvdW50X2JlZ2luKCZvYmotPnNlcSk7
CiAJLyoKLQkgKiBSQ1VfSU5JVF9QT0lOVEVSIGNhbiBiZSB1c2VkIGhlcmUsCi0JICogc2VxY291
bnQgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBiYXJyaWVycworCSAqIFdlIGFyZSBub3QgY2hhbmdp
bmcgdGhlIGVmZmVjdGl2ZSBzZXQgb2YgZmVuY2VzIGhlcmUgc28gY2FuCisJICogbWVyZWx5IHVw
ZGF0ZSB0aGUgcG9pbnRlciB0byB0aGUgbmV3IGFycmF5OyBib3RoIGV4aXN0aW5nCisJICogcmVh
ZGVycyBhbmQgbmV3IHJlYWRlcnMgd2lsbCBzZWUgZXhhY3RseSB0aGUgc2FtZSBzZXQgb2YKKwkg
KiBhY3RpdmUgKHVuc2lnbmFsZWQpIHNoYXJlZCBmZW5jZXMuIEluZGl2aWR1YWwgZmVuY2VzIGFu
ZCB0aGUKKwkgKiBvbGQgYXJyYXkgYXJlIHByb3RlY3RlZCBieSBSQ1UgYW5kIHNvIHdpbGwgbm90
IHZhbmlzaCB1bmRlcgorCSAqIHRoZSBnYXplIG9mIHRoZSByY3VfcmVhZF9sb2NrKCkgcmVhZGVy
cy4KIAkgKi8KLQlSQ1VfSU5JVF9QT0lOVEVSKG9iai0+ZmVuY2UsIG5ldyk7Ci0Jd3JpdGVfc2Vx
Y291bnRfZW5kKCZvYmotPnNlcSk7Ci0JcHJlZW1wdF9lbmFibGUoKTsKKwlyY3VfYXNzaWduX3Bv
aW50ZXIob2JqLT5mZW5jZSwgbmV3KTsKIAogCWlmICghb2xkKQogCQlyZXR1cm4gMDsKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
