Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5A506DB1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD310EF7B;
	Tue, 19 Apr 2022 13:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D863010EF7B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:39:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46DE7616B3;
 Tue, 19 Apr 2022 13:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D9CC385A7;
 Tue, 19 Apr 2022 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375584;
 bh=x1mvWl2U7fZILb5TbyNkFpMm6/MypG7RO5sXAsxLvRg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PZTxNL5DSXCYDgJG8/+vLbglm3Bhpk5h/Ugh3KUJ531orszQSnNDG73cQlb4bZj0Z
 HBwfwm3Fn7Q0EsAJCI4GK9LiCXzD1yNHN8VW/FO14KinCNU1FkRN0TGkYURwKC6MQ+
 DTiCUh0nUOK7+AnvZnl6/cpsoi3FJisdZmBonypOAIOjqDOfu07w90A2ngtcRTl0k/
 tn3+f7kw7MCBRbxGjZrMN+Jpn0HXe4XH2X02BuHpYN9z5uaKHSEmxpZnVQHVMccNtZ
 ujjtywF56S80y2RETVswGMcLzlBjDwf5rDrx3BJsgCkT53Z2c14D77ga1UB6uWLFWf
 6ZqDHxa1AcOJg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 17/41] ARM: omap1: move 32k counter from plat-omap to
 mach-omap1
Date: Tue, 19 Apr 2022 15:36:59 +0200
Message-Id: <20220419133723.1394715-18-arnd@kernel.org>
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

omap2 stopped using this code with commit 8d39ff3d1696 ("ARM: OMAP2+:
Remove unused legacy code for timer"), so just move it to mach-omap1 now,
along with the other half of that driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Kconfig                   |  16 +++
 arch/arm/mach-omap1/timer32k.c                |  96 ++++++++++++++-
 arch/arm/plat-omap/Kconfig                    |  17 ---
 arch/arm/plat-omap/Makefile                   |   2 +-
 arch/arm/plat-omap/counter_32k.c              | 114 ------------------
 arch/arm/plat-omap/include/plat/counter-32k.h |   1 -
 6 files changed, 110 insertions(+), 136 deletions(-)
 delete mode 100644 arch/arm/plat-omap/counter_32k.c
 delete mode 100644 arch/arm/plat-omap/include/plat/counter-32k.h

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index 208c700c2455..04155b5ce978 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -53,6 +53,22 @@ config OMAP_MUX_WARNINGS
 	  to change the pin multiplexing setup.	 When there are no warnings
 	  printed, it's safe to deselect OMAP_MUX for your product.
 
+config OMAP_32K_TIMER
+	bool "Use 32KHz timer"
+	depends on ARCH_OMAP16XX
+	default ARCH_OMAP16XX
+	help
+	  Select this option if you want to enable the OMAP 32KHz timer.
+	  This timer saves power compared to the OMAP_MPU_TIMER, and has
+	  support for no tick during idle. The 32KHz timer provides less
+	  intra-tick resolution than OMAP_MPU_TIMER. The 32KHz timer is
+	  currently only available for OMAP16XX, 24XX, 34XX, OMAP4/5 and DRA7XX.
+
+	  On OMAP2PLUS this value is only used for CONFIG_HZ and
+	  CLOCK_TICK_RATE compile time calculation.
+	  The actual timer selection is done in the board file
+	  through the (DT_)MACHINE_START structure.
+
 comment "OMAP Board Type"
 
 config MACH_OMAP_INNOVATOR
diff --git a/arch/arm/mach-omap1/timer32k.c b/arch/arm/mach-omap1/timer32k.c
index 780fdf03c3ce..11958ccd894d 100644
--- a/arch/arm/mach-omap1/timer32k.c
+++ b/arch/arm/mach-omap1/timer32k.c
@@ -45,15 +45,13 @@
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/io.h>
+#include <linux/sched_clock.h>
 
 #include <asm/irq.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
-#include <plat/counter-32k.h>
-
 #include <mach/hardware.h>
-
 #include "common.h"
 
 /*
@@ -159,6 +157,98 @@ static __init void omap_init_32k_timer(void)
 					OMAP_32K_TICKS_PER_SEC, 1, 0xfffffffe);
 }
 
+/* OMAP2_32KSYNCNT_CR_OFF: offset of 32ksync counter register */
+#define OMAP2_32KSYNCNT_REV_OFF		0x0
+#define OMAP2_32KSYNCNT_REV_SCHEME	(0x3 << 30)
+#define OMAP2_32KSYNCNT_CR_OFF_LOW	0x10
+#define OMAP2_32KSYNCNT_CR_OFF_HIGH	0x30
+
+/*
+ * 32KHz clocksource ... always available, on pretty most chips except
+ * OMAP 730 and 1510.  Other timers could be used as clocksources, with
+ * higher resolution in free-running counter modes (e.g. 12 MHz xtal),
+ * but systems won't necessarily want to spend resources that way.
+ */
+static void __iomem *sync32k_cnt_reg;
+
+static u64 notrace omap_32k_read_sched_clock(void)
+{
+	return sync32k_cnt_reg ? readl_relaxed(sync32k_cnt_reg) : 0;
+}
+
+/**
+ * omap_read_persistent_clock64 -  Return time from a persistent clock.
+ *
+ * Reads the time from a source which isn't disabled during PM, the
+ * 32k sync timer.  Convert the cycles elapsed since last read into
+ * nsecs and adds to a monotonically increasing timespec64.
+ */
+static struct timespec64 persistent_ts;
+static cycles_t cycles;
+static unsigned int persistent_mult, persistent_shift;
+
+static void omap_read_persistent_clock64(struct timespec64 *ts)
+{
+	unsigned long long nsecs;
+	cycles_t last_cycles;
+
+	last_cycles = cycles;
+	cycles = sync32k_cnt_reg ? readl_relaxed(sync32k_cnt_reg) : 0;
+
+	nsecs = clocksource_cyc2ns(cycles - last_cycles,
+					persistent_mult, persistent_shift);
+
+	timespec64_add_ns(&persistent_ts, nsecs);
+
+	*ts = persistent_ts;
+}
+
+/**
+ * omap_init_clocksource_32k - setup and register counter 32k as a
+ * kernel clocksource
+ * @pbase: base addr of counter_32k module
+ * @size: size of counter_32k to map
+ *
+ * Returns 0 upon success or negative error code upon failure.
+ *
+ */
+int __init omap_init_clocksource_32k(void __iomem *vbase)
+{
+	int ret;
+
+	/*
+	 * 32k sync Counter IP register offsets vary between the
+	 * highlander version and the legacy ones.
+	 * The 'SCHEME' bits(30-31) of the revision register is used
+	 * to identify the version.
+	 */
+	if (readl_relaxed(vbase + OMAP2_32KSYNCNT_REV_OFF) &
+						OMAP2_32KSYNCNT_REV_SCHEME)
+		sync32k_cnt_reg = vbase + OMAP2_32KSYNCNT_CR_OFF_HIGH;
+	else
+		sync32k_cnt_reg = vbase + OMAP2_32KSYNCNT_CR_OFF_LOW;
+
+	/*
+	 * 120000 rough estimate from the calculations in
+	 * __clocksource_update_freq_scale.
+	 */
+	clocks_calc_mult_shift(&persistent_mult, &persistent_shift,
+			32768, NSEC_PER_SEC, 120000);
+
+	ret = clocksource_mmio_init(sync32k_cnt_reg, "32k_counter", 32768,
+				250, 32, clocksource_mmio_readl_up);
+	if (ret) {
+		pr_err("32k_counter: can't register clocksource\n");
+		return ret;
+	}
+
+	sched_clock_register(omap_32k_read_sched_clock, 32, 32768);
+	register_persistent_clock(omap_read_persistent_clock64);
+	pr_info("OMAP clocksource: 32k_counter at 32768 Hz\n");
+
+	return 0;
+}
+
 /*
  * ---------------------------------------------------------------------------
  * Timer initialization
diff --git a/arch/arm/plat-omap/Kconfig b/arch/arm/plat-omap/Kconfig
index 272670ef1e92..dfa19d5030e3 100644
--- a/arch/arm/plat-omap/Kconfig
+++ b/arch/arm/plat-omap/Kconfig
@@ -72,23 +72,6 @@ config OMAP_MPU_TIMER
 	  timer provides more intra-tick resolution than the 32KHz timer,
 	  but consumes more power.
 
-config OMAP_32K_TIMER
-	bool "Use 32KHz timer"
-	depends on ARCH_OMAP16XX || ARCH_OMAP2PLUS
-	default y if (ARCH_OMAP16XX || ARCH_OMAP2PLUS)
-	help
-	  Select this option if you want to enable the OMAP 32KHz timer.
-	  This timer saves power compared to the OMAP_MPU_TIMER, and has
-	  support for no tick during idle. The 32KHz timer provides less
-	  intra-tick resolution than OMAP_MPU_TIMER. The 32KHz timer is
-	  currently only available for OMAP16XX, 24XX, 34XX, OMAP4/5 and DRA7XX.
-
-	  On OMAP2PLUS this value is only used for CONFIG_HZ and
-	  CLOCK_TICK_RATE compile time calculation.
-	  The actual timer selection is done in the board file
-	  through the (DT_)MACHINE_START structure.
-
-
 config OMAP3_L2_AUX_SECURE_SAVE_RESTORE
 	bool "OMAP3 HS/EMU save and restore for L2 AUX control register"
 	depends on ARCH_OMAP3 && PM
diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
index 371f2ed00eda..98a7b607873a 100644
--- a/arch/arm/plat-omap/Makefile
+++ b/arch/arm/plat-omap/Makefile
@@ -6,7 +6,7 @@
 ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
 
 # Common support
-obj-y := sram.o dma.o counter_32k.o
+obj-y := sram.o dma.o
 
 # omap_device support (OMAP2+ only at the moment)
 
diff --git a/arch/arm/plat-omap/counter_32k.c b/arch/arm/plat-omap/counter_32k.c
deleted file mode 100644
index 7a729ade2105..000000000000
--- a/arch/arm/plat-omap/counter_32k.c
+++ /dev/null
@@ -1,114 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * OMAP 32ksynctimer/counter_32k-related code
- *
- * Copyright (C) 2009 Texas Instruments
- * Copyright (C) 2010 Nokia Corporation
- * Tony Lindgren <tony@atomide.com>
- * Added OMAP4 support - Santosh Shilimkar <santosh.shilimkar@ti.com>
- *
- * NOTE: This timer is not the same timer as the old OMAP1 MPU timer.
- */
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/clocksource.h>
-#include <linux/sched_clock.h>
-
-#include <asm/mach/time.h>
-
-#include <plat/counter-32k.h>
-
-/* OMAP2_32KSYNCNT_CR_OFF: offset of 32ksync counter register */
-#define OMAP2_32KSYNCNT_REV_OFF		0x0
-#define OMAP2_32KSYNCNT_REV_SCHEME	(0x3 << 30)
-#define OMAP2_32KSYNCNT_CR_OFF_LOW	0x10
-#define OMAP2_32KSYNCNT_CR_OFF_HIGH	0x30
-
-/*
- * 32KHz clocksource ... always available, on pretty most chips except
- * OMAP 730 and 1510.  Other timers could be used as clocksources, with
- * higher resolution in free-running counter modes (e.g. 12 MHz xtal),
- * but systems won't necessarily want to spend resources that way.
- */
-static void __iomem *sync32k_cnt_reg;
-
-static u64 notrace omap_32k_read_sched_clock(void)
-{
-	return sync32k_cnt_reg ? readl_relaxed(sync32k_cnt_reg) : 0;
-}
-
-/**
- * omap_read_persistent_clock64 -  Return time from a persistent clock.
- *
- * Reads the time from a source which isn't disabled during PM, the
- * 32k sync timer.  Convert the cycles elapsed since last read into
- * nsecs and adds to a monotonically increasing timespec64.
- */
-static struct timespec64 persistent_ts;
-static cycles_t cycles;
-static unsigned int persistent_mult, persistent_shift;
-
-static void omap_read_persistent_clock64(struct timespec64 *ts)
-{
-	unsigned long long nsecs;
-	cycles_t last_cycles;
-
-	last_cycles = cycles;
-	cycles = sync32k_cnt_reg ? readl_relaxed(sync32k_cnt_reg) : 0;
-
-	nsecs = clocksource_cyc2ns(cycles - last_cycles,
-					persistent_mult, persistent_shift);
-
-	timespec64_add_ns(&persistent_ts, nsecs);
-
-	*ts = persistent_ts;
-}
-
-/**
- * omap_init_clocksource_32k - setup and register counter 32k as a
- * kernel clocksource
- * @pbase: base addr of counter_32k module
- * @size: size of counter_32k to map
- *
- * Returns 0 upon success or negative error code upon failure.
- *
- */
-int __init omap_init_clocksource_32k(void __iomem *vbase)
-{
-	int ret;
-
-	/*
-	 * 32k sync Counter IP register offsets vary between the
-	 * highlander version and the legacy ones.
-	 * The 'SCHEME' bits(30-31) of the revision register is used
-	 * to identify the version.
-	 */
-	if (readl_relaxed(vbase + OMAP2_32KSYNCNT_REV_OFF) &
-						OMAP2_32KSYNCNT_REV_SCHEME)
-		sync32k_cnt_reg = vbase + OMAP2_32KSYNCNT_CR_OFF_HIGH;
-	else
-		sync32k_cnt_reg = vbase + OMAP2_32KSYNCNT_CR_OFF_LOW;
-
-	/*
-	 * 120000 rough estimate from the calculations in
-	 * __clocksource_update_freq_scale.
-	 */
-	clocks_calc_mult_shift(&persistent_mult, &persistent_shift,
-			32768, NSEC_PER_SEC, 120000);
-
-	ret = clocksource_mmio_init(sync32k_cnt_reg, "32k_counter", 32768,
-				250, 32, clocksource_mmio_readl_up);
-	if (ret) {
-		pr_err("32k_counter: can't register clocksource\n");
-		return ret;
-	}
-
-	sched_clock_register(omap_32k_read_sched_clock, 32, 32768);
-	register_persistent_clock(omap_read_persistent_clock64);
-	pr_info("OMAP clocksource: 32k_counter at 32768 Hz\n");
-
-	return 0;
-}
diff --git a/arch/arm/plat-omap/include/plat/counter-32k.h b/arch/arm/plat-omap/include/plat/counter-32k.h
deleted file mode 100644
index da000d482ff2..000000000000
--- a/arch/arm/plat-omap/include/plat/counter-32k.h
+++ /dev/null
@@ -1 +0,0 @@
-int omap_init_clocksource_32k(void __iomem *vbase);
-- 
2.29.2

