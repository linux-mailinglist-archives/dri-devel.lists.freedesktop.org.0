Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D94D507387
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1254110F115;
	Tue, 19 Apr 2022 16:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C77710F115
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:44:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 919BFB81BEF;
 Tue, 19 Apr 2022 16:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98879C385B2;
 Tue, 19 Apr 2022 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386675;
 bh=E21UhST9fsmcKihylxjEyCuP25oDJbc3hkCHxxEC7Wk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EB/6DhNFIygUIJNqebbXaCuU1Caq5c1sBLelCq0shsuEm3FRNZV2B59x6I2trbDEc
 mGp4dOD9Ygy0j8x6aPCdDEEtBsFVyQmwX6Z6ETiwL8f+P+6YAU8qYTWV4eD8Y1tRSO
 YeNzajYLagp6ruLgMBiU+soJeU4jvRsJU8tDlT8ym5RNBHHt5mLJ6idSKE8ueFa7Fq
 gHunt4HKHZZrSSLT70Pil89w5mgdiwlO4CenyC2gybqFS5NJ/dJWeID+kklVKdk6Y5
 Ntms9VwIzEHT/wAhZPE58MouPij2FW+YnFEqM77U/IG+gpakryHwwwc9+78N5VekkF
 55njOa7JMJYOw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 44/48] ARM: pxa: move plat-pxa to drivers/soc/
Date: Tue, 19 Apr 2022 18:38:06 +0200
Message-Id: <20220419163810.2118169-45-arnd@kernel.org>
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
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

There are two drivers in arch/arm/plat-pxa: mfp and ssp. Both
of them should ideally not be needed at all, as there are
proper subsystems to replace them.

OTOH, they are self-contained and can simply be normal
SoC drivers, so move them over there to eliminate one more
of the plat-* directories.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr> (mach-pxa)
Acked-by: Lubomir Rintel <lkundrak@v3.sk> (mach-mmp)
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                                            | 4 ----
 arch/arm/Makefile                                           | 1 -
 arch/arm/mach-mmp/mfp.h                                     | 2 +-
 arch/arm/mach-pxa/include/mach/mfp.h                        | 2 +-
 arch/arm/mach-pxa/mfp-pxa2xx.h                              | 2 +-
 arch/arm/mach-pxa/mfp-pxa3xx.h                              | 2 +-
 drivers/soc/Kconfig                                         | 1 +
 drivers/soc/Makefile                                        | 1 +
 {arch/arm/plat-pxa => drivers/soc/pxa}/Kconfig              | 5 ++---
 {arch/arm/plat-pxa => drivers/soc/pxa}/Makefile             | 4 ----
 {arch/arm/plat-pxa => drivers/soc/pxa}/mfp.c                | 2 +-
 {arch/arm/plat-pxa => drivers/soc/pxa}/ssp.c                | 0
 .../plat-pxa/include/plat => include/linux/soc/pxa}/mfp.h   | 6 ++----
 13 files changed, 11 insertions(+), 21 deletions(-)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/Kconfig (83%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/Makefile (51%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/mfp.c (99%)
 rename {arch/arm/plat-pxa => drivers/soc/pxa}/ssp.c (100%)
 rename {arch/arm/plat-pxa/include/plat => include/linux/soc/pxa}/mfp.h (98%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e8091e2d8a8..eef8cbf20045 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -667,7 +667,6 @@ source "arch/arm/mach-orion5x/Kconfig"
 source "arch/arm/mach-oxnas/Kconfig"
 
 source "arch/arm/mach-pxa/Kconfig"
-source "arch/arm/plat-pxa/Kconfig"
 
 source "arch/arm/mach-qcom/Kconfig"
 
@@ -753,9 +752,6 @@ config PLAT_ORION_LEGACY
 	bool
 	select PLAT_ORION
 
-config PLAT_PXA
-	bool
-
 config PLAT_VERSATILE
 	bool
 
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a2391b8de5a5..206a900fc87c 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -230,7 +230,6 @@ machine-$(CONFIG_PLAT_SPEAR)		+= spear
 # by CONFIG_* macro name.
 plat-$(CONFIG_ARCH_OMAP)	+= omap
 plat-$(CONFIG_PLAT_ORION)	+= orion
-plat-$(CONFIG_PLAT_PXA)		+= pxa
 plat-$(CONFIG_PLAT_VERSATILE)	+= versatile
 
 # The byte offset of the kernel image in RAM from the start of RAM.
diff --git a/arch/arm/mach-mmp/mfp.h b/arch/arm/mach-mmp/mfp.h
index 75a4acb33b1b..6f3057987756 100644
--- a/arch/arm/mach-mmp/mfp.h
+++ b/arch/arm/mach-mmp/mfp.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_MFP_H
 #define __ASM_MACH_MFP_H
 
-#include <plat/mfp.h>
+#include <linux/soc/pxa/mfp.h>
 
 /*
  * NOTE: the MFPR register bit definitions on PXA168 processor lines are a
diff --git a/arch/arm/mach-pxa/include/mach/mfp.h b/arch/arm/mach-pxa/include/mach/mfp.h
index dbb961fb570e..7e0879bd4102 100644
--- a/arch/arm/mach-pxa/include/mach/mfp.h
+++ b/arch/arm/mach-pxa/include/mach/mfp.h
@@ -13,6 +13,6 @@
 #ifndef __ASM_ARCH_MFP_H
 #define __ASM_ARCH_MFP_H
 
-#include <plat/mfp.h>
+#include <linux/soc/pxa/mfp.h>
 
 #endif /* __ASM_ARCH_MFP_H */
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.h b/arch/arm/mach-pxa/mfp-pxa2xx.h
index 980145e7ee99..683a3ea5f154 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.h
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARCH_MFP_PXA2XX_H
 #define __ASM_ARCH_MFP_PXA2XX_H
 
-#include <plat/mfp.h>
+#include <linux/soc/pxa/mfp.h>
 
 /*
  * the following MFP_xxx bit definitions in mfp.h are re-used for pxa2xx:
diff --git a/arch/arm/mach-pxa/mfp-pxa3xx.h b/arch/arm/mach-pxa/mfp-pxa3xx.h
index cdd830926d1c..81fec4fa5a0f 100644
--- a/arch/arm/mach-pxa/mfp-pxa3xx.h
+++ b/arch/arm/mach-pxa/mfp-pxa3xx.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARCH_MFP_PXA3XX_H
 #define __ASM_ARCH_MFP_PXA3XX_H
 
-#include <plat/mfp.h>
+#include <linux/soc/pxa/mfp.h>
 
 #define MFPR_BASE	(0x40e10000)
 
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index c5aae42673d3..86ccf5970bc1 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -14,6 +14,7 @@ source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/microchip/Kconfig"
+source "drivers/soc/pxa/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 904eec2a7871..fd7717d597fc 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_SOC_XWAY)		+= lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
 obj-y				+= mediatek/
 obj-y				+= microchip/
+obj-y				+= pxa/
 obj-y				+= amlogic/
 obj-y				+= qcom/
 obj-y				+= renesas/
diff --git a/arch/arm/plat-pxa/Kconfig b/drivers/soc/pxa/Kconfig
similarity index 83%
rename from arch/arm/plat-pxa/Kconfig
rename to drivers/soc/pxa/Kconfig
index 6f7a0a39c2b9..c5c265aa4f07 100644
--- a/arch/arm/plat-pxa/Kconfig
+++ b/drivers/soc/pxa/Kconfig
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if PLAT_PXA
+config PLAT_PXA
+	bool
 
 config PXA_SSP
 	tristate
 	help
 	  Enable support for PXA2xx SSP ports
-
-endif
diff --git a/arch/arm/plat-pxa/Makefile b/drivers/soc/pxa/Makefile
similarity index 51%
rename from arch/arm/plat-pxa/Makefile
rename to drivers/soc/pxa/Makefile
index 349ea0af8450..413deceddbdd 100644
--- a/arch/arm/plat-pxa/Makefile
+++ b/drivers/soc/pxa/Makefile
@@ -1,8 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for code common across different PXA processor families
-#
-ccflags-$(CONFIG_ARCH_MMP) := -I$(srctree)/$(src)/include
 
 obj-$(CONFIG_PXA3xx)		+= mfp.o
 obj-$(CONFIG_ARCH_MMP)		+= mfp.o
diff --git a/arch/arm/plat-pxa/mfp.c b/drivers/soc/pxa/mfp.c
similarity index 99%
rename from arch/arm/plat-pxa/mfp.c
rename to drivers/soc/pxa/mfp.c
index 17fc4f33f35b..6220ba321cfc 100644
--- a/arch/arm/plat-pxa/mfp.c
+++ b/drivers/soc/pxa/mfp.c
@@ -15,7 +15,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 
-#include <plat/mfp.h>
+#include <linux/soc/pxa/mfp.h>
 
 #define MFPR_SIZE	(PAGE_SIZE)
 
diff --git a/arch/arm/plat-pxa/ssp.c b/drivers/soc/pxa/ssp.c
similarity index 100%
rename from arch/arm/plat-pxa/ssp.c
rename to drivers/soc/pxa/ssp.c
diff --git a/arch/arm/plat-pxa/include/plat/mfp.h b/include/linux/soc/pxa/mfp.h
similarity index 98%
rename from arch/arm/plat-pxa/include/plat/mfp.h
rename to include/linux/soc/pxa/mfp.h
index 3accaa9ee781..39779cbed0c0 100644
--- a/arch/arm/plat-pxa/include/plat/mfp.h
+++ b/include/linux/soc/pxa/mfp.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * arch/arm/plat-pxa/include/plat/mfp.h
- *
  *   Common Multi-Function Pin Definitions
  *
  * Copyright (C) 2007 Marvell International Ltd.
@@ -453,8 +451,8 @@ struct mfp_addr_map {
 
 #define MFP_ADDR_END	{ MFP_PIN_INVALID, 0 }
 
-void __init mfp_init_base(void __iomem *mfpr_base);
-void __init mfp_init_addr(struct mfp_addr_map *map);
+void mfp_init_base(void __iomem *mfpr_base);
+void mfp_init_addr(struct mfp_addr_map *map);
 
 /*
  * mfp_{read, write}()	- for direct read/write access to the MFPR register
-- 
2.29.2

