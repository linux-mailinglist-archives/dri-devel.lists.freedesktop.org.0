Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D028C66829
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 10:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EECF6E2EA;
	Fri, 12 Jul 2019 08:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B0D6E2EA;
 Fri, 12 Jul 2019 08:03:23 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 17241150-1500050 
 for multiple; Fri, 12 Jul 2019 09:03:15 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dma-buf: Expand reservation_list to fill allocation
Date: Fri, 12 Jul 2019 09:03:13 +0100
Message-Id: <20190712080314.21018-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.22.0
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2Uga21hbGxvYygpIHdpbGwgcm91bmQgdXAgdGhlIGFsbG9jYXRpb24gdG8gdGhlIG5leHQg
c2xhYiBzaXplIG9yCnBhZ2UsIGl0IHdpbGwgbm9ybWFsbHkgcmV0dXJuIGEgcG9pbnRlciB0byBh
IG1lbW9yeSBibG9jayBiaWdnZXIgdGhhbiB3ZQphc2tlZCBmb3IuIFdlIGNhbiBxdWVyeSBmb3Ig
dGhlIGFjdHVhbCBzaXplIG9mIHRoZSBhbGxvY2F0ZWQgYmxvY2sgdXNpbmcKa3NpemUoKSBhbmQg
ZXhwYW5kIG91ciB2YXJpYWJsZSBzaXplIHJlc2VydmF0aW9uX2xpc3QgdG8gdGFrZSBhZHZhbnRh
Z2UKb2YgdGhhdCBleHRyYSBzcGFjZS4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hy
aXNAY2hyaXMtd2lsc29uLmNvLnVrPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgpDYzogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9kbWEtYnVmL3Jlc2VydmF0aW9uLmMgfCA2ICsrKystLQogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5j
CmluZGV4IGE2YWMyYjNhMDE4NS4uODBlY2MxMjgzZDE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Rt
YS1idWYvcmVzZXJ2YXRpb24uYworKysgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYwpA
QCAtMTUzLDcgKzE1Myw5IEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9zaGFyZWQo
c3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCQkJUkNVX0lOSVRfUE9JTlRFUihuZXct
PnNoYXJlZFtqKytdLCBmZW5jZSk7CiAJfQogCW5ldy0+c2hhcmVkX2NvdW50ID0gajsKLQluZXct
PnNoYXJlZF9tYXggPSBtYXg7CisJbmV3LT5zaGFyZWRfbWF4ID0KKwkJKGtzaXplKG5ldykgLSBv
ZmZzZXRvZih0eXBlb2YoKm5ldyksIHNoYXJlZCkpIC8KKwkJc2l6ZW9mKCpuZXctPnNoYXJlZCk7
CiAKIAlwcmVlbXB0X2Rpc2FibGUoKTsKIAl3cml0ZV9zZXFjb3VudF9iZWdpbigmb2JqLT5zZXEp
OwpAQCAtMTY5LDcgKzE3MSw3IEBAIGludCByZXNlcnZhdGlvbl9vYmplY3RfcmVzZXJ2ZV9zaGFy
ZWQoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAogCQlyZXR1cm4gMDsKIAogCS8qIERy
b3AgdGhlIHJlZmVyZW5jZXMgdG8gdGhlIHNpZ25hbGVkIGZlbmNlcyAqLwotCWZvciAoaSA9IGs7
IGkgPCBuZXctPnNoYXJlZF9tYXg7ICsraSkgeworCWZvciAoaSA9IGs7IGkgPCBtYXg7ICsraSkg
ewogCQlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsKIAogCQlmZW5jZSA9IHJjdV9kZXJlZmVyZW5j
ZV9wcm90ZWN0ZWQobmV3LT5zaGFyZWRbaV0sCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
