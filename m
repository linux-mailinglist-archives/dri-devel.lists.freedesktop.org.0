Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B47724730
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 17:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD83610E36D;
	Tue,  6 Jun 2023 15:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B1010E36D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 15:04:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BC9AAB;
 Tue,  6 Jun 2023 17:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686063837;
 bh=/PaCRmtNOcr8hibrXrsg/hRLj2R4j601afKjYK1t0y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbJkxTnUPwfR8HE/BqHkmk43N1diU6HUkxGaPj4NZRkfud7s9Mhn3Um+hUAyXSiQ4
 qSefCEo93oRgksIMOrNMRrVLx5lzKR2uKu7cLY70OqtR9U3f/doWihovNS2Qscnxk2
 OTDFGxQusZcUnfiBXkALwrwih2xmmSuNOLuDS1dA=
Date: Tue, 6 Jun 2023 18:04:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 8/8] drm: Remove usage of deprecated DRM_DEBUG_KMS
Message-ID: <20230606150419.GI5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <35bd95856a69f141640c27ea2b5e4073275032f7.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35bd95856a69f141640c27ea2b5e4073275032f7.1686047727.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:15:22PM +0530, Siddh Raman Pant wrote:
> drm_print.h says DRM_DEBUG_KMS is deprecated in favor of
> drm_dbg_kms().
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 112 +++++++++++++++------------
>  drivers/gpu/drm/drm_color_mgmt.c     |   4 +-
>  drivers/gpu/drm/drm_connector.c      |  21 ++---
>  drivers/gpu/drm/drm_crtc.c           |  36 ++++-----
>  drivers/gpu/drm/drm_crtc_helper.c    |  54 ++++++-------
>  drivers/gpu/drm/drm_debugfs_crc.c    |   5 +-
>  drivers/gpu/drm/drm_displayid.c      |   4 +-
>  drivers/gpu/drm/drm_edid.c           |  17 ++--
>  drivers/gpu/drm/drm_lease.c          |   2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c       |   7 +-
>  drivers/gpu/drm/drm_modes.c          |  10 +--
>  drivers/gpu/drm/drm_plane.c          |  32 ++++----
>  drivers/gpu/drm/drm_probe_helper.c   |  39 +++++-----
>  drivers/gpu/drm/drm_rect.c           |   4 +-
>  drivers/gpu/drm/drm_sysfs.c          |   8 +-
>  15 files changed, 187 insertions(+), 168 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index e2403b8c6347..4e08ae688b83 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -242,8 +242,9 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
>  	for (i = 0; i < connector_count; i++) {
>  		connector = connectors[i];
>  		enabled[i] = drm_connector_enabled(connector, true);
> -		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
> -			      connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
> +		drm_dbg_kms(connector->dev, "connector %d enabled? %s\n",
> +			    connector->base.id,
> +			    connector->display_info.non_desktop ? "non desktop" : str_yes_no(enabled[i]));
>  
>  		any_enabled |= enabled[i];
>  	}
> @@ -303,7 +304,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  	}
>  
>  	if (can_clone) {
> -		DRM_DEBUG_KMS("can clone using command line\n");
> +		drm_dbg_kms(dev, "can clone using command line\n");
>  		return true;
>  	}
>  
> @@ -328,7 +329,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  	}
>  
>  	if (can_clone) {
> -		DRM_DEBUG_KMS("can clone using 1024x768\n");
> +		drm_dbg_kms(dev, "can clone using 1024x768\n");
>  		return true;
>  	}
>  	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
> @@ -352,8 +353,9 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
>  			continue;
>  
>  		if (!modes[i] && (h_idx || v_idx)) {
> -			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
> -				      connector->base.id);
> +			drm_dbg_kms(connector->dev,
> +				    "no modes for connector tiled %d %d\n",
> +				    i, connector->base.id);
>  			continue;
>  		}
>  		if (connector->tile_h_loc < h_idx)
> @@ -364,7 +366,8 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
>  	}
>  	offsets[idx].x = hoffset;
>  	offsets[idx].y = voffset;
> -	DRM_DEBUG_KMS("returned %d %d for %d %d\n", hoffset, voffset, h_idx, v_idx);
> +	drm_dbg_kms(NULL, "returned %d %d for %d %d\n",
> +		    hoffset, voffset, h_idx, v_idx);
>  	return 0;
>  }
>  
> @@ -421,14 +424,16 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
>  			drm_client_get_tile_offsets(connectors, connector_count, modes, offsets, i,
>  						    connector->tile_h_loc, connector->tile_v_loc);
>  		}
> -		DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
> -			      connector->base.id);
> +		drm_dbg_kms(connector->dev,
> +			    "looking for cmdline mode on connector %d\n",
> +			    connector->base.id);
>  
>  		/* got for command line mode first */
>  		modes[i] = drm_connector_pick_cmdline_mode(connector);
>  		if (!modes[i]) {
> -			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
> -				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
> +			drm_dbg_kms(connector->dev,
> +				    "looking for preferred mode on connector %d %d\n",
> +				    connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
>  			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
>  		}
>  		/* No preferred modes, pick one off the list */
> @@ -450,16 +455,17 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
>  			    (connector->tile_h_loc == 0 &&
>  			     connector->tile_v_loc == 0 &&
>  			     !drm_connector_get_tiled_mode(connector))) {
> -				DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
> -					      connector->base.id);
> +				drm_dbg_kms(connector->dev,
> +					    "Falling back to non tiled mode on Connector %d\n",
> +					    connector->base.id);
>  				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
>  			} else {
>  				modes[i] = drm_connector_get_tiled_mode(connector);
>  			}
>  		}
>  
> -		DRM_DEBUG_KMS("found mode %s\n", modes[i] ? modes[i]->name :
> -			  "none");
> +		drm_dbg_kms(connector->dev, "found mode %s\n",
> +			    modes[i] ? modes[i]->name : "none");
>  		conn_configured |= BIT_ULL(i);
>  	}
>  
> @@ -619,15 +625,17 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			num_connectors_detected++;
>  
>  		if (!enabled[i]) {
> -			DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
> -				      connector->name);
> +			drm_dbg_kms(connector->dev,
> +				    "connector %s not enabled, skipping\n",
> +				    connector->name);
>  			conn_configured |= BIT(i);
>  			continue;
>  		}
>  
>  		if (connector->force == DRM_FORCE_OFF) {
> -			DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
> -				      connector->name);
> +			drm_dbg_kms(connector->dev,
> +				    "connector %s is disabled by user, skipping\n",
> +				    connector->name);
>  			enabled[i] = false;
>  			continue;
>  		}
> @@ -637,8 +645,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			if (connector->force > DRM_FORCE_OFF)
>  				goto bail;
>  
> -			DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
> -				      connector->name);
> +			drm_dbg_kms(connector->dev,
> +				    "connector %s has no encoder or crtc, skipping\n",
> +				    connector->name);
>  			enabled[i] = false;
>  			conn_configured |= BIT(i);
>  			continue;
> @@ -655,28 +664,32 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  		 */
>  		for (j = 0; j < count; j++) {
>  			if (crtcs[j] == new_crtc) {
> -				DRM_DEBUG_KMS("fallback: cloned configuration\n");
> +				drm_dbg_kms(connector->dev,
> +					    "fallback: cloned configuration\n");
>  				goto bail;
>  			}
>  		}
>  
> -		DRM_DEBUG_KMS("looking for cmdline mode on connector %s\n",
> -			      connector->name);
> +		drm_dbg_kms(connector->dev,
> +			    "looking for cmdline mode on connector %s\n",
> +			    connector->name);
>  
>  		/* go for command line mode first */
>  		modes[i] = drm_connector_pick_cmdline_mode(connector);
>  
>  		/* try for preferred next */
>  		if (!modes[i]) {
> -			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
> -				      connector->name, connector->has_tile);
> +			drm_dbg_kms(connector->dev,
> +				    "looking for preferred mode on connector %s %d\n",
> +				    connector->name, connector->has_tile);
>  			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
>  		}
>  
>  		/* No preferred mode marked by the EDID? Are there any modes? */
>  		if (!modes[i] && !list_empty(&connector->modes)) {
> -			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
> -				      connector->name);
> +			drm_dbg_kms(connector->dev,
> +				    "using first mode listed on connector %s\n",
> +				    connector->name);
>  			modes[i] = list_first_entry(&connector->modes,
>  						    struct drm_display_mode,
>  						    head);
> @@ -695,8 +708,9 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			 * This is crtc->mode and not crtc->state->mode for the
>  			 * fastboot check to work correctly.
>  			 */
> -			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
> -				      connector->name);
> +			drm_dbg_kms(connector->dev,
> +				    "looking for current mode on connector %s\n",
> +				    connector->name);
>  			modes[i] = &connector->state->crtc->mode;
>  		}
>  		/*
> @@ -705,18 +719,20 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  		 */
>  		if (connector->has_tile &&
>  		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
> -			DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
> -				      connector->base.id);
> +			drm_dbg_kms(connector->dev,
> +				    "Falling back to non tiled mode on Connector %d\n",
> +				    connector->base.id);
>  			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
>  		}
>  		crtcs[i] = new_crtc;
>  
> -		DRM_DEBUG_KMS("connector %s on [CRTC:%d:%s]: %dx%d%s\n",
> -			      connector->name,
> -			      connector->state->crtc->base.id,
> -			      connector->state->crtc->name,
> -			      modes[i]->hdisplay, modes[i]->vdisplay,
> -			      modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
> +		drm_dbg_kms(connector->dev,
> +			    "connector %s on [CRTC:%d:%s]: %dx%d%s\n",
> +			    connector->name,
> +			    connector->state->crtc->base.id,
> +			    connector->state->crtc->name,
> +			    modes[i]->hdisplay, modes[i]->vdisplay,
> +			    modes[i]->flags & DRM_MODE_FLAG_INTERLACE ? "i" : "");
>  
>  		fallback = false;
>  		conn_configured |= BIT(i);
> @@ -732,15 +748,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  	 */
>  	if (num_connectors_enabled != num_connectors_detected &&
>  	    num_connectors_enabled < dev->mode_config.num_crtc) {
> -		DRM_DEBUG_KMS("fallback: Not all outputs enabled\n");
> -		DRM_DEBUG_KMS("Enabled: %i, detected: %i\n", num_connectors_enabled,
> -			      num_connectors_detected);
> +		drm_dbg_kms(NULL, "fallback: Not all outputs enabled\n");
> +		drm_dbg_kms(NULL, "Enabled: %i, detected: %i\n",
> +			    num_connectors_enabled, num_connectors_detected);
>  		fallback = true;
>  	}
>  
>  	if (fallback) {
>  bail:
> -		DRM_DEBUG_KMS("Not using firmware configuration\n");
> +		drm_dbg_kms(NULL, "Not using firmware configuration\n");
>  		memcpy(enabled, save_enabled, count);
>  		ret = false;
>  	}
> @@ -777,7 +793,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	int i, ret = 0;
>  	bool *enabled;
>  
> -	DRM_DEBUG_KMS("\n");
> +	drm_dbg_kms(dev, "\n");

This message is pretty useless, it could be dropped on top of this
series.

>  
>  	if (!width)
>  		width = dev->mode_config.max_width;
> @@ -819,7 +835,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  	for (i = 0; i < connector_count; i++)
>  		total_modes_count += connectors[i]->funcs->fill_modes(connectors[i], width, height);
>  	if (!total_modes_count)
> -		DRM_DEBUG_KMS("No connectors reported connected with modes\n");
> +		drm_dbg_kms(dev, "No connectors reported connected with modes\n");
>  	drm_client_connectors_enabled(connectors, connector_count, enabled);
>  
>  	if (!drm_client_firmware_config(client, connectors, connector_count, crtcs,
> @@ -834,8 +850,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  						 offsets, enabled, width, height))
>  			drm_err(client->dev, "Unable to find initial modes\n");
>  
> -		DRM_DEBUG_KMS("picking CRTCs for %dx%d config\n",
> -			      width, height);
> +		drm_dbg_kms(dev, "picking CRTCs for %dx%d config\n",
> +			    width, height);
>  
>  		drm_client_pick_crtcs(client, connectors, connector_count,
>  				      crtcs, modes, 0, width, height);
> @@ -853,8 +869,8 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  			struct drm_mode_set *modeset = drm_client_find_modeset(client, crtc);
>  			struct drm_connector *connector = connectors[i];
>  
> -			DRM_DEBUG_KMS("desired mode %s set on crtc %d (%d,%d)\n",
> -				      mode->name, crtc->base.id, offset->x, offset->y);
> +			drm_dbg_kms(dev, "desired mode %s set on crtc %d (%d,%d)\n",
> +				    mode->name, crtc->base.id, offset->x, offset->y);
>  
>  			if (WARN_ON_ONCE(modeset->num_connectors == DRM_CLIENT_MAX_CLONED_CONNECTORS ||
>  					 (dev->mode_config.num_crtc > 1 && modeset->num_connectors == 1))) {
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index d021497841b8..a2761a6ce11f 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -612,7 +612,7 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>  		if (tests & DRM_COLOR_LUT_EQUAL_CHANNELS) {
>  			if (entry[i].red != entry[i].blue ||
>  			    entry[i].red != entry[i].green) {
> -				DRM_DEBUG_KMS("All LUT entries must have equal r/g/b\n");
> +				drm_dbg_kms(NULL, "All LUT entries must have equal r/g/b\n");
>  				return -EINVAL;
>  			}
>  		}
> @@ -621,7 +621,7 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>  			if (entry[i].red < entry[i - 1].red ||
>  			    entry[i].green < entry[i - 1].green ||
>  			    entry[i].blue < entry[i - 1].blue) {
> -				DRM_DEBUG_KMS("LUT entries must never decrease.\n");
> +				drm_dbg_kms(NULL, "LUT entries must never decrease.\n");
>  				return -EINVAL;
>  			}
>  		}
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index dca8dd4ab93f..adedaf05418a 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -181,13 +181,14 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
>  						    mode->panel_orientation);
>  	}
>  
> -	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
> -		      connector->name, mode->name,
> -		      mode->xres, mode->yres,
> -		      mode->refresh_specified ? mode->refresh : 60,
> -		      mode->rb ? " reduced blanking" : "",
> -		      mode->margins ? " with margins" : "",
> -		      mode->interlace ?  " interlaced" : "");
> +	drm_dbg_kms(connector->dev,
> +		    "cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
> +		    connector->name, mode->name,
> +		    mode->xres, mode->yres,
> +		    mode->refresh_specified ? mode->refresh : 60,
> +		    mode->rb ? " reduced blanking" : "",
> +		    mode->margins ? " with margins" : "",
> +		    mode->interlace ?  " interlaced" : "");
>  }
>  
>  static void drm_connector_free(struct kref *kref)
> @@ -247,9 +248,9 @@ static int __drm_connector_init(struct drm_device *dev,
>  	/* connector index is used with 32bit bitmasks */
>  	ret = ida_alloc_max(&config->connector_ida, 31, GFP_KERNEL);
>  	if (ret < 0) {
> -		DRM_DEBUG_KMS("Failed to allocate %s connector index: %d\n",
> -			      drm_connector_enum_list[connector_type].name,
> -			      ret);
> +		drm_dbg_kms(dev, "Failed to allocate %s connector index: %d\n",
> +			    drm_connector_enum_list[connector_type].name,
> +			    ret);
>  		goto out_put;
>  	}
>  	connector->index = ret;
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index df9bf3c9206e..adc426561e17 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -730,10 +730,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  
>  	crtc = drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
>  	if (!crtc) {
> -		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", crtc_req->crtc_id);
> +		drm_dbg_kms(dev, "Unknown CRTC ID %d\n", crtc_req->crtc_id);
>  		return -ENOENT;
>  	}
> -	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
> +	drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
>  
>  	plane = crtc->primary;
>  
> @@ -756,7 +756,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  				old_fb = plane->fb;
>  
>  			if (!old_fb) {
> -				DRM_DEBUG_KMS("CRTC doesn't have current FB\n");
> +				drm_dbg_kms(dev, "CRTC doesn't have current FB\n");
>  				ret = -EINVAL;
>  				goto out;
>  			}
> @@ -767,8 +767,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  		} else {
>  			fb = drm_framebuffer_lookup(dev, file_priv, crtc_req->fb_id);
>  			if (!fb) {
> -				DRM_DEBUG_KMS("Unknown FB ID%d\n",
> -						crtc_req->fb_id);
> +				drm_dbg_kms(dev, "Unknown FB ID%d\n", crtc_req->fb_id);
>  				ret = -ENOENT;
>  				goto out;
>  			}
> @@ -781,7 +780,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  		}
>  		if (!file_priv->aspect_ratio_allowed &&
>  		    (crtc_req->mode.flags & DRM_MODE_FLAG_PIC_AR_MASK) != DRM_MODE_FLAG_PIC_AR_NONE) {
> -			DRM_DEBUG_KMS("Unexpected aspect-ratio flag bits\n");
> +			drm_dbg_kms(dev, "Unexpected aspect-ratio flag bits\n");
>  			ret = -EINVAL;
>  			goto out;
>  		}
> @@ -789,8 +788,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  
>  		ret = drm_mode_convert_umode(dev, mode, &crtc_req->mode);
>  		if (ret) {
> -			DRM_DEBUG_KMS("Invalid mode (ret=%d, status=%s)\n",
> -				      ret, drm_get_mode_status_name(mode->status));
> +			drm_dbg_kms(dev, "Invalid mode (ret=%d, status=%s)\n",
> +				    ret, drm_get_mode_status_name(mode->status));
>  			drm_mode_debug_printmodeline(mode);
>  			goto out;
>  		}
> @@ -807,9 +806,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  							   fb->format->format,
>  							   fb->modifier);
>  			if (ret) {
> -				DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
> -					      &fb->format->format,
> -					      fb->modifier);
> +				drm_dbg_kms(dev, "Invalid pixel format %p4cc, modifier 0x%llx\n",
> +					    &fb->format->format, fb->modifier);
>  				goto out;
>  			}
>  		}
> @@ -822,14 +820,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  	}
>  
>  	if (crtc_req->count_connectors == 0 && mode) {
> -		DRM_DEBUG_KMS("Count connectors is 0 but mode set\n");
> +		drm_dbg_kms(dev, "Count connectors is 0 but mode set\n");
>  		ret = -EINVAL;
>  		goto out;
>  	}
>  
>  	if (crtc_req->count_connectors > 0 && (!mode || !fb)) {
> -		DRM_DEBUG_KMS("Count connectors is %d but no mode or fb set\n",
> -			  crtc_req->count_connectors);
> +		drm_dbg_kms(dev, "Count connectors is %d but no mode or fb set\n",
> +			    crtc_req->count_connectors);
>  		ret = -EINVAL;
>  		goto out;
>  	}
> @@ -861,14 +859,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
>  
>  			connector = drm_connector_lookup(dev, file_priv, out_id);
>  			if (!connector) {
> -				DRM_DEBUG_KMS("Connector id %d unknown\n",
> -						out_id);
> +				drm_dbg_kms(dev, "Connector id %d unknown\n",
> +					    out_id);
>  				ret = -ENOENT;
>  				goto out;
>  			}
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
> -					connector->base.id,
> -					connector->name);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
> +				    connector->base.id,
> +				    connector->name);
>  
>  			connector_set[i] = connector;
>  		}
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index b74b4301a471..59e7b86eab93 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -338,7 +338,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
>  		if (encoder_funcs->mode_fixup) {
>  			if (!(ret = encoder_funcs->mode_fixup(encoder, mode,
>  							      adjusted_mode))) {
> -				DRM_DEBUG_KMS("Encoder fixup failed\n");
> +				drm_dbg_kms(dev, "Encoder fixup failed\n");
>  				goto done;
>  			}
>  		}
> @@ -347,11 +347,11 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
>  	if (crtc_funcs->mode_fixup) {
>  		if (!(ret = crtc_funcs->mode_fixup(crtc, mode,
>  						adjusted_mode))) {
> -			DRM_DEBUG_KMS("CRTC fixup failed\n");
> +			drm_dbg_kms(dev, "CRTC fixup failed\n");
>  			goto done;
>  		}
>  	}
> -	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
> +	drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
>  
>  	drm_mode_copy(&crtc->hwmode, adjusted_mode);
>  
> @@ -390,8 +390,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
>  		if (!encoder_funcs)
>  			continue;
>  
> -		DRM_DEBUG_KMS("[ENCODER:%d:%s] set [MODE:%s]\n",
> -			encoder->base.id, encoder->name, mode->name);
> +		drm_dbg_kms(dev, "[ENCODER:%d:%s] set [MODE:%s]\n",
> +			    encoder->base.id, encoder->name, mode->name);
>  		if (encoder_funcs->mode_set)
>  			encoder_funcs->mode_set(encoder, mode, adjusted_mode);
>  	}
> @@ -567,7 +567,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  	int ret;
>  	int i;
>  
> -	DRM_DEBUG_KMS("\n");
> +	drm_dbg_kms(NULL, "\n");

Same.

>  
>  	BUG_ON(!set);
>  	BUG_ON(!set->crtc);
> @@ -586,13 +586,13 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  		set->fb = NULL;
>  
>  	if (set->fb) {
> -		DRM_DEBUG_KMS("[CRTC:%d:%s] [FB:%d] #connectors=%d (x y) (%i %i)\n",
> -			      set->crtc->base.id, set->crtc->name,
> -			      set->fb->base.id,
> -			      (int)set->num_connectors, set->x, set->y);
> +		drm_dbg_kms(dev, "[CRTC:%d:%s] [FB:%d] #connectors=%d (x y) (%i %i)\n",
> +			    set->crtc->base.id, set->crtc->name,
> +			    set->fb->base.id,
> +			    (int)set->num_connectors, set->x, set->y);
>  	} else {
> -		DRM_DEBUG_KMS("[CRTC:%d:%s] [NOFB]\n",
> -			      set->crtc->base.id, set->crtc->name);
> +		drm_dbg_kms(dev, "[CRTC:%d:%s] [NOFB]\n",
> +			    set->crtc->base.id, set->crtc->name);
>  		drm_crtc_helper_disable(set->crtc);
>  		return 0;
>  	}
> @@ -642,7 +642,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  	if (set->crtc->primary->fb != set->fb) {
>  		/* If we have no fb then treat it as a full mode set */
>  		if (set->crtc->primary->fb == NULL) {
> -			DRM_DEBUG_KMS("crtc has no fb, full mode set\n");
> +			drm_dbg_kms(dev, "crtc has no fb, full mode set\n");
>  			mode_changed = true;
>  		} else if (set->fb->format != set->crtc->primary->fb->format) {
>  			mode_changed = true;
> @@ -654,7 +654,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  		fb_changed = true;
>  
>  	if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
> -		DRM_DEBUG_KMS("modes are different, full mode set\n");
> +		drm_dbg_kms(dev, "modes are different, full mode set\n");
>  		drm_mode_debug_printmodeline(&set->crtc->mode);
>  		drm_mode_debug_printmodeline(set->mode);
>  		mode_changed = true;
> @@ -690,7 +690,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  					fail = 1;
>  
>  				if (connector->dpms != DRM_MODE_DPMS_ON) {
> -					DRM_DEBUG_KMS("connector dpms not on, full mode switch\n");
> +					drm_dbg_kms(dev, "connector dpms not on, full mode switch\n");
>  					mode_changed = true;
>  				}
>  
> @@ -699,7 +699,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  		}
>  
>  		if (new_encoder != connector->encoder) {
> -			DRM_DEBUG_KMS("encoder changed, full mode switch\n");
> +			drm_dbg_kms(dev, "encoder changed, full mode switch\n");
>  			mode_changed = true;
>  			/* If the encoder is reused for another connector, then
>  			 * the appropriate crtc will be set later.
> @@ -740,17 +740,17 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  			goto fail;
>  		}
>  		if (new_crtc != connector->encoder->crtc) {
> -			DRM_DEBUG_KMS("crtc changed, full mode switch\n");
> +			drm_dbg_kms(dev, "crtc changed, full mode switch\n");
>  			mode_changed = true;
>  			connector->encoder->crtc = new_crtc;
>  		}
>  		if (new_crtc) {
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
> -				      connector->base.id, connector->name,
> -				      new_crtc->base.id, new_crtc->name);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
> +				    connector->base.id, connector->name,
> +				    new_crtc->base.id, new_crtc->name);
>  		} else {
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [NOCRTC]\n",
> -				      connector->base.id, connector->name);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [NOCRTC]\n",
> +				    connector->base.id, connector->name);
>  		}
>  	}
>  	drm_connector_list_iter_end(&conn_iter);
> @@ -761,8 +761,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  
>  	if (mode_changed) {
>  		if (drm_helper_crtc_in_use(set->crtc)) {
> -			DRM_DEBUG_KMS("attempting to set mode from"
> -					" userspace\n");
> +			drm_dbg_kms(dev, "attempting to set mode from userspace\n");
>  			drm_mode_debug_printmodeline(set->mode);
>  			set->crtc->primary->fb = set->fb;
>  			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
> @@ -774,10 +773,11 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
>  				ret = -EINVAL;
>  				goto fail;
>  			}
> -			DRM_DEBUG_KMS("Setting connector DPMS state to on\n");
> +			drm_dbg_kms(dev, "Setting connector DPMS state to on\n");
>  			for (i = 0; i < set->num_connectors; i++) {
> -				DRM_DEBUG_KMS("\t[CONNECTOR:%d:%s] set DPMS on\n", set->connectors[i]->base.id,
> -					      set->connectors[i]->name);
> +				drm_dbg_kms(dev, "\t[CONNECTOR:%d:%s] set DPMS on\n",
> +					    set->connectors[i]->base.id,
> +					    set->connectors[i]->name);
>  				set->connectors[i]->funcs->dpms(set->connectors[i], DRM_MODE_DPMS_ON);
>  			}
>  		}
> diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
> index a59ef3f0e4a1..f29d286f4760 100644
> --- a/drivers/gpu/drm/drm_debugfs_crc.c
> +++ b/drivers/gpu/drm/drm_debugfs_crc.c
> @@ -131,8 +131,9 @@ static ssize_t crc_control_write(struct file *file, const char __user *ubuf,
>  		return 0;
>  
>  	if (len > PAGE_SIZE - 1) {
> -		DRM_DEBUG_KMS("Expected < %lu bytes into crtc crc control\n",
> -			      PAGE_SIZE);
> +		drm_dbg_kms(crtc->dev,
> +			    "Expected < %lu bytes into crtc crc control\n",
> +			    PAGE_SIZE);
>  		return -E2BIG;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
> index 27ffeee09e4f..7e591bc0883f 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -31,8 +31,8 @@ validate_displayid(const u8 *displayid, int length, int idx)
>  	if (IS_ERR(base))
>  		return base;
>  
> -	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
> -		      base->rev, base->bytes, base->prod_id, base->ext_count);
> +	drm_dbg_kms(NULL, "base revision 0x%x, length %d, %d %d\n",
> +		    base->rev, base->bytes, base->prod_id, base->ext_count);
>  
>  	/* +1 for DispID checksum */
>  	dispid_length = sizeof(*base) + base->bytes + 1;
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 0454da505687..791152c4afd4 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -1986,7 +1986,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
>  
>  	status = edid_block_check(block, is_base_block);
>  	if (status == EDID_BLOCK_HEADER_REPAIR) {
> -		DRM_DEBUG_KMS("Fixing EDID header, your hardware may be failing\n");
> +		drm_dbg_kms(NULL, "Fixing EDID header, your hardware may be failing\n");
>  		edid_header_fix(block);
>  
>  		/* Retry with fixed header, update status if that worked. */
> @@ -2172,8 +2172,9 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
>  		ret = i2c_transfer(adapter, &msgs[3 - xfers], xfers);
>  
>  		if (ret == -ENXIO) {
> -			DRM_DEBUG_KMS("drm: skipping non-existent adapter %s\n",
> -					adapter->name);
> +			drm_dbg_kms(NULL,
> +				    "drm: skipping non-existent adapter %s\n",
> +				    adapter->name);
>  			break;
>  		}
>  	} while (ret != xfers && --retries);
> @@ -5589,7 +5590,7 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
>  	}
>  	cea_db_iter_end(&iter);
>  
> -	DRM_DEBUG_KMS("Found %d Short Audio Descriptors\n", count);
> +	drm_dbg_kms(NULL, "Found %d Short Audio Descriptors\n", count);
>  
>  	return count;
>  }
> @@ -5634,7 +5635,7 @@ static int _drm_edid_to_speaker_allocation(const struct drm_edid *drm_edid,
>  	}
>  	cea_db_iter_end(&iter);
>  
> -	DRM_DEBUG_KMS("Found %d Speaker Allocation Data Blocks\n", count);
> +	drm_dbg_kms(NULL, "Found %d Speaker Allocation Data Blocks\n", count);
>  
>  	return count;
>  }
> @@ -5761,7 +5762,7 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
>  	drm_edid_iter_end(&edid_iter);
>  
>  	if (has_audio) {
> -		DRM_DEBUG_KMS("Monitor has basic audio support\n");
> +		drm_dbg_kms(NULL, "Monitor has basic audio support\n");
>  		goto end;
>  	}
>  
> @@ -5772,8 +5773,8 @@ static bool _drm_detect_monitor_audio(const struct drm_edid *drm_edid)
>  			int i;
>  
>  			for (i = 0; i < cea_db_payload_len(db); i += 3)
> -				DRM_DEBUG_KMS("CEA audio format %d\n",
> -					      (data[i] >> 3) & 0xf);
> +				drm_dbg_kms(NULL, "CEA audio format %d\n",
> +					    (data[i] >> 3) & 0xf);
>  			has_audio = true;
>  			break;
>  		}
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index af72fc38bb7c..c1b8717b5794 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -403,7 +403,7 @@ static int fill_object_idr(struct drm_device *dev,
>  		}
>  
>  		if (!drm_mode_object_lease_required(objects[o]->type)) {
> -			DRM_DEBUG_KMS("invalid object for lease\n");
> +			drm_dbg_kms(dev, "invalid object for lease\n");
>  			ret = -EINVAL;
>  			goto out_free_objects;
>  		}
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index ab5dd5933a1a..793fdd7da1d0 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -265,7 +265,8 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
>  
>  	full = width == fb->width && height == fb->height;
>  
> -	DRM_DEBUG_KMS("Flushing [FB:%d] " DRM_RECT_FMT "\n", fb->base.id, DRM_RECT_ARG(rect));
> +	drm_dbg_kms(fb->dev, "Flushing [FB:%d] " DRM_RECT_FMT "\n",
> +		    fb->base.id, DRM_RECT_ARG(rect));
>  
>  	if (!dbi->dc || !full || swap ||
>  	    fb->format->format == DRM_FORMAT_XRGB8888) {
> @@ -408,7 +409,7 @@ void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
>  {
>  	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
>  
> -	DRM_DEBUG_KMS("\n");
> +	drm_dbg_kms(&dbidev->drm, "\n");

Same.

With the commit subject fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	if (dbidev->backlight)
>  		backlight_disable(dbidev->backlight);
> @@ -627,7 +628,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
>  	drm->mode_config.max_height = dbidev->mode.vdisplay;
>  	dbidev->rotation = rotation;
>  
> -	DRM_DEBUG_KMS("rotation = %u\n", rotation);
> +	drm_dbg_kms(drm, "rotation = %u\n", rotation);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index f5171bf91eae..440e3b015cc6 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -53,11 +53,11 @@
>   * drm_mode_debug_printmodeline - print a mode to dmesg
>   * @mode: mode to print
>   *
> - * Describe @mode using DRM_DEBUG.
> + * Describe @mode using drm_dbg_kms().
>   */
>  void drm_mode_debug_printmodeline(const struct drm_display_mode *mode)
>  {
> -	DRM_DEBUG_KMS("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
> +	drm_dbg_kms(NULL, "Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
>  }
>  EXPORT_SYMBOL(drm_mode_debug_printmodeline);
>  
> @@ -1813,9 +1813,9 @@ void drm_mode_prune_invalid(struct drm_device *dev,
>  			}
>  			if (verbose) {
>  				drm_mode_debug_printmodeline(mode);
> -				DRM_DEBUG_KMS("Not using %s mode: %s\n",
> -					      mode->name,
> -					      drm_get_mode_status_name(mode->status));
> +				drm_dbg_kms(dev, "Not using %s mode: %s\n",
> +					    mode->name,
> +					    drm_get_mode_status_name(mode->status));
>  			}
>  			drm_mode_destroy(dev, mode);
>  		}
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 1e8727b7bce9..12fed5f812a1 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -275,7 +275,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  	plane->format_types = kmalloc_array(format_count, sizeof(uint32_t),
>  					    GFP_KERNEL);
>  	if (!plane->format_types) {
> -		DRM_DEBUG_KMS("out of memory when allocating plane\n");
> +		drm_dbg_kms(dev, "out of memory when allocating plane\n");
>  		drm_mode_object_unregister(dev, &plane->base);
>  		return -ENOMEM;
>  	}
> @@ -302,7 +302,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>  					 GFP_KERNEL);
>  
>  	if (format_modifier_count && !plane->modifiers) {
> -		DRM_DEBUG_KMS("out of memory when allocating plane\n");
> +		drm_dbg_kms(dev, "out of memory when allocating plane\n");
>  		kfree(plane->format_types);
>  		drm_mode_object_unregister(dev, &plane->base);
>  		return -ENOMEM;
> @@ -786,7 +786,7 @@ static int __setplane_check(struct drm_plane *plane,
>  
>  	/* Check whether this plane is usable on this CRTC */
>  	if (!(plane->possible_crtcs & drm_crtc_mask(crtc))) {
> -		DRM_DEBUG_KMS("Invalid crtc for plane\n");
> +		drm_dbg_kms(plane->dev, "Invalid crtc for plane\n");
>  		return -EINVAL;
>  	}
>  
> @@ -794,8 +794,9 @@ static int __setplane_check(struct drm_plane *plane,
>  	ret = drm_plane_check_pixel_format(plane, fb->format->format,
>  					   fb->modifier);
>  	if (ret) {
> -		DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
> -			      &fb->format->format, fb->modifier);
> +		drm_dbg_kms(fb->dev,
> +			    "Invalid pixel format %p4cc, modifier 0x%llx\n",
> +			    &fb->format->format, fb->modifier);
>  		return ret;
>  	}
>  
> @@ -804,8 +805,8 @@ static int __setplane_check(struct drm_plane *plane,
>  	    crtc_x > INT_MAX - (int32_t) crtc_w ||
>  	    crtc_h > INT_MAX ||
>  	    crtc_y > INT_MAX - (int32_t) crtc_h) {
> -		DRM_DEBUG_KMS("Invalid CRTC coordinates %ux%u+%d+%d\n",
> -			      crtc_w, crtc_h, crtc_x, crtc_y);
> +		drm_dbg_kms(crtc->dev, "Invalid CRTC coordinates %ux%u+%d+%d\n",
> +			    crtc_w, crtc_h, crtc_x, crtc_y);
>  		return -ERANGE;
>  	}
>  
> @@ -982,24 +983,23 @@ int drm_mode_setplane(struct drm_device *dev, void *data,
>  	 */
>  	plane = drm_plane_find(dev, file_priv, plane_req->plane_id);
>  	if (!plane) {
> -		DRM_DEBUG_KMS("Unknown plane ID %d\n",
> -			      plane_req->plane_id);
> +		drm_dbg_kms(dev, "Unknown plane ID %d\n", plane_req->plane_id);
>  		return -ENOENT;
>  	}
>  
>  	if (plane_req->fb_id) {
>  		fb = drm_framebuffer_lookup(dev, file_priv, plane_req->fb_id);
>  		if (!fb) {
> -			DRM_DEBUG_KMS("Unknown framebuffer ID %d\n",
> -				      plane_req->fb_id);
> +			drm_dbg_kms(dev, "Unknown framebuffer ID %d\n",
> +				    plane_req->fb_id);
>  			return -ENOENT;
>  		}
>  
>  		crtc = drm_crtc_find(dev, file_priv, plane_req->crtc_id);
>  		if (!crtc) {
>  			drm_framebuffer_put(fb);
> -			DRM_DEBUG_KMS("Unknown crtc ID %d\n",
> -				      plane_req->crtc_id);
> +			drm_dbg_kms(dev, "Unknown crtc ID %d\n",
> +				    plane_req->crtc_id);
>  			return -ENOENT;
>  		}
>  	}
> @@ -1048,7 +1048,7 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
>  		if (req->handle) {
>  			fb = drm_internal_framebuffer_create(dev, &fbreq, file_priv);
>  			if (IS_ERR(fb)) {
> -				DRM_DEBUG_KMS("failed to wrap cursor buffer in drm framebuffer\n");
> +				drm_dbg_kms(dev, "failed to wrap cursor buffer in drm framebuffer\n");
>  				return PTR_ERR(fb);
>  			}
>  
> @@ -1119,7 +1119,7 @@ static int drm_mode_cursor_common(struct drm_device *dev,
>  
>  	crtc = drm_crtc_find(dev, file_priv, req->crtc_id);
>  	if (!crtc) {
> -		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
> +		drm_dbg_kms(dev, "Unknown CRTC ID %d\n", req->crtc_id);
>  		return -ENOENT;
>  	}
>  
> @@ -1340,7 +1340,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  	 * to modifier changes.
>  	 */
>  	if (old_fb->format->format != fb->format->format) {
> -		DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
> +		drm_dbg_kms(dev, "Page flip is not allowed to change frame buffer format.\n");
>  		ret = -EINVAL;
>  		goto out;
>  	}
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 2fb9bf901a2c..6cdaf84735cd 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -532,8 +532,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  
>  	drm_modeset_acquire_init(&ctx, 0);
>  
> -	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
> -			connector->name);
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n", connector->base.id,
> +		    connector->name);
>  
>  retry:
>  	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, &ctx);
> @@ -576,11 +576,12 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  	 * check here, and if anything changed start the hotplug code.
>  	 */
>  	if (old_status != connector->status) {
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] status updated from %s to %s\n",
> -			      connector->base.id,
> -			      connector->name,
> -			      drm_get_connector_status_name(old_status),
> -			      drm_get_connector_status_name(connector->status));
> +		drm_dbg_kms(dev,
> +			    "[CONNECTOR:%d:%s] status updated from %s to %s\n",
> +			    connector->base.id,
> +			    connector->name,
> +			    drm_get_connector_status_name(old_status),
> +			    drm_get_connector_status_name(connector->status));
>  
>  		/*
>  		 * The hotplug event code might call into the fb
> @@ -599,8 +600,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  	drm_kms_helper_poll_enable(dev);
>  
>  	if (connector->status == connector_status_disconnected) {
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> -			connector->base.id, connector->name);
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] disconnected\n",
> +			    connector->base.id, connector->name);
>  		drm_connector_update_edid_property(connector, NULL);
>  		drm_mode_prune_invalid(dev, &connector->modes, false);
>  		goto exit;
> @@ -658,8 +659,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>  
>  	drm_mode_sort(&connector->modes);
>  
> -	DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->base.id,
> -			connector->name);
> +	drm_dbg_kms(dev, "[CONNECTOR:%d:%s] probed modes :\n",
> +		    connector->base.id, connector->name);
>  	list_for_each_entry(mode, &connector->modes, head) {
>  		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
>  		drm_mode_debug_printmodeline(mode);
> @@ -793,14 +794,14 @@ static void output_poll_execute(struct work_struct *work)
>  			old = drm_get_connector_status_name(old_status);
>  			new = drm_get_connector_status_name(connector->status);
>  
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] "
> -				      "status updated from %s to %s\n",
> -				      connector->base.id,
> -				      connector->name,
> -				      old, new);
> -			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
> -				      connector->base.id, connector->name,
> -				      old_epoch_counter, connector->epoch_counter);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] "
> +				    "status updated from %s to %s\n",
> +				    connector->base.id,
> +				    connector->name,
> +				    old, new);
> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] epoch counter %llu -> %llu\n",
> +				    connector->base.id, connector->name,
> +				    old_epoch_counter, connector->epoch_counter);
>  
>  			changed = true;
>  		}
> diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
> index 85c79a38c13a..8f4abcb1cbd8 100644
> --- a/drivers/gpu/drm/drm_rect.c
> +++ b/drivers/gpu/drm/drm_rect.c
> @@ -228,9 +228,9 @@ EXPORT_SYMBOL(drm_rect_calc_vscale);
>  void drm_rect_debug_print(const char *prefix, const struct drm_rect *r, bool fixed_point)
>  {
>  	if (fixed_point)
> -		DRM_DEBUG_KMS("%s" DRM_RECT_FP_FMT "\n", prefix, DRM_RECT_FP_ARG(r));
> +		drm_dbg_kms(NULL, "%s" DRM_RECT_FP_FMT "\n", prefix, DRM_RECT_FP_ARG(r));
>  	else
> -		DRM_DEBUG_KMS("%s" DRM_RECT_FMT "\n", prefix, DRM_RECT_ARG(r));
> +		drm_dbg_kms(NULL, "%s" DRM_RECT_FMT "\n", prefix, DRM_RECT_ARG(r));
>  }
>  EXPORT_SYMBOL(drm_rect_debug_print);
>  
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index b7c6754b4688..0edd0df29cb3 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -209,10 +209,10 @@ static ssize_t status_store(struct device *device,
>  		ret = -EINVAL;
>  
>  	if (old_force != connector->force || !connector->force) {
> -		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] force updated from %d to %d or reprobing\n",
> -			      connector->base.id,
> -			      connector->name,
> -			      old_force, connector->force);
> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] force updated from %d to %d or reprobing\n",
> +			    connector->base.id,
> +			    connector->name,
> +			    old_force, connector->force);
>  
>  		connector->funcs->fill_modes(connector,
>  					     dev->mode_config.max_width,

-- 
Regards,

Laurent Pinchart
