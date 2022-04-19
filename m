Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E820506DCD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082C510F00B;
	Tue, 19 Apr 2022 13:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9163510F00B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:42:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36F90B81986;
 Tue, 19 Apr 2022 13:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC2AC385A8;
 Tue, 19 Apr 2022 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375765;
 bh=8SjzAPUXuyYdBuZeXZuWD8MKomlpKInJxereWCjPZ2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bj8mAfqJbG9f8Tobba/toXaBDXDawlf39Zvj89ZdO7BT9DK41wGfqz76jTefdrSEI
 5fvlfnruKntbjDgqHcKXFufc4Snzc7dab3DhYtrv1nLsbCXUbZu8wF7NzSJWMV5g9z
 AxX8EDmfEpWS0NSFAcK/h1N2dYbjZouOPvfBrRp8Yku0+eXnmTkJ0HgkOMpCkCFQVp
 RtpYkkA3hWaBy4EpijHEnvBQJhZIibL9D6mWCbs59B0bEmpOItzdFj3W5Xp78MvQ4S
 iDAJ8RELJYOIwSYN+G2TH4AZ+tiI+GOUOR2OqcabCyrQ6runsc7yurMih4Uk4KdqJr
 uD0LTru/eQVkw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 41/41] [TO BE REBASED] ARM: omap1: enable multiplatform
Date: Tue, 19 Apr 2022 15:37:23 +0200
Message-Id: <20220419133723.1394715-42-arnd@kernel.org>
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

With all the header files out of the way, and the clock driver
converted to the common framework, nothing stops us from building
OMAP together with the other platforms.

As usual, the decompressor support is a victim here, and is
only available when CONFIG_DEBUG_LL is configured for the
particular board.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                              |  12 --
 arch/arm/configs/omap1_defconfig              |   3 +
 arch/arm/mach-omap1/Kconfig                   |  15 +++
 arch/arm/mach-omap1/hardware.h                |   2 +-
 arch/arm/mach-omap1/include/mach/uncompress.h | 117 ------------------
 arch/arm/mach-omap1/serial.c                  |   3 +-
 .../mach-omap1/{include/mach => }/serial.h    |   0
 7 files changed, 20 insertions(+), 132 deletions(-)
 delete mode 100644 arch/arm/mach-omap1/include/mach/uncompress.h
 rename arch/arm/mach-omap1/{include/mach => }/serial.h (100%)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index a65f2c05f01c..8794c6bee29b 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -483,18 +483,6 @@ config ARCH_S3C24XX
 	  (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940 or the
 	  Samsung SMDK2410 development board (and derivatives).
 
-config ARCH_OMAP1
-	bool "TI OMAP1"
-	select CLKSRC_MMIO
-	select FORCE_PCI if PCCARD
-	select GENERIC_IRQ_CHIP
-	select GPIOLIB
-	select HAVE_LEGACY_CLK
-	select IRQ_DOMAIN
-	select SPARSE_IRQ
-	help
-	  Support for older TI OMAP1 (omap7xx, omap15xx or omap16xx)
-
 endchoice
 
 menu "Multiple platform selection"
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index 3148567b66b6..14c17a218ec5 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -17,6 +17,9 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_BLK_DEV_BSG is not set
+CONFIG_ARCH_MULTI_V4T=y
+CONFIG_ARCH_MULTI_V5=y
+# CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_OMAP=y
 CONFIG_ARCH_OMAP1=y
 CONFIG_OMAP_RESET_CLOCKS=y
diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index d4b0cd91a4f9..9a7e5460b36a 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -1,4 +1,15 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menuconfig ARCH_OMAP1
+	bool "TI OMAP1"
+	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5
+	select ARCH_HAS_HOLES_MEMORYMODEL
+	select ARCH_OMAP
+	select CLKSRC_MMIO
+	select FORCE_PCI if PCCARD
+	select GPIOLIB
+	help
+	  Support for older TI OMAP1 (omap7xx, omap15xx or omap16xx)
+
 if ARCH_OMAP1
 
 menu "TI OMAP1 specific features"
@@ -6,23 +17,27 @@ menu "TI OMAP1 specific features"
 comment "OMAP Core Type"
 
 config ARCH_OMAP730
+	depends on ARCH_MULTI_V5
 	bool "OMAP730 Based System"
 	select ARCH_OMAP_OTG
 	select CPU_ARM926T
 	select OMAP_MPU_TIMER
 
 config ARCH_OMAP850
+	depends on ARCH_MULTI_V5
 	bool "OMAP850 Based System"
 	select ARCH_OMAP_OTG
 	select CPU_ARM926T
 
 config ARCH_OMAP15XX
+	depends on ARCH_MULTI_V4T
 	default y
 	bool "OMAP15xx Based System"
 	select CPU_ARM925T
 	select OMAP_MPU_TIMER
 
 config ARCH_OMAP16XX
+	depends on ARCH_MULTI_V5
 	bool "OMAP16xx Based System"
 	select ARCH_OMAP_OTG
 	select CPU_ARM926T
diff --git a/arch/arm/mach-omap1/hardware.h b/arch/arm/mach-omap1/hardware.h
index 1af0238f8c05..4c3920ba83e3 100644
--- a/arch/arm/mach-omap1/hardware.h
+++ b/arch/arm/mach-omap1/hardware.h
@@ -64,7 +64,7 @@ static inline u32 omap_cs3_phys(void)
 #define OMAP1_IO_OFFSET		0x00fb0000	/* Virtual IO = 0xff000000 */
 #define OMAP1_IO_ADDRESS(pa)	IOMEM((pa) - OMAP1_IO_OFFSET)
 
-#include <mach/serial.h>
+#include "serial.h"
 
 /*
  * ---------------------------------------------------------------------------
diff --git a/arch/arm/mach-omap1/include/mach/uncompress.h b/arch/arm/mach-omap1/include/mach/uncompress.h
deleted file mode 100644
index 9cca6a56788f..000000000000
--- a/arch/arm/mach-omap1/include/mach/uncompress.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/*
- * arch/arm/plat-omap/include/mach/uncompress.h
- *
- * Serial port stubs for kernel decompress status messages
- *
- * Initially based on:
- * linux-2.4.15-rmk1-dsplinux1.6/arch/arm/plat-omap/include/mach1510/uncompress.h
- * Copyright (C) 2000 RidgeRun, Inc.
- * Author: Greg Lonnon <glonnon@ridgerun.com>
- *
- * Rewritten by:
- * Author: <source@mvista.com>
- * 2004 (c) MontaVista Software, Inc.
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
- */
-
-#include <linux/types.h>
-#include <linux/serial_reg.h>
-
-#include <asm/memory.h>
-#include <asm/mach-types.h>
-
-#include "serial.h"
-
-#define MDR1_MODE_MASK			0x07
-
-volatile u8 *uart_base;
-int uart_shift;
-
-/*
- * Store the DEBUG_LL uart number into memory.
- * See also debug-macro.S, and serial.c for related code.
- */
-static void set_omap_uart_info(unsigned char port)
-{
-	/*
-	 * Get address of some.bss variable and round it down
-	 * a la CONFIG_AUTO_ZRELADDR.
-	 */
-	u32 ram_start = (u32)&uart_shift & 0xf8000000;
-	u32 *uart_info = (u32 *)(ram_start + OMAP_UART_INFO_OFS);
-	*uart_info = port;
-}
-
-static inline void putc(int c)
-{
-	if (!uart_base)
-		return;
-
-	/* Check for UART 16x mode */
-	if ((uart_base[UART_OMAP_MDR1 << uart_shift] & MDR1_MODE_MASK) != 0)
-		return;
-
-	while (!(uart_base[UART_LSR << uart_shift] & UART_LSR_THRE))
-		barrier();
-	uart_base[UART_TX << uart_shift] = c;
-}
-
-static inline void flush(void)
-{
-}
-
-/*
- * Macros to configure UART1 and debug UART
- */
-#define _DEBUG_LL_ENTRY(mach, dbg_uart, dbg_shft, dbg_id)		\
-	if (machine_is_##mach()) {					\
-		uart_base = (volatile u8 *)(dbg_uart);			\
-		uart_shift = (dbg_shft);				\
-		port = (dbg_id);					\
-		set_omap_uart_info(port);				\
-		break;							\
-	}
-
-#define DEBUG_LL_OMAP7XX(p, mach)					\
-	_DEBUG_LL_ENTRY(mach, OMAP1_UART##p##_BASE, OMAP7XX_PORT_SHIFT,	\
-		OMAP1UART##p)
-
-#define DEBUG_LL_OMAP1(p, mach)						\
-	_DEBUG_LL_ENTRY(mach, OMAP1_UART##p##_BASE, OMAP_PORT_SHIFT,	\
-		OMAP1UART##p)
-
-static inline void arch_decomp_setup(void)
-{
-	int port = 0;
-
-	/*
-	 * Initialize the port based on the machine ID from the bootloader.
-	 * Note that we're using macros here instead of switch statement
-	 * as machine_is functions are optimized out for the boards that
-	 * are not selected.
-	 */
-	do {
-		/* omap7xx/8xx based boards using UART1 with shift 0 */
-		DEBUG_LL_OMAP7XX(1, herald);
-		DEBUG_LL_OMAP7XX(1, omap_perseus2);
-
-		/* omap15xx/16xx based boards using UART1 */
-		DEBUG_LL_OMAP1(1, ams_delta);
-		DEBUG_LL_OMAP1(1, nokia770);
-		DEBUG_LL_OMAP1(1, omap_h2);
-		DEBUG_LL_OMAP1(1, omap_h3);
-		DEBUG_LL_OMAP1(1, omap_innovator);
-		DEBUG_LL_OMAP1(1, omap_osk);
-		DEBUG_LL_OMAP1(1, omap_palmte);
-		DEBUG_LL_OMAP1(1, omap_palmz71);
-
-		/* omap15xx/16xx based boards using UART2 */
-		DEBUG_LL_OMAP1(2, omap_palmtt);
-
-		/* omap15xx/16xx based boards using UART3 */
-		DEBUG_LL_OMAP1(3, sx1);
-	} while (0);
-}
diff --git a/arch/arm/mach-omap1/serial.c b/arch/arm/mach-omap1/serial.c
index 299ae1106187..88928fc33b2e 100644
--- a/arch/arm/mach-omap1/serial.c
+++ b/arch/arm/mach-omap1/serial.c
@@ -19,8 +19,7 @@
 
 #include <asm/mach-types.h>
 
-#include <mach/serial.h>
-
+#include "serial.h"
 #include "mux.h"
 #include "pm.h"
 #include "soc.h"
diff --git a/arch/arm/mach-omap1/include/mach/serial.h b/arch/arm/mach-omap1/serial.h
similarity index 100%
rename from arch/arm/mach-omap1/include/mach/serial.h
rename to arch/arm/mach-omap1/serial.h
-- 
2.29.2

