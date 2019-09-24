Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2435BCDDA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C134E6EAC7;
	Tue, 24 Sep 2019 16:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4306F6EABE;
 Tue, 24 Sep 2019 16:51:39 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 623BF222BF;
 Tue, 24 Sep 2019 16:51:38 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 04/19] gpu: drm: radeon: Fix a possible
 null-pointer dereference in radeon_connector_set_property()
Date: Tue, 24 Sep 2019 12:51:15 -0400
Message-Id: <20190924165130.28625-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924165130.28625-1-sashal@kernel.org>
References: <20190924165130.28625-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343899;
 bh=eIVYCmBoQuGrbToR78lQuZGyISQWFjO/9AvUGHo61Xw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sFavR0qzCmfQoNuoZYR+q0Y45cwANtxx6Zuvpd2HZuZEjo2VS0rLfKPWvGdOC4ol0
 WFoZoPfWYqZp5ZwV3bLz8aUGssL8/GwI/L+OjgIOv2w7/TW1vKzm6MVs6PVQ46V3Hw
 TVbWxL+b3wmcd+GmVajQfijvUdw3qAHGX6W5ToPY=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmlhLUp1IEJhaSA8YmFpamlhanUxOTkwQGdtYWlsLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IGYzZWI5YjhmNjdiYzI4NzgzZWRkYzE0MmFkODA1ZWJkYzUzZDYzMzkgXQoKSW4gcmFkZW9u
X2Nvbm5lY3Rvcl9zZXRfcHJvcGVydHkoKSwgdGhlcmUgaXMgYW4gaWYgc3RhdGVtZW50IG9uIGxp
bmUgNzQzCnRvIGNoZWNrIHdoZXRoZXIgY29ubmVjdG9yLT5lbmNvZGVyIGlzIE5VTEw6CiAgICBp
ZiAoY29ubmVjdG9yLT5lbmNvZGVyKQoKV2hlbiBjb25uZWN0b3ItPmVuY29kZXIgaXMgTlVMTCwg
aXQgaXMgdXNlZCBvbiBsaW5lIDc1NToKICAgIGlmIChjb25uZWN0b3ItPmVuY29kZXItPmNydGMp
CgpUaHVzLCBhIHBvc3NpYmxlIG51bGwtcG9pbnRlciBkZXJlZmVyZW5jZSBtYXkgb2NjdXIuCgpU
byBmaXggdGhpcyBidWcsIGNvbm5lY3Rvci0+ZW5jb2RlciBpcyBjaGVja2VkIGJlZm9yZSBiZWlu
ZyB1c2VkLgoKVGhpcyBidWcgaXMgZm91bmQgYnkgYSBzdGF0aWMgYW5hbHlzaXMgdG9vbCBTVENo
ZWNrIHdyaXR0ZW4gYnkgdXMuCgpTaWduZWQtb2ZmLWJ5OiBKaWEtSnUgQmFpIDxiYWlqaWFqdTE5
OTBAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVj
aGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKaW5kZXggYzVlMWFhNWYxZDhlYS4u
ZWZhODc1MTIwMDcxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
Y29ubmVjdG9ycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYwpAQCAtNzY0LDcgKzc2NCw3IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2Nvbm5lY3Rvcl9zZXRf
cHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3Rvciwgc3RydWN0CiAKIAkJcmFk
ZW9uX2VuY29kZXItPm91dHB1dF9jc2MgPSB2YWw7CiAKLQkJaWYgKGNvbm5lY3Rvci0+ZW5jb2Rl
ci0+Y3J0YykgeworCQlpZiAoY29ubmVjdG9yLT5lbmNvZGVyICYmIGNvbm5lY3Rvci0+ZW5jb2Rl
ci0+Y3J0YykgewogCQkJc3RydWN0IGRybV9jcnRjICpjcnRjICA9IGNvbm5lY3Rvci0+ZW5jb2Rl
ci0+Y3J0YzsKIAkJCWNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MgKmNydGNfZnVu
Y3MgPSBjcnRjLT5oZWxwZXJfcHJpdmF0ZTsKIAkJCXN0cnVjdCByYWRlb25fY3J0YyAqcmFkZW9u
X2NydGMgPSB0b19yYWRlb25fY3J0YyhjcnRjKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
