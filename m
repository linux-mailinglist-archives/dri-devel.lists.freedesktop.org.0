Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6054AA68
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 20:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BC66E21A;
	Tue, 18 Jun 2019 18:55:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4A46E21A;
 Tue, 18 Jun 2019 18:55:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DFADE206BA;
 Tue, 18 Jun 2019 18:55:13 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/panfrost: Reduce the amount of logs on deferred probe
Date: Tue, 18 Jun 2019 20:55:02 +0200
Message-Id: <20190618185502.3839-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618185502.3839-1-krzk@kernel.org>
References: <20190618185502.3839-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560884115;
 bh=jnHY4wAAX194MRXM1kpGV2/DxUzOkoaBjDrIsGD8q4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zoHDJ6gP2eOG45PXp/OGjeFUI5zule1UfgoqVnGBP4SNG0NJG1YRQzkh7V7HWI9/o
 fD5OSQxucoddbTITn0wzfGC5SozsIHbqGxutWjNdqhCBoq0V20U4pPui6askLr2p0j
 k0IoIHUyRBOhPMwgR+UPyRw+YR4JV5XHqrtmrMNY=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gcG9pbnQgdG8gcHJpbnQgZGVmZXJyZWQgcHJvYmUgKGFuZCBpdHMgZmFpbHVy
ZXMgdG8gZ2V0CnJlc291cmNlcykgYXMgYW4gZXJyb3IuCgpJbiBjYXNlIG9mIG11bHRpcGxlIHBy
b2JlIHRyaWVzIHRoaXMgd291bGQgcG9sbHV0ZSB0aGUgZG1lc2cuCgpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmljZS5jCmluZGV4IGNjYjhlYjJhNTE4Yy4uODU4NTgyYTYwMDkwIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCkBAIC05NSw3ICs5NSw5IEBA
IHN0YXRpYyBpbnQgcGFuZnJvc3RfcmVndWxhdG9yX2luaXQoc3RydWN0IHBhbmZyb3N0X2Rldmlj
ZSAqcGZkZXYpCiAJCXBmZGV2LT5yZWd1bGF0b3IgPSBOVUxMOwogCQlpZiAocmV0ID09IC1FTk9E
RVYpCiAJCQlyZXR1cm4gMDsKLQkJZGV2X2VycihwZmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCBy
ZWd1bGF0b3I6ICVkXG4iLCByZXQpOworCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCisJCQlk
ZXZfZXJyKHBmZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IHJlZ3VsYXRvcjogJWRcbiIsCisJCQkJ
cmV0KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
