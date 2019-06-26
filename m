Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622455FAF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 05:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82AE86E262;
	Wed, 26 Jun 2019 03:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BEF6E262
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 03:41:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (mobile-107-77-172-74.mobile.att.net
 [107.77.172.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC3CE216FD;
 Wed, 26 Jun 2019 03:41:56 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 17/51] drm/mediatek: call
 drm_atomic_helper_shutdown() when unbinding driver
Date: Tue, 25 Jun 2019 23:40:33 -0400
Message-Id: <20190626034117.23247-17-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626034117.23247-1-sashal@kernel.org>
References: <20190626034117.23247-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561520518;
 bh=0T6x30Mb7rcEkAoYggXrp5pmG6ocNITkX5Dryxz2IyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hqNgzF21gYwkcQbLGssTPjF8mTYdjfMEDekWUj6X0lX1P+l+9+j8YQ7NNxMzyecQ4
 GZCo0pmEyYJ6XIdV1np2+skbzSJJLnoh5sAZtZZ1OjkOZ1U1psTHoXktnXMeTQmSUS
 XZWpHGfGFE31Da2GQ3K5weaKbwHOW1GfO34gbWfQ=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVhbSBjb21t
aXQgY2Y0OWIyNGZmYTYyNzY2ZjhmMDRjZDFjNGNmMTdiNzVkMjliMjQwYSBdCgpzaHV0ZG93biBh
bGwgQ1JUQyB3aGVuIHVuYmluZGluZyBkcm0gZHJpdmVyLgoKRml4ZXM6IDExOWY1MTczNjI4YSAo
ImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikK
U2lnbmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPgpTaWduZWQt
b2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKaW5kZXggZTczNjJiZGFmYTgyLi44NzE4ZDEy
M2NjYWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC0zMTEsNiAr
MzExLDcgQEAgc3RhdGljIGludCBtdGtfZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0pCiBzdGF0aWMgdm9pZCBtdGtfZHJtX2ttc19kZWluaXQoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSkKIHsKIAlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKKwlkcm1fYXRvbWljX2hlbHBl
cl9zaHV0ZG93bihkcm0pOwogCiAJY29tcG9uZW50X3VuYmluZF9hbGwoZHJtLT5kZXYsIGRybSk7
CiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
