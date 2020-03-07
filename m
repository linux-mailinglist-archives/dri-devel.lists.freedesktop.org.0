Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE617CCDF
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116238977A;
	Sat,  7 Mar 2020 08:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDF58973E;
 Sat,  7 Mar 2020 08:37:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 65B7980528;
 Sat,  7 Mar 2020 09:37:14 +0100 (CET)
Date: Sat, 7 Mar 2020 09:37:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 35/51] drm/pl111: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200307083713.GE28810@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-36-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-36-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8
 a=ozePU4pyA5KAqHLl-MoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=srlwD-8ojaedGGhPAyx8:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:15PM +0100, Daniel Vetter wrote:
> It's right above the drm_dev_put().
> 
> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> 
> Aside: This driver gets its devm_ stuff all wrong wrt drm_device and
> anything hanging off that. Not the only one unfortunately.
> 
> v2: Explain why this cleanup is possible (Laurent).
> 
> v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/pl111/pl111_drv.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index aa8aa8d9e405..f9ca0f3edbbb 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -90,10 +90,13 @@ static int pl111_modeset_init(struct drm_device *dev)
>  	struct drm_panel *panel = NULL;
>  	struct drm_bridge *bridge = NULL;
>  	bool defer = false;
> -	int ret = 0;
> +	int ret;
>  	int i;
>  
> -	drm_mode_config_init(dev);
> +	ret = drmm_mode_config_init(dev);
> +	if (ret)
> +		return ret;
> +
>  	mode_config = &dev->mode_config;
>  	mode_config->funcs = &mode_config_funcs;
>  	mode_config->min_width = 1;
> @@ -154,7 +157,7 @@ static int pl111_modeset_init(struct drm_device *dev)
>  						    DRM_MODE_CONNECTOR_Unknown);
>  		if (IS_ERR(bridge)) {
>  			ret = PTR_ERR(bridge);
> -			goto out_config;
> +			goto finish;
>  		}
>  	} else if (bridge) {
>  		dev_info(dev->dev, "Using non-panel bridge\n");
> @@ -197,8 +200,6 @@ static int pl111_modeset_init(struct drm_device *dev)
>  out_bridge:
>  	if (panel)
>  		drm_panel_bridge_remove(bridge);
> -out_config:
> -	drm_mode_config_cleanup(dev);
>  finish:
>  	return ret;
>  }
> @@ -343,7 +344,6 @@ static int pl111_amba_remove(struct amba_device *amba_dev)
>  	drm_dev_unregister(drm);
>  	if (priv->panel)
>  		drm_panel_bridge_remove(priv->bridge);
> -	drm_mode_config_cleanup(drm);
>  	drm_dev_put(drm);
>  	of_reserved_mem_device_release(dev);
>  
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
