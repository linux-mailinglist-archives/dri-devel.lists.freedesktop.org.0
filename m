Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D10C50737F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571AA10F0E6;
	Tue, 19 Apr 2022 16:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A742D10EF38
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:43:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2788C61871;
 Tue, 19 Apr 2022 16:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C435C385A5;
 Tue, 19 Apr 2022 16:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386613;
 bh=1CznP/IcfkJndLnXKlEqV7YtwAE/0IZ23NVP7Os5Lbk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gkyeNvpegI/KQIRWnjwkEYCied4Du61ntShcs66DzkQFnJHkJWp70dBzOiTP/ZG6j
 n96w9hkpW3grm9KvPbPA2R8JMHGs0B28jY9iQ2TtUgdW5V+XoN0ZLiqkWwVdMXxfJ1
 g4lG/kC3swRcBOnkw50SSbGy5I/KjmkMOKQ/SlEhuKtrq2jtmRtW2c5FwToKh8BGwy
 tQTv4ia+QOAVOVszdbwIbLvRCF+TpW81A0z+kf9LYr2Zgm++jGTXkxtLEd4wDmJIYw
 XmyDe5w2feEiHmwvkFrvwJr16KElh9yxIpw5HNExil/VCLxaA6PWzlCybRgA8G+uZe
 V5QDp19UieVxQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 36/48] cpufreq: pxa3: move clk register access to clk driver
Date: Tue, 19 Apr 2022 18:37:58 +0200
Message-Id: <20220419163810.2118169-37-arnd@kernel.org>
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

The driver needs some low-level register access for setting
the core and bus frequencies. These registers are owned
by the clk driver, so move the low-level access into that
driver with a slightly higher-level interface and avoid
any machine header file dependencies.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.h              |  1 -
 arch/arm/mach-pxa/include/mach/generic.h |  5 --
 arch/arm/mach-pxa/pxa3xx.c               |  1 +
 drivers/clk/pxa/clk-pxa3xx.c             | 16 ++++++
 drivers/cpufreq/pxa2xx-cpufreq.c         |  3 --
 drivers/cpufreq/pxa3xx-cpufreq.c         | 64 +++++++++++++-----------
 include/linux/clk/pxa.h                  |  9 ++++
 7 files changed, 62 insertions(+), 37 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/generic.h
 create mode 100644 include/linux/clk/pxa.h

diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 2f706ef97357..487eadb0fc2a 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -7,7 +7,6 @@
  */
 
 #include <linux/reboot.h>
-#include <mach/generic.h>
 
 struct irq_data;
 
diff --git a/arch/arm/mach-pxa/include/mach/generic.h b/arch/arm/mach-pxa/include/mach/generic.h
deleted file mode 100644
index 613f6a299d0d..000000000000
--- a/arch/arm/mach-pxa/include/mach/generic.h
+++ /dev/null
@@ -1,5 +0,0 @@
-#ifdef CONFIG_PXA3xx
-extern unsigned	pxa3xx_get_clk_frequency_khz(int);
-#else
-#define pxa3xx_get_clk_frequency_khz(x)		(0)
-#endif
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 7881888107c7..f4657f4edb3b 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -25,6 +25,7 @@
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/soc/pxa/cpu.h>
+#include <linux/clk/pxa.h>
 
 #include <asm/mach/map.h>
 #include <asm/suspend.h>
diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index 027b78183565..60a0db4f3790 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/soc/pxa/cpu.h>
 #include <mach/smemc.h>
+#include <linux/clk/pxa.h>
 #include <mach/pxa3xx-regs.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
@@ -79,6 +80,21 @@ unsigned int pxa3xx_get_clk_frequency_khz(int info)
 	return (unsigned int)clks[0] / KHz;
 }
 
+void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg, u32 mask)
+{
+	u32 accr = ACCR;
+
+	accr &= ~disable;
+	accr |= enable;
+
+	ACCR = accr;
+	if (xclkcfg)
+		__asm__("mcr p14, 0, %0, c6, c0, 0\n" : : "r"(xclkcfg));
+
+	while ((ACSR & mask) != (accr & mask))
+		cpu_relax();
+}
+
 static unsigned long clk_pxa3xx_ac97_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
diff --git a/drivers/cpufreq/pxa2xx-cpufreq.c b/drivers/cpufreq/pxa2xx-cpufreq.c
index e74d36d6f78d..ed1ae061a687 100644
--- a/drivers/cpufreq/pxa2xx-cpufreq.c
+++ b/drivers/cpufreq/pxa2xx-cpufreq.c
@@ -27,9 +27,6 @@
 #include <linux/soc/pxa/cpu.h>
 #include <linux/io.h>
 
-#include <mach/pxa2xx-regs.h>
-#include <mach/smemc.h>
-
 #ifdef DEBUG
 static unsigned int freq_debug;
 module_param(freq_debug, uint, 0);
diff --git a/drivers/cpufreq/pxa3xx-cpufreq.c b/drivers/cpufreq/pxa3xx-cpufreq.c
index d3b398b4aa6a..4afa48d172db 100644
--- a/drivers/cpufreq/pxa3xx-cpufreq.c
+++ b/drivers/cpufreq/pxa3xx-cpufreq.c
@@ -9,12 +9,10 @@
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/soc/pxa/cpu.h>
+#include <linux/clk/pxa.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 
-#include <mach/generic.h>
-#include <mach/pxa3xx-regs.h>
-
 #define HSS_104M	(0)
 #define HSS_156M	(1)
 #define HSS_208M	(2)
@@ -35,6 +33,28 @@
 #define DMCFS_26M	(0)
 #define DMCFS_260M	(3)
 
+#define ACCR_XPDIS		(1 << 31)	/* Core PLL Output Disable */
+#define ACCR_SPDIS		(1 << 30)	/* System PLL Output Disable */
+#define ACCR_D0CS		(1 << 26)	/* D0 Mode Clock Select */
+#define ACCR_PCCE		(1 << 11)	/* Power Mode Change Clock Enable */
+#define ACCR_DDR_D0CS		(1 << 7)	/* DDR SDRAM clock frequency in D0CS (PXA31x only) */
+
+#define ACCR_SMCFS_MASK		(0x7 << 23)	/* Static Memory Controller Frequency Select */
+#define ACCR_SFLFS_MASK		(0x3 << 18)	/* Frequency Select for Internal Memory Controller */
+#define ACCR_XSPCLK_MASK	(0x3 << 16)	/* Core Frequency during Frequency Change */
+#define ACCR_HSS_MASK		(0x3 << 14)	/* System Bus-Clock Frequency Select */
+#define ACCR_DMCFS_MASK		(0x3 << 12)	/* Dynamic Memory Controller Clock Frequency Select */
+#define ACCR_XN_MASK		(0x7 << 8)	/* Core PLL Turbo-Mode-to-Run-Mode Ratio */
+#define ACCR_XL_MASK		(0x1f)		/* Core PLL Run-Mode-to-Oscillator Ratio */
+
+#define ACCR_SMCFS(x)		(((x) & 0x7) << 23)
+#define ACCR_SFLFS(x)		(((x) & 0x3) << 18)
+#define ACCR_XSPCLK(x)		(((x) & 0x3) << 16)
+#define ACCR_HSS(x)		(((x) & 0x3) << 14)
+#define ACCR_DMCFS(x)		(((x) & 0x3) << 12)
+#define ACCR_XN(x)		(((x) & 0x7) << 8)
+#define ACCR_XL(x)		((x) & 0x1f)
+
 struct pxa3xx_freq_info {
 	unsigned int cpufreq_mhz;
 	unsigned int core_xl : 5;
@@ -112,41 +132,29 @@ static int setup_freqs_table(struct cpufreq_policy *policy,
 
 static void __update_core_freq(struct pxa3xx_freq_info *info)
 {
-	uint32_t mask = ACCR_XN_MASK | ACCR_XL_MASK;
-	uint32_t accr = ACCR;
-	uint32_t xclkcfg;
-
-	accr &= ~(ACCR_XN_MASK | ACCR_XL_MASK | ACCR_XSPCLK_MASK);
-	accr |= ACCR_XN(info->core_xn) | ACCR_XL(info->core_xl);
+	u32 mask, disable, enable, xclkcfg;
 
+	mask	= ACCR_XN_MASK | ACCR_XL_MASK;
+	disable = mask | ACCR_XSPCLK_MASK;
+	enable  = ACCR_XN(info->core_xn) | ACCR_XL(info->core_xl);
 	/* No clock until core PLL is re-locked */
-	accr |= ACCR_XSPCLK(XSPCLK_NONE);
-
+	enable |= ACCR_XSPCLK(XSPCLK_NONE);
 	xclkcfg = (info->core_xn == 2) ? 0x3 : 0x2;	/* turbo bit */
 
-	ACCR = accr;
-	__asm__("mcr p14, 0, %0, c6, c0, 0\n" : : "r"(xclkcfg));
-
-	while ((ACSR & mask) != (accr & mask))
-		cpu_relax();
+	pxa3xx_clk_update_accr(disable, enable, xclkcfg, mask);
 }
 
 static void __update_bus_freq(struct pxa3xx_freq_info *info)
 {
-	uint32_t mask;
-	uint32_t accr = ACCR;
-
-	mask = ACCR_SMCFS_MASK | ACCR_SFLFS_MASK | ACCR_HSS_MASK |
-		ACCR_DMCFS_MASK;
-
-	accr &= ~mask;
-	accr |= ACCR_SMCFS(info->smcfs) | ACCR_SFLFS(info->sflfs) |
-		ACCR_HSS(info->hss) | ACCR_DMCFS(info->dmcfs);
+	u32 mask, disable, enable;
 
-	ACCR = accr;
+	mask	= ACCR_SMCFS_MASK | ACCR_SFLFS_MASK | ACCR_HSS_MASK |
+		  ACCR_DMCFS_MASK;
+	disable = mask;
+	enable	= ACCR_SMCFS(info->smcfs) | ACCR_SFLFS(info->sflfs) |
+		  ACCR_HSS(info->hss) | ACCR_DMCFS(info->dmcfs);
 
-	while ((ACSR & mask) != (accr & mask))
-		cpu_relax();
+	pxa3xx_clk_update_accr(disable, enable, 0, mask);
 }
 
 static unsigned int pxa3xx_cpufreq_get(unsigned int cpu)
diff --git a/include/linux/clk/pxa.h b/include/linux/clk/pxa.h
new file mode 100644
index 000000000000..e5516c608c99
--- /dev/null
+++ b/include/linux/clk/pxa.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifdef CONFIG_PXA3xx
+extern unsigned	pxa3xx_get_clk_frequency_khz(int);
+extern void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg, u32 mask);
+#else
+#define pxa3xx_get_clk_frequency_khz(x)		(0)
+#define pxa3xx_clk_update_accr(disable, enable, xclkcfg, mask) do { } while (0)
+#endif
-- 
2.29.2

