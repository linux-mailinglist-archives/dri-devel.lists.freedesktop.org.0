Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7842FBCC9E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710296EA4B;
	Tue, 24 Sep 2019 16:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3E96EA4A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:41:47 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5885214AF;
 Tue, 24 Sep 2019 16:41:46 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 02/87] drm/mcde: Fix uninitialized variable
Date: Tue, 24 Sep 2019 12:40:18 -0400
Message-Id: <20190924164144.25591-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343307;
 bh=JJiAr0U+y5fK3GJTz/G2EY+1qfyIBZP/h1D8Vy3Euz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ubed0fei0sVyT65EoNcGl98TW5U5ab6fteJYCRgkYx65ZfJ6Mq1hMMNdu2sn0bdhK
 nFwsMzyY9oS1fPKLC6FC8zkZRAwPKovGOaKepi9Min1aApm7mkEymuw5lt3seCyVob
 6wqpr+l2H021tquwaQrDNl35PzJJ8hAII5OMFahk=
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
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWyBVcHN0cmVh
bSBjb21taXQgY2E1YmU5MDJhODdkZGNjYzg4MTQ0ZjJkZWEyMWI1ZjA4MTQzOTFlZiBdCgpXZSBu
ZWVkIHRvIGhhbmRsZSB0aGUgY2FzZSB3aGVuIG9mX2RybV9maW5kX2JyaWRnZSgpIHJldHVybnMK
TlVMTC4KClJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+CkFja2VkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+ClNp
Z25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KTGlu
azogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE4
MTE1MjQ1LjEzOTE1LTEtbGludXMud2FsbGVpakBsaW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWNkZS9t
Y2RlX2Rydi5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwppbmRleCBiYWY2M2ZiNjg1MGE0Li5h
ODEwNTY4Yzc2ZGY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKQEAgLTMxOSw3ICszMTksNyBA
QCBzdGF0aWMgaW50IG1jZGVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07
CiAJc3RydWN0IG1jZGUgKm1jZGU7Ci0Jc3RydWN0IGNvbXBvbmVudF9tYXRjaCAqbWF0Y2g7CisJ
c3RydWN0IGNvbXBvbmVudF9tYXRjaCAqbWF0Y2ggPSBOVUxMOwogCXN0cnVjdCByZXNvdXJjZSAq
cmVzOwogCXUzMiBwaWQ7CiAJdTMyIHZhbDsKQEAgLTQ4NSw2ICs0ODUsMTAgQEAgc3RhdGljIGlu
dCBtY2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCX0KIAkJcHV0X2Rl
dmljZShwKTsKIAl9CisJaWYgKCFtYXRjaCkgeworCQlkZXZfZXJyKGRldiwgIm5vIG1hdGNoaW5n
IGNvbXBvbmVudHNcbiIpOworCQlyZXR1cm4gLUVOT0RFVjsKKwl9CiAJaWYgKElTX0VSUihtYXRj
aCkpIHsKIAkJZGV2X2VycihkZXYsICJjb3VsZCBub3QgY3JlYXRlIGNvbXBvbmVudCBtYXRjaFxu
Iik7CiAJCXJldCA9IFBUUl9FUlIobWF0Y2gpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
