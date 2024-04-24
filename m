Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0118B01F1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A342113857;
	Wed, 24 Apr 2024 06:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HsIwK7G0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B761113857
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DEA660B98;
 Wed, 24 Apr 2024 06:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5920DC32781;
 Wed, 24 Apr 2024 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713940558;
 bh=TlUGfQe5SGDRa6cwwzTDSZ6FsJSUi6EsphJ+q93qN/Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HsIwK7G0yXnAxxyfQ+wQcwoQk/4yUS2LdPH4FKJGrWzlciwhAtdBVg95x/JPzAfRW
 aJVhOqs8jJvTYuNRI2PtP/7yQ9hYP7kZ8k5zhcYSccGepWoxYyYtmMdPnp4AKzQc9x
 wmVS3bhjvQlIEmQZl+KJmYsC99TeutGTS/VSS8UDd1FpL4Fi/m33M69345wvNGpjBR
 JXaQlB4xjH/YcCeep4/x+bevEvzYb8GKJsshafPEWh4EW4ZPqtwngZPajMscSgvjDM
 qBcRZvIXVLdUE3ghRApjYr+FteiZrt2rlH/rZ42LsX6MH63uXurG3MjBJBH2iH8PC3
 qn7a1dWl3JLiA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 24 Apr 2024 08:33:40 +0200
Subject: [PATCH v2 14/19] backlight: tdo24m: Constify lcd_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-video-backlight-lcd-ops-v2-14-1aaa82b07bc6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=krzk@kernel.org;
 h=from:subject:message-id; bh=TlUGfQe5SGDRa6cwwzTDSZ6FsJSUi6EsphJ+q93qN/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmKKfpYdEeSv3NcL65O52Q6sWA40KLmS3LlypmM
 OWgoUME4sOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZiin6QAKCRDBN2bmhouD
 1xsTEACQ1ir52MqKvyLooUpgZ69W7Vwikg8JCHqlcoiyVcgCWdpUzZt5PSobFmBfGYPOBT3CtrE
 6AKdHck9Bcl9qlJIYFWc8H6WmpVpJ7uyO7b5fFhyHQmohr/Jjebk2BkiD+RiT7moRTXQbcSHU/X
 BK26dGd9VuLqr/fAyrVu1byw0k+ker7bphkHXrCPEm8BH/VZtxCjptsjm/Wf0PQ5oT87Uq6kvUo
 +Rgix6XL4qmAn9Drge+Wg0oK4siwsa7IbJgmee+ZRoGDIUFX3fwRYBakJxzCiElYIHUwL78s8Tk
 XaJNZkfYdiPEunSClGsmL0wC1uqE/Rq+5vkjMlzHkkVIboJKGVOxfAmBRJ2k7WPs6AqLhdmuBiX
 RxTAPgC9DhnleQBOygAchT748699qwddqkjB9xJs+811kV4fy+JenWmaFF0TAP/gViuDM8o2fag
 1spjPgvbjPE88zBZcwXIu2PCzGgxbDt0K2wMKX27jexKjl1k/pKqEvVeJ3cAxN+Dmtw7Qk67jbb
 8xAoutLG5wjGC6AlmmE4Hd/oFBq6b/EnWPzc1we+iH8RbeBnLoxViR10wH//2pm1DWv7XprURiG
 3Jrl+u17N9mH0f5b1BjoPUrfjp2iAtquui3kHbzgLBBzyOTe9TY9rnJB5DikjW0Vn/nV1/VitcY
 X7HBISQB3Eu9csA==
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
 drivers/video/backlight/tdo24m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/tdo24m.c b/drivers/video/backlight/tdo24m.c
index fc6fbaf85594..c413b3c68e95 100644
--- a/drivers/video/backlight/tdo24m.c
+++ b/drivers/video/backlight/tdo24m.c
@@ -322,7 +322,7 @@ static int tdo24m_set_mode(struct lcd_device *ld, struct fb_videomode *m)
 	return lcd->adj_mode(lcd, mode);
 }
 
-static struct lcd_ops tdo24m_ops = {
+static const struct lcd_ops tdo24m_ops = {
 	.get_power	= tdo24m_get_power,
 	.set_power	= tdo24m_set_power,
 	.set_mode	= tdo24m_set_mode,

-- 
2.43.0

