Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF89D88BEC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 17:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8F96E42B;
	Sat, 10 Aug 2019 15:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DCB6E435;
 Sat, 10 Aug 2019 15:36:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17954016-1500050 
 for multiple; Sat, 10 Aug 2019 16:34:32 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] dma-fence: Propagate errors to dma-fence-array container
Date: Sat, 10 Aug 2019 16:34:27 +0100
Message-Id: <20190810153430.30636-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: Gustavo Padovan <gustavo@padovan.org>, intel-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBvbmUgb2YgdGhlIGFycmF5IG9mIGZlbmNlcyBpcyBzaWduYWxlZCwgcHJvcGFnYXRlIGl0
cyBlcnJvcnMgdG8gdGhlCnBhcmVudCBmZW5jZS1hcnJheSAoa2VlcGluZyB0aGUgZmlyc3QgZXJy
b3IgdG8gYmUgcmFpc2VkKS4KCnYyOiBPcGVuY29kZSBjbXB4Y2hnX2xvY2FsIHRvIGF2b2lkIGNv
bXBpbGVyIGZyZWFrb3V0LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3Jn
PgpDYzogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvQHBhZG92YW4ub3JnPgotLS0KIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYyB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLWFycmF5LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMKaW5kZXgg
MTJjNmY2NGMwYmMyLi5kOTA2NzViYjRmY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UtYXJyYXkuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMK
QEAgLTEzLDYgKzEzLDEyIEBACiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxp
bnV4L2RtYS1mZW5jZS1hcnJheS5oPgogCitzdGF0aWMgdm9pZCBmZW5jZV9zZXRfZXJyb3Jfb25j
ZShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgaW50IGVycm9yKQoreworCWlmICghZmVuY2UtPmVy
cm9yICYmIGVycm9yKQorCQlkbWFfZmVuY2Vfc2V0X2Vycm9yKGZlbmNlLCBlcnJvcik7Cit9CisK
IHN0YXRpYyBjb25zdCBjaGFyICpkbWFfZmVuY2VfYXJyYXlfZ2V0X2RyaXZlcl9uYW1lKHN0cnVj
dCBkbWFfZmVuY2UgKmZlbmNlKQogewogCXJldHVybiAiZG1hX2ZlbmNlX2FycmF5IjsKQEAgLTM4
LDYgKzQ0LDEzIEBAIHN0YXRpYyB2b2lkIGRtYV9mZW5jZV9hcnJheV9jYl9mdW5jKHN0cnVjdCBk
bWFfZmVuY2UgKmYsCiAJCWNvbnRhaW5lcl9vZihjYiwgc3RydWN0IGRtYV9mZW5jZV9hcnJheV9j
YiwgY2IpOwogCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFycmF5ID0gYXJyYXlfY2ItPmFycmF5
OwogCisJLyoKKwkgKiBQcm9wYWdhdGUgdGhlIGZpcnN0IGVycm9yIHJlcG9ydGVkIGJ5IGFueSBv
ZiBvdXIgZmVuY2VzLCBidXQgb25seQorCSAqIGJlZm9yZSB3ZSBvdXJzZWx2ZXMgYXJlIHNpZ25h
bGVkLgorCSAqLworCWlmIChhdG9taWNfcmVhZCgmYXJyYXktPm51bV9wZW5kaW5nKSA+IDApCisJ
CWZlbmNlX3NldF9lcnJvcl9vbmNlKCZhcnJheS0+YmFzZSwgZi0+ZXJyb3IpOworCiAJaWYgKGF0
b21pY19kZWNfYW5kX3Rlc3QoJmFycmF5LT5udW1fcGVuZGluZykpCiAJCWlycV93b3JrX3F1ZXVl
KCZhcnJheS0+d29yayk7CiAJZWxzZQpAQCAtNjMsNiArNzYsOCBAQCBzdGF0aWMgYm9vbCBkbWFf
ZmVuY2VfYXJyYXlfZW5hYmxlX3NpZ25hbGluZyhzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKIAkJ
ZG1hX2ZlbmNlX2dldCgmYXJyYXktPmJhc2UpOwogCQlpZiAoZG1hX2ZlbmNlX2FkZF9jYWxsYmFj
ayhhcnJheS0+ZmVuY2VzW2ldLCAmY2JbaV0uY2IsCiAJCQkJCSAgIGRtYV9mZW5jZV9hcnJheV9j
Yl9mdW5jKSkgeworCQkJZmVuY2Vfc2V0X2Vycm9yX29uY2UoJmFycmF5LT5iYXNlLAorCQkJCQkg
ICAgIGFycmF5LT5mZW5jZXNbaV0tPmVycm9yKTsKIAkJCWRtYV9mZW5jZV9wdXQoJmFycmF5LT5i
YXNlKTsKIAkJCWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCZhcnJheS0+bnVtX3BlbmRpbmcpKQog
CQkJCXJldHVybiBmYWxzZTsKLS0gCjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
