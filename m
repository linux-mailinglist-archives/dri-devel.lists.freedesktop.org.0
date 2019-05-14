Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8AC1C736
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 12:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA9A8926F;
	Tue, 14 May 2019 10:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A20B89247
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 10:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 6953A28365C
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [RESEND PATCH v2 1/2] drm/panfrost: Move gpu_{write,
 read}() macros to panfrost_regs.h
Date: Tue, 14 May 2019 12:48:00 +0200
Message-Id: <20190514104801.20448-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514104801.20448-1-boris.brezillon@collabora.com>
References: <20190514104801.20448-1-boris.brezillon@collabora.com>
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
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U28gdGhleSBjYW4gYmUgdXNlZCBmcm9tIG90aGVyIGZpbGVzLgoKU2lnbmVkLW9mZi1ieTogQm9y
aXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCkNoYW5nZXMg
aW4gdjI6Ci0gTm9uZQotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9ncHUu
YyAgfCAzIC0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3JlZ3MuaCB8IDMg
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMKaW5kZXggNThlZjI1NTczY2RhLi42
ZTY4YTEwMDI5MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9ncHUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ3B1LmMKQEAg
LTE3LDkgKzE3LDYgQEAKICNpbmNsdWRlICJwYW5mcm9zdF9ncHUuaCIKICNpbmNsdWRlICJwYW5m
cm9zdF9yZWdzLmgiCiAKLSNkZWZpbmUgZ3B1X3dyaXRlKGRldiwgcmVnLCBkYXRhKSB3cml0ZWwo
ZGF0YSwgZGV2LT5pb21lbSArIHJlZykKLSNkZWZpbmUgZ3B1X3JlYWQoZGV2LCByZWcpIHJlYWRs
KGRldi0+aW9tZW0gKyByZWcpCi0KIHN0YXRpYyBpcnFyZXR1cm5fdCBwYW5mcm9zdF9ncHVfaXJx
X2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNl
ICpwZmRldiA9IGRhdGE7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfcmVncy5oIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3JlZ3MuaApp
bmRleCA1NzhjNWZjMjE4OGIuLjQyZDA4ODYwZmQ3NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X3JlZ3MuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfcmVncy5oCkBAIC0yOTUsNCArMjk1LDcgQEAKICNkZWZpbmUgQVNfRkFVTFRT
VEFUVVNfQUNDRVNTX1RZUEVfUkVBRAkJKDB4MiA8PCA4KQogI2RlZmluZSBBU19GQVVMVFNUQVRV
U19BQ0NFU1NfVFlQRV9XUklURQkoMHgzIDw8IDgpCiAKKyNkZWZpbmUgZ3B1X3dyaXRlKGRldiwg
cmVnLCBkYXRhKSB3cml0ZWwoZGF0YSwgZGV2LT5pb21lbSArIHJlZykKKyNkZWZpbmUgZ3B1X3Jl
YWQoZGV2LCByZWcpIHJlYWRsKGRldi0+aW9tZW0gKyByZWcpCisKICNlbmRpZgotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
