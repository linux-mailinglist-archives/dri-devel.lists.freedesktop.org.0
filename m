Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9D8A43DF
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 18:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF9C1120E0;
	Sun, 14 Apr 2024 16:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vJns8/57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47091120DC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Apr 2024 16:36:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 315E560B99;
 Sun, 14 Apr 2024 16:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815F0C32783;
 Sun, 14 Apr 2024 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713112614;
 bh=FAuYOIrTLgKRaRcSRARSU7zwjltAT4O+9HdDJwuD8ag=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vJns8/57ERxdLuquGGs0ZVc2oUuWC2VralonWNd8YTD/YSVwkzSxsOTfINZj89z1Z
 /Qscc/gpKeaqB5ZdK614E1pgQZk0p/hu5FQd82puJyxY9qiX0sM8Wfl6vzhnz7cO8t
 BVoYeHeMeFQwC9GtHROIOGGxhcEZj/KkCEXKPljOagTpfxYZghk+cGNYOI6+wNVVCq
 tGKkw3pI58jtcC+A6nbn/ksup4vqfnxbuam5Ye+UCIbMP/6+lm+Ux9wom7gr5WW4Vc
 prJuv/SNZ3B4gy+KahcEmdggcRzy+9U+e+507dmVkWDichrh2s1nMP+sRzv/bYYiO1
 yrimmWk+jVJ4Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 18:36:04 +0200
Subject: [PATCH 06/18] backlight: ili9320: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=749; i=krzk@kernel.org;
 h=from:subject:message-id; bh=FAuYOIrTLgKRaRcSRARSU7zwjltAT4O+9HdDJwuD8ag=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHAX4uTf50/e5WzpwRZXFIhHsruOa+96lTtLda
 uXa+GcN/E2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwF+AAKCRDBN2bmhouD
 1+OVD/0THs/Cz2UP+kdGP9h4rjM0ye8ChOEfbSBRSP5rdKoTYcydrMRVV/GuKPWw9mfpjY5ZHUy
 ub+uUBXwv4cdy+KU3N756O2qBkgxVYKz/tQ4rGC4isAHbmUppPN3Y6ICwX5fyXRbgdsCrk5otKg
 LkpoM4bBVzr2Hv88ZDEqAyOkhenTjlhddmzjjKQsoAt6VBWn0UEWZlbA88zKjFUOnZ2dENdFf5Y
 RhUbb+OqhyM5mqyXZ9gHDVpuxtwV34kAHEGzPq7G5w4I6GOcZTO0Hv9Xpj/M4tFxEqgZ+yDM4t/
 eHlRpc6WCoU9fkqatFxThhvYM6Y0FnLDPvn3HJ/fj+LXbsYKMHKtUM9IGWL9OeIhb2o+BG7o6F2
 V3AFljgHqYvqzm1w3sNhQ9BwRscfGho9HM6jOxYkWzOTd0WiVXgKGVWFqZQ1KcgJ/u0aqV9J3lM
 6wQHTK64pPF4PjC9ZGT8ZoArU5koJ7hIP7hQ1Ug6PMkQmWWroGdFcQLPEMHxNbcaar9NFOBPdzm
 XbI/jVXQa1n3TUQVYkdkhcGvqN5sYOJmGrYz1GOKfpddMuOlYTv9DKGj6HDIllJ+3+3cCzSz8b2
 7yYcGNtvqUoZD4QdQrpAANp9eIyFK1MmQ+4qGocUqx9jMot5LVhgVXDur1JX0sLShdC7Xjp8ol6
 yAosqP5p7RW+PBQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'struct lcd_ops' is not modified by core backlight code, so it can be
made const for increased code safety.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/ili9320.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ili9320.c b/drivers/video/backlight/ili9320.c
index 2acd2708f8ca..3e318d1891b6 100644
--- a/drivers/video/backlight/ili9320.c
+++ b/drivers/video/backlight/ili9320.c
@@ -161,7 +161,7 @@ static int ili9320_get_power(struct lcd_device *ld)
 	return lcd->power;
 }
 
-static struct lcd_ops ili9320_ops = {
+static const struct lcd_ops ili9320_ops = {
 	.get_power	= ili9320_get_power,
 	.set_power	= ili9320_set_power,
 };

-- 
2.34.1

