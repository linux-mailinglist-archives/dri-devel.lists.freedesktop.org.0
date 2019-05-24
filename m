Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23692A058
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 23:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69AB6E03E;
	Fri, 24 May 2019 21:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8E36E03E;
 Fri, 24 May 2019 21:26:36 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hUHhr-0007g4-Jm; Fri, 24 May 2019 21:26:27 +0000
From: Colin King <colin.king@canonical.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/gtt: set err to -ENOMEM on memory allocation
 failure
Date: Fri, 24 May 2019 22:26:27 +0100
Message-Id: <20190524212627.24256-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KCkN1cnJlbnRs
eSB3aGVuIHRoZSBhbGxvY2F0aW9uIG9mIHBwZ3R0LT53b3JrIGZhaWxzIHRoZSBlcnJvciByZXR1
cm4KcGF0aCB2aWEgZXJyX2ZyZWUgcmV0dXJucyBhbiB1bmluaXRpYWxpemVkIHZhbHVlIGluIGVy
ci4gRml4IHRoaXMKYnkgc2V0dGluZyBlcnIgdG8gdGhlIGFwcHJvcHJpYXRlIGVycm9yIHJldHVy
biBvZiAtRU5PTUVNLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVuaW5pdGlhbGl6ZWQgc2NhbGFy
IHZhcmlhYmxlIikKRml4ZXM6IGQzNjIyMDk5Yzc2ZiAoImRybS9pOTE1L2d0dDogQWx3YXlzIGFj
cXVpcmUgc3RydWN0X211dGV4IGZvciBnZW42X3BwZ3R0X2NsZWFudXAiKQpTaWduZWQtb2ZmLWJ5
OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9nZW1fZ3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQu
YwppbmRleCA4ZDhhNGIwYWQ0ZDkuLjhhOWI1MDYzODdkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9nZW1fZ3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9nZW1fZ3R0LmMKQEAgLTIwMzUsOCArMjAzNSwxMCBAQCBzdGF0aWMgc3RydWN0IGk5MTVfaHdf
cHBndHQgKmdlbjZfcHBndHRfY3JlYXRlKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQog
CXBwZ3R0LT5iYXNlLnZtLnB0ZV9lbmNvZGUgPSBnZ3R0LT52bS5wdGVfZW5jb2RlOwogCiAJcHBn
dHQtPndvcmsgPSBrbWFsbG9jKHNpemVvZigqcHBndHQtPndvcmspLCBHRlBfS0VSTkVMKTsKLQlp
ZiAoIXBwZ3R0LT53b3JrKQorCWlmICghcHBndHQtPndvcmspIHsKKwkJZXJyID0gLUVOT01FTTsK
IAkJZ290byBlcnJfZnJlZTsKKwl9CiAKIAllcnIgPSBnZW42X3BwZ3R0X2luaXRfc2NyYXRjaChw
cGd0dCk7CiAJaWYgKGVycikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
