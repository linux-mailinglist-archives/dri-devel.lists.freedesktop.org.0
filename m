Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF0213C8D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 17:30:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6221B6E2CD;
	Fri,  3 Jul 2020 15:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3096A6E2B4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 15:30:53 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 99B2D804EB;
 Fri,  3 Jul 2020 17:30:48 +0200 (CEST)
Date: Fri, 3 Jul 2020 17:30:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH v6 2/2] display/drm/bridge: TC358775 DSI/LVDS driver
Message-ID: <20200703153047.GE25632@ravnborg.org>
References: <20200702123651.12177-1-simhavcs@gmail.com>
 <20200702123651.12177-2-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702123651.12177-2-simhavcs@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7oS1v-cyAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=Al4JIggTemNk45MuRXQA:9 a=moc3yu7nTytRP_UK:21
 a=3Lyd_XhMslIUemCi:21 a=CjuIK1q_8ugA:10 a=PcM2qe9_4d1tJnOwuzRa:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vinay.

On Thu, Jul 02, 2020 at 06:06:34PM +0530, Vinay Simha BN wrote:
> This driver is tested with two panels individually with Apq8016-IFC6309 board
> https://www.inforcecomputing.com/products/single-board-computers-sbc/qualcomm-snapdragon-410-inforce-6309-micro-sbc
> 
> 1. 1366x768@60 auo,b101xtn01 data-mapping = "jeida-24"
> 2. 800x480@60 innolux,at070tn92 data-mapping = "vesa-24"
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
>  Initial version
> 
> v2:
> * Andrzej Hajda review comments incorporated
>   SPDX identifier
>   development debug removed
>   alphabetic order headers
>   u32 instead of unit32_t
>   magic numbers to macros for CLRSI and mux registers
>   ignored return value
> 
> * Laurent Pinchart review comments incorporated
>   mdelay to usleep_range
>   bus_formats added
> 
> v3:
> * Andrzej Hajda review comments incorporated
>   drm_connector_status removed
>   u32 rev removed and local variabl is used
>   regulator enable disable with proper orders and delays
>   as per the spec
>   devm_drm_panel_bridge_add method used instead of panel
>   description modified
>   dual port implemented
> 
> v4:
> * Sam Ravnborg review comments incorporated
>   panel->connector_type removed
> 
> * Reported-by: kernel test robot <lkp@intel.com>
>   parse_dt to static function
>   removed the if (endpoint), since data-lanes has to be
>   present for dsi dts ports
> 
> v5:
>   ~vsdelay dynamic value set based on the
>   calculation of dsi speed, output speed, blanking
> 
> v6:
> * Sam Ravnborg review comments incorporated
>   help modified
>   display_timings naming local variables
>   check for bus_formats unsupported
>   error handling enpoint data-lanes

There are some details that I missed in last review - see below.
Trivial stuff only, I do not have knowledge to review all of the
driver properly.

	Sam

> ---
>  drivers/gpu/drm/bridge/Kconfig    |  10 +
>  drivers/gpu/drm/bridge/Makefile   |   1 +
>  drivers/gpu/drm/bridge/tc358775.c | 766 ++++++++++++++++++++++++++++++
>  3 files changed, 777 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/tc358775.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c21d3fc..99abda4459ab 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -181,6 +181,16 @@ config DRM_TOSHIBA_TC358768
>  	help
>  	  Toshiba TC358768AXBG/TC358778XBG DSI bridge chip driver.
>  
> +config DRM_TOSHIBA_TC358775
> +        tristate "Toshiba TC358775 DSI/LVDS bridge"
> +        depends on OF
> +        select DRM_KMS_HELPER
> +        select REGMAP_I2C
> +        select DRM_PANEL
> +	select DRM_MIPI_DSI
> +        help
> +          Toshiba TC358775 DSI/LVDS bridge chip driver.
Use one tab for indent, not spaces.
Help text needs to have an indent of one tab + two spaces.

> +
>  config DRM_TI_TFP410
>  	tristate "TI TFP410 DVI/HDMI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index d63d4b7e4347..23c770b3bfe4 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358768) += tc358768.o
> +obj-$(CONFIG_DRM_TOSHIBA_TC358775) += tc358775.o
>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> new file mode 100644
> index 000000000000..88a05b9645e8
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -0,0 +1,766 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * tc358775 DSI to LVDS bridge driver
> + *
> + * Copyright (C) 2020 SMART Wireless Computing
> + * Author: Vinay Simha BN <simhavcs@gmail.com>
> + *
> + */
> +/* #define DEBUG */
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_dp_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#define FLD_MASK(start, end)    (((1 << ((start) - (end) + 1)) - 1) << (end))
> +#define FLD_VAL(val, start, end) (((val) << (end)) & FLD_MASK(start, end))
I did no dechiper the above, but it looks like an opencoded variant of GENMASK()
If it is so, then consider using GENMASK() as this is the official way
to do it. (linux/bits.h)
(Yes, I know FLD_* is used on other bridge drivers).


> +
> +/* Registers */
> +
> +/* DSI D-PHY Layer Registers */
> +#define D0W_DPHYCONTTX  0x0004  /* Data Lane 0 DPHY Tx Control */
> +#define CLW_DPHYCONTRX  0x0020  /* Clock Lane DPHY Rx Control */
> +#define D0W_DPHYCONTRX  0x0024  /* Data Lane 0 DPHY Rx Control */
> +#define D1W_DPHYCONTRX  0x0028  /* Data Lane 1 DPHY Rx Control */
> +#define D2W_DPHYCONTRX  0x002C  /* Data Lane 2 DPHY Rx Control */
> +#define D3W_DPHYCONTRX  0x0030  /* Data Lane 3 DPHY Rx Control */
> +#define COM_DPHYCONTRX  0x0038  /* DPHY Rx Common Control */
> +#define CLW_CNTRL       0x0040  /* Clock Lane Control */
> +#define D0W_CNTRL       0x0044  /* Data Lane 0 Control */
> +#define D1W_CNTRL       0x0048  /* Data Lane 1 Control */
> +#define D2W_CNTRL       0x004C  /* Data Lane 2 Control */
> +#define D3W_CNTRL       0x0050  /* Data Lane 3 Control */
> +#define DFTMODE_CNTRL   0x0054  /* DFT Mode Control */
> +
> +/* DSI PPI Layer Registers */
> +#define PPI_STARTPPI    0x0104  /* START control bit of PPI-TX function. */
> +#define PPI_START_FUNCTION      1
> +
> +#define PPI_BUSYPPI     0x0108
> +#define PPI_LINEINITCNT 0x0110  /* Line Initialization Wait Counter  */
> +#define PPI_LPTXTIMECNT 0x0114
> +#define PPI_LANEENABLE  0x0134  /* Enables each lane at the PPI layer. */
> +#define PPI_TX_RX_TA    0x013C  /* DSI Bus Turn Around timing parameters */
> +
> +/* Analog timer function enable */
> +#define PPI_CLS_ATMR    0x0140  /* Delay for Clock Lane in LPRX  */
> +#define PPI_D0S_ATMR    0x0144  /* Delay for Data Lane 0 in LPRX */
> +#define PPI_D1S_ATMR    0x0148  /* Delay for Data Lane 1 in LPRX */
> +#define PPI_D2S_ATMR    0x014C  /* Delay for Data Lane 2 in LPRX */
> +#define PPI_D3S_ATMR    0x0150  /* Delay for Data Lane 3 in LPRX */
> +
> +#define PPI_D0S_CLRSIPOCOUNT    0x0164  /* For lane 0 */
> +#define PPI_D1S_CLRSIPOCOUNT    0x0168  /* For lane 1 */
> +#define PPI_D2S_CLRSIPOCOUNT    0x016C  /* For lane 2 */
> +#define PPI_D3S_CLRSIPOCOUNT    0x0170  /* For lane 3 */
> +
> +#define CLS_PRE         0x0180  /* Digital Counter inside of PHY IO */
> +#define D0S_PRE         0x0184  /* Digital Counter inside of PHY IO */
> +#define D1S_PRE         0x0188  /* Digital Counter inside of PHY IO */
> +#define D2S_PRE         0x018C  /* Digital Counter inside of PHY IO */
> +#define D3S_PRE         0x0190  /* Digital Counter inside of PHY IO */
> +#define CLS_PREP        0x01A0  /* Digital Counter inside of PHY IO */
> +#define D0S_PREP        0x01A4  /* Digital Counter inside of PHY IO */
> +#define D1S_PREP        0x01A8  /* Digital Counter inside of PHY IO */
> +#define D2S_PREP        0x01AC  /* Digital Counter inside of PHY IO */
> +#define D3S_PREP        0x01B0  /* Digital Counter inside of PHY IO */
> +#define CLS_ZERO        0x01C0  /* Digital Counter inside of PHY IO */
> +#define D0S_ZERO        0x01C4  /* Digital Counter inside of PHY IO */
> +#define D1S_ZERO        0x01C8  /* Digital Counter inside of PHY IO */
> +#define D2S_ZERO        0x01CC  /* Digital Counter inside of PHY IO */
> +#define D3S_ZERO        0x01D0  /* Digital Counter inside of PHY IO */
> +
> +#define PPI_CLRFLG      0x01E0  /* PRE Counters has reached set values */
> +#define PPI_CLRSIPO     0x01E4  /* Clear SIPO values, Slave mode use only. */
> +#define HSTIMEOUT       0x01F0  /* HS Rx Time Out Counter */
> +#define HSTIMEOUTENABLE 0x01F4  /* Enable HS Rx Time Out Counter */
> +#define DSI_STARTDSI    0x0204  /* START control bit of DSI-TX function */
> +#define DSI_RX_START	1
> +
> +#define DSI_BUSYDSI     0x0208
> +#define DSI_LANEENABLE  0x0210  /* Enables each lane at the Protocol layer. */
> +#define DSI_LANESTATUS0 0x0214  /* Displays lane is in HS RX mode. */
> +#define DSI_LANESTATUS1 0x0218  /* Displays lane is in ULPS or STOP state */
> +
> +#define DSI_INTSTATUS   0x0220  /* Interrupt Status */
> +#define DSI_INTMASK     0x0224  /* Interrupt Mask */
> +#define DSI_INTCLR      0x0228  /* Interrupt Clear */
> +#define DSI_LPTXTO      0x0230  /* Low Power Tx Time Out Counter */
> +
> +#define DSIERRCNT       0x0300  /* DSI Error Count */
> +#define APLCTRL         0x0400  /* Application Layer Control */
> +#define RDPKTLN         0x0404  /* Command Read Packet Length */
> +
> +#define VPCTRL          0x0450  /* Video Path Control */
> +#define HTIM1           0x0454  /* Horizontal Timing Control 1 */
> +#define HTIM2           0x0458  /* Horizontal Timing Control 2 */
> +#define VTIM1           0x045C  /* Vertical Timing Control 1 */
> +#define VTIM2           0x0460  /* Vertical Timing Control 2 */
> +#define VFUEN           0x0464  /* Video Frame Timing Update Enable */
> +#define VFUEN_EN	BIT(0)  /* Upload Enable */
> +
> +/* Mux Input Select for LVDS LINK Input */
> +#define LV_MX0003        0x0480  /* Bit 0 to 3 */
> +#define LV_MX0407        0x0484  /* Bit 4 to 7 */
> +#define LV_MX0811        0x0488  /* Bit 8 to 11 */
> +#define LV_MX1215        0x048C  /* Bit 12 to 15 */
> +#define LV_MX1619        0x0490  /* Bit 16 to 19 */
> +#define LV_MX2023        0x0494  /* Bit 20 to 23 */
> +#define LV_MX2427        0x0498  /* Bit 24 to 27 */
> +#define LV_MX(b0, b1, b2, b3)	(FLD_VAL(b0, 4, 0) | FLD_VAL(b1, 12, 8) | \
> +				FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28, 24))
> +
> +/* Input bit numbers used in mux registers */
> +enum {
> +	LVI_R0,
> +	LVI_R1,
> +	LVI_R2,
> +	LVI_R3,
> +	LVI_R4,
> +	LVI_R5,
> +	LVI_R6,
> +	LVI_R7,
> +	LVI_G0,
> +	LVI_G1,
> +	LVI_G2,
> +	LVI_G3,
> +	LVI_G4,
> +	LVI_G5,
> +	LVI_G6,
> +	LVI_G7,
> +	LVI_B0,
> +	LVI_B1,
> +	LVI_B2,
> +	LVI_B3,
> +	LVI_B4,
> +	LVI_B5,
> +	LVI_B6,
> +	LVI_B7,
> +	LVI_HS,
> +	LVI_VS,
> +	LVI_DE,
> +	LVI_L0
> +};
> +
> +#define LVCFG           0x049C  /* LVDS Configuration  */
> +#define LVPHY0          0x04A0  /* LVDS PHY 0 */
> +#define LV_PHY0_RST(v)          FLD_VAL(v, 22, 22) /* PHY reset */
> +#define LV_PHY0_IS(v)           FLD_VAL(v, 15, 14)
> +#define LV_PHY0_ND(v)           FLD_VAL(v, 4, 0) /* Frequency range select */
> +#define LV_PHY0_PRBS_ON(v)      FLD_VAL(v, 20, 16) /* Clock/Data Flag pins */
> +
> +#define LVPHY1          0x04A4  /* LVDS PHY 1 */
> +#define SYSSTAT         0x0500  /* System Status  */
> +#define SYSRST          0x0504  /* System Reset  */
> +
> +#define SYS_RST_I2CS	BIT(0) /* Reset I2C-Slave controller */
> +#define SYS_RST_I2CM	BIT(1) /* Reset I2C-Master controller */
> +#define SYS_RST_LCD	BIT(2) /* Reset LCD controller */
> +#define SYS_RST_BM	BIT(3) /* Reset Bus Management controller */
> +#define SYS_RST_DSIRX	BIT(4) /* Reset DSI-RX and App controller */
> +#define SYS_RST_REG	BIT(5) /* Reset Register module */
> +
> +/* GPIO Registers */
> +#define GPIOC           0x0520  /* GPIO Control  */
> +#define GPIOO           0x0524  /* GPIO Output  */
> +#define GPIOI           0x0528  /* GPIO Input  */
> +
> +/* I2C Registers */
> +#define I2CTIMCTRL      0x0540  /* I2C IF Timing and Enable Control */
> +#define I2CMADDR        0x0544  /* I2C Master Addressing */
> +#define WDATAQ          0x0548  /* Write Data Queue */
> +#define RDATAQ          0x054C  /* Read Data Queue */
> +
> +/* Chip ID and Revision ID Register */
> +#define IDREG           0x0580
> +
> +#define LPX_PERIOD		4
> +#define TTA_GET			0x40000
> +#define TTA_SURE		6
> +
> +#define TC358775XBG_ID  0x00007500
> +
> +/* Debug Registers */
> +#define DEBUG00         0x05A0  /* Debug */
> +#define DEBUG01         0x05A4  /* LVDS Data */
> +
> +#define DSI_CLEN_BIT		BIT(0)
> +#define DIVIDE_BY_3		3 /* PCLK=DCLK/3 */
> +#define DIVIDE_BY_6		6 /* PCLK=DCLK/6 */
> +#define LVCFG_LVEN_BIT		BIT(0)
> +
> +#define L0EN BIT(1)
> +
> +#define TC358775_VPCTRL_VSDELAY__MASK	0x3FF00000
> +#define TC358775_VPCTRL_VSDELAY__SHIFT	20
> +static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
> +{
> +	return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
> +			TC358775_VPCTRL_VSDELAY__MASK;
> +}
> +
> +#define TC358775_VPCTRL_OPXLFMT__MASK	0x00000100
> +#define TC358775_VPCTRL_OPXLFMT__SHIFT	8
> +static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
> +{
> +	return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
> +			TC358775_VPCTRL_OPXLFMT__MASK;
> +}
> +
> +#define TC358775_VPCTRL_MSF__MASK	0x00000001
> +#define TC358775_VPCTRL_MSF__SHIFT	0
> +static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
> +{
> +	return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
> +			TC358775_VPCTRL_MSF__MASK;
> +}
> +
> +#define TC358775_LVCFG_PCLKDIV__MASK	0x000000f0
> +#define TC358775_LVCFG_PCLKDIV__SHIFT	4
> +static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
> +{
> +	return ((val) << TC358775_LVCFG_PCLKDIV__SHIFT) &
> +			TC358775_LVCFG_PCLKDIV__MASK;
> +}
> +
> +#define TC358775_LVCFG_LVDLINK__MASK                         0x00000002
> +#define TC358775_LVCFG_LVDLINK__SHIFT                        0
> +static inline u32 TC358775_LVCFG_LVDLINK(uint32_t val)
> +{
> +	return ((val) << TC358775_LVCFG_LVDLINK__SHIFT) &
> +			TC358775_LVCFG_LVDLINK__MASK;
> +}
> +
> +enum tc358775_ports {
> +	TC358775_DSI_IN,
> +	TC358775_LVDS_OUT0,
> +	TC358775_LVDS_OUT1,
> +};
> +
> +struct tc_data {
> +	struct i2c_client	*i2c;
> +	struct device		*dev;
> +
> +	struct drm_bridge	bridge;
> +	struct drm_bridge	*panel_bridge;
> +
> +	struct device_node *host_node;
> +	struct mipi_dsi_device *dsi;
> +	u8 num_dsi_lanes;
> +
> +	struct regulator	*vdd;
> +	struct regulator	*vddio;
> +	struct gpio_desc	*reset_gpio;
> +	struct gpio_desc	*stby_gpio;
> +	bool                    dual_link; /* single-link or dual-link */
> +};
> +
> +static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> +{
> +	return container_of(b, struct tc_data, bridge);
> +}
> +
> +static void tc_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	struct device *dev = &tc->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_enable(tc->vddio);
> +	if (ret < 0)
> +		dev_err(dev, "regulator vddio enable failed, %d\n", ret);
> +	usleep_range(10000, 11000);
> +
> +	ret = regulator_enable(tc->vdd);
> +	if (ret < 0)
> +		dev_err(dev, "regulator vdd enable failed, %d\n", ret);
> +	usleep_range(10000, 11000);
> +
> +	gpiod_set_value(tc->stby_gpio, 0);
> +	usleep_range(10000, 11000);
> +
> +	gpiod_set_value(tc->reset_gpio, 0);
> +	usleep_range(10, 20);
> +}
> +
> +static void tc_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	struct device *dev = &tc->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_disable(tc->vddio);
> +	if (ret < 0)
> +		dev_err(dev, "regulator vddio disable failed, %d\n", ret);
> +	usleep_range(10000, 11000);
> +
> +	ret = regulator_disable(tc->vdd);
> +	if (ret < 0)
> +		dev_err(dev, "regulator vdd disable failed, %d\n", ret);
> +	usleep_range(10000, 11000);
> +
> +	gpiod_set_value(tc->stby_gpio, 1);
> +	usleep_range(10000, 11000);
> +
> +	gpiod_set_value(tc->reset_gpio, 1);
> +	usleep_range(10, 20);
> +}
> +
> +static u32 d2l_read(struct i2c_client *i2c, u16 reg)
> +{
> +	int ret;
> +	u8 val[4];
> +	u8 addr[] = {(reg >> 8) & 0xff, reg & 0xff};
> +	u32 value;
> +
> +	ret = i2c_master_send(i2c, addr, sizeof(reg));
> +	if (ret < 0)
> +		goto fail;
> +
> +	ret = i2c_master_recv(i2c, val, sizeof(value));
> +	if (ret < 0)
> +		goto fail;
> +
> +	value = val[3] << 24 | val[2] << 16 | val[1] << 8 | val[0];
> +
> +	pr_debug("d2l: I2C : reg:%04x value:%08x\n", reg, value);
> +
> +	return value;
> +
> +fail:
> +	dev_err(&i2c->dev, "Error %d reading from subaddress 0x%x\n",
> +		ret, reg);
> +	return 0;
> +}
> +
> +static void d2l_write(struct i2c_client *i2c, u16 reg, u32 val)
> +{
> +	u8 buf[6];
> +	int ret;
> +
> +	buf[0] = reg >> 8;
> +	buf[1] = reg & 0xFF;
> +	buf[2] = (val >> 0) & 0xFF;
> +	buf[3] = (val >> 8) & 0xFF;
> +	buf[4] = (val >> 16) & 0xFF;
> +	buf[5] = (val >> 24) & 0xFF;
> +
> +	ret = i2c_master_send(i2c, buf, ARRAY_SIZE(buf));
> +	if (ret < 0)
> +		dev_err(&i2c->dev, "Error %d writing to subaddress 0x%x\n",
> +			ret, reg);
> +}
> +
> +/* helper function to access bus_formats */
> +static struct drm_connector *get_connector(struct drm_encoder *encoder)
> +{
> +	struct drm_device *dev = encoder->dev;
> +	struct drm_connector *connector;
> +
> +	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
> +		if (connector->encoder == encoder)
> +			return connector;
> +
> +	return NULL;
> +}
> +
> +static void tc_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
> +	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
> +	u32 val = 0, val_lvcfg = 0;
> +	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
> +	u8 link, bpc;
> +	u16 bus_formats;
> +	struct drm_display_mode *mode;
> +	struct drm_connector *connector = get_connector(bridge->encoder);
> +
> +	mode = &bridge->encoder->crtc->state->adjusted_mode;
> +
> +	hback_porch = mode->htotal - mode->hsync_end;
> +	hsync_len  = mode->hsync_end - mode->hsync_start;
> +	vback_porch = mode->vtotal - mode->vsync_end;
> +	vsync_len  = mode->vsync_end - mode->vsync_start;
> +
> +	htime1 = (hback_porch << 16) + hsync_len;
> +	vtime1 = (vback_porch << 16) + vsync_len;
> +
> +	hfront_porch = mode->hsync_start - mode->hdisplay;
> +	hactive = mode->hdisplay;
> +	vfront_porch = mode->vsync_start - mode->vdisplay;
> +	vactive = mode->vdisplay;
> +
> +	htime2 = (hfront_porch << 16) + hactive;
> +	vtime2 = (vfront_porch << 16) + vactive;
> +
> +	val = d2l_read(tc->i2c, IDREG);
> +
> +	dev_info(tc->dev, "DSI2LVDS Chip ID.%02x Revision ID. %02x **\n",
> +		 (val >> 8) & 0xFF, val & 0xFF);
> +
> +	d2l_write(tc->i2c, SYSRST, SYS_RST_REG | SYS_RST_DSIRX | SYS_RST_BM |
> +		  SYS_RST_LCD | SYS_RST_I2CM | SYS_RST_I2CS);
> +	usleep_range(30000, 40000);
> +
> +	d2l_write(tc->i2c, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> +	d2l_write(tc->i2c, PPI_LPTXTIMECNT, LPX_PERIOD);
> +	d2l_write(tc->i2c, PPI_D0S_CLRSIPOCOUNT, 3);
> +	d2l_write(tc->i2c, PPI_D1S_CLRSIPOCOUNT, 3);
> +	d2l_write(tc->i2c, PPI_D2S_CLRSIPOCOUNT, 3);
> +	d2l_write(tc->i2c, PPI_D3S_CLRSIPOCOUNT, 3);
> +
> +	val = ((L0EN << tc->num_dsi_lanes) - L0EN) | DSI_CLEN_BIT;
> +	d2l_write(tc->i2c, PPI_LANEENABLE, val);
> +	d2l_write(tc->i2c, DSI_LANEENABLE, val);
> +
> +	d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
> +	d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
> +
> +	val_lvcfg = LVCFG_LVEN_BIT;
> +	if (tc->dual_link) {
> +		link = 2;
> +		val_lvcfg |= TC358775_LVCFG_LVDLINK(1);
> +		val_lvcfg |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
> +	} else {
> +		link = 1;
> +		val_lvcfg |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
> +	}
> +
> +	bus_formats = connector->display_info.bus_formats[0];
> +
> +	switch (bus_formats) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		/* RGB888 */
> +		bpc = 8;
> +		val = TC358775_VPCTRL_OPXLFMT(1);
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		/* RGB666 */
> +		bpc = 6;
> +		val |= TC358775_VPCTRL_MSF(1);
I think "|=" is wrong here. val has a value related to lanes when we hit
this code.

> +		break;
> +	default:
> +		dev_warn(tc->dev,
> +			 "unsupported LVDS bus format 0x%04x, using JEIDA\n",
> +			bus_formats);
> +		break;
> +	}
> +
> +	dsiclk = mode->crtc_clock * 3 * bpc / tc->num_dsi_lanes / 1000;
if bus_formats hits default: then bpc is not assigned a proper value.


> +	clkdiv = dsiclk / DIVIDE_BY_3 * link;
> +	byteclk = dsiclk / 4;
> +	t1 = hactive * (bpc * 3 / 8) / tc->num_dsi_lanes;
> +	t2 = ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len + hfront_porch) / 1000;
> +	t3 = ((t2 * byteclk) / 100) - (hactive * (bpc * 3 / 8) /
> +		tc->num_dsi_lanes);
> +
> +	vsdelay = (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_len - hactive;
> +
> +	val |= TC358775_VPCTRL_VSDELAY(vsdelay);
> +	d2l_write(tc->i2c, VPCTRL, val);
> +
> +	d2l_write(tc->i2c, HTIM1, htime1);
> +	d2l_write(tc->i2c, VTIM1, vtime1);
> +	d2l_write(tc->i2c, HTIM2, htime2);
> +	d2l_write(tc->i2c, VTIM2, vtime2);
> +
> +	d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> +	d2l_write(tc->i2c, SYSRST, SYS_RST_LCD);
> +	d2l_write(tc->i2c, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
> +
> +	switch (bus_formats) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		/*
> +		 * Default hardware register settings of tc358775 configured
> +		 * with MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA jeida-24 format
> +		 */
> +		dev_dbg(tc->dev, "bus_formats JEIDA24: %04x\n", bus_formats);
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		/* VESA-24*/
> +		d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
> +		d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_R7, LVI_R5, LVI_G0));
> +		d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_G6, LVI_G7));
> +		d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));
> +		d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_B6, LVI_B7, LVI_B1, LVI_B2));
> +		d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));
> +		d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_R6));
> +		dev_dbg(tc->dev, "bus_formats VESA: %04x\n", bus_formats);
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		/* JEIDA-18*/
> +		d2l_write(tc->i2c, LV_MX0003, LV_MX(LVI_R0, LVI_R1, LVI_R2, LVI_R3));
> +		d2l_write(tc->i2c, LV_MX0407, LV_MX(LVI_R4, LVI_L0, LVI_R5, LVI_G0));
> +		d2l_write(tc->i2c, LV_MX0811, LV_MX(LVI_G1, LVI_G2, LVI_L0, LVI_L0));
> +		d2l_write(tc->i2c, LV_MX1215, LV_MX(LVI_G3, LVI_G4, LVI_G5, LVI_B0));
> +		d2l_write(tc->i2c, LV_MX1619, LV_MX(LVI_L0, LVI_L0, LVI_B1, LVI_B2));
> +		d2l_write(tc->i2c, LV_MX2023, LV_MX(LVI_B3, LVI_B4, LVI_B5, LVI_L0));
> +		d2l_write(tc->i2c, LV_MX2427, LV_MX(LVI_HS, LVI_VS, LVI_DE, LVI_L0));
> +		dev_dbg(tc->dev, "bus_formats JEIDA18: %04x\n", bus_formats);
> +		break;
> +	default:
> +		dev_warn(tc->dev,
> +			 "unsupported LVDS bus format 0x%04x\n", bus_formats);
A few lines up we told that JEIDA was used in case of unsupported bus
format.
Looks strange that we now say we cannot use it.

> +		break;
> +	}
> +
> +	d2l_write(tc->i2c, VFUEN, VFUEN_EN);
> +	d2l_write(tc->i2c, LVCFG, val_lvcfg);
> +}
> +
> +enum drm_mode_status
> +tc_mode_valid(struct drm_bridge *bridge,
> +	      const struct drm_display_info *info,
> +	      const struct drm_display_mode *mode)
This function is local and must be static

> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +
> +	/*
> +	 * Maximum pixel clock speed 135MHz for single-link
> +	 * 270MHz for dual-link
> +	 */
> +	if ((mode->clock > 135000 && tc->dual_link) ||
> +	    (mode->clock > 270000 && tc->dual_link))
> +		return MODE_CLOCK_HIGH;
This is not correct - should read:
> +	if ((mode->clock > 135000 && !tc->dual_link) ||
> +	    (mode->clock > 270000 && tc->dual_link))
> +		return MODE_CLOCK_HIGH;

If !tc->dual_link we only support <= 135000 kHz clock.



> +
> +	return MODE_OK;
> +}
> +
> +static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
> +{
> +	struct device_node *endpoint;
> +	struct device_node *parent;
> +	struct device_node *remote;
> +	struct property *prop;
> +	int len;
> +
> +	/*
> +	 * To get the data-lanes of dsi, we need to access the dsi0_out of port1
> +	 *  of dsi0 endpoint from bridge port0 of d2l_in
> +	 */
> +	endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
> +						 TC358775_DSI_IN, -1);
> +	if (endpoint) {
> +		/* dsi0_out node */
> +		parent = of_graph_get_remote_port_parent(endpoint);
> +		of_node_put(endpoint);
> +		if (parent) {
> +			/* dsi0 port 1 */
> +			endpoint = of_graph_get_endpoint_by_regs(parent, 1, -1);
> +			of_node_put(parent);
> +			if (endpoint) {
> +				prop = of_find_property(endpoint, "data-lanes",
> +							&len);
> +				of_node_put(endpoint);
> +				if (!prop) {
> +					dev_err(tc->dev,
> +						"failed to find data lane\n");
> +					return -EPROBE_DEFER;
> +				}
> +			}
> +		}
> +	}
> +
> +	tc->num_dsi_lanes = len / sizeof(u32);
I wonder why the compiler do tnot yell here.
But len is used uninitialized if any of the code above fails.

> +
> +	if (tc->num_dsi_lanes < 1 || tc->num_dsi_lanes > 4)
> +		return -EINVAL;
> +
> +	tc->host_node = of_graph_get_remote_node(np, 0, 0);
> +	if (!tc->host_node)
> +		return -ENODEV;
> +
> +	of_node_put(tc->host_node);
> +
> +	endpoint = of_graph_get_endpoint_by_regs(tc->dev->of_node,
> +						 TC358775_LVDS_OUT1, -1);
> +	if (endpoint) {
> +		remote = of_graph_get_remote_port_parent(endpoint);
> +		of_node_put(endpoint);
> +
> +		if (remote) {
> +			if (of_device_is_available(remote))
> +				tc->dual_link = true;
> +			of_node_put(remote);
> +		}
> +	}
> +
> +	dev_dbg(tc->dev, "no.of dsi lanes: %d\n", tc->num_dsi_lanes);
> +	dev_dbg(tc->dev, "operating in %s-link mode\n",
> +		tc->dual_link ? "dual" : "single");
> +
> +	return 0;
> +}
> +
> +static int tc_bridge_attach(struct drm_bridge *bridge,
> +			    enum drm_bridge_attach_flags flags)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	struct device *dev = &tc->i2c->dev;
> +	struct mipi_dsi_host *host;
> +	struct mipi_dsi_device *dsi;
> +	int ret;
> +
> +	const struct mipi_dsi_device_info info = { .type = "tc358775",
> +							.channel = 0,
> +							.node = NULL,
> +						};
> +
> +	host = of_find_mipi_dsi_host_by_node(tc->host_node);
> +	if (!host) {
> +		dev_err(dev, "failed to find dsi host\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	dsi = mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(dev, "failed to create dsi device\n");
> +		ret = PTR_ERR(dsi);
> +		goto err_dsi_device;
> +	}
> +
> +	tc->dsi = dsi;
> +
> +	dsi->lanes = tc->num_dsi_lanes;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to attach dsi to host\n");
> +		goto err_dsi_attach;
> +	}
> +
> +	/* Attach the panel-bridge to the dsi bridge */
> +	return drm_bridge_attach(bridge->encoder, tc->panel_bridge,
> +				 &tc->bridge, flags);
> +err_dsi_attach:
> +	mipi_dsi_device_unregister(dsi);
> +err_dsi_device:
> +	return ret;
> +}
> +
> +static const struct drm_bridge_funcs tc_bridge_funcs = {
> +	.attach = tc_bridge_attach,
> +	.pre_enable = tc_bridge_pre_enable,
> +	.enable = tc_bridge_enable,
> +	.mode_valid = tc_mode_valid,
> +	.post_disable = tc_bridge_post_disable,
> +};
> +
> +static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct drm_panel *panel;
> +	struct tc_data *tc;
> +	int ret;
> +
> +	tc = devm_kzalloc(dev, sizeof(*tc), GFP_KERNEL);
> +	if (!tc)
> +		return -ENOMEM;
> +
> +	tc->dev = dev;
> +	tc->i2c = client;
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, TC358775_LVDS_OUT0,
> +					  0, &panel, NULL);
> +	if (ret < 0)
> +		return ret;
> +	if (!panel)
> +		return -ENODEV;
> +
> +	tc->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(tc->panel_bridge))
> +		return PTR_ERR(tc->panel_bridge);
> +
> +	ret = tc358775_parse_dt(dev->of_node, tc);
> +	if (ret)
> +		return ret;
> +
> +	tc->vddio = devm_regulator_get(dev, "vddio-supply");
> +	if (IS_ERR(tc->vddio)) {
> +		ret = PTR_ERR(tc->vddio);
> +		dev_err(dev, "vddio-supply not found\n");
> +		return ret;
> +	}
> +
> +	tc->vdd = devm_regulator_get(dev, "vdd-supply");
> +	if (IS_ERR(tc->vdd)) {
> +		ret = PTR_ERR(tc->vddio);
> +		dev_err(dev, "vdd-supply not found\n");
> +		return ret;
> +	}
> +
> +	tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
> +	if (IS_ERR(tc->stby_gpio)) {
> +		ret = PTR_ERR(tc->stby_gpio);
> +		dev_err(dev, "cannot get stby-gpio %d\n", ret);
> +		return ret;
> +	}
> +
> +	tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(tc->reset_gpio)) {
> +		ret = PTR_ERR(tc->reset_gpio);
> +		dev_err(dev, "cannot get reset-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	tc->bridge.funcs = &tc_bridge_funcs;
> +	tc->bridge.of_node = dev->of_node;
> +	drm_bridge_add(&tc->bridge);
> +
> +	i2c_set_clientdata(client, tc);
> +
> +	return 0;
> +}
> +
> +static int tc_remove(struct i2c_client *client)
> +{
> +	struct tc_data *tc = i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&tc->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id tc358775_i2c_ids[] = {
> +	{ "tc358775", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
> +
> +static const struct of_device_id tc358775_of_ids[] = {
> +	{ .compatible = "toshiba,tc358775", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tc358775_of_ids);
> +
> +static struct i2c_driver tc358775_driver = {
> +	.driver = {
> +		.name = "tc358775",
> +		.of_match_table = tc358775_of_ids,
> +	},
> +	.id_table = tc358775_i2c_ids,
> +	.probe = tc_probe,
> +	.remove	= tc_remove,
> +};
> +module_i2c_driver(tc358775_driver);
> +
> +MODULE_AUTHOR("Vinay Simha BN <simhavcs@gmail.com>");
> +MODULE_DESCRIPTION("TC358775 DSI/LVDS bridge driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
