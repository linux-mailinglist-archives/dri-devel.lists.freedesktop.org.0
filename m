Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A891817C6E7
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C1A6E047;
	Fri,  6 Mar 2020 20:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECDB6E22D;
 Fri,  6 Mar 2020 20:17:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E3EC620020;
 Fri,  6 Mar 2020 21:17:04 +0100 (CET)
Date: Fri, 6 Mar 2020 21:17:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 31/51] drm/ingenic: Drop explicit drm_mode_config_cleanup
 call
Message-ID: <20200306201703.GD13014@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-32-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-32-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=ER_8r6IbAAAA:8 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=xbIEtOxnbT7NxrHFxKAA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=9LHmKk7ezEChjTCyhBa9:22
 a=D0XLA9XvdZm18NrgonBM:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:11PM +0100, Daniel Vetter wrote:
> Allows us to drop the drm_driver.release callback.
> 
> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> 
> v2: Explain why this cleanup is possible (Laurent).
> 
> v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net> (v2)
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Paul Cercueil <paul@crapouillou.net>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 192aaa4421a3..a9bc6623b488 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -489,11 +489,6 @@ static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
>  	return IRQ_HANDLED;
>  }
>  
> -static void ingenic_drm_release(struct drm_device *drm)
> -{
> -	drm_mode_config_cleanup(drm);
> -}
> -
>  static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
> @@ -537,7 +532,6 @@ static struct drm_driver ingenic_drm_driver_data = {
>  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
>  
>  	.irq_handler		= ingenic_drm_irq_handler,
> -	.release		= ingenic_drm_release,
>  };
>  
>  static const struct drm_plane_funcs ingenic_drm_primary_plane_funcs = {
> @@ -638,7 +632,10 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  	}
>  	drmm_add_final_kfree(drm, priv);
>  
> -	drm_mode_config_init(drm);
> +	ret = drmm_mode_config_init(drm);
> +	if (ret)
> +		return ret;
> +
>  	drm->mode_config.min_width = 0;
>  	drm->mode_config.min_height = 0;
>  	drm->mode_config.max_width = soc_info->max_width;
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
