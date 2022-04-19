Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D09506DA2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E364010EF0D;
	Tue, 19 Apr 2022 13:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDF510EF0D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:38:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CC0361699;
 Tue, 19 Apr 2022 13:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626C6C385B4;
 Tue, 19 Apr 2022 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375481;
 bh=Cy+wwzOaVgtjDqQCWI06PLYznih6Y2ND7QxFqe4Xpd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cTxet9qASIyT4pT7/bXgoG7K+343ypyZ3dk2jesY6LllhVU667bteRuuDsMlY1+38
 MpXUOXEEZJ1GFmvK1Wx6WWHwUEkzBncehUftqSKvdHbmu1mZlvF9uk/QSI3ydWScQY
 9164an8c0Bq2tcooKmOSSORP4/BqxFTRLl0RwGOSPJ/f8XnzC+knL6+AWXbOqxXrO9
 jT2WrNqUQlrcLED9/1qX0uSI65WM5jAAklzubs7u45qvte+7LIosfAKSCdPdO+U+yK
 aa3n07UtWnFgQdNlFXT8HmdCFVXag+AgGjv8BrQWmXVQUtFozHDJ7jeNiH6wjN8YAr
 +oetnkGXMv64A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 03/41] ARM: omap1: move lcd_dma code into omapfb driver
Date: Tue, 19 Apr 2022 15:36:45 +0200
Message-Id: <20220419133723.1394715-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The omapfb driver is split into platform specific code for omap1, and
driver code that is also specific to omap1.

Moving both parts into the driver directory simplifies the structure
and avoids the dependency on certain omap machine header files.

As mach/lcd_dma.h can not be included from include/linux/omap-dma.h
any more now, move the omap_lcd_dma_running() declaration into the
omap-dma header, which matches where it is defined.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Makefile                  |  4 --
 arch/arm/mach-omap1/include/mach/lcdc.h       | 44 -------------------
 drivers/video/fbdev/Makefile                  |  2 +-
 drivers/video/fbdev/omap/Makefile             |  5 +++
 .../video/fbdev/omap}/lcd_dma.c               |  4 +-
 .../video/fbdev/omap}/lcd_dma.h               |  2 -
 drivers/video/fbdev/omap/lcdc.c               |  2 +-
 drivers/video/fbdev/omap/lcdc.h               | 35 +++++++++++++++
 drivers/video/fbdev/omap/sossi.c              |  1 +
 include/linux/omap-dma.h                      |  4 +-
 10 files changed, 48 insertions(+), 55 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/include/mach/lcdc.h
 rename {arch/arm/mach-omap1 => drivers/video/fbdev/omap}/lcd_dma.c (99%)
 rename {arch/arm/mach-omap1/include/mach => drivers/video/fbdev/omap}/lcd_dma.h (98%)

diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
index c757a52d0801..450bbf552b57 100644
--- a/arch/arm/mach-omap1/Makefile
+++ b/arch/arm/mach-omap1/Makefile
@@ -57,7 +57,3 @@ obj-$(CONFIG_ARCH_OMAP730)		+= gpio7xx.o
 obj-$(CONFIG_ARCH_OMAP850)		+= gpio7xx.o
 obj-$(CONFIG_ARCH_OMAP15XX)		+= gpio15xx.o
 obj-$(CONFIG_ARCH_OMAP16XX)		+= gpio16xx.o
-
-ifneq ($(CONFIG_FB_OMAP),)
-obj-y += lcd_dma.o
-endif
diff --git a/arch/arm/mach-omap1/include/mach/lcdc.h b/arch/arm/mach-omap1/include/mach/lcdc.h
deleted file mode 100644
index 7152db1f5361..000000000000
--- a/arch/arm/mach-omap1/include/mach/lcdc.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * arch/arm/mach-omap1/include/mach/lcdc.h
- *
- * Extracted from drivers/video/omap/lcdc.c
- * Copyright (C) 2004 Nokia Corporation
- * Author: Imre Deak <imre.deak@nokia.com>
- */
-#ifndef __MACH_LCDC_H__
-#define __MACH_LCDC_H__
-
-#define OMAP_LCDC_BASE			0xfffec000
-#define OMAP_LCDC_SIZE			256
-#define OMAP_LCDC_IRQ			INT_LCD_CTRL
-
-#define OMAP_LCDC_CONTROL		(OMAP_LCDC_BASE + 0x00)
-#define OMAP_LCDC_TIMING0		(OMAP_LCDC_BASE + 0x04)
-#define OMAP_LCDC_TIMING1		(OMAP_LCDC_BASE + 0x08)
-#define OMAP_LCDC_TIMING2		(OMAP_LCDC_BASE + 0x0c)
-#define OMAP_LCDC_STATUS		(OMAP_LCDC_BASE + 0x10)
-#define OMAP_LCDC_SUBPANEL		(OMAP_LCDC_BASE + 0x14)
-#define OMAP_LCDC_LINE_INT		(OMAP_LCDC_BASE + 0x18)
-#define OMAP_LCDC_DISPLAY_STATUS	(OMAP_LCDC_BASE + 0x1c)
-
-#define OMAP_LCDC_STAT_DONE		(1 << 0)
-#define OMAP_LCDC_STAT_VSYNC		(1 << 1)
-#define OMAP_LCDC_STAT_SYNC_LOST	(1 << 2)
-#define OMAP_LCDC_STAT_ABC		(1 << 3)
-#define OMAP_LCDC_STAT_LINE_INT		(1 << 4)
-#define OMAP_LCDC_STAT_FUF		(1 << 5)
-#define OMAP_LCDC_STAT_LOADED_PALETTE	(1 << 6)
-
-#define OMAP_LCDC_CTRL_LCD_EN		(1 << 0)
-#define OMAP_LCDC_CTRL_LCD_TFT		(1 << 7)
-#define OMAP_LCDC_CTRL_LINE_IRQ_CLR_SEL	(1 << 10)
-
-#define OMAP_LCDC_IRQ_VSYNC		(1 << 2)
-#define OMAP_LCDC_IRQ_DONE		(1 << 3)
-#define OMAP_LCDC_IRQ_LOADED_PALETTE	(1 << 4)
-#define OMAP_LCDC_IRQ_LINE_NIRQ		(1 << 5)
-#define OMAP_LCDC_IRQ_LINE		(1 << 6)
-#define OMAP_LCDC_IRQ_MASK		(((1 << 5) - 1) << 2)
-
-#endif /* __MACH_LCDC_H__ */
diff --git a/drivers/video/fbdev/Makefile b/drivers/video/fbdev/Makefile
index 477b9624b703..7795c4126706 100644
--- a/drivers/video/fbdev/Makefile
+++ b/drivers/video/fbdev/Makefile
@@ -110,7 +110,7 @@ obj-$(CONFIG_FB_UDL)		  += udlfb.o
 obj-$(CONFIG_FB_SMSCUFX)	  += smscufx.o
 obj-$(CONFIG_FB_XILINX)           += xilinxfb.o
 obj-$(CONFIG_FB_SH_MOBILE_LCDC)	  += sh_mobile_lcdcfb.o
-obj-$(CONFIG_FB_OMAP)             += omap/
+obj-y				  += omap/
 obj-y                             += omap2/
 obj-$(CONFIG_XEN_FBDEV_FRONTEND)  += xen-fbfront.o
 obj-$(CONFIG_FB_CARMINE)          += carminefb.o
diff --git a/drivers/video/fbdev/omap/Makefile b/drivers/video/fbdev/omap/Makefile
index daaa73a94e7f..b88e02f5cb1f 100644
--- a/drivers/video/fbdev/omap/Makefile
+++ b/drivers/video/fbdev/omap/Makefile
@@ -5,6 +5,11 @@
 
 obj-$(CONFIG_FB_OMAP) += omapfb.o
 
+ifdef CONFIG_FB_OMAP
+# must be built-in
+obj-y += lcd_dma.o
+endif
+
 objs-yy := omapfb_main.o lcdc.o
 
 objs-y$(CONFIG_FB_OMAP_LCDC_EXTERNAL) += sossi.o
diff --git a/arch/arm/mach-omap1/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
similarity index 99%
rename from arch/arm/mach-omap1/lcd_dma.c
rename to drivers/video/fbdev/omap/lcd_dma.c
index a72ac0c02b4f..867a63c06f42 100644
--- a/arch/arm/mach-omap1/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -26,7 +26,9 @@
 #include <linux/omap-dma.h>
 
 #include <mach/hardware.h>
-#include <mach/lcdc.h>
+
+#include "lcdc.h"
+#include "lcd_dma.h"
 
 int omap_lcd_dma_running(void)
 {
diff --git a/arch/arm/mach-omap1/include/mach/lcd_dma.h b/drivers/video/fbdev/omap/lcd_dma.h
similarity index 98%
rename from arch/arm/mach-omap1/include/mach/lcd_dma.h
rename to drivers/video/fbdev/omap/lcd_dma.h
index 1a3c0cf17899..1b4780197381 100644
--- a/arch/arm/mach-omap1/include/mach/lcd_dma.h
+++ b/drivers/video/fbdev/omap/lcd_dma.h
@@ -60,6 +60,4 @@ extern void omap_set_lcd_dma_b1_vxres(unsigned long vxres);
 extern void omap_set_lcd_dma_b1_mirror(int mirror);
 extern void omap_set_lcd_dma_b1_scale(unsigned int xscale, unsigned int yscale);
 
-extern int omap_lcd_dma_running(void);
-
 #endif /* __MACH_OMAP1_LCD_DMA_H__ */
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index 7317c9aad677..d9a23f6cf7fc 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -17,7 +17,6 @@
 #include <linux/clk.h>
 #include <linux/gfp.h>
 
-#include <mach/lcdc.h>
 #include <linux/omap-dma.h>
 
 #include <asm/mach-types.h>
@@ -25,6 +24,7 @@
 #include "omapfb.h"
 
 #include "lcdc.h"
+#include "lcd_dma.h"
 
 #define MODULE_NAME			"lcdc"
 
diff --git a/drivers/video/fbdev/omap/lcdc.h b/drivers/video/fbdev/omap/lcdc.h
index 8a7607d861c1..cbbfd9b9e949 100644
--- a/drivers/video/fbdev/omap/lcdc.h
+++ b/drivers/video/fbdev/omap/lcdc.h
@@ -1,6 +1,41 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef LCDC_H
 #define LCDC_H
+/*
+ * Copyright (C) 2004 Nokia Corporation
+ * Author: Imre Deak <imre.deak@nokia.com>
+ */
+#define OMAP_LCDC_BASE			0xfffec000
+#define OMAP_LCDC_SIZE			256
+#define OMAP_LCDC_IRQ			INT_LCD_CTRL
+
+#define OMAP_LCDC_CONTROL		(OMAP_LCDC_BASE + 0x00)
+#define OMAP_LCDC_TIMING0		(OMAP_LCDC_BASE + 0x04)
+#define OMAP_LCDC_TIMING1		(OMAP_LCDC_BASE + 0x08)
+#define OMAP_LCDC_TIMING2		(OMAP_LCDC_BASE + 0x0c)
+#define OMAP_LCDC_STATUS		(OMAP_LCDC_BASE + 0x10)
+#define OMAP_LCDC_SUBPANEL		(OMAP_LCDC_BASE + 0x14)
+#define OMAP_LCDC_LINE_INT		(OMAP_LCDC_BASE + 0x18)
+#define OMAP_LCDC_DISPLAY_STATUS	(OMAP_LCDC_BASE + 0x1c)
+
+#define OMAP_LCDC_STAT_DONE		(1 << 0)
+#define OMAP_LCDC_STAT_VSYNC		(1 << 1)
+#define OMAP_LCDC_STAT_SYNC_LOST	(1 << 2)
+#define OMAP_LCDC_STAT_ABC		(1 << 3)
+#define OMAP_LCDC_STAT_LINE_INT		(1 << 4)
+#define OMAP_LCDC_STAT_FUF		(1 << 5)
+#define OMAP_LCDC_STAT_LOADED_PALETTE	(1 << 6)
+
+#define OMAP_LCDC_CTRL_LCD_EN		(1 << 0)
+#define OMAP_LCDC_CTRL_LCD_TFT		(1 << 7)
+#define OMAP_LCDC_CTRL_LINE_IRQ_CLR_SEL	(1 << 10)
+
+#define OMAP_LCDC_IRQ_VSYNC		(1 << 2)
+#define OMAP_LCDC_IRQ_DONE		(1 << 3)
+#define OMAP_LCDC_IRQ_LOADED_PALETTE	(1 << 4)
+#define OMAP_LCDC_IRQ_LINE_NIRQ		(1 << 5)
+#define OMAP_LCDC_IRQ_LINE		(1 << 6)
+#define OMAP_LCDC_IRQ_MASK		(((1 << 5) - 1) << 2)
 
 int omap_lcdc_set_dma_callback(void (*callback)(void *data), void *data);
 void omap_lcdc_free_dma_callback(void);
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index 80ac67f27f0d..d3c755b293ea 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -15,6 +15,7 @@
 #include <linux/omap-dma.h>
 
 #include "omapfb.h"
+#include "lcd_dma.h"
 #include "lcdc.h"
 
 #define MODULE_NAME		"omapfb-sossi"
diff --git a/include/linux/omap-dma.h b/include/linux/omap-dma.h
index 5c5c93ad6b50..441f5f0919c6 100644
--- a/include/linux/omap-dma.h
+++ b/include/linux/omap-dma.h
@@ -328,8 +328,8 @@ extern dma_addr_t omap_get_dma_dst_pos(int lch);
 extern int omap_get_dma_active_status(int lch);
 extern int omap_dma_running(void);
 
-#if defined(CONFIG_ARCH_OMAP1) && IS_ENABLED(CONFIG_FB_OMAP)
-#include <mach/lcd_dma.h>
+#if IS_ENABLED(CONFIG_FB_OMAP)
+extern int omap_lcd_dma_running(void);
 #else
 static inline int omap_lcd_dma_running(void)
 {
-- 
2.29.2

