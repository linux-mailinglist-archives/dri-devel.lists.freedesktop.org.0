Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE422E1B4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 19:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0023689C51;
	Sun, 26 Jul 2020 17:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C982489C51
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 17:44:35 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CA98B20023;
 Sun, 26 Jul 2020 19:44:31 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:44:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Swapnil Jakhade <sjakhade@cadence.com>
Subject: Re: [PATCH v7 2/3] drm: bridge: Add support for Cadence MHDP DPI/DP
 bridge
Message-ID: <20200726174430.GJ3275923@ravnborg.org>
References: <1595403640-12816-1-git-send-email-sjakhade@cadence.com>
 <1595403640-12816-3-git-send-email-sjakhade@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595403640-12816-3-git-send-email-sjakhade@cadence.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8 a=uP1ucDPQAAAA:8 a=Br2UW1UjAAAA:8
 a=e5mUnYsNAAAA:8 a=fnHYfZJ7WIar70gqmaYA:9 a=DnDaUv8BAQbvS0qD:21
 a=ElGWgGcPC7ia8ZzR:21 a=CjuIK1q_8ugA:10 a=aeg5Gbbo78KNqacMgKqU:22
 a=9a9ggB8z3XFZH39hjkD6:22 a=WmXOPjafLNExVIMTj843:22
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@siol.net, praneeth@ti.com,
 yamonkar@cadence.com, narmstrong@baylibre.com, airlied@linux.ie,
 tomi.valkeinen@ti.com, jonas@kwiboo.se, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 jsarha@ti.com, mparab@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Swapnil

Thanks for submitting this driver.

A few highlevel things.

New bridge drivers shall be prepare for use in a chained
bridge driver setup.
This prompts you to add the following:
- Reelvant bridge operations
	I noticed at least get_edid, and detect seems applicable.
- Support the flags argument and only create the connector if requested
  to do so.

Take a look at other bridge drivers that set DRM_BRIDGE_OP_EDID and
DRM_BRIDGE_OP_DETECT for examples.

A few notes follows but I did not look at the full driver.

	Sam

On Wed, Jul 22, 2020 at 09:40:39AM +0200, Swapnil Jakhade wrote:
> Add a new DRM bridge driver for Cadence MHDP DPTX IP used in TI J721e SoC.
> MHDP DPTX IP is the component that complies with VESA DisplayPort (DP) and
> embedded Display Port (eDP) standards. It integrates uCPU running the
> embedded Firmware (FW) interfaced over APB interface.
> 
> Basically, it takes a DPI stream as input and outputs it encoded in DP
> format. Currently, it supports only SST mode.
> 
> Co-developed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Co-developed-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Signed-off-by: Yuti Amonkar <yamonkar@cadence.com>
> Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig          |   11 +
>  drivers/gpu/drm/bridge/Makefile         |    2 +
>  drivers/gpu/drm/bridge/cdns-mhdp-core.c | 2493 +++++++++++++++++++++++
>  drivers/gpu/drm/bridge/cdns-mhdp-core.h |  396 ++++
>  4 files changed, 2902 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.c
>  create mode 100644 drivers/gpu/drm/bridge/cdns-mhdp-core.h
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 43271c21d3fc..6a4c324302a8 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -27,6 +27,17 @@ config DRM_CDNS_DSI
>  	  Support Cadence DPI to DSI bridge. This is an internal
>  	  bridge and is meant to be directly embedded in a SoC.
>  
> +config DRM_CDNS_MHDP
> +	tristate "Cadence DPI/DP bridge"
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	depends on OF
> +	help
> +	  Support Cadence DPI to DP bridge. This is an internal
> +	  bridge and is meant to be directly embedded in a SoC.
> +	  It takes a DPI stream as input and outputs it encoded
> +	  in DP format.
> +
>  config DRM_CHRONTEL_CH7033
>  	tristate "Chrontel CH7033 Video Encoder"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index d63d4b7e4347..0080a9f80f29 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,5 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> +obj-$(CONFIG_DRM_CDNS_MHDP) += cdns-mhdp.o
> +cdns-mhdp-objs := cdns-mhdp-core.o
As the bridge driver is a sinlge file there is no need for the extra
indirection.
If you plan to add extra files later use:
cdns-mhdp-y := cdns-mhdp-core.o

The "-y" syntax is recommended today.

>  obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>  obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> diff --git a/drivers/gpu/drm/bridge/cdns-mhdp-core.c b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> new file mode 100644
> index 000000000000..b16c5503cef1
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.c
> @@ -0,0 +1,2493 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cadence MHDP DP bridge driver.
> + *
> + * Copyright: 2019 Cadence Design Systems, Inc.
2020?

> + *
> + * Author: Quentin Schulz <quentin.schulz@free-electrons.com>
Does not match changelog description - several more authors are listed.


> +++ b/drivers/gpu/drm/bridge/cdns-mhdp-core.h
> @@ -0,0 +1,396 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Cadence MHDP DP bridge driver.
> + *
> + * Copyright: 2019 Cadence Design Systems, Inc.
> + *
> + * Author: Quentin Schulz <quentin.schulz@free-electrons.com>
> + *         Swapnil Jakhade <sjakhade@cadence.com>
> + */
> +
> +#ifndef CDNS_MHDP_CORE_H
> +#define CDNS_MHDP_CORE_H
> +
> +#include <linux/bits.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_dp_helper.h>
> +
> +struct clk;
> +struct device;
> +struct phy;
> +
> +/* Register offsets */
> +#define CDNS_APB_CTRL				0x00000
> +#define CDNS_CPU_STALL				BIT(3)
> +
> +#define CDNS_MAILBOX_FULL			0x00008
> +#define CDNS_MAILBOX_EMPTY			0x0000c
> +#define CDNS_MAILBOX_TX_DATA			0x00010
> +#define CDNS_MAILBOX_RX_DATA			0x00014
> +#define CDNS_KEEP_ALIVE				0x00018
> +#define CDNS_KEEP_ALIVE_MASK			GENMASK(7, 0)
> +
> +#define CDNS_VER_L				0x0001C
> +#define CDNS_VER_H				0x00020
> +#define CDNS_LIB_L_ADDR				0x00024
> +#define CDNS_LIB_H_ADDR				0x00028
> +
> +#define CDNS_MB_INT_MASK			0x00034
> +#define CDNS_MB_INT_STATUS			0x00038
> +
> +#define CDNS_SW_CLK_L				0x0003c
> +#define CDNS_SW_CLK_H				0x00040
> +
> +#define CDNS_SW_EVENT0				0x00044
> +#define CDNS_DPTX_HPD				BIT(0)
> +
> +#define CDNS_SW_EVENT1				0x00048
> +#define CDNS_SW_EVENT2				0x0004c
> +#define CDNS_SW_EVENT3				0x00050
> +
> +#define CDNS_APB_INT_MASK			0x0006C
> +#define CDNS_APB_INT_MASK_MAILBOX_INT		BIT(0)
> +#define CDNS_APB_INT_MASK_SW_EVENT_INT		BIT(1)
> +
> +#define CDNS_APB_INT_STATUS			0x00070
> +
> +#define CDNS_DPTX_CAR				0x00904
> +#define CDNS_VIF_CLK_EN				BIT(0)
> +#define CDNS_VIF_CLK_RSTN			BIT(1)
> +
> +#define CDNS_SOURCE_VIDEO_IF(s)			(0x00b00 + ((s) * 0x20))
> +#define CDNS_BND_HSYNC2VSYNC(s)			(CDNS_SOURCE_VIDEO_IF(s) + \
> +						 0x00)
> +#define CDNS_IP_DTCT_WIN			GENMASK(11, 0)
> +#define CDNS_IP_DET_INTERLACE_FORMAT		BIT(12)
> +#define CDNS_IP_BYPASS_V_INTERFACE		BIT(13)
> +
> +#define CDNS_HSYNC2VSYNC_POL_CTRL(s)		(CDNS_SOURCE_VIDEO_IF(s) + \
> +						 0x10)
> +#define CDNS_H2V_HSYNC_POL_ACTIVE_LOW		BIT(1)
> +#define CDNS_H2V_VSYNC_POL_ACTIVE_LOW		BIT(2)
> +
> +#define CDNS_DPTX_PHY_CONFIG			0x02000
> +#define CDNS_PHY_TRAINING_EN			BIT(0)
> +#define CDNS_PHY_TRAINING_TYPE(x)		(((x) & GENMASK(3, 0)) << 1)
> +#define CDNS_PHY_SCRAMBLER_BYPASS		BIT(5)
> +#define CDNS_PHY_ENCODER_BYPASS			BIT(6)
> +#define CDNS_PHY_SKEW_BYPASS			BIT(7)
> +#define CDNS_PHY_TRAINING_AUTO			BIT(8)
> +#define CDNS_PHY_LANE0_SKEW(x)			(((x) & GENMASK(2, 0)) << 9)
> +#define CDNS_PHY_LANE1_SKEW(x)			(((x) & GENMASK(2, 0)) << 12)
> +#define CDNS_PHY_LANE2_SKEW(x)			(((x) & GENMASK(2, 0)) << 15)
> +#define CDNS_PHY_LANE3_SKEW(x)			(((x) & GENMASK(2, 0)) << 18)
> +#define CDNS_PHY_COMMON_CONFIG			(CDNS_PHY_LANE1_SKEW(1) | \
> +						CDNS_PHY_LANE2_SKEW(2) |  \
> +						CDNS_PHY_LANE3_SKEW(3))
> +#define CDNS_PHY_10BIT_EN			BIT(21)
> +
> +#define CDNS_DP_FRAMER_GLOBAL_CONFIG		0x02200
> +#define CDNS_DP_NUM_LANES(x)			((x) - 1)
> +#define CDNS_DP_MST_EN				BIT(2)
> +#define CDNS_DP_FRAMER_EN			BIT(3)
> +#define CDNS_DP_RATE_GOVERNOR_EN		BIT(4)
> +#define CDNS_DP_NO_VIDEO_MODE			BIT(5)
> +#define CDNS_DP_DISABLE_PHY_RST			BIT(6)
> +#define CDNS_DP_WR_FAILING_EDGE_VSYNC		BIT(7)
> +
> +#define CDNS_DP_FRAMER_TU			0x02208
> +#define CDNS_DP_FRAMER_TU_SIZE(x)		(((x) & GENMASK(6, 0)) << 8)
> +#define CDNS_DP_FRAMER_TU_VS(x)			((x) & GENMASK(5, 0))
> +#define CDNS_DP_FRAMER_TU_CNT_RST_EN		BIT(15)
> +
> +#define CDNS_DP_MTPH_CONTROL			0x02264
> +#define CDNS_DP_MTPH_ECF_EN			BIT(0)
> +#define CDNS_DP_MTPH_ACT_EN			BIT(1)
> +#define CDNS_DP_MTPH_LVP_EN			BIT(2)
> +
> +#define CDNS_DP_MTPH_STATUS			0x0226C
> +#define CDNS_DP_MTPH_ACT_STATUS			BIT(0)
> +
> +#define CDNS_DP_LANE_EN				0x02300
> +#define CDNS_DP_LANE_EN_LANES(x)		GENMASK((x) - 1, 0)
> +
> +#define CDNS_DP_ENHNCD				0x02304
> +
> +#define CDNS_DPTX_STREAM(s)			(0x03000 + (s) * 0x80)
> +#define CDNS_DP_MSA_HORIZONTAL_0(s)		(CDNS_DPTX_STREAM(s) + 0x00)
> +#define CDNS_DP_MSAH0_H_TOTAL(x)		(x)
> +#define CDNS_DP_MSAH0_HSYNC_START(x)		((x) << 16)
> +
> +#define CDNS_DP_MSA_HORIZONTAL_1(s)		(CDNS_DPTX_STREAM(s) + 0x04)
> +#define CDNS_DP_MSAH1_HSYNC_WIDTH(x)		(x)
> +#define CDNS_DP_MSAH1_HSYNC_POL_LOW		BIT(15)
> +#define CDNS_DP_MSAH1_HDISP_WIDTH(x)		((x) << 16)
> +
> +#define CDNS_DP_MSA_VERTICAL_0(s)		(CDNS_DPTX_STREAM(s) + 0x08)
> +#define CDNS_DP_MSAV0_V_TOTAL(x)		(x)
> +#define CDNS_DP_MSAV0_VSYNC_START(x)		((x) << 16)
> +
> +#define CDNS_DP_MSA_VERTICAL_1(s)		(CDNS_DPTX_STREAM(s) + 0x0c)
> +#define CDNS_DP_MSAV1_VSYNC_WIDTH(x)		(x)
> +#define CDNS_DP_MSAV1_VSYNC_POL_LOW		BIT(15)
> +#define CDNS_DP_MSAV1_VDISP_WIDTH(x)		((x) << 16)
> +
> +#define CDNS_DP_MSA_MISC(s)			(CDNS_DPTX_STREAM(s) + 0x10)
> +#define CDNS_DP_STREAM_CONFIG(s)		(CDNS_DPTX_STREAM(s) + 0x14)
> +#define CDNS_DP_STREAM_CONFIG_2(s)		(CDNS_DPTX_STREAM(s) + 0x2c)
> +#define CDNS_DP_SC2_TU_VS_DIFF(x)		((x) << 8)
> +
> +#define CDNS_DP_HORIZONTAL(s)			(CDNS_DPTX_STREAM(s) + 0x30)
> +#define CDNS_DP_H_HSYNC_WIDTH(x)		(x)
> +#define CDNS_DP_H_H_TOTAL(x)			((x) << 16)
> +
> +#define CDNS_DP_VERTICAL_0(s)			(CDNS_DPTX_STREAM(s) + 0x34)
> +#define CDNS_DP_V0_VHEIGHT(x)			(x)
> +#define CDNS_DP_V0_VSTART(x)			((x) << 16)
> +
> +#define CDNS_DP_VERTICAL_1(s)			(CDNS_DPTX_STREAM(s) + 0x38)
> +#define CDNS_DP_V1_VTOTAL(x)			(x)
> +#define CDNS_DP_V1_VTOTAL_EVEN			BIT(16)
> +
> +#define CDNS_DP_MST_SLOT_ALLOCATE(s)		(CDNS_DPTX_STREAM(s) + 0x44)
> +#define CDNS_DP_S_ALLOC_START_SLOT(x)		(x)
> +#define CDNS_DP_S_ALLOC_END_SLOT(x)		((x) << 8)
> +
> +#define CDNS_DP_RATE_GOVERNING(s)		(CDNS_DPTX_STREAM(s) + 0x48)
> +#define CDNS_DP_RG_TARG_AV_SLOTS_Y(x)		(x)
> +#define CDNS_DP_RG_TARG_AV_SLOTS_X(x)		((x) << 4)
> +#define CDNS_DP_RG_ENABLE			BIT(10)
> +
> +#define CDNS_DP_FRAMER_PXL_REPR(s)		(CDNS_DPTX_STREAM(s) + 0x4c)
> +#define CDNS_DP_FRAMER_6_BPC			BIT(0)
> +#define CDNS_DP_FRAMER_8_BPC			BIT(1)
> +#define CDNS_DP_FRAMER_10_BPC			BIT(2)
> +#define CDNS_DP_FRAMER_12_BPC			BIT(3)
> +#define CDNS_DP_FRAMER_16_BPC			BIT(4)
> +#define CDNS_DP_FRAMER_PXL_FORMAT		0x8
> +#define CDNS_DP_FRAMER_RGB			BIT(0)
> +#define CDNS_DP_FRAMER_YCBCR444			BIT(1)
> +#define CDNS_DP_FRAMER_YCBCR422			BIT(2)
> +#define CDNS_DP_FRAMER_YCBCR420			BIT(3)
> +#define CDNS_DP_FRAMER_Y_ONLY			BIT(4)
> +
> +#define CDNS_DP_FRAMER_SP(s)			(CDNS_DPTX_STREAM(s) + 0x50)
> +#define CDNS_DP_FRAMER_VSYNC_POL_LOW		BIT(0)
> +#define CDNS_DP_FRAMER_HSYNC_POL_LOW		BIT(1)
> +#define CDNS_DP_FRAMER_INTERLACE		BIT(2)
> +
> +#define CDNS_DP_LINE_THRESH(s)			(CDNS_DPTX_STREAM(s) + 0x64)
> +#define CDNS_DP_ACTIVE_LINE_THRESH(x)		(x)
> +
> +#define CDNS_DP_VB_ID(s)			(CDNS_DPTX_STREAM(s) + 0x68)
> +#define CDNS_DP_VB_ID_INTERLACED		BIT(2)
> +#define CDNS_DP_VB_ID_COMPRESSED		BIT(6)
> +
> +#define CDNS_DP_FRONT_BACK_PORCH(s)		(CDNS_DPTX_STREAM(s) + 0x78)
> +#define CDNS_DP_BACK_PORCH(x)			(x)
> +#define CDNS_DP_FRONT_PORCH(x)			((x) << 16)
> +
> +#define CDNS_DP_BYTE_COUNT(s)			(CDNS_DPTX_STREAM(s) + 0x7c)
> +#define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
> +
> +/* mailbox */
> +#define MAILBOX_RETRY_US			1000
> +#define MAILBOX_TIMEOUT_US			2000000
> +
> +#define MB_OPCODE_ID				0
> +#define MB_MODULE_ID				1
> +#define MB_SIZE_MSB_ID				2
> +#define MB_SIZE_LSB_ID				3
> +#define MB_DATA_ID				4
> +
> +#define MB_MODULE_ID_DP_TX			0x01
> +#define MB_MODULE_ID_HDCP_TX			0x07
> +#define MB_MODULE_ID_HDCP_RX			0x08
> +#define MB_MODULE_ID_HDCP_GENERAL		0x09
> +#define MB_MODULE_ID_GENERAL			0x0a
> +
> +/* firmware and opcodes */
> +#define FW_NAME					"cadence/mhdp8546.bin"
> +#define CDNS_MHDP_IMEM				0x10000
> +
> +#define GENERAL_MAIN_CONTROL			0x01
> +#define GENERAL_TEST_ECHO			0x02
> +#define GENERAL_BUS_SETTINGS			0x03
> +#define GENERAL_TEST_ACCESS			0x04
> +#define GENERAL_REGISTER_READ			0x07
> +
> +#define DPTX_SET_POWER_MNG			0x00
> +#define DPTX_GET_EDID				0x02
> +#define DPTX_READ_DPCD				0x03
> +#define DPTX_WRITE_DPCD				0x04
> +#define DPTX_ENABLE_EVENT			0x05
> +#define DPTX_WRITE_REGISTER			0x06
> +#define DPTX_READ_REGISTER			0x07
> +#define DPTX_WRITE_FIELD			0x08
> +#define DPTX_READ_EVENT				0x0a
> +#define DPTX_GET_LAST_AUX_STAUS			0x0e
> +#define DPTX_HPD_STATE				0x11
> +#define DPTX_ADJUST_LT				0x12
> +
> +#define FW_STANDBY				0
> +#define FW_ACTIVE				1
> +
> +/* HPD */
> +#define DPTX_READ_EVENT_HPD_TO_HIGH             BIT(0)
> +#define DPTX_READ_EVENT_HPD_TO_LOW              BIT(1)
> +#define DPTX_READ_EVENT_HPD_PULSE               BIT(2)
> +#define DPTX_READ_EVENT_HPD_STATE               BIT(3)
> +
> +/* general */
> +#define CDNS_DP_TRAINING_PATTERN_4		0x7
> +
> +#define CDNS_KEEP_ALIVE_TIMEOUT			2000
> +
> +#define CDNS_VOLT_SWING(x)			((x) & GENMASK(1, 0))
> +#define CDNS_FORCE_VOLT_SWING			BIT(2)
> +
> +#define CDNS_PRE_EMPHASIS(x)			((x) & GENMASK(1, 0))
> +#define CDNS_FORCE_PRE_EMPHASIS			BIT(2)
> +
> +#define CDNS_SUPPORT_TPS(x)			BIT((x) - 1)
> +
> +#define CDNS_FAST_LINK_TRAINING			BIT(0)
> +
> +#define CDNS_LANE_MAPPING_TYPE_C_LANE_0(x)	((x) & GENMASK(1, 0))
> +#define CDNS_LANE_MAPPING_TYPE_C_LANE_1(x)	((x) & GENMASK(3, 2))
> +#define CDNS_LANE_MAPPING_TYPE_C_LANE_2(x)	((x) & GENMASK(5, 4))
> +#define CDNS_LANE_MAPPING_TYPE_C_LANE_3(x)	((x) & GENMASK(7, 6))
> +#define CDNS_LANE_MAPPING_NORMAL		0xe4
> +#define CDNS_LANE_MAPPING_FLIPPED		0x1b
> +
> +#define CDNS_DP_MAX_NUM_LANES			4
> +#define CDNS_DP_TEST_VSC_SDP			BIT(6) /* 1.3+ */
> +#define CDNS_DP_TEST_COLOR_FORMAT_RAW_Y_ONLY	BIT(7)
> +
> +#define CDNS_MHDP_MAX_STREAMS   4
> +
> +#define DP_LINK_CAP_ENHANCED_FRAMING BIT(0)
> +
> +struct cdns_mhdp_link {
> +	unsigned char revision;
> +	unsigned int rate;
> +	unsigned int num_lanes;
> +	unsigned long capabilities;
> +};
> +
> +struct cdns_mhdp_host {
> +	unsigned int link_rate;
> +	u8 lanes_cnt;
> +	u8 volt_swing;
> +	u8 pre_emphasis;
> +	u8 pattern_supp;
> +	u8 lane_mapping;
> +	bool fast_link;
> +	bool enhanced;
> +	bool scrambler;
> +	bool ssc;
> +};
> +
> +struct cdns_mhdp_sink {
> +	unsigned int link_rate;
> +	u8 lanes_cnt;
> +	u8 pattern_supp;
> +	bool fast_link;
> +	bool enhanced;
> +	bool ssc;
> +};
> +
> +struct cdns_mhdp_display_fmt {
> +	u32 color_format;
> +	u32 bpc;
> +	bool y_only;
> +};
> +
> +/*
> + * These enums present MHDP hw initialization state
> + * Legal state transitions are:
> + * MHDP_HW_INACTIVE <-> MHDP_HW_LOADING -> MHDP_HW_READY
> + *        |                                     |
> + *        '----------> MHDP_HW_STOPPED <--------'
> + */
> +enum mhdp_hw_state {
> +	MHDP_HW_INACTIVE = 0,	/* HW not initialized */
> +	MHDP_HW_LOADING,	/* HW initialization in progress */
> +	MHDP_HW_READY,		/* HW ready, FW active*/
> +	MHDP_HW_STOPPED		/* Driver removal FW to be stopped */
> +};
> +
> +struct cdns_mhdp_device;
> +
> +struct mhdp_platform_ops {
> +	int (*init)(struct cdns_mhdp_device *mhdp);
> +	void (*exit)(struct cdns_mhdp_device *mhdp);
> +	void (*enable)(struct cdns_mhdp_device *mhdp);
> +	void (*disable)(struct cdns_mhdp_device *mhdp);
> +};
> +
> +struct cdns_mhdp_bridge_state {
> +	struct drm_bridge_state base;
> +	u32 tu_size;
> +	u32 vs;
> +	u32 line_thresh;
> +	struct drm_display_mode *current_mode;
> +};
> +
> +#define to_cdns_mhdp_bridge_state(s) \
> +		container_of(s, struct cdns_mhdp_bridge_state, base)
> +
> +struct cdns_mhdp_device {
> +	void __iomem *regs;
> +
> +	struct device *dev;
> +	struct clk *clk;
> +	struct phy *phy;
> +
> +	const struct mhdp_platform_ops *ops;
> +
> +	/* This is to protect mailbox communications with the firmware */
> +	struct mutex mbox_mutex;
> +
> +	/* "link_mutex" protects the access to all the link parameters
> +	 * including the link training process. Link training will be
> +	 * invoked both from threaded interrupt handler and from atomic
> +	 * callbacks when link_up is not set. So this mutex protects
> +	 * flags such as link_up, bridge_enabled, link.num_lanes,
> +	 * link.rate etc.
> +	 */
> +	struct mutex link_mutex;
> +
> +	struct drm_connector connector;
> +	struct drm_bridge bridge;
> +
> +	struct cdns_mhdp_link link;
> +	struct drm_dp_aux aux;
> +
> +	struct cdns_mhdp_host host;
> +	struct cdns_mhdp_sink sink;
> +	struct cdns_mhdp_display_fmt display_fmt;
> +	s8 stream_id;
Wondering if s8 is correct here. Seems not to be used as such.
But then I did not look to close so it may make total sense.

> +
> +	bool link_up;
> +	bool plugged;
> +
> +	/*
> +	 * "start_lock" protects the access to bridge_attached and
> +	 * hw_state data members that control the delayed firmware
> +	 * loading and attaching the bridge. They are accessed from
> +	 * both the DRM core and cdns_mhdp_fw_cb(). In most cases just
> +	 * protecting the data members is enough, but the irq mask
> +	 * setting needs to be protected when enabling the FW.
> +	 */
> +	spinlock_t start_lock;
> +	bool bridge_attached;
> +	bool bridge_enabled;
> +	enum mhdp_hw_state hw_state;
> +};
> +
> +#define connector_to_mhdp(x) container_of(x, struct cdns_mhdp_device, connector)
> +#define bridge_to_mhdp(x) container_of(x, struct cdns_mhdp_device, bridge)
> +
> +#endif
> -- 
> 2.26.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
