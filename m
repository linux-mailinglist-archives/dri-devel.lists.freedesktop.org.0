Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 676D3240C77
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 19:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1787789DAB;
	Mon, 10 Aug 2020 17:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2206689DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 17:56:42 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6A14120023;
 Mon, 10 Aug 2020 19:56:40 +0200 (CEST)
Date: Mon, 10 Aug 2020 19:56:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: drop panel attach/detach
Message-ID: <20200810175639.GD292825@ravnborg.org>
References: <20200721130650.27926-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721130650.27926-1-p.zabel@pengutronix.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=K6iLUqu9aKYywmrrQYcA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp.

On Tue, Jul 21, 2020 at 03:06:50PM +0200, Philipp Zabel wrote:
> The drm_panel_attach/detach() functions are empty since
> commit aa6c43644bc5 ("drm/panel: drop drm_device from drm_panel"),
> remove them.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

We ended up removing them all in one go. So they are now gone in
drm-misc-next and you can skip this patch.

	Sam

> ---
>  drivers/gpu/drm/imx/imx-ldb.c          | 10 ----------
>  drivers/gpu/drm/imx/parallel-display.c |  6 ------
>  2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> index 8791d60be92e..af757d1e21fe 100644
> --- a/drivers/gpu/drm/imx/imx-ldb.c
> +++ b/drivers/gpu/drm/imx/imx-ldb.c
> @@ -455,13 +455,6 @@ static int imx_ldb_register(struct drm_device *drm,
>  		drm_connector_attach_encoder(&imx_ldb_ch->connector, encoder);
>  	}
>  
> -	if (imx_ldb_ch->panel) {
> -		ret = drm_panel_attach(imx_ldb_ch->panel,
> -				       &imx_ldb_ch->connector);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	return 0;
>  }
>  
> @@ -702,9 +695,6 @@ static void imx_ldb_unbind(struct device *dev, struct device *master,
>  	for (i = 0; i < 2; i++) {
>  		struct imx_ldb_channel *channel = &imx_ldb->channel[i];
>  
> -		if (channel->panel)
> -			drm_panel_detach(channel->panel);
> -
>  		kfree(channel->edid);
>  		i2c_put_adapter(channel->ddc);
>  	}
> diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> index a831b5bd1613..8232f512b9ed 100644
> --- a/drivers/gpu/drm/imx/parallel-display.c
> +++ b/drivers/gpu/drm/imx/parallel-display.c
> @@ -289,9 +289,6 @@ static int imx_pd_register(struct drm_device *drm,
>  				   DRM_MODE_CONNECTOR_DPI);
>  	}
>  
> -	if (imxpd->panel)
> -		drm_panel_attach(imxpd->panel, &imxpd->connector);
> -
>  	if (imxpd->next_bridge) {
>  		ret = drm_bridge_attach(encoder, imxpd->next_bridge,
>  					&imxpd->bridge, 0);
> @@ -357,9 +354,6 @@ static void imx_pd_unbind(struct device *dev, struct device *master,
>  {
>  	struct imx_parallel_display *imxpd = dev_get_drvdata(dev);
>  
> -	if (imxpd->panel)
> -		drm_panel_detach(imxpd->panel);
> -
>  	kfree(imxpd->edid);
>  }
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
