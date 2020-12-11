Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6A12D74EE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 12:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A0C6EDB7;
	Fri, 11 Dec 2020 11:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3AC6EDB7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 11:52:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A92C099;
 Fri, 11 Dec 2020 12:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607687560;
 bh=9ZfW5C9E+ZdottH4LTXN+lvDEsBjHUbQUsb5kugqImk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DHzg1Lh3pTBaCXs7G9WRNEiW9r1c2g/jSOlq8wItGWPneUIMdLufoffHI0nmPS84K
 We4Ftw4q/BywClh1nCcxZNN2Y7nDQL5+W2fl3C8F+jpar28rSibP/ZaYsVURdzqZ5E
 GJrzaIT4hfiLzxmSy1OfflVm7MbX47ZV2xSlnUtA=
Date: Fri, 11 Dec 2020 13:52:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 2/2] drm: add legacy support for using degamma for gamma
Message-ID: <X9Ndg/S+dLKG4LY0@pendragon.ideasonboard.com>
References: <20201211114237.213288-1-tomi.valkeinen@ti.com>
 <20201211114237.213288-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201211114237.213288-3-tomi.valkeinen@ti.com>
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
Cc: Yannick Fertre <yannick.fertre@st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Philippe Cornu <philippe.cornu@st.com>, David Airlie <airlied@linux.ie>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Dec 11, 2020 at 01:42:37PM +0200, Tomi Valkeinen wrote:
> The DRM core handles legacy gamma-set ioctl by setting GAMMA_LUT and
> clearing CTM and DEGAMMA_LUT.
> 
> This works fine on HW where we have either:
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
> Change the DRM core to use DEGAMMA_LUT instead of GAMMA_LUT when the
> latter is unavailable.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 22 ++++++++++++++++++----
>  drivers/gpu/drm/drm_fb_helper.c  |  5 +++++
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 65eb36dc92bf..9100aac1570c 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -91,7 +91,7 @@
>   *
>   * There is also support for a legacy gamma table, which is set up by calling
>   * drm_mode_crtc_set_gamma_size(). The DRM core will then alias the legacy gamma
> - * ramp with "GAMMA_LUT".
> + * ramp with "GAMMA_LUT" or, if that is unavailable, "DEGAMMA_LUT".
>   *
>   * Support for different non RGB color encodings is controlled through
>   * &drm_plane specific COLOR_ENCODING and COLOR_RANGE properties. They
> @@ -238,6 +238,7 @@ EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
>  static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
>  {
>  	uint32_t gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
> +	uint32_t degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
>  
>  	if (!crtc->gamma_size)
>  		return false;
> @@ -245,7 +246,8 @@ static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
>  	if (crtc->funcs->gamma_set)
>  		return true;
>  
> -	return !!drm_mode_obj_find_prop_id(&crtc->base, gamma_id);
> +	return !!(drm_mode_obj_find_prop_id(&crtc->base, gamma_id) ||
> +		  drm_mode_obj_find_prop_id(&crtc->base, degamma_id));
>  }
>  
>  /**
> @@ -276,12 +278,22 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_property_blob *blob;
>  	struct drm_color_lut *blob_data;
> +	uint32_t gamma_id = dev->mode_config.gamma_lut_property->base.id;
> +	uint32_t degamma_id = dev->mode_config.degamma_lut_property->base.id;
> +	bool use_gamma_lut;
>  	int i, ret = 0;
>  	bool replaced;
>  
>  	if (crtc->funcs->gamma_set)
>  		return crtc->funcs->gamma_set(crtc, red, green, blue, size, ctx);
>  
> +	if (drm_mode_obj_find_prop_id(&crtc->base, gamma_id))
> +		use_gamma_lut = true;
> +	else if (drm_mode_obj_find_prop_id(&crtc->base, degamma_id))
> +		use_gamma_lut = false;
> +	else
> +		return -ENODEV;
> +
>  	state = drm_atomic_state_alloc(crtc->dev);
>  	if (!state)
>  		return -ENOMEM;
> @@ -311,9 +323,11 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
>  	}
>  
>  	/* Set GAMMA_LUT and reset DEGAMMA_LUT and CTM */
> -	replaced = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> +	replaced = drm_property_replace_blob(&crtc_state->degamma_lut,
> +					     use_gamma_lut ? NULL : blob);
>  	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> -	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> +	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> +					      use_gamma_lut ? blob : NULL);
>  	crtc_state->color_mgmt_changed |= replaced;
>  
>  	ret = drm_atomic_commit(state);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index e82db0f4e771..5ad19785daee 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1059,6 +1059,11 @@ static int setcmap_atomic(struct fb_cmap *cmap, struct fb_info *info)
>  			goto out_state;
>  		}
>  
> +		/*
> +		 * FIXME: This always uses gamma_lut. Some HW have only
> +		 * degamma_lut, in which case we should reset gamma_lut and set
> +		 * degamma_lut. See drm_crtc_legacy_gamma_set().
> +		 */
>  		replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
>  						      NULL);
>  		replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
