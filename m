Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4583BBA33
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 19:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE3B6E921;
	Mon, 23 Sep 2019 17:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E2C6E921
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 17:12:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7E2E020820;
 Mon, 23 Sep 2019 17:12:28 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/panfrost: Reduce the amount of logs on deferred probe
Date: Mon, 23 Sep 2019 19:12:22 +0200
Message-Id: <20190923171222.9256-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569258750;
 bh=JprDp85wLb3vRGCsbBm49LmYNZ/PX4LzV9qCMprV4UQ=;
 h=From:To:Cc:Subject:Date:From;
 b=zYbGyJry8uCnv98oTYdprtmrdt3r5AWPNg6Qhh7wWlAViW9FwSKHFyFZ/7Napvjn5
 TjYtACSclcp4oAY9NvcCvQKuW/fMHaFPIWVyx/mQx0j0Wa73ZOY8tcBU6Ka9/BRIOq
 JPPEh0i+dG2LPA3JUQSQuAQ9Y7I0TMVrdCNkfIZU=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gcG9pbnQgdG8gcHJpbnQgZGVmZXJyZWQgcHJvYmUgKGFuZCBpdHMgZmFpbHVy
ZXMgdG8gZ2V0CnJlc291cmNlcykgYXMgYW4gZXJyb3IuICBBbHNvIHRoZXJlIGlzIG5vIG5lZWQg
dG8gcHJpbnQgcmVndWxhdG9yIGVycm9ycwp0d2ljZS4KCkluIGNhc2Ugb2YgbXVsdGlwbGUgcHJv
YmUgdHJpZXMgdGhpcyB3b3VsZCBwb2xsdXRlIHRoZSBkbWVzZy4KClNpZ25lZC1vZmYtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KCi0tLQoKQ2hhbmdlcyBzaW5jZSB2
MToKMS4gUmVtb3ZlIHNlY29uZCBlcnJvciBtZXNzYWdlIGZyb20gY2FsbGluZyBwYW5mcm9zdF9y
ZWd1bGF0b3JfaW5pdCgpLgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5j
CmluZGV4IDQ2YjBiMDJlNDI4OS4uMjg3YzZiYTMxNGQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCkBAIC05NSw3ICs5NSw5IEBAIHN0YXRpYyBpbnQgcGFu
ZnJvc3RfcmVndWxhdG9yX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJCXBm
ZGV2LT5yZWd1bGF0b3IgPSBOVUxMOwogCQlpZiAocmV0ID09IC1FTk9ERVYpCiAJCQlyZXR1cm4g
MDsKLQkJZGV2X2VycihwZmRldi0+ZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3I6ICVkXG4i
LCByZXQpOworCQlpZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCisJCQlkZXZfZXJyKHBmZGV2LT5k
ZXYsICJmYWlsZWQgdG8gZ2V0IHJlZ3VsYXRvcjogJWRcbiIsCisJCQkJcmV0KTsKIAkJcmV0dXJu
IHJldDsKIAl9CiAKQEAgLTEzMywxMCArMTM1LDggQEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0
KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCX0KIAogCWVyciA9IHBhbmZyb3N0X3Jl
Z3VsYXRvcl9pbml0KHBmZGV2KTsKLQlpZiAoZXJyKSB7Ci0JCWRldl9lcnIocGZkZXYtPmRldiwg
InJlZ3VsYXRvciBpbml0IGZhaWxlZCAlZFxuIiwgZXJyKTsKKwlpZiAoZXJyKQogCQlnb3RvIGVy
cl9vdXQwOwotCX0KIAogCWVyciA9IHBhbmZyb3N0X3Jlc2V0X2luaXQocGZkZXYpOwogCWlmIChl
cnIpIHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
