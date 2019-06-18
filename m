Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133A49BD8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 10:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB0E6E113;
	Tue, 18 Jun 2019 08:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1F06E113
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 08:16:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D02AF2852AF;
 Tue, 18 Jun 2019 09:16:51 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v4 1/4] drm/panfrost: Move gpu_{write,
 read}() macros to panfrost_regs.h
Date: Tue, 18 Jun 2019 10:16:45 +0200
Message-Id: <20190618081648.17297-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618081648.17297-1-boris.brezillon@collabora.com>
References: <20190618081648.17297-1-boris.brezillon@collabora.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, kernel@collabora.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhleSBjYW4gYmUgdXNlZCBmcm9tIG90aGVyIGZpbGVzLgoKU2lnbmVkLW9mZi1ieTogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6
IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2FAcm9zZW56d2VpZy5pbz4KLS0tCkNoYW5nZXMgaW4g
djQ6Ci0gQWRkIEFseXNzYSdzIFItYgoKQ2hhbmdlcyBpbiB2MzoKLSBOb25lCgpDaGFuZ2VzIGlu
IHYyOgotIE5vbmUKLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMg
IHwgMyAtLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9yZWdzLmggfCAzICsr
KwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jCmluZGV4IDU4ZWYyNTU3M2NkYS4uNmU2
OGExMDAyOTFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dwdS5jCkBAIC0x
Nyw5ICsxNyw2IEBACiAjaW5jbHVkZSAicGFuZnJvc3RfZ3B1LmgiCiAjaW5jbHVkZSAicGFuZnJv
c3RfcmVncy5oIgogCi0jZGVmaW5lIGdwdV93cml0ZShkZXYsIHJlZywgZGF0YSkgd3JpdGVsKGRh
dGEsIGRldi0+aW9tZW0gKyByZWcpCi0jZGVmaW5lIGdwdV9yZWFkKGRldiwgcmVnKSByZWFkbChk
ZXYtPmlvbWVtICsgcmVnKQotCiBzdGF0aWMgaXJxcmV0dXJuX3QgcGFuZnJvc3RfZ3B1X2lycV9o
YW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IHBhbmZyb3N0X2RldmljZSAq
cGZkZXYgPSBkYXRhOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X3JlZ3MuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9yZWdzLmgKaW5k
ZXggNTc4YzVmYzIxODhiLi40MmQwODg2MGZkNzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9yZWdzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X3JlZ3MuaApAQCAtMjk1LDQgKzI5NSw3IEBACiAjZGVmaW5lIEFTX0ZBVUxUU1RB
VFVTX0FDQ0VTU19UWVBFX1JFQUQJCSgweDIgPDwgOCkKICNkZWZpbmUgQVNfRkFVTFRTVEFUVVNf
QUNDRVNTX1RZUEVfV1JJVEUJKDB4MyA8PCA4KQogCisjZGVmaW5lIGdwdV93cml0ZShkZXYsIHJl
ZywgZGF0YSkgd3JpdGVsKGRhdGEsIGRldi0+aW9tZW0gKyByZWcpCisjZGVmaW5lIGdwdV9yZWFk
KGRldiwgcmVnKSByZWFkbChkZXYtPmlvbWVtICsgcmVnKQorCiAjZW5kaWYKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
