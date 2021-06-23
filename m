Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8F3B238B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 00:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71A6E93E;
	Wed, 23 Jun 2021 22:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40796E93E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 22:23:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFEFF5A1;
 Thu, 24 Jun 2021 00:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624486986;
 bh=veFFZSszQ862R1/8cm/SinKD4NXadBHftwARlaPsSe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a8inAFKvUl/8dgdFPFPrIIwdPce/AA81ebZcFp7qOqKU/epQEfPNkqXxmS8Exm3cO
 H9posXCLJTp/fOsEVFU5PsQFIB0+oGX9mDQZjupt06aMQeaN2fgv50A06Cl2x01i9c
 3tT+vzkddBEhiq24rdpC4RauLryrUyX4CDwmIAxE=
Date: Thu, 24 Jun 2021 01:22:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
Message-ID: <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210621072424.111733-3-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 Tomasz Figa <t.figa@samsung.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Thank you for the patch.

On Mon, Jun 21, 2021 at 12:54:17PM +0530, Jagan Teki wrote:
> Samsung SEC MIPI DSIM Bridge controller is MIPI DSI bridge
> available in NXP's i.MX8M Mini and Nano Processors.
> 
> Add bridge driver for it.
> 
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig    |   15 +
>  drivers/gpu/drm/bridge/Makefile   |    1 +
>  drivers/gpu/drm/bridge/sec-dsim.c | 1535 +++++++++++++++++++++++++++++
>  3 files changed, 1551 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/sec-dsim.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 19109c0b5481..a183eb165a35 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -189,6 +189,21 @@ config DRM_PARADE_PS8640
>  	  The PS8640 is a high-performance and low-power
>  	  MIPI DSI to eDP converter
>  
> +config DRM_SEC_MIPI_DSIM
> +	tristate "Samsung SEC MIPI DSIM Bridge controller"
> +	depends on DRM
> +	depends on COMMON_CLK
> +	depends on OF && HAS_IOMEM
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL_BRIDGE
> +	select GENERIC_PHY_MIPI_DPHY
> +	select MFD_SYSCON
> +	select REGMAP_MMIO
> +	help
> +	  This enables the Samsung SEC MIPI DSIM Bridge controller as
> +	  for example found on NXP's i.MX8M Mini and Nano Processors.
> +
>  config DRM_SIL_SII8620
>  	tristate "Silicon Image SII8620 HDMI/MHL bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 88e4edf81087..ff802a4ffe65 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
>  obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
> +obj-$(CONFIG_DRM_SEC_MIPI_DSIM) += sec-dsim.o
>  obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
>  obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_SII9234) += sii9234.o
> diff --git a/drivers/gpu/drm/bridge/sec-dsim.c b/drivers/gpu/drm/bridge/sec-dsim.c
> new file mode 100644
> index 000000000000..5b6645bb94e7
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/sec-dsim.c
> @@ -0,0 +1,1535 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Samsung SEC MIPI DSIM Bridge
> + *
> + * Copyright (C) 2018 NXP
> + * Copyright (c) 2014 Samsung Electronics Co., Ltd
> + * Copyright (C) 2021 Amarula Solutions(India)
> + *
> + * Based on the drivers/gpu/drm/exynos/exynos_drm_dsi.c
> + *
> + * Authors:
> + * Tomasz Figa <t.figa@samsung.com>
> + * Andrzej Hajda <a.hajda@samsung.com>
> + * Fancy Fang <chen.fang@nxp.com>
> + * Jagan Teki <jagan@amarulasolutions.com>
> + */
> +
> +#include <asm/unaligned.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +
> +#include <video/mipi_display.h>
> +
> +#define DRIVER_NAME			"sec-dsim"
> +
> +/* dsim registers */
> +#define DSIM_VERSION			0x00
> +#define DSIM_STATUS			0x04
> +#define DSIM_RGB_STATUS			0x08
> +#define DSIM_SWRST			0x0c
> +#define DSIM_CLKCTRL			0x10
> +#define DSIM_TIMEOUT			0x14
> +#define DSIM_CONFIG			0x18
> +#define DSIM_ESCMODE			0x1c
> +#define DSIM_MDRESOL			0x20
> +#define DSIM_MVPORCH			0x24
> +#define DSIM_MHPORCH			0x28
> +#define DSIM_MSYNC			0x2c
> +#define DSIM_SDRESOL			0x30
> +#define DSIM_INTSRC			0x34
> +#define DSIM_INTMSK			0x38
> +#define DSIM_PKTHDR			0x3c
> +#define DSIM_PAYLOAD			0x40
> +#define DSIM_RXFIFO			0x44
> +#define DSIM_FIFOTHLD			0x48
> +#define DSIM_FIFOCTRL			0x4c
> +#define DSIM_MEMACCHR			0x50
> +#define DSIM_MULTI_PKT			0x78
> +#define DSIM_PLLCTRL_1G			0x90
> +#define DSIM_PLLCTRL			0x94
> +#define DSIM_PLLCTRL1			0x98
> +#define DSIM_PLLCTRL2			0x9c
> +#define DSIM_PLLTMR			0xa0

Looking at the register set, it seems to match the Exynos 5433,
supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
that driver instead of adding a new one for the same IP core ?

> +
> +/* register bit fields */
> +#define STATUS_PLLSTABLE		BIT(31)
> +#define STATUS_SWRSTRLS			BIT(20)
> +#define STATUS_TXREADYHSCLK		BIT(10)
> +#define STATUS_ULPSCLK			BIT(9)
> +#define STATUS_STOPSTATECLK		BIT(8)
> +
> +#define CLKCTRL_TXREQUESTHSCLK		BIT(31)
> +#define CLKCTRL_ESCCLKEN		BIT(28)
> +#define CLKCTRL_PLLBYPASS		BIT(27)
> +#define CLKCTRL_BYTECLKSRC_MASK		GENMASK(26, 25)
> +#define CLKCTRL_BYTECLKSRC(x)		FIELD_PREP(CLKCTRL_BYTECLKSRC_MASK, (x))
> +#define CLKCTRL_BYTECLKEN		BIT(24)
> +#define CLKCTRL_LANEESCDATAEN_MASK	GENMASK(23, 20)
> +#define CLKCTRL_LANEESCDATAEN(x)	FIELD_PREP(CLKCTRL_LANEESCDATAEN_MASK, (x))
> +#define CLKCTRL_LANEESCCLKEN		BIT(19)
> +#define CLKCTRL_ESCPRESCALER_MASK	GENMASK(15, 0)
> +#define CLKCTRL_ESCPRESCALER(x)		FIELD_PREP(CLKCTRL_ESCPRESCALER_MASK, (x))
> +
> +#define TIMEOUT_BTAOUT_MASK		GENMASK(23, 16)
> +#define TIMEOUT_BTAOUT(x)		FIELD_PREP(TIMEOUT_BTAOUT_MASK, (x))
> +#define TIMEOUT_LPDRTOUT_MASK		GENMASK(15, 0)
> +#define TIMEOUT_LPDRTOUT(x)		FIELD_PREP(TIMEOUT_LPDRTOUT_MASK, (x))
> +
> +#define CONFIG_NON_CONTINUOUS_CLOCK_LANE	BIT(31)
> +#define CONFIG_CLKLANE_STOP_START	BIT(30)
> +#define CONFIG_MFLUSH_VS		BIT(29)
> +#define CONFIG_EOT_R03			BIT(28)
> +#define CONFIG_SYNCINFORM		BIT(27)
> +#define CONFIG_BURSTMODE		BIT(26)
> +#define CONFIG_VIDEOMODE		BIT(25)
> +#define CONFIG_AUTOMODE			BIT(24)
> +#define CONFIG_HSEDISABLEMODE		BIT(23)
> +#define CONFIG_HFPDISABLEMODE		BIT(22)
> +#define CONFIG_HBPDISABLEMODE		BIT(21)
> +#define CONFIG_HSADISABLEMODE		BIT(20)
> +
> +#define CONFIG_MAINPIXFORMAT_MASK	GENMASK(14, 12)
> +#define CONFIG_MAINPIXFORMAT(x)		FIELD_PREP(CONFIG_MAINPIXFORMAT_MASK, (x))
> +#define CONFIG_NUMOFDATLANE_MASK	GENMASK(6, 5)
> +#define CONFIG_NUMOFDATLANE(x)		FIELD_PREP(CONFIG_NUMOFDATLANE_MASK, (x))
> +#define CONFIG_LANEEN_MASK		GENMASK(4, 0)
> +#define CONFIG_LANEEN(x)		FIELD_PREP(GENMASK(4, 1), (x))
> +#define CONFIG_CLKLANEEN		BIT(0)
> +
> +#define ESCMODE_STOPSTATE_CN_MASK	GENMASK(31, 21)
> +#define ESCMODE_STOPSTATE_CN(x)		FIELD_PREP(ESCMODE_STOPSTATE_CN_MASK, (x))
> +#define ESCMODE_CMDLPDT			BIT(7)
> +
> +#define MDRESOL_MAINSTANDBY		BIT(31)
> +#define MVPORCH_MAINVRESOL_MASK		GENMASK(27, 16)
> +#define MVPORCH_MAINVRESOL(x)		FIELD_PREP(MVPORCH_MAINVRESOL_MASK, (x))
> +#define MVPORCH_MAINHRESOL_MASK		GENMASK(11, 0)
> +#define MVPORCH_MAINHRESOL(x)		FIELD_PREP(MVPORCH_MAINHRESOL_MASK, (x))
> +#define MVPORCH_CMDALLOW_MASK		GENMASK(31, 28)
> +#define MVPORCH_CMDALLOW(x)		FIELD_PREP(MVPORCH_CMDALLOW_MASK, (x))
> +#define MVPORCH_STABLEVFP_MASK		GENMASK(26, 16)
> +#define MVPORCH_STABLEVFP(x)		FIELD_PREP(MVPORCH_STABLEVFP_MASK, (x))
> +#define MVPORCH_MAINVBP_MASK		GENMASK(10, 0)
> +#define MVPORCH_MAINVBP(x)		FIELD_PREP(MVPORCH_MAINVBP_MASK, (x))
> +#define MVPORCH_MAINHFP_MASK		GENMASK(31, 16)
> +#define MVPORCH_MAINHFP(x)		FIELD_PREP(MVPORCH_MAINHFP_MASK, (x))
> +#define MVPORCH_MAINHBP_MASK		GENMASK(15, 0)
> +#define MVPORCH_MAINHBP(x)		FIELD_PREP(MVPORCH_MAINHBP_MASK, (x))
> +#define MVPORCH_MAINVSA_MASK		GENMASK(31, 22)
> +#define MVPORCH_MAINVSA(x)		FIELD_PREP(MVPORCH_MAINVSA_MASK, (x))
> +#define MVPORCH_MAINHSA_MASK		GENMASK(15, 0)
> +#define MVPORCH_MAINHSA(x)		FIELD_PREP(MVPORCH_MAINHSA_MASK, (x))
> +
> +#define INTSRC_PLLSTABLE		BIT(31)
> +#define INTSRC_SWRSTRELEASE		BIT(30)
> +#define INTSRC_SFRPLFIFOEMPTY		BIT(29)
> +#define INTSRC_SFRPHFIFOEMPTY		BIT(28)
> +#define INTSRC_FRAMEDONE		BIT(24)
> +#define INTSRC_LPDRTOUT			BIT(21)
> +#define INTSRC_TATOUT			BIT(20)
> +#define INTSRC_RXDATDONE		BIT(18)
> +#define INTSRC_RXTE			BIT(17)
> +#define INTSRC_RXACK			BIT(16)
> +#define INTSRC_MASK			(INTSRC_PLLSTABLE	|	\
> +					 INTSRC_SWRSTRELEASE	|	\
> +					 INTSRC_SFRPLFIFOEMPTY	|	\
> +					 INTSRC_SFRPHFIFOEMPTY	|	\
> +					 INTSRC_FRAMEDONE	|	\
> +					 INTSRC_LPDRTOUT	|	\
> +					 INTSRC_TATOUT		|	\
> +					 INTSRC_RXDATDONE	|	\
> +					 INTSRC_RXTE		|	\
> +					 INTSRC_RXACK)
> +
> +#define INTMSK_MSKPLLSTABLE		BIT(31)
> +#define INTMSK_MSKSWRELEASE		BIT(30)
> +#define INTMSK_MSKSFRPLFIFOEMPTY	BIT(29)
> +#define INTMSK_MSKSFRPHFIFOEMPTY	BIT(28)
> +#define INTMSK_MSKFRAMEDONE		BIT(24)
> +#define INTMSK_MSKLPDRTOUT		BIT(21)
> +#define INTMSK_MSKTATOUT		BIT(20)
> +#define INTMSK_MSKRXDATDONE		BIT(18)
> +#define INTMSK_MSKRXTE			BIT(17)
> +#define INTMSK_MSKRXACK			BIT(16)
> +
> +#define PKTHDR_DATA1_MASK		GENMASK(23, 16)
> +#define PKTHDR_DATA1(x)			FIELD_PREP(PKTHDR_DATA1_MASK, (x))
> +#define PKTHDR_DATA1_GET(x)		FIELD_GET(PKTHDR_DATA1_MASK, (x))
> +#define PKTHDR_WC_MASK			GENMASK(23, 8)
> +#define PKTHDR_WC_GET(x)		FIELD_GET(PKTHDR_WC_MASK, (x))
> +#define PKTHDR_DATA0_MASK		GENMASK(15, 8)
> +#define PKTHDR_DATA0(x)			FIELD_PREP(PKTHDR_DATA0_MASK, (x))
> +#define PKTHDR_DATA0_GET(x)		FIELD_GET(PKTHDR_DATA0_MASK, (x))
> +#define PKTHDR_DI_MASK			GENMASK(7, 0)
> +#define PKTHDR_DI(x)			FIELD_PREP(PKTHDR_DI_MASK, (x))
> +#define PKTHDR_DT_MASK			GENMASK(5, 0)
> +#define PKTHDR_DT_GET(x)		FIELD_GET(PKTHDR_DT_MASK, (x))
> +
> +#define FIFOCTRL_FULLRX			BIT(25)
> +#define FIFOCTRL_EMPTYRX		BIT(24)
> +#define FIFOCTRL_FULLHSFR		BIT(23)
> +#define FIFOCTRL_EMPTYHSFR		BIT(22)
> +#define FIFOCTRL_FULLLSFR		BIT(21)
> +#define FIFOCTRL_EMPTYLSFR		BIT(20)
> +#define FIFOCTRL_FULLHMAIN		BIT(11)
> +#define FIFOCTRL_EMPTYHMAIN		BIT(10)
> +#define FIFOCTRL_FULLLMAIN		BIT(9)
> +#define FIFOCTRL_EMPTYLMAIN		BIT(8)
> +#define FIFOCTRL_NINITRX		BIT(4)
> +#define FIFOCTRL_NINITSFR		BIT(3)
> +#define FIFOCTRL_NINITI80		BIT(2)
> +#define FIFOCTRL_NINITSUB		BIT(1)
> +#define FIFOCTRL_NINITMAIN		BIT(0)
> +#define FIFOCTRL_INIT_MASK		GENMASK(4, 0)
> +
> +#define PLLCTRL_PLLEN			BIT(23)
> +#define PLLCTRL_PMS_P_MASK		GENMASK(18, 14)
> +#define PLLCTRL_PMS_P(x)		FIELD_PREP(PLLCTRL_PMS_P_MASK, (x))
> +#define PLLCTRL_PMS_M_MASK		GENMASK(12, 4)
> +#define PLLCTRL_PMS_M(x)		FIELD_PREP(PLLCTRL_PMS_M_MASK, (x))
> +#define PLLCTRL_PMS_S_MASK		GENMASK(2, 1)
> +#define PLLCTRL_PMS_S(x)		FIELD_PREP(PLLCTRL_PMS_S_MASK, (x))
> +
> +/* dsim all irqs index */
> +#define PLLSTABLE			1
> +#define SWRSTRELEASE			2
> +#define SFRPLFIFOEMPTY			3
> +#define SFRPHFIFOEMPTY			4
> +#define SYNCOVERRIDE			5
> +#define BUSTURNOVER			6
> +#define FRAMEDONE			7
> +#define LPDRTOUT			8
> +#define TATOUT				9
> +#define RXDATDONE			10
> +#define RXTE				11
> +#define RXACK				12
> +#define ERRRXECC			13
> +#define ERRRXCRC			14
> +#define ERRESC3				15
> +#define ERRESC2				16
> +#define ERRESC1				17
> +#define ERRESC0				18
> +#define ERRSYNC3			19
> +#define ERRSYNC2			20
> +#define ERRSYNC1			21
> +#define ERRSYNC0			22
> +#define ERRCONTROL3			23
> +#define ERRCONTROL2			24
> +#define ERRCONTROL1			25
> +#define ERRCONTROL0			26
> +
> +#define MIPI_FIFO_TIMEOUT		msecs_to_jiffies(250)
> +
> +#define DSIM_HFP_PKT_OVERHEAD		6
> +#define DSIM_HBP_PKT_OVERHEAD		6
> +#define DSIM_HSA_PKT_OVERHEAD		6
> +
> +struct sec_dsim_plat_data {
> +	unsigned int version;
> +	unsigned int pll_timer;
> +	unsigned int max_freq_hz;
> +	unsigned int esc_stop_state_cnt;
> +};
> +
> +struct sec_dsim {
> +	struct mipi_dsi_host host;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *panel_bridge;
> +	struct device *dev;
> +
> +	struct clk *clk_phy_ref;
> +	struct clk *clk_bus;
> +	struct phy *phy;
> +
> +	struct regmap *regmap;
> +	struct drm_display_mode mode;
> +	int irq;
> +	unsigned int pll_clk_hz;
> +	unsigned int burst_clk_hz;
> +	unsigned int esc_clk_hz;
> +	unsigned int lanes;
> +	unsigned int channel;
> +	enum mipi_dsi_pixel_format format;
> +	unsigned long mode_flags;
> +
> +	struct completion pll_stable;
> +	struct completion ph_tx_done;
> +	struct completion pl_tx_done;
> +	struct completion rx_done;
> +	const struct sec_dsim_plat_data *pdata;
> +};
> +
> +static const struct regmap_config sec_dsim_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = DSIM_PLLTMR,
> +	.name = DRIVER_NAME,
> +};
> +
> +static inline struct sec_dsim *host_to_dsim(struct mipi_dsi_host *host)
> +{
> +	return container_of(host, struct sec_dsim, host);
> +}
> +
> +static inline struct sec_dsim *bridge_to_dsim(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct sec_dsim, bridge);
> +}
> +
> +/* used for CEA standard modes */
> +struct dsim_hblank_par {
> +	char *name;		/* drm display mode name */
> +	int vrefresh;
> +	int hfp_wc;
> +	int hbp_wc;
> +	int hsa_wc;
> +	int lanes;
> +};
> +
> +#define DSIM_HBLANK_PARAM(nm, vf, hfp, hbp, hsa, num)	\
> +	.name	  = (nm),				\
> +	.vrefresh = (vf),				\
> +	.hfp_wc   = (hfp),				\
> +	.hbp_wc   = (hbp),				\
> +	.hsa_wc   = (hsa),				\
> +	.lanes	  = (num)
> +
> +static const struct dsim_hblank_par hblank_4lanes[] = {
> +	/* {  88, 148, 44 } */
> +	{ DSIM_HBLANK_PARAM("1920x1080", 60,  60, 105,  27, 4), },
> +	/* { 528, 148, 44 } */
> +	{ DSIM_HBLANK_PARAM("1920x1080", 50, 390, 105,  27, 4), },
> +	/* {  88, 148, 44 } */
> +	{ DSIM_HBLANK_PARAM("1920x1080", 30,  60, 105,  27, 4), },
> +	/* { 110, 220, 40 } */
> +	{ DSIM_HBLANK_PARAM("1280x720",  60,  78, 159,  24, 4), },
> +	/* { 440, 220, 40 } */
> +	{ DSIM_HBLANK_PARAM("1280x720",  50, 324, 159,  24, 4), },
> +	/* {  16,  60, 62 } */
> +	{ DSIM_HBLANK_PARAM("720x480",   60,   6,  39,  40, 4), },
> +	/* {  12,  68, 64 } */
> +	{ DSIM_HBLANK_PARAM("720x576",   50,   3,  45,  42, 4), },
> +	/* {  16,  48, 96 } */
> +	{ DSIM_HBLANK_PARAM("640x480",   60,   6,  30,  66, 4), },
> +};
> +
> +static const struct dsim_hblank_par hblank_2lanes[] = {
> +	/* {  88, 148, 44 } */
> +	{ DSIM_HBLANK_PARAM("1920x1080", 30, 114, 210,  60, 2), },
> +	/* { 110, 220, 40 } */
> +	{ DSIM_HBLANK_PARAM("1280x720",  60, 159, 320,  40, 2), },
> +	/* { 440, 220, 40 } */
> +	{ DSIM_HBLANK_PARAM("1280x720",  50, 654, 320,  40, 2), },
> +	/* {  16,  60, 62 } */
> +	{ DSIM_HBLANK_PARAM("720x480",   60,  16,  66,  88, 2), },
> +	/* {  12,  68, 64 } */
> +	{ DSIM_HBLANK_PARAM("720x576",   50,  12,  96,  72, 2), },
> +	/* {  16,  48, 96 } */
> +	{ DSIM_HBLANK_PARAM("640x480",   60,  18,  66, 138, 2), },
> +};
> +
> +static
> +const struct dsim_hblank_par *sec_dsim_get_hblank_par(struct sec_dsim *dsim)
> +{
> +	struct drm_display_mode *mode = &dsim->mode;
> +	const struct dsim_hblank_par *hpar, *hblank;
> +	int i, size;
> +
> +	if (unlikely(!mode->name))
> +		return NULL;
> +
> +	switch (dsim->lanes) {
> +	case 2:
> +		hblank = hblank_2lanes;
> +		size   = ARRAY_SIZE(hblank_2lanes);
> +		break;
> +	case 4:
> +		hblank = hblank_4lanes;
> +		size   = ARRAY_SIZE(hblank_4lanes);
> +		break;
> +	default:
> +		DRM_DEV_ERROR(dsim->dev,
> +			      "No hblank data for mode %s with %d lanes\n",
> +			      mode->name, dsim->lanes);
> +		return NULL;
> +	}
> +
> +	for (i = 0; i < size; i++) {
> +		hpar = &hblank[i];
> +
> +		if (!strcmp(mode->name, hpar->name)) {
> +			if (drm_mode_vrefresh(mode) != hpar->vrefresh)
> +				continue;
> +
> +			/* found */
> +			return hpar;
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static void dsim_write(struct sec_dsim *dsim, unsigned int reg, u32 val)
> +{
> +	int ret;
> +
> +	ret = regmap_write(dsim->regmap, reg, val);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dsim->dev,
> +			      "failed to write sec dsim reg 0x%x: %d\n",
> +			      reg, ret);
> +}
> +
> +static u32 dsim_read(struct sec_dsim *dsim, u32 reg)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(dsim->regmap, reg, &val);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dsim->dev,
> +			      "failed to read sec dsim reg 0x%x: %d\n",
> +			      reg, ret);
> +
> +	return val;
> +}
> +
> +static void __maybe_unused sec_dsim_irq_mask(struct sec_dsim *dsim,
> +						  int irq_idx)
> +{
> +	uint32_t intmsk;
> +
> +	intmsk = dsim_read(dsim, DSIM_INTMSK);
> +
> +	switch (irq_idx) {
> +	case PLLSTABLE:
> +		intmsk |= INTMSK_MSKPLLSTABLE;
> +		break;
> +	case SWRSTRELEASE:
> +		intmsk |= INTMSK_MSKSWRELEASE;
> +		break;
> +	case SFRPLFIFOEMPTY:
> +		intmsk |= INTMSK_MSKSFRPLFIFOEMPTY;
> +		break;
> +	case SFRPHFIFOEMPTY:
> +		intmsk |= INTMSK_MSKSFRPHFIFOEMPTY;
> +		break;
> +	case FRAMEDONE:
> +		intmsk |= INTMSK_MSKFRAMEDONE;
> +		break;
> +	case LPDRTOUT:
> +		intmsk |= INTMSK_MSKLPDRTOUT;
> +		break;
> +	case TATOUT:
> +		intmsk |= INTMSK_MSKTATOUT;
> +		break;
> +	case RXDATDONE:
> +		intmsk |= INTMSK_MSKRXDATDONE;
> +		break;
> +	case RXTE:
> +		intmsk |= INTMSK_MSKRXTE;
> +		break;
> +	case RXACK:
> +		intmsk |= INTMSK_MSKRXACK;
> +		break;
> +	default:
> +		/* unsupported irq */
> +		return;
> +	}
> +
> +	dsim_write(dsim, DSIM_INTMSK, intmsk);
> +}
> +
> +static void sec_dsim_irq_unmask(struct sec_dsim *dsim,
> +				     int irq_idx)
> +{
> +	uint32_t intmsk;
> +
> +	intmsk = dsim_read(dsim, DSIM_INTMSK);
> +
> +	switch (irq_idx) {
> +	case PLLSTABLE:
> +		intmsk &= ~INTMSK_MSKPLLSTABLE;
> +		break;
> +	case SWRSTRELEASE:
> +		intmsk &= ~INTMSK_MSKSWRELEASE;
> +		break;
> +	case SFRPLFIFOEMPTY:
> +		intmsk &= ~INTMSK_MSKSFRPLFIFOEMPTY;
> +		break;
> +	case SFRPHFIFOEMPTY:
> +		intmsk &= ~INTMSK_MSKSFRPHFIFOEMPTY;
> +		break;
> +	case FRAMEDONE:
> +		intmsk &= ~INTMSK_MSKFRAMEDONE;
> +		break;
> +	case LPDRTOUT:
> +		intmsk &= ~INTMSK_MSKLPDRTOUT;
> +		break;
> +	case TATOUT:
> +		intmsk &= ~INTMSK_MSKTATOUT;
> +		break;
> +	case RXDATDONE:
> +		intmsk &= ~INTMSK_MSKRXDATDONE;
> +		break;
> +	case RXTE:
> +		intmsk &= ~INTMSK_MSKRXTE;
> +		break;
> +	case RXACK:
> +		intmsk &= ~INTMSK_MSKRXACK;
> +		break;
> +	default:
> +		/* unsupported irq */
> +		return;
> +	}
> +
> +	dsim_write(dsim, DSIM_INTMSK, intmsk);
> +}
> +
> +/* write 1 clear irq */
> +static void sec_dsim_irq_clear(struct sec_dsim *dsim,
> +				    int irq_idx)
> +{
> +	uint32_t intsrc = 0;
> +
> +	switch (irq_idx) {
> +	case PLLSTABLE:
> +		intsrc |= INTSRC_PLLSTABLE;
> +		break;
> +	case SWRSTRELEASE:
> +		intsrc |= INTSRC_SWRSTRELEASE;
> +		break;
> +	case SFRPLFIFOEMPTY:
> +		intsrc |= INTSRC_SFRPLFIFOEMPTY;
> +		break;
> +	case SFRPHFIFOEMPTY:
> +		intsrc |= INTSRC_SFRPHFIFOEMPTY;
> +		break;
> +	case FRAMEDONE:
> +		intsrc |= INTSRC_FRAMEDONE;
> +		break;
> +	case LPDRTOUT:
> +		intsrc |= INTSRC_LPDRTOUT;
> +		break;
> +	case TATOUT:
> +		intsrc |= INTSRC_TATOUT;
> +		break;
> +	case RXDATDONE:
> +		intsrc |= INTSRC_RXDATDONE;
> +		break;
> +	case RXTE:
> +		intsrc |= INTSRC_RXTE;
> +		break;
> +	case RXACK:
> +		intsrc |= INTSRC_RXACK;
> +		break;
> +	default:
> +		/* unsupported irq */
> +		return;
> +	}
> +
> +	dsim_write(dsim, DSIM_INTSRC, intsrc);
> +}
> +
> +static void sec_dsim_irq_init(struct sec_dsim *dsim)
> +{
> +	sec_dsim_irq_unmask(dsim, PLLSTABLE);
> +	sec_dsim_irq_unmask(dsim, SWRSTRELEASE);
> +}
> +
> +static irqreturn_t sec_dsim_irq_handler(int irq, void *data)
> +{
> +	uint32_t intsrc, status;
> +	struct sec_dsim *dsim = data;
> +
> +	intsrc = dsim_read(dsim, DSIM_INTSRC);
> +	status = dsim_read(dsim, DSIM_STATUS);
> +
> +	if (WARN_ON(!intsrc)) {
> +		DRM_DEV_ERROR(dsim->dev, "interrupt is not from dsim\n");
> +		return IRQ_NONE;
> +	}
> +
> +	if (WARN_ON(!(intsrc & INTSRC_MASK))) {
> +		dev_warn(dsim->dev, "unenable irq happens: %#x\n", intsrc);
> +		/* just clear irqs */
> +		dsim_write(dsim, DSIM_INTSRC, intsrc);
> +		return IRQ_NONE;
> +	}
> +
> +	if (intsrc & INTSRC_PLLSTABLE) {
> +		WARN_ON(!(status & STATUS_PLLSTABLE));
> +		sec_dsim_irq_clear(dsim, PLLSTABLE);
> +		complete(&dsim->pll_stable);
> +	}
> +
> +	if (intsrc & INTSRC_SWRSTRELEASE)
> +		sec_dsim_irq_clear(dsim, SWRSTRELEASE);
> +
> +	if (intsrc & INTSRC_SFRPLFIFOEMPTY) {
> +		sec_dsim_irq_clear(dsim, SFRPLFIFOEMPTY);
> +		complete(&dsim->pl_tx_done);
> +	}
> +
> +	if (intsrc & INTSRC_SFRPHFIFOEMPTY) {
> +		sec_dsim_irq_clear(dsim, SFRPHFIFOEMPTY);
> +		complete(&dsim->ph_tx_done);
> +	}
> +
> +	if (WARN_ON(intsrc & INTSRC_LPDRTOUT)) {
> +		sec_dsim_irq_clear(dsim, LPDRTOUT);
> +		dev_warn(dsim->dev, "LP RX timeout\n");
> +	}
> +
> +	if (WARN_ON(intsrc & INTSRC_TATOUT)) {
> +		sec_dsim_irq_clear(dsim, TATOUT);
> +		dev_warn(dsim->dev, "Turns around Acknowledge timeout\n");
> +	}
> +
> +	if (intsrc & INTSRC_RXDATDONE) {
> +		sec_dsim_irq_clear(dsim, RXDATDONE);
> +		complete(&dsim->rx_done);
> +	}
> +
> +	if (intsrc & INTSRC_RXTE) {
> +		sec_dsim_irq_clear(dsim, RXTE);
> +		DRM_DEV_DEBUG(dsim->dev, "TE Rx trigger received\n");
> +	}
> +
> +	if (intsrc & INTSRC_RXACK) {
> +		sec_dsim_irq_clear(dsim, RXACK);
> +		DRM_DEV_DEBUG(dsim->dev, "ACK Rx trigger received\n");
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void sec_dsim_config_cmd_lpm(struct sec_dsim *dsim, bool enable)
> +{
> +	u32 reg;
> +
> +	reg = dsim_read(dsim, DSIM_ESCMODE);
> +
> +	if (enable)
> +		reg |= ESCMODE_CMDLPDT;
> +	else
> +		reg &= ~ESCMODE_CMDLPDT;
> +
> +	dsim_write(dsim, DSIM_ESCMODE, reg);
> +}
> +
> +static void sec_dsim_write_pl_to_sfr_fifo(struct sec_dsim *dsim,
> +					  const void *payload,
> +					  size_t length)
> +{
> +	uint32_t pl_data;
> +
> +	if (!length)
> +		return;
> +
> +	while (length >= 4) {
> +		pl_data = get_unaligned_le32(payload);
> +		dsim_write(dsim, DSIM_PAYLOAD, pl_data);
> +		payload += 4;
> +		length -= 4;
> +	}
> +
> +	pl_data = 0;
> +	switch (length) {
> +	case 3:
> +		pl_data |= ((u8 *)payload)[2] << 16;
> +		/* fallthrough */
> +	case 2:
> +		pl_data |= ((u8 *)payload)[1] << 8;
> +		/* fallthrough */
> +	case 1:
> +		pl_data |= ((u8 *)payload)[0];
> +		dsim_write(dsim, DSIM_PAYLOAD, pl_data);
> +		break;
> +	}
> +}
> +
> +static void sec_dsim_write_ph_to_sfr_fifo(struct sec_dsim *dsim,
> +					       void *header,
> +					       bool use_lpm)
> +{
> +	u32 reg;
> +
> +	reg = dsim_read(dsim, DSIM_PKTHDR);
> +
> +	reg &= ~PKTHDR_DATA1_MASK;
> +	reg |= PKTHDR_DATA1(((u8 *)header)[2]);	/* WC MSB */
> +	reg &= ~PKTHDR_DATA0_MASK;
> +	reg |= PKTHDR_DATA0(((u8 *)header)[1]);	/* WC LSB  */
> +	reg &= ~PKTHDR_DI_MASK;
> +	reg |= PKTHDR_DI(((u8 *)header)[0]);	/* Data ID */
> +	dsim_write(dsim, DSIM_PKTHDR, reg);
> +}
> +
> +static int sec_dsim_read_pl_from_sfr_fifo(struct sec_dsim *dsim,
> +					       void *payload,
> +					       size_t length)
> +{
> +	uint8_t data_type;
> +	uint16_t word_count = 0;
> +	uint32_t reg, ph, pl;
> +
> +	reg = dsim_read(dsim, DSIM_FIFOCTRL);
> +
> +	if (WARN_ON(reg & FIFOCTRL_EMPTYRX))
> +		return -EINVAL;
> +
> +	ph = dsim_read(dsim, DSIM_RXFIFO);
> +	data_type = PKTHDR_DT_GET(ph);
> +	switch (data_type) {
> +	case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
> +		DRM_DEV_ERROR(dsim->dev,
> +			      "peripheral report error: (0-7)%lx, (8-15)%lx\n",
> +			      PKTHDR_DATA0_GET(ph), PKTHDR_DATA1_GET(ph));
> +		return -EPROTO;
> +	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
> +	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
> +		if (!WARN_ON(length < 2)) {
> +			((u8 *)payload)[1] = PKTHDR_DATA1_GET(ph);
> +			word_count++;
> +		}
> +		/* fall through */
> +	case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
> +	case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
> +		((u8 *)payload)[0] = PKTHDR_DATA0_GET(ph);
> +		word_count++;
> +		length = word_count;
> +		break;
> +	case MIPI_DSI_RX_DCS_LONG_READ_RESPONSE:
> +	case MIPI_DSI_RX_GENERIC_LONG_READ_RESPONSE:
> +		word_count = PKTHDR_WC_GET(ph);
> +		if (word_count > length) {
> +			DRM_DEV_ERROR(dsim->dev, "invalid receive buffer length\n");
> +			return -EINVAL;
> +		}
> +
> +		length = word_count;
> +
> +		while (word_count >= 4) {
> +			pl = dsim_read(dsim, DSIM_RXFIFO);
> +			((u8 *)payload)[0] = pl & 0xff;
> +			((u8 *)payload)[1] = (pl >> 8)  & 0xff;
> +			((u8 *)payload)[2] = (pl >> 16) & 0xff;
> +			((u8 *)payload)[3] = (pl >> 24) & 0xff;
> +			payload += 4;
> +			word_count -= 4;
> +		}
> +
> +		if (word_count > 0) {
> +			pl = dsim_read(dsim, DSIM_RXFIFO);
> +
> +			switch (word_count) {
> +			case 3:
> +				((u8 *)payload)[2] = (pl >> 16) & 0xff;
> +				/* fall through */
> +			case 2:
> +				((u8 *)payload)[1] = (pl >> 8) & 0xff;
> +				/* fall through */
> +			case 1:
> +				((u8 *)payload)[0] = pl & 0xff;
> +				break;
> +			}
> +		}
> +
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return length;
> +}
> +
> +static ssize_t sec_dsim_host_transfer(struct mipi_dsi_host *host,
> +					   const struct mipi_dsi_msg *msg)
> +{
> +	int ret;
> +	bool use_lpm;
> +	struct mipi_dsi_packet packet;
> +	struct sec_dsim *dsim = host_to_dsim(host);
> +
> +	if ((msg->rx_buf && !msg->rx_len) || (msg->rx_len && !msg->rx_buf))
> +		return -EINVAL;
> +
> +	ret = mipi_dsi_create_packet(&packet, msg);
> +	if (ret) {
> +		DRM_DEV_ERROR(dsim->dev, "failed to create dsi packet: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* need to read data from peripheral */
> +	if (unlikely(msg->rx_buf))
> +		reinit_completion(&dsim->rx_done);
> +
> +	/* config LPM for CMD TX */
> +	use_lpm = msg->flags & MIPI_DSI_MSG_USE_LPM ? true : false;
> +	sec_dsim_config_cmd_lpm(dsim, use_lpm);
> +
> +	if (packet.payload_length) {		/* Long Packet case */
> +		reinit_completion(&dsim->pl_tx_done);
> +
> +		/* write packet payload */
> +		sec_dsim_write_pl_to_sfr_fifo(dsim,
> +						   packet.payload,
> +						   packet.payload_length);
> +
> +		/* write packet header */
> +		sec_dsim_write_ph_to_sfr_fifo(dsim,
> +						   packet.header,
> +						   use_lpm);
> +
> +		ret = wait_for_completion_timeout(&dsim->ph_tx_done,
> +						  MIPI_FIFO_TIMEOUT);
> +		if (!ret) {
> +			DRM_DEV_ERROR(dsim->dev, "wait payload tx done time out\n");
> +			return -EBUSY;
> +		}
> +	} else {
> +		reinit_completion(&dsim->ph_tx_done);
> +
> +		/* write packet header */
> +		sec_dsim_write_ph_to_sfr_fifo(dsim,
> +						   packet.header,
> +						   use_lpm);
> +
> +		ret = wait_for_completion_timeout(&dsim->ph_tx_done,
> +						  MIPI_FIFO_TIMEOUT);
> +		if (!ret) {
> +			DRM_DEV_ERROR(dsim->dev, "wait pkthdr tx done time out\n");
> +			return -EBUSY;
> +		}
> +	}
> +
> +	/* read packet payload */
> +	if (unlikely(msg->rx_buf)) {
> +		ret = wait_for_completion_timeout(&dsim->rx_done,
> +						  MIPI_FIFO_TIMEOUT);
> +		if (!ret) {
> +			DRM_DEV_ERROR(dsim->dev, "wait rx done time out\n");
> +			return -EBUSY;
> +		}
> +
> +		ret = sec_dsim_read_pl_from_sfr_fifo(dsim,
> +							  msg->rx_buf,
> +							  msg->rx_len);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int sec_dsim_host_attach(struct mipi_dsi_host *host,
> +				struct mipi_dsi_device *device)
> +{
> +	struct sec_dsim *dsim = host_to_dsim(host);
> +
> +	dsim->lanes	 = device->lanes;
> +	dsim->channel	 = device->channel;
> +	dsim->format	 = device->format;
> +	dsim->mode_flags = device->mode_flags;
> +
> +	return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops sec_dsim_host_ops = {
> +	.attach   = sec_dsim_host_attach,
> +	.transfer = sec_dsim_host_transfer,
> +};
> +
> +static void sec_dsim_video_mode(struct sec_dsim *dsim)
> +{
> +	struct drm_display_mode *mode = &dsim->mode;
> +	unsigned int bpp = mipi_dsi_pixel_format_to_bpp(dsim->format);
> +	const struct dsim_hblank_par *hpar = NULL;
> +	unsigned int hfp, hbp, hsa, vfp, vbp, vsa;
> +	unsigned int hfp_wc, hbp_wc, hsa_wc, wc;
> +	unsigned int reg;
> +
> +	hfp = mode->hsync_start - mode->hdisplay;
> +	hbp = mode->htotal - mode->hsync_end;
> +	hsa = mode->hsync_end - mode->hsync_start;
> +	vfp = mode->vsync_start - mode->vdisplay;
> +	vbp = mode->vtotal - mode->vsync_end;
> +	vsa = mode->vsync_end - mode->vsync_start;
> +
> +	if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
> +		hpar = sec_dsim_get_hblank_par(dsim);
> +		if (!hpar)
> +			DRM_DEV_DEBUG(dsim->dev,
> +				      "No pre-exist hpar can be used\n");
> +	}
> +
> +	/* vertical porch */
> +	reg = dsim_read(dsim, DSIM_MVPORCH);
> +
> +	reg &= ~MVPORCH_MAINVBP_MASK;
> +	reg |= MVPORCH_MAINVBP(vbp);
> +	reg &= ~MVPORCH_STABLEVFP_MASK;
> +	reg |= MVPORCH_STABLEVFP(vfp);
> +	reg &= ~MVPORCH_CMDALLOW_MASK;
> +	reg |= MVPORCH_CMDALLOW(0x0);
> +	dsim_write(dsim, DSIM_MVPORCH, reg);
> +
> +	if (!hpar) {
> +		wc = DIV_ROUND_UP(hfp * (bpp >> 3), dsim->lanes);
> +		hfp_wc = wc > DSIM_HFP_PKT_OVERHEAD ?
> +			 wc - DSIM_HFP_PKT_OVERHEAD : hfp;
> +		wc = DIV_ROUND_UP(hbp * (bpp >> 3), dsim->lanes);
> +		hbp_wc = wc > DSIM_HBP_PKT_OVERHEAD ?
> +			 wc - DSIM_HBP_PKT_OVERHEAD : hbp;
> +	} else {
> +		hfp_wc = hpar->hfp_wc;
> +		hbp_wc = hpar->hbp_wc;
> +	}
> +
> +	/* horizontal porch */
> +	reg = dsim_read(dsim, DSIM_MHPORCH);
> +
> +	reg &= ~MVPORCH_MAINHBP_MASK;
> +	reg |= MVPORCH_MAINHBP(hbp_wc);
> +	reg &= ~MVPORCH_MAINHFP_MASK;
> +	reg |= MVPORCH_MAINHFP(hfp_wc);
> +	dsim_write(dsim, DSIM_MHPORCH, reg);
> +
> +	if (!hpar) {
> +		wc = DIV_ROUND_UP(hsa * (bpp >> 3), dsim->lanes);
> +		hsa_wc = wc > DSIM_HSA_PKT_OVERHEAD ?
> +			 wc - DSIM_HSA_PKT_OVERHEAD : hsa;
> +	} else {
> +		hsa_wc = hpar->hsa_wc;
> +	}
> +
> +	/* sync area */
> +	reg = dsim_read(dsim, DSIM_MSYNC);
> +
> +	reg &= ~MVPORCH_MAINHSA_MASK;
> +	reg |= MVPORCH_MAINHSA(hsa_wc);
> +	reg &= ~MVPORCH_MAINVSA_MASK;
> +	reg |= MVPORCH_MAINVSA(vsa);
> +	dsim_write(dsim, DSIM_MSYNC, reg);
> +}
> +
> +static void sec_dsim_display_mode(struct sec_dsim *dsim)
> +{
> +	struct drm_display_mode *mode = &dsim->mode;
> +	u32 reg;
> +
> +	if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		sec_dsim_video_mode(dsim);
> +
> +	/* image resolution */
> +	reg = dsim_read(dsim, DSIM_MDRESOL);
> +
> +	reg &= ~MVPORCH_MAINHRESOL_MASK;
> +	reg |= MVPORCH_MAINHRESOL(mode->hdisplay);
> +	reg &= ~MVPORCH_MAINVRESOL_MASK;
> +	reg |= MVPORCH_MAINVRESOL(mode->vdisplay);
> +
> +	dsim_write(dsim, DSIM_MDRESOL, reg);
> +}
> +
> +static void sec_dsim_config_bridge(struct sec_dsim *dsim)
> +{
> +	const struct sec_dsim_plat_data *pdata = dsim->pdata;
> +	u32 reg;
> +
> +	reg = dsim_read(dsim, DSIM_CONFIG);
> +
> +	if (dsim->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> +		reg |= CONFIG_NON_CONTINUOUS_CLOCK_LANE;
> +		reg |= CONFIG_CLKLANE_STOP_START;
> +	}
> +
> +	if (!(dsim->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
> +		reg |= CONFIG_MFLUSH_VS;
> +
> +	/* disable EoT packets in HS mode */
> +	if (!(dsim->mode_flags & MIPI_DSI_MODE_EOT_PACKET))
> +		reg |= CONFIG_EOT_R03;
> +
> +	if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		reg |= CONFIG_VIDEOMODE;
> +
> +		if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> +			reg |= CONFIG_BURSTMODE;
> +
> +		else if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> +			reg |= CONFIG_SYNCINFORM;
> +
> +		if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
> +			reg |= CONFIG_AUTOMODE;
> +
> +		if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> +			reg |= CONFIG_HSEDISABLEMODE;
> +
> +		if (!(dsim->mode_flags & MIPI_DSI_MODE_VIDEO_HFP))
> +			reg |= CONFIG_HFPDISABLEMODE;
> +
> +		if (!(dsim->mode_flags & MIPI_DSI_MODE_VIDEO_HBP))
> +			reg |= CONFIG_HBPDISABLEMODE;
> +
> +		if (!(dsim->mode_flags & MIPI_DSI_MODE_VIDEO_HSA))
> +			reg |= CONFIG_HSADISABLEMODE;
> +	}
> +
> +	/* pixel format */
> +	reg &= ~CONFIG_MAINPIXFORMAT_MASK;
> +	if (dsim->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		switch (dsim->format) {
> +		case MIPI_DSI_FMT_RGB565:
> +			reg |= CONFIG_MAINPIXFORMAT(0x4);
> +			break;
> +		case MIPI_DSI_FMT_RGB666_PACKED:
> +			reg |= CONFIG_MAINPIXFORMAT(0x5);
> +			break;
> +		case MIPI_DSI_FMT_RGB666:
> +			reg |= CONFIG_MAINPIXFORMAT(0x6);
> +			break;
> +		case MIPI_DSI_FMT_RGB888:
> +			reg |= CONFIG_MAINPIXFORMAT(0x7);
> +			break;
> +		default:
> +			reg |= CONFIG_MAINPIXFORMAT(0x7);
> +			break;
> +		}
> +	}
> +
> +	/* number of data lanes */
> +	reg &= ~CONFIG_NUMOFDATLANE_MASK;
> +	reg |= CONFIG_NUMOFDATLANE(dsim->lanes - 1);
> +
> +	/* enable data, clock lane */
> +	reg &= ~CONFIG_LANEEN_MASK;
> +	reg |= CONFIG_LANEEN(BIT(dsim->lanes) - 1);
> +	reg |= CONFIG_CLKLANEEN;
> +
> +	dsim_write(dsim, DSIM_CONFIG, reg);
> +
> +	/* escape mode */
> +	reg = dsim_read(dsim, DSIM_ESCMODE);
> +
> +	reg &= ~ESCMODE_STOPSTATE_CN_MASK;
> +	reg |= ESCMODE_STOPSTATE_CN(pdata->esc_stop_state_cnt);
> +	dsim_write(dsim, DSIM_ESCMODE, reg);
> +
> +	/* timeout */
> +	reg = dsim_read(dsim, DSIM_TIMEOUT);
> +
> +	reg &= ~TIMEOUT_LPDRTOUT_MASK;
> +	reg |= TIMEOUT_LPDRTOUT(0xffff);
> +	reg &= ~TIMEOUT_BTAOUT_MASK;
> +	reg |= TIMEOUT_BTAOUT(0xff);
> +	dsim_write(dsim, DSIM_TIMEOUT, reg);
> +}
> +
> +#ifndef MHZ
> +#define MHZ	(1000*1000)
> +#endif
> +
> +static unsigned long sec_dsim_pll_find_pms(struct sec_dsim *dsim,
> +					   unsigned long fin,
> +					   unsigned long fout,
> +					   u8 *p, u16 *m, u8 *s)
> +{
> +	const struct sec_dsim_plat_data *pdata = dsim->pdata;
> +	unsigned long best_freq = 0;
> +	u32 min_delta = 0xffffffff;
> +	u8 p_min, p_max;
> +	u8 _p, best_p;
> +	u16 _m, best_m;
> +	u8 _s, best_s;
> +
> +	p_min = DIV_ROUND_UP(fin, (12 * MHZ));
> +	p_max = fin / (6 * MHZ);
> +
> +	for (_p = p_min; _p <= p_max; ++_p) {
> +		for (_s = 0; _s <= 5; ++_s) {
> +			u64 tmp;
> +			u32 delta;
> +
> +			tmp = (u64)fout * (_p << _s);
> +			do_div(tmp, fin);
> +			_m = tmp;
> +			if (_m < 41 || _m > 125)
> +				continue;
> +
> +			tmp = (u64)_m * fin;
> +			do_div(tmp, _p);
> +			if (tmp < 500 * MHZ || tmp > pdata->max_freq_hz * MHZ)
> +				continue;
> +
> +			tmp = (u64)_m * fin;
> +			do_div(tmp, _p << _s);
> +
> +			delta = abs(fout - tmp);
> +			if (delta < min_delta) {
> +				best_p = _p;
> +				best_m = _m;
> +				best_s = _s;
> +				min_delta = delta;
> +				best_freq = tmp;
> +			}
> +		}
> +	}
> +
> +	if (best_freq) {
> +		*p = best_p;
> +		*m = best_m;
> +		*s = best_s;
> +	}
> +
> +	return best_freq;
> +}
> +
> +static unsigned long sec_dsim_set_pll(struct sec_dsim *dsim)
> +{
> +	unsigned long fin, fout, freq;
> +	u8 p, s;
> +	u16 m;
> +	u32 reg;
> +
> +	fin = dsim->pll_clk_hz;
> +	freq = dsim->burst_clk_hz;
> +	fout = sec_dsim_pll_find_pms(dsim, fin, freq, &p, &m, &s);
> +	if (!fout) {
> +		DRM_DEV_ERROR(dsim->dev,
> +			      "failed to find PLL PMS for requested frequency\n");
> +		return 0;
> +	}
> +	DRM_DEV_DEBUG(dsim->dev,
> +		      "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);
> +
> +	reg = PLLCTRL_PLLEN | PLLCTRL_PMS_P(p) | PLLCTRL_PMS_M(m) | PLLCTRL_PMS_S(s);
> +
> +	dsim_write(dsim, DSIM_PLLCTRL, reg);
> +
> +	regmap_read_poll_timeout(dsim->regmap, DSIM_STATUS, reg,
> +				 reg & STATUS_PLLSTABLE, 0, 1000);
> +	return fout;
> +}
> +
> +static int sec_dsim_enable_clock(struct sec_dsim *dsim)
> +{
> +	const struct sec_dsim_plat_data *pdata = dsim->pdata;
> +	unsigned long hs_clk, byte_clk, esc_clk;
> +	unsigned long esc_div;
> +	u32 reg;
> +
> +	/* pll timer */
> +	dsim_write(dsim, DSIM_PLLTMR, pdata->pll_timer);
> +
> +	/* pll control */
> +	hs_clk = sec_dsim_set_pll(dsim);
> +	if (!hs_clk) {
> +		DRM_DEV_ERROR(dsim->dev, "failed to configure DSI PLL\n");
> +		return -EFAULT;
> +	}
> +
> +	byte_clk = hs_clk / 8;
> +	esc_div = DIV_ROUND_UP(byte_clk, dsim->esc_clk_hz);
> +	esc_clk = byte_clk / esc_div;
> +
> +	if (esc_clk > 20 * MHZ) {
> +		++esc_div;
> +		esc_clk = byte_clk / esc_div;
> +	}
> +
> +	DRM_DEV_DEBUG(dsim->dev,
> +		      "PLL: hs_clk = %lu, byte_clk = %lu, esc_clk = %lu, esc_div = %lu\n",
> +		      hs_clk, byte_clk, esc_clk, esc_div);
> +
> +	/* clk control */
> +	reg = dsim_read(dsim, DSIM_CLKCTRL);
> +
> +	reg |= CLKCTRL_TXREQUESTHSCLK;
> +	reg |= CLKCTRL_ESCCLKEN;
> +	reg &= ~CLKCTRL_PLLBYPASS;
> +	reg &= ~CLKCTRL_BYTECLKSRC_MASK;
> +	reg |= CLKCTRL_BYTECLKEN;
> +	reg &= ~CLKCTRL_LANEESCDATAEN_MASK;
> +	reg |= CLKCTRL_LANEESCDATAEN(BIT(dsim->lanes) - 1);
> +	reg |= CLKCTRL_LANEESCCLKEN;
> +	reg &= ~CLKCTRL_ESCPRESCALER_MASK;
> +	reg |= CLKCTRL_ESCPRESCALER(esc_div);
> +
> +	dsim_write(dsim, DSIM_CLKCTRL, reg);
> +
> +	return 0;
> +}
> +
> +static void sec_dsim_fifo_enable(struct sec_dsim *dsim, bool enable)
> +{
> +	u32 reg;
> +
> +	reg = dsim_read(dsim, DSIM_FIFOCTRL);
> +
> +	reg &= ~FIFOCTRL_INIT_MASK;
> +	dsim_write(dsim, DSIM_FIFOCTRL, reg);
> +	udelay(500);
> +
> +	if (!enable)
> +		return;
> +
> +	reg |= FIFOCTRL_NINITRX	|
> +	       FIFOCTRL_NINITSFR |
> +	       FIFOCTRL_NINITI80 |
> +	       FIFOCTRL_NINITSUB |
> +	       FIFOCTRL_NINITMAIN;
> +	dsim_write(dsim, DSIM_FIFOCTRL, reg);
> +	udelay(500);
> +}
> +
> +static void sec_dsim_set_display(struct sec_dsim *dsim, bool enable)
> +{
> +	u32 reg;
> +
> +	reg = dsim_read(dsim, DSIM_MDRESOL);
> +
> +	if (enable)
> +		reg |= MDRESOL_MAINSTANDBY;
> +	else
> +		reg &= ~MDRESOL_MAINSTANDBY;
> +	dsim_write(dsim, DSIM_MDRESOL, reg);
> +}
> +
> +static void sec_dsim_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct sec_dsim *dsim = bridge_to_dsim(bridge);
> +	int ret;
> +
> +	/* enable bridge clocks */
> +	clk_prepare_enable(dsim->clk_bus);
> +	clk_prepare_enable(dsim->clk_phy_ref);
> +
> +	/* initialize the irq */
> +	sec_dsim_irq_init(dsim);
> +
> +	/* configure the bridge */
> +	sec_dsim_config_bridge(dsim);
> +
> +	/* enable fifo control */
> +	sec_dsim_fifo_enable(dsim, true);
> +
> +	/* configure the display mode */
> +	sec_dsim_display_mode(dsim);
> +
> +	/* config dsim pll */
> +	ret = sec_dsim_enable_clock(dsim);
> +	if (ret) {
> +		DRM_DEV_ERROR(dsim->dev, "failed to enable clock: %d\n", ret);
> +		return;
> +	}
> +
> +	/* power on the dphy */
> +	ret = phy_init(dsim->phy);
> +	if (ret) {
> +		DRM_DEV_ERROR(dsim->dev, "failed to init phy %d\n", ret);
> +		return;
> +	}
> +
> +	/* power on the dphy */
> +	ret = phy_power_on(dsim->phy);
> +	if (ret) {
> +		DRM_DEV_ERROR(dsim->dev, "failed to enable phy %d\n", ret);
> +		return;
> +	}
> +
> +	/* enable data transfer */
> +	sec_dsim_set_display(dsim, true);
> +}
> +
> +static void sec_dsim_disable_clock(struct sec_dsim *dsim)
> +{
> +	u32 reg;
> +
> +	/* clk control */
> +	reg = dsim_read(dsim, DSIM_CLKCTRL);
> +
> +	reg &= ~CLKCTRL_TXREQUESTHSCLK;
> +	reg &= ~CLKCTRL_BYTECLKEN;
> +	reg &= ~CLKCTRL_ESCCLKEN;
> +	reg &= ~CLKCTRL_LANEESCDATAEN_MASK;
> +	reg &= ~CLKCTRL_LANEESCCLKEN;
> +	dsim_write(dsim, DSIM_CLKCTRL, reg);
> +
> +	/* pll control */
> +	reg  = dsim_read(dsim, DSIM_PLLCTRL);
> +
> +	reg &= ~PLLCTRL_PLLEN;
> +	dsim_write(dsim, DSIM_PLLCTRL, reg);
> +}
> +
> +static void sec_dsim_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct sec_dsim *dsim = bridge_to_dsim(bridge);
> +
> +	/* disable data transfer */
> +	sec_dsim_set_display(dsim, false);
> +
> +	/* disable bridge clocks */
> +	sec_dsim_disable_clock(dsim);
> +
> +	/* disable fifo control */
> +	sec_dsim_fifo_enable(dsim, false);
> +
> +	/* power off the phy */
> +	phy_power_off(dsim->phy);
> +
> +	/* exit the phy */
> +	phy_exit(dsim->phy);
> +
> +	/* disable bridge clock */
> +	clk_disable_unprepare(dsim->clk_phy_ref);
> +	clk_disable_unprepare(dsim->clk_bus);
> +}
> +
> +static bool sec_dsim_bridge_mode_fixup(struct drm_bridge *bridge,
> +				       const struct drm_display_mode *mode,
> +				       struct drm_display_mode *adjusted_mode)
> +{
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +
> +	return true;
> +}
> +
> +static void sec_dsim_bridge_mode_set(struct drm_bridge *bridge,
> +				     const struct drm_display_mode *mode,
> +				     const struct drm_display_mode *adjusted_mode)
> +{
> +	struct sec_dsim *dsim = bridge_to_dsim(bridge);
> +
> +	drm_mode_copy(&dsim->mode, adjusted_mode);
> +}
> +
> +static int sec_dsim_bridge_attach(struct drm_bridge *bridge,
> +				  enum drm_bridge_attach_flags flags)
> +{
> +	struct sec_dsim *dsim = bridge_to_dsim(bridge);
> +	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(dsim->dev->of_node, 1, 0, &panel,
> +					  &panel_bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		panel_bridge = drm_panel_bridge_add(panel);
> +		if (IS_ERR(panel_bridge))
> +			return PTR_ERR(panel_bridge);
> +	}
> +	dsim->panel_bridge = panel_bridge;
> +
> +	if (!dsim->panel_bridge)
> +		return -EPROBE_DEFER;
> +
> +	return drm_bridge_attach(bridge->encoder, dsim->panel_bridge, bridge,
> +				 flags);
> +}
> +
> +static void sec_dsim_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct sec_dsim *dsim = bridge_to_dsim(bridge);
> +
> +	drm_of_panel_bridge_remove(dsim->dev->of_node, 1, 0);
> +}
> +
> +static const struct drm_bridge_funcs sec_dsim_bridge_funcs = {
> +	.enable		= sec_dsim_bridge_enable,
> +	.disable	= sec_dsim_bridge_disable,
> +	.mode_set	= sec_dsim_bridge_mode_set,
> +	.mode_fixup	= sec_dsim_bridge_mode_fixup,
> +	.attach		= sec_dsim_bridge_attach,
> +	.detach		= sec_dsim_bridge_detach,
> +};
> +
> +static const struct drm_bridge_timings sec_dsim_bridge_timings = {
> +	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
> +};
> +
> +static const struct sec_dsim_plat_data imx8mm_mipi_dsim_plat_data = {
> +	.version		= 0x1060200,
> +	.pll_timer		= 500,
> +	.max_freq_hz		= 2100,
> +	.esc_stop_state_cnt	= 0xf,
> +};
> +
> +static const struct of_device_id sec_dsim_dt_ids[] = {
> +	{
> +		.compatible = "fsl,imx8mm-sec-dsim",
> +		.data = &imx8mm_mipi_dsim_plat_data,
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sec_dsim_dt_ids);
> +
> +static int sec_dsim_parse_dt(struct sec_dsim *dsim)
> +{
> +	struct platform_device *pdev = to_platform_device(dsim->dev);
> +	struct device *dev = dsim->dev;
> +	struct device_node *node = dev->of_node;
> +	struct clk *clk;
> +	void __iomem *base;
> +	u32 value;
> +	int irq;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	dsim->regmap = devm_regmap_init_mmio(dev, base, &sec_dsim_regmap_config);
> +	if (IS_ERR(dsim->regmap)) {
> +		ret = PTR_ERR(dsim->regmap);
> +		DRM_DEV_ERROR(dev, "failed to create sec dsim regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dsim->phy = devm_phy_get(dev, "dphy");
> +	if (IS_ERR(dsim->phy)) {
> +		DRM_DEV_ERROR(dev, "failed to get dsim phy\n");
> +		return PTR_ERR(dsim->phy);
> +	}
> +
> +	clk = devm_clk_get(dev, "bus");
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
> +		DRM_DEV_ERROR(dev, "failed to get bus clock: %d\n", ret);
> +		return ret;
> +	}
> +	dsim->clk_bus = clk;
> +
> +	clk = devm_clk_get(dev, "phy_ref");
> +	if (IS_ERR(clk)) {
> +		ret = PTR_ERR(clk);
> +		DRM_DEV_ERROR(dev, "failed to get phy_ref clock: %d\n", ret);
> +		return ret;
> +	}
> +	dsim->clk_phy_ref = clk;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return -ENODEV;
> +
> +	ret = devm_request_irq(dev, irq, sec_dsim_irq_handler, 0, dev_name(dev), dsim);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to request dsim irq: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!of_property_read_u32(node, "samsung,pll-clock-frequency", &value))
> +		dsim->pll_clk_hz = value;
> +
> +	if (!of_property_read_u32(node, "samsung,burst-clock-frequency", &value))
> +		dsim->burst_clk_hz = value;
> +
> +	if (!of_property_read_u32(node, "samsung,esc-clock-frequency", &value))
> +		dsim->esc_clk_hz = value;
> +
> +	init_completion(&dsim->pll_stable);
> +	init_completion(&dsim->ph_tx_done);
> +	init_completion(&dsim->pl_tx_done);
> +	init_completion(&dsim->rx_done);
> +
> +	return 0;
> +}
> +
> +static int sec_dsim_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *of_id;
> +	struct sec_dsim *dsim;
> +	int version;
> +	int ret;
> +
> +	dsim = devm_kzalloc(dev, sizeof(*dsim), GFP_KERNEL);
> +	if (!dsim) {
> +		DRM_DEV_ERROR(dev, "failed to allocate dsim\n");
> +		return -ENOMEM;
> +	}
> +
> +	of_id = of_match_device(sec_dsim_dt_ids, dev);
> +	if (!of_id)
> +		return -ENODEV;
> +
> +	dsim->pdata = of_id->data;
> +	dsim->dev = dev;
> +
> +	ret = sec_dsim_parse_dt(dsim);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to parse dt: %d\n", ret);
> +		return ret;
> +	}
> +
> +	version = dsim_read(dsim, DSIM_VERSION);
> +	WARN_ON(version != dsim->pdata->version);
> +	DRM_DEV_INFO(dev, "DSIM version number is %#x\n", version);
> +
> +	dsim->host.ops = &sec_dsim_host_ops;
> +	dsim->host.dev = dsim->dev;
> +
> +	ret = mipi_dsi_host_register(&dsim->host);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "failed to register mipi dsi host: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dsim->bridge.driver_private = dsim;
> +	dsim->bridge.funcs = &sec_dsim_bridge_funcs;
> +	dsim->bridge.of_node = dev->of_node;
> +	dsim->bridge.timings = &sec_dsim_bridge_timings;
> +
> +	dev_set_drvdata(dev, dsim);
> +
> +	drm_bridge_add(&dsim->bridge);
> +
> +	return 0;
> +}
> +
> +static int sec_dsim_remove(struct platform_device *pdev)
> +{
> +	struct sec_dsim *dsim = platform_get_drvdata(pdev);
> +
> +	mipi_dsi_host_unregister(&dsim->host);
> +	drm_bridge_remove(&dsim->bridge);
> +
> +	return 0;
> +}
> +
> +struct platform_driver sec_dsim_driver = {
> +	.probe    = sec_dsim_probe,
> +	.remove   = sec_dsim_remove,
> +	.driver   = {
> +		.name = DRIVER_NAME,
> +		.of_match_table = sec_dsim_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(sec_dsim_driver);
> +
> +MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
> +MODULE_DESCRIPTION("Samsung SEC MIPI DSIM Bridge driver");
> +MODULE_LICENSE("GPL v2");

-- 
Regards,

Laurent Pinchart
