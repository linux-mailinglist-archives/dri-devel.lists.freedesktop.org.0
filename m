Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D4F486021
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 06:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C0010FBC8;
	Thu,  6 Jan 2022 05:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4AA10FBB7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 05:23:01 +0000 (UTC)
X-UUID: c92181efa8d140aab01c5d17d75745d2-20220106
X-UUID: c92181efa8d140aab01c5d17d75745d2-20220106
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2112539445; Thu, 06 Jan 2022 13:22:55 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 13:22:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 13:22:54 +0800
Message-ID: <c0279078032bae61e6c1d70be74d1fb8c528083f.camel@mediatek.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
From: CK Hu <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>
Date: Thu, 6 Jan 2022 13:22:51 +0800
In-Reply-To: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Angelo:

On Tue, 2022-01-04 at 10:59 +0100, AngeloGioacchino Del Regno wrote:
> DRM bridge drivers are now attaching their DSI device at probe time,
> which requires us to register our DSI host in order to let the bridge
> to probe: this recently started producing an endless -EPROBE_DEFER
> loop on some machines that are using external bridges, like the
> parade-ps8640, found on the ACER Chromebook R13.
> 
> Now that the DSI hosts/devices probe sequence is documented, we can
> do adjustments to the mtk_dsi driver as to both fix now and make sure
> to avoid this situation in the future: for this, following what is
> documented in drm_bridge.c, move the mtk_dsi component_add() to the
> mtk_dsi_ops.attach callback and delete it in the detach callback;
> keeping in mind that we are registering a drm_bridge for our DSI,
> which is only used/attached if the DSI Host is bound, it wouldn't
> make sense to keep adding our bridge at probe time (as it would
> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
> that one to the dsi host attach function (and remove it in detach).

This patch looks good to me, but please add 'Fixes' tag to note to
which patch this patch want to fix.

Regards,
CK

> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 167 +++++++++++++++----------
> ----
>  1 file changed, 84 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 5d90d2eb0019..bced4c7d668e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -786,18 +786,101 @@ void mtk_dsi_ddp_stop(struct device *dev)
>  	mtk_dsi_poweroff(dsi);
>  }
>  
> +static int mtk_dsi_encoder_init(struct drm_device *drm, struct
> mtk_dsi *dsi)
> +{
> +	int ret;
> +
> +	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> +				      DRM_MODE_ENCODER_DSI);
> +	if (ret) {
> +		DRM_ERROR("Failed to encoder init to drm\n");
> +		return ret;
> +	}
> +
> +	dsi->encoder.possible_crtcs =
> mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> +
> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		goto err_cleanup_encoder;
> +
> +	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
> +	if (IS_ERR(dsi->connector)) {
> +		DRM_ERROR("Unable to create bridge connector\n");
> +		ret = PTR_ERR(dsi->connector);
> +		goto err_cleanup_encoder;
> +	}
> +	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> +
> +	return 0;
> +
> +err_cleanup_encoder:
> +	drm_encoder_cleanup(&dsi->encoder);
> +	return ret;
> +}
> +
> +static int mtk_dsi_bind(struct device *dev, struct device *master,
> void *data)
> +{
> +	int ret;
> +	struct drm_device *drm = data;
> +	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +
> +	ret = mtk_dsi_encoder_init(drm, dsi);
> +	if (ret)
> +		return ret;
> +
> +	return device_reset_optional(dev);
> +}
> +
> +static void mtk_dsi_unbind(struct device *dev, struct device
> *master,
> +			   void *data)
> +{
> +	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +
> +	drm_encoder_cleanup(&dsi->encoder);
> +}
> +
> +static const struct component_ops mtk_dsi_component_ops = {
> +	.bind = mtk_dsi_bind,
> +	.unbind = mtk_dsi_unbind,
> +};
> +
>  static int mtk_dsi_host_attach(struct mipi_dsi_host *host,
>  			       struct mipi_dsi_device *device)
>  {
>  	struct mtk_dsi *dsi = host_to_dsi(host);
> +	struct device *dev = host->dev;
> +	int ret;
>  
>  	dsi->lanes = device->lanes;
>  	dsi->format = device->format;
>  	dsi->mode_flags = device->mode_flags;
> +	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0,
> 0);
> +	if (IS_ERR(dsi->next_bridge))
> +		return PTR_ERR(dsi->next_bridge);
> +
> +	drm_bridge_add(&dsi->bridge);
> +
> +	ret = component_add(host->dev, &mtk_dsi_component_ops);
> +	if (ret) {
> +		DRM_ERROR("failed to add dsi_host component: %d\n",
> ret);
> +		drm_bridge_remove(&dsi->bridge);
> +		return ret;
> +	}
>  
>  	return 0;
>  }
>  
> +static int mtk_dsi_host_detach(struct mipi_dsi_host *host,
> +			       struct mipi_dsi_device *device)
> +{
> +	struct mtk_dsi *dsi = host_to_dsi(host);
> +
> +	component_del(host->dev, &mtk_dsi_component_ops);
> +	drm_bridge_remove(&dsi->bridge);
> +	return 0;
> +}
> +
>  static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
>  {
>  	int ret;
> @@ -938,73 +1021,14 @@ static ssize_t mtk_dsi_host_transfer(struct
> mipi_dsi_host *host,
>  
>  static const struct mipi_dsi_host_ops mtk_dsi_ops = {
>  	.attach = mtk_dsi_host_attach,
> +	.detach = mtk_dsi_host_detach,
>  	.transfer = mtk_dsi_host_transfer,
>  };
>  
> -static int mtk_dsi_encoder_init(struct drm_device *drm, struct
> mtk_dsi *dsi)
> -{
> -	int ret;
> -
> -	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> -				      DRM_MODE_ENCODER_DSI);
> -	if (ret) {
> -		DRM_ERROR("Failed to encoder init to drm\n");
> -		return ret;
> -	}
> -
> -	dsi->encoder.possible_crtcs =
> mtk_drm_find_possible_crtc_by_comp(drm, dsi->host.dev);
> -
> -	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> -				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret)
> -		goto err_cleanup_encoder;
> -
> -	dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
> -	if (IS_ERR(dsi->connector)) {
> -		DRM_ERROR("Unable to create bridge connector\n");
> -		ret = PTR_ERR(dsi->connector);
> -		goto err_cleanup_encoder;
> -	}
> -	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> -
> -	return 0;
> -
> -err_cleanup_encoder:
> -	drm_encoder_cleanup(&dsi->encoder);
> -	return ret;
> -}
> -
> -static int mtk_dsi_bind(struct device *dev, struct device *master,
> void *data)
> -{
> -	int ret;
> -	struct drm_device *drm = data;
> -	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> -
> -	ret = mtk_dsi_encoder_init(drm, dsi);
> -	if (ret)
> -		return ret;
> -
> -	return device_reset_optional(dev);
> -}
> -
> -static void mtk_dsi_unbind(struct device *dev, struct device
> *master,
> -			   void *data)
> -{
> -	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> -
> -	drm_encoder_cleanup(&dsi->encoder);
> -}
> -
> -static const struct component_ops mtk_dsi_component_ops = {
> -	.bind = mtk_dsi_bind,
> -	.unbind = mtk_dsi_unbind,
> -};
> -
>  static int mtk_dsi_probe(struct platform_device *pdev)
>  {
>  	struct mtk_dsi *dsi;
>  	struct device *dev = &pdev->dev;
> -	struct drm_panel *panel;
>  	struct resource *regs;
>  	int irq_num;
>  	int ret;
> @@ -1021,19 +1045,6 @@ static int mtk_dsi_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &dsi->next_bridge);
> -	if (ret)
> -		goto err_unregister_host;
> -
> -	if (panel) {
> -		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			ret = PTR_ERR(dsi->next_bridge);
> -			goto err_unregister_host;
> -		}
> -	}
> -
>  	dsi->driver_data = of_device_get_match_data(dev);
>  
>  	dsi->engine_clk = devm_clk_get(dev, "engine");
> @@ -1098,14 +1109,6 @@ static int mtk_dsi_probe(struct
> platform_device *pdev)
>  	dsi->bridge.of_node = dev->of_node;
>  	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>  
> -	drm_bridge_add(&dsi->bridge);
> -
> -	ret = component_add(&pdev->dev, &mtk_dsi_component_ops);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to add component: %d\n",
> ret);
> -		goto err_unregister_host;
> -	}
> -
>  	return 0;
>  
>  err_unregister_host:
> @@ -1118,8 +1121,6 @@ static int mtk_dsi_remove(struct
> platform_device *pdev)
>  	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
>  
>  	mtk_output_dsi_disable(dsi);
> -	drm_bridge_remove(&dsi->bridge);
> -	component_del(&pdev->dev, &mtk_dsi_component_ops);
>  	mipi_dsi_host_unregister(&dsi->host);
>  
>  	return 0;

