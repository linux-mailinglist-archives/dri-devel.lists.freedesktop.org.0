Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6CC30D977
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 13:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD646EA58;
	Wed,  3 Feb 2021 12:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29A56EA58
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 12:06:04 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1l7Gum-0007KC-Lc; Wed, 03 Feb 2021 13:05:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sandy Huang <hjc@rock-chips.com>, Yannick Fertre <yannick.fertre@st.com>,
 Philippe Cornu <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent Abriou <vincent.abriou@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Move drm_bridge_add into probe
Date: Wed, 03 Feb 2021 13:05:43 +0100
Message-ID: <1660529.M3retTD8dW@diego>
In-Reply-To: <20210203091306.140518-1-jagan@amarulasolutions.com>
References: <20210203091306.140518-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 3. Februar 2021, 10:13:06 CET schrieb Jagan Teki:
> Usual I2C configured DSI bridge drivers have drm_bridge_add
> in probe and mipi_dsi_attach in bridge attach functions.
> 
> With, this approach the drm pipeline is unable to find the
> dsi bridge in stm drm drivers since the dw-mipi-dsi bridge is
> adding drm bridge during bridge attach operations instead of
> the probe.

Shouldn't the STM drm driver not simply defer if it's missing
a bridge that is referenced in the devicetree or somewhere?


> This specific issue may not encounter for rockchip drm dsi
> drivers, since rockchip drm uses component binding operations,
> unlike stm drm drivers.
> 
> So, possible solutions are
> 1. Move drm_bridge_add into the dw-mipi-dsi probe.
> 2. Add mipi_dsi_attach in the bridge drivers probe.
> 3. Add component binding operations for stm drm drivers.

personally I'd like number (3) a lot ;-) .

With your approach, at least the component-based variants would
end up with multiple probe cycles, getting clocks etc until at some point
the panel has probed, where in the current way of things, the probe is
done once and we continue bringup once the panel has probed and called
dsi-attach to signal it is present.

Which was actually what Andrzej wished for, when I moved the Rockchip
dsi to the common driver.


Or at least make it configurable via a param to the common dw-dsi probe
function. Especially as I also need the dsi bridge-less when used as a
simple means for the configuring the internal dphy to rx-mode, see [0]


Heiko

[0] https://lore.kernel.org/dri-devel/20210202145632.1263136-1-heiko@sntech.de/


> Option 1 is a relatively possible solution as most of the
> mainline drm dsi with bridge drivers have a similar approach
> to their dsi host vs bridge registration.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 35 +++++++++----------
>  1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 6b268f9445b3..8a535041f071 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -314,8 +314,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  {
>  	struct dw_mipi_dsi *dsi = host_to_dsi(host);
>  	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>  	int ret;
>  
>  	if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -329,22 +327,6 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
>  
> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> -					  &panel, &bridge);
> -	if (ret)
> -		return ret;
> -
> -	if (panel) {
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> -	}
> -
> -	dsi->panel_bridge = bridge;
> -
> -	drm_bridge_add(&dsi->bridge);
> -
>  	if (pdata->host_ops && pdata->host_ops->attach) {
>  		ret = pdata->host_ops->attach(pdata->priv_data, device);
>  		if (ret < 0)
> @@ -1105,6 +1087,8 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct reset_control *apb_rst;
>  	struct dw_mipi_dsi *dsi;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
>  	int ret;
>  
>  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> @@ -1167,6 +1151,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  	dw_mipi_dsi_debugfs_init(dsi);
>  	pm_runtime_enable(dev);
>  
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> +					  &panel, &bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel,
> +						    DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return ERR_PTR(-ENODEV);
> +	}
> +
> +	dsi->panel_bridge = bridge;
> +
>  	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
>  	dsi->dsi_host.dev = dev;
>  	ret = mipi_dsi_host_register(&dsi->dsi_host);
> @@ -1181,6 +1179,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  #ifdef CONFIG_OF
>  	dsi->bridge.of_node = pdev->dev.of_node;
>  #endif
> +	drm_bridge_add(&dsi->bridge);
>  
>  	return dsi;
>  }
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
