Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58225ADC7A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 17:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CA589C98;
	Mon,  9 Sep 2019 15:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8189C98
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 15:51:55 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2E972082C;
 Mon,  9 Sep 2019 15:51:52 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] drm/panfrost: Reduce the amount of logs on deferred
 probe
Date: Mon,  9 Sep 2019 17:51:46 +0200
Message-Id: <20190909155146.14065-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568044315;
 bh=AyjekNVhRjBlU8PjHLcUlwzfBiHI9ybDkgsxOYALMeA=;
 h=From:To:Cc:Subject:Date:From;
 b=wKljNsiRkPoeNLDUtYW5FzCf7vViXMwOr4k85IOW65t7GXm3+iL+uG0FI3DrUNqFQ
 +7qH8k5CXFFOuIvRC43TTJHFXKQk6w4LYxVTV/zqMrs7yoV5J4qkFTG1HyX70lc84B
 BjKHbiS92dHB+6P7vMJDUib1GoneMLd8CixmUxb4=
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
bmZyb3N0X2RldmljZS5jCmluZGV4IDQ2YjBiMDJlNDI4OS4uMjI1MjE0N2JjMjg1IDEwMDY0NAot
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
