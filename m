Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55743BEC06
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 18:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9686E0EF;
	Wed,  7 Jul 2021 16:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E836E19C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 16:22:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167GGoV5008957; Wed, 7 Jul 2021 18:22:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=wceljAJS6jELFAGQMCkXtPYRQzavot3kBVcoBeAhUho=;
 b=CK0K2B7N/TPROxScT4pfpwXWzkY6Hprr816W87P7dbnFfHQWc5YWvBHndcUJGXvewY98
 nlqobwdVrxtIvgz5N1vJVkBBktXsPWw0981CsQHvypcEpkgn/vU/ABc7QGHwbgskylGC
 kxmOAb7BOjuyq5lsc7YYbsUeAraQ1nfHvL44B9ec4cqu62KJo1780unFaLIXLQcRd3Gt
 NsFp6F5rvFcYfv/A1ZY8Gk28CnewcL+lYXVPifCKPIxfjmWeq9hiwxXfZBOcf1wlQQLo
 WMAZOxB9TMLSMd8t5esAmTZluwzZVy/3WK3+7UMTcmMylBBIw5v1qb1YsclhReNx1vEf 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39mxgxnnxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 18:22:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32EEF100034;
 Wed,  7 Jul 2021 18:22:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B59123151E;
 Wed,  7 Jul 2021 18:22:31 +0200 (CEST)
Received: from lmecxl0951.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 18:22:30 +0200
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: Find the possible DSI devices
To: Jagan Teki <jagan@amarulasolutions.com>, Heiko Stubner <heiko@sntech.de>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonathan Liu <net147@gmail.com>
References: <20210704140309.268469-1-jagan@amarulasolutions.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <8022a838-abd2-51b4-50fa-1498ac5232bd@foss.st.com>
Date: Wed, 7 Jul 2021 18:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704140309.268469-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_08:2021-07-06,
 2021-07-07 signatures=0
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
Cc: linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

Sorry for the delay. Thanks for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>




On 7/4/21 4:03 PM, Jagan Teki wrote:
> Finding panel_or_bridge might vary based on associated
> DSI devices like DSI panel, bridge, and I2C based DSI
> bridge.
> 
> 1. DSI panels and bridges will invoke the host attach
>     from probe in order to find the panel_or_bridge.
> 
>     chipone_probe()
>         dw_mipi_dsi_host_attach().start
> 	   dw_mipi_dsi_panel_or_bridge()
> 		...found the panel_or_bridge...
> 
>     ltdc_encoder_init().start
>         dw_mipi_dsi_bridge_attach().start
> 		   dw_mipi_dsi_host_attach().start
> 		       chipone_attach(). start
> 
> 	               chipone_attach(). done
> 		   dw_mipi_dsi_host_attach().done
>         dw_mipi_dsi_bridge_attach(). done
>     ltdc_encoder_init().done
> 
> 2. I2C based DSI bridge will invoke the drm_bridge_attach
>     from bridge attach in order to find the panel_or_bridge.
> 
>     ltdc_encoder_init().start
>         dw_mipi_dsi_bridge_attach().start
> 	   dw_mipi_dsi_panel_or_bridge()
> 		...found the panel_or_bridge...
> 		   dw_mipi_dsi_host_attach().start
> 		       sn65dsi83_attach(). start
> 
> 	               sn65dsi83_attach(). done
> 		   dw_mipi_dsi_host_attach().done
>         dw_mipi_dsi_bridge_attach(). done
>     ltdc_encoder_init().done
> 
> So, invoke the panel_or_bridge from host attach and
> bridge attach in order to find all possible DSI devices.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 58 ++++++++++++++-----
>   1 file changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 6b268f9445b3..45f4515dda00 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -246,6 +246,7 @@ struct dw_mipi_dsi {
>   
>   	struct clk *pclk;
>   
> +	bool device_found;
>   	unsigned int lane_mbps; /* per lane */
>   	u32 channel;
>   	u32 lanes;
> @@ -309,13 +310,37 @@ static inline u32 dsi_read(struct dw_mipi_dsi *dsi, u32 reg)
>   	return readl(dsi->base + reg);
>   }
>   
> +static int dw_mipi_dsi_panel_or_bridge(struct dw_mipi_dsi *dsi,
> +				       struct device_node *node)
> +{
> +	struct drm_bridge *bridge;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(node, 1, 0, &panel, &bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		bridge = drm_panel_bridge_add_typed(panel,
> +						    DRM_MODE_CONNECTOR_DSI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	}
> +
> +	dsi->panel_bridge = bridge;
> +
> +	if (!dsi->panel_bridge)
> +		return -EPROBE_DEFER;
> +
> +	return 0;
> +}
> +
>   static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>   				   struct mipi_dsi_device *device)
>   {
>   	struct dw_mipi_dsi *dsi = host_to_dsi(host);
>   	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
> -	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
>   	int ret;
>   
>   	if (device->lanes > dsi->plat_data->max_data_lanes) {
> @@ -329,22 +354,14 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>   	dsi->format = device->format;
>   	dsi->mode_flags = device->mode_flags;
>   
> -	ret = drm_of_find_panel_or_bridge(host->dev->of_node, 1, 0,
> -					  &panel, &bridge);
> -	if (ret)
> -		return ret;
> +	if (!dsi->device_found) {
> +		ret = dw_mipi_dsi_panel_or_bridge(dsi, host->dev->of_node);
> +		if (ret)
> +			return ret;
>   
> -	if (panel) {
> -		bridge = drm_panel_bridge_add_typed(panel,
> -						    DRM_MODE_CONNECTOR_DSI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> +		dsi->device_found = true;
>   	}
>   
> -	dsi->panel_bridge = bridge;
> -
> -	drm_bridge_add(&dsi->bridge);
> -
>   	if (pdata->host_ops && pdata->host_ops->attach) {
>   		ret = pdata->host_ops->attach(pdata->priv_data, device);
>   		if (ret < 0)
> @@ -999,6 +1016,16 @@ static int dw_mipi_dsi_bridge_attach(struct drm_bridge *bridge,
>   	/* Set the encoder type as caller does not know it */
>   	bridge->encoder->encoder_type = DRM_MODE_ENCODER_DSI;
>   
> +	if (!dsi->device_found) {
> +		int ret;
> +
> +		ret = dw_mipi_dsi_panel_or_bridge(dsi, dsi->dev->of_node);
> +		if (ret)
> +			return ret;
> +
> +		dsi->device_found = true;
> +	}
> +
>   	/* Attach the panel-bridge to the dsi bridge */
>   	return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, bridge,
>   				 flags);
> @@ -1181,6 +1208,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   #ifdef CONFIG_OF
>   	dsi->bridge.of_node = pdev->dev.of_node;
>   #endif
> +	drm_bridge_add(&dsi->bridge);
>   
>   	return dsi;
>   }
> 
