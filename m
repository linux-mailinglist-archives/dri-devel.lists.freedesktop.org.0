Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FE506DAB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3110EF32;
	Tue, 19 Apr 2022 13:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302B710EF32
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0639616B4;
 Tue, 19 Apr 2022 13:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AC2C385AE;
 Tue, 19 Apr 2022 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375541;
 bh=Tabda3W6PeTGMPAu0M9QQqvhYHycL4TemoWy40qzXKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LW0UoBnX9Hzd86LCuPcO6M26sjgPOlXq6jYIKYaqHJXq5bcL1DEHz6T4LiTtbxQ5V
 rNq+KpgWJcQ+v3qqv0Osu2Bn1grzaUydyONyZK25cqWeeQyp6iiruSwB9jDhNJQi1H
 rgGCt2NBVy+QTsRCYLzUIrmIhsPCty3jBIuS1+h2vprkrocgwhSJnxqWFEGI1m9XWb
 Ra28W18ndsOK4QP3CQrCAQqyI2jbSWeW0BeZ7olszsizmclogqzyomgTeXxeiBgofD
 EAYelDZWulsqVtmdDnpD9qbRdAr1E4/1sb4ACF1iwKSPghV+dWtF/UoVae683yoGUy
 p4lP1qqtWoMfA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 11/41] fbdev: omap: avoid using mach/*.h files
Date: Tue, 19 Apr 2022 15:36:53 +0200
Message-Id: <20220419133723.1394715-12-arnd@kernel.org>
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

All the headers we actually need are now in include/linux/soc,
so use those versions instead and allow compile-testing on
other architectures.

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/backlight/Kconfig          | 4 ++--
 drivers/video/backlight/omap1_bl.c       | 4 ++--
 drivers/video/fbdev/omap/Kconfig         | 4 ++--
 drivers/video/fbdev/omap/lcd_ams_delta.c | 2 +-
 drivers/video/fbdev/omap/lcd_dma.c       | 3 ++-
 drivers/video/fbdev/omap/lcd_inn1510.c   | 2 +-
 drivers/video/fbdev/omap/lcd_osk.c       | 4 ++--
 drivers/video/fbdev/omap/lcdc.c          | 2 ++
 drivers/video/fbdev/omap/omapfb_main.c   | 3 +--
 drivers/video/fbdev/omap/sossi.c         | 1 +
 10 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index e32694c13da5..a003e02e13ce 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -211,8 +211,8 @@ config BACKLIGHT_LOCOMO
 
 config BACKLIGHT_OMAP1
 	tristate "OMAP1 PWL-based LCD Backlight"
-	depends on ARCH_OMAP1
-	default y
+	depends on ARCH_OMAP1 || COMPILE_TEST
+	default ARCH_OMAP1
 	help
 	  This driver controls the LCD backlight level and power for
 	  the PWL module of OMAP1 processors.  Say Y if your board
diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
index 74263021b1b3..69a49384b3de 100644
--- a/drivers/video/backlight/omap1_bl.c
+++ b/drivers/video/backlight/omap1_bl.c
@@ -14,8 +14,8 @@
 #include <linux/slab.h>
 #include <linux/platform_data/omap1_bl.h>
 
-#include <mach/hardware.h>
-#include <mach/mux.h>
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 #define OMAPBL_MAX_INTENSITY		0xff
 
diff --git a/drivers/video/fbdev/omap/Kconfig b/drivers/video/fbdev/omap/Kconfig
index df2a5d0d4aa2..b1786cf1b486 100644
--- a/drivers/video/fbdev/omap/Kconfig
+++ b/drivers/video/fbdev/omap/Kconfig
@@ -2,7 +2,7 @@
 config FB_OMAP
 	tristate "OMAP frame buffer support"
 	depends on FB
-	depends on ARCH_OMAP1
+	depends on ARCH_OMAP1 || (ARM && COMPILE_TEST)
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -42,7 +42,7 @@ config FB_OMAP_LCD_MIPID
 
 config FB_OMAP_LCD_H3
 	bool "TPS65010 LCD controller on OMAP-H3"
-	depends on MACH_OMAP_H3
+	depends on MACH_OMAP_H3 || COMPILE_TEST
 	depends on TPS65010=y
 	default y
 	help
diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 01944ce46aa1..414d0f074306 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -14,7 +14,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/lcd.h>
 
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "omapfb.h"
 
diff --git a/drivers/video/fbdev/omap/lcd_dma.c b/drivers/video/fbdev/omap/lcd_dma.c
index 867a63c06f42..f85817635a8c 100644
--- a/drivers/video/fbdev/omap/lcd_dma.c
+++ b/drivers/video/fbdev/omap/lcd_dma.c
@@ -25,7 +25,8 @@
 
 #include <linux/omap-dma.h>
 
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "lcdc.h"
 #include "lcd_dma.h"
diff --git a/drivers/video/fbdev/omap/lcd_inn1510.c b/drivers/video/fbdev/omap/lcd_inn1510.c
index 37ed0c14aa5a..bb915637e9b6 100644
--- a/drivers/video/fbdev/omap/lcd_inn1510.c
+++ b/drivers/video/fbdev/omap/lcd_inn1510.c
@@ -10,7 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-soc.h>
 
 #include "omapfb.h"
 
diff --git a/drivers/video/fbdev/omap/lcd_osk.c b/drivers/video/fbdev/omap/lcd_osk.c
index 5d5762128c8d..8168ba0d47fd 100644
--- a/drivers/video/fbdev/omap/lcd_osk.c
+++ b/drivers/video/fbdev/omap/lcd_osk.c
@@ -11,8 +11,8 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 
-#include <mach/hardware.h>
-#include <mach/mux.h>
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 #include "omapfb.h"
 
diff --git a/drivers/video/fbdev/omap/lcdc.c b/drivers/video/fbdev/omap/lcdc.c
index d9731d12bd72..4c9091bd936d 100644
--- a/drivers/video/fbdev/omap/lcdc.c
+++ b/drivers/video/fbdev/omap/lcdc.c
@@ -17,6 +17,8 @@
 #include <linux/clk.h>
 #include <linux/gfp.h>
 
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
 #include <linux/omap-dma.h>
 
 #include <asm/mach-types.h>
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index b8fd509f11e4..292fcb0a24fc 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -20,8 +20,7 @@
 
 #include <linux/omap-dma.h>
 
-#include <mach/hardware.h>
-
+#include <linux/soc/ti/omap1-soc.h>
 #include "omapfb.h"
 #include "lcdc.h"
 
diff --git a/drivers/video/fbdev/omap/sossi.c b/drivers/video/fbdev/omap/sossi.c
index ade9d452254c..6b99d89fbe6e 100644
--- a/drivers/video/fbdev/omap/sossi.c
+++ b/drivers/video/fbdev/omap/sossi.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 
 #include <linux/omap-dma.h>
+#include <linux/soc/ti/omap1-io.h>
 
 #include "omapfb.h"
 #include "lcd_dma.h"
-- 
2.29.2

