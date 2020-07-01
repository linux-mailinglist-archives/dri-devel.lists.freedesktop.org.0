Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93F6211CC9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29846EA90;
	Thu,  2 Jul 2020 07:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDF66E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 10:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593599490; bh=Uj/PtNKs3+mkjVbPW0e4D6UAtrtq8nzQPPh5UoRwNE8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=LH5FZK+tpQsQPfnm5tzP1VPDvNeWOgCjJupWFDbt+uWCLrrNmy6qcU9v9i5u6T5Pd
 c7SVjOc3s373A4wyF7AMgn3kkpWnQFOiqTKs8aFke19jufaM1/Kdu9++ZGMSArGULJ
 gbdxbtWGVRDXBMvDwY2bHMkDQver/T6zAG+8cUho=
From: Ondrej Jirman <megous@megous.com>
To: linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v6 04/13] drm/panel: rocktech-jh057n00900: Rename the driver
 to st7703
Date: Wed,  1 Jul 2020 12:31:17 +0200
Message-Id: <20200701103126.1512615-5-megous@megous.com>
In-Reply-To: <20200701103126.1512615-1-megous@megous.com>
References: <20200701103126.1512615-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca@z3ntu.xyz>, Martijn Braam <martijn@brixit.nl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This rename is done so that the driver matches the name of the
display controller and in preparation for adding support for more
panels to the driver.

This is just a basic file rename, with no code changes.

Signed-off-by: Ondrej Jirman <megous@megous.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig                 | 26 +++++++++----------
 drivers/gpu/drm/panel/Makefile                |  2 +-
 ...-jh057n00900.c => panel-sitronix-st7703.c} |  0
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/gpu/drm/panel/{panel-rocktech-jh057n00900.c => panel-sitronix-st7703.c} (100%)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 39055c1f0e2f..de2f2a452be5 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -283,19 +283,6 @@ config DRM_PANEL_RAYDIUM_RM68200
 	  Say Y here if you want to enable support for Raydium RM68200
 	  720x1280 DSI video mode panel.
 
-config DRM_PANEL_ROCKTECH_JH057N00900
-	tristate "Rocktech JH057N00900 MIPI touchscreen panel"
-	depends on OF
-	depends on DRM_MIPI_DSI
-	depends on BACKLIGHT_CLASS_DEVICE
-	help
-	  Say Y here if you want to enable support for Rocktech JH057N00900
-	  MIPI DSI panel as e.g. used in the Librem 5 devkit. It has a
-	  resolution of 720x1440 pixels, a built in backlight and touch
-	  controller.
-	  Touch input support is provided by the goodix driver and needs to be
-	  selected separately.
-
 config DRM_PANEL_RONBO_RB070D30
 	tristate "Ronbo Electronics RB070D30 panel"
 	depends on OF
@@ -395,6 +382,19 @@ config DRM_PANEL_SITRONIX_ST7701
 	  ST7701 controller for 480X864 LCD panels with MIPI/RGB/SPI
 	  system interfaces.
 
+config DRM_PANEL_SITRONIX_ST7703
+	tristate "Sitronix ST7703 based MIPI touchscreen panels"
+	depends on OF
+	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
+	help
+	  Say Y here if you want to enable support for Sitronix ST7703 based
+	  panels, souch as Rocktech JH057N00900 MIPI DSI panel as e.g. used in
+	  the Librem 5 devkit. It has a resolution of 720x1440 pixels, a built
+	  in backlight and touch controller.
+	  Touch input support is provided by the goodix driver and needs to be
+	  selected separately.
+
 config DRM_PANEL_SITRONIX_ST7789V
 	tristate "Sitronix ST7789V panel"
 	depends on OF && SPI
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index de74f282c433..e45ceac6286f 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
 obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
 obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
-obj-$(CONFIG_DRM_PANEL_ROCKTECH_JH057N00900) += panel-rocktech-jh057n00900.o
 obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
@@ -41,6 +40,7 @@ obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) += panel-sharp-lq101r1sx01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS037V7DW01) += panel-sharp-ls037v7dw01.o
 obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) += panel-sharp-ls043t1le01.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += panel-sitronix-st7701.o
+obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
 obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += panel-sitronix-st7789v.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX424AKP) += panel-sony-acx424akp.o
 obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
diff --git a/drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
similarity index 100%
rename from drivers/gpu/drm/panel/panel-rocktech-jh057n00900.c
rename to drivers/gpu/drm/panel/panel-sitronix-st7703.c
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
