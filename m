Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55B270BFE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Sep 2020 10:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE156E1C4;
	Sat, 19 Sep 2020 08:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1905 seconds by postgrey-1.36 at gabe;
 Fri, 18 Sep 2020 14:47:14 UTC
Received: from mail.theobroma-systems.com (vegas.theobroma-systems.com
 [144.76.126.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0ADF6E077
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 14:47:14 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]:38188
 helo=diego.localnet) by mail.theobroma-systems.com with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
 (envelope-from <heiko.stuebner@theobroma-systems.com>)
 id 1kJHAT-000451-A1; Fri, 18 Sep 2020 16:15:17 +0200
From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Philippe Cornu <philippe.cornu@st.com>, Antonio Borneo <antonio.borneo@st.com>,
 Yannick Fertre <yannick.fertre@st.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>
Subject: Re: [PATCH] drm/bridge/synopsys: dsi: fix initialization sequence
Date: Fri, 18 Sep 2020 16:15:16 +0200
Message-ID: <3406999.krX5sgqVKE@diego>
Organization: Theobroma Systems
In-Reply-To: <20200918114653.10932-1-yannick.fertre@st.com>
References: <20200918114653.10932-1-yannick.fertre@st.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 19 Sep 2020 08:46:17 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 18. September 2020, 13:46:53 CEST schrieb Yannick Fertre:
> The current driver calls drm_bridge_add(), to add the dsi bridge
> to the global bridge list, in dw_mipi_dsi_host_attach().
> Thus, it relies on the probing of panel or bridge sub-nodes to
> trigger the execution of dsi host attach() that will, in turn,
> call dw_mipi_dsi_host_attach().
> This causes an incomplete driver initialization if the panel or
> the next bridge is not present as sub-node, e.g. because it is an
> i2c device, thus sub-node of the respective i2c controller.

Actually the drm_of_find_panel_or_bridge() works on of-graph nodes,
so having an remote-port pointing to the i2c/spi/whatever driver
should just work - and no need for the driver to be a subnode itself.

And while my memory is fuzzy, I think I remember Andrzej requesting
only registering the bridge once we know something is connected,
aka when it calls dsi_attach.


Heiko

> 
> Move the relevant code from host attach() to probe(), and the
> corresponding code from detach() to remove().
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 73 ++++++++++++-------
>  1 file changed, 48 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 6b268f9445b3..aa74abddc79f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -314,9 +314,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  {
>  	struct dw_mipi_dsi *dsi = host_to_dsi(host);
>  	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
> -	int ret;
> +	int ret = -ENODEV;
>  
>  	if (device->lanes > dsi->plat_data->max_data_lanes) {
>  		dev_err(dsi->dev, "the number of data lanes(%u) is too many\n",
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
> @@ -367,10 +349,6 @@ static int dw_mipi_dsi_host_detach(struct mipi_dsi_host *host,
>  			return ret;
>  	}
>  
> -	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
> -
> -	drm_bridge_remove(&dsi->bridge);
> -
>  	return 0;
>  }
>  
> @@ -1105,6 +1083,9 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct reset_control *apb_rst;
>  	struct dw_mipi_dsi *dsi;
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int i, nb_endpoints;
>  	int ret;
>  
>  	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> @@ -1172,8 +1153,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  	ret = mipi_dsi_host_register(&dsi->dsi_host);
>  	if (ret) {
>  		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
> -		dw_mipi_dsi_debugfs_remove(dsi);
> -		return ERR_PTR(ret);
> +		goto err_pmr_enable;
>  	}
>  
>  	dsi->bridge.driver_private = dsi;
> @@ -1182,11 +1162,54 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>  	dsi->bridge.of_node = pdev->dev.of_node;
>  #endif
>  
> +	/* Get number of endpoints */
> +	nb_endpoints = of_graph_get_endpoint_count(pdev->dev.of_node);
> +	if (!nb_endpoints) {
> +		ret = -ENODEV;
> +		goto err_host_reg;
> +	}
> +
> +	for (i = 1; i < nb_endpoints; i++) {
> +		ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, i, 0,
> +						  &panel, &bridge);
> +		if (!ret)
> +			break;
> +		else if (ret == -EPROBE_DEFER)
> +			goto err_host_reg;
> +	}
> +
> +	/* check if an error is returned >> no panel or bridge detected */
> +	if (ret)
> +		goto err_host_reg;
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel, DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge)) {
> +			ret = PTR_ERR(bridge);
> +			goto err_host_reg;
> +		}
> +	}
> +
> +	dsi->panel_bridge = bridge;
> +
> +	drm_bridge_add(&dsi->bridge);
> +
>  	return dsi;
> +
> +err_host_reg:
> +	mipi_dsi_host_unregister(&dsi->dsi_host);
> +
> +err_pmr_enable:
> +	pm_runtime_disable(dev);
> +	dw_mipi_dsi_debugfs_remove(dsi);
> +
> +	return ERR_PTR(ret);
>  }
>  
>  static void __dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi)
>  {
> +	drm_bridge_remove(&dsi->bridge);
> +	drm_panel_bridge_remove(dsi->panel_bridge);
>  	mipi_dsi_host_unregister(&dsi->dsi_host);
>  
>  	pm_runtime_disable(dsi->dev);
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
