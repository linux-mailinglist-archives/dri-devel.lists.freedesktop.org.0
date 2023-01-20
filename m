Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540E675D0B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0929A10EAF1;
	Fri, 20 Jan 2023 18:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8248310EAF1;
 Fri, 20 Jan 2023 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674240581; x=1705776581;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OOrhXqLatjAwSNEJ97yp7HXKidkvzas+/EkAKOnOXAs=;
 b=lisTd9q5fi6QzCw24xkrnJ0Qp0N0E2JIgQ7f+SnRcXePvWPKlVRrAwX3
 6Vrlc34KbcfBEKQbdwxSBzEZ/hvapS1aiK/44PIeCgpZcl1nuEL3azpXo
 /GGm/PA0McM2WgUd9kVa/YP+NNTv95Al1pOyoXVfUx9UOf06JXsVKERMx
 wOM0LjwQTSe5pZQ5ZggKEckqH/WqNJL9APe06uw1evW7JfZJgo0lOhPaI
 bGXuJyE9sW2txSXJJVgsIIZ9kyBNb+2P0uTO/dVpJAKJHHs9AUN3k1gEV
 z+3ohF7kIBvlCLwXbNDJrKnWYZHpVApE94jMSrlIhfzklkZD9jw85VkUl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352915731"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="352915731"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 10:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="724050338"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="724050338"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by fmsmga008.fm.intel.com with SMTP; 20 Jan 2023 10:49:38 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 20 Jan 2023 20:49:38 +0200
Date: Fri, 20 Jan 2023 20:49:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v8 8/8] drm/i915/panel: move panel fixed EDID to struct
 intel_panel
Message-ID: <Y8riQrC0wkf9huv+@intel.com>
References: <cover.1674144945.git.jani.nikula@intel.com>
 <214356db473af8a45e772cea62e15445f7312ff9.1674144945.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <214356db473af8a45e772cea62e15445f7312ff9.1674144945.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 06:19:01PM +0200, Jani Nikula wrote:
> It's a bit confusing to have two cached EDIDs in struct intel_connector
> with slightly different purposes. Make the distinction a bit clearer by
> moving the EDID cached for eDP and LVDS panels at connector init time to
> struct intel_panel, and name it fixed_edid. That's what it is, a fixed
> EDID for the panels.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
>  .../gpu/drm/i915/display/intel_connector.c    |  3 ---
>  .../drm/i915/display/intel_display_types.h    |  6 ++++--
>  drivers/gpu/drm/i915/display/intel_dp.c       | 20 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_dvo.c      |  2 +-
>  drivers/gpu/drm/i915/display/intel_lvds.c     | 11 +++++-----
>  drivers/gpu/drm/i915/display/intel_panel.c    | 10 +++++++++-
>  drivers/gpu/drm/i915/display/intel_panel.h    |  4 +++-
>  drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
>  drivers/gpu/drm/i915/display/vlv_dsi.c        |  2 +-
>  10 files changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
> index ae14c794c4bc..d56d01f07bb7 100644
> --- a/drivers/gpu/drm/i915/display/icl_dsi.c
> +++ b/drivers/gpu/drm/i915/display/icl_dsi.c
> @@ -2054,7 +2054,7 @@ void icl_dsi_init(struct drm_i915_private *dev_priv)
>  		goto err;
>  	}
>  
> -	intel_panel_init(intel_connector);
> +	intel_panel_init(intel_connector, NULL);
>  
>  	intel_backlight_setup(intel_connector, INVALID_PIPE);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
> index 4814d4e2f7f9..257afac34839 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -99,9 +99,6 @@ void intel_connector_destroy(struct drm_connector *connector)
>  
>  	intel_hdcp_cleanup(intel_connector);
>  
> -	if (!IS_ERR_OR_NULL(intel_connector->edid))
> -		drm_edid_free(intel_connector->edid);
> -
>  	intel_panel_fini(intel_connector);
>  
>  	drm_connector_cleanup(connector);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 34dc850340b8..6feb232bb1c2 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -351,6 +351,9 @@ struct intel_vbt_panel_data {
>  };
>  
>  struct intel_panel {
> +	/* Fixed EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
> +	const struct drm_edid *fixed_edid;
> +
>  	struct list_head fixed_modes;
>  
>  	/* backlight */
> @@ -591,8 +594,7 @@ struct intel_connector {
>  	/* Panel info for eDP and LVDS */
>  	struct intel_panel panel;
>  
> -	/* Cached EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
> -	const struct drm_edid *edid;
> +	/* Cached EDID for detect. */
>  	const struct drm_edid *detect_edid;
>  
>  	/* Number of times hotplug detection was tried after an HPD interrupt */
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a44eefb97e8d..e14c13444643 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4477,18 +4477,19 @@ bool intel_digital_port_connected(struct intel_encoder *encoder)
>  static const struct drm_edid *
>  intel_dp_get_edid(struct intel_dp *intel_dp)
>  {
> -	struct intel_connector *intel_connector = intel_dp->attached_connector;
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	const struct drm_edid *fixed_edid = connector->panel.fixed_edid;
>  
> -	/* use cached edid if we have one */
> -	if (intel_connector->edid) {
> +	/* Use panel fixed edid if we have one */
> +	if (fixed_edid) {
>  		/* invalid edid */
> -		if (IS_ERR(intel_connector->edid))
> +		if (IS_ERR(fixed_edid))
>  			return NULL;
>  
> -		return drm_edid_dup(intel_connector->edid);
> -	} else
> -		return drm_edid_read_ddc(&intel_connector->base,
> -					 &intel_dp->aux.ddc);
> +		return drm_edid_dup(fixed_edid);
> +	}
> +
> +	return drm_edid_read_ddc(&connector->base, &intel_dp->aux.ddc);
>  }
>  
>  static void
> @@ -5313,7 +5314,6 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  	} else {
>  		drm_edid = ERR_PTR(-ENOENT);
>  	}
> -	intel_connector->edid = drm_edid;
>  
>  	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, encoder->devdata,
>  				   IS_ERR(drm_edid) ? NULL : drm_edid);
> @@ -5340,7 +5340,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  		goto out_vdd_off;
>  	}
>  
> -	intel_panel_init(intel_connector);
> +	intel_panel_init(intel_connector, drm_edid);
>  
>  	intel_edp_backlight_setup(intel_dp, intel_connector);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dvo.c b/drivers/gpu/drm/i915/display/intel_dvo.c
> index 4aeae0f3ac91..0be8105cb18a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_dvo.c
> @@ -554,6 +554,6 @@ void intel_dvo_init(struct drm_i915_private *i915)
>  		 */
>  		intel_panel_add_encoder_fixed_mode(connector, encoder);
>  
> -		intel_panel_init(connector);
> +		intel_panel_init(connector, NULL);
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_lvds.c b/drivers/gpu/drm/i915/display/intel_lvds.c
> index 9f6910bba2e9..a1557d84ce0a 100644
> --- a/drivers/gpu/drm/i915/display/intel_lvds.c
> +++ b/drivers/gpu/drm/i915/display/intel_lvds.c
> @@ -477,10 +477,11 @@ static int intel_lvds_compute_config(struct intel_encoder *intel_encoder,
>  static int intel_lvds_get_modes(struct drm_connector *connector)
>  {
>  	struct intel_connector *intel_connector = to_intel_connector(connector);
> +	const struct drm_edid *fixed_edid = intel_connector->panel.fixed_edid;
>  
> -	/* use cached edid if we have one */
> -	if (!IS_ERR_OR_NULL(intel_connector->edid)) {
> -		drm_edid_connector_update(connector, intel_connector->edid);
> +	/* Use panel fixed edid if we have one */
> +	if (!IS_ERR_OR_NULL(fixed_edid)) {
> +		drm_edid_connector_update(connector, fixed_edid);
>  
>  		return drm_edid_connector_add_modes(connector);
>  	}
> @@ -974,8 +975,6 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
>  	} else {
>  		drm_edid = ERR_PTR(-ENOENT);
>  	}
> -	intel_connector->edid = drm_edid;
> -
>  	intel_bios_init_panel_late(dev_priv, &intel_connector->panel, NULL,
>  				   IS_ERR(drm_edid) ? NULL : drm_edid);
>  
> @@ -1000,7 +999,7 @@ void intel_lvds_init(struct drm_i915_private *dev_priv)
>  	if (!intel_panel_preferred_fixed_mode(intel_connector))
>  		goto failed;
>  
> -	intel_panel_init(intel_connector);
> +	intel_panel_init(intel_connector, drm_edid);
>  
>  	intel_backlight_setup(intel_connector, INVALID_PIPE);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 3b1004b019a8..42aa04bac261 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -31,6 +31,8 @@
>  #include <linux/kernel.h>
>  #include <linux/pwm.h>
>  
> +#include <drm/drm_edid.h>
> +
>  #include "i915_reg.h"
>  #include "intel_backlight.h"
>  #include "intel_connector.h"
> @@ -670,10 +672,13 @@ void intel_panel_init_alloc(struct intel_connector *connector)
>  	INIT_LIST_HEAD(&panel->fixed_modes);
>  }
>  
> -int intel_panel_init(struct intel_connector *connector)
> +int intel_panel_init(struct intel_connector *connector,
> +		     const struct drm_edid *fixed_edid)
>  {
>  	struct intel_panel *panel = &connector->panel;
>  
> +	panel->fixed_edid = fixed_edid;
> +
>  	intel_backlight_init_funcs(panel);
>  
>  	if (!has_drrs_modes(connector))
> @@ -692,6 +697,9 @@ void intel_panel_fini(struct intel_connector *connector)
>  	struct intel_panel *panel = &connector->panel;
>  	struct drm_display_mode *fixed_mode, *next;
>  
> +	if (!IS_ERR_OR_NULL(panel->fixed_edid))
> +		drm_edid_free(panel->fixed_edid);
> +
>  	intel_backlight_destroy(panel);
>  
>  	intel_bios_fini_panel(panel);
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
> index 4b51e1c51da6..15a8c897b33f 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.h
> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
> @@ -13,13 +13,15 @@ enum drrs_type;
>  struct drm_connector;
>  struct drm_connector_state;
>  struct drm_display_mode;
> +struct drm_edid;
>  struct drm_i915_private;
>  struct intel_connector;
>  struct intel_crtc_state;
>  struct intel_encoder;
>  
>  void intel_panel_init_alloc(struct intel_connector *connector);
> -int intel_panel_init(struct intel_connector *connector);
> +int intel_panel_init(struct intel_connector *connector,
> +		     const struct drm_edid *fixed_edid);
>  void intel_panel_fini(struct intel_connector *connector);
>  enum drm_connector_status
>  intel_panel_detect(struct drm_connector *connector, bool force);
> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
> index 21805c15d5eb..c58e5cfa8e88 100644
> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
> @@ -2903,7 +2903,7 @@ intel_sdvo_lvds_init(struct intel_sdvo *intel_sdvo, u16 type)
>  		mutex_unlock(&i915->drm.mode_config.mutex);
>  	}
>  
> -	intel_panel_init(intel_connector);
> +	intel_panel_init(intel_connector, NULL);
>  
>  	if (!intel_panel_preferred_fixed_mode(intel_connector))
>  		goto err;
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 662bdb656aa3..2289f6b1b4eb 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1983,7 +1983,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  		goto err_cleanup_connector;
>  	}
>  
> -	intel_panel_init(intel_connector);
> +	intel_panel_init(intel_connector, NULL);
>  
>  	intel_backlight_setup(intel_connector, INVALID_PIPE);
>  
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
