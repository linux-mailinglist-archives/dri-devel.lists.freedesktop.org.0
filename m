Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB8507380
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466A410F105;
	Tue, 19 Apr 2022 16:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1621A10F11A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:43:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EE11B81BF1;
 Tue, 19 Apr 2022 16:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D32AC385A7;
 Tue, 19 Apr 2022 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386621;
 bh=/Prqr04i1fpscHVDuVcgCmngsY3hyx249dIBGFreq2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y3PA1gNBpWemWTKgXNfQE6gZ2lkQ2OFkd5OEDO01xwY7wK6BGc9IgzXVFUA0bOzmZ
 IdxCFkit5T5OsWlQE5O+YIuaAvNKouAQPTTolrYkcjfQij7Q0LwfC8hhcM+pUKrArL
 jV+yRfNhU4PQ+WoL1zX7EbhPcVQ14Zq9MQGKIATzI5hPOS5KUZWHKSLomaqNqAoJ56
 IDOxvX2ZFZltZq/w38uCesi0fdH8Nymt/I05daQ0ly4mZIZ+Mu5zj4YzGfVJGkUh2W
 5EvHWtWx1sIW2sQh+QuJzgReXLIELwok/SAnSo1kypQDxD/mQa+4Sz3q3cq7wQQ5sQ
 /4GyTOFmHOlXQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 37/48] ARM: pxa: move smemc register access from clk to
 platform
Date: Tue, 19 Apr 2022 18:37:59 +0200
Message-Id: <20220419163810.2118169-38-arnd@kernel.org>
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

The get_sdram_rows() and get_memclkdiv() helpers need smemc
register that are separate from the clk registers, move
them out of the clk driver, and use an extern declaration
instead.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Link: https://lore.kernel.org/lkml/87pnielzo4.fsf@belgarion.home/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.c   |  6 ++++++
 arch/arm/mach-pxa/pxa2xx.c    | 25 +++++++++++++++++++++++++
 arch/arm/mach-pxa/pxa3xx.c    |  4 ++++
 arch/arm/mach-pxa/smemc.c     |  9 +++++++++
 drivers/clk/pxa/clk-pxa.c     |  4 +++-
 drivers/clk/pxa/clk-pxa.h     |  5 +++--
 drivers/clk/pxa/clk-pxa25x.c  | 30 +++---------------------------
 drivers/clk/pxa/clk-pxa27x.c  | 31 +++----------------------------
 drivers/clk/pxa/clk-pxa3xx.c  |  8 +++-----
 include/linux/soc/pxa/smemc.h |  3 +++
 10 files changed, 62 insertions(+), 63 deletions(-)

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 2c2c82fcf9cb..971d25e95a1a 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/soc/pxa/cpu.h>
+#include <linux/soc/pxa/smemc.h>
 
 #include <asm/mach/map.h>
 #include <asm/mach-types.h>
@@ -84,6 +85,11 @@ void pxa_smemc_set_pcmcia_socket(int nr)
 }
 EXPORT_SYMBOL_GPL(pxa_smemc_set_pcmcia_socket);
 
+void __iomem *pxa_smemc_get_mdrefr(void)
+{
+	return MDREFR;
+}
+
 /*
  * Intel PXA2xx internal register mapping.
  *
diff --git a/arch/arm/mach-pxa/pxa2xx.c b/arch/arm/mach-pxa/pxa2xx.c
index ac72acb43e26..f583759ac00d 100644
--- a/arch/arm/mach-pxa/pxa2xx.c
+++ b/arch/arm/mach-pxa/pxa2xx.c
@@ -15,6 +15,7 @@
 #include <mach/pxa2xx-regs.h>
 #include "mfp-pxa25x.h"
 #include <mach/reset.h>
+#include <mach/smemc.h>
 #include <linux/platform_data/irda-pxaficp.h>
 
 void pxa2xx_clear_reset_status(unsigned int mask)
@@ -50,3 +51,27 @@ void pxa2xx_transceiver_mode(struct device *dev, int mode)
 		BUG();
 }
 EXPORT_SYMBOL_GPL(pxa2xx_transceiver_mode);
+
+#define MDCNFG_DRAC2(mdcnfg)	(((mdcnfg) >> 21) & 0x3)
+#define MDCNFG_DRAC0(mdcnfg)	(((mdcnfg) >> 5) & 0x3)
+
+int pxa2xx_smemc_get_sdram_rows(void)
+{
+	static int sdram_rows;
+	unsigned int drac2 = 0, drac0 = 0;
+	u32 mdcnfg;
+
+	if (sdram_rows)
+		return sdram_rows;
+
+	mdcnfg = readl_relaxed(MDCNFG);
+
+	if (mdcnfg & (MDCNFG_DE2 | MDCNFG_DE3))
+		drac2 = MDCNFG_DRAC2(mdcnfg);
+
+	if (mdcnfg & (MDCNFG_DE0 | MDCNFG_DE1))
+		drac0 = MDCNFG_DRAC0(mdcnfg);
+
+	sdram_rows = 1 << (11 + max(drac0, drac2));
+	return sdram_rows;
+}
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index f4657f4edb3b..d486efb79dcd 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -52,6 +52,10 @@ extern void __init pxa_dt_irq_init(int (*fn)(struct irq_data *, unsigned int));
 #define NDCR_ND_ARB_EN		(1 << 12)
 #define NDCR_ND_ARB_CNTL	(1 << 19)
 
+#define CKEN_BOOT  		11      /* < Boot rom clock enable */
+#define CKEN_TPM   		19      /* < TPM clock enable */
+#define CKEN_HSIO2 		41      /* < HSIO2 clock enable */
+
 #ifdef CONFIG_PM
 
 #define ISRAM_START	0x5c000000
diff --git a/arch/arm/mach-pxa/smemc.c b/arch/arm/mach-pxa/smemc.c
index 47b99549d616..da0eeafdb5a0 100644
--- a/arch/arm/mach-pxa/smemc.c
+++ b/arch/arm/mach-pxa/smemc.c
@@ -69,4 +69,13 @@ static int __init smemc_init(void)
 	return 0;
 }
 subsys_initcall(smemc_init);
+
 #endif
+
+static const unsigned int df_clkdiv[4] = { 1, 2, 4, 1 };
+unsigned int pxa3xx_smemc_get_memclkdiv(void)
+{
+	unsigned long memclkcfg = __raw_readl(MEMCLKCFG);
+
+	return	df_clkdiv[(memclkcfg >> 16) & 0x3];
+}
diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index cfc79f942b07..831180360069 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -11,6 +11,7 @@
 #include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/soc/pxa/smemc.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
@@ -150,12 +151,13 @@ void pxa2xx_core_turbo_switch(bool on)
 }
 
 void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
-			u32 (*mdrefr_dri)(unsigned int), void __iomem *mdrefr,
+			u32 (*mdrefr_dri)(unsigned int),
 			void __iomem *cccr)
 {
 	unsigned int clkcfg = freq->clkcfg;
 	unsigned int unused, preset_mdrefr, postset_mdrefr;
 	unsigned long flags;
+	void __iomem *mdrefr = pxa_smemc_get_mdrefr();
 
 	local_irq_save(flags);
 
diff --git a/drivers/clk/pxa/clk-pxa.h b/drivers/clk/pxa/clk-pxa.h
index 5768e0f728ce..bd688fdb7ecc 100644
--- a/drivers/clk/pxa/clk-pxa.h
+++ b/drivers/clk/pxa/clk-pxa.h
@@ -146,12 +146,13 @@ static inline int dummy_clk_set_parent(struct clk_hw *hw, u8 index)
 
 extern void clkdev_pxa_register(int ckid, const char *con_id,
 				const char *dev_id, struct clk *clk);
-extern int clk_pxa_cken_init(const struct desc_clk_cken *clks, int nb_clks);
+extern int clk_pxa_cken_init(const struct desc_clk_cken *clks,
+			     int nb_clks);
 void clk_pxa_dt_common_init(struct device_node *np);
 
 void pxa2xx_core_turbo_switch(bool on);
 void pxa2xx_cpll_change(struct pxa2xx_freq *freq,
-			u32 (*mdrefr_dri)(unsigned int), void __iomem *mdrefr,
+			u32 (*mdrefr_dri)(unsigned int),
 			void __iomem *cccr);
 int pxa2xx_determine_rate(struct clk_rate_request *req,
 			  struct pxa2xx_freq *freqs,  int nb_freqs);
diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index d0f957996acb..0837d59d7a67 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -15,7 +15,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <mach/pxa2xx-regs.h>
-#include <mach/smemc.h>
+#include <linux/soc/pxa/smemc.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
@@ -33,9 +33,6 @@ enum {
 	 ((T) ? CLKCFG_TURBO : 0))
 #define PXA25x_CCCR(N2, M, L) (N2 << 7 | M << 5 | L)
 
-#define MDCNFG_DRAC2(mdcnfg)	(((mdcnfg) >> 21) & 0x3)
-#define MDCNFG_DRAC0(mdcnfg)	(((mdcnfg) >> 5) & 0x3)
-
 /* Define the refresh period in mSec for the SDRAM and the number of rows */
 #define SDRAM_TREF	64	/* standard 64ms SDRAM */
 
@@ -57,30 +54,9 @@ static const char * const get_freq_khz[] = {
 	"core", "run", "cpll", "memory"
 };
 
-static int get_sdram_rows(void)
-{
-	static int sdram_rows;
-	unsigned int drac2 = 0, drac0 = 0;
-	u32 mdcnfg;
-
-	if (sdram_rows)
-		return sdram_rows;
-
-	mdcnfg = readl_relaxed(MDCNFG);
-
-	if (mdcnfg & (MDCNFG_DE2 | MDCNFG_DE3))
-		drac2 = MDCNFG_DRAC2(mdcnfg);
-
-	if (mdcnfg & (MDCNFG_DE0 | MDCNFG_DE1))
-		drac0 = MDCNFG_DRAC0(mdcnfg);
-
-	sdram_rows = 1 << (11 + max(drac0, drac2));
-	return sdram_rows;
-}
-
 static u32 mdrefr_dri(unsigned int freq_khz)
 {
-	u32 interval = freq_khz * SDRAM_TREF / get_sdram_rows();
+	u32 interval = freq_khz * SDRAM_TREF / pxa2xx_smemc_get_sdram_rows();
 
 	return interval / 32;
 }
@@ -268,7 +244,7 @@ static int clk_pxa25x_cpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (i >= ARRAY_SIZE(pxa25x_freqs))
 		return -EINVAL;
 
-	pxa2xx_cpll_change(&pxa25x_freqs[i], mdrefr_dri, MDREFR, CCCR);
+	pxa2xx_cpll_change(&pxa25x_freqs[i], mdrefr_dri, CCCR);
 
 	return 0;
 }
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 7b123105b5de..ba3aa63f2447 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -12,8 +12,7 @@
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/of.h>
-
-#include <mach/smemc.h>
+#include <linux/soc/pxa/smemc.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
@@ -50,9 +49,6 @@ enum {
 	 ((T)  ? CLKCFG_TURBO : 0))
 #define PXA27x_CCCR(A, L, N2) (A << 25 | N2 << 7 | L)
 
-#define MDCNFG_DRAC2(mdcnfg)	(((mdcnfg) >> 21) & 0x3)
-#define MDCNFG_DRAC0(mdcnfg)	(((mdcnfg) >> 5) & 0x3)
-
 /* Define the refresh period in mSec for the SDRAM and the number of rows */
 #define SDRAM_TREF	64	/* standard 64ms SDRAM */
 
@@ -61,30 +57,9 @@ static const char * const get_freq_khz[] = {
 	"system_bus"
 };
 
-static int get_sdram_rows(void)
-{
-	static int sdram_rows;
-	unsigned int drac2 = 0, drac0 = 0;
-	u32 mdcnfg;
-
-	if (sdram_rows)
-		return sdram_rows;
-
-	mdcnfg = readl_relaxed(MDCNFG);
-
-	if (mdcnfg & (MDCNFG_DE2 | MDCNFG_DE3))
-		drac2 = MDCNFG_DRAC2(mdcnfg);
-
-	if (mdcnfg & (MDCNFG_DE0 | MDCNFG_DE1))
-		drac0 = MDCNFG_DRAC0(mdcnfg);
-
-	sdram_rows = 1 << (11 + max(drac0, drac2));
-	return sdram_rows;
-}
-
 static u32 mdrefr_dri(unsigned int freq_khz)
 {
-	u32 interval = freq_khz * SDRAM_TREF / get_sdram_rows();
+	u32 interval = freq_khz * SDRAM_TREF / pxa2xx_smemc_get_sdram_rows();
 
 	return (interval - 31) / 32;
 }
@@ -260,7 +235,7 @@ static int clk_pxa27x_cpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (i >= ARRAY_SIZE(pxa27x_freqs))
 		return -EINVAL;
 
-	pxa2xx_cpll_change(&pxa27x_freqs[i], mdrefr_dri, MDREFR, CCCR);
+	pxa2xx_cpll_change(&pxa27x_freqs[i], mdrefr_dri, CCCR);
 	return 0;
 }
 
diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index 60a0db4f3790..08594fc899e2 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -15,7 +15,7 @@
 #include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/soc/pxa/cpu.h>
-#include <mach/smemc.h>
+#include <linux/soc/pxa/smemc.h>
 #include <linux/clk/pxa.h>
 #include <mach/pxa3xx-regs.h>
 
@@ -41,8 +41,6 @@ static unsigned char hss_mult[4] = { 8, 12, 16, 24 };
 
 /* crystal frequency to static memory controller multiplier (SMCFS) */
 static unsigned int smcfs_mult[8] = { 6, 0, 8, 0, 0, 16, };
-static unsigned int df_clkdiv[4] = { 1, 2, 4, 1 };
-
 static const char * const get_freq_khz[] = {
 	"core", "ring_osc_60mhz", "run", "cpll", "system_bus"
 };
@@ -118,10 +116,10 @@ static unsigned long clk_pxa3xx_smemc_get_rate(struct clk_hw *hw,
 					      unsigned long parent_rate)
 {
 	unsigned long acsr = ACSR;
-	unsigned long memclkcfg = __raw_readl(MEMCLKCFG);
 
 	return (parent_rate / 48)  * smcfs_mult[(acsr >> 23) & 0x7] /
-		df_clkdiv[(memclkcfg >> 16) & 0x3];
+		pxa3xx_smemc_get_memclkdiv();
+
 }
 PARENTS(clk_pxa3xx_smemc) = { "spll_624mhz" };
 RATE_RO_OPS(clk_pxa3xx_smemc, "smemc");
diff --git a/include/linux/soc/pxa/smemc.h b/include/linux/soc/pxa/smemc.h
index cbf1a2d8af29..f1ffea236c15 100644
--- a/include/linux/soc/pxa/smemc.h
+++ b/include/linux/soc/pxa/smemc.h
@@ -6,5 +6,8 @@
 
 void pxa_smemc_set_pcmcia_timing(int sock, u32 mcmem, u32 mcatt, u32 mcio);
 void pxa_smemc_set_pcmcia_socket(int nr);
+int pxa2xx_smemc_get_sdram_rows(void);
+unsigned int pxa3xx_smemc_get_memclkdiv(void);
+void __iomem *pxa_smemc_get_mdrefr(void);
 
 #endif
-- 
2.29.2

