Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88CE8B01E8
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A410113853;
	Wed, 24 Apr 2024 06:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U5MdHish";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF6F113853
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1C3A61890;
 Wed, 24 Apr 2024 06:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7EEC2BD11;
 Wed, 24 Apr 2024 06:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940529;
 bh=Fx9+dUHugEQySUivGavZSc1jQG9pzqOGcKVq50f7j2k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=U5MdHishgJ7jQagQc0oTt3q1QOqH2/YaBbWOsX/kSypATFN6H2FDXnXnce+5Qt8ma
 bQuYpEM/YxQ0hc0YY0vYeb494KBDiE9FkvGNNNKHtvwP21IB7Pvk/WSr/qlMq4bzJ9
 brtVSf1klRCkbmWsXOgGcrje1XjF6IyxaY9dChM83od3NikWEe3xKOVIBj8LaLr4+m
 adXWN4wUE3QuN93zxStXYJqZvjanr2Ir7HUAdIjrTKc9Yn1HQM5NY6TCP9B1sB7NA4
 kJ8zBLp3p69hUMRqpY+Ehu3xn/KGFa20+gGISmMEpRF0IBMx3GEYk17ktnue6AMo7U
 OaYmhuIroIuug==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:36 +0200
Subject: [PATCH v2 10/19] backlight: lms501kf03: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-10-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=krzk@kernel.org;
 h=from:subject:message-id; bh=Fx9+dUHugEQySUivGavZSc1jQG9pzqOGcKVq50f7j2k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfmegAveF22d8Ic3BYkt029VxOLUxwbx0Erk
 cyS30bVh9iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin5gAKCRDBN2bmhouD
 1/mEEACTdRL9YoPeEkKv/321ctqh2JcRaDVJvy4M/Z0yDp64Bjc8Ge/LNAUdYGKFaNA999LVNIb
 bQnlLpyj++sZITizJiSMmWzmzKOarsz9C/kdLgkyBw0iJB0jZvxMonKKpNZeG6ILnHqh3ztwbvh
 4rOkavZXKswgw/0Qzy8M47HoJVs84v/xs26CUs+beDV4iDxbWV9VuKL9dC5UEhavZA6cLiDGXmE
 XHRTtYJT+bMhneRxXMSjwp/miVymK23j7b6gsPVA8P173TUGf7nDd8WCD5CsJkbAzm6lnRX1287
 VxkbGRENRt3waOXqhIu/7AqUoG3H7/cEnNL442qZwvN6/JHxd7zpaFH28Lo25TVL5cu/LXLk3VA
 bEExJIzJ2QEG9HKP9qWZV1aGkQ6ncrAA3idx++XvoNwIUBz4tcS36PWuTIPZxHNnFEA3NUV0reX
 2BRxaGs/6gD5WxOn00pIrfU8f6OUSALhMmRwypItHFOUV7BcYIwmeplzF+StNmMHtKpCJoN0b/0
 KDU18UcqJBK9X6kzV/rf21rDci8Femxz3FnboR3Se4D3K/7VbYZ4SjAx336swksupEIzfFSnmfH
 GA+ZiA/9w0p+ZLmr8rfq8orfRxv5w7KlqNQieD+t79zNYAtrPnlOopk+vDPsLUo1JAGuMaAEF9U
 2dVimO3LQyq0JAw==
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
 drivers/video/backlight/lms501kf03.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lms501kf03.c b/drivers/video/backlight/lms501kf03.c
index 5c46df8022bf..8aebe0af3391 100644
--- a/drivers/video/backlight/lms501kf03.c
+++ b/drivers/video/backlight/lms501kf03.c
@@ -304,7 +304,7 @@ static int lms501kf03_set_power(struct lcd_device *ld, int power)
 	return lms501kf03_power(lcd, power);
 }
 
-static struct lcd_ops lms501kf03_lcd_ops = {
+static const struct lcd_ops lms501kf03_lcd_ops = {
 	.get_power = lms501kf03_get_power,
 	.set_power = lms501kf03_set_power,
 };

-- 
2.43.0

