Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 031492D7825
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C226E12D;
	Fri, 11 Dec 2020 14:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3DA6E0AF;
 Fri, 11 Dec 2020 14:46:03 +0000 (UTC)
IronPort-SDR: gUzMJ1LnKN8ssKYWx+83LYxJefduWlPr+GVSoQDIIxLCtriqJsYVnHXOnNobsYDOYQxTjkJE/V
 ymI5YdR3giiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="153671941"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="153671941"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 06:45:52 -0800
IronPort-SDR: /ngbSrQ1+06qBTxvwHX9Thh+w4yDJG/z1kiOeT2okMe9ZBLH0GEj1D6wvmfD0IQxVHIA+423xX
 GiKwfX8YMVJw==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="349481698"
Received: from dkreft-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.158.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 06:45:45 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC 3/5] drm/i915/dp: Remove redundant AUX backlight frequency
 calculations
In-Reply-To: <20201210012143.729402-4-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201210012143.729402-1-lyude@redhat.com>
 <20201210012143.729402-4-lyude@redhat.com>
Date: Fri, 11 Dec 2020 16:45:41 +0200
Message-ID: <87eejw765m.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, greg.depoire@gmail.com,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 09 Dec 2020, Lyude Paul <lyude@redhat.com> wrote:
> Noticed this while moving all of the VESA backlight code in i915 over to
> DRM helpers: it would appear that we calculate the frequency value we want
> to write to DP_EDP_BACKLIGHT_FREQ_SET twice even though this value never
> actually changes during runtime. So, let's simplify things by just caching
> this value in intel_panel.backlight, and re-writing it as-needed.

This isn't a full review, just something I spotted so far. Please see
inline.

BR,
Jani.


>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: greg.depoire@gmail.com
> ---
>  .../drm/i915/display/intel_display_types.h    |  1 +
>  .../drm/i915/display/intel_dp_aux_backlight.c | 64 ++++++-------------
>  2 files changed, 19 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 5bc5bfbc4551..133c9cb742a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -259,6 +259,7 @@ struct intel_panel {
>  
>  		/* DPCD backlight */
>  		u8 pwmgen_bit_count;
> +		u8 pwm_freq_pre_divider;
>  
>  		struct backlight_device *device;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 4fd536801b14..94ce5ca1affa 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -129,50 +129,6 @@ intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 lev
>  	}
>  }
>  
> -/*
> - * Set PWM Frequency divider to match desired frequency in vbt.
> - * The PWM Frequency is calculated as 27Mhz / (F x P).
> - * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
> - *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
> - * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
> - *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
> - */
> -static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
> -{
> -	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	const u8 pn = connector->panel.backlight.pwmgen_bit_count;
> -	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
> -
> -	freq = dev_priv->vbt.backlight.pwm_freq_hz;
> -	if (!freq) {
> -		drm_dbg_kms(&dev_priv->drm,
> -			    "Use panel default backlight frequency\n");
> -		return false;
> -	}
> -
> -	fxp = DIV_ROUND_CLOSEST(KHz(DP_EDP_BACKLIGHT_FREQ_BASE_KHZ), freq);
> -	f = clamp(DIV_ROUND_CLOSEST(fxp, 1 << pn), 1, 255);
> -	fxp_actual = f << pn;
> -
> -	/* Ensure frequency is within 25% of desired value */
> -	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
> -	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> -
> -	if (fxp_min > fxp_actual || fxp_actual > fxp_max) {
> -		drm_dbg_kms(&dev_priv->drm, "Actual frequency out of range\n");
> -		return false;
> -	}
> -
> -	if (drm_dp_dpcd_writeb(&intel_dp->aux,
> -			       DP_EDP_BACKLIGHT_FREQ_SET, (u8) f) < 0) {
> -		drm_dbg_kms(&dev_priv->drm,
> -			    "Failed to write aux backlight freq\n");
> -		return false;
> -	}
> -	return true;
> -}
> -
>  static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_state,
>  					  const struct drm_connector_state *conn_state)
>  {
> @@ -213,9 +169,13 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>  		break;
>  	}
>  
> -	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
> -		if (intel_dp_aux_set_pwm_freq(connector))
> +	if (panel->backlight.pwm_freq_pre_divider) {
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_EDP_BACKLIGHT_FREQ_SET,
> +				       panel->backlight.pwm_freq_pre_divider) == 1)
>  			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
> +		else
> +			drm_dbg_kms(&i915->drm, "Failed to write aux backlight frequency\n");
> +	}
>  
>  	if (new_dpcd_buf != dpcd_buf) {
>  		if (drm_dp_dpcd_writeb(&intel_dp->aux,
> @@ -236,6 +196,14 @@ static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old
>  				 false);
>  }
>  
> +/*
> + * Compute PWM frequency divider value based off the frequency provided to us by the vbt.
> + * The PWM Frequency is calculated as 27Mhz / (F x P).
> + * - Where F = PWM Frequency Pre-Divider value programmed by field 7:0 of the
> + *             EDP_BACKLIGHT_FREQ_SET register (DPCD Address 00728h)
> + * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
> + *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
> + */
>  static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> @@ -287,8 +255,10 @@ static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
>  	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>  	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
>  
> +	/* Ensure frequency is within 25% of desired value */
>  	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
>  	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
> +
>  	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {
>  		drm_dbg_kms(&i915->drm,
>  			    "VBT defined backlight frequency out of range\n");
> @@ -309,7 +279,9 @@ static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
>  			    "Failed to write aux pwmgen bit count\n");
>  		return max_backlight;
>  	}
> +
>  	panel->backlight.pwmgen_bit_count = pn;
> +	panel->backlight.pwm_freq_pre_divider = f;

This should be wrapped in

	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)

but you do it in the next patch, so this patch is a bit broken.


>  
>  	max_backlight = (1 << pn) - 1;

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
