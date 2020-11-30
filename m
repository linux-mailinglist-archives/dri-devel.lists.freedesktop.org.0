Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C52C8251
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 11:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968A389CF8;
	Mon, 30 Nov 2020 10:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D189CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 10:38:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06909B26;
 Mon, 30 Nov 2020 11:38:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606732728;
 bh=tNlqFDieH6EVkNaDkuWQdrpNJJbZMVE4+smxPwBiXTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BbKLbutU9ObKAQR6OFQ5ox8TYRKV7tqeM/f7e9jQvMSIV1xJ+wli6rA1Zxb/f7U0k
 aG4xEakTNqMVEfhchpSjSyn4wBDWQfpORhWLQ7t9Ed+dN90UnMWiWf1t0jiKc5Olje
 ulc+SBP/YqMbRo1JRRoCxSj+sCW7m6yRB0qyxpao=
Date: Mon, 30 Nov 2020 12:38:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 1/5] drm: add legacy support for using degamma for gamma
Message-ID: <20201130103840.GR4141@pendragon.ideasonboard.com>
References: <20201103080310.164453-1-tomi.valkeinen@ti.com>
 <20201103080310.164453-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103080310.164453-2-tomi.valkeinen@ti.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sekhar Nori <nsekhar@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 03, 2020 at 10:03:06AM +0200, Tomi Valkeinen wrote:
> We currently have drm_atomic_helper_legacy_gamma_set() helper which can
> be used to handle legacy gamma-set ioctl.
> drm_atomic_helper_legacy_gamma_set() sets GAMMA_LUT, and clears
> CTM and DEGAMMA_LUT. This works fine on HW where we have either:
> 
> degamma -> ctm -> gamma -> out
> 
> or
> 
> ctm -> gamma -> out
> 
> However, if the HW has gamma table before ctm, the atomic property
> should be DEGAMMA_LUT, and thus we have:
> 
> degamma -> ctm -> out
> 
> This is fine for userspace which sets gamma table using the properties,
> as the userspace can check for the existence of gamma & degamma, but the
> legacy gamma-set ioctl does not work.
> 
> This patch adds a new helper, drm_atomic_helper_legacy_degamma_set(),
> which can be used instead of drm_atomic_helper_legacy_gamma_set() when
> the DEGAMMA_LUT is the underlying property that needs to be set.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 81 ++++++++++++++++++++++-------
>  include/drm/drm_atomic_helper.h     |  4 ++
>  2 files changed, 65 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ddd0e3239150..23cbed541dc7 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3499,24 +3499,11 @@ int drm_atomic_helper_page_flip_target(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
>  
> -/**
> - * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction table
> - * @crtc: CRTC object
> - * @red: red correction table
> - * @green: green correction table
> - * @blue: green correction table
> - * @size: size of the tables
> - * @ctx: lock acquire context
> - *
> - * Implements support for legacy gamma correction table for drivers
> - * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> - * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
> - * how the atomic color management and gamma tables work.
> - */
> -int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> -				       u16 *red, u16 *green, u16 *blue,
> -				       uint32_t size,
> -				       struct drm_modeset_acquire_ctx *ctx)
> +static int legacy_gamma_degamma_set(struct drm_crtc *crtc,
> +				    u16 *red, u16 *green, u16 *blue,
> +				    uint32_t size,
> +				    struct drm_modeset_acquire_ctx *ctx,
> +				    bool use_degamma)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	struct drm_atomic_state *state;
> @@ -3555,9 +3542,11 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  	}
>  
>  	/* Reset DEGAMMA_LUT and CTM properties. */
> -	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> +	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> +					      use_degamma ? blob : NULL);
>  	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> -	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> +	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> +					      use_degamma ? NULL : blob);
>  	crtc_state->color_mgmt_changed |= replaced;
>  
>  	ret = drm_atomic_commit(state);
> @@ -3567,8 +3556,60 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  	drm_property_blob_put(blob);
>  	return ret;
>  }
> +
> +/**
> + * drm_atomic_helper_legacy_gamma_set - set the legacy gamma correction table using gamma_lut
> + * @crtc: CRTC object
> + * @red: red correction table
> + * @green: green correction table
> + * @blue: green correction table
> + * @size: size of the tables
> + * @ctx: lock acquire context
> + *
> + * Implements support for legacy gamma correction table for drivers
> + * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> + * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
> + * how the atomic color management and gamma tables work.
> + *
> + * This function uses GAMMA_LUT property for the gamma table. This function

s/uses/uses the/
s/This function$/It/

Same below.

> + * can be used when the driver exposes either only GAMMA_LUT or both GAMMA_LUT
> + * and DEGAMMA_LUT.
> + */
> +int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
> +				       u16 *red, u16 *green, u16 *blue,
> +				       uint32_t size,
> +				       struct drm_modeset_acquire_ctx *ctx)
> +{
> +	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, false);
> +}

I wonder, would it make sense to make this automatic by setting the
degamma LUT when only the DEGAMMA_LUT property exists, and the gamma LUT
otherwise ? Are there use cases for drm_atomic_helper_legacy_degamma_set
for drivers that support both gamma and degamma ?

>  EXPORT_SYMBOL(drm_atomic_helper_legacy_gamma_set);
>  
> +/**
> + * drm_atomic_helper_legacy_degamma_set - set the legacy gamma correction table using degamma_lut
> + * @crtc: CRTC object
> + * @red: red correction table
> + * @green: green correction table
> + * @blue: green correction table
> + * @size: size of the tables
> + * @ctx: lock acquire context
> + *
> + * Implements support for legacy gamma correction table for drivers
> + * that support color management through the DEGAMMA_LUT/GAMMA_LUT
> + * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
> + * how the atomic color management and gamma tables work.
> + *
> + * This function uses DEGAMMA_LUT property for the gamma table. This function
> + * can be used when the driver exposes only DEGAMNMA_LUT.
> + */
> +int drm_atomic_helper_legacy_degamma_set(struct drm_crtc *crtc,
> +					 u16 *red, u16 *green, u16 *blue,
> +					 uint32_t size,
> +					 struct drm_modeset_acquire_ctx *ctx)
> +{
> +	return legacy_gamma_degamma_set(crtc, red, green, blue, size, ctx, true);
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_legacy_degamma_set);
> +
>  /**
>   * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format to
>   *						  the input end of a bridge
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 85df04c8e62f..561c78680388 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -151,6 +151,10 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  				       u16 *red, u16 *green, u16 *blue,
>  				       uint32_t size,
>  				       struct drm_modeset_acquire_ctx *ctx);
> +int drm_atomic_helper_legacy_degamma_set(struct drm_crtc *crtc,
> +					 u16 *red, u16 *green, u16 *blue,
> +					 uint32_t size,
> +					 struct drm_modeset_acquire_ctx *ctx);
>  
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently attached to CRTC

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
