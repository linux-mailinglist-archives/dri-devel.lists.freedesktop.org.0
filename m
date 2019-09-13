Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC18DB1C13
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608EE6EF1A;
	Fri, 13 Sep 2019 11:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 370F06EF1B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 11:17:54 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C540928ECC8;
 Fri, 13 Sep 2019 12:17:52 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH 2/2] drm/panfrost: Extend the bo_wait() ioctl
Date: Fri, 13 Sep 2019 13:17:48 +0200
Message-Id: <20190913111748.21071-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190913111748.21071-1-boris.brezillon@collabora.com>
References: <20190913111748.21071-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gd2UgY2FuIGNob29zZSB0byB3YWl0IGZvciBhbGwgQk8gdXNlcnMsIG9yIGp1c3QgZm9yIHdy
aXRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YyB8IDggKysrKysrLS0KIGluY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJtLmggICAgICAgICB8
IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCAwODA4MmZkNTU3
YzMuLjZhOTRhZWEyMTQ3ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YwpAQCAtMzIyLDE2ICszMjIsMjAgQEAgcGFuZnJvc3RfaW9jdGxfd2FpdF9ibyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXN0cnVjdCBkcm1fcGFuZnJvc3Rfd2FpdF9ibyAq
YXJncyA9IGRhdGE7CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1fb2JqOwogCXVuc2lnbmVk
IGxvbmcgdGltZW91dCA9IGRybV90aW1lb3V0X2Fic190b19qaWZmaWVzKGFyZ3MtPnRpbWVvdXRf
bnMpOworCWJvb2wgd2FpdF9hbGwgPSAhKGFyZ3MtPmZsYWdzICYgUEFORlJPU1RfV0FJVF9CT19X
UklURVJTKTsKIAogCWlmIChhcmdzLT5wYWQpCiAJCXJldHVybiAtRUlOVkFMOwogCisJaWYgKGFy
Z3MtPmZsYWdzICYgflBBTkZST1NUX1dBSVRfQk9fV1JJVEVSUykKKwkJcmV0dXJuIC1FSU5WQUw7
CisKIAlnZW1fb2JqID0gZHJtX2dlbV9vYmplY3RfbG9va3VwKGZpbGVfcHJpdiwgYXJncy0+aGFu
ZGxlKTsKIAlpZiAoIWdlbV9vYmopCiAJCXJldHVybiAtRU5PRU5UOwogCi0JcmV0ID0gZG1hX3Jl
c3Zfd2FpdF90aW1lb3V0X3JjdShnZW1fb2JqLT5yZXN2LCB0cnVlLAotCQkJCQkJICB0cnVlLCB0
aW1lb3V0KTsKKwlyZXQgPSBkbWFfcmVzdl93YWl0X3RpbWVvdXRfcmN1KGdlbV9vYmotPnJlc3Ys
IHdhaXRfYWxsLAorCQkJCQl0cnVlLCB0aW1lb3V0KTsKIAlpZiAoIXJldCkKIAkJcmV0ID0gdGlt
ZW91dCA/IC1FVElNRURPVVQgOiAtRUJVU1k7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9k
cm0vcGFuZnJvc3RfZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3BhbmZyb3N0X2RybS5oCmluZGV4
IDAyOWM2YWUxYjFmMC4uYWM0ZmFjYmNlZTQ3IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvZHJt
L3BhbmZyb3N0X2RybS5oCisrKyBiL2luY2x1ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJtLmgKQEAg
LTExMSw2ICsxMTEsOSBAQCBzdHJ1Y3QgZHJtX3BhbmZyb3N0X3N1Ym1pdCB7CiAJX191MzIgcGFk
OwogfTsKIAorI2RlZmluZSBQQU5GUk9TVF9XQUlUX0FMTF9CT19VU0VSUwkoMCA8PCAwKQorI2Rl
ZmluZSBQQU5GUk9TVF9XQUlUX0JPX1dSSVRFUlMJKDEgPDwgMCkKKwogLyoqCiAgKiBzdHJ1Y3Qg
ZHJtX3BhbmZyb3N0X3dhaXRfYm8gLSBpb2N0bCBhcmd1bWVudCBmb3Igd2FpdGluZyBmb3IKICAq
IGNvbXBsZXRpb24gb2YgdGhlIGxhc3QgRFJNX1BBTkZST1NUX1NVQk1JVCBvbiBhIEJPLgpAQCAt
MTIzLDYgKzEyNiw3IEBAIHN0cnVjdCBkcm1fcGFuZnJvc3Rfd2FpdF9ibyB7CiAJX191MzIgaGFu
ZGxlOwogCV9fdTMyIHBhZDsKIAlfX3M2NCB0aW1lb3V0X25zOwkvKiBhYnNvbHV0ZSAqLworCV9f
dTY0IGZsYWdzOwogfTsKIAogI2RlZmluZSBQQU5GUk9TVF9CT19OT0VYRUMJMQotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
