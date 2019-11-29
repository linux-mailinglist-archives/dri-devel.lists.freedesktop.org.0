Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A507410D68D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 14:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CCD6E909;
	Fri, 29 Nov 2019 13:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FD56E908
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 13:59:14 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD65D292577;
 Fri, 29 Nov 2019 13:59:12 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH 2/8] drm/panfrost: Fix a race in panfrost_ioctl_madvise()
Date: Fri, 29 Nov 2019 14:59:02 +0100
Message-Id: <20191129135908.2439529-3-boris.brezillon@collabora.com>
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

SWYgMiB0aHJlYWRzIGNoYW5nZSB0aGUgTUFEVklTRSBwcm9wZXJ0eSBvZiB0aGUgc2FtZSBCTyBp
biBwYXJhbGxlbCB3ZQptaWdodCBlbmQgdXAgd2l0aCBhbiBzaG1lbS0+bWFkdiB2YWx1ZSB0aGF0
J3MgaW5jb25zaXN0ZW50IHdpdGggdGhlCnByZXNlbmNlIG9mIHRoZSBCTyBpbiB0aGUgc2hyaW5r
ZXIgbGlzdC4KClRoZSBlYXNpZXN0IHNvbHV0aW9uIHRvIGZpeCB0aGF0IGlzIHRvIHByb3RlY3Qg
dGhlCmRybV9nZW1fc2htZW1fbWFkdmlzZSgpIGNhbGwgd2l0aCB0aGUgc2hyaW5rZXIgbG9jay4K
CkZpeGVzOiAwMTNiNjUxMDEzMTUgKCJkcm0vcGFuZnJvc3Q6IEFkZCBtYWR2aXNlIGFuZCBzaHJp
bmtlciBzdXBwb3J0IikKQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDkgKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwppbmRleCBmMjFiYzhhN2VlM2EuLmVmYzBhMjRkMWY0
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rydi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYwpAQCAtMzQ3LDIwICsz
NDcsMTkgQEAgc3RhdGljIGludCBwYW5mcm9zdF9pb2N0bF9tYWR2aXNlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCXJldHVybiAtRU5PRU5UOwogCX0KIAorCW11dGV4X2xv
Y2soJnBmZGV2LT5zaHJpbmtlcl9sb2NrKTsKIAlhcmdzLT5yZXRhaW5lZCA9IGRybV9nZW1fc2ht
ZW1fbWFkdmlzZShnZW1fb2JqLCBhcmdzLT5tYWR2KTsKIAogCWlmIChhcmdzLT5yZXRhaW5lZCkg
ewogCQlzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8gPSB0b19wYW5mcm9zdF9ibyhnZW1f
b2JqKTsKIAotCQltdXRleF9sb2NrKCZwZmRldi0+c2hyaW5rZXJfbG9jayk7Ci0KIAkJaWYgKGFy
Z3MtPm1hZHYgPT0gUEFORlJPU1RfTUFEVl9ET05UTkVFRCkKLQkJCWxpc3RfYWRkX3RhaWwoJmJv
LT5iYXNlLm1hZHZfbGlzdCwgJnBmZGV2LT5zaHJpbmtlcl9saXN0KTsKKwkJCWxpc3RfYWRkX3Rh
aWwoJmJvLT5iYXNlLm1hZHZfbGlzdCwKKwkJCQkgICAgICAmcGZkZXYtPnNocmlua2VyX2xpc3Qp
OwogCQllbHNlIGlmIChhcmdzLT5tYWR2ID09IFBBTkZST1NUX01BRFZfV0lMTE5FRUQpCiAJCQls
aXN0X2RlbF9pbml0KCZiby0+YmFzZS5tYWR2X2xpc3QpOwotCi0JCW11dGV4X3VubG9jaygmcGZk
ZXYtPnNocmlua2VyX2xvY2spOwogCX0KKwltdXRleF91bmxvY2soJnBmZGV2LT5zaHJpbmtlcl9s
b2NrKTsKIAogCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKIAlyZXR1cm4g
MDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
