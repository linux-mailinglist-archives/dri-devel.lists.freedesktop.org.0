Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A54BBFA5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9871710E6CA;
	Fri, 18 Feb 2022 18:38:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A688110E6CA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 18:38:44 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nL89T-0001ff-2O; Fri, 18 Feb 2022 19:38:43 +0100
Message-ID: <7d92962a433843af249a5adcc145dc4aecc66015.camel@pengutronix.de>
Subject: Re: [PATCH V2 11/11] drm/bridge: tc358767: Add DSI-to-DPI mode support
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Feb 2022 19:38:41 +0100
In-Reply-To: <20220218010054.315026-12-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-12-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 18.02.2022 um 02:00 +0100 schrieb Marek Vasut:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Add support for the
> DSI-to-DPI mode.
> 
> This requires skipping most of the (e)DP initialization code, which is
> currently a large part of this driver, hence it is better to have far
> simpler separate tc_dpi_bridge_funcs and their implementation.
> 
> The configuration of DPI output is also much simpler. The configuration
> of the DSI input is rather similar to the other TC bridge chips.
> 
> The Pixel PLL in DPI output mode does not have the 65..150 MHz limitation
> imposed on the (e)DP output mode, so this limitation is skipped to permit
> operating panels with far slower pixel clock, even below 9 MHz. This mode
> of operation of the PLL is valid and tested.
> 
> The detection of bridge mode is now added into tc_probe_bridge_mode(),
> where in case a DPI panel is found on port@1 endpoint@1, the mode is
> assumed to be DSI-to-DPI. If (e)DP is detected on port@2, the mode is
> assumed to be DPI-to-(e)DP.
> 
> The DSI-to-(e)DP mode is not supported due to lack of proper hardware,
> but this would be some sort of mix between the two aforementioned modes.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
> V2: - Rebase on next-20220217 and new patches in this series
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 339 +++++++++++++++++++++++++++++-
>  1 file changed, 332 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 091c969a36ab7..2b9fceb1333fa 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1,6 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * tc358767 eDP bridge driver
> + * TC358767/TC358867/TC9595 DSI/DPI-to-DPI/(e)DP bridge driver
> + *
> + * The TC358767/TC358867/TC9595 can operate in multiple modes.
> + * The following modes are supported:
> + *   DPI->(e)DP -- supported
> + *   DSI->DPI .... supported
> + *   DSI->(e)DP .. NOT supported
>   *
>   * Copyright (C) 2016 CogentEmbedded Inc
>   * Author: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> @@ -29,6 +35,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/dp/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
> @@ -36,7 +43,35 @@
>  
>  /* Registers */
>  
> -/* Display Parallel Interface */
> +/* PPI layer registers */
> +#define PPI_STARTPPI		0x0104 /* START control bit */
> +#define PPI_LPTXTIMECNT		0x0114 /* LPTX timing signal */
> +#define LPX_PERIOD			3
> +#define PPI_LANEENABLE		0x0134
> +#define PPI_TX_RX_TA		0x013c
> +#define TTA_GET				0x40000
> +#define TTA_SURE			6
> +#define PPI_D0S_ATMR		0x0144
> +#define PPI_D1S_ATMR		0x0148
> +#define PPI_D0S_CLRSIPOCOUNT	0x0164 /* Assertion timer for Lane 0 */
> +#define PPI_D1S_CLRSIPOCOUNT	0x0168 /* Assertion timer for Lane 1 */
> +#define PPI_D2S_CLRSIPOCOUNT	0x016c /* Assertion timer for Lane 2 */
> +#define PPI_D3S_CLRSIPOCOUNT	0x0170 /* Assertion timer for Lane 3 */
> +#define PPI_START_FUNCTION		BIT(0)
> +
> +/* DSI layer registers */
> +#define DSI_STARTDSI		0x0204 /* START control bit of DSI-TX */
> +#define DSI_LANEENABLE		0x0210 /* Enables each lane */
> +#define DSI_RX_START			BIT(0)
> +
> +/* Lane enable PPI and DSI register bits */
> +#define LANEENABLE_CLEN		BIT(0)
> +#define LANEENABLE_L0EN		BIT(1)
> +#define LANEENABLE_L1EN		BIT(2)
> +#define LANEENABLE_L2EN		BIT(1)
> +#define LANEENABLE_L3EN		BIT(2)
> +
> +/* Display Parallel Input Interface */
>  #define DPIPXLFMT		0x0440
>  #define VS_POL_ACTIVE_LOW		(1 << 10)
>  #define HS_POL_ACTIVE_LOW		(1 << 9)
> @@ -48,6 +83,14 @@
>  #define DPI_BPP_RGB666			(1 << 0)
>  #define DPI_BPP_RGB565			(2 << 0)
>  
> +/* Display Parallel Output Interface */
> +#define POCTRL			0x0448
> +#define POCTRL_S2P			BIT(7)
> +#define POCTRL_PCLK_POL			BIT(3)
> +#define POCTRL_VS_POL			BIT(2)
> +#define POCTRL_HS_POL			BIT(1)
> +#define POCTRL_DE_POL			BIT(0)
> +
>  /* Video Path */
>  #define VPCTRL0			0x0450
>  #define VSDELAY			GENMASK(31, 20)
> @@ -247,6 +290,9 @@ struct tc_data {
>  	struct drm_bridge	*panel_bridge;
>  	struct drm_connector	connector;
>  
> +	struct mipi_dsi_device	*dsi;
> +	u8			dsi_lanes;
> +
>  	/* link settings */
>  	struct tc_edp_link	link;
>  
> @@ -502,8 +548,10 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
>  				/*
>  				 * refclk * mul / (ext_pre_div * pre_div)
>  				 * should be in the 150 to 650 MHz range
> +				 * for (e)DP
>  				 */
> -				if ((clk > 650000000) || (clk < 150000000))
> +				if ((tc->bridge.type != DRM_MODE_CONNECTOR_DPI) &&
> +				    ((clk > 650000000) || (clk < 150000000)))
>  					continue;

Is there any indication what the bounds are for DPI mode? Can we
replace this with a better check, instead of just disabling it?

>  
>  				clk = clk / ext_div[i_post];
> @@ -820,6 +868,20 @@ static int tc_set_common_video_mode(struct tc_data *tc,
>  	return ret;
>  }
>  
> +static int tc_set_dpi_video_mode(struct tc_data *tc,
> +				 const struct drm_display_mode *mode)
> +{
> +	u32 value = POCTRL_S2P;
> +
> +	if (tc->mode.flags & DRM_MODE_FLAG_NHSYNC)
> +		value |= POCTRL_HS_POL;
> +
> +	if (tc->mode.flags & DRM_MODE_FLAG_NVSYNC)
> +		value |= POCTRL_VS_POL;
> +
> +	return regmap_write(tc->regmap, POCTRL, value);
> +}
> +
>  static int tc_set_edp_video_mode(struct tc_data *tc,
>  				 const struct drm_display_mode *mode)
>  {
> @@ -1192,6 +1254,79 @@ static int tc_main_link_disable(struct tc_data *tc)
>  	return regmap_write(tc->regmap, DP0CTL, 0);
>  }
>  
> +static int tc_dpi_stream_enable(struct tc_data *tc)
> +{
> +	int ret;
> +	u32 value;
> +
> +	dev_dbg(tc->dev, "enable video stream\n");
> +
> +	/* Setup PLL */
> +	ret = tc_set_syspllparam(tc);
> +	if (ret)
> +		return ret;
> +
> +	/* Pixel PLL must always be enabled for DPI mode */
> +	ret = tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
> +			    1000 * tc->mode.clock);
> +	if (ret)
> +		return ret;
> +
> +	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
> +	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);

Hm, those hardcoded always seem kind of fishy, as AFAIK those
parameters are dependent on land frequency and some other things. But
I'm also not sure if we have all the information available to
dynamically calculate them.

> +	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
> +	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
> +	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> +	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
> +
> +	value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> +		LANEENABLE_CLEN;
> +	regmap_write(tc->regmap, PPI_LANEENABLE, value);
> +	regmap_write(tc->regmap, DSI_LANEENABLE, value);
> +
> +	ret = tc_set_common_video_mode(tc, &tc->mode);
> +	if (ret)
> +		return ret;
> +
> +	ret = tc_set_dpi_video_mode(tc, &tc->mode);
> +	if (ret)
> +		return ret;
> +
> +	/* Set input interface */
> +	value = DP0_AUDSRC_NO_INPUT;
> +	if (tc_test_pattern)
> +		value |= DP0_VIDSRC_COLOR_BAR;
> +	else
> +		value |= DP0_VIDSRC_DSI_RX;
> +	ret = regmap_write(tc->regmap, SYSCTRL, value);
> +	if (ret)
> +		return ret;
> +
> +	msleep(100);

What is that used for? PLL stabilization? Some other purpose?

> +
> +	regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
> +	regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
> +
> +	return 0;
> +}
> +
> +static int tc_dpi_stream_disable(struct tc_data *tc)
> +{
> +	int ret;
> +
> +	dev_dbg(tc->dev, "disable video stream\n");
> +
> +	ret = regmap_update_bits(tc->regmap, DP0CTL, VID_EN, 0);

If I'm not mistaken than VID_EN isn't set in the DPI stream enable, so
clearing it here seems wrong.

> +	if (ret)
> +		return ret;
> +
> +	tc_pxl_pll_dis(tc);
> +
> +	return 0;
> +}
> +
>  static int tc_edp_stream_enable(struct tc_data *tc)
>  {
>  	int ret;
> @@ -1323,6 +1458,40 @@ static int tc_hardware_init(struct tc_data *tc)
>  	return 0;
>  }
>  
> +static void
> +tc_dpi_bridge_atomic_enable(struct drm_bridge *bridge,
> +			    struct drm_bridge_state *old_bridge_state)
> +
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	int ret;
> +
> +	ret = tc_hardware_init(tc);
> +	if (ret < 0) {
> +		dev_err(tc->dev, "failed to initialize bridge: %d\n", ret);
> +		return;
> +	}
> +
> +	ret = tc_dpi_stream_enable(tc);
> +	if (ret < 0) {
> +		dev_err(tc->dev, "main link stream start error: %d\n", ret);
> +		tc_main_link_disable(tc);
> +		return;
> +	}
> +}
> +
> +static void
> +tc_dpi_bridge_atomic_disable(struct drm_bridge *bridge,
> +			     struct drm_bridge_state *old_bridge_state)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +	int ret;
> +
> +	ret = tc_dpi_stream_disable(tc);
> +	if (ret < 0)
> +		dev_err(tc->dev, "main link stream stop error: %d\n", ret);
> +}
> +
>  static void
>  tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
>  			    struct drm_bridge_state *old_bridge_state)
> @@ -1399,6 +1568,16 @@ static int tc_edp_common_atomic_check(struct drm_bridge *bridge,
>  	return 0;
>  }
>  
> +static int tc_dpi_atomic_check(struct drm_bridge *bridge,
> +			       struct drm_bridge_state *bridge_state,
> +			       struct drm_crtc_state *crtc_state,
> +			       struct drm_connector_state *conn_state)
> +{
> +	/* DSI->DPI interface clock limitation: upto 100 MHz */
> +	return tc_edp_common_atomic_check(bridge, bridge_state, crtc_state,
> +					  conn_state, 100000);
> +}
> +
>  static int tc_edp_atomic_check(struct drm_bridge *bridge,
>  			       struct drm_bridge_state *bridge_state,
>  			       struct drm_crtc_state *crtc_state,
> @@ -1409,6 +1588,18 @@ static int tc_edp_atomic_check(struct drm_bridge *bridge,
>  					  conn_state, 154000);
>  }
>  
> +static enum drm_mode_status
> +tc_dpi_mode_valid(struct drm_bridge *bridge,
> +		  const struct drm_display_info *info,
> +		  const struct drm_display_mode *mode)
> +{
> +	/* DPI interface clock limitation: upto 100 MHz */
> +	if (mode->clock > 100000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static enum drm_mode_status
>  tc_edp_mode_valid(struct drm_bridge *bridge,
>  		  const struct drm_display_info *info,
> @@ -1520,6 +1711,18 @@ static const struct drm_connector_funcs tc_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> +static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct tc_data *tc = bridge_to_tc(bridge);
> +
> +	if (!tc->panel_bridge)
> +		return 0;
> +
> +	return drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
> +				 &tc->bridge, flags);
> +}
> +
>  static int tc_edp_bridge_attach(struct drm_bridge *bridge,
>  				enum drm_bridge_attach_flags flags)
>  {
> @@ -1578,6 +1781,45 @@ static void tc_edp_bridge_detach(struct drm_bridge *bridge)
>  	drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
>  }
>  
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *
> +tc_dpi_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				    struct drm_bridge_state *bridge_state,
> +				    struct drm_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state,
> +				    u32 output_fmt,
> +				    unsigned int *num_input_fmts)
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
> +	/* This is the DSI-end bus format */
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +
> +static const struct drm_bridge_funcs tc_dpi_bridge_funcs = {
> +	.attach = tc_dpi_bridge_attach,
> +	.mode_valid = tc_dpi_mode_valid,
> +	.mode_set = tc_bridge_mode_set,
> +	.atomic_check = tc_dpi_atomic_check,
> +	.atomic_enable = tc_dpi_bridge_atomic_enable,
> +	.atomic_disable = tc_dpi_bridge_atomic_disable,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_get_input_bus_fmts = tc_dpi_atomic_get_input_bus_fmts,
> +};
> +
>  static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.attach = tc_edp_bridge_attach,
>  	.detach = tc_edp_bridge_detach,
> @@ -1678,6 +1920,81 @@ static irqreturn_t tc_irq_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> +static int tc_mipi_dsi_host_attach(struct tc_data *tc)
> +{
> +	struct device *dev = tc->dev;
> +	struct device_node *host_node;
> +	struct device_node *endpoint;
> +	struct mipi_dsi_device *dsi;
> +	struct mipi_dsi_host *host;
> +	const struct mipi_dsi_device_info info = {
> +		.type = "tc358767",
> +		.channel = 0,
> +		.node = NULL,
> +	};
> +	int ret;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +	tc->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");

The data-lanes property isn't documented in the DT binding. Please add.

> +	host_node = of_graph_get_remote_port_parent(endpoint);
> +	host = of_find_mipi_dsi_host_by_node(host_node);
> +	of_node_put(host_node);
> +	of_node_put(endpoint);
> +
> +	if (tc->dsi_lanes < 0 || tc->dsi_lanes > 4)
> +		return -EINVAL;
> +
> +	if (!host)
> +		return -EPROBE_DEFER;
> +
> +	dsi = mipi_dsi_device_register_full(host, &info);
> +	if (IS_ERR(dsi))
> +		return dev_err_probe(dev, PTR_ERR(dsi),
> +				     "failed to create dsi device\n");
> +
> +	tc->dsi = dsi;
> +
> +	dsi->lanes = tc->dsi_lanes;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to attach dsi to host: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tc_probe_dpi_bridge_endpoint(struct tc_data *tc)
> +{
> +	struct device *dev = tc->dev;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	/* port@1 is the DPI input/output port */
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> +	if (ret && ret != -ENODEV)
> +		return ret;
> +
> +	if (panel) {
> +		struct drm_bridge *panel_bridge;
> +
> +		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(panel_bridge))
> +			return PTR_ERR(panel_bridge);
> +
> +		tc->panel_bridge = panel_bridge;
> +		tc->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +		tc->bridge.funcs = &tc_dpi_bridge_funcs;
> +
> +		return 0;
> +	}
> +
> +	return ret;
> +}
> +
>  static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>  {
>  	struct device *dev = tc->dev;
> @@ -1745,7 +2062,7 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>  	if (mode == mode_dpi_to_edp)
>  		return tc_probe_edp_bridge_endpoint(tc);
>  	else if (mode == mode_dsi_to_dpi)
> -		dev_warn(dev, "The mode DSI-to-DPI is not supported!\n");
> +		return tc_probe_dpi_bridge_endpoint(tc);
>  	else if (mode == mode_dsi_to_edp)
>  		dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
>  	else
> @@ -1828,15 +2145,23 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		tc->have_irq = true;
>  	}
>  
> -	ret = tc_aux_link_setup(tc);
> -	if (ret)
> -		return ret;
> +	if (tc->bridge.type != DRM_MODE_CONNECTOR_DPI) { /* (e)DP output */
> +		ret = tc_aux_link_setup(tc);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);
>  
>  	i2c_set_clientdata(client, tc);
>  
> +	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) { /* DPI output */
> +		ret = tc_mipi_dsi_host_attach(tc);
> +		if (ret)
> +			return ret;
> +	}

If tc_mipi_dsi_host_attach fails the drm bridge registered a few lines
above isn't cleaned up properly.

Regards,
Lucas

