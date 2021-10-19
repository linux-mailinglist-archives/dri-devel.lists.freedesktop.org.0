Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC82F433E24
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B0289259;
	Tue, 19 Oct 2021 18:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09A89259;
 Tue, 19 Oct 2021 18:09:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="208696114"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="208696114"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 11:09:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="630077639"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga001.fm.intel.com with SMTP; 19 Oct 2021 11:09:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Oct 2021 21:09:52 +0300
Date: Tue, 19 Oct 2021 21:09:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <seanpaul@chromium.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] drm/i915: Add support for panels with VESA
 backlights with PWM enable/disable
Message-ID: <YW8J8Nc7UJnISaVg@intel.com>
References: <20211006024018.320394-1-lyude@redhat.com>
 <20211006024018.320394-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211006024018.320394-2-lyude@redhat.com>
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

On Tue, Oct 05, 2021 at 10:40:14PM -0400, Lyude Paul wrote:
> This simply adds proper support for panel backlights that can be controlled
> via VESA's backlight control protocol, but which also require that we
> enable and disable the backlight via PWM instead of via the DPCD interface.
> We also enable this by default, in order to fix some people's backlights
> that were broken by not having this enabled.
> 
> For reference, backlights that require this and use VESA's backlight
> interface tend to be laptops with hybrid GPUs, but this very well may
> change in the future.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Link: https://gitlab.freedesktop.org/drm/intel/-/issues/3680
> Fixes: fe7d52bccab6 ("drm/i915/dp: Don't use DPCD backlights that need PWM enable/disable")
> Cc: <stable@vger.kernel.org> # v5.12+
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 569d17b4d00f..594fdc7453ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -293,6 +293,10 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	struct intel_panel *panel = &connector->panel;
>  	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
> +	if (!panel->backlight.edp.vesa.info.aux_enable)
> +		panel->backlight.pwm_funcs->enable(crtc_state, conn_state,
> +						   panel->backlight.pwm_level_max);

What't the story here with the non-inverted max vs. pontetially inverted
0 in the counterpart?

> +
>  	drm_edp_backlight_enable(&intel_dp->aux, &panel->backlight.edp.vesa.info, level);
>  }
>  
> @@ -304,6 +308,10 @@ static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state
>  	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
>  	drm_edp_backlight_disable(&intel_dp->aux, &panel->backlight.edp.vesa.info);
> +
> +	if (!panel->backlight.edp.vesa.info.aux_enable)
> +		panel->backlight.pwm_funcs->disable(old_conn_state,
> +						    intel_backlight_invert_pwm_level(connector, 0));
>  }
>  
>  static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector, enum pipe pipe)
> @@ -321,6 +329,15 @@ static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
>  	if (ret < 0)
>  		return ret;
>  
> +	if (!panel->backlight.edp.vesa.info.aux_enable) {
> +		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
> +		if (ret < 0) {
> +			drm_err(&i915->drm,
> +				"Failed to setup PWM backlight controls for eDP backlight: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
>  	panel->backlight.max = panel->backlight.edp.vesa.info.max;
>  	panel->backlight.min = 0;
>  	if (current_mode == DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
> @@ -340,12 +357,7 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  
> -	/* TODO: We currently only support AUX only backlight configurations, not backlights which
> -	 * require a mix of PWM and AUX controls to work. In the mean time, these machines typically
> -	 * work just fine using normal PWM controls anyway.
> -	 */
> -	if ((intel_dp->edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&
> -	    drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
> +	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
>  		drm_dbg_kms(&i915->drm, "AUX Backlight Control Supported!\n");
>  		return true;
>  	}
> -- 
> 2.31.1

-- 
Ville Syrjälä
Intel
