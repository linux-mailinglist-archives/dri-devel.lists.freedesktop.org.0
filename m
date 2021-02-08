Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17BB313056
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 12:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6F06E891;
	Mon,  8 Feb 2021 11:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F263B6E891;
 Mon,  8 Feb 2021 11:13:51 +0000 (UTC)
IronPort-SDR: M7Ug7JkYOUK4eSzT99dFT+qWHOsD+7yeKWmHirbwFJhhu5E5nhdud1afXDPT24GgJR7K4KllpD
 aL8SPodPwHDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="178186270"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="178186270"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:13:51 -0800
IronPort-SDR: 72BhK+PYX5SXFdE5xSaBmV/sMqYWgucbXpUuZsoL6ck754NVlfg0TKmzD9cv+oeAOc+OoAyGqy
 7pJ38Q+yx+8g==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="374455108"
Received: from anveshag-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.119.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 03:13:49 -0800
Date: Mon, 8 Feb 2021 06:13:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v3 06/10] drm/i915/dpcd_bl: Cache some backlight
 capabilities in intel_panel.backlight
Message-ID: <20210208111347.GB4798@intel.com>
References: <20210205234515.1216538-1-lyude@redhat.com>
 <20210205234515.1216538-7-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205234515.1216538-7-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Uma Shankar <uma.shankar@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 05, 2021 at 06:45:10PM -0500, Lyude Paul wrote:
> Since we're about to be moving this code into shared DRM helpers, we might
> as well start to cache certain backlight capabilities that can be
> determined from the EDP DPCD, and are likely to be relevant to the majority
> of drivers using said helpers. The main purpose of this is just to prevent
> every driver from having to check everything against the eDP DPCD using DP
> macros, which makes the code slightly easier to read (especially since the
> names of some of the eDP capabilities don't exactly match up with what we
> actually need to use them for, like DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT
> for instance).
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  .../drm/i915/display/intel_display_types.h    |  2 ++
>  .../drm/i915/display/intel_dp_aux_backlight.c | 29 ++++++++++++-------
>  2 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index f4b26e1dbaaf..16824eb3ef93 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -265,6 +265,8 @@ struct intel_panel {
>  			struct {
>  				u8 pwmgen_bit_count;
>  				u8 pwm_freq_pre_divider;
> +				bool lsb_reg_used;
> +				bool aux_enable;
>  			} vesa;
>  			struct {
>  				bool sdr_uses_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 95e3e344cf40..f5ae2fb34c1f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -270,13 +270,14 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pi
>  }
>  
>  /* VESA backlight callbacks */
> -static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
> +static void set_vesa_backlight_enable(struct intel_connector *connector, bool enable)
>  {
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	u8 reg_val = 0;
>  
>  	/* Early return when display use other mechanism to enable backlight. */
> -	if (!(intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP))
> +	if (!connector->panel.backlight.edp.vesa.aux_enable)
>  		return;
>  
>  	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_DISPLAY_CONTROL_REGISTER, &reg_val) != 1) {
> @@ -339,9 +340,11 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
>  			    DP_EDP_BACKLIGHT_BRIGHTNESS_MSB);
>  		return 0;
>  	}
> -	level = read_val[0];
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> +
> +	if (connector->panel.backlight.edp.vesa.lsb_reg_used)
>  		level = (read_val[0] << 8 | read_val[1]);
> +	else
> +		level = read_val[0];
>  
>  	return level;
>  }
> @@ -359,13 +362,14 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	u8 vals[2] = { 0x0 };
>  
> -	vals[0] = level;
> -
>  	/* Write the MSB and/or LSB */
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT) {
> +	if (connector->panel.backlight.edp.vesa.lsb_reg_used) {
>  		vals[0] = (level & 0xFF00) >> 8;
>  		vals[1] = (level & 0xFF);
> +	} else {
> +		vals[0] = level;
>  	}
> +
>  	if (drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB, vals,
>  			      sizeof(vals)) != sizeof(vals)) {
>  		drm_dbg_kms(&i915->drm,
> @@ -419,14 +423,13 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	}
>  
>  	intel_dp_aux_vesa_set_backlight(conn_state, level);
> -	set_vesa_backlight_enable(intel_dp, true);
> +	set_vesa_backlight_enable(connector, true);
>  }
>  
>  static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state,
>  						u32 level)
>  {
> -	set_vesa_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
> -				  false);
> +	set_vesa_backlight_enable(to_intel_connector(old_conn_state->connector), false);
>  }
>  
>  /*
> @@ -524,8 +527,14 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
>  static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
>  					     enum pipe pipe)
>  {
> +	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct intel_panel *panel = &connector->panel;
>  
> +	if (intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP)
> +		panel->backlight.edp.vesa.aux_enable = true;
> +	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> +		panel->backlight.edp.vesa.lsb_reg_used = true;
> +
>  	panel->backlight.max = intel_dp_aux_vesa_calc_max_backlight(connector);
>  	if (!panel->backlight.max)
>  		return -ENODEV;
> -- 
> 2.29.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
