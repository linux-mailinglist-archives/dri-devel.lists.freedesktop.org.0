Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68749526304
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 15:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D7810F634;
	Fri, 13 May 2022 13:40:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3472510F634
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 13:40:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-5-213-nat.elisa-mobile.fi
 [85.76.5.213])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C52259D;
 Fri, 13 May 2022 15:40:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1652449210;
 bh=lv6L/pOhHLPQCk58WcgqTBM4Rn3VUMltq0pB9xYGVT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s2T5iuX+7ymAV2+DuV6/M0hwEs1CPNoWPVizw4sOsvH/zfbH5w1mw3SNS3g9oPwtH
 NWLS1YvLUru7jLjQ+ydPZ0lGndZvqjiHhdz68Yu+W+bBvaAayrqiYuDJ9tbBnaIF89
 a9dg604ADxLGCImGDYcL0E0twncHZznLzMegdAiQ=
Date: Fri, 13 May 2022 16:39:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
Subject: Re: [LINUX PATCH 2/2] drm: xlnx: dsi: driver for Xilinx DSI Tx
 subsystem
Message-ID: <Yn5fq/LJEXdyqcMJ@pendragon.ideasonboard.com>
References: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1652363593-45799-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652363593-45799-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
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
Cc: airlied@linux.ie, vgannava@xilinx.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi GVRao,

Thank you for the patch.

On Thu, May 12, 2022 at 07:23:13PM +0530, Venkateshwar Rao Gannavarapu wrote:
> The Xilinx MIPI DSI Tx Subsystem soft IP is used to display video
> data from AXI-4 stream interface.
> 
> It supports upto 4 lanes, optional register interface for the DPHY
> and multiple RGB color formats.
> This is a MIPI-DSI host driver and provides DSI bus for panels.
> This driver also helps to communicate with its panel using panel
> framework.
> 
> Signed-off-by: Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>
> ---
>  drivers/gpu/drm/xlnx/Kconfig    |  14 ++
>  drivers/gpu/drm/xlnx/Makefile   |   1 +
>  drivers/gpu/drm/xlnx/xlnx_dsi.c | 456 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 471 insertions(+)
>  create mode 100644 drivers/gpu/drm/xlnx/xlnx_dsi.c
> 
> diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
> index c3d0826..caa632b 100644
> --- a/drivers/gpu/drm/xlnx/Kconfig
> +++ b/drivers/gpu/drm/xlnx/Kconfig
> @@ -14,3 +14,17 @@ config DRM_ZYNQMP_DPSUB
>  	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
>  	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
>  	  subsystem.
> +
> +config DRM_XLNX_DSI
> +	tristate "Xilinx DRM DSI Subsystem Driver"

I'd add

	depends on ARCH_ZYNQMP || COMPILE_TEST

to avoid adding an unnecessary option on unrelated platforms.

> +	depends on DRM && OF
> +	select DRM_KMS_HELPER
> +	select DRM_MIPI_DSI
> +	select DRM_PANEL
> +	select BACKLIGHT_LCD_SUPPORT
> +	select BACKLIGHT_CLASS_DEVICE
> +	select DRM_PANEL_SIMPLE

Could you please sort these alphabetically ?

> +	help
> +	  DRM bridge driver for Xilinx programmable DSI subsystem controller.
> +	  choose this option if you hava a Xilinx MIPI-DSI Tx subsytem in
> +	  video pipeline.
> diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
> index 51c24b7..1e97fbe 100644
> --- a/drivers/gpu/drm/xlnx/Makefile
> +++ b/drivers/gpu/drm/xlnx/Makefile
> @@ -1,2 +1,3 @@
>  zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
>  obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
> +obj-$(CONFIG_DRM_XLNX_DSI) += xlnx_dsi.o
> diff --git a/drivers/gpu/drm/xlnx/xlnx_dsi.c b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> new file mode 100644
> index 0000000..a5291f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xlnx/xlnx_dsi.c
> @@ -0,0 +1,456 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *

You can drop this blank line.

> + * Xilinx FPGA MIPI DSI Tx Controller driver.
> + *
> + * Copyright (C) 2022 Xilinx, Inc.
> + *
> + * Author: Venkateshwar Rao G <vgannava@xilinx.com>
> + *

And this one too.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
> +/* DSI Tx IP registers */
> +#define XDSI_CCR			0x00
> +#define XDSI_CCR_COREENB		BIT(0)
> +#define XDSI_CCR_SOFTRST		BIT(1)
> +#define XDSI_CCR_CRREADY		BIT(2)
> +#define XDSI_CCR_CMDMODE		BIT(3)
> +#define XDSI_CCR_DFIFORST		BIT(4)
> +#define XDSI_CCR_CMDFIFORST		BIT(5)
> +#define XDSI_PCR			0x04
> +#define XDSI_PCR_LANES_MASK		3
> +#define XDSI_PCR_VIDEOMODE(x)		(((x) & 0x3) << 3)
> +#define XDSI_PCR_VIDEOMODE_MASK		(0x3 << 3)
> +#define XDSI_PCR_VIDEOMODE_SHIFT	3
> +#define XDSI_PCR_BLLPTYPE(x)		((x) << 5)
> +#define XDSI_PCR_BLLPMODE(x)		((x) << 6)
> +#define XDSI_PCR_PIXELFORMAT_MASK	(0x3 << 11)
> +#define XDSI_PCR_PIXELFORMAT_SHIFT	11
> +#define XDSI_PCR_EOTPENABLE(x)		((x) << 13)
> +#define XDSI_GIER			0x20
> +#define XDSI_ISR			0x24
> +#define XDSI_IER			0x28
> +#define XDSI_STR			0x2C
> +#define XDSI_STR_RDY_SHPKT		BIT(6)
> +#define XDSI_STR_RDY_LNGPKT		BIT(7)
> +#define XDSI_STR_DFIFO_FULL		BIT(8)
> +#define XDSI_STR_DFIFO_EMPTY		BIT(9)
> +#define XDSI_STR_WAITFR_DATA		BIT(10)
> +#define XDSI_STR_CMD_EXE_PGS		BIT(11)
> +#define XDSI_STR_CCMD_PROC		BIT(12)
> +#define XDSI_STR_LPKT_MASK		(0x5 << 7)
> +#define XDSI_CMD			0x30
> +#define XDSI_CMD_QUEUE_PACKET(x)	((x) & GENMASK(23, 0))
> +#define XDSI_DFR			0x34
> +#define XDSI_TIME1			0x50
> +#define XDSI_TIME1_BLLP_BURST(x)	((x) & GENMASK(15, 0))
> +#define XDSI_TIME1_HSA(x)		(((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_TIME2			0x54
> +#define XDSI_TIME2_VACT(x)		((x) & GENMASK(15, 0))
> +#define XDSI_TIME2_HACT(x)		(((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_HACT_MULTIPLIER		GENMASK(1, 0)
> +#define XDSI_TIME3			0x58
> +#define XDSI_TIME3_HFP(x)		((x) & GENMASK(15, 0))
> +#define XDSI_TIME3_HBP(x)		(((x) & GENMASK(15, 0)) << 16)
> +#define XDSI_TIME4			0x5c
> +#define XDSI_TIME4_VFP(x)		((x) & GENMASK(7, 0))
> +#define XDSI_TIME4_VBP(x)		(((x) & GENMASK(7, 0)) << 8)
> +#define XDSI_TIME4_VSA(x)		(((x) & GENMASK(7, 0)) << 16)
> +#define XDSI_NUM_DATA_T			4
> +
> +/**
> + * struct xlnx_dsi - Xilinx DSI-TX core
> + * @bridge: DRM bridge structure
> + * @dsi_host: DSI host device
> + * @panel_bridge: Panel bridge structure
> + * @panel:  DRM panel structure
> + * @dev: device structure
> + * @clks: clock source structure
> + * @iomem: Base address of DSI subsystem
> + * @mode_flags: DSI operation mode related flags
> + * @lanes: number of active data lanes supported by DSI controller
> + * @mul_factor: multiplication factor for HACT timing
> + * @format: pixel format for video mode of DSI controller
> + * @device_found: Flag to indicate device presence
> + */
> +struct xlnx_dsi {
> +	struct drm_bridge bridge;
> +	struct mipi_dsi_host dsi_host;
> +	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
> +	struct device *dev;
> +	struct clk_bulk_data *clks;
> +	void __iomem *iomem;
> +	unsigned long mode_flags;
> +	u32 lanes;
> +	u32 mul_factor;
> +	enum mipi_dsi_pixel_format format;
> +	bool device_found;
> +};
> +
> +static const struct clk_bulk_data xdsi_clks[] = {
> +	{ .id = "s_axis_aclk" },
> +	{ .id = "dphy_clk_200M" },
> +};
> +
> +static inline struct xlnx_dsi *host_to_dsi(struct mipi_dsi_host *host)
> +{
> +	return container_of(host, struct xlnx_dsi, dsi_host);
> +}
> +
> +static inline struct xlnx_dsi *bridge_to_dsi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct xlnx_dsi, bridge);
> +}
> +
> +static inline void xlnx_dsi_writel(void __iomem *base, int offset, u32 val)

I'd padd the xlnx_dsi pointer instead of the base pointer to the read
and write functions. I would also rename this to xlnx_dsi_write() (and
same for read).

> +{
> +	writel(val, base + offset);
> +}
> +
> +static inline u32 xlnx_dsi_readl(void __iomem *base, int offset)
> +{
> +	return readl(base + offset);
> +}
> +
> +static int xlnx_dsi_panel_or_bridge(struct xlnx_dsi *dsi,
> +				    struct device_node *node)
> +{
> +	struct drm_bridge *panel_bridge;
> +	struct drm_panel *panel;
> +	struct device *dev = dsi->dev;
> +	struct device_node *endpoint = dev->of_node;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(endpoint, 1, 0, &panel, &panel_bridge);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "failed to find panel / bridge\n");
> +		return ret;
> +	}
> +
> +	if (panel) {
> +		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(panel_bridge))
> +			return PTR_ERR(panel_bridge);
> +		dsi->panel = panel;
> +	}
> +
> +	dsi->panel_bridge = panel_bridge;
> +
> +	if (!dsi->panel_bridge) {
> +		dev_err(dsi->dev, "panel not found\n");
> +		return -EPROBE_DEFER;
> +	}

Can this happen ?

> +
> +	return 0;
> +}
> +
> +static int xlnx_dsi_host_attach(struct mipi_dsi_host *host,
> +				struct mipi_dsi_device *device)
> +{
> +	struct xlnx_dsi *dsi = host_to_dsi(host);
> +	u32 reg;
> +
> +	reg = xlnx_dsi_readl(dsi->iomem, XDSI_PCR);
> +	dsi->lanes = reg & XDSI_PCR_LANES_MASK;
> +	dsi->format = (reg & XDSI_PCR_PIXELFORMAT_MASK) >>
> +		XDSI_PCR_PIXELFORMAT_SHIFT;
> +	dsi->mode_flags = device->mode_flags;
> +
> +	if (dsi->lanes != device->lanes) {
> +		dev_err(dsi->dev, "Mismatch of lanes. panel = %d, DSI = %d\n",
> +			device->lanes, dsi->lanes);
> +		return -EINVAL;
> +	}
> +
> +	if (dsi->lanes > 4 || dsi->lanes < 1) {
> +		dev_err(dsi->dev, "%d lanes : invalid xlnx,dsi-num-lanes\n",

The driver doesn't use this DT property.

Could the number of lanes be read and validated at probe time ? The
format could also be read at probe time.

> +			dsi->lanes);
> +		return -EINVAL;
> +	}
> +
> +	if (dsi->format != device->format) {
> +		dev_err(dsi->dev, "Mismatch of format. panel = %d, DSI = %d\n",
> +			device->format, dsi->format);
> +		return -EINVAL;
> +	}

The usual pattern is to call drm_bridge_add() here (and
drm_bridge_remove() in the DSI detach function).

> +
> +	return 0;
> +}
> +
> +static int xlnx_dsi_host_detach(struct mipi_dsi_host *host,
> +				struct mipi_dsi_device *device)
> +{
> +	struct xlnx_dsi *dsi = host_to_dsi(host);
> +
> +	if (dsi->panel) {
> +		drm_panel_disable(dsi->panel);
> +		dsi->panel = NULL;
> +	}

This isn't needed, the panel is handled through a panel bridge which
will take care of disabling the panel.

> +
> +	return 0;
> +}
> +
> +static const struct mipi_dsi_host_ops xlnx_dsi_ops = {
> +	.attach = xlnx_dsi_host_attach,
> +	.detach	= xlnx_dsi_host_detach,
> +};
> +
> +static void
> +xlnx_dsi_bridge_disable(struct drm_bridge *bridge,
> +			struct drm_bridge_state *old_bridge_state)
> +{
> +	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
> +	u32 reg = xlnx_dsi_readl(dsi->iomem, XDSI_CCR);
> +
> +	reg &= ~XDSI_CCR_COREENB;
> +	xlnx_dsi_writel(dsi->iomem, XDSI_CCR, reg);
> +	dev_dbg(dsi->dev, "DSI-Tx is disabled\n");

I'd drop the message, I don't think it's very useful. Same in
xlnx_dsi_bridge_enable().

> +}

Let's move this function after xlnx_dsi_bridge_enable() to match the
order in drm_bridge_funcs.

> +
> +static void
> +xlnx_dsi_bridge_mode_set(struct drm_bridge *bridge,
> +			 const struct drm_display_mode *mode,
> +			 const struct drm_display_mode *adjusted_mode)
> +{
> +	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
> +	u32 reg, video_mode;
> +
> +	reg = xlnx_dsi_readl(dsi->iomem, XDSI_PCR);
> +	video_mode = (reg & XDSI_PCR_VIDEOMODE_MASK) >> XDSI_PCR_VIDEOMODE_SHIFT;
> +
> +	if (!video_mode && (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)) {
> +		reg = XDSI_TIME1_HSA(adjusted_mode->hsync_end -
> +				     adjusted_mode->hsync_start);
> +		xlnx_dsi_writel(dsi->iomem, XDSI_TIME1, reg);
> +	}
> +
> +	reg = XDSI_TIME4_VFP(adjusted_mode->vsync_start -
> +			     adjusted_mode->vdisplay) |
> +		XDSI_TIME4_VBP(adjusted_mode->vtotal -
> +			       adjusted_mode->vsync_end) |
> +		XDSI_TIME4_VSA(adjusted_mode->vsync_end -
> +			       adjusted_mode->vsync_start);
> +	xlnx_dsi_writel(dsi->iomem, XDSI_TIME4, reg);
> +
> +	reg = XDSI_TIME3_HFP(adjusted_mode->hsync_start -
> +			     adjusted_mode->hdisplay) |
> +		XDSI_TIME3_HBP(adjusted_mode->htotal -
> +			       adjusted_mode->hsync_end);
> +	xlnx_dsi_writel(dsi->iomem, XDSI_TIME3, reg);
> +	dev_dbg(dsi->dev, "mul factor for parsed datatype is = %d\n",
> +		(dsi->mul_factor) / 100);

This is already printed in xlnx_dsi_parse_dt(), no need to repeat it
here.

> +
> +	if ((adjusted_mode->hdisplay & XDSI_HACT_MULTIPLIER) != 0)
> +		dev_warn(dsi->dev, "Incorrect HACT will be programmed\n");
> +
> +	reg = XDSI_TIME2_HACT((adjusted_mode->hdisplay) * (dsi->mul_factor) / 100) |

No need for the inner parentheses.

> +		XDSI_TIME2_VACT(adjusted_mode->vdisplay);
> +
> +	xlnx_dsi_writel(dsi->iomem, XDSI_PCR, XDSI_PCR_VIDEOMODE(BIT(0)));
> +}
> +
> +static void xlnx_dsi_bridge_enable(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *old_bridge_state)
> +{
> +	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
> +	u32 reg;
> +
> +	reg = xlnx_dsi_readl(dsi->iomem, XDSI_CCR);
> +	reg |= XDSI_CCR_COREENB;
> +	xlnx_dsi_writel(dsi->iomem, XDSI_CCR, reg);
> +	dev_dbg(dsi->dev, "MIPI DSI Tx controller is enabled.\n");
> +}
> +
> +static int xlnx_dsi_bridge_attach(struct drm_bridge *bridge,
> +				  enum drm_bridge_attach_flags flags)
> +{
> +	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	if (!bridge->encoder) {

Can this ever happen ?

> +		DRM_ERROR("Parent encoder object not found\n");
> +		return -ENODEV;
> +	}
> +
> +	/* Set the encoder type as caller does not know it */
> +	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;

I think you can skip this. The encoder type shouldn't be used by
userspace, it should be fine to leave it set to DRM_MODE_ENCODER_NONE.
If setting the type was required, it should be done by the
drm_bridge_connector helper, not by this driver.

> +
> +	if (!dsi->device_found) {
> +		int ret;
> +
> +		ret = xlnx_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
> +		if (ret) {
> +			dev_err(dsi->dev, "dsi_panel_or_bridge failed\n");
> +			return ret;
> +		}
> +
> +		dsi->device_found = true;
> +	}

I'd move this to the DSI attach function. See cdns-dsi.c for an example.

> +
> +	/* Attach the panel-bridge to the dsi bridge */
> +	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
> +				 flags);
> +}
> +
> +static void xlnx_dsi_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct xlnx_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
> +}
> +
> +static const struct drm_bridge_funcs xlnx_dsi_bridge_funcs = {
> +	.mode_set	= xlnx_dsi_bridge_mode_set,
> +	.atomic_enable	= xlnx_dsi_bridge_enable,
> +	.atomic_disable	= xlnx_dsi_bridge_disable,
> +	.attach		= xlnx_dsi_bridge_attach,
> +	.detach		= xlnx_dsi_bridge_detach,
> +};
> +
> +static int xlnx_dsi_parse_dt(struct xlnx_dsi *dsi)
> +{
> +	struct device *dev = dsi->dev;
> +	struct device_node *node = dev->of_node;

	struct device_node *node = dsi->dev->of_node;

> +	int ret;
> +	u32 datatype;
> +	static const int xdsi_mul_fact[XDSI_NUM_DATA_T] = {300, 225, 225, 200};

Please move the static variables first.

> +
> +	/*
> +	 * Used as a multiplication factor for HACT based on used
> +	 * DSI data type.
> +	 *
> +	 * e.g. for RGB666_L datatype and 1920x1080 resolution,
> +	 * the Hact (WC) would be as follows -
> +	 * 1920 pixels * 18 bits per pixel / 8 bits per byte
> +	 * = 1920 pixels * 2.25 bytes per pixel = 4320 bytes.
> +	 *
> +	 * Data Type - Multiplication factor
> +	 * RGB888    - 3
> +	 * RGB666_L  - 2.25
> +-	 * RGB666_P  - 2.25
> +	 * RGB565    - 2
> +	 *
> +	 * Since the multiplication factor is a floating number,
> +	 * a 100x multiplication factor is used.
> +	 */
> +	ret = of_property_read_u32(node, "xlnx,dsi-data-type", &datatype);

This property needs to be documented in the bindings.

> +	if (ret < 0) {
> +		dev_err(dsi->dev, "missing xlnx,dsi-data-type property\n");
> +		return ret;
> +	}
> +	dsi->format = datatype;
> +	if (datatype > MIPI_DSI_FMT_RGB565) {
> +		dev_err(dsi->dev, "Invalid xlnx,dsi-data-type string\n");

It's not a string.

> +		return -EINVAL;
> +	}
> +	dsi->mul_factor = xdsi_mul_fact[datatype];
> +
> +	dev_dbg(dsi->dev, "DSI controller num lanes = %d", dsi->lanes);

dsi->lanes isn't set yet here, you can drop this message.

> +	dev_dbg(dsi->dev, "DSI controller datatype = %d\n", datatype);
> +
> +	return 0;
> +}
> +
> +static int xlnx_dsi_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	struct xlnx_dsi *dsi;
> +	int num_clks = ARRAY_SIZE(xdsi_clks);
> +	int ret;
> +
> +	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!dsi)
> +		return -ENOMEM;
> +
> +	dsi->dev = dev;
> +	dsi->clks = devm_kmemdup(dev, xdsi_clks, sizeof(xdsi_clks),
> +				 GFP_KERNEL);
> +	if (!dsi->clks)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	dsi->iomem = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(dsi->iomem))
> +		return PTR_ERR(dsi->iomem);
> +
> +	ret = clk_bulk_get(dev, num_clks, dsi->clks);

You can use devm_clk_bulk_get() and drop the clk_bulk_put() calls.

> +	if (ret)
> +		return ret;
> +
> +	ret = xlnx_dsi_parse_dt(dsi);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(num_clks, dsi->clks);

As this will become the only use of num_clks, I'd write

	ret = clk_bulk_prepare_enable(ARRAY_SIZE(xdsi_clks), dsi->clks);

and drop the local variable. Same in remove().

Actually, shouldn't the driver implement runtime PM suspand and resume
handlers, and enable/disable clocks there ?

> +	if (ret)
> +		goto err_clk_put;
> +
> +	platform_set_drvdata(pdev, dsi);
> +	dsi->dsi_host.ops = &xlnx_dsi_ops;
> +	dsi->dsi_host.dev = dev;
> +
> +	ret = mipi_dsi_host_register(&dsi->dsi_host);
> +	if (ret) {
> +		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
> +		goto err_clk_put;
> +	}
> +
> +	dsi->bridge.driver_private = dsi;
> +	dsi->bridge.funcs = &xlnx_dsi_bridge_funcs;
> +#ifdef CONFIG_OF

You depend on OF, so this isn't needed.

> +	dsi->bridge.of_node = pdev->dev.of_node;
> +#endif
> +
> +	drm_bridge_add(&dsi->bridge);
> +
> +err_clk_put:
> +	clk_bulk_put(num_clks, dsi->clks);
> +
> +	return ret;
> +}
> +
> +static int xlnx_dsi_remove(struct platform_device *pdev)
> +{
> +	struct xlnx_dsi *dsi = platform_get_drvdata(pdev);
> +	int num_clks = ARRAY_SIZE(xdsi_clks);
> +
> +	mipi_dsi_host_unregister(&dsi->dsi_host);
> +	clk_bulk_disable_unprepare(num_clks, dsi->clks);
> +	clk_bulk_put(num_clks, dsi->clks);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id xlnx_dsi_of_match[] = {
> +	{ .compatible = "xlnx,dsi-tx-v2.0"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, xlnx_dsi_of_match);
> +
> +static struct platform_driver dsi_driver = {
> +	.probe = xlnx_dsi_probe,
> +	.remove = xlnx_dsi_remove,
> +	.driver = {
> +		.name = "xlnx-dsi",
> +		.of_match_table = xlnx_dsi_of_match,
> +	},
> +};
> +
> +module_platform_driver(dsi_driver);
> +
> +MODULE_AUTHOR("Venkateshwar Rao G <vgannava@xilinx.com>");
> +MODULE_DESCRIPTION("Xilinx MIPI DSI host controller driver");
> +MODULE_LICENSE("GPL");

-- 
Regards,

Laurent Pinchart
