Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FAE10D68E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81106E90B;
	Fri, 29 Nov 2019 13:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683FE6E908
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 15C30292578;
 Fri, 29 Nov 2019 13:59:13 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH 3/8] drm/panfrost: Fix a BO leak in panfrost_ioctl_mmap_bo()
Date: Fri, 29 Nov 2019 14:59:03 +0100
Message-Id: <20191129135908.2439529-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191129135908.2439529-1-boris.brezillon@collabora.com>
References: <20191129135908.2439529-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIHJlbGVhc2UgdGhlIHJlZmVyZW5jZSB3ZSBncmFiYmVkIHdoZW4gYW4gZXJyb3Ig
b2NjdXJzLgoKRml4ZXM6IDE4N2QyOTI5MjA2ZSAoImRybS9wYW5mcm9zdDogQWRkIHN1cHBvcnQg
Zm9yIEdQVSBoZWFwIGFsbG9jYXRpb25zIikKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpT
aWduZWQtb2ZmLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDkgKysr
KysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCBlZmMwYTI0ZDFmNGMu
LjI2MzBjNTAyN2M2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpA
QCAtMzAzLDE0ICszMDMsMTcgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9tbWFwX2JvKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJfQogCiAJLyogRG9uJ3QgYWxsb3cg
bW1hcHBpbmcgb2YgaGVhcCBvYmplY3RzIGFzIHBhZ2VzIGFyZSBub3QgcGlubmVkLiAqLwotCWlm
ICh0b19wYW5mcm9zdF9ibyhnZW1fb2JqKS0+aXNfaGVhcCkKLQkJcmV0dXJuIC1FSU5WQUw7CisJ
aWYgKHRvX3BhbmZyb3N0X2JvKGdlbV9vYmopLT5pc19oZWFwKSB7CisJCXJldCA9IC1FSU5WQUw7
CisJCWdvdG8gb3V0OworCX0KIAogCXJldCA9IGRybV9nZW1fY3JlYXRlX21tYXBfb2Zmc2V0KGdl
bV9vYmopOwogCWlmIChyZXQgPT0gMCkKIAkJYXJncy0+b2Zmc2V0ID0gZHJtX3ZtYV9ub2RlX29m
ZnNldF9hZGRyKCZnZW1fb2JqLT52bWFfbm9kZSk7Ci0JZHJtX2dlbV9vYmplY3RfcHV0X3VubG9j
a2VkKGdlbV9vYmopOwogCitvdXQ6CisJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKGdlbV9v
YmopOwogCXJldHVybiByZXQ7CiB9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
