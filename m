Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 534821AE19C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FD06E1D2;
	Fri, 17 Apr 2020 15:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A349F6E169
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:56:47 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mdvyi-1irnEC2GYQ-00b2Ri; Fri, 17 Apr 2020 17:56:26 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-fbdev@vger.kernel.org
Subject: [PATCH 7/8] fbdev: rework backlight dependencies
Date: Fri, 17 Apr 2020 17:55:52 +0200
Message-Id: <20200417155553.675905-8-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417155553.675905-1-arnd@arndb.de>
References: <20200417155553.675905-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vGGnc5uwogoaFi6Z70DCSCfFNs3VFNyi23c2w5F8AgwudYdGiOn
 qf3xmzEH6ZlKvYId4+y9DQOJjPmrdQ5Ly77BVj5lo4BsvRV14yZifvS6wwRiNK5Km3YVcSs
 ejNr2W/o5YZ78gytJeefvBfMDQhcv9w1VSv2LusnKOjgKAyYAWGZVsgT75IoREAyrU+HGYC
 /cpVYSCtL6vWKC9ZwSJuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C7LFhGxGtwI=:mB0SQmX5ugxSw2eBOppjd9
 zXdkkn+O/lxIgg0DC1sbRDZfrULOuQJJC5H7MS2hVxJtfNMZaksC1HDTw2CaZ5GAPRsu8ymQS
 Lg1DhSrNb3SpHCpYOzUw+YO3FHxgO1C+XbT1lhknn/n6h4YFWyukCKicbG6xD2wph4anHkB2R
 w7JtfjedEs9HvmcOvbZKDyF6CpWGZtvgp0PLAaRgmAC7sVSgfMIhYENXU76oRTWWeqwAcE4G3
 qAysWvA1oq1pc1Sqr6/ESMGwDfx0lDmtmGt4ApX1UqxcCghCLYjMy5HsRvYzJeSWRw6S4h89o
 STsdrITqli4Q7w5DEErYVWuVUbFxXzuNySZ3nnGDX9s7oA7cPtUFCOB5TYcg0eTlEpk4ALOp4
 1l/pEG4DZeiQrFYU1LpkuTA+UxFCG43mgZ1CGsjssToxbb++Zbe93dLUJSK+z2nIg5D4cuDNw
 h2gO0vOeSu4HBQ4w0pHHZ0DLpRMkwZYm5B21gcoON/k4UbkBpiJdn9r2zF6Z4+5BGuxK8hw4J
 IwfUio/q5ig2hDVomjbyQF2TCeTQ6h3vrXGAJu+hMfAMewAfb7WrMz0BP+tcVPVYpuhKuTRKK
 NIMzjex/2BlVkhFpYaglhYlpZN+51xbLLrVTqQgbd0kihOxtCPVmJsV25Wdyp5MKvvJ+3ChjX
 ESH0Qz/N7XmAfMjXfxHqgS4njsCPr3txSykzf9zA6VlJiTMbA9VXl2wrPPsb/iFGMR6DxoJif
 oxwkTFEaT6hCPlrxpBDW40S4pHOAMSNJj8XZv0YFWeJX/AhuZiehC9STQMiqe3E4eFR4El0zX
 Z6xQx3WL137d6sxZhtsWSxhPUxk8gArU7lJBoZsrIuzByFvkAo=
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
Cc: marex@denx.de, dsd@laptop.org, Arnd Bergmann <arnd@arndb.de>,
 Andrzej Hajda <a.hajda@samsung.com>, airlied@linux.ie, masahiroy@kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Saeed Mahameed <saeedm@mellanox.com>,
 thellstrom@vmware.com, haojian.zhuang@gmail.com, geert@linux-m68k.org,
 linux-renesas-soc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 kieran.bingham+renesas@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 Laurent.pinchart@ideasonboard.com, jfrederich@gmail.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than having CONFIG_FB_BACKLIGHT select CONFIG_BACKLIGHT_CLASS_DEVICE,
make any driver that needs it have a dependency on the class device
being available, to prevent circular dependencies.

This is the same way that the backlight is already treated for the DRM
subsystem.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/auxdisplay/Kconfig        |  1 +
 drivers/macintosh/Kconfig         |  1 +
 drivers/staging/fbtft/Kconfig     |  1 +
 drivers/staging/olpc_dcon/Kconfig |  2 +-
 drivers/video/fbdev/Kconfig       | 14 +++++++++++---
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/Kconfig b/drivers/auxdisplay/Kconfig
index 48efa7a047f3..f5751b5b0e88 100644
--- a/drivers/auxdisplay/Kconfig
+++ b/drivers/auxdisplay/Kconfig
@@ -144,6 +144,7 @@ config IMG_ASCII_LCD
 config HT16K33
 	tristate "Holtek Ht16K33 LED controller with keyscan"
 	depends on FB && OF && I2C && INPUT
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index cbd46c1c5bf7..a1c6677c7043 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -113,6 +113,7 @@ config PMAC_MEDIABAY
 config PMAC_BACKLIGHT
 	bool "Backlight control for LCD screens"
 	depends on PPC_PMAC && ADB_PMU && FB = y && (BROKEN || !PPC64)
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	help
 	  Say Y here to enable Macintosh specific extensions of the generic
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index dad1ddcd7b0c..c4f2f01cd798 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -3,6 +3,7 @@ menuconfig FB_TFT
 	tristate "Support for small TFT LCD display modules"
 	depends on FB && SPI
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
diff --git a/drivers/staging/olpc_dcon/Kconfig b/drivers/staging/olpc_dcon/Kconfig
index d1a0dea09ef0..a9f36538d7ab 100644
--- a/drivers/staging/olpc_dcon/Kconfig
+++ b/drivers/staging/olpc_dcon/Kconfig
@@ -4,7 +4,7 @@ config FB_OLPC_DCON
 	depends on OLPC && FB
 	depends on I2C
 	depends on GPIO_CS5535 && ACPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  In order to support very low power operation, the XO laptop uses a
 	  secondary Display CONtroller, or DCON.  This secondary controller
diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index bcf7834dbdbf..47e1b65276f4 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -186,7 +186,7 @@ config FB_MACMODES
 config FB_BACKLIGHT
 	tristate
 	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
@@ -275,12 +275,12 @@ config FB_ARMCLCD
 	tristate "ARM PrimeCell PL110 support"
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on FB && ARM_AMBA && HAS_IOMEM
+	depends on BACKLIGHT_CLASS_DEVICE || !OF
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
 	select FB_MODE_HELPERS if OF
 	select VIDEOMODE_HELPERS if OF
-	select BACKLIGHT_CLASS_DEVICE if OF
 	help
 	  This framebuffer device driver is for the ARM PrimeCell PL110
 	  Colour LCD controller.  ARM PrimeCells provide the building
@@ -861,6 +861,7 @@ config FB_ATMEL
 	tristate "AT91 LCD Controller support"
 	depends on FB && OF && HAVE_CLK && HAS_IOMEM
 	depends on HAVE_FB_ATMEL || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_BACKLIGHT
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
@@ -914,6 +915,7 @@ config FB_NVIDIA_DEBUG
 config FB_NVIDIA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_NVIDIA
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_NVIDIA
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -961,6 +963,7 @@ config FB_RIVA_DEBUG
 config FB_RIVA_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RIVA
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RIVA
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1232,6 +1235,7 @@ config FB_RADEON_I2C
 config FB_RADEON_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_RADEON
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_RADEON
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1263,6 +1267,7 @@ config FB_ATY128
 config FB_ATY128_BACKLIGHT
 	bool "Support for backlight control"
 	depends on FB_ATY128
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY128
 	default y
 	help
 	  Say Y here if you want to control the backlight of your display.
@@ -1312,6 +1317,7 @@ config FB_ATY_GX
 
 config FB_ATY_BACKLIGHT
 	bool "Support for backlight control"
+	depends on BACKLIGHT_CLASS_DEVICE=y || BACKLIGHT_CLASS_DEVICE=FB_ATY
 	depends on FB_ATY
 	default y
 	help
@@ -1855,6 +1861,7 @@ config FB_SH_MOBILE_LCDC
 	tristate "SuperH Mobile LCDC framebuffer support"
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
@@ -2183,7 +2190,7 @@ config FB_PRE_INIT_FB
 config FB_MX3
 	tristate "MX3 Framebuffer support"
 	depends on FB && MX3_IPU
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
 	select FB_CFB_IMAGEBLIT
@@ -2250,6 +2257,7 @@ config FB_SSD1307
 	depends on FB && I2C
 	depends on OF
 	depends on GPIOLIB || COMPILE_TEST
+	depends on BACKLIGHT_CLASS_DEVICE
 	select FB_SYS_FOPS
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
