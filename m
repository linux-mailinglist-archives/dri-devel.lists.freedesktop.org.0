Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F713159BA
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B46789D5B;
	Tue,  7 May 2019 05:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E0C89C60
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:40:58 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21AF52087F;
 Tue,  7 May 2019 05:40:57 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 82/95] drm/rockchip: fix for mailbox read
 validation.
Date: Tue,  7 May 2019 01:38:11 -0400
Message-Id: <20190507053826.31622-82-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207657;
 bh=1ldGnMoVIE7IfFksfZrcv0xOBczTvmrB4Lnn1lZl4ws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VGPSZrDyvWWtQbWcZmKQMw7Urg1U3p72VXFB2u2VXt8xVWhk3xSwAKJYLm9Jl+sLY
 78HkcdI8+BVpqRld+BBkUpVOVdmE/oPUIczUfMbgaFQrdH6eWwh0kqm8LNUPAls7fh
 KSZtK0CmsUt/w+lT8gFR8lFZZkP+bGYJvw67VCW0=
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
Cc: Sasha Levin <alexander.levin@microsoft.com>,
 linux-rockchip@lists.infradead.org, Damian Kos <dkos@cadence.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFtaWFuIEtvcyA8ZGtvc0BjYWRlbmNlLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGU0
MDU2YmJiNjcxOWZlNzEzYmZjNDAzMGFjNzhlOGU5N2RkZjc1NzQgXQoKVGhpcyBpcyBiYXNpY2Fs
bHkgdGhlIHNhbWUgZml4IGFzIGluCmNvbW1pdCBmYTY4ZDRmODQ3NmIgKCJkcm0vcm9ja2NoaXA6
IGZpeCBmb3IgbWFpbGJveCByZWFkIHNpemUiKQpidXQgZm9yIGNkbl9kcF9tYWlsYm94X3ZhbGlk
YXRlX3JlY2VpdmUgZnVuY3Rpb24uCgpTZWUgcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2
NzE5ODEvIGZvciBkZXRhaWxzLgoKU2lnbmVkLW9mZi1ieTogRGFtaWFuIEtvcyA8ZGtvc0BjYWRl
bmNlLmNvbT4KU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4K
TGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzE1NDI2
NDA0NjMtMTgzMzItMS1naXQtc2VuZC1lbWFpbC1ka29zQGNhZGVuY2UuY29tClNpZ25lZC1vZmYt
Ynk6IFNhc2hhIExldmluIDxhbGV4YW5kZXIubGV2aW5AbWljcm9zb2Z0LmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLXJlZy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL2Nkbi1kcC1yZWcuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4t
ZHAtcmVnLmMKaW5kZXggMGVkN2U5MTQ3MWY2Li40ZGYyMDFkMjFmMjcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtcmVnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JvY2tjaGlwL2Nkbi1kcC1yZWcuYwpAQCAtMTEzLDcgKzExMyw3IEBAIHN0YXRpYyBpbnQgY2Rw
X2RwX21haWxib3hfd3JpdGUoc3RydWN0IGNkbl9kcF9kZXZpY2UgKmRwLCB1OCB2YWwpCiAKIHN0
YXRpYyBpbnQgY2RuX2RwX21haWxib3hfdmFsaWRhdGVfcmVjZWl2ZShzdHJ1Y3QgY2RuX2RwX2Rl
dmljZSAqZHAsCiAJCQkJCSAgIHU4IG1vZHVsZV9pZCwgdTggb3Bjb2RlLAotCQkJCQkgICB1OCBy
ZXFfc2l6ZSkKKwkJCQkJICAgdTE2IHJlcV9zaXplKQogewogCXUzMiBtYm94X3NpemUsIGk7CiAJ
dTggaGVhZGVyWzRdOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
