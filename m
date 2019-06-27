Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B75883D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 19:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BDB6E267;
	Thu, 27 Jun 2019 17:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19AB6E267
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 17:24:19 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 77399287B22;
 Thu, 27 Jun 2019 18:24:18 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH] drm/panfrost: Fix a double-free error
Date: Thu, 27 Jun 2019 19:24:14 +0200
Message-Id: <20190627172414.27231-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
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

ZHJtX2dlbV9zaG1lbV9jcmVhdGVfd2l0aF9oYW5kbGUoKSByZXR1cm5zIGEgR0VNIG9iamVjdCBh
bmQgYXR0YWNoIGEKaGFuZGxlIHRvIGl0LiBXaGVuIHRoZSB1c2VyIGNsb3NlcyB0aGUgRFJNIEZE
LCB0aGUgY29yZSByZWxlYXNlcyBhbGwKR0VNIGhhbmRsZXMgYWxvbmcgd2l0aCB0aGVpciBiYWNr
aW5nIEdFTSBvYmpzLCB3aGljaCBjYW4gbGVhZCB0byBhCmRvdWJsZS1mcmVlIGlzc3VlIGlmIHBh
bmZyb3N0X2lvY3RsX2NyZWF0ZV9ibygpIGZhaWxlZCBhbmQgd2VudAp0aHJvdWdoIHRoZSBlcnJf
ZnJlZSBwYXRoIHdoZXJlIGRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgpIGlzCmNhbGxlZCB3
aXRob3V0IGRlbGV0aW5nIHRoZSBhc3NvY2lhdGUgaGFuZGxlLgoKUmVwbGFjZSB0aGlzIGRybV9n
ZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgpIGNhbGwgYnkgYQpkcm1fZ2VtX2hhbmRsZV9kZWxldGUo
KSBvbmUgdG8gZml4IHRoYXQuCgpGaXhlczogZjNiYTkxMjI4ZThlICgiZHJtL3BhbmZyb3N0OiBB
ZGQgaW5pdGlhbCBwYW5mcm9zdCBkcml2ZXIiKQpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
ClNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9y
YS5jb20+Ci0tLQpSZXByb2R1Y2VkIGZvciByZWFsIHdoZW4gQk8gbWFwcGluZyBmYWlscyBiZWNh
dXNlIHdlIHJhbiBvdXQgb2YKbWVtb3J5LgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kcnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCAw
N2IwMWViM2QxMzYuLmNiNDNmZjRlYmY0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kcnYuYwpAQCAtNjcsNyArNjcsNyBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X2lvY3RsX2Ny
ZWF0ZV9ibyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXJldHVybiAwOwog
CiBlcnJfZnJlZToKLQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoJnNobWVtLT5iYXNlKTsK
Kwlkcm1fZ2VtX2hhbmRsZV9kZWxldGUoZmlsZSwgYXJncy0+aGFuZGxlKTsKIAlyZXR1cm4gcmV0
OwogfQogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
