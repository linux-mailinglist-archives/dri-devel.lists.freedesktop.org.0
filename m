Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B4507381
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDD610EF41;
	Tue, 19 Apr 2022 16:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF3510EF41
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:43:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 633BCB81BEB;
 Tue, 19 Apr 2022 16:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE18C385A9;
 Tue, 19 Apr 2022 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386629;
 bh=ICMuEGfp6s9e2emTB2VAPlX7IL489XUznTNTHRY9IVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=plFekV+H5CW9ZIOsUM9lNaO/nQt42tzxQyCYNw2PEnQPCqOZlUEzcoYBKkgF3mK77
 nL2KhWkz7Y0YifTkamoQ+kAdEZhpWv2A9efvS0ipOiuc1ZLJutEopr3OwPmMebw6on
 KKQpb72QBEIXtoKXypDxcP7vSt3j8Mbhp5b7CMUCZEN+jyimCCj0NQfgUNLpjkuFXw
 nw5Is1jnKyieDBxwKMLkx5gVMST+T3Su8d7Tpr+4arwjvx8xKdldTlyuffonYNf9iS
 FeBnRyAJd0pfsBU082u5zVgnsWK8sAxaWXx1D76V3NnKmYhEYZErgnO/MtTHYLMMPP
 PePRddAyAs6nQ==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 38/48] ARM: pxa: move clk register definitions to driver
Date: Tue, 19 Apr 2022 18:38:00 +0200
Message-Id: <20220419163810.2118169-39-arnd@kernel.org>
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

The clock register definitions are now used (almost) exclusively in the
clk driver, and that relies on no other mach/*.h header files any more.

Remove the dependency on mach/pxa*-regs.h by addressing the registers
as offsets from a void __iomem * pointer, which is either passed from
a board file, or (for the moment) ioremapped at boot time from a hardcoded
address in case of DT (this should be moved into the DT of course).

Cc: linux-clk@vger.kernel.org
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.c                  |   7 +-
 arch/arm/mach-pxa/generic.h                  |   3 -
 arch/arm/mach-pxa/include/mach/pxa2xx-regs.h |  45 -------
 arch/arm/mach-pxa/include/mach/pxa3xx-regs.h |  69 -----------
 arch/arm/mach-pxa/sleep.S                    |   4 +-
 drivers/clk/pxa/clk-pxa.c                    |   4 +-
 drivers/clk/pxa/clk-pxa.h                    |   6 +-
 drivers/clk/pxa/clk-pxa25x.c                 |  18 +--
 drivers/clk/pxa/clk-pxa27x.c                 |  39 +++---
 drivers/clk/pxa/clk-pxa2xx.h                 |  58 +++++++++
 drivers/clk/pxa/clk-pxa3xx.c                 | 120 +++++++++++++++----
 include/linux/clk/pxa.h                      |   7 ++
 12 files changed, 210 insertions(+), 170 deletions(-)
 create mode 100644 drivers/clk/pxa/clk-pxa2xx.h

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index 971d25e95a1a..91ea063dc54d 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/soc/pxa/cpu.h>
 #include <linux/soc/pxa/smemc.h>
+#include <linux/clk/pxa.h>
 
 #include <asm/mach/map.h>
 #include <asm/mach-types.h>
@@ -48,11 +49,11 @@ void clear_reset_status(unsigned int mask)
 void __init pxa_timer_init(void)
 {
 	if (cpu_is_pxa25x())
-		pxa25x_clocks_init();
+		pxa25x_clocks_init(io_p2v(0x41300000));
 	if (cpu_is_pxa27x())
-		pxa27x_clocks_init();
+		pxa27x_clocks_init(io_p2v(0x41300000));
 	if (cpu_is_pxa3xx())
-		pxa3xx_clocks_init();
+		pxa3xx_clocks_init(io_p2v(0x41340000), io_p2v(0x41350000));
 	pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000));
 }
 
diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 487eadb0fc2a..7bb1499de4c5 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -22,19 +22,16 @@ extern void pxa_timer_init(void);
 #define ARRAY_AND_SIZE(x)	(x), ARRAY_SIZE(x)
 
 #define pxa25x_handle_irq icip_handle_irq
-extern int __init pxa25x_clocks_init(void);
 extern void __init pxa25x_init_irq(void);
 extern void __init pxa25x_map_io(void);
 extern void __init pxa26x_init_irq(void);
 
 #define pxa27x_handle_irq ichp_handle_irq
-extern int __init pxa27x_clocks_init(void);
 extern unsigned	pxa27x_get_clk_frequency_khz(int);
 extern void __init pxa27x_init_irq(void);
 extern void __init pxa27x_map_io(void);
 
 #define pxa3xx_handle_irq ichp_handle_irq
-extern int __init pxa3xx_clocks_init(void);
 extern void __init pxa3xx_init_irq(void);
 extern void __init pxa3xx_map_io(void);
 
diff --git a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h b/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
index f68b573ab4a0..0b7eaf6b5813 100644
--- a/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
+++ b/arch/arm/mach-pxa/include/mach/pxa2xx-regs.h
@@ -136,51 +136,6 @@
 #define CKEN		io_p2v(0x41300004)  /* Clock Enable Register */
 #define OSCC		io_p2v(0x41300008)  /* Oscillator Configuration Register */
 
-#define CCCR_N_MASK	0x0380	/* Run Mode Frequency to Turbo Mode Frequency Multiplier */
-#define CCCR_M_MASK	0x0060	/* Memory Frequency to Run Mode Frequency Multiplier */
-#define CCCR_L_MASK	0x001f	/* Crystal Frequency to Memory Frequency Multiplier */
-
-#define CCCR_CPDIS_BIT	(31)
-#define CCCR_PPDIS_BIT	(30)
-#define CCCR_LCD_26_BIT	(27)
-#define CCCR_A_BIT	(25)
-
-#define CCSR_N2_MASK	CCCR_N_MASK
-#define CCSR_M_MASK	CCCR_M_MASK
-#define CCSR_L_MASK	CCCR_L_MASK
-#define CCSR_N2_SHIFT	7
-
-#define CKEN_AC97CONF   (31)    /* AC97 Controller Configuration */
-#define CKEN_CAMERA	(24)	/* Camera Interface Clock Enable */
-#define CKEN_SSP1	(23)	/* SSP1 Unit Clock Enable */
-#define CKEN_MEMC	(22)	/* Memory Controller Clock Enable */
-#define CKEN_MEMSTK	(21)	/* Memory Stick Host Controller */
-#define CKEN_IM		(20)	/* Internal Memory Clock Enable */
-#define CKEN_KEYPAD	(19)	/* Keypad Interface Clock Enable */
-#define CKEN_USIM	(18)	/* USIM Unit Clock Enable */
-#define CKEN_MSL	(17)	/* MSL Unit Clock Enable */
-#define CKEN_LCD	(16)	/* LCD Unit Clock Enable */
-#define CKEN_PWRI2C	(15)	/* PWR I2C Unit Clock Enable */
-#define CKEN_I2C	(14)	/* I2C Unit Clock Enable */
-#define CKEN_FICP	(13)	/* FICP Unit Clock Enable */
-#define CKEN_MMC	(12)	/* MMC Unit Clock Enable */
-#define CKEN_USB	(11)	/* USB Unit Clock Enable */
-#define CKEN_ASSP	(10)	/* ASSP (SSP3) Clock Enable */
-#define CKEN_USBHOST	(10)	/* USB Host Unit Clock Enable */
-#define CKEN_OSTIMER	(9)	/* OS Timer Unit Clock Enable */
-#define CKEN_NSSP	(9)	/* NSSP (SSP2) Clock Enable */
-#define CKEN_I2S	(8)	/* I2S Unit Clock Enable */
-#define CKEN_BTUART	(7)	/* BTUART Unit Clock Enable */
-#define CKEN_FFUART	(6)	/* FFUART Unit Clock Enable */
-#define CKEN_STUART	(5)	/* STUART Unit Clock Enable */
-#define CKEN_HWUART	(4)	/* HWUART Unit Clock Enable */
-#define CKEN_SSP3	(4)	/* SSP3 Unit Clock Enable */
-#define CKEN_SSP	(3)	/* SSP Unit Clock Enable */
-#define CKEN_SSP2	(3)	/* SSP2 Unit Clock Enable */
-#define CKEN_AC97	(2)	/* AC97 Unit Clock Enable */
-#define CKEN_PWM1	(1)	/* PWM1 Clock Enable */
-#define CKEN_PWM0	(0)	/* PWM0 Clock Enable */
-
 #define OSCC_OON	(1 << 1)	/* 32.768kHz OON (write-once only bit) */
 #define OSCC_OOK	(1 << 0)	/* 32.768kHz OOK (read-only bit) */
 
diff --git a/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h b/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
index 8eb1ba533e1c..4b11cf81a9e6 100644
--- a/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
+++ b/arch/arm/mach-pxa/include/mach/pxa3xx-regs.h
@@ -131,73 +131,4 @@
 #define CKENC		__REG(0x41340024)	/* C Clock Enable Register */
 #define AC97_DIV	__REG(0x41340014)	/* AC97 clock divisor value register */
 
-#define ACCR_XPDIS		(1 << 31)	/* Core PLL Output Disable */
-#define ACCR_SPDIS		(1 << 30)	/* System PLL Output Disable */
-#define ACCR_D0CS		(1 << 26)	/* D0 Mode Clock Select */
-#define ACCR_PCCE		(1 << 11)	/* Power Mode Change Clock Enable */
-#define ACCR_DDR_D0CS		(1 << 7)	/* DDR SDRAM clock frequency in D0CS (PXA31x only) */
-
-#define ACCR_SMCFS_MASK		(0x7 << 23)	/* Static Memory Controller Frequency Select */
-#define ACCR_SFLFS_MASK		(0x3 << 18)	/* Frequency Select for Internal Memory Controller */
-#define ACCR_XSPCLK_MASK	(0x3 << 16)	/* Core Frequency during Frequency Change */
-#define ACCR_HSS_MASK		(0x3 << 14)	/* System Bus-Clock Frequency Select */
-#define ACCR_DMCFS_MASK		(0x3 << 12)	/* Dynamic Memory Controller Clock Frequency Select */
-#define ACCR_XN_MASK		(0x7 << 8)	/* Core PLL Turbo-Mode-to-Run-Mode Ratio */
-#define ACCR_XL_MASK		(0x1f)		/* Core PLL Run-Mode-to-Oscillator Ratio */
-
-#define ACCR_SMCFS(x)		(((x) & 0x7) << 23)
-#define ACCR_SFLFS(x)		(((x) & 0x3) << 18)
-#define ACCR_XSPCLK(x)		(((x) & 0x3) << 16)
-#define ACCR_HSS(x)		(((x) & 0x3) << 14)
-#define ACCR_DMCFS(x)		(((x) & 0x3) << 12)
-#define ACCR_XN(x)		(((x) & 0x7) << 8)
-#define ACCR_XL(x)		((x) & 0x1f)
-
-/*
- * Clock Enable Bit
- */
-#define CKEN_LCD	1	/* < LCD Clock Enable */
-#define CKEN_USBH	2	/* < USB host clock enable */
-#define CKEN_CAMERA	3	/* < Camera interface clock enable */
-#define CKEN_NAND	4	/* < NAND Flash Controller Clock Enable */
-#define CKEN_USB2	6	/* < USB 2.0 client clock enable. */
-#define CKEN_DMC	8	/* < Dynamic Memory Controller clock enable */
-#define CKEN_SMC	9	/* < Static Memory Controller clock enable */
-#define CKEN_ISC	10	/* < Internal SRAM Controller clock enable */
-#define CKEN_BOOT	11	/* < Boot rom clock enable */
-#define CKEN_MMC1	12	/* < MMC1 Clock enable */
-#define CKEN_MMC2	13	/* < MMC2 clock enable */
-#define CKEN_KEYPAD	14	/* < Keypand Controller Clock Enable */
-#define CKEN_CIR	15	/* < Consumer IR Clock Enable */
-#define CKEN_USIM0	17	/* < USIM[0] Clock Enable */
-#define CKEN_USIM1	18	/* < USIM[1] Clock Enable */
-#define CKEN_TPM	19	/* < TPM clock enable */
-#define CKEN_UDC	20	/* < UDC clock enable */
-#define CKEN_BTUART	21	/* < BTUART clock enable */
-#define CKEN_FFUART	22	/* < FFUART clock enable */
-#define CKEN_STUART	23	/* < STUART clock enable */
-#define CKEN_AC97	24	/* < AC97 clock enable */
-#define CKEN_TOUCH	25	/* < Touch screen Interface Clock Enable */
-#define CKEN_SSP1	26	/* < SSP1 clock enable */
-#define CKEN_SSP2	27	/* < SSP2 clock enable */
-#define CKEN_SSP3	28	/* < SSP3 clock enable */
-#define CKEN_SSP4	29	/* < SSP4 clock enable */
-#define CKEN_MSL0	30	/* < MSL0 clock enable */
-#define CKEN_PWM0	32	/* < PWM[0] clock enable */
-#define CKEN_PWM1	33	/* < PWM[1] clock enable */
-#define CKEN_I2C	36	/* < I2C clock enable */
-#define CKEN_INTC	38	/* < Interrupt controller clock enable */
-#define CKEN_GPIO	39	/* < GPIO clock enable */
-#define CKEN_1WIRE	40	/* < 1-wire clock enable */
-#define CKEN_HSIO2	41	/* < HSIO2 clock enable */
-#define CKEN_MINI_IM	48	/* < Mini-IM */
-#define CKEN_MINI_LCD	49	/* < Mini LCD */
-
-#define CKEN_MMC3	5	/* < MMC3 Clock Enable */
-#define CKEN_MVED	43	/* < MVED clock enable */
-
-/* Note: GCU clock enable bit differs on PXA300/PXA310 and PXA320 */
-#define CKEN_PXA300_GCU		42	/* Graphics controller clock enable */
-#define CKEN_PXA320_GCU		7	/* Graphics controller clock enable */
-
 #endif /* __ASM_ARCH_PXA3XX_REGS_H */
diff --git a/arch/arm/mach-pxa/sleep.S b/arch/arm/mach-pxa/sleep.S
index 272efeb954f4..ab50fe2cf923 100644
--- a/arch/arm/mach-pxa/sleep.S
+++ b/arch/arm/mach-pxa/sleep.S
@@ -18,7 +18,9 @@
 
 #define MDREFR_KDIV	0x200a4000	// all banks
 #define CCCR_SLEEP	0x00000107	// L=7 2N=2 A=0 PPDIS=0 CPDIS=0
-
+#define CCCR_N_MASK     0x00000380
+#define CCCR_M_MASK     0x00000060
+#define CCCR_L_MASK     0x0000001f
 		.text
 
 #ifdef CONFIG_PXA3xx
diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index 831180360069..03de634efc52 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -95,7 +95,8 @@ void __init clkdev_pxa_register(int ckid, const char *con_id,
 		clk_register_clkdev(clk, con_id, dev_id);
 }
 
-int __init clk_pxa_cken_init(const struct desc_clk_cken *clks, int nb_clks)
+int __init clk_pxa_cken_init(const struct desc_clk_cken *clks,
+			     int nb_clks, void __iomem *clk_regs)
 {
 	int i;
 	struct pxa_clk *pxa_clk;
@@ -107,6 +108,7 @@ int __init clk_pxa_cken_init(const struct desc_clk_cken *clks, int nb_clks)
 		pxa_clk->lp = clks[i].lp;
 		pxa_clk->hp = clks[i].hp;
 		pxa_clk->gate = clks[i].gate;
+		pxa_clk->gate.reg = clk_regs + clks[i].cken_reg;
 		pxa_clk->gate.lock = &pxa_clk_lock;
 		clk = clk_register_composite(NULL, clks[i].name,
 					     clks[i].parent_names, 2,
diff --git a/drivers/clk/pxa/clk-pxa.h b/drivers/clk/pxa/clk-pxa.h
index bd688fdb7ecc..7ec2d2821d8f 100644
--- a/drivers/clk/pxa/clk-pxa.h
+++ b/drivers/clk/pxa/clk-pxa.h
@@ -105,6 +105,7 @@
 struct desc_clk_cken {
 	struct clk_hw hw;
 	int ckid;
+	int cken_reg;
 	const char *name;
 	const char *dev_id;
 	const char *con_id;
@@ -119,11 +120,12 @@ struct desc_clk_cken {
 #define PXA_CKEN(_dev_id, _con_id, _name, parents, _mult_lp, _div_lp,	\
 		 _mult_hp, _div_hp, is_lp, _cken_reg, _cken_bit, flag)	\
 	{ .ckid = CLK_ ## _name, .name = #_name,			\
+	  .cken_reg = _cken_reg,					\
 	  .dev_id = _dev_id, .con_id = _con_id,	.parent_names = parents,\
 	  .lp = { .mult = _mult_lp, .div = _div_lp },			\
 	  .hp = { .mult = _mult_hp, .div = _div_hp },			\
 	  .is_in_low_power = is_lp,					\
-	  .gate = { .reg = (void __iomem *)_cken_reg, .bit_idx = _cken_bit }, \
+	  .gate = { .bit_idx = _cken_bit }, \
 	  .flags = flag,						\
 	}
 #define PXA_CKEN_1RATE(dev_id, con_id, name, parents, cken_reg,		\
@@ -147,7 +149,7 @@ static inline int dummy_clk_set_parent(struct clk_hw *hw, u8 index)
 extern void clkdev_pxa_register(int ckid, const char *con_id,
 				const char *dev_id, struct clk *clk);
 extern int clk_pxa_cken_init(const struct desc_clk_cken *clks,
-			     int nb_clks);
+			     int nb_clks, void __iomem *clk_regs);
 void clk_pxa_dt_common_init(struct device_node *np);
 
 void pxa2xx_core_turbo_switch(bool on);
diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index 0837d59d7a67..93d5907b8530 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -14,11 +14,11 @@
 #include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <mach/pxa2xx-regs.h>
 #include <linux/soc/pxa/smemc.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
+#include "clk-pxa2xx.h"
 
 #define KHz 1000
 #define MHz (1000 * 1000)
@@ -39,6 +39,7 @@ enum {
 /*
  * Various clock factors driven by the CCCR register.
  */
+static void __iomem *clk_regs;
 
 /* Crystal Frequency to Memory Frequency Multiplier (L) */
 static unsigned char L_clk_mult[32] = { 0, 27, 32, 36, 40, 45, 0, };
@@ -97,7 +98,7 @@ unsigned int pxa25x_get_clk_frequency_khz(int info)
 static unsigned long clk_pxa25x_memory_get_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
-	unsigned long cccr = readl(CCCR);
+	unsigned long cccr = readl(clk_regs + CCCR);
 	unsigned int m = M_clk_mult[(cccr >> 5) & 0x03];
 
 	return parent_rate / m;
@@ -201,7 +202,7 @@ MUX_OPS(clk_pxa25x_core, "core", CLK_SET_RATE_PARENT);
 static unsigned long clk_pxa25x_run_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	unsigned long cccr = readl(CCCR);
+	unsigned long cccr = readl(clk_regs + CCCR);
 	unsigned int n2 = N2_clk_mult[(cccr >> 7) & 0x07];
 
 	return (parent_rate / n2) * 2;
@@ -212,7 +213,7 @@ RATE_RO_OPS(clk_pxa25x_run, "run");
 static unsigned long clk_pxa25x_cpll_get_rate(struct clk_hw *hw,
 	unsigned long parent_rate)
 {
-	unsigned long clkcfg, cccr = readl(CCCR);
+	unsigned long clkcfg, cccr = readl(clk_regs + CCCR);
 	unsigned int l, m, n2, t;
 
 	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));
@@ -244,7 +245,7 @@ static int clk_pxa25x_cpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (i >= ARRAY_SIZE(pxa25x_freqs))
 		return -EINVAL;
 
-	pxa2xx_cpll_change(&pxa25x_freqs[i], mdrefr_dri, CCCR);
+	pxa2xx_cpll_change(&pxa25x_freqs[i], mdrefr_dri, clk_regs + CCCR);
 
 	return 0;
 }
@@ -321,16 +322,17 @@ static void __init pxa25x_dummy_clocks_init(void)
 	}
 }
 
-int __init pxa25x_clocks_init(void)
+int __init pxa25x_clocks_init(void __iomem *regs)
 {
+	clk_regs = regs;
 	pxa25x_base_clocks_init();
 	pxa25x_dummy_clocks_init();
-	return clk_pxa_cken_init(pxa25x_clocks, ARRAY_SIZE(pxa25x_clocks));
+	return clk_pxa_cken_init(pxa25x_clocks, ARRAY_SIZE(pxa25x_clocks), clk_regs);
 }
 
 static void __init pxa25x_dt_clocks_init(struct device_node *np)
 {
-	pxa25x_clocks_init();
+	pxa25x_clocks_init(ioremap(0x41300000ul, 0x10));
 	clk_pxa_dt_common_init(np);
 }
 CLK_OF_DECLARE(pxa25x_clks, "marvell,pxa250-core-clocks",
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index ba3aa63f2447..116c6ac666e3 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -7,7 +7,6 @@
  * Heavily inspired from former arch/arm/mach-pxa/clock.c.
  */
 #include <linux/clk-provider.h>
-#include <mach/pxa2xx-regs.h>
 #include <linux/io.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
@@ -16,6 +15,7 @@
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
+#include "clk-pxa2xx.h"
 
 #define KHz 1000
 #define MHz (1000 * 1000)
@@ -52,6 +52,8 @@ enum {
 /* Define the refresh period in mSec for the SDRAM and the number of rows */
 #define SDRAM_TREF	64	/* standard 64ms SDRAM */
 
+static void __iomem *clk_regs;
+
 static const char * const get_freq_khz[] = {
 	"core", "run", "cpll", "memory",
 	"system_bus"
@@ -99,7 +101,7 @@ unsigned int pxa27x_get_clk_frequency_khz(int info)
 
 bool pxa27x_is_ppll_disabled(void)
 {
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	return ccsr & (1 << CCCR_PPDIS_BIT);
 }
@@ -201,7 +203,7 @@ static unsigned long clk_pxa27x_cpll_get_rate(struct clk_hw *hw,
 	unsigned long clkcfg;
 	unsigned int t, ht;
 	unsigned int l, L, n2, N;
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));
 	t  = clkcfg & (1 << 0);
@@ -235,7 +237,7 @@ static int clk_pxa27x_cpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (i >= ARRAY_SIZE(pxa27x_freqs))
 		return -EINVAL;
 
-	pxa2xx_cpll_change(&pxa27x_freqs[i], mdrefr_dri, CCCR);
+	pxa2xx_cpll_change(&pxa27x_freqs[i], mdrefr_dri, clk_regs + CCCR);
 	return 0;
 }
 
@@ -246,8 +248,8 @@ static unsigned long clk_pxa27x_lcd_base_get_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	unsigned int l, osc_forced;
-	unsigned long ccsr = readl(CCSR);
-	unsigned long cccr = readl(CCCR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
+	unsigned long cccr = readl(clk_regs + CCCR);
 
 	l  = ccsr & CCSR_L_MASK;
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
@@ -268,7 +270,7 @@ static unsigned long clk_pxa27x_lcd_base_get_rate(struct clk_hw *hw,
 static u8 clk_pxa27x_lcd_base_get_parent(struct clk_hw *hw)
 {
 	unsigned int osc_forced;
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
 	if (osc_forced)
@@ -297,7 +299,7 @@ static u8 clk_pxa27x_core_get_parent(struct clk_hw *hw)
 {
 	unsigned long clkcfg;
 	unsigned int t, ht, osc_forced;
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
 	if (osc_forced)
@@ -334,7 +336,7 @@ MUX_OPS(clk_pxa27x_core, "core", CLK_SET_RATE_PARENT);
 static unsigned long clk_pxa27x_run_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 	unsigned int n2 = (ccsr & CCSR_N2_MASK) >> CCSR_N2_SHIFT;
 
 	return (parent_rate / n2) * 2;
@@ -357,7 +359,7 @@ static unsigned long clk_pxa27x_system_bus_get_rate(struct clk_hw *hw,
 {
 	unsigned long clkcfg;
 	unsigned int b, osc_forced;
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
 	asm("mrc\tp14, 0, %0, c6, c0, 0" : "=r" (clkcfg));
@@ -374,7 +376,7 @@ static unsigned long clk_pxa27x_system_bus_get_rate(struct clk_hw *hw,
 static u8 clk_pxa27x_system_bus_get_parent(struct clk_hw *hw)
 {
 	unsigned int osc_forced;
-	unsigned long ccsr = readl(CCSR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
 	if (osc_forced)
@@ -390,8 +392,8 @@ static unsigned long clk_pxa27x_memory_get_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
 	unsigned int a, l, osc_forced;
-	unsigned long cccr = readl(CCCR);
-	unsigned long ccsr = readl(CCSR);
+	unsigned long cccr = readl(clk_regs + CCCR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
 	a = cccr & (1 << CCCR_A_BIT);
@@ -409,8 +411,8 @@ static unsigned long clk_pxa27x_memory_get_rate(struct clk_hw *hw,
 static u8 clk_pxa27x_memory_get_parent(struct clk_hw *hw)
 {
 	unsigned int osc_forced, a;
-	unsigned long cccr = readl(CCCR);
-	unsigned long ccsr = readl(CCSR);
+	unsigned long cccr = readl(clk_regs + CCCR);
+	unsigned long ccsr = readl(clk_regs + CCSR);
 
 	osc_forced = ccsr & (1 << CCCR_CPDIS_BIT);
 	a = cccr & (1 << CCCR_A_BIT);
@@ -465,16 +467,17 @@ static void __init pxa27x_base_clocks_init(void)
 	clk_register_clk_pxa27x_lcd_base();
 }
 
-int __init pxa27x_clocks_init(void)
+int __init pxa27x_clocks_init(void __iomem *regs)
 {
+	clk_regs = regs;
 	pxa27x_base_clocks_init();
 	pxa27x_dummy_clocks_init();
-	return clk_pxa_cken_init(pxa27x_clocks, ARRAY_SIZE(pxa27x_clocks));
+	return clk_pxa_cken_init(pxa27x_clocks, ARRAY_SIZE(pxa27x_clocks), regs);
 }
 
 static void __init pxa27x_dt_clocks_init(struct device_node *np)
 {
-	pxa27x_clocks_init();
+	pxa27x_clocks_init(ioremap(0x41300000ul, 0x10));
 	clk_pxa_dt_common_init(np);
 }
 CLK_OF_DECLARE(pxa_clks, "marvell,pxa270-clocks", pxa27x_dt_clocks_init);
diff --git a/drivers/clk/pxa/clk-pxa2xx.h b/drivers/clk/pxa/clk-pxa2xx.h
new file mode 100644
index 000000000000..94b03d0e32ff
--- /dev/null
+++ b/drivers/clk/pxa/clk-pxa2xx.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __CLK_PXA2XX_H
+#define __CLK_PXA2XX_H
+
+#define CCCR		(0x0000)  /* Core Clock Configuration Register */
+#define CCSR		(0x000C)  /* Core Clock Status Register */
+#define CKEN		(0x0004)  /* Clock Enable Register */
+#define OSCC		(0x0008)  /* Oscillator Configuration Register */
+
+#define CCCR_N_MASK	0x0380	/* Run Mode Frequency to Turbo Mode Frequency Multiplier */
+#define CCCR_M_MASK	0x0060	/* Memory Frequency to Run Mode Frequency Multiplier */
+#define CCCR_L_MASK	0x001f	/* Crystal Frequency to Memory Frequency Multiplier */
+
+#define CCCR_CPDIS_BIT	(31)
+#define CCCR_PPDIS_BIT	(30)
+#define CCCR_LCD_26_BIT	(27)
+#define CCCR_A_BIT	(25)
+
+#define CCSR_N2_MASK	CCCR_N_MASK
+#define CCSR_M_MASK	CCCR_M_MASK
+#define CCSR_L_MASK	CCCR_L_MASK
+#define CCSR_N2_SHIFT	7
+
+#define CKEN_AC97CONF   (31)    /* AC97 Controller Configuration */
+#define CKEN_CAMERA	(24)	/* Camera Interface Clock Enable */
+#define CKEN_SSP1	(23)	/* SSP1 Unit Clock Enable */
+#define CKEN_MEMC	(22)	/* Memory Controller Clock Enable */
+#define CKEN_MEMSTK	(21)	/* Memory Stick Host Controller */
+#define CKEN_IM		(20)	/* Internal Memory Clock Enable */
+#define CKEN_KEYPAD	(19)	/* Keypad Interface Clock Enable */
+#define CKEN_USIM	(18)	/* USIM Unit Clock Enable */
+#define CKEN_MSL	(17)	/* MSL Unit Clock Enable */
+#define CKEN_LCD	(16)	/* LCD Unit Clock Enable */
+#define CKEN_PWRI2C	(15)	/* PWR I2C Unit Clock Enable */
+#define CKEN_I2C	(14)	/* I2C Unit Clock Enable */
+#define CKEN_FICP	(13)	/* FICP Unit Clock Enable */
+#define CKEN_MMC	(12)	/* MMC Unit Clock Enable */
+#define CKEN_USB	(11)	/* USB Unit Clock Enable */
+#define CKEN_ASSP	(10)	/* ASSP (SSP3) Clock Enable */
+#define CKEN_USBHOST	(10)	/* USB Host Unit Clock Enable */
+#define CKEN_OSTIMER	(9)	/* OS Timer Unit Clock Enable */
+#define CKEN_NSSP	(9)	/* NSSP (SSP2) Clock Enable */
+#define CKEN_I2S	(8)	/* I2S Unit Clock Enable */
+#define CKEN_BTUART	(7)	/* BTUART Unit Clock Enable */
+#define CKEN_FFUART	(6)	/* FFUART Unit Clock Enable */
+#define CKEN_STUART	(5)	/* STUART Unit Clock Enable */
+#define CKEN_HWUART	(4)	/* HWUART Unit Clock Enable */
+#define CKEN_SSP3	(4)	/* SSP3 Unit Clock Enable */
+#define CKEN_SSP	(3)	/* SSP Unit Clock Enable */
+#define CKEN_SSP2	(3)	/* SSP2 Unit Clock Enable */
+#define CKEN_AC97	(2)	/* AC97 Unit Clock Enable */
+#define CKEN_PWM1	(1)	/* PWM1 Clock Enable */
+#define CKEN_PWM0	(0)	/* PWM0 Clock Enable */
+
+#define OSCC_OON	(1 << 1)	/* 32.768kHz OON (write-once only bit) */
+#define OSCC_OOK	(1 << 0)	/* 32.768kHz OOK (read-only bit) */
+
+#endif
diff --git a/drivers/clk/pxa/clk-pxa3xx.c b/drivers/clk/pxa/clk-pxa3xx.c
index 08594fc899e2..42958a542662 100644
--- a/drivers/clk/pxa/clk-pxa3xx.c
+++ b/drivers/clk/pxa/clk-pxa3xx.c
@@ -17,7 +17,6 @@
 #include <linux/soc/pxa/cpu.h>
 #include <linux/soc/pxa/smemc.h>
 #include <linux/clk/pxa.h>
-#include <mach/pxa3xx-regs.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
@@ -25,6 +24,84 @@
 #define KHz 1000
 #define MHz (1000 * 1000)
 
+#define ACCR			(0x0000)	/* Application Subsystem Clock Configuration Register */
+#define ACSR			(0x0004)	/* Application Subsystem Clock Status Register */
+#define AICSR			(0x0008)	/* Application Subsystem Interrupt Control/Status Register */
+#define CKENA			(0x000C)	/* A Clock Enable Register */
+#define CKENB			(0x0010)	/* B Clock Enable Register */
+#define CKENC			(0x0024)	/* C Clock Enable Register */
+#define AC97_DIV		(0x0014)	/* AC97 clock divisor value register */
+
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
+/*
+ * Clock Enable Bit
+ */
+#define CKEN_LCD	1	/* < LCD Clock Enable */
+#define CKEN_USBH	2	/* < USB host clock enable */
+#define CKEN_CAMERA	3	/* < Camera interface clock enable */
+#define CKEN_NAND	4	/* < NAND Flash Controller Clock Enable */
+#define CKEN_USB2	6	/* < USB 2.0 client clock enable. */
+#define CKEN_DMC	8	/* < Dynamic Memory Controller clock enable */
+#define CKEN_SMC	9	/* < Static Memory Controller clock enable */
+#define CKEN_ISC	10	/* < Internal SRAM Controller clock enable */
+#define CKEN_BOOT	11	/* < Boot rom clock enable */
+#define CKEN_MMC1	12	/* < MMC1 Clock enable */
+#define CKEN_MMC2	13	/* < MMC2 clock enable */
+#define CKEN_KEYPAD	14	/* < Keypand Controller Clock Enable */
+#define CKEN_CIR	15	/* < Consumer IR Clock Enable */
+#define CKEN_USIM0	17	/* < USIM[0] Clock Enable */
+#define CKEN_USIM1	18	/* < USIM[1] Clock Enable */
+#define CKEN_TPM	19	/* < TPM clock enable */
+#define CKEN_UDC	20	/* < UDC clock enable */
+#define CKEN_BTUART	21	/* < BTUART clock enable */
+#define CKEN_FFUART	22	/* < FFUART clock enable */
+#define CKEN_STUART	23	/* < STUART clock enable */
+#define CKEN_AC97	24	/* < AC97 clock enable */
+#define CKEN_TOUCH	25	/* < Touch screen Interface Clock Enable */
+#define CKEN_SSP1	26	/* < SSP1 clock enable */
+#define CKEN_SSP2	27	/* < SSP2 clock enable */
+#define CKEN_SSP3	28	/* < SSP3 clock enable */
+#define CKEN_SSP4	29	/* < SSP4 clock enable */
+#define CKEN_MSL0	30	/* < MSL0 clock enable */
+#define CKEN_PWM0	32	/* < PWM[0] clock enable */
+#define CKEN_PWM1	33	/* < PWM[1] clock enable */
+#define CKEN_I2C	36	/* < I2C clock enable */
+#define CKEN_INTC	38	/* < Interrupt controller clock enable */
+#define CKEN_GPIO	39	/* < GPIO clock enable */
+#define CKEN_1WIRE	40	/* < 1-wire clock enable */
+#define CKEN_HSIO2	41	/* < HSIO2 clock enable */
+#define CKEN_MINI_IM	48	/* < Mini-IM */
+#define CKEN_MINI_LCD	49	/* < Mini LCD */
+
+#define CKEN_MMC3	5	/* < MMC3 Clock Enable */
+#define CKEN_MVED	43	/* < MVED clock enable */
+
+/* Note: GCU clock enable bit differs on PXA300/PXA310 and PXA320 */
+#define CKEN_PXA300_GCU		42	/* Graphics controller clock enable */
+#define CKEN_PXA320_GCU		7	/* Graphics controller clock enable */
+
+
 enum {
 	PXA_CORE_60Mhz = 0,
 	PXA_CORE_RUN,
@@ -45,6 +122,8 @@ static const char * const get_freq_khz[] = {
 	"core", "ring_osc_60mhz", "run", "cpll", "system_bus"
 };
 
+static void __iomem *clk_regs;
+
 /*
  * Get the clock frequency as reflected by ACSR and the turbo flag.
  * We assume these values have been applied via a fcs.
@@ -80,16 +159,16 @@ unsigned int pxa3xx_get_clk_frequency_khz(int info)
 
 void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg, u32 mask)
 {
-	u32 accr = ACCR;
+	u32 accr = readl(clk_regs + ACCR);
 
 	accr &= ~disable;
 	accr |= enable;
 
-	ACCR = accr;
+	writel(accr, ACCR);
 	if (xclkcfg)
 		__asm__("mcr p14, 0, %0, c6, c0, 0\n" : : "r"(xclkcfg));
 
-	while ((ACSR & mask) != (accr & mask))
+	while ((readl(clk_regs + ACSR) & mask) != (accr & mask))
 		cpu_relax();
 }
 
@@ -98,7 +177,7 @@ static unsigned long clk_pxa3xx_ac97_get_rate(struct clk_hw *hw,
 {
 	unsigned long ac97_div, rate;
 
-	ac97_div = AC97_DIV;
+	ac97_div = readl(clk_regs + AC97_DIV);
 
 	/* This may loose precision for some rates but won't for the
 	 * standard 24.576MHz.
@@ -115,7 +194,7 @@ RATE_RO_OPS(clk_pxa3xx_ac97, "ac97");
 static unsigned long clk_pxa3xx_smemc_get_rate(struct clk_hw *hw,
 					      unsigned long parent_rate)
 {
-	unsigned long acsr = ACSR;
+	unsigned long acsr = readl(clk_regs + ACSR);
 
 	return (parent_rate / 48)  * smcfs_mult[(acsr >> 23) & 0x7] /
 		pxa3xx_smemc_get_memclkdiv();
@@ -126,7 +205,7 @@ RATE_RO_OPS(clk_pxa3xx_smemc, "smemc");
 
 static bool pxa3xx_is_ring_osc_forced(void)
 {
-	unsigned long acsr = ACSR;
+	unsigned long acsr = readl(clk_regs + ACSR);
 
 	return acsr & ACCR_D0CS;
 }
@@ -138,7 +217,7 @@ PARENTS(pxa3xx_ac97_bus) = { "ring_osc_60mhz", "ac97" };
 PARENTS(pxa3xx_sbus) = { "ring_osc_60mhz", "system_bus" };
 PARENTS(pxa3xx_smemcbus) = { "ring_osc_60mhz", "smemc" };
 
-#define CKEN_AB(bit) ((CKEN_ ## bit > 31) ? &CKENB : &CKENA)
+#define CKEN_AB(bit) ((CKEN_ ## bit > 31) ? CKENB : CKENA)
 #define PXA3XX_CKEN(dev_id, con_id, parents, mult_lp, div_lp, mult_hp,	\
 		    div_hp, bit, is_lp, flags)				\
 	PXA_CKEN(dev_id, con_id, bit, parents, mult_lp, div_lp,		\
@@ -206,7 +285,7 @@ static struct desc_clk_cken pxa93x_clocks[] __initdata = {
 static unsigned long clk_pxa3xx_system_bus_get_rate(struct clk_hw *hw,
 					    unsigned long parent_rate)
 {
-	unsigned long acsr = ACSR;
+	unsigned long acsr = readl(clk_regs + ACSR);
 	unsigned int hss = (acsr >> 14) & 0x3;
 
 	if (pxa3xx_is_ring_osc_forced())
@@ -253,7 +332,7 @@ MUX_RO_RATE_RO_OPS(clk_pxa3xx_core, "core");
 static unsigned long clk_pxa3xx_run_get_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
-	unsigned long acsr = ACSR;
+	unsigned long acsr = readl(clk_regs + ACSR);
 	unsigned int xn = (acsr & ACCR_XN_MASK) >> 8;
 	unsigned int t, xclkcfg;
 
@@ -269,7 +348,7 @@ RATE_RO_OPS(clk_pxa3xx_run, "run");
 static unsigned long clk_pxa3xx_cpll_get_rate(struct clk_hw *hw,
 	unsigned long parent_rate)
 {
-	unsigned long acsr = ACSR;
+	unsigned long acsr = readl(clk_regs + ACSR);
 	unsigned int xn = (acsr & ACCR_XN_MASK) >> 8;
 	unsigned int xl = acsr & ACCR_XL_MASK;
 	unsigned int t, xclkcfg;
@@ -340,7 +419,7 @@ static void __init pxa3xx_dummy_clocks_init(void)
 	}
 }
 
-static void __init pxa3xx_base_clocks_init(void)
+static void __init pxa3xx_base_clocks_init(void __iomem *oscc_reg)
 {
 	struct clk *clk;
 
@@ -350,34 +429,35 @@ static void __init pxa3xx_base_clocks_init(void)
 	clk_register_clk_pxa3xx_ac97();
 	clk_register_clk_pxa3xx_smemc();
 	clk = clk_register_gate(NULL, "CLK_POUT",
-				"osc_13mhz", 0, OSCC, 11, 0, NULL);
+				"osc_13mhz", 0, oscc_reg, 11, 0, NULL);
 	clk_register_clkdev(clk, "CLK_POUT", NULL);
 	clkdev_pxa_register(CLK_OSTIMER, "OSTIMER0", NULL,
 			    clk_register_fixed_factor(NULL, "os-timer0",
 						      "osc_13mhz", 0, 1, 4));
 }
 
-int __init pxa3xx_clocks_init(void)
+int __init pxa3xx_clocks_init(void __iomem *regs, void __iomem *oscc_reg)
 {
 	int ret;
 
-	pxa3xx_base_clocks_init();
+	clk_regs = regs;
+	pxa3xx_base_clocks_init(oscc_reg);
 	pxa3xx_dummy_clocks_init();
-	ret = clk_pxa_cken_init(pxa3xx_clocks, ARRAY_SIZE(pxa3xx_clocks));
+	ret = clk_pxa_cken_init(pxa3xx_clocks, ARRAY_SIZE(pxa3xx_clocks), regs);
 	if (ret)
 		return ret;
 	if (cpu_is_pxa320())
 		return clk_pxa_cken_init(pxa320_clocks,
-					 ARRAY_SIZE(pxa320_clocks));
+					 ARRAY_SIZE(pxa320_clocks), regs);
 	if (cpu_is_pxa300() || cpu_is_pxa310())
 		return clk_pxa_cken_init(pxa300_310_clocks,
-					 ARRAY_SIZE(pxa300_310_clocks));
-	return clk_pxa_cken_init(pxa93x_clocks, ARRAY_SIZE(pxa93x_clocks));
+					 ARRAY_SIZE(pxa300_310_clocks), regs);
+	return clk_pxa_cken_init(pxa93x_clocks, ARRAY_SIZE(pxa93x_clocks), regs);
 }
 
 static void __init pxa3xx_dt_clocks_init(struct device_node *np)
 {
-	pxa3xx_clocks_init();
+	pxa3xx_clocks_init(ioremap(0x41340000, 0x10), ioremap(0x41350000, 4));
 	clk_pxa_dt_common_init(np);
 }
 CLK_OF_DECLARE(pxa_clks, "marvell,pxa300-clocks", pxa3xx_dt_clocks_init);
diff --git a/include/linux/clk/pxa.h b/include/linux/clk/pxa.h
index e5516c608c99..736b8bb91bd7 100644
--- a/include/linux/clk/pxa.h
+++ b/include/linux/clk/pxa.h
@@ -1,5 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+extern int pxa25x_clocks_init(void __iomem *regs);
+extern int pxa27x_clocks_init(void __iomem *regs);
+extern int pxa3xx_clocks_init(void __iomem *regs, void __iomem *oscc_reg);
+
 #ifdef CONFIG_PXA3xx
 extern unsigned	pxa3xx_get_clk_frequency_khz(int);
 extern void pxa3xx_clk_update_accr(u32 disable, u32 enable, u32 xclkcfg, u32 mask);
-- 
2.29.2

