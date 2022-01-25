Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B349BCE6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 21:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD7010E3D6;
	Tue, 25 Jan 2022 20:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E387D10E3D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643142077; x=1674678077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IFz3nUGKP1Br+iYMI85YwEwstVhziXjn5Y7bO34ZEVI=;
 b=RoC9eCr8qXuNGhfWwvGJTQgofWpFgA/kbIUpRA+fgXQmFt5QCxRnaxwm
 osloFeTkUX4uEA4P4igrY6FKyBtdwwiS0LbPdn2/KJ0Pco6bVNQ0jTDK4
 xBfIO0APAUEcODo1qtUw5wqdYsL8JXFAhYUXxAq6qpmKouvZhA7Bqav4D
 diqylwp8dG/JCj7sS+9IuB/59LjwLU0hY9+kZz9aw4PKNN3WvXKlahHm3
 gioUN54NZkVFa+CfCEfZmr7YLuUwMiFObf7pDzvlqNLI8S+cJ1MssOr82
 6wwG7CzN+uD4xMJ1Wd1W5+Jun/wtq4klpp+l0mi+n/ZPGdE2E9dquneCl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="270858040"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="270858040"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 12:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="628073594"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 25 Jan 2022 12:21:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 71154198; Tue, 25 Jan 2022 22:21:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/4] fbtft: Move driver out from staging
Date: Tue, 25 Jan 2022 22:21:15 +0200
Message-Id: <20220125202118.63362-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
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
Cc: Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
 Michael Hennerich <michael.hennerich@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver is under maintenance mode, but some of the devices supported
by it are not going to be converted to (tiny) DRM in the feasible future.

In order to support them, move driver out from staging.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                                       | 2 +-
 drivers/staging/Kconfig                           | 2 --
 drivers/staging/Makefile                          | 1 -
 drivers/video/Kconfig                             | 1 +
 drivers/video/Makefile                            | 1 +
 drivers/{staging => video}/fbtft/Kconfig          | 0
 drivers/{staging => video}/fbtft/Makefile         | 0
 drivers/{staging => video}/fbtft/README           | 0
 drivers/{staging => video}/fbtft/TODO             | 0
 drivers/{staging => video}/fbtft/fb_agm1264k-fl.c | 0
 drivers/{staging => video}/fbtft/fb_bd663474.c    | 0
 drivers/{staging => video}/fbtft/fb_hx8340bn.c    | 0
 drivers/{staging => video}/fbtft/fb_hx8347d.c     | 0
 drivers/{staging => video}/fbtft/fb_hx8353d.c     | 0
 drivers/{staging => video}/fbtft/fb_hx8357d.c     | 0
 drivers/{staging => video}/fbtft/fb_hx8357d.h     | 0
 drivers/{staging => video}/fbtft/fb_ili9163.c     | 0
 drivers/{staging => video}/fbtft/fb_ili9320.c     | 0
 drivers/{staging => video}/fbtft/fb_ili9325.c     | 0
 drivers/{staging => video}/fbtft/fb_ili9340.c     | 0
 drivers/{staging => video}/fbtft/fb_ili9341.c     | 0
 drivers/{staging => video}/fbtft/fb_ili9481.c     | 0
 drivers/{staging => video}/fbtft/fb_ili9486.c     | 0
 drivers/{staging => video}/fbtft/fb_pcd8544.c     | 0
 drivers/{staging => video}/fbtft/fb_ra8875.c      | 0
 drivers/{staging => video}/fbtft/fb_s6d02a1.c     | 0
 drivers/{staging => video}/fbtft/fb_s6d1121.c     | 0
 drivers/{staging => video}/fbtft/fb_seps525.c     | 0
 drivers/{staging => video}/fbtft/fb_sh1106.c      | 0
 drivers/{staging => video}/fbtft/fb_ssd1289.c     | 0
 drivers/{staging => video}/fbtft/fb_ssd1305.c     | 0
 drivers/{staging => video}/fbtft/fb_ssd1306.c     | 0
 drivers/{staging => video}/fbtft/fb_ssd1325.c     | 0
 drivers/{staging => video}/fbtft/fb_ssd1331.c     | 0
 drivers/{staging => video}/fbtft/fb_ssd1351.c     | 0
 drivers/{staging => video}/fbtft/fb_st7735r.c     | 0
 drivers/{staging => video}/fbtft/fb_st7789v.c     | 0
 drivers/{staging => video}/fbtft/fb_tinylcd.c     | 0
 drivers/{staging => video}/fbtft/fb_tls8204.c     | 0
 drivers/{staging => video}/fbtft/fb_uc1611.c      | 0
 drivers/{staging => video}/fbtft/fb_uc1701.c      | 0
 drivers/{staging => video}/fbtft/fb_upd161704.c   | 0
 drivers/{staging => video}/fbtft/fbtft-bus.c      | 0
 drivers/{staging => video}/fbtft/fbtft-core.c     | 0
 drivers/{staging => video}/fbtft/fbtft-io.c       | 0
 drivers/{staging => video}/fbtft/fbtft-sysfs.c    | 0
 drivers/{staging => video}/fbtft/fbtft.h          | 0
 drivers/{staging => video}/fbtft/internal.h       | 0
 48 files changed, 3 insertions(+), 4 deletions(-)
 rename drivers/{staging => video}/fbtft/Kconfig (100%)
 rename drivers/{staging => video}/fbtft/Makefile (100%)
 rename drivers/{staging => video}/fbtft/README (100%)
 rename drivers/{staging => video}/fbtft/TODO (100%)
 rename drivers/{staging => video}/fbtft/fb_agm1264k-fl.c (100%)
 rename drivers/{staging => video}/fbtft/fb_bd663474.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8340bn.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8347d.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8353d.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8357d.c (100%)
 rename drivers/{staging => video}/fbtft/fb_hx8357d.h (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9163.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9320.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9325.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9340.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9341.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9481.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ili9486.c (100%)
 rename drivers/{staging => video}/fbtft/fb_pcd8544.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ra8875.c (100%)
 rename drivers/{staging => video}/fbtft/fb_s6d02a1.c (100%)
 rename drivers/{staging => video}/fbtft/fb_s6d1121.c (100%)
 rename drivers/{staging => video}/fbtft/fb_seps525.c (100%)
 rename drivers/{staging => video}/fbtft/fb_sh1106.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1289.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1305.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1306.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1325.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1331.c (100%)
 rename drivers/{staging => video}/fbtft/fb_ssd1351.c (100%)
 rename drivers/{staging => video}/fbtft/fb_st7735r.c (100%)
 rename drivers/{staging => video}/fbtft/fb_st7789v.c (100%)
 rename drivers/{staging => video}/fbtft/fb_tinylcd.c (100%)
 rename drivers/{staging => video}/fbtft/fb_tls8204.c (100%)
 rename drivers/{staging => video}/fbtft/fb_uc1611.c (100%)
 rename drivers/{staging => video}/fbtft/fb_uc1701.c (100%)
 rename drivers/{staging => video}/fbtft/fb_upd161704.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-bus.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-core.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-io.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft-sysfs.c (100%)
 rename drivers/{staging => video}/fbtft/fbtft.h (100%)
 rename drivers/{staging => video}/fbtft/internal.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 16e614606ac1..1c2787d22132 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7377,7 +7377,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-fbtft.git
-F:	drivers/staging/fbtft/
+F:	drivers/video/fbtft/
 
 FC0011 TUNER DRIVER
 M:	Michael Buesch <m@bues.ch>
diff --git a/drivers/staging/Kconfig b/drivers/staging/Kconfig
index 8d41fdd40657..0ed757061e58 100644
--- a/drivers/staging/Kconfig
+++ b/drivers/staging/Kconfig
@@ -72,8 +72,6 @@ source "drivers/staging/unisys/Kconfig"
 
 source "drivers/staging/clocking-wizard/Kconfig"
 
-source "drivers/staging/fbtft/Kconfig"
-
 source "drivers/staging/most/Kconfig"
 
 source "drivers/staging/ks7010/Kconfig"
diff --git a/drivers/staging/Makefile b/drivers/staging/Makefile
index 02b01949b94e..77d8e385498b 100644
--- a/drivers/staging/Makefile
+++ b/drivers/staging/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_FIREWIRE_SERIAL)	+= fwserial/
 obj-$(CONFIG_GS_FPGABOOT)	+= gs_fpgaboot/
 obj-$(CONFIG_UNISYSSPAR)	+= unisys/
 obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clocking-wizard/
-obj-$(CONFIG_FB_TFT)		+= fbtft/
 obj-$(CONFIG_MOST)		+= most/
 obj-$(CONFIG_KS7010)		+= ks7010/
 obj-$(CONFIG_GREYBUS)		+= greybus/
diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 427a993c7f57..5903cb4db1a4 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -21,6 +21,7 @@ source "drivers/gpu/drm/Kconfig"
 
 menu "Frame buffer Devices"
 source "drivers/video/fbdev/Kconfig"
+source "drivers/video/fbtft/Kconfig"
 endmenu
 
 source "drivers/video/backlight/Kconfig"
diff --git a/drivers/video/Makefile b/drivers/video/Makefile
index df7650adede9..323d002f404d 100644
--- a/drivers/video/Makefile
+++ b/drivers/video/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_LOGO)		  += logo/
 obj-y				  += backlight/
 
 obj-y				  += fbdev/
+obj-y				  += fbtft/
 
 obj-$(CONFIG_VIDEOMODE_HELPERS) += display_timing.o videomode.o
 ifeq ($(CONFIG_OF),y)
diff --git a/drivers/staging/fbtft/Kconfig b/drivers/video/fbtft/Kconfig
similarity index 100%
rename from drivers/staging/fbtft/Kconfig
rename to drivers/video/fbtft/Kconfig
diff --git a/drivers/staging/fbtft/Makefile b/drivers/video/fbtft/Makefile
similarity index 100%
rename from drivers/staging/fbtft/Makefile
rename to drivers/video/fbtft/Makefile
diff --git a/drivers/staging/fbtft/README b/drivers/video/fbtft/README
similarity index 100%
rename from drivers/staging/fbtft/README
rename to drivers/video/fbtft/README
diff --git a/drivers/staging/fbtft/TODO b/drivers/video/fbtft/TODO
similarity index 100%
rename from drivers/staging/fbtft/TODO
rename to drivers/video/fbtft/TODO
diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/video/fbtft/fb_agm1264k-fl.c
similarity index 100%
rename from drivers/staging/fbtft/fb_agm1264k-fl.c
rename to drivers/video/fbtft/fb_agm1264k-fl.c
diff --git a/drivers/staging/fbtft/fb_bd663474.c b/drivers/video/fbtft/fb_bd663474.c
similarity index 100%
rename from drivers/staging/fbtft/fb_bd663474.c
rename to drivers/video/fbtft/fb_bd663474.c
diff --git a/drivers/staging/fbtft/fb_hx8340bn.c b/drivers/video/fbtft/fb_hx8340bn.c
similarity index 100%
rename from drivers/staging/fbtft/fb_hx8340bn.c
rename to drivers/video/fbtft/fb_hx8340bn.c
diff --git a/drivers/staging/fbtft/fb_hx8347d.c b/drivers/video/fbtft/fb_hx8347d.c
similarity index 100%
rename from drivers/staging/fbtft/fb_hx8347d.c
rename to drivers/video/fbtft/fb_hx8347d.c
diff --git a/drivers/staging/fbtft/fb_hx8353d.c b/drivers/video/fbtft/fb_hx8353d.c
similarity index 100%
rename from drivers/staging/fbtft/fb_hx8353d.c
rename to drivers/video/fbtft/fb_hx8353d.c
diff --git a/drivers/staging/fbtft/fb_hx8357d.c b/drivers/video/fbtft/fb_hx8357d.c
similarity index 100%
rename from drivers/staging/fbtft/fb_hx8357d.c
rename to drivers/video/fbtft/fb_hx8357d.c
diff --git a/drivers/staging/fbtft/fb_hx8357d.h b/drivers/video/fbtft/fb_hx8357d.h
similarity index 100%
rename from drivers/staging/fbtft/fb_hx8357d.h
rename to drivers/video/fbtft/fb_hx8357d.h
diff --git a/drivers/staging/fbtft/fb_ili9163.c b/drivers/video/fbtft/fb_ili9163.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9163.c
rename to drivers/video/fbtft/fb_ili9163.c
diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/video/fbtft/fb_ili9320.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9320.c
rename to drivers/video/fbtft/fb_ili9320.c
diff --git a/drivers/staging/fbtft/fb_ili9325.c b/drivers/video/fbtft/fb_ili9325.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9325.c
rename to drivers/video/fbtft/fb_ili9325.c
diff --git a/drivers/staging/fbtft/fb_ili9340.c b/drivers/video/fbtft/fb_ili9340.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9340.c
rename to drivers/video/fbtft/fb_ili9340.c
diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/video/fbtft/fb_ili9341.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9341.c
rename to drivers/video/fbtft/fb_ili9341.c
diff --git a/drivers/staging/fbtft/fb_ili9481.c b/drivers/video/fbtft/fb_ili9481.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9481.c
rename to drivers/video/fbtft/fb_ili9481.c
diff --git a/drivers/staging/fbtft/fb_ili9486.c b/drivers/video/fbtft/fb_ili9486.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ili9486.c
rename to drivers/video/fbtft/fb_ili9486.c
diff --git a/drivers/staging/fbtft/fb_pcd8544.c b/drivers/video/fbtft/fb_pcd8544.c
similarity index 100%
rename from drivers/staging/fbtft/fb_pcd8544.c
rename to drivers/video/fbtft/fb_pcd8544.c
diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/video/fbtft/fb_ra8875.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ra8875.c
rename to drivers/video/fbtft/fb_ra8875.c
diff --git a/drivers/staging/fbtft/fb_s6d02a1.c b/drivers/video/fbtft/fb_s6d02a1.c
similarity index 100%
rename from drivers/staging/fbtft/fb_s6d02a1.c
rename to drivers/video/fbtft/fb_s6d02a1.c
diff --git a/drivers/staging/fbtft/fb_s6d1121.c b/drivers/video/fbtft/fb_s6d1121.c
similarity index 100%
rename from drivers/staging/fbtft/fb_s6d1121.c
rename to drivers/video/fbtft/fb_s6d1121.c
diff --git a/drivers/staging/fbtft/fb_seps525.c b/drivers/video/fbtft/fb_seps525.c
similarity index 100%
rename from drivers/staging/fbtft/fb_seps525.c
rename to drivers/video/fbtft/fb_seps525.c
diff --git a/drivers/staging/fbtft/fb_sh1106.c b/drivers/video/fbtft/fb_sh1106.c
similarity index 100%
rename from drivers/staging/fbtft/fb_sh1106.c
rename to drivers/video/fbtft/fb_sh1106.c
diff --git a/drivers/staging/fbtft/fb_ssd1289.c b/drivers/video/fbtft/fb_ssd1289.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ssd1289.c
rename to drivers/video/fbtft/fb_ssd1289.c
diff --git a/drivers/staging/fbtft/fb_ssd1305.c b/drivers/video/fbtft/fb_ssd1305.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ssd1305.c
rename to drivers/video/fbtft/fb_ssd1305.c
diff --git a/drivers/staging/fbtft/fb_ssd1306.c b/drivers/video/fbtft/fb_ssd1306.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ssd1306.c
rename to drivers/video/fbtft/fb_ssd1306.c
diff --git a/drivers/staging/fbtft/fb_ssd1325.c b/drivers/video/fbtft/fb_ssd1325.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ssd1325.c
rename to drivers/video/fbtft/fb_ssd1325.c
diff --git a/drivers/staging/fbtft/fb_ssd1331.c b/drivers/video/fbtft/fb_ssd1331.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ssd1331.c
rename to drivers/video/fbtft/fb_ssd1331.c
diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/video/fbtft/fb_ssd1351.c
similarity index 100%
rename from drivers/staging/fbtft/fb_ssd1351.c
rename to drivers/video/fbtft/fb_ssd1351.c
diff --git a/drivers/staging/fbtft/fb_st7735r.c b/drivers/video/fbtft/fb_st7735r.c
similarity index 100%
rename from drivers/staging/fbtft/fb_st7735r.c
rename to drivers/video/fbtft/fb_st7735r.c
diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/video/fbtft/fb_st7789v.c
similarity index 100%
rename from drivers/staging/fbtft/fb_st7789v.c
rename to drivers/video/fbtft/fb_st7789v.c
diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/video/fbtft/fb_tinylcd.c
similarity index 100%
rename from drivers/staging/fbtft/fb_tinylcd.c
rename to drivers/video/fbtft/fb_tinylcd.c
diff --git a/drivers/staging/fbtft/fb_tls8204.c b/drivers/video/fbtft/fb_tls8204.c
similarity index 100%
rename from drivers/staging/fbtft/fb_tls8204.c
rename to drivers/video/fbtft/fb_tls8204.c
diff --git a/drivers/staging/fbtft/fb_uc1611.c b/drivers/video/fbtft/fb_uc1611.c
similarity index 100%
rename from drivers/staging/fbtft/fb_uc1611.c
rename to drivers/video/fbtft/fb_uc1611.c
diff --git a/drivers/staging/fbtft/fb_uc1701.c b/drivers/video/fbtft/fb_uc1701.c
similarity index 100%
rename from drivers/staging/fbtft/fb_uc1701.c
rename to drivers/video/fbtft/fb_uc1701.c
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/video/fbtft/fb_upd161704.c
similarity index 100%
rename from drivers/staging/fbtft/fb_upd161704.c
rename to drivers/video/fbtft/fb_upd161704.c
diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/video/fbtft/fbtft-bus.c
similarity index 100%
rename from drivers/staging/fbtft/fbtft-bus.c
rename to drivers/video/fbtft/fbtft-bus.c
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/video/fbtft/fbtft-core.c
similarity index 100%
rename from drivers/staging/fbtft/fbtft-core.c
rename to drivers/video/fbtft/fbtft-core.c
diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/video/fbtft/fbtft-io.c
similarity index 100%
rename from drivers/staging/fbtft/fbtft-io.c
rename to drivers/video/fbtft/fbtft-io.c
diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/video/fbtft/fbtft-sysfs.c
similarity index 100%
rename from drivers/staging/fbtft/fbtft-sysfs.c
rename to drivers/video/fbtft/fbtft-sysfs.c
diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/video/fbtft/fbtft.h
similarity index 100%
rename from drivers/staging/fbtft/fbtft.h
rename to drivers/video/fbtft/fbtft.h
diff --git a/drivers/staging/fbtft/internal.h b/drivers/video/fbtft/internal.h
similarity index 100%
rename from drivers/staging/fbtft/internal.h
rename to drivers/video/fbtft/internal.h
-- 
2.34.1

