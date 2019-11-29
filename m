Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C94910D68F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD3D6E90C;
	Fri, 29 Nov 2019 13:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1456E908
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5297C29257A;
 Fri, 29 Nov 2019 13:59:13 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH 4/8] drm/panfrost: Fix a race in panfrost_gem_free_object()
Date: Fri, 29 Nov 2019 14:59:04 +0100
Message-Id: <20191129135908.2439529-5-boris.brezillon@collabora.com>
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

cGFuZnJvc3RfZ2VtX3Nocmlua2VyX3NjYW4oKSBtaWdodCBwdXJnZSBhIEJPIChyZWxlYXNlIHRo
ZSBzZ3QgYW5kCmtpbGwgdGhlIEdQVSBtYXBwaW5nKSB0aGF0J3MgYmVpbmcgZnJlZWQgYnkgcGFu
ZnJvc3RfZ2VtX2ZyZWVfb2JqZWN0KCkKaWYgd2UgZG9uJ3QgcmVtb3ZlIHRoZSBCTyBmcm9tIHRo
ZSBzaHJpbmtlciBsaXN0IGF0IHRoZSBiZWdpbm5pbmcgb2YKcGFuZnJvc3RfZ2VtX2ZyZWVfb2Jq
ZWN0KCkuCgpGaXhlczogMDEzYjY1MTAxMzE1ICgiZHJtL3BhbmZyb3N0OiBBZGQgbWFkdmlzZSBh
bmQgc2hyaW5rZXIgc3VwcG9ydCIpCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KU2lnbmVk
LW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgfCAxNSArKysrKysr
KysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYwppbmRleCBhY2IwN2ZlMDY1
ODAuLmRhZjRjNTVhMjg2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0u
YwpAQCAtMTksNiArMTksMTYgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3RfZ2VtX2ZyZWVfb2JqZWN0
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCXN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0
ICpibyA9IHRvX3BhbmZyb3N0X2JvKG9iaik7CiAJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZk
ZXYgPSBvYmotPmRldi0+ZGV2X3ByaXZhdGU7CiAKKwkvKgorCSAqIE1ha2Ugc3VyZSB0aGUgQk8g
aXMgbm8gbG9uZ2VyIGluc2VydGVkIGluIHRoZSBzaHJpbmtlciBsaXN0IGJlZm9yZQorCSAqIHRh
a2luZyBjYXJlIG9mIHRoZSBkZXN0cnVjdGlvbiBpdHNlbGYuIElmIHdlIGRvbid0IGRvIHRoYXQg
d2UgaGF2ZSBhCisJICogcmFjZSBjb25kaXRpb24gYmV0d2VlbiB0aGlzIGZ1bmN0aW9uIGFuZCB3
aGF0J3MgZG9uZSBpbgorCSAqIHBhbmZyb3N0X2dlbV9zaHJpbmtlcl9zY2FuKCkuCisJICovCisJ
bXV0ZXhfbG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOworCWxpc3RfZGVsX2luaXQoJmJvLT5i
YXNlLm1hZHZfbGlzdCk7CisJbXV0ZXhfdW5sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7CisK
IAlpZiAoYm8tPnNndHMpIHsKIAkJaW50IGk7CiAJCWludCBuX3NndCA9IGJvLT5iYXNlLmJhc2Uu
c2l6ZSAvIFNaXzJNOwpAQCAtMzMsMTEgKzQzLDYgQEAgc3RhdGljIHZvaWQgcGFuZnJvc3RfZ2Vt
X2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCQlrZnJlZShiby0+c2d0
cyk7CiAJfQogCi0JbXV0ZXhfbG9jaygmcGZkZXYtPnNocmlua2VyX2xvY2spOwotCWlmICghbGlz
dF9lbXB0eSgmYm8tPmJhc2UubWFkdl9saXN0KSkKLQkJbGlzdF9kZWwoJmJvLT5iYXNlLm1hZHZf
bGlzdCk7Ci0JbXV0ZXhfdW5sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7Ci0KIAlkcm1fZ2Vt
X3NobWVtX2ZyZWVfb2JqZWN0KG9iaik7CiB9CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
