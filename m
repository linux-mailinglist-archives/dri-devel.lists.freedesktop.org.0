Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAED1B7D91
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 20:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CDF6EAFF;
	Fri, 24 Apr 2020 18:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C536EAFF;
 Fri, 24 Apr 2020 18:10:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5651220035;
 Fri, 24 Apr 2020 20:10:03 +0200 (CEST)
Date: Fri, 24 Apr 2020 20:10:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 56/59] drm/aspeed: Use managed drmm_mode_config_cleanup
Message-ID: <20200424181002.GL7074@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-57-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-57-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=CSi-g0QDi58lmbhQoQkA:9
 a=CjuIK1q_8ugA:10 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Joel Stanley <joel@jms.id.au>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:31AM +0200, Daniel Vetter wrote:
> Since aspeed doesn't use devm_kzalloc anymore we can use the managed
> mode config cleanup.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org

Hmm, the helper function makes no sense, maybe embed it?

One Q below. Whith Q addressed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 6b27242b9ee3..6e464b84a256 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -63,15 +63,15 @@ static const struct drm_mode_config_funcs aspeed_gfx_mode_config_funcs = {
>  	.atomic_commit		= drm_atomic_helper_commit,
>  };
>  
> -static void aspeed_gfx_setup_mode_config(struct drm_device *drm)
> +static int aspeed_gfx_setup_mode_config(struct drm_device *drm)
>  {
> -	drm_mode_config_init(drm);
> -
>  	drm->mode_config.min_width = 0;
>  	drm->mode_config.min_height = 0;
>  	drm->mode_config.max_width = 800;
>  	drm->mode_config.max_height = 600;
>  	drm->mode_config.funcs = &aspeed_gfx_mode_config_funcs;
> +
> +	return drmm_mode_config_init(drm);

I do not see anything that documents that it is OK to init min/max
width/heigh not funcs before drmm_mode_config_init() is called.
Maybe drmm_mode_config_init() gain an memset(drm->mode_config),
and we loose all the assingments from before the call to init().

Also most (all?) other users of drmm_mode_config_init()
set them after the call to drmm_mode_config_init().
So re-order here and then embed while you are touching the code again.

	Sam

>  }
>  
>  static irqreturn_t aspeed_gfx_irq_handler(int irq, void *data)
> @@ -144,7 +144,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  	writel(0, priv->base + CRT_CTRL1);
>  	writel(0, priv->base + CRT_CTRL2);
>  
> -	aspeed_gfx_setup_mode_config(drm);
> +	ret = aspeed_gfx_setup_mode_config(drm);
> +	if (ret < 0)
> +		return ret;
>  
>  	ret = drm_vblank_init(drm, 1);
>  	if (ret < 0) {
> @@ -181,7 +183,6 @@ static int aspeed_gfx_load(struct drm_device *drm)
>  static void aspeed_gfx_unload(struct drm_device *drm)
>  {
>  	drm_kms_helper_poll_fini(drm);
> -	drm_mode_config_cleanup(drm);
>  }
>  
>  DEFINE_DRM_GEM_CMA_FOPS(fops);
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
