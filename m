Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC1507365
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AEA10F02C;
	Tue, 19 Apr 2022 16:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E523710F018
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:40:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97611B8196F;
 Tue, 19 Apr 2022 16:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E156C385AD;
 Tue, 19 Apr 2022 16:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386434;
 bh=Me5Zax9Cglx1LkHOlA8xV8JEJklryJyWSe6dcCjrrgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sakbeqPI29Om+/FQz0qrFAi7y4JGvalfYfkXPgEmDAHQE5JutGOtnitKMdhD/p0lN
 DhEAF01KwxuyAz3UGi3jwRt2GxBEtmj4vxHkA3PItSOKP3X54DH90IyriUJPKRYV1X
 BIAvtuns7tePi7NLdUUzAV57aLC7hbjqxyX7AZDclAvUdWuFIT078ADdlzcICL/9+M
 wgI5g6kwYoVtQAA0Eymt32oBHJZSCTUcWvhwf1aLMMuBWcXT5wyS3qq8oCJZh/mBF4
 UDot9x1fEXjfgm7bXqg4vfaXPFcwtqapRVe3zSRHwo/Vvq34alxLUDf9aCVWAxKea7
 RZ4Ev5Hjil72g==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 13/48] ARM: pxa: use pdev resource for palmld mmio
Date: Tue, 19 Apr 2022 18:37:35 +0200
Message-Id: <20220419163810.2118169-14-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tomas Cech <sleep_walker@suse.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Sergey Lapin <slapin@ossfans.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Jens Axboe <axboe@kernel.dk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The palmld header is almost unused in drivers, the only
remaining thing now is the PATA device address, which should
really be passed as a resource.

Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-ide@vger.kernel.org
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/palmld-pcmcia.c             |  3 ++-
 arch/arm/mach-pxa/palmld.c                    | 12 +++++++++---
 arch/arm/mach-pxa/{include/mach => }/palmld.h |  2 +-
 drivers/ata/pata_palmld.c                     |  3 +--
 4 files changed, 13 insertions(+), 7 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/palmld.h (98%)

diff --git a/arch/arm/mach-pxa/palmld-pcmcia.c b/arch/arm/mach-pxa/palmld-pcmcia.c
index 07e0f7438db1..720294a50864 100644
--- a/arch/arm/mach-pxa/palmld-pcmcia.c
+++ b/arch/arm/mach-pxa/palmld-pcmcia.c
@@ -13,9 +13,10 @@
 #include <linux/gpio.h>
 
 #include <asm/mach-types.h>
-#include <mach/palmld.h>
 #include <pcmcia/soc_common.h>
 
+#include "palmld.h"
+
 static struct gpio palmld_pcmcia_gpios[] = {
 	{ GPIO_NR_PALMLD_PCMCIA_POWER,	GPIOF_INIT_LOW,	"PCMCIA Power" },
 	{ GPIO_NR_PALMLD_PCMCIA_RESET,	GPIOF_INIT_HIGH,"PCMCIA Reset" },
diff --git a/arch/arm/mach-pxa/palmld.c b/arch/arm/mach-pxa/palmld.c
index d85146957004..d821606ce0b5 100644
--- a/arch/arm/mach-pxa/palmld.c
+++ b/arch/arm/mach-pxa/palmld.c
@@ -29,8 +29,8 @@
 #include <asm/mach/map.h>
 
 #include "pxa27x.h"
+#include "palmld.h"
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/palmld.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/irda-pxaficp.h>
@@ -279,9 +279,15 @@ static inline void palmld_leds_init(void) {}
  * HDD
  ******************************************************************************/
 #if defined(CONFIG_PATA_PALMLD) || defined(CONFIG_PATA_PALMLD_MODULE)
+static struct resource palmld_ide_resources[] = {
+	DEFINE_RES_MEM(PALMLD_IDE_PHYS, 0x1000),
+};
+
 static struct platform_device palmld_ide_device = {
-	.name	= "pata_palmld",
-	.id	= -1,
+	.name		= "pata_palmld",
+	.id		= -1,
+	.resource	= palmld_ide_resources,
+	.num_resources	= ARRAY_SIZE(palmld_ide_resources),
 };
 
 static struct gpiod_lookup_table palmld_ide_gpio_table = {
diff --git a/arch/arm/mach-pxa/include/mach/palmld.h b/arch/arm/mach-pxa/palmld.h
similarity index 98%
rename from arch/arm/mach-pxa/include/mach/palmld.h
rename to arch/arm/mach-pxa/palmld.h
index 99a6d8b3a1e3..ee3bc15b71a2 100644
--- a/arch/arm/mach-pxa/include/mach/palmld.h
+++ b/arch/arm/mach-pxa/palmld.h
@@ -9,7 +9,7 @@
 #ifndef _INCLUDE_PALMLD_H_
 #define _INCLUDE_PALMLD_H_
 
-#include "irqs.h" /* PXA_GPIO_TO_IRQ */
+#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
 
 /** HERE ARE GPIOs **/
 
diff --git a/drivers/ata/pata_palmld.c b/drivers/ata/pata_palmld.c
index 2448441571ed..400e65190904 100644
--- a/drivers/ata/pata_palmld.c
+++ b/drivers/ata/pata_palmld.c
@@ -25,7 +25,6 @@
 #include <linux/gpio/consumer.h>
 
 #include <scsi/scsi_host.h>
-#include <mach/palmld.h>
 
 #define DRV_NAME "pata_palmld"
 
@@ -63,7 +62,7 @@ static int palmld_pata_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* remap drive's physical memory address */
-	mem = devm_ioremap(dev, PALMLD_IDE_PHYS, 0x1000);
+	mem = devm_platform_ioremap_resource(pdev, 0);
 	if (!mem)
 		return -ENOMEM;
 
-- 
2.29.2

