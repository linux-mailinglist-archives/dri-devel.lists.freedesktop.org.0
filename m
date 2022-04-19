Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA8C506DA7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 15:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576A510ED40;
	Tue, 19 Apr 2022 13:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BBD10ED40
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 13:38:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C9FA616B5;
 Tue, 19 Apr 2022 13:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22950C385A7;
 Tue, 19 Apr 2022 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375519;
 bh=FT5uWmnBwqrjZMxtGBIpte66l4+KE24dHbYHChf0MKg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vo7jhfkIO45RAkkpy0H/6U1hnQEdCu+hXaNZZc976K7px4tyqq0v0EtWjn38kPLR0
 wQ0i5WdCNfgO6yV2t85sHAcyiIAac2Q7lwdH1ExwAFEkr1VYkKINZ21Uc2JwbdcKJN
 G8/Dxngt2YYWp24uFqOunXrdesO8INiNEZ6X7iS7niarkcx1+KL9jo1SGRanpdEUQJ
 s0m74A5SFdu++EVomEq3kJXnCFpnEQzDwIk5H46PDx/WGlxK9lGeoOm+JI9deWXj2Q
 /L6iyboNcEryAGftYfMm+cozdzjEUg61GlHlnht5PaCVB0UPGgTsdWpiLt15tqhWNK
 3TZw9Ie3wTbUw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 08/41] ARM: omap1: move some headers to include/linux/soc
Date: Tue, 19 Apr 2022 15:36:50 +0200
Message-Id: <20220419133723.1394715-9-arnd@kernel.org>
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

There are three remaining header files that are used by omap1
specific device drivers:

- mach/soc.h provides cpu_is_omapXXX abstractions
- mach/hardware.h provides omap_read/omap_write functions
  and physical addresses
- mach/mux.h provides an omap specific pinctrl abstraction

This is generally not how we do platform abstractions today,
and it would be good to completely get rid of these in favor
of passing information through platform devices and the pinctrl
subsystem.

However, given that nobody is working on that, just move it
one step forward by splitting out the header files that are
used by drivers today from the machine headers that are only
used internally.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/board-ams-delta.c         |   1 +
 arch/arm/mach-omap1/include/mach/hardware.h   | 128 +------
 arch/arm/mach-omap1/include/mach/memory.h     |   2 +-
 arch/arm/mach-omap1/include/mach/mux.h        | 299 +----------------
 arch/arm/mach-omap1/soc.h                     |   6 +-
 arch/arm/plat-omap/dma.c                      |   4 +-
 include/linux/soc/ti/omap1-io.h               | 143 ++++++++
 include/linux/soc/ti/omap1-mux.h              | 311 ++++++++++++++++++
 .../soc.h => include/linux/soc/ti/omap1-soc.h |  22 --
 9 files changed, 467 insertions(+), 449 deletions(-)
 create mode 100644 include/linux/soc/ti/omap1-io.h
 create mode 100644 include/linux/soc/ti/omap1-mux.h
 rename arch/arm/mach-omap1/include/mach/soc.h => include/linux/soc/ti/omap1-soc.h (90%)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 5b0e99319990..735f0314dc05 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -28,6 +28,7 @@
 #include <linux/omapfb.h>
 #include <linux/io.h>
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/soc/ti/omap1-mux.h>
 
 #include <asm/serial.h>
 #include <asm/mach-types.h>
diff --git a/arch/arm/mach-omap1/include/mach/hardware.h b/arch/arm/mach-omap1/include/mach/hardware.h
index e7c8ac7d83e3..05c5cd3e95f4 100644
--- a/arch/arm/mach-omap1/include/mach/hardware.h
+++ b/arch/arm/mach-omap1/include/mach/hardware.h
@@ -37,19 +37,10 @@
 #define __ASM_ARCH_OMAP_HARDWARE_H
 
 #include <linux/sizes.h>
+#include <linux/soc/ti/omap1-io.h>
 #ifndef __ASSEMBLER__
 #include <asm/types.h>
-#include <mach/soc.h>
-
-/*
- * NOTE: Please use ioremap + __raw_read/write where possible instead of these
- */
-extern u8 omap_readb(u32 pa);
-extern u16 omap_readw(u32 pa);
-extern u32 omap_readl(u32 pa);
-extern void omap_writeb(u8 v, u32 pa);
-extern void omap_writew(u16 v, u32 pa);
-extern void omap_writel(u32 v, u32 pa);
+#include <linux/soc/ti/omap1-soc.h>
 
 #include <mach/tc.h>
 
@@ -98,66 +89,6 @@ static inline u32 omap_cs3_phys(void)
 #define MPU_TIMER_AR		(1 << 1)
 #define MPU_TIMER_ST		(1 << 0)
 
-/*
- * ----------------------------------------------------------------------------
- * Clocks
- * ----------------------------------------------------------------------------
- */
-#define CLKGEN_REG_BASE		(0xfffece00)
-#define ARM_CKCTL		(CLKGEN_REG_BASE + 0x0)
-#define ARM_IDLECT1		(CLKGEN_REG_BASE + 0x4)
-#define ARM_IDLECT2		(CLKGEN_REG_BASE + 0x8)
-#define ARM_EWUPCT		(CLKGEN_REG_BASE + 0xC)
-#define ARM_RSTCT1		(CLKGEN_REG_BASE + 0x10)
-#define ARM_RSTCT2		(CLKGEN_REG_BASE + 0x14)
-#define ARM_SYSST		(CLKGEN_REG_BASE + 0x18)
-#define ARM_IDLECT3		(CLKGEN_REG_BASE + 0x24)
-
-#define CK_RATEF		1
-#define CK_IDLEF		2
-#define CK_ENABLEF		4
-#define CK_SELECTF		8
-#define SETARM_IDLE_SHIFT
-
-/* DPLL control registers */
-#define DPLL_CTL		(0xfffecf00)
-
-/* DSP clock control. Must use __raw_readw() and __raw_writew() with these */
-#define DSP_CONFIG_REG_BASE     IOMEM(0xe1008000)
-#define DSP_CKCTL		(DSP_CONFIG_REG_BASE + 0x0)
-#define DSP_IDLECT1		(DSP_CONFIG_REG_BASE + 0x4)
-#define DSP_IDLECT2		(DSP_CONFIG_REG_BASE + 0x8)
-#define DSP_RSTCT2		(DSP_CONFIG_REG_BASE + 0x14)
-
-/*
- * ---------------------------------------------------------------------------
- * UPLD
- * ---------------------------------------------------------------------------
- */
-#define ULPD_REG_BASE		(0xfffe0800)
-#define ULPD_IT_STATUS		(ULPD_REG_BASE + 0x14)
-#define ULPD_SETUP_ANALOG_CELL_3	(ULPD_REG_BASE + 0x24)
-#define ULPD_CLOCK_CTRL		(ULPD_REG_BASE + 0x30)
-#	define DIS_USB_PVCI_CLK		(1 << 5)	/* no USB/FAC synch */
-#	define USB_MCLK_EN		(1 << 4)	/* enable W4_USB_CLKO */
-#define ULPD_SOFT_REQ		(ULPD_REG_BASE + 0x34)
-#	define SOFT_UDC_REQ		(1 << 4)
-#	define SOFT_USB_CLK_REQ		(1 << 3)
-#	define SOFT_DPLL_REQ		(1 << 0)
-#define ULPD_DPLL_CTRL		(ULPD_REG_BASE + 0x3c)
-#define ULPD_STATUS_REQ		(ULPD_REG_BASE + 0x40)
-#define ULPD_APLL_CTRL		(ULPD_REG_BASE + 0x4c)
-#define ULPD_POWER_CTRL		(ULPD_REG_BASE + 0x50)
-#define ULPD_SOFT_DISABLE_REQ_REG	(ULPD_REG_BASE + 0x68)
-#	define DIS_MMC2_DPLL_REQ	(1 << 11)
-#	define DIS_MMC1_DPLL_REQ	(1 << 10)
-#	define DIS_UART3_DPLL_REQ	(1 << 9)
-#	define DIS_UART2_DPLL_REQ	(1 << 8)
-#	define DIS_UART1_DPLL_REQ	(1 << 7)
-#	define DIS_USB_HOST_DPLL_REQ	(1 << 6)
-#define ULPD_SDW_CLK_DIV_CTRL_SEL	(ULPD_REG_BASE + 0x74)
-#define ULPD_CAM_CLK_CTRL	(ULPD_REG_BASE + 0x7c)
-
 /*
  * ---------------------------------------------------------------------------
  * Watchdog timer
@@ -213,52 +144,6 @@ static inline u32 omap_cs3_phys(void)
 
 #endif
 
-/*
- * ----------------------------------------------------------------------------
- * System control registers
- * ----------------------------------------------------------------------------
- */
-#define MOD_CONF_CTRL_0		0xfffe1080
-#define MOD_CONF_CTRL_1		0xfffe1110
-
-/*
- * ----------------------------------------------------------------------------
- * Pin multiplexing registers
- * ----------------------------------------------------------------------------
- */
-#define FUNC_MUX_CTRL_0		0xfffe1000
-#define FUNC_MUX_CTRL_1		0xfffe1004
-#define FUNC_MUX_CTRL_2		0xfffe1008
-#define COMP_MODE_CTRL_0	0xfffe100c
-#define FUNC_MUX_CTRL_3		0xfffe1010
-#define FUNC_MUX_CTRL_4		0xfffe1014
-#define FUNC_MUX_CTRL_5		0xfffe1018
-#define FUNC_MUX_CTRL_6		0xfffe101C
-#define FUNC_MUX_CTRL_7		0xfffe1020
-#define FUNC_MUX_CTRL_8		0xfffe1024
-#define FUNC_MUX_CTRL_9		0xfffe1028
-#define FUNC_MUX_CTRL_A		0xfffe102C
-#define FUNC_MUX_CTRL_B		0xfffe1030
-#define FUNC_MUX_CTRL_C		0xfffe1034
-#define FUNC_MUX_CTRL_D		0xfffe1038
-#define PULL_DWN_CTRL_0		0xfffe1040
-#define PULL_DWN_CTRL_1		0xfffe1044
-#define PULL_DWN_CTRL_2		0xfffe1048
-#define PULL_DWN_CTRL_3		0xfffe104c
-#define PULL_DWN_CTRL_4		0xfffe10ac
-
-/* OMAP-1610 specific multiplexing registers */
-#define FUNC_MUX_CTRL_E		0xfffe1090
-#define FUNC_MUX_CTRL_F		0xfffe1094
-#define FUNC_MUX_CTRL_10	0xfffe1098
-#define FUNC_MUX_CTRL_11	0xfffe109c
-#define FUNC_MUX_CTRL_12	0xfffe10a0
-#define PU_PD_SEL_0		0xfffe10b4
-#define PU_PD_SEL_1		0xfffe10b8
-#define PU_PD_SEL_2		0xfffe10bc
-#define PU_PD_SEL_3		0xfffe10c0
-#define PU_PD_SEL_4		0xfffe10c4
-
 /* Timer32K for 1610 and 1710*/
 #define OMAP_TIMER32K_BASE	0xFFFBC400
 
@@ -299,15 +184,6 @@ static inline u32 omap_cs3_phys(void)
 #define OMAP_LPG2_LCR			(OMAP_LPG2_BASE + 0x00)
 #define OMAP_LPG2_PMR			(OMAP_LPG2_BASE + 0x04)
 
-/*
- * ----------------------------------------------------------------------------
- * Pulse-Width Light
- * ----------------------------------------------------------------------------
- */
-#define OMAP_PWL_BASE			0xfffb5800
-#define OMAP_PWL_ENABLE			(OMAP_PWL_BASE + 0x00)
-#define OMAP_PWL_CLK_ENABLE		(OMAP_PWL_BASE + 0x04)
-
 /*
  * ---------------------------------------------------------------------------
  * Processor specific defines
diff --git a/arch/arm/mach-omap1/include/mach/memory.h b/arch/arm/mach-omap1/include/mach/memory.h
index ba3a350479c8..ee91a6cb548d 100644
--- a/arch/arm/mach-omap1/include/mach/memory.h
+++ b/arch/arm/mach-omap1/include/mach/memory.h
@@ -7,6 +7,6 @@
 #define __ASM_ARCH_MEMORY_H
 
 /* REVISIT: omap1 legacy drivers still rely on this */
-#include <mach/soc.h>
+#include <mach/hardware.h>
 
 #endif
diff --git a/arch/arm/mach-omap1/include/mach/mux.h b/arch/arm/mach-omap1/include/mach/mux.h
index 3f6dc55d9898..a78282d1294c 100644
--- a/arch/arm/mach-omap1/include/mach/mux.h
+++ b/arch/arm/mach-omap1/include/mach/mux.h
@@ -20,6 +20,8 @@
 #ifndef __ASM_ARCH_MUX_H
 #define __ASM_ARCH_MUX_H
 
+#include <linux/soc/ti/omap1-mux.h>
+
 #define PU_PD_SEL_NA		0	/* No pu_pd reg available */
 #define PULL_DWN_CTRL_NA	0	/* No pull-down control needed */
 
@@ -124,301 +126,6 @@ struct pin_config {
 
 };
 
-enum omap7xx_index {
-	/* OMAP 730 keyboard */
-	E2_7XX_KBR0,
-	J7_7XX_KBR1,
-	E1_7XX_KBR2,
-	F3_7XX_KBR3,
-	D2_7XX_KBR4,
-	C2_7XX_KBC0,
-	D3_7XX_KBC1,
-	E4_7XX_KBC2,
-	F4_7XX_KBC3,
-	E3_7XX_KBC4,
-
-	/* USB */
-	AA17_7XX_USB_DM,
-	W16_7XX_USB_PU_EN,
-	W17_7XX_USB_VBUSI,
-	W18_7XX_USB_DMCK_OUT,
-	W19_7XX_USB_DCRST,
-
-	/* MMC */
-	MMC_7XX_CMD,
-	MMC_7XX_CLK,
-	MMC_7XX_DAT0,
-
-	/* I2C */
-	I2C_7XX_SCL,
-	I2C_7XX_SDA,
-
-	/* SPI */
-	SPI_7XX_1,
-	SPI_7XX_2,
-	SPI_7XX_3,
-	SPI_7XX_4,
-	SPI_7XX_5,
-	SPI_7XX_6,
-
-	/* UART */
-	UART_7XX_1,
-	UART_7XX_2,
-};
-
-enum omap1xxx_index {
-	/* UART1 (BT_UART_GATING)*/
-	UART1_TX = 0,
-	UART1_RTS,
-
-	/* UART2 (COM_UART_GATING)*/
-	UART2_TX,
-	UART2_RX,
-	UART2_CTS,
-	UART2_RTS,
-
-	/* UART3 (GIGA_UART_GATING) */
-	UART3_TX,
-	UART3_RX,
-	UART3_CTS,
-	UART3_RTS,
-	UART3_CLKREQ,
-	UART3_BCLK,	/* 12MHz clock out */
-	Y15_1610_UART3_RTS,
-
-	/* PWT & PWL */
-	PWT,
-	PWL,
-
-	/* USB master generic */
-	R18_USB_VBUS,
-	R18_1510_USB_GPIO0,
-	W4_USB_PUEN,
-	W4_USB_CLKO,
-	W4_USB_HIGHZ,
-	W4_GPIO58,
-
-	/* USB1 master */
-	USB1_SUSP,
-	USB1_SEO,
-	W13_1610_USB1_SE0,
-	USB1_TXEN,
-	USB1_TXD,
-	USB1_VP,
-	USB1_VM,
-	USB1_RCV,
-	USB1_SPEED,
-	R13_1610_USB1_SPEED,
-	R13_1710_USB1_SE0,
-
-	/* USB2 master */
-	USB2_SUSP,
-	USB2_VP,
-	USB2_TXEN,
-	USB2_VM,
-	USB2_RCV,
-	USB2_SEO,
-	USB2_TXD,
-
-	/* OMAP-1510 GPIO */
-	R18_1510_GPIO0,
-	R19_1510_GPIO1,
-	M14_1510_GPIO2,
-
-	/* OMAP1610 GPIO */
-	P18_1610_GPIO3,
-	Y15_1610_GPIO17,
-
-	/* OMAP-1710 GPIO */
-	R18_1710_GPIO0,
-	V2_1710_GPIO10,
-	N21_1710_GPIO14,
-	W15_1710_GPIO40,
-
-	/* MPUIO */
-	MPUIO2,
-	N15_1610_MPUIO2,
-	MPUIO4,
-	MPUIO5,
-	T20_1610_MPUIO5,
-	W11_1610_MPUIO6,
-	V10_1610_MPUIO7,
-	W11_1610_MPUIO9,
-	V10_1610_MPUIO10,
-	W10_1610_MPUIO11,
-	E20_1610_MPUIO13,
-	U20_1610_MPUIO14,
-	E19_1610_MPUIO15,
-
-	/* MCBSP2 */
-	MCBSP2_CLKR,
-	MCBSP2_CLKX,
-	MCBSP2_DR,
-	MCBSP2_DX,
-	MCBSP2_FSR,
-	MCBSP2_FSX,
-
-	/* MCBSP3 */
-	MCBSP3_CLKX,
-
-	/* Misc ballouts */
-	BALLOUT_V8_ARMIO3,
-	N20_HDQ,
-
-	/* OMAP-1610 MMC2 */
-	W8_1610_MMC2_DAT0,
-	V8_1610_MMC2_DAT1,
-	W15_1610_MMC2_DAT2,
-	R10_1610_MMC2_DAT3,
-	Y10_1610_MMC2_CLK,
-	Y8_1610_MMC2_CMD,
-	V9_1610_MMC2_CMDDIR,
-	V5_1610_MMC2_DATDIR0,
-	W19_1610_MMC2_DATDIR1,
-	R18_1610_MMC2_CLKIN,
-
-	/* OMAP-1610 External Trace Interface */
-	M19_1610_ETM_PSTAT0,
-	L15_1610_ETM_PSTAT1,
-	L18_1610_ETM_PSTAT2,
-	L19_1610_ETM_D0,
-	J19_1610_ETM_D6,
-	J18_1610_ETM_D7,
-
-	/* OMAP16XX GPIO */
-	P20_1610_GPIO4,
-	V9_1610_GPIO7,
-	W8_1610_GPIO9,
-	N20_1610_GPIO11,
-	N19_1610_GPIO13,
-	P10_1610_GPIO22,
-	V5_1610_GPIO24,
-	AA20_1610_GPIO_41,
-	W19_1610_GPIO48,
-	M7_1610_GPIO62,
-	V14_16XX_GPIO37,
-	R9_16XX_GPIO18,
-	L14_16XX_GPIO49,
-
-	/* OMAP-1610 uWire */
-	V19_1610_UWIRE_SCLK,
-	U18_1610_UWIRE_SDI,
-	W21_1610_UWIRE_SDO,
-	N14_1610_UWIRE_CS0,
-	P15_1610_UWIRE_CS3,
-	N15_1610_UWIRE_CS1,
-
-	/* OMAP-1610 SPI */
-	U19_1610_SPIF_SCK,
-	U18_1610_SPIF_DIN,
-	P20_1610_SPIF_DIN,
-	W21_1610_SPIF_DOUT,
-	R18_1610_SPIF_DOUT,
-	N14_1610_SPIF_CS0,
-	N15_1610_SPIF_CS1,
-	T19_1610_SPIF_CS2,
-	P15_1610_SPIF_CS3,
-
-	/* OMAP-1610 Flash */
-	L3_1610_FLASH_CS2B_OE,
-	M8_1610_FLASH_CS2B_WE,
-
-	/* First MMC */
-	MMC_CMD,
-	MMC_DAT1,
-	MMC_DAT2,
-	MMC_DAT0,
-	MMC_CLK,
-	MMC_DAT3,
-
-	/* OMAP-1710 MMC CMDDIR and DATDIR0 */
-	M15_1710_MMC_CLKI,
-	P19_1710_MMC_CMDDIR,
-	P20_1710_MMC_DATDIR0,
-
-	/* OMAP-1610 USB0 alternate pin configuration */
-	W9_USB0_TXEN,
-	AA9_USB0_VP,
-	Y5_USB0_RCV,
-	R9_USB0_VM,
-	V6_USB0_TXD,
-	W5_USB0_SE0,
-	V9_USB0_SPEED,
-	V9_USB0_SUSP,
-
-	/* USB2 */
-	W9_USB2_TXEN,
-	AA9_USB2_VP,
-	Y5_USB2_RCV,
-	R9_USB2_VM,
-	V6_USB2_TXD,
-	W5_USB2_SE0,
-
-	/* 16XX UART */
-	R13_1610_UART1_TX,
-	V14_16XX_UART1_RX,
-	R14_1610_UART1_CTS,
-	AA15_1610_UART1_RTS,
-	R9_16XX_UART2_RX,
-	L14_16XX_UART3_RX,
-
-	/* I2C OMAP-1610 */
-	I2C_SCL,
-	I2C_SDA,
-
-	/* Keypad */
-	F18_1610_KBC0,
-	D20_1610_KBC1,
-	D19_1610_KBC2,
-	E18_1610_KBC3,
-	C21_1610_KBC4,
-	G18_1610_KBR0,
-	F19_1610_KBR1,
-	H14_1610_KBR2,
-	E20_1610_KBR3,
-	E19_1610_KBR4,
-	N19_1610_KBR5,
-
-	/* Power management */
-	T20_1610_LOW_PWR,
-
-	/* MCLK Settings */
-	V5_1710_MCLK_ON,
-	V5_1710_MCLK_OFF,
-	R10_1610_MCLK_ON,
-	R10_1610_MCLK_OFF,
-
-	/* CompactFlash controller */
-	P11_1610_CF_CD2,
-	R11_1610_CF_IOIS16,
-	V10_1610_CF_IREQ,
-	W10_1610_CF_RESET,
-	W11_1610_CF_CD1,
-
-	/* parallel camera */
-	J15_1610_CAM_LCLK,
-	J18_1610_CAM_D7,
-	J19_1610_CAM_D6,
-	J14_1610_CAM_D5,
-	K18_1610_CAM_D4,
-	K19_1610_CAM_D3,
-	K15_1610_CAM_D2,
-	K14_1610_CAM_D1,
-	L19_1610_CAM_D0,
-	L18_1610_CAM_VS,
-	L15_1610_CAM_HS,
-	M19_1610_CAM_RSTZ,
-	Y15_1610_CAM_OUTCLK,
-
-	/* serial camera */
-	H19_1610_CAM_EXCLK,
-	Y12_1610_CCP_CLKP,
-	W13_1610_CCP_CLKM,
-	W14_1610_CCP_DATAP,
-	Y14_1610_CCP_DATAM,
-
-};
-
 struct omap_mux_cfg {
 	struct pin_config	*pins;
 	unsigned long		size;
@@ -429,11 +136,9 @@ struct omap_mux_cfg {
 /* setup pin muxing in Linux */
 extern int omap1_mux_init(void);
 extern int omap_mux_register(struct omap_mux_cfg *);
-extern int omap_cfg_reg(unsigned long reg_cfg);
 #else
 /* boot loader does it all (no warnings from CONFIG_OMAP_MUX_WARNINGS) */
 static inline int omap1_mux_init(void) { return 0; }
-static inline int omap_cfg_reg(unsigned long reg_cfg) { return 0; }
 #endif
 
 extern int omap2_mux_init(void);
diff --git a/arch/arm/mach-omap1/soc.h b/arch/arm/mach-omap1/soc.h
index 69daf0187b1d..22931839a666 100644
--- a/arch/arm/mach-omap1/soc.h
+++ b/arch/arm/mach-omap1/soc.h
@@ -1,4 +1,6 @@
 /*
- * We can move mach/soc.h here once the drivers are fixed
+ * We can move linux/soc/ti/omap1-soc.h here once the drivers are fixed
  */
-#include <mach/soc.h>
+#include <mach/hardware.h>
+#include <mach/irqs.h>
+#include <asm/irq.h>
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/plat-omap/dma.c
index 9f11de46aaa9..700ba9b600e7 100644
--- a/arch/arm/plat-omap/dma.c
+++ b/arch/arm/plat-omap/dma.c
@@ -35,7 +35,9 @@
 #include <linux/omap-dma.h>
 
 #ifdef CONFIG_ARCH_OMAP1
-#include <mach/soc.h>
+#include <mach/hardware.h>
+#include <linux/soc/ti/omap1-io.h>
+#include <linux/soc/ti/omap1-soc.h>
 #endif
 
 /*
diff --git a/include/linux/soc/ti/omap1-io.h b/include/linux/soc/ti/omap1-io.h
new file mode 100644
index 000000000000..9332c92690f4
--- /dev/null
+++ b/include/linux/soc/ti/omap1-io.h
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ARCH_OMAP_IO_H
+#define __ASM_ARCH_OMAP_IO_H
+
+#ifndef __ASSEMBLER__
+#include <linux/types.h>
+
+#if defined(CONFIG_ARCH_OMAP) && defined(CONFIG_ARCH_OMAP1)
+/*
+ * NOTE: Please use ioremap + __raw_read/write where possible instead of these
+ */
+extern u8 omap_readb(u32 pa);
+extern u16 omap_readw(u32 pa);
+extern u32 omap_readl(u32 pa);
+extern void omap_writeb(u8 v, u32 pa);
+extern void omap_writew(u16 v, u32 pa);
+extern void omap_writel(u32 v, u32 pa);
+#elif defined(CONFIG_COMPILE_TEST)
+static inline u8 omap_readb(u32 pa)  { return 0; }
+static inline u16 omap_readw(u32 pa) { return 0; }
+static inline u32 omap_readl(u32 pa) { return 0; }
+static inline void omap_writeb(u8 v, u32 pa)   { }
+static inline void omap_writew(u16 v, u32 pa)  { }
+static inline void omap_writel(u32 v, u32 pa)  { }
+#endif
+#endif
+
+/*
+ * ----------------------------------------------------------------------------
+ * System control registers
+ * ----------------------------------------------------------------------------
+ */
+#define MOD_CONF_CTRL_0		0xfffe1080
+#define MOD_CONF_CTRL_1		0xfffe1110
+
+/*
+ * ---------------------------------------------------------------------------
+ * UPLD
+ * ---------------------------------------------------------------------------
+ */
+#define ULPD_REG_BASE		(0xfffe0800)
+#define ULPD_IT_STATUS		(ULPD_REG_BASE + 0x14)
+#define ULPD_SETUP_ANALOG_CELL_3	(ULPD_REG_BASE + 0x24)
+#define ULPD_CLOCK_CTRL		(ULPD_REG_BASE + 0x30)
+#	define DIS_USB_PVCI_CLK		(1 << 5)	/* no USB/FAC synch */
+#	define USB_MCLK_EN		(1 << 4)	/* enable W4_USB_CLKO */
+#define ULPD_SOFT_REQ		(ULPD_REG_BASE + 0x34)
+#	define SOFT_UDC_REQ		(1 << 4)
+#	define SOFT_USB_CLK_REQ		(1 << 3)
+#	define SOFT_DPLL_REQ		(1 << 0)
+#define ULPD_DPLL_CTRL		(ULPD_REG_BASE + 0x3c)
+#define ULPD_STATUS_REQ		(ULPD_REG_BASE + 0x40)
+#define ULPD_APLL_CTRL		(ULPD_REG_BASE + 0x4c)
+#define ULPD_POWER_CTRL		(ULPD_REG_BASE + 0x50)
+#define ULPD_SOFT_DISABLE_REQ_REG	(ULPD_REG_BASE + 0x68)
+#	define DIS_MMC2_DPLL_REQ	(1 << 11)
+#	define DIS_MMC1_DPLL_REQ	(1 << 10)
+#	define DIS_UART3_DPLL_REQ	(1 << 9)
+#	define DIS_UART2_DPLL_REQ	(1 << 8)
+#	define DIS_UART1_DPLL_REQ	(1 << 7)
+#	define DIS_USB_HOST_DPLL_REQ	(1 << 6)
+#define ULPD_SDW_CLK_DIV_CTRL_SEL	(ULPD_REG_BASE + 0x74)
+#define ULPD_CAM_CLK_CTRL	(ULPD_REG_BASE + 0x7c)
+
+/*
+ * ----------------------------------------------------------------------------
+ * Clocks
+ * ----------------------------------------------------------------------------
+ */
+#define CLKGEN_REG_BASE		(0xfffece00)
+#define ARM_CKCTL		(CLKGEN_REG_BASE + 0x0)
+#define ARM_IDLECT1		(CLKGEN_REG_BASE + 0x4)
+#define ARM_IDLECT2		(CLKGEN_REG_BASE + 0x8)
+#define ARM_EWUPCT		(CLKGEN_REG_BASE + 0xC)
+#define ARM_RSTCT1		(CLKGEN_REG_BASE + 0x10)
+#define ARM_RSTCT2		(CLKGEN_REG_BASE + 0x14)
+#define ARM_SYSST		(CLKGEN_REG_BASE + 0x18)
+#define ARM_IDLECT3		(CLKGEN_REG_BASE + 0x24)
+
+#define CK_RATEF		1
+#define CK_IDLEF		2
+#define CK_ENABLEF		4
+#define CK_SELECTF		8
+#define SETARM_IDLE_SHIFT
+
+/* DPLL control registers */
+#define DPLL_CTL		(0xfffecf00)
+
+/* DSP clock control. Must use __raw_readw() and __raw_writew() with these */
+#define DSP_CONFIG_REG_BASE     IOMEM(0xe1008000)
+#define DSP_CKCTL		(DSP_CONFIG_REG_BASE + 0x0)
+#define DSP_IDLECT1		(DSP_CONFIG_REG_BASE + 0x4)
+#define DSP_IDLECT2		(DSP_CONFIG_REG_BASE + 0x8)
+#define DSP_RSTCT2		(DSP_CONFIG_REG_BASE + 0x14)
+
+/*
+ * ----------------------------------------------------------------------------
+ * Pulse-Width Light
+ * ----------------------------------------------------------------------------
+ */
+#define OMAP_PWL_BASE			0xfffb5800
+#define OMAP_PWL_ENABLE			(OMAP_PWL_BASE + 0x00)
+#define OMAP_PWL_CLK_ENABLE		(OMAP_PWL_BASE + 0x04)
+
+/*
+ * ----------------------------------------------------------------------------
+ * Pin multiplexing registers
+ * ----------------------------------------------------------------------------
+ */
+#define FUNC_MUX_CTRL_0		0xfffe1000
+#define FUNC_MUX_CTRL_1		0xfffe1004
+#define FUNC_MUX_CTRL_2		0xfffe1008
+#define COMP_MODE_CTRL_0	0xfffe100c
+#define FUNC_MUX_CTRL_3		0xfffe1010
+#define FUNC_MUX_CTRL_4		0xfffe1014
+#define FUNC_MUX_CTRL_5		0xfffe1018
+#define FUNC_MUX_CTRL_6		0xfffe101C
+#define FUNC_MUX_CTRL_7		0xfffe1020
+#define FUNC_MUX_CTRL_8		0xfffe1024
+#define FUNC_MUX_CTRL_9		0xfffe1028
+#define FUNC_MUX_CTRL_A		0xfffe102C
+#define FUNC_MUX_CTRL_B		0xfffe1030
+#define FUNC_MUX_CTRL_C		0xfffe1034
+#define FUNC_MUX_CTRL_D		0xfffe1038
+#define PULL_DWN_CTRL_0		0xfffe1040
+#define PULL_DWN_CTRL_1		0xfffe1044
+#define PULL_DWN_CTRL_2		0xfffe1048
+#define PULL_DWN_CTRL_3		0xfffe104c
+#define PULL_DWN_CTRL_4		0xfffe10ac
+
+/* OMAP-1610 specific multiplexing registers */
+#define FUNC_MUX_CTRL_E		0xfffe1090
+#define FUNC_MUX_CTRL_F		0xfffe1094
+#define FUNC_MUX_CTRL_10	0xfffe1098
+#define FUNC_MUX_CTRL_11	0xfffe109c
+#define FUNC_MUX_CTRL_12	0xfffe10a0
+#define PU_PD_SEL_0		0xfffe10b4
+#define PU_PD_SEL_1		0xfffe10b8
+#define PU_PD_SEL_2		0xfffe10bc
+#define PU_PD_SEL_3		0xfffe10c0
+#define PU_PD_SEL_4		0xfffe10c4
+
+#endif
diff --git a/include/linux/soc/ti/omap1-mux.h b/include/linux/soc/ti/omap1-mux.h
new file mode 100644
index 000000000000..59c239b5569c
--- /dev/null
+++ b/include/linux/soc/ti/omap1-mux.h
@@ -0,0 +1,311 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __SOC_TI_OMAP1_MUX_H
+#define __SOC_TI_OMAP1_MUX_H
+/*
+ * This should not really be a global header, it reflects the
+ * traditional way that omap1 does pin muxing without the
+ * pinctrl subsystem.
+ */
+
+enum omap7xx_index {
+	/* OMAP 730 keyboard */
+	E2_7XX_KBR0,
+	J7_7XX_KBR1,
+	E1_7XX_KBR2,
+	F3_7XX_KBR3,
+	D2_7XX_KBR4,
+	C2_7XX_KBC0,
+	D3_7XX_KBC1,
+	E4_7XX_KBC2,
+	F4_7XX_KBC3,
+	E3_7XX_KBC4,
+
+	/* USB */
+	AA17_7XX_USB_DM,
+	W16_7XX_USB_PU_EN,
+	W17_7XX_USB_VBUSI,
+	W18_7XX_USB_DMCK_OUT,
+	W19_7XX_USB_DCRST,
+
+	/* MMC */
+	MMC_7XX_CMD,
+	MMC_7XX_CLK,
+	MMC_7XX_DAT0,
+
+	/* I2C */
+	I2C_7XX_SCL,
+	I2C_7XX_SDA,
+
+	/* SPI */
+	SPI_7XX_1,
+	SPI_7XX_2,
+	SPI_7XX_3,
+	SPI_7XX_4,
+	SPI_7XX_5,
+	SPI_7XX_6,
+
+	/* UART */
+	UART_7XX_1,
+	UART_7XX_2,
+};
+
+enum omap1xxx_index {
+	/* UART1 (BT_UART_GATING)*/
+	UART1_TX = 0,
+	UART1_RTS,
+
+	/* UART2 (COM_UART_GATING)*/
+	UART2_TX,
+	UART2_RX,
+	UART2_CTS,
+	UART2_RTS,
+
+	/* UART3 (GIGA_UART_GATING) */
+	UART3_TX,
+	UART3_RX,
+	UART3_CTS,
+	UART3_RTS,
+	UART3_CLKREQ,
+	UART3_BCLK,	/* 12MHz clock out */
+	Y15_1610_UART3_RTS,
+
+	/* PWT & PWL */
+	PWT,
+	PWL,
+
+	/* USB master generic */
+	R18_USB_VBUS,
+	R18_1510_USB_GPIO0,
+	W4_USB_PUEN,
+	W4_USB_CLKO,
+	W4_USB_HIGHZ,
+	W4_GPIO58,
+
+	/* USB1 master */
+	USB1_SUSP,
+	USB1_SEO,
+	W13_1610_USB1_SE0,
+	USB1_TXEN,
+	USB1_TXD,
+	USB1_VP,
+	USB1_VM,
+	USB1_RCV,
+	USB1_SPEED,
+	R13_1610_USB1_SPEED,
+	R13_1710_USB1_SE0,
+
+	/* USB2 master */
+	USB2_SUSP,
+	USB2_VP,
+	USB2_TXEN,
+	USB2_VM,
+	USB2_RCV,
+	USB2_SEO,
+	USB2_TXD,
+
+	/* OMAP-1510 GPIO */
+	R18_1510_GPIO0,
+	R19_1510_GPIO1,
+	M14_1510_GPIO2,
+
+	/* OMAP1610 GPIO */
+	P18_1610_GPIO3,
+	Y15_1610_GPIO17,
+
+	/* OMAP-1710 GPIO */
+	R18_1710_GPIO0,
+	V2_1710_GPIO10,
+	N21_1710_GPIO14,
+	W15_1710_GPIO40,
+
+	/* MPUIO */
+	MPUIO2,
+	N15_1610_MPUIO2,
+	MPUIO4,
+	MPUIO5,
+	T20_1610_MPUIO5,
+	W11_1610_MPUIO6,
+	V10_1610_MPUIO7,
+	W11_1610_MPUIO9,
+	V10_1610_MPUIO10,
+	W10_1610_MPUIO11,
+	E20_1610_MPUIO13,
+	U20_1610_MPUIO14,
+	E19_1610_MPUIO15,
+
+	/* MCBSP2 */
+	MCBSP2_CLKR,
+	MCBSP2_CLKX,
+	MCBSP2_DR,
+	MCBSP2_DX,
+	MCBSP2_FSR,
+	MCBSP2_FSX,
+
+	/* MCBSP3 */
+	MCBSP3_CLKX,
+
+	/* Misc ballouts */
+	BALLOUT_V8_ARMIO3,
+	N20_HDQ,
+
+	/* OMAP-1610 MMC2 */
+	W8_1610_MMC2_DAT0,
+	V8_1610_MMC2_DAT1,
+	W15_1610_MMC2_DAT2,
+	R10_1610_MMC2_DAT3,
+	Y10_1610_MMC2_CLK,
+	Y8_1610_MMC2_CMD,
+	V9_1610_MMC2_CMDDIR,
+	V5_1610_MMC2_DATDIR0,
+	W19_1610_MMC2_DATDIR1,
+	R18_1610_MMC2_CLKIN,
+
+	/* OMAP-1610 External Trace Interface */
+	M19_1610_ETM_PSTAT0,
+	L15_1610_ETM_PSTAT1,
+	L18_1610_ETM_PSTAT2,
+	L19_1610_ETM_D0,
+	J19_1610_ETM_D6,
+	J18_1610_ETM_D7,
+
+	/* OMAP16XX GPIO */
+	P20_1610_GPIO4,
+	V9_1610_GPIO7,
+	W8_1610_GPIO9,
+	N20_1610_GPIO11,
+	N19_1610_GPIO13,
+	P10_1610_GPIO22,
+	V5_1610_GPIO24,
+	AA20_1610_GPIO_41,
+	W19_1610_GPIO48,
+	M7_1610_GPIO62,
+	V14_16XX_GPIO37,
+	R9_16XX_GPIO18,
+	L14_16XX_GPIO49,
+
+	/* OMAP-1610 uWire */
+	V19_1610_UWIRE_SCLK,
+	U18_1610_UWIRE_SDI,
+	W21_1610_UWIRE_SDO,
+	N14_1610_UWIRE_CS0,
+	P15_1610_UWIRE_CS3,
+	N15_1610_UWIRE_CS1,
+
+	/* OMAP-1610 SPI */
+	U19_1610_SPIF_SCK,
+	U18_1610_SPIF_DIN,
+	P20_1610_SPIF_DIN,
+	W21_1610_SPIF_DOUT,
+	R18_1610_SPIF_DOUT,
+	N14_1610_SPIF_CS0,
+	N15_1610_SPIF_CS1,
+	T19_1610_SPIF_CS2,
+	P15_1610_SPIF_CS3,
+
+	/* OMAP-1610 Flash */
+	L3_1610_FLASH_CS2B_OE,
+	M8_1610_FLASH_CS2B_WE,
+
+	/* First MMC */
+	MMC_CMD,
+	MMC_DAT1,
+	MMC_DAT2,
+	MMC_DAT0,
+	MMC_CLK,
+	MMC_DAT3,
+
+	/* OMAP-1710 MMC CMDDIR and DATDIR0 */
+	M15_1710_MMC_CLKI,
+	P19_1710_MMC_CMDDIR,
+	P20_1710_MMC_DATDIR0,
+
+	/* OMAP-1610 USB0 alternate pin configuration */
+	W9_USB0_TXEN,
+	AA9_USB0_VP,
+	Y5_USB0_RCV,
+	R9_USB0_VM,
+	V6_USB0_TXD,
+	W5_USB0_SE0,
+	V9_USB0_SPEED,
+	V9_USB0_SUSP,
+
+	/* USB2 */
+	W9_USB2_TXEN,
+	AA9_USB2_VP,
+	Y5_USB2_RCV,
+	R9_USB2_VM,
+	V6_USB2_TXD,
+	W5_USB2_SE0,
+
+	/* 16XX UART */
+	R13_1610_UART1_TX,
+	V14_16XX_UART1_RX,
+	R14_1610_UART1_CTS,
+	AA15_1610_UART1_RTS,
+	R9_16XX_UART2_RX,
+	L14_16XX_UART3_RX,
+
+	/* I2C OMAP-1610 */
+	I2C_SCL,
+	I2C_SDA,
+
+	/* Keypad */
+	F18_1610_KBC0,
+	D20_1610_KBC1,
+	D19_1610_KBC2,
+	E18_1610_KBC3,
+	C21_1610_KBC4,
+	G18_1610_KBR0,
+	F19_1610_KBR1,
+	H14_1610_KBR2,
+	E20_1610_KBR3,
+	E19_1610_KBR4,
+	N19_1610_KBR5,
+
+	/* Power management */
+	T20_1610_LOW_PWR,
+
+	/* MCLK Settings */
+	V5_1710_MCLK_ON,
+	V5_1710_MCLK_OFF,
+	R10_1610_MCLK_ON,
+	R10_1610_MCLK_OFF,
+
+	/* CompactFlash controller */
+	P11_1610_CF_CD2,
+	R11_1610_CF_IOIS16,
+	V10_1610_CF_IREQ,
+	W10_1610_CF_RESET,
+	W11_1610_CF_CD1,
+
+	/* parallel camera */
+	J15_1610_CAM_LCLK,
+	J18_1610_CAM_D7,
+	J19_1610_CAM_D6,
+	J14_1610_CAM_D5,
+	K18_1610_CAM_D4,
+	K19_1610_CAM_D3,
+	K15_1610_CAM_D2,
+	K14_1610_CAM_D1,
+	L19_1610_CAM_D0,
+	L18_1610_CAM_VS,
+	L15_1610_CAM_HS,
+	M19_1610_CAM_RSTZ,
+	Y15_1610_CAM_OUTCLK,
+
+	/* serial camera */
+	H19_1610_CAM_EXCLK,
+	Y12_1610_CCP_CLKP,
+	W13_1610_CCP_CLKM,
+	W14_1610_CCP_DATAP,
+	Y14_1610_CCP_DATAM,
+
+};
+
+#ifdef CONFIG_OMAP_MUX
+extern int omap_cfg_reg(unsigned long reg_cfg);
+#else
+static inline int omap_cfg_reg(unsigned long reg_cfg) { return 0; }
+#endif
+
+#endif
diff --git a/arch/arm/mach-omap1/include/mach/soc.h b/include/linux/soc/ti/omap1-soc.h
similarity index 90%
rename from arch/arm/mach-omap1/include/mach/soc.h
rename to include/linux/soc/ti/omap1-soc.h
index 1897cbabfc93..81008d400bb6 100644
--- a/arch/arm/mach-omap1/include/mach/soc.h
+++ b/include/linux/soc/ti/omap1-soc.h
@@ -14,14 +14,6 @@
 #ifndef __ASM_ARCH_OMAP_CPU_H
 #define __ASM_ARCH_OMAP_CPU_H
 
-#include <asm/irq.h>
-#include <mach/hardware.h>
-#include <mach/irqs.h>
-
-#ifndef __ASSEMBLY__
-
-#include <linux/bitops.h>
-
 /*
  * Test if multicore OMAP support is needed
  */
@@ -176,20 +168,7 @@ IS_OMAP_TYPE(1710, 0x1710)
 #define cpu_is_omap1621()		0
 #define cpu_is_omap1710()		0
 
-/* These are needed to compile common code */
-#ifdef CONFIG_ARCH_OMAP1
-#define cpu_is_omap242x()		0
-#define cpu_is_omap2430()		0
-#define cpu_is_omap243x()		0
-#define cpu_is_omap24xx()		0
-#define cpu_is_omap34xx()		0
-#define cpu_is_omap44xx()		0
-#define soc_is_omap54xx()		0
-#define soc_is_dra7xx()			0
-#define soc_is_am33xx()			0
 #define cpu_class_is_omap1()		1
-#define cpu_class_is_omap2()		0
-#endif
 
 /*
  * Whether we have MULTI_OMAP1 or not, we still need to distinguish
@@ -216,5 +195,4 @@ IS_OMAP_TYPE(1710, 0x1710)
 # define cpu_is_omap1710()		is_omap1710()
 #endif
 
-#endif	/* __ASSEMBLY__ */
 #endif
-- 
2.29.2

