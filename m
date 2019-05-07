Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D221594F
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778EF89A74;
	Tue,  7 May 2019 05:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B1F89A74
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:35:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C00C2087F;
 Tue,  7 May 2019 05:35:51 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 99/99] drm/rockchip: fix for mailbox read
 validation.
Date: Tue,  7 May 2019 01:32:33 -0400
Message-Id: <20190507053235.29900-99-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207352;
 bh=yQogMUBQPjk9nrgNv1yeng0T8x7R0pvQDhEzCVBPASc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BG579wH5o7r5gSH7s420RRjjYkl1Sgn7Txz9Vqaf7Beo3lpPHqz9+zYO53lG6Th5b
 mKURfxOHTRgXYAV2oZiQwLfz0qWiyBTaJweliLZsrilbVKOwKWfKpFhzqI7FntspAn
 /Gt9jkU91ca98AIVNmptMzF6lUCPYUJRNHvv+uzM=
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
ZHAtcmVnLmMKaW5kZXggNWE0ODU0ODlhMWUyLi42YzhiMTRmYjFkMmYgMTAwNjQ0Ci0tLSBhL2Ry
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
