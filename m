Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5A2CF6CD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA3C6EC7F;
	Fri,  4 Dec 2020 22:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E646EC7F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:35:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72AB099A;
 Fri,  4 Dec 2020 23:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607121326;
 bh=FHDbG/7LBf8MO8jzePDFNh0nvzuU1jsEA+D582NnGXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3mM5YKJAPFGtkeMZYWxkbgX6THbAJw38pCpO9Vjd0SCkoi+L6tzY93yu/E7GtDSU
 LkHwtWktYmd1pct3VyLl5rAqXRmXtjHRjlqFyH7NtAd+X2ZT3N2YmhSqvjRbonR73r
 Ly5ihDF8xG7TAJHI/SWk1GbGS74E0G+CWMy1S66o=
Date: Sat, 5 Dec 2020 00:35:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH 1/2] drm: add legacy support for using degamma for gamma
Message-ID: <20201204223525.GJ4109@pendragon.ideasonboard.com>
References: <20201203114845.232911-1-tomi.valkeinen@ti.com>
 <20201203114845.232911-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203114845.232911-2-tomi.valkeinen@ti.com>
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
 Russell King <linux@armlinux.org.uk>, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandre Torgue <alexandre.torgue@st.com>, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Thu, Dec 03, 2020 at 01:48:44PM +0200, Tomi Valkeinen wrote:
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
> This patch fixes the issue by changing
> drm_atomic_helper_legacy_gamma_set() so that GAMMA_LUT will be used if
> it exists, and DEGAMMA_LUT will be used as a fallback.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++++++++---
>  drivers/gpu/drm/drm_color_mgmt.c    |  4 ++++
>  include/drm/drm_crtc.h              |  3 +++
>  3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ba1507036f26..fe59c8ea42a9 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3512,6 +3512,10 @@ EXPORT_SYMBOL(drm_atomic_helper_page_flip_target);
>   * that support color management through the DEGAMMA_LUT/GAMMA_LUT
>   * properties. See drm_crtc_enable_color_mgmt() and the containing chapter for
>   * how the atomic color management and gamma tables work.
> + *
> + * This function uses the GAMMA_LUT or DEGAMMA_LUT property for the gamma table.
> + * GAMMA_LUT property is used if it exists, and DEGAMMA_LUT property is used as
> + * a fallback.
>   */
>  int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  				       u16 *red, u16 *green, u16 *blue,
> @@ -3525,6 +3529,12 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  	struct drm_color_lut *blob_data;
>  	int i, ret = 0;
>  	bool replaced;
> +	bool use_degamma;
> +
> +	if (!crtc->has_gamma_prop && !crtc->has_degamma_prop)
> +		return -ENODEV;
> +
> +	use_degamma = !crtc->has_gamma_prop;
>  
>  	state = drm_atomic_state_alloc(crtc->dev);
>  	if (!state)
> @@ -3554,10 +3564,12 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_crtc *crtc,
>  		goto fail;
>  	}
>  
> -	/* Reset DEGAMMA_LUT and CTM properties. */
> -	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut, NULL);
> +	/* Set GAMMA/DEGAMMA_LUT and reset DEGAMMA/GAMMA_LUT and CTM */
> +	replaced  = drm_property_replace_blob(&crtc_state->degamma_lut,
> +					      use_degamma ? blob : NULL);
>  	replaced |= drm_property_replace_blob(&crtc_state->ctm, NULL);
> -	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut, blob);
> +	replaced |= drm_property_replace_blob(&crtc_state->gamma_lut,
> +					      use_degamma ? NULL : blob);
>  	crtc_state->color_mgmt_changed |= replaced;
>  
>  	ret = drm_atomic_commit(state);
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 3bcabc2f6e0e..956e59d5f6a7 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -176,6 +176,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  					   degamma_lut_size);
>  	}
>  
> +	crtc->has_degamma_prop = !!degamma_lut_size;
> +
>  	if (has_ctm)
>  		drm_object_attach_property(&crtc->base,
>  					   config->ctm_property, 0);
> @@ -187,6 +189,8 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  					   config->gamma_lut_size_property,
>  					   gamma_lut_size);
>  	}
> +
> +	crtc->has_gamma_prop = !!gamma_lut_size;
>  }
>  EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
>  
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index ba839e5e357d..9e1f06047e3d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1084,6 +1084,9 @@ struct drm_crtc {
>  	 */
>  	uint16_t *gamma_store;
>  
> +	bool has_gamma_prop;
> +	bool has_degamma_prop;

We could use a bitfield to save a bit of memory. Apart from that, the
patch looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	/** @helper_private: mid-layer private data */
>  	const struct drm_crtc_helper_funcs *helper_private;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
