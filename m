Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54151B7CF5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 19:36:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFCA6EAEA;
	Fri, 24 Apr 2020 17:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E5C6EAE9;
 Fri, 24 Apr 2020 17:36:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8D65E80441;
 Fri, 24 Apr 2020 19:36:45 +0200 (CEST)
Date: Fri, 24 Apr 2020 19:36:44 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 45/59] drm/arc: Use drmm_mode_config_cleanup
Message-ID: <20200424173644.GC7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-46-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-46-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=65M9M8N3RcFnKj0IUwQA:9 a=CjuIK1q_8ugA:10
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

On Wed, Apr 15, 2020 at 09:40:20AM +0200, Daniel Vetter wrote:
> With autocleanup through drm_device management we can delete all the
> code. Possible now that there's no confusion against devm_kzalloc'ed
> structures anymore.
> 
> I inlined arcpgu_setup_mode_config because it's tiny and the newly
> needed return value handling would have been more ...
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/arc/arcpgu_crtc.c |  4 +---
>  drivers/gpu/drm/arc/arcpgu_drv.c  | 21 +++++++++------------
>  drivers/gpu/drm/arc/arcpgu_hdmi.c |  6 +-----
>  drivers/gpu/drm/arc/arcpgu_sim.c  | 11 ++---------
>  4 files changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> index 88ba2e284fc0..72719556debb 100644
> --- a/drivers/gpu/drm/arc/arcpgu_crtc.c
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -209,10 +209,8 @@ int arc_pgu_setup_crtc(struct drm_device *drm)
>  
>  	ret = drm_crtc_init_with_planes(drm, &arcpgu->pipe.crtc, primary, NULL,
>  					&arc_pgu_crtc_funcs, NULL);
> -	if (ret) {
> -		arc_pgu_plane_destroy(primary);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	drm_crtc_helper_add(&arcpgu->pipe.crtc, &arc_pgu_crtc_helper_funcs);
>  	return 0;
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index a419f279e129..40c9fc12d515 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -30,16 +30,6 @@ static const struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
>  	.atomic_commit = drm_atomic_helper_commit,
>  };
>  
> -static void arcpgu_setup_mode_config(struct drm_device *drm)
> -{
> -	drm_mode_config_init(drm);
> -	drm->mode_config.min_width = 0;
> -	drm->mode_config.min_height = 0;
> -	drm->mode_config.max_width = 1920;
> -	drm->mode_config.max_height = 1080;
> -	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
> -}
> -
>  DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
>  
>  static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
> @@ -54,7 +44,15 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  	if (IS_ERR(arcpgu->clk))
>  		return PTR_ERR(arcpgu->clk);
>  
> -	arcpgu_setup_mode_config(drm);
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +	drm->mode_config.max_width = 1920;
> +	drm->mode_config.max_height = 1080;
> +	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	arcpgu->regs = devm_ioremap_resource(&pdev->dev, res);
> @@ -108,7 +106,6 @@ static int arcpgu_unload(struct drm_device *drm)
>  {
>  	drm_kms_helper_poll_fini(drm);
>  	drm_atomic_helper_shutdown(drm);
> -	drm_mode_config_cleanup(drm);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> index dbad2c9237fe..925d6d31bb78 100644
> --- a/drivers/gpu/drm/arc/arcpgu_hdmi.c
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -39,9 +39,5 @@ int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
>  		return ret;
>  
>  	/* Link drm_bridge to encoder */
> -	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> -	if (ret)
> -		drm_encoder_cleanup(encoder);
> -
> -	return ret;
> +	return drm_bridge_attach(encoder, bridge, NULL, 0);
>  }
> diff --git a/drivers/gpu/drm/arc/arcpgu_sim.c b/drivers/gpu/drm/arc/arcpgu_sim.c
> index 3772df1647aa..afc34f8b4de0 100644
> --- a/drivers/gpu/drm/arc/arcpgu_sim.c
> +++ b/drivers/gpu/drm/arc/arcpgu_sim.c
> @@ -73,21 +73,14 @@ int arcpgu_drm_sim_init(struct drm_device *drm, struct device_node *np)
>  			DRM_MODE_CONNECTOR_VIRTUAL);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "failed to initialize drm connector\n");
> -		goto error_encoder_cleanup;
> +		return ret;
>  	}
>  
>  	ret = drm_connector_attach_encoder(connector, encoder);
>  	if (ret < 0) {
>  		dev_err(drm->dev, "could not attach connector to encoder\n");
> -		goto error_connector_cleanup;
> +		return ret;
>  	}
>  
>  	return 0;
> -
> -error_connector_cleanup:
> -	drm_connector_cleanup(connector);
> -
> -error_encoder_cleanup:
> -	drm_encoder_cleanup(encoder);
> -	return ret;
>  }
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
