Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188E44F9C2
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 18:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E3F89D9B;
	Sun, 14 Nov 2021 17:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CCB89D9B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 17:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1636910547; bh=ouC+WUn2gRf3LHjFVtn8+sUr7bZQ3mClM1PNxAFisak=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=uyMntpd/1ur9/ZqVKvR1BVg5eK5g4FQCI1sA7wU1XBbjsYmESk5qbLj8OulT3DlLv
 JS/vHesPbQDCtGbGqDtE+KWYAse5kLhFbMaAbd5YpUWPWbfxaWxZC9hCiKC9GU4DlG
 GEl4U4b5CXK7aZG0d7jzXqs7XBHvNrFpGukX0afo=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sun, 14 Nov 2021 18:22:27 +0100 (CET)
X-EA-Auth: TOHMKM1hRUJleg3Jjv897pLAvl0qJAwGJBLfCFMw6iWzckJsvcOsr4+mnN7T1U1KdF83P8lXOgmy6kUfCeQNkyjVtSN6AGnK
Date: Sun, 14 Nov 2021 18:22:25 +0100
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: change logs to print connectors in the form
 CONNECTOR:id:name
Message-ID: <YZFF0bS5BTIaDDM/@gineta.localdomain>
References: <YZARol5A5hS+5a5m@gineta.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YZARol5A5hS+5a5m@gineta.localdomain>
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


+CC: Ville Syrjälä <ville.syrjala@linux.intel.com>
+CC: Daniel Vetter <daniel@ffwll.ch>


On Sat, Nov 13, 2021 at 08:27:30PM +0100, Claudio Suarez wrote:
> The prefered way to log connectors is [CONNECTOR:id:name]. Change it in
> drm core programs.
> 
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 51 ++++++++++++++--------------
>  drivers/gpu/drm/drm_connector.c      | 12 ++++---
>  drivers/gpu/drm/drm_edid.c           | 36 ++++++++++----------
>  drivers/gpu/drm/drm_edid_load.c      | 11 +++---
>  drivers/gpu/drm/drm_mode_config.c    |  3 +-
>  5 files changed, 59 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index ced09c7c06f9..4f35dc375bdd 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -240,7 +240,7 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
>  	for (i = 0; i < connector_count; i++) {
>  		connector = connectors[i];
>  		enabled[i] = drm_connector_enabled(connector, true);
> -		DRM_DEBUG_KMS("connector %d enabled? %s\n", connector->base.id,
> +		DRM_DEBUG_KMS("[CONNECTOR:%d;%s] enabled? %s\n", connector->base.id, connector->name,
>  			      connector->display_info.non_desktop ? "non desktop" : enabled[i] ? "yes" : "no");
>  
>  		any_enabled |= enabled[i];
> @@ -350,8 +350,8 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
>  			continue;
>  
>  		if (!modes[i] && (h_idx || v_idx)) {
> -			DRM_DEBUG_KMS("no modes for connector tiled %d %d\n", i,
> -				      connector->base.id);
> +			DRM_DEBUG_KMS("no modes for [CONNECTOR:%d:%s] tiled %d\n",
> +				      connector->base.id, connector->name, i);
>  			continue;
>  		}
>  		if (connector->tile_h_loc < h_idx)
> @@ -419,14 +419,15 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
>  			drm_client_get_tile_offsets(connectors, connector_count, modes, offsets, i,
>  						    connector->tile_h_loc, connector->tile_v_loc);
>  		}
> -		DRM_DEBUG_KMS("looking for cmdline mode on connector %d\n",
> -			      connector->base.id);
> +		DRM_DEBUG_KMS("looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> +			      connector->base.id, connector->name);
>  
>  		/* got for command line mode first */
>  		modes[i] = drm_connector_pick_cmdline_mode(connector);
>  		if (!modes[i]) {
> -			DRM_DEBUG_KMS("looking for preferred mode on connector %d %d\n",
> -				      connector->base.id, connector->tile_group ? connector->tile_group->id : 0);
> +			DRM_DEBUG_KMS("looking for preferred mode on [CONNECTOR:%d:%s] %d\n",
> +				      connector->base.id, connector->name,
> +				      connector->tile_group ? connector->tile_group->id : 0);
>  			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
>  		}
>  		/* No preferred modes, pick one off the list */
> @@ -448,8 +449,8 @@ static bool drm_client_target_preferred(struct drm_connector **connectors,
>  			    (connector->tile_h_loc == 0 &&
>  			     connector->tile_v_loc == 0 &&
>  			     !drm_connector_get_tiled_mode(connector))) {
> -				DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
> -					      connector->base.id);
> +				DRM_DEBUG_KMS("Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> +					      connector->base.id, connector->name);
>  				modes[i] = drm_connector_fallback_non_tiled_mode(connector);
>  			} else {
>  				modes[i] = drm_connector_get_tiled_mode(connector);
> @@ -617,15 +618,15 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			num_connectors_detected++;
>  
>  		if (!enabled[i]) {
> -			DRM_DEBUG_KMS("connector %s not enabled, skipping\n",
> -				      connector->name);
> +			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] not enabled, skipping\n",
> +				      connector->base.id, connector->name);
>  			conn_configured |= BIT(i);
>  			continue;
>  		}
>  
>  		if (connector->force == DRM_FORCE_OFF) {
> -			DRM_DEBUG_KMS("connector %s is disabled by user, skipping\n",
> -				      connector->name);
> +			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] is disabled by user, skipping\n",
> +				      connector->base.id, connector->name);
>  			enabled[i] = false;
>  			continue;
>  		}
> @@ -635,8 +636,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			if (connector->force > DRM_FORCE_OFF)
>  				goto bail;
>  
> -			DRM_DEBUG_KMS("connector %s has no encoder or crtc, skipping\n",
> -				      connector->name);
> +			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] has no encoder or crtc, skipping\n",
> +				      connector->base.id, connector->name);
>  			enabled[i] = false;
>  			conn_configured |= BIT(i);
>  			continue;
> @@ -658,23 +659,23 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			}
>  		}
>  
> -		DRM_DEBUG_KMS("looking for cmdline mode on connector %s\n",
> -			      connector->name);
> +		DRM_DEBUG_KMS("looking for cmdline mode on [CONNECTOR:%d:%s]\n",
> +			      connector->base.id, connector->name);
>  
>  		/* go for command line mode first */
>  		modes[i] = drm_connector_pick_cmdline_mode(connector);
>  
>  		/* try for preferred next */
>  		if (!modes[i]) {
> -			DRM_DEBUG_KMS("looking for preferred mode on connector %s %d\n",
> -				      connector->name, connector->has_tile);
> +			DRM_DEBUG_KMS("looking for preferred mode on [CONNECTOR:%d:%s] %d\n",
> +				      connector->base.id, connector->name, connector->has_tile);
>  			modes[i] = drm_connector_has_preferred_mode(connector, width, height);
>  		}
>  
>  		/* No preferred mode marked by the EDID? Are there any modes? */
>  		if (!modes[i] && !list_empty(&connector->modes)) {
> -			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
> -				      connector->name);
> +			DRM_DEBUG_KMS("using first mode listed on [CONNECTOR:%d:%s]\n",
> +				      connector->base.id, connector->name);
>  			modes[i] = list_first_entry(&connector->modes,
>  						    struct drm_display_mode,
>  						    head);
> @@ -693,8 +694,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  			 * This is crtc->mode and not crtc->state->mode for the
>  			 * fastboot check to work correctly.
>  			 */
> -			DRM_DEBUG_KMS("looking for current mode on connector %s\n",
> -				      connector->name);
> +			DRM_DEBUG_KMS("looking for current mode on [CONNECTOR:%d:%s]\n",
> +				      connector->base.id, connector->name);
>  			modes[i] = &connector->state->crtc->mode;
>  		}
>  		/*
> @@ -703,8 +704,8 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  		 */
>  		if (connector->has_tile &&
>  		    num_tiled_conns < connector->num_h_tile * connector->num_v_tile) {
> -			DRM_DEBUG_KMS("Falling back to non tiled mode on Connector %d\n",
> -				      connector->base.id);
> +			DRM_DEBUG_KMS("Falling back to non tiled mode on [CONNECTOR:%d:%s]\n",
> +				      connector->base.id, connector->name);
>  			modes[i] = drm_connector_fallback_non_tiled_mode(connector);
>  		}
>  		crtcs[i] = new_crtc;
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 3bc782b630b9..a7085f65865f 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -161,20 +161,22 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
>  		return;
>  
>  	if (mode->force) {
> -		DRM_INFO("forcing %s connector %s\n", connector->name,
> +		DRM_INFO("forcing [CONNECTOR:%d:%s]: %s\n",
> +			 connector->base.id, connector->name,
>  			 drm_get_connector_force_name(mode->force));
>  		connector->force = mode->force;
>  	}
>  
>  	if (mode->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
> -		DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
> -			 connector->name, mode->panel_orientation);
> +		DRM_INFO("cmdline forces [CONNECTOR:%d:%s] panel_orientation to %d\n",
> +			 connector->base.id, connector->name,
> +			 mode->panel_orientation);
>  		drm_connector_set_panel_orientation(connector,
>  						    mode->panel_orientation);
>  	}
>  
> -	DRM_DEBUG_KMS("cmdline mode for connector %s %s %dx%d@%dHz%s%s%s\n",
> -		      connector->name, mode->name,
> +	DRM_DEBUG_KMS("cmdline mode for [CONNECTOR:%d:%s] %s %dx%d@%dHz%s%s%s\n",
> +		      connector->base.id, connector->name, mode->name,
>  		      mode->xres, mode->yres,
>  		      mode->refresh_specified ? mode->refresh : 60,
>  		      mode->rb ? " reduced blanking" : "",
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..242dfcdb7ecb 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5076,32 +5076,32 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
>  		dc_bpc = 10;
>  		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_30;
> -		DRM_DEBUG("%s: HDMI sink does deep color 30.\n",
> -			  connector->name);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: HDMI sink does deep color 30.\n",
> +			  connector->base.id, connector->name);
>  	}
>  
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
>  		dc_bpc = 12;
>  		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_36;
> -		DRM_DEBUG("%s: HDMI sink does deep color 36.\n",
> -			  connector->name);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: HDMI sink does deep color 36.\n",
> +			  connector->base.id, connector->name);
>  	}
>  
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
>  		dc_bpc = 16;
>  		info->edid_hdmi_dc_modes |= DRM_EDID_HDMI_DC_48;
> -		DRM_DEBUG("%s: HDMI sink does deep color 48.\n",
> -			  connector->name);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: HDMI sink does deep color 48.\n",
> +			  connector->base.id, connector->name);
>  	}
>  
>  	if (dc_bpc == 0) {
> -		DRM_DEBUG("%s: No deep color support on this HDMI sink.\n",
> -			  connector->name);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: No deep color support on this HDMI sink.\n",
> +			  connector->base.id, connector->name);
>  		return;
>  	}
>  
> -	DRM_DEBUG("%s: Assigning HDMI sink color depth as %d bpc.\n",
> -		  connector->name, dc_bpc);
> +	DRM_DEBUG("[CONNECTOR:%d:%s]: Assigning HDMI sink color depth as %d bpc.\n",
> +		  connector->base.id, connector->name, dc_bpc);
>  	info->bpc = dc_bpc;
>  
>  	/*
> @@ -5114,8 +5114,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	/* YCRCB444 is optional according to spec. */
>  	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
>  		info->color_formats |= DRM_COLOR_FORMAT_YCRCB444;
> -		DRM_DEBUG("%s: HDMI sink does YCRCB444 in deep color.\n",
> -			  connector->name);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: HDMI sink does YCRCB444 in deep color.\n",
> +			  connector->base.id, connector->name);
>  	}
>  
>  	/*
> @@ -5123,8 +5123,8 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>  	 * then deep color 36 bit must be supported.
>  	 */
>  	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
> -		DRM_DEBUG("%s: HDMI sink should do DC_36, but does not!\n",
> -			  connector->name);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: HDMI sink should do DC_36, but does not!\n",
> +			  connector->base.id, connector->name);
>  	}
>  }
>  
> @@ -5357,8 +5357,8 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  	if (info->bpc == 0 && edid->revision == 3 &&
>  	    edid->input & DRM_EDID_DIGITAL_DFP_1_X) {
>  		info->bpc = 8;
> -		DRM_DEBUG("%s: Assigning DFP sink color depth as %d bpc.\n",
> -			  connector->name, info->bpc);
> +		DRM_DEBUG("[CONNECTOR:%d:%s]: Assigning DFP sink color depth as %d bpc.\n",
> +			  connector->base.id, connector->name, info->bpc);
>  	}
>  
>  	/* Only defined for 1.4 with digital displays */
> @@ -5390,8 +5390,8 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
>  		break;
>  	}
>  
> -	DRM_DEBUG("%s: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
> -			  connector->name, info->bpc);
> +	DRM_DEBUG("[CONNECTOR:%d:%s]: Assigning EDID-1.4 digital sink color depth as %d bpc.\n",
> +			  connector->base.id, connector->name, info->bpc);
>  
>  	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
>  	if (edid->features & DRM_EDID_FEATURE_RGB_YCRCB444)
> diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
> index 37d8ba3ddb46..f3f6801927f1 100644
> --- a/drivers/gpu/drm/drm_edid_load.c
> +++ b/drivers/gpu/drm/drm_edid_load.c
> @@ -188,7 +188,8 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
>  		if (IS_ERR(pdev)) {
>  			DRM_ERROR("Failed to register EDID firmware platform device "
> -				  "for connector \"%s\"\n", connector_name);
> +				  "for [CONNECTOR:%d:%s]\n",
> +				  connector->base.id, connector_name);
>  			return ERR_CAST(pdev);
>  		}
>  
> @@ -243,8 +244,8 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  
>  		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
>  		DRM_INFO("Found %d valid extensions instead of %d in EDID data "
> -		    "\"%s\" for connector \"%s\"\n", valid_extensions,
> -		    edid[0x7e], name, connector_name);
> +		    "\"%s\" for [CONNECTOR:%d:%s]\n", valid_extensions,
> +		    edid[0x7e], name, connector->base.id, connector_name);
>  		edid[0x7e] = valid_extensions;
>  
>  		new_edid = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH,
> @@ -254,9 +255,9 @@ static void *edid_load(struct drm_connector *connector, const char *name,
>  	}
>  
>  	DRM_INFO("Got %s EDID base block and %d extension%s from "
> -	    "\"%s\" for connector \"%s\"\n", (builtin >= 0) ? "built-in" :
> +	    "\"%s\" for [CONNECTOR:%d:%s]\n", (builtin >= 0) ? "built-in" :
>  	    "external", valid_extensions, valid_extensions == 1 ? "" : "s",
> -	    name, connector_name);
> +	    name, connector->base.id, connector_name);
>  
>  out:
>  	release_firmware(fw);
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 37b4b9f0e468..e46dcd31faa3 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -504,7 +504,8 @@ void drm_mode_config_cleanup(struct drm_device *dev)
>  	if (WARN_ON(!list_empty(&dev->mode_config.connector_list))) {
>  		drm_connector_list_iter_begin(dev, &conn_iter);
>  		drm_for_each_connector_iter(connector, &conn_iter)
> -			DRM_ERROR("connector %s leaked!\n", connector->name);
> +			DRM_ERROR("[CONNECTOR:%d:%s] leaked!\n",
> +				  connector->base.id, connector->name);
>  		drm_connector_list_iter_end(&conn_iter);
>  	}
>  
> -- 
> 2.33.0
> 
> 
> 


