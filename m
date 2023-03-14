Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB36B9B67
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6510E038;
	Tue, 14 Mar 2023 16:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B1C10E038
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:27:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68E0161853;
 Tue, 14 Mar 2023 16:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6338FC433D2;
 Tue, 14 Mar 2023 16:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678811246;
 bh=0BszSclPkYdHyPcXZhoiYKeed+oHxWdTrNdyBbP781U=;
 h=From:To:Cc:Subject:Date:From;
 b=jv09Olof29476Ze1LNP0JHkAenz7t5P4LXFqp9DIzK4pctMbjFjdXB9aijuL0rrNH
 FOmtxnJMPnag6Y/JPO5AojOKd1HfUYV0RnR2oPIIUQUkZmf5FMeKyWc18G/I2uOtZ+
 F96gvwk8KMmgA0y2SctEWEXeOiFG+KiUT+Fk7Ff0iJ0AHvih4GZpIYo1WzDoHk8Zkv
 8Xf+OQ5l5K9PftoN+sUlCO69HJvbFtnlqyEXPsW9HvCz5e0l5/LFVGmm2K6TorIlwQ
 nGGZi9xJnrHPNq5MmOqG4Gf6pgLowWuDLp4kMrnfFMa5NyvdRPTlIxHBKSJHfkAiEl
 JO8QiE8oci8OA==
From: Arnd Bergmann <arnd@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: omapfb: remove omap1 osk driver
Date: Tue, 14 Mar 2023 17:27:10 +0100
Message-Id: <20230314162720.759220-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Commit 21a3e6eed423 ("ARM: omap1: remove osk-mistral add-on board
support") removed the platform_device definition for the "lcd_osk"
device, so this driver is now unused and can be removed as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap/Makefile  |  1 -
 drivers/video/fbdev/omap/lcd_osk.c | 86 ------------------------------
 2 files changed, 87 deletions(-)
 delete mode 100644 drivers/video/fbdev/omap/lcd_osk.c

diff --git a/drivers/video/fbdev/omap/Makefile b/drivers/video/fbdev/omap/Makefile
index 504edb9c09dd..6d5082c76919 100644
--- a/drivers/video/fbdev/omap/Makefile
+++ b/drivers/video/fbdev/omap/Makefile
@@ -18,7 +18,6 @@ objs-y$(CONFIG_FB_OMAP_LCDC_HWA742) += hwa742.o
 
 lcds-y$(CONFIG_MACH_AMS_DELTA) += lcd_ams_delta.o
 lcds-y$(CONFIG_MACH_OMAP_PALMTE) += lcd_palmte.o
-lcds-y$(CONFIG_MACH_OMAP_OSK) += lcd_osk.o
 
 lcds-y$(CONFIG_FB_OMAP_LCD_MIPID) += lcd_mipid.o
 
diff --git a/drivers/video/fbdev/omap/lcd_osk.c b/drivers/video/fbdev/omap/lcd_osk.c
deleted file mode 100644
index 8168ba0d47fd..000000000000
--- a/drivers/video/fbdev/omap/lcd_osk.c
+++ /dev/null
@@ -1,86 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * LCD panel support for the TI OMAP OSK board
- *
- * Copyright (C) 2004 Nokia Corporation
- * Author: Imre Deak <imre.deak@nokia.com>
- * Adapted for OSK by <dirk.behme@de.bosch.com>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/gpio.h>
-
-#include <linux/soc/ti/omap1-io.h>
-#include <linux/soc/ti/omap1-mux.h>
-
-#include "omapfb.h"
-
-static int osk_panel_enable(struct lcd_panel *panel)
-{
-	/* configure PWL pin */
-	omap_cfg_reg(PWL);
-
-	/* Enable PWL unit */
-	omap_writeb(0x01, OMAP_PWL_CLK_ENABLE);
-
-	/* Set PWL level */
-	omap_writeb(0xFF, OMAP_PWL_ENABLE);
-
-	/* set GPIO2 high (lcd power enabled) */
-	gpio_set_value(2, 1);
-
-	return 0;
-}
-
-static void osk_panel_disable(struct lcd_panel *panel)
-{
-	/* Set PWL level to zero */
-	omap_writeb(0x00, OMAP_PWL_ENABLE);
-
-	/* Disable PWL unit */
-	omap_writeb(0x00, OMAP_PWL_CLK_ENABLE);
-
-	/* set GPIO2 low */
-	gpio_set_value(2, 0);
-}
-
-static struct lcd_panel osk_panel = {
-	.name		= "osk",
-	.config		= OMAP_LCDC_PANEL_TFT,
-
-	.bpp		= 16,
-	.data_lines	= 16,
-	.x_res		= 240,
-	.y_res		= 320,
-	.pixel_clock	= 12500,
-	.hsw		= 40,
-	.hfp		= 40,
-	.hbp		= 72,
-	.vsw		= 1,
-	.vfp		= 1,
-	.vbp		= 0,
-	.pcd		= 12,
-
-	.enable		= osk_panel_enable,
-	.disable	= osk_panel_disable,
-};
-
-static int osk_panel_probe(struct platform_device *pdev)
-{
-	omapfb_register_panel(&osk_panel);
-	return 0;
-}
-
-static struct platform_driver osk_panel_driver = {
-	.probe		= osk_panel_probe,
-	.driver		= {
-		.name	= "lcd_osk",
-	},
-};
-
-module_platform_driver(osk_panel_driver);
-
-MODULE_AUTHOR("Imre Deak");
-MODULE_DESCRIPTION("LCD panel support for the TI OMAP OSK board");
-MODULE_LICENSE("GPL");
-- 
2.39.2

