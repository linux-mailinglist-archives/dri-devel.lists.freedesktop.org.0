Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7727F506DA8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E2510EEAB;
	Tue, 19 Apr 2022 13:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B3610EEAB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:38:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E099B8197D;
 Tue, 19 Apr 2022 13:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFE78C385A5;
 Tue, 19 Apr 2022 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375526;
 bh=RR8FHUt8/oVOHCndemgdv0yQ+gJWVi08oSUPSCA8r+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FjyAQX1V1Mtq5rmgyreMTZhE3/aJBxgkMqWfV0riRO23vuyzYq/zn4LgLEsRpPY/l
 DQmmsn9xT0+qY3/PXuyKKsFDGMgZhu8Ddawg3jVOO+PbTKZTwvJLooQWJOrl+HaB/O
 AN85kED9oV3T2m4YPSPzkaicNd85/MKhtRTpzOZrR1O1IwS5AGlDoe22qvgRvyYVmp
 0q0Z8oey3GPFsFg0mzWOUndrW5ruI9D+QP02L6mUJV+H5efX4UhX5GpUaq3ZRQjLzt
 xg9dQpFAlmTyoWXkYs+Cvc8YFJt1I6n7of27SYxlG1Q2NZgRo7lBZYbAsDvPq2cz0n
 ZD+j1qthwTwyg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 09/41] ARM: omap1: move perseus spi pinconf to board file
Date: Tue, 19 Apr 2022 15:36:51 +0200
Message-Id: <20220419133723.1394715-10-arnd@kernel.org>
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
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The driver has always had a FIXME about this, and it seems
like this trivial code move avoids a mach header inclusion,
so just do it.

With that out of the way, and the header file inclusions
changed to global files, the driver can also be compile-tested
on other platforms.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-perseus2.c |  6 ++++++
 drivers/spi/Kconfig                  |  2 +-
 drivers/spi/spi-omap-uwire.c         | 15 +++------------
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-omap1/board-perseus2.c b/arch/arm/mach-omap1/board-perseus2.c
index 1aeeb7337d29..da0155107d85 100644
--- a/arch/arm/mach-omap1/board-perseus2.c
+++ b/arch/arm/mach-omap1/board-perseus2.c
@@ -289,6 +289,12 @@ static void __init omap_perseus2_init(void)
 	omap_cfg_reg(F4_7XX_KBC3);
 	omap_cfg_reg(E3_7XX_KBC4);
 
+	if (IS_ENABLED(CONFIG_SPI_OMAP_UWIRE)) {
+		/* configure pins: MPU_UW_nSCS1, MPU_UW_SDO, MPU_UW_SCLK */
+		int val = omap_readl(OMAP7XX_IO_CONF_9) & ~0x00EEE000;
+		omap_writel(val | 0x00AAA000, OMAP7XX_IO_CONF_9);
+	}
+
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 
 	omap_serial_init();
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index d2815eb361c0..6c28ca232444 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -631,7 +631,7 @@ config SPI_OCTEON
 
 config SPI_OMAP_UWIRE
 	tristate "OMAP1 MicroWire"
-	depends on ARCH_OMAP1
+	depends on ARCH_OMAP1 || (ARM && COMPILE_TEST)
 	select SPI_BITBANG
 	help
 	  This hooks up to the MicroWire controller on OMAP1 chips.
diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 087172a193fa..29198e6815b2 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -44,13 +44,10 @@
 #include <linux/module.h>
 #include <linux/io.h>
 
-#include <mach/hardware.h>
 #include <asm/mach-types.h>
-
-#include <mach/mux.h>
-
-#include <mach/omap7xx.h>	/* OMAP7XX_IO_CONF registers */
-
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 /* FIXME address is now a platform device resource,
  * and irqs should show there too...
@@ -548,12 +545,6 @@ static int __init omap_uwire_init(void)
 		omap_cfg_reg(N14_1610_UWIRE_CS0);
 		omap_cfg_reg(N15_1610_UWIRE_CS1);
 	}
-	if (machine_is_omap_perseus2()) {
-		/* configure pins: MPU_UW_nSCS1, MPU_UW_SDO, MPU_UW_SCLK */
-		int val = omap_readl(OMAP7XX_IO_CONF_9) & ~0x00EEE000;
-		omap_writel(val | 0x00AAA000, OMAP7XX_IO_CONF_9);
-	}
-
 	return platform_driver_register(&uwire_driver);
 }
 
-- 
2.29.2

