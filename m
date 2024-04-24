Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314E8B01D9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0AC11384C;
	Wed, 24 Apr 2024 06:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dqrR4Hk3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B9A11384C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B79AF61883;
 Wed, 24 Apr 2024 06:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FEDC113CE;
 Wed, 24 Apr 2024 06:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940500;
 bh=YZlYLaxPYk3nyqOYpuqvAaTwYZ4ZvDN/y6m4aXvtTU8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dqrR4Hk3AfhL9dG5IDtZLQ7W25m83QMZA7ZvZXzSZPk8q99BTjFP/G90pE03RLpbJ
 M5blgJafEP/qHgJwlZsqcLRZkwEes6QN9sxL9rWKXTtL9LxbgETTPghhmwcRQUBA1o
 pqIApON21iJEa8rHq2IdzhwTvqME2+hoAkRI53xsdrQxvDdruWMMi5c6ZazkJC+PDC
 xPM45v3IjuumO9E20A0xsMkVLU6w+FxscPMBBFGTI0gUvl2lp1oapkDdxwvaKLem7V
 5j+rvQgJJvJvVb+P9RZ3OjF92Qkaxr95HAjgt+XKkdoOFzpDk88rtI/lVHTgc987j7
 pbDDcqRhwTCHQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:31 +0200
Subject: [PATCH v2 05/19] backlight: ili922x: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-5-1aaa82b07bc6@kernel.org>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=krzk@kernel.org;
 h=from:subject:message-id; bh=YZlYLaxPYk3nyqOYpuqvAaTwYZ4ZvDN/y6m4aXvtTU8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfhgGsv78rY4HeV9nGk1ebwCmUiNzNHKtsIK
 1o5gFohSMWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin4QAKCRDBN2bmhouD
 16/hD/9UQVoOdTBB9i8W49tHr/wJHWKoccJ1BwWLjp1+K8JmAZHWznGmk0pi3BdJ/N4YyWIiFCe
 +TDcbG+u0nHLnLCZDeXOGFasx+b6MKd5DMy2dMRiwwjmcW3N39IlUpmp2tpLsHOOrHeOPWTPjSD
 YHJZtB15YdLio+riVlxGL/FrqT2aJF8+ScdzYb1SU8hMsMYR7oXPepVg1mJC54QVUv0pAi68bb1
 tRtiAR3DerQbOauG0XPp4NBtLKKu4ZQUiFXomqRpQbEOJi29l31hOLa6CsiYQKqtAV7HOtdxgEd
 QLYKAseBkmvDg0r23EOLM+USyHagW2dMSJDeGtA3IBUpW+VijJ/4HS4wnuGnOQhy3I2Qv4tlFxz
 ruWU9sWEqiPyZo/AuJYIOfUKzr9od8D+3nIWFiVOLBk7jKdOVJC3Ceo7nZyIo9AQ2k1dL7a7+pA
 xv+OX99Zik7aeDMWtk+/t4e0/l3dTkFtPk+/l42+Vgr3sOIsEaOOyWOePVNAv2l/N7qEthXepqi
 ysOGJwgsn6/2nwqgEZuuK+7SUtU08XytBptOlLPxNk9Cs5dYkbfHMXICSESMJ8fqjuXT0xY8CWP
 BWMY3MrSi9/S5nmfL4WJL7hS2PoFvr+jhCEmTK4/lLZpD1x/KhwqoLTYjp4GxTQ3vKqZAKaqU/g
 m3oVQnX8srkeuFg==
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/video/backlight/ili922x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index c8e0e655dc86..7683e209ad6b 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -472,7 +472,7 @@ static int ili922x_get_power(struct lcd_device *ld)
 	return ili->power;
 }
 
-static struct lcd_ops ili922x_ops = {
+static const struct lcd_ops ili922x_ops = {
 	.get_power = ili922x_get_power,
 	.set_power = ili922x_set_power,
 };

-- 
2.43.0

