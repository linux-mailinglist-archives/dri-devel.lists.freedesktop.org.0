Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9A2D988
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 11:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB7B898BC;
	Wed, 29 May 2019 09:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55580896E4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:52:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 94B5E284A2D;
 Wed, 29 May 2019 10:52:54 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v3 1/4] drm/panfrost: Move gpu_{write,
 read}() macros to panfrost_regs.h
Date: Wed, 29 May 2019 11:52:30 +0200
Message-Id: <20190529095233.26277-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529095233.26277-1-boris.brezillon@collabora.com>
References: <20190529095233.26277-1-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhleSBjYW4gYmUgdXNlZCBmcm9tIG90aGVyIGZpbGVzLgoKU2lnbmVkLW9mZi1ieTogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCkNoYW5nZXMg
aW4gdjM6Ci0gTm9uZQoKQ2hhbmdlcyBpbiB2MjoKLSBOb25lCi0tLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jICB8IDMgLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfcmVncy5oIHwgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9ncHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9ncHUu
YwppbmRleCA1OGVmMjU1NzNjZGEuLjZlNjhhMTAwMjkxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9ncHUuYwpAQCAtMTcsOSArMTcsNiBAQAogI2luY2x1ZGUgInBhbmZyb3N0
X2dwdS5oIgogI2luY2x1ZGUgInBhbmZyb3N0X3JlZ3MuaCIKIAotI2RlZmluZSBncHVfd3JpdGUo
ZGV2LCByZWcsIGRhdGEpIHdyaXRlbChkYXRhLCBkZXYtPmlvbWVtICsgcmVnKQotI2RlZmluZSBn
cHVfcmVhZChkZXYsIHJlZykgcmVhZGwoZGV2LT5pb21lbSArIHJlZykKLQogc3RhdGljIGlycXJl
dHVybl90IHBhbmZyb3N0X2dwdV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogewog
CXN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2ID0gZGF0YTsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfcmVncy5oCmluZGV4IDU3OGM1ZmMyMTg4Yi4uNDJkMDg4NjBmZDc2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfcmVncy5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9yZWdzLmgKQEAgLTI5NSw0ICsyOTUs
NyBAQAogI2RlZmluZSBBU19GQVVMVFNUQVRVU19BQ0NFU1NfVFlQRV9SRUFECQkoMHgyIDw8IDgp
CiAjZGVmaW5lIEFTX0ZBVUxUU1RBVFVTX0FDQ0VTU19UWVBFX1dSSVRFCSgweDMgPDwgOCkKIAor
I2RlZmluZSBncHVfd3JpdGUoZGV2LCByZWcsIGRhdGEpIHdyaXRlbChkYXRhLCBkZXYtPmlvbWVt
ICsgcmVnKQorI2RlZmluZSBncHVfcmVhZChkZXYsIHJlZykgcmVhZGwoZGV2LT5pb21lbSArIHJl
ZykKKwogI2VuZGlmCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
