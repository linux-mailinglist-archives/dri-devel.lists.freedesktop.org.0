Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D2224C5A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 17:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A746B6E0D8;
	Sat, 18 Jul 2020 15:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1A6E0D8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 15:15:41 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4310F80502;
 Sat, 18 Jul 2020 17:15:37 +0200 (CEST)
Date: Sat, 18 Jul 2020 17:15:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Suraj Upadhyay <usuraj35@gmail.com>
Subject: Re: [PATCH] drm: core: Convert device logging to drm_* functions.
Message-ID: <20200718151533.GA3007351@ravnborg.org>
References: <20200718145531.GA21897@blackclown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718145531.GA21897@blackclown>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=SuLMtiOAp9ftW2fYraIA:9
 a=Qe7UkSug8rnrQVf-:21 a=GJaodiu0WKfRVPWh:21 a=CjuIK1q_8ugA:10
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj.

On Sat, Jul 18, 2020 at 08:25:31PM +0530, Suraj Upadhyay wrote:
> Convert device logging with dev_* functions into drm_* functions.
> 
> The patch has been generated with the coccinelle script below.
> The script focuses on instances of dev_* functions where the drm device
> context is clearly visible in its arguments.
> 
> @@expression E1; expression list E2; @@
> -dev_warn(E1->dev, E2)
> +drm_warn(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_info(E1->dev, E2)
> +drm_info(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_err(E1->dev, E2)
> +drm_err(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_info_once(E1->dev, E2)
> +drm_info_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_notice_once(E1->dev, E2)
> +drm_notice_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_warn_once(E1->dev, E2)
> +drm_warn_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_err_once(E1->dev, E2)
> +drm_err_once(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_err_ratelimited(E1->dev, E2)
> +drm_err_ratelimited(E1, E2)
> 
> @@expression E1; expression list E2; @@
> -dev_dbg(E1->dev, E2)
> +drm_dbg_(E1, E2)
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/gpu/drm/drm_edid.c           | 6 ++----
>  drivers/gpu/drm/drm_gem_cma_helper.c | 4 ++--
>  drivers/gpu/drm/drm_mipi_dbi.c       | 7 +++----
>  3 files changed, 7 insertions(+), 10 deletions(-)

Looks good, coccinelle is a reliable way for such mass conversion.

When converting to new style logging then all logging should be
converted in a file. Maybe, if too much, split in two patches.
But for all three files there are logging remaining to be converted
so we would end up in several patch-sets before done.
Please try to extend the scripting to also cover DRM_ => drm_ logging.
You may need some manual adjustments to cover it all.

	Sam

> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 52b357e75c3d..6840f0530a38 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1844,9 +1844,7 @@ static void connector_bad_edid(struct drm_connector *connector,
>  	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
>  		return;
>  
> -	dev_warn(connector->dev->dev,
> -		 "%s: EDID is invalid:\n",
> -		 connector->name);
> +	drm_warn(connector->dev, "%s: EDID is invalid:\n", connector->name);
>  	for (i = 0; i < num_blocks; i++) {
>  		u8 *block = edid + i * EDID_LENGTH;
>  		char prefix[20];
> @@ -5298,7 +5296,7 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
>  	}
>  	if (!drm_edid_is_valid(edid)) {
>  		clear_eld(connector);
> -		dev_warn(connector->dev->dev, "%s: EDID invalid.\n",
> +		drm_warn(connector->dev, "%s: EDID invalid.\n",
>  			 connector->name);
>  		return 0;
>  	}
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 06a5b9ee1fe0..8d7408a78aee 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -105,8 +105,8 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
>  				      GFP_KERNEL | __GFP_NOWARN);
>  	if (!cma_obj->vaddr) {
> -		dev_dbg(drm->dev, "failed to allocate buffer with size %zu\n",
> -			size);
> +		drm_dbg_(drm, "failed to allocate buffer with size %zu\n",
> +			 size);
>  		ret = -ENOMEM;
>  		goto error;
>  	}
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 0e55d8716e3d..a7a611894243 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -225,9 +225,8 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  		drm_fb_xrgb8888_to_rgb565(dst, src, fb, clip, swap);
>  		break;
>  	default:
> -		dev_err_once(fb->dev->dev, "Format is not supported: %s\n",
> -			     drm_get_format_name(fb->format->format,
> -						 &format_name));
> +		drm_err_once(fb->dev, "Format is not supported: %s\n",
> +			     drm_get_format_name(fb->format->format, &format_name));
>  		return -EINVAL;
>  	}
>  
> @@ -295,7 +294,7 @@ static void mipi_dbi_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
>  				   width * height * 2);
>  err_msg:
>  	if (ret)
> -		dev_err_once(fb->dev->dev, "Failed to update display %d\n", ret);
> +		drm_err_once(fb->dev, "Failed to update display %d\n", ret);
>  
>  	drm_dev_exit(idx);
>  }
> -- 
> 2.17.1
> 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
