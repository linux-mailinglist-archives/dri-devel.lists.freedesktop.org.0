Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F83C50BFC9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 20:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCAB10E538;
	Fri, 22 Apr 2022 18:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DF410E538
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4q/2WkpUALRgQ3kt2SLSGla8D5hYxXk/C8KQ9uA7WEM=;
 b=DcA4SuXj9TuiCPrBSVmeMocwAFqB8rJlG8IidRxmdugANYvhorOt83ozMJlf4Y9XbtAACCXL5sd0j
 LiQ3DR6I+QyWGuUJRC3uIUheLPMLZK9qOQUddD3VB2/G6CSFiCN0+wlSfCGcDPuDcH6H8ir1RO8tKo
 fhn2rHfYWDHz9QBfCv8EUon+bgse3IJ1dZdo1Xkj/tlwLutRilmfoNhRdorrwqKNoUBJ6BFcpWd0sN
 6JWv1NDUBGjHXTEsjegBA/GlQCKu/94+9TFBoCuOIv7Y1VXlu0mtSm3g4XGN2jecB3UH1xfCBuvh+w
 9b3D95QZMAxWUCZSkMUHdeiiLiIPlPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4q/2WkpUALRgQ3kt2SLSGla8D5hYxXk/C8KQ9uA7WEM=;
 b=WRhRsUrScOFzgw2wys0TVME01VHDkG9GcON0KlTMB4eir9iPSsxexK7knBE1VA/WFqDFHweSogXy1
 0+rUwn6Cg==
X-HalOne-Cookie: e85e2260c52221cb72c2b4e8063819d38c535aff
X-HalOne-ID: c669eeb3-c26a-11ec-a906-d0431ea8a290
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c669eeb3-c26a-11ec-a906-d0431ea8a290;
 Fri, 22 Apr 2022 18:33:59 +0000 (UTC)
Date: Fri, 22 Apr 2022 20:33:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 2/2] drm: bridge: ldb: Implement simple NXP i.MX8M LDB
 bridge
Message-ID: <YmL1FZBjm1/GQ5kD@ravnborg.org>
References: <20220418145105.76986-1-marex@denx.de>
 <20220418145105.76986-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418145105.76986-2-marex@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Mon, Apr 18, 2022 at 04:51:05PM +0200, Marek Vasut wrote:
> The i.MX8MP contains two syscon registers which are responsible
> for configuring the on-SoC DPI-to-LVDS serializer. Implement a
> simple bridge driver for this serializer.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Good to see a bridge driver that stays away from the deprecated stuff,
and it looks nice a clean. I like how disable is the exact opposite of
enable.

A few comments in the following - with the Kconfig text updated:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

> --
> V2: - Rename syscon to fsl,syscon
> ---
>  drivers/gpu/drm/bridge/Kconfig   |   8 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/nxp-ldb.c | 343 +++++++++++++++++++++++++++++++
>  3 files changed, 352 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/nxp-ldb.c
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 20f9bc7f4be54..7fe7088a2bef5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -185,6 +185,14 @@ config DRM_NWL_MIPI_DSI
>  	  This enables the Northwest Logic MIPI DSI Host controller as
>  	  for example found on NXP's i.MX8 Processors.
>  
> +config DRM_NXP_LDB
> +	tristate "NXP i.MX8M LDB bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Support for i.MX8M DPI-to-LVDS on-SoC encoder.
As commented in the bindings patch - is this i.MX8M or i.MX8MP?

> +
>  config DRM_NXP_PTN3460
>  	tristate "NXP PTN3460 DP/LVDS bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index bdffad2a7ed3a..f800b2331d9e0 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
>  obj-$(CONFIG_DRM_LONTIUM_LT9611UXC) += lontium-lt9611uxc.o
>  obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> +obj-$(CONFIG_DRM_NXP_LDB) += nxp-ldb.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o
>  obj-$(CONFIG_DRM_PARADE_PS8640) += parade-ps8640.o
> diff --git a/drivers/gpu/drm/bridge/nxp-ldb.c b/drivers/gpu/drm/bridge/nxp-ldb.c
> new file mode 100644
> index 0000000000000..7b8de235876ea
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/nxp-ldb.c
> @@ -0,0 +1,343 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +
> +#define LDB_CTRL				0x5c
> +#define LDB_CTRL_CH0_ENABLE			BIT(0)
> +#define LDB_CTRL_CH0_DI_SELECT			BIT(1)
> +#define LDB_CTRL_CH1_ENABLE			BIT(2)
> +#define LDB_CTRL_CH1_DI_SELECT			BIT(3)
> +#define LDB_CTRL_SPLIT_MODE			BIT(4)
> +#define LDB_CTRL_CH0_DATA_WIDTH			BIT(5)
> +#define LDB_CTRL_CH0_BIT_MAPPING		BIT(6)
> +#define LDB_CTRL_CH1_DATA_WIDTH			BIT(7)
> +#define LDB_CTRL_CH1_BIT_MAPPING		BIT(8)
> +#define LDB_CTRL_DI0_VSYNC_POLARITY		BIT(9)
> +#define LDB_CTRL_DI1_VSYNC_POLARITY		BIT(10)
> +#define LDB_CTRL_REG_CH0_FIFO_RESET		BIT(11)
> +#define LDB_CTRL_REG_CH1_FIFO_RESET		BIT(12)
> +#define LDB_CTRL_ASYNC_FIFO_ENABLE		BIT(24)
> +#define LDB_CTRL_ASYNC_FIFO_THRESHOLD_MASK	GENMASK(27, 25)
> +
> +#define LVDS_CTRL				0x128
> +#define LVDS_CTRL_CH0_EN			BIT(0)
> +#define LVDS_CTRL_CH1_EN			BIT(1)
> +#define LVDS_CTRL_VBG_EN			BIT(2)
> +#define LVDS_CTRL_HS_EN				BIT(3)
> +#define LVDS_CTRL_PRE_EMPH_EN			BIT(4)
> +#define LVDS_CTRL_PRE_EMPH_ADJ(n)		(((n) & 0x7) << 5)
> +#define LVDS_CTRL_PRE_EMPH_ADJ_MASK		GENMASK(7, 5)
> +#define LVDS_CTRL_CM_ADJ(n)			(((n) & 0x7) << 8)
> +#define LVDS_CTRL_CM_ADJ_MASK			GENMASK(10, 8)
> +#define LVDS_CTRL_CC_ADJ(n)			(((n) & 0x7) << 11)
> +#define LVDS_CTRL_CC_ADJ_MASK			GENMASK(13, 11)
> +#define LVDS_CTRL_SLEW_ADJ(n)			(((n) & 0x7) << 14)
> +#define LVDS_CTRL_SLEW_ADJ_MASK			GENMASK(16, 14)
> +#define LVDS_CTRL_VBG_ADJ(n)			(((n) & 0x7) << 17)
> +#define LVDS_CTRL_VBG_ADJ_MASK			GENMASK(19, 17)
> +
> +struct nxp_ldb {
> +	struct device *dev;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *panel_bridge;
> +	struct clk *clk;
> +	struct regmap *regmap;
> +	bool lvds_dual_link;
> +};
> +
> +static inline struct nxp_ldb *to_nxp_ldb(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct nxp_ldb, bridge);
> +}
> +
> +static int nxp_ldb_attach(struct drm_bridge *bridge,
> +			    enum drm_bridge_attach_flags flags)
> +{
> +	struct nxp_ldb *nxp_ldb = to_nxp_ldb(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, nxp_ldb->panel_bridge,
> +				 bridge, flags);
> +}
> +
> +static int nxp_ldb_atomic_check(struct drm_bridge *bridge,
> +				struct drm_bridge_state *bridge_state,
> +				struct drm_crtc_state *crtc_state,
> +				struct drm_connector_state *conn_state)
> +{
> +	/* Invert DE signal polarity. */
> +	bridge_state->input_bus_cfg.flags &= ~(DRM_BUS_FLAG_DE_LOW |
> +					       DRM_BUS_FLAG_DE_HIGH);
> +	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
> +		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_HIGH;
> +	else if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_HIGH)
> +		bridge_state->input_bus_cfg.flags |= DRM_BUS_FLAG_DE_LOW;
> +
> +	return 0;
> +}
> +
> +static void nxp_ldb_atomic_enable(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *old_bridge_state)
> +{
> +	struct nxp_ldb *nxp_ldb = to_nxp_ldb(bridge);
> +	struct drm_atomic_state *state = old_bridge_state->base.state;
> +	const struct drm_bridge_state *bridge_state;
> +	const struct drm_crtc_state *crtc_state;
> +	const struct drm_display_mode *mode;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +	bool lvds_format_24bpp;
> +	bool lvds_format_jeida;
> +	u32 reg;
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB666_1X7X3_SPWG:
> +		lvds_format_24bpp = false;
> +		lvds_format_jeida = true;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		lvds_format_24bpp = true;
> +		lvds_format_jeida = true;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		lvds_format_24bpp = true;
> +		lvds_format_jeida = false;
> +		break;
> +	default:
> +		/*
> +		 * Some bridges still don't set the correct LVDS bus pixel
> +		 * format, use SPWG24 default format until those are fixed.
> +		 */
> +		lvds_format_24bpp = true;
> +		lvds_format_jeida = false;
> +		dev_warn(nxp_ldb->dev,
> +			 "Unsupported LVDS bus format 0x%04x, please check output bridge driver. Falling back to SPWG24.\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	/*
> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
> +	 * from the bridge to the encoder, to the connector and to the CRTC.
> +	 */
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	mode = &crtc_state->adjusted_mode;
> +
> +	if (nxp_ldb->lvds_dual_link)
> +		clk_set_rate(nxp_ldb->clk, mode->clock * 3500);
> +	else
> +		clk_set_rate(nxp_ldb->clk, mode->clock * 7000);
> +	clk_prepare_enable(nxp_ldb->clk);
> +
> +	/* Program LDB_CTRL */
> +	reg = LDB_CTRL_CH0_ENABLE;
> +
> +	if (nxp_ldb->lvds_dual_link)
> +		reg |= LDB_CTRL_CH1_ENABLE;
> +
> +	if (lvds_format_24bpp) {
> +		reg |= LDB_CTRL_CH0_DATA_WIDTH;
> +		if (nxp_ldb->lvds_dual_link)
> +			reg |= LDB_CTRL_CH1_DATA_WIDTH;
> +	}
> +
> +	if (lvds_format_jeida) {
> +		reg |= LDB_CTRL_CH0_BIT_MAPPING;
> +		if (nxp_ldb->lvds_dual_link)
> +			reg |= LDB_CTRL_CH1_BIT_MAPPING;
> +	}
> +
> +	if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
> +		reg |= LDB_CTRL_DI0_VSYNC_POLARITY;
> +		if (nxp_ldb->lvds_dual_link)
> +			reg |= LDB_CTRL_DI1_VSYNC_POLARITY;
> +	}
> +
> +	regmap_write(nxp_ldb->regmap, LDB_CTRL, reg);
> +
> +	/* Program LVDS_CTRL */
> +	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
> +	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> +	regmap_write(nxp_ldb->regmap, LVDS_CTRL, reg);
> +
> +	/* Wait for VBG to stabilize. */
> +	usleep_range(15, 20);
> +
> +	reg |= LVDS_CTRL_CH0_EN;
> +	if (nxp_ldb->lvds_dual_link)
> +		reg |= LVDS_CTRL_CH1_EN;
> +
> +	regmap_write(nxp_ldb->regmap, LVDS_CTRL, reg);
> +}
> +
> +static void nxp_ldb_atomic_disable(struct drm_bridge *bridge,
> +				   struct drm_bridge_state *old_bridge_state)
> +{
> +	struct nxp_ldb *nxp_ldb = to_nxp_ldb(bridge);
> +
> +	/* Stop both channels. */
> +	regmap_write(nxp_ldb->regmap, LVDS_CTRL, 0);
> +	regmap_write(nxp_ldb->regmap, LDB_CTRL, 0);
> +
> +	clk_disable_unprepare(nxp_ldb->clk);
> +}
> +
> +#define MAX_INPUT_SEL_FORMATS 1
> +static u32 *
> +nxp_ldb_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *bridge_state,
> +				     struct drm_crtc_state *crtc_state,
> +				     struct drm_connector_state *conn_state,
> +				     u32 output_fmt,
> +				     unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = MAX_INPUT_SEL_FORMATS;
> +
> +	return input_fmts;
> +}
> +
> +static enum drm_mode_status
> +nxp_ldb_mode_valid(struct drm_bridge *bridge,
> +		   const struct drm_display_info *info,
> +		   const struct drm_display_mode *mode)
> +{
> +	struct nxp_ldb *nxp_ldb = to_nxp_ldb(bridge);
> +
> +	if (mode->clock > (nxp_ldb->lvds_dual_link ? 80000 : 160000))
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_bridge_funcs funcs = {
> +	.attach = nxp_ldb_attach,
> +	.atomic_check = nxp_ldb_atomic_check,
> +	.atomic_enable = nxp_ldb_atomic_enable,
> +	.atomic_disable = nxp_ldb_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts = nxp_ldb_atomic_get_input_bus_fmts,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.mode_valid = nxp_ldb_mode_valid,
> +};
> +
> +static int nxp_ldb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *panel_node;
> +	struct device_node *port1, *port2;
> +	struct drm_panel *panel;
> +	struct nxp_ldb *nxp_ldb;
> +	int dual_link;
> +
> +	nxp_ldb = devm_kzalloc(dev, sizeof(*nxp_ldb), GFP_KERNEL);
> +	if (!nxp_ldb)
> +		return -ENOMEM;
> +
> +	nxp_ldb->dev = &pdev->dev;
> +	nxp_ldb->bridge.funcs = &funcs;
> +	nxp_ldb->bridge.of_node = dev->of_node;
> +
> +	nxp_ldb->clk = devm_clk_get(dev, "ldb");
> +	if (IS_ERR(nxp_ldb->clk))
> +		return PTR_ERR(nxp_ldb->clk);
> +
> +	nxp_ldb->regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> +							  "fsl,syscon");
> +	if (IS_ERR(nxp_ldb->regmap))
> +		return PTR_ERR(nxp_ldb->regmap);
> +
> +	/* Locate the panel DT node. */
> +	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
> +	if (!panel_node)
> +		return -ENXIO;
> +
> +	panel = of_drm_find_panel(panel_node);
> +	of_node_put(panel_node);
> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
> +
> +	nxp_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +	if (IS_ERR(nxp_ldb->panel_bridge))
> +		return PTR_ERR(nxp_ldb->panel_bridge);
> +
> +	/* Determine whether this is dual-link configuration */
> +	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> +	port2 = of_graph_get_port_by_id(dev->of_node, 2);
> +	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> +	of_node_put(port1);
> +	of_node_put(port2);
> +
> +	if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> +		dev_err(dev, "LVDS channel pixel swap not supported.\n");
> +		return -EINVAL;
> +	}
> +
> +	if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS)
> +		nxp_ldb->lvds_dual_link = true;
> +
> +	platform_set_drvdata(pdev, nxp_ldb);
> +
> +	drm_bridge_add(&nxp_ldb->bridge);
> +
> +	return 0;
> +}
> +
> +static int nxp_ldb_remove(struct platform_device *pdev)
> +{
> +	struct nxp_ldb *nxp_ldb = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&nxp_ldb->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id nxp_ldb_match[] = {
> +	{ .compatible = "fsl,imx8mp-ldb", },
> +	{},
I usually advice to use { /* sentinel */ },

> +};
> +MODULE_DEVICE_TABLE(of, nxp_ldb_match);
> +
> +static struct platform_driver nxp_ldb_driver = {
> +	.probe	= nxp_ldb_probe,
> +	.remove	= nxp_ldb_remove,
> +	.driver		= {
> +		.name		= "nxp-ldb",
> +		.of_match_table	= nxp_ldb_match,
> +	},
> +};
> +module_platform_driver(nxp_ldb_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@denx.de>");
> +MODULE_DESCRIPTION("NXP i.MX8M LDB");
> +MODULE_LICENSE("GPL");
> -- 
> 2.35.1
