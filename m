Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A6E1B7D5C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741826EAF4;
	Fri, 24 Apr 2020 17:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A5736EAF4;
 Fri, 24 Apr 2020 17:58:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id C06B22002B;
 Fri, 24 Apr 2020 19:58:56 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:58:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 52/59] drm/arc: Initialize sim connector before display
 pipe
Message-ID: <20200424175855.GI7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-53-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-53-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=WosIhOD7gOwpm3RTG3EA:9 a=CjuIK1q_8ugA:10
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:27AM +0200, Daniel Vetter wrote:
> That way we can get rid of this final piece of init code, and use the
> simple pipe helpers as intended.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

One nit below, with this addressed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c | 51 ++++++++++----------------------
>  1 file changed, 16 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index b0c941d91545..857812f25bec 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -95,32 +95,11 @@ static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>  };
>  
> -static int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
> +static int arcpgu_drm_sim_init(struct drm_device *drm, struct drm_connector *connector)
>  {
> -	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
> -	struct drm_encoder *encoder;
> -	struct drm_connector *connector;
> -	int ret;
> -
> -	encoder = &arcpgu->pipe.encoder;
> -
> -	connector = &arcpgu->sim_conn;
>  	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
> -
> -	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
> +	return drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
>  			DRM_MODE_CONNECTOR_VIRTUAL);

Please fix indent.

> -	if (ret < 0) {
> -		dev_err(drm->dev, "failed to initialize drm connector\n");
> -		return ret;
> -	}
> -
> -	ret = drm_connector_attach_encoder(connector, encoder);
> -	if (ret < 0) {
> -		dev_err(drm->dev, "could not attach connector to encoder\n");
> -		return ret;
> -	}
> -
> -	return 0;
>  }
>  
>  #define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
> @@ -273,6 +252,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  {
>  	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
>  	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
> +	struct drm_connector *connector = NULL;
>  	struct drm_device *drm = &arcpgu->drm;
>  	struct resource *res;
>  	int ret;
> @@ -307,13 +287,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
>  		return -ENODEV;
>  
> -	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
> -					   arc_pgu_supported_formats,
> -					   ARRAY_SIZE(arc_pgu_supported_formats),
> -					   NULL, NULL);
> -	if (ret)
> -		return ret;
> -
>  	/*
>  	 * There is only one output port inside each device. It is linked with
>  	 * encoder endpoint.
> @@ -322,8 +295,21 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	if (endpoint_node) {
>  		encoder_node = of_graph_get_remote_port_parent(endpoint_node);
>  		of_node_put(endpoint_node);
> +	} else {
> +		connector = &arcpgu->sim_conn;
> +		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
> +		ret = arcpgu_drm_sim_init(drm, connector);
> +		if (ret < 0)
> +			return ret;
>  	}
>  
> +	ret = drm_simple_display_pipe_init(drm, &arcpgu->pipe, &arc_pgu_pipe_funcs,
> +					   arc_pgu_supported_formats,
> +					   ARRAY_SIZE(arc_pgu_supported_formats),
> +					   NULL, connector);
> +	if (ret)
> +		return ret;
> +
>  	if (encoder_node) {
>  		struct drm_bridge *bridge;
>  
> @@ -335,11 +321,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  		ret = drm_simple_display_pipe_attach_bridge(&arcpgu->pipe, bridge);
>  		if (ret)
>  			return ret;
> -	} else {
> -		dev_info(drm->dev, "no encoder found. Assumed virtual LCD on simulation platform\n");
> -		ret = arcpgu_drm_sim_init(drm, NULL);
> -		if (ret < 0)
> -			return ret;
>  	}
>  
>  	drm_mode_config_reset(drm);
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
