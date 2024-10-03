Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174AA98F45E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043B510E1BA;
	Thu,  3 Oct 2024 16:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zg5wSMmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1117210E0DC;
 Thu,  3 Oct 2024 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727973933; x=1759509933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tc8ZRBn72E//NYmjdcKS3uGgJe6RwbMeom5LUAtkWN8=;
 b=Zg5wSMmMRRNcW+QdtjGqZjwNXsS1hZNRwC/iU82ITmg6gJ+pA3P9hbVP
 gMVYNcLx2yHrDy57J7J6CAfqn1hrkrcVuh8/nmI23XwkcuI6vpawekFz/
 VAgavnSCW0McelvPDQ0nQ7YjfcRFO2xgQmvHrqJUttaCbxwr2EDIVpfbn
 6q06jSOHtv3nT2Jj6sHuZTAlGbH4mM5wm4NxioaYPOw8u1lYEnPdY9i3y
 Vs+5ByrXXqB/R5y9shM39CsLXDkGV3a6ENK9YoqwGXKPm2wu7buo1Nc+Y
 s5q6OZbehwcwO5vnIjbk720t3CeCNJhIDCWQ7QhkGaBUTa3eEwqevueaZ w==;
X-CSE-ConnectionGUID: K5ceU9KhT+a57Y3dJ7FtPA==
X-CSE-MsgGUID: weWOd0k5SXKu/68sPlrPqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27270938"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="27270938"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 09:45:33 -0700
X-CSE-ConnectionGUID: 3FwYBUFNQtmw/L21EOao9g==
X-CSE-MsgGUID: AJo+slrfSzyW1Ox/eBsmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74527084"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 09:45:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 19:45:29 +0300
Date: Thu, 3 Oct 2024 19:45:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 4/8] drm/client: Make copies of modes
Message-ID: <Zv7KKZE95lfUNFdy@intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
 <20241003113304.11700-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241003113304.11700-5-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 03, 2024 at 02:33:00PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> drm_client_firmware_config() is currently picking up the current
> mode of the crtc via the legacy crtc->mode, which is not supposed
> to be used by atomic drivers at all. We can't simply switch over
> to the proper crtc->state->mode because we drop the crtc->mutex
> (which protects crtc->state) before the mode gets used.
> 
> The most straightforward solution to extend the lifetime of
> modes[] seem to be to make full copies of the modes instead
> of just storing pointers. We do have to replace the NULL checks
> with something else though. Checking that mode->clock!=0
> should be sufficient.
> 
> And with this we can undo also commit 3eadd887dbac
> ("drm/client:Fully protect modes[] with dev->mode_config.mutex")
> as the lifetime of modes[] no longer has anything to do with
> that lock.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 80 +++++++++++++++-------------
>  1 file changed, 43 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 888323137a6a..d413e119db3f 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -265,10 +265,15 @@ static void drm_client_connectors_enabled(struct drm_connector *connectors[],
>  		enabled[i] = drm_connector_enabled(connectors[i], false);
>  }
>  
> +static bool mode_valid(const struct drm_display_mode *mode)
> +{
> +	return mode->clock != 0;
> +}
> +
>  static bool drm_client_target_cloned(struct drm_device *dev,
>  				     struct drm_connector *connectors[],
>  				     unsigned int connector_count,
> -				     const struct drm_display_mode *modes[],
> +				     struct drm_display_mode modes[],
>  				     struct drm_client_offset offsets[],
>  				     bool enabled[], int width, int height)
>  {
> @@ -296,15 +301,16 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  	for (i = 0; i < connector_count; i++) {
>  		if (!enabled[i])
>  			continue;
> -		modes[i] = drm_connector_pick_cmdline_mode(connectors[i]);
> -		if (!modes[i]) {
> +
> +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connectors[i]));

Apparently this guy doesn't accept NULL, so this is oops central now.
I'll have to wrap these up a bit I guess.

> +		if (!mode_valid(&modes[i])) {
>  			can_clone = false;
>  			break;
>  		}
>  		for (j = 0; j < i; j++) {
>  			if (!enabled[j])
>  				continue;
> -			if (!drm_mode_match(modes[j], modes[i],
> +			if (!drm_mode_match(&modes[j], &modes[i],
>  					    DRM_MODE_MATCH_TIMINGS |
>  					    DRM_MODE_MATCH_CLOCK |
>  					    DRM_MODE_MATCH_FLAGS |
> @@ -335,9 +341,9 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  					   DRM_MODE_MATCH_CLOCK |
>  					   DRM_MODE_MATCH_FLAGS |
>  					   DRM_MODE_MATCH_3D_FLAGS))
> -				modes[i] = mode;
> +				drm_mode_copy(&modes[i], mode);
>  		}
> -		if (!modes[i])
> +		if (!mode_valid(&modes[i]))
>  			can_clone = false;
>  	}
>  	drm_mode_destroy(dev, dmt_mode);
> @@ -354,7 +360,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  static int drm_client_get_tile_offsets(struct drm_device *dev,
>  				       struct drm_connector *connectors[],
>  				       unsigned int connector_count,
> -				       const struct drm_display_mode *modes[],
> +				       const struct drm_display_mode modes[],
>  				       struct drm_client_offset offsets[],
>  				       int idx,
>  				       int h_idx, int v_idx)
> @@ -368,17 +374,17 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
>  		if (!connector->has_tile)
>  			continue;
>  
> -		if (!modes[i] && (h_idx || v_idx)) {
> +		if (!mode_valid(&modes[i]) && (h_idx || v_idx)) {
>  			drm_dbg_kms(dev,
>  				    "[CONNECTOR:%d:%s] no modes for connector tiled %d\n",
>  				    connector->base.id, connector->name, i);
>  			continue;
>  		}
>  		if (connector->tile_h_loc < h_idx)
> -			hoffset += modes[i]->hdisplay;
> +			hoffset += modes[i].hdisplay;
>  
>  		if (connector->tile_v_loc < v_idx)
> -			voffset += modes[i]->vdisplay;
> +			voffset += modes[i].vdisplay;
>  	}
>  	offsets[idx].x = hoffset;
>  	offsets[idx].y = voffset;
> @@ -389,7 +395,7 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
>  static bool drm_client_target_preferred(struct drm_device *dev,
>  					struct drm_connector *connectors[],
>  					unsigned int connector_count,
> -					const struct drm_display_mode *modes[],
> +					struct drm_display_mode modes[],
>  					struct drm_client_offset offsets[],
>  					bool enabled[], int width, int height)
>  {
> @@ -445,16 +451,16 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>  		}
>  
>  		mode_type = "cmdline";
> -		modes[i] = drm_connector_pick_cmdline_mode(connector);
> +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connector));
>  
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>  			mode_type = "preferred";
> -			modes[i] = drm_connector_preferred_mode(connector, width, height);
> +			drm_mode_copy(&modes[i], drm_connector_preferred_mode(connector, width, height));
>  		}
>  
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>  			mode_type = "first";
> -			modes[i] = drm_connector_first_mode(connector);
> +			drm_mode_copy(&modes[i], drm_connector_first_mode(connector));
>  		}
>  
>  		/*
> @@ -472,17 +478,17 @@ static bool drm_client_target_preferred(struct drm_device *dev,
>  			     connector->tile_v_loc == 0 &&
>  			     !drm_connector_get_tiled_mode(connector))) {
>  				mode_type = "non tiled";
> -				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> +				drm_mode_copy(&modes[i], drm_connector_fallback_non_tiled_mode(connector));
>  			} else {
>  				mode_type = "tiled";
> -				modes[i] = drm_connector_get_tiled_mode(connector);
> +				drm_mode_copy(&modes[i], drm_connector_get_tiled_mode(connector));
>  			}
>  		}
>  
> -		if (modes[i])
> +		if (mode_valid(&modes[i]))
>  			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] found %s mode: %s\n",
>  				    connector->base.id, connector->name,
> -				    mode_type, modes[i]->name);
> +				    mode_type, modes[i].name);
>  		else
>  			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] no mode found\n",
>  				    connector->base.id, connector->name);
> @@ -514,7 +520,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>  				 struct drm_connector *connectors[],
>  				 unsigned int connector_count,
>  				 struct drm_crtc *best_crtcs[],
> -				 const struct drm_display_mode *modes[],
> +				 const struct drm_display_mode modes[],
>  				 int n, int width, int height)
>  {
>  	struct drm_device *dev = client->dev;
> @@ -532,7 +538,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>  	best_crtcs[n] = NULL;
>  	best_score = drm_client_pick_crtcs(client, connectors, connector_count,
>  					   best_crtcs, modes, n + 1, width, height);
> -	if (modes[n] == NULL)
> +	if (!mode_valid(&modes[n]))
>  		return best_score;
>  
>  	crtcs = kcalloc(connector_count, sizeof(*crtcs), GFP_KERNEL);
> @@ -566,7 +572,7 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
>  			if (dev->mode_config.num_crtc > 1)
>  				continue;
>  
> -			if (!drm_mode_equal(modes[o], modes[n]))
> +			if (!drm_mode_equal(&modes[o], &modes[n]))
>  				continue;
>  		}
>  
> @@ -589,7 +595,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  				       struct drm_connector *connectors[],
>  				       unsigned int connector_count,
>  				       struct drm_crtc *crtcs[],
> -				       const struct drm_display_mode *modes[],
> +				       struct drm_display_mode modes[],
>  				       struct drm_client_offset offsets[],
>  				       bool enabled[], int width, int height)
>  {
> @@ -690,20 +696,20 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  		}
>  
>  		mode_type = "cmdline";
> -		modes[i] = drm_connector_pick_cmdline_mode(connector);
> +		drm_mode_copy(&modes[i], drm_connector_pick_cmdline_mode(connector));
>  
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>  			mode_type = "preferred";
> -			modes[i] = drm_connector_preferred_mode(connector, width, height);
> +			drm_mode_copy(&modes[i], drm_connector_preferred_mode(connector, width, height));
>  		}
>  
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>  			mode_type = "first";
> -			modes[i] = drm_connector_first_mode(connector);
> +			drm_mode_copy(&modes[i], drm_connector_first_mode(connector));
>  		}
>  
>  		/* last resort: use current mode */
> -		if (!modes[i]) {
> +		if (!mode_valid(&modes[i])) {
>  			/*
>  			 * IMPORTANT: We want to use the adjusted mode (i.e.
>  			 * after the panel fitter upscaling) as the initial
> @@ -716,7 +722,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			 * fastboot check to work correctly.
>  			 */
>  			mode_type = "current";
> -			modes[i] = &connector->state->crtc->mode;
> +			drm_mode_copy(&modes[i], &connector->state->crtc->mode);
>  		}
>  
>  		/*
> @@ -726,14 +732,14 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  		if (connector->has_tile &&
>  		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
>  			mode_type = "non tiled";
> -			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
> +			drm_mode_copy(&modes[i], drm_connector_fallback_non_tiled_mode(connector));
>  		}
>  		crtcs[i] = new_crtc;
>  
>  		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
>  			    connector->base.id, connector->name,
>  			    new_crtc->base.id, new_crtc->name,
> -			    mode_type, modes[i]->name);
> +			    mode_type, modes[i].name);
>  
>  		fallback = false;
>  		conn_configured |= BIT(i);
> @@ -789,8 +795,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	unsigned int total_modes_count = 0;
>  	struct drm_client_offset *offsets;
>  	unsigned int connector_count = 0;
> -	/* points to modes protected by mode_config.mutex */
> -	const struct drm_display_mode **modes;
> +	struct drm_display_mode *modes;
>  	struct drm_crtc **crtcs;
>  	int i, ret = 0;
>  	bool *enabled;
> @@ -858,10 +863,12 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  				      crtcs, modes, 0, width, height);
>  	}
>  
> +	mutex_unlock(&dev->mode_config.mutex);
> +
>  	drm_client_modeset_release(client);
>  
>  	for (i = 0; i < connector_count; i++) {
> -		const struct drm_display_mode *mode = modes[i];
> +		const struct drm_display_mode *mode = &modes[i];
>  		struct drm_crtc *crtc = crtcs[i];
>  		struct drm_client_offset *offset = &offsets[i];
>  
> @@ -892,7 +899,6 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  			modeset->y = offset->y;
>  		}
>  	}
> -	mutex_unlock(&dev->mode_config.mutex);
>  
>  	mutex_unlock(&client->modeset_mutex);
>  out:
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
