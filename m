Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7728D2F1E91
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237E889DBD;
	Mon, 11 Jan 2021 19:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C20A89CDE;
 Mon, 11 Jan 2021 19:07:30 +0000 (UTC)
IronPort-SDR: 9bzIFXkeCNVqRNwFxBHtalH6lXayxg8n/lPVDXKgOyiBTad21FGi0wA4lxfFVCivlNLgUE5Dr7
 AQact0Yq13Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="157098559"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="157098559"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 11:07:29 -0800
IronPort-SDR: 12OcQy1fKKPohlZNhe1tPWmIM/NZ7ucT9RfazV4GHyN9VN8m4Hlmw00N7h9t7J/awfRJwK/Y8u
 2rYW0TT10U/g==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="381115963"
Received: from libresli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.207.39])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 11:07:24 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 3/4] drm/i915/dp: Allow forcing specific interfaces
 through enable_dpcd_backlight
In-Reply-To: <20210107225207.28091-4-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210107225207.28091-1-lyude@redhat.com>
 <20210107225207.28091-4-lyude@redhat.com>
Date: Mon, 11 Jan 2021 21:07:20 +0200
Message-ID: <87k0sjwavr.fsf@intel.com>
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
Cc: thaytan@noraisin.net, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Jan 2021, Lyude Paul <lyude@redhat.com> wrote:
> Since we now support controlling panel backlights through DPCD using
> both the standard VESA interface, and Intel's proprietary HDR backlight
> interface, we should allow the user to be able to explicitly choose
> between one or the other in the event that we're wrong about panels
> reliably reporting support for the Intel HDR interface.
>
> So, this commit adds support for this by introducing two new
> enable_dpcd_backlight options: 2 which forces i915 to only probe for the
> VESA interface, and 3 which forces i915 to only probe for the Intel
> backlight interface (might be useful if we find panels in the wild that
> report the VESA interface in their VBT, but actually only support the
> Intel backlight interface).
>
> v3:
> * Rebase
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Yup. Feels maybe a bit convoluted, but I'll trust your judgement as
you've been playing with these.

BR,
Jani.

> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 45 +++++++++++++++++--
>  drivers/gpu/drm/i915/i915_params.c            |  2 +-
>  2 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 5e761fb49a14..4b2cb20b1f94 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -613,15 +613,54 @@ static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
>  	.get = intel_dp_aux_vesa_get_backlight,
>  };
>  
> +enum intel_dp_aux_backlight_modparam {
> +	INTEL_DP_AUX_BACKLIGHT_AUTO = -1,
> +	INTEL_DP_AUX_BACKLIGHT_OFF = 0,
> +	INTEL_DP_AUX_BACKLIGHT_ON = 1,
> +	INTEL_DP_AUX_BACKLIGHT_FORCE_VESA = 2,
> +	INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL = 3,
> +};
> +
>  int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  {
>  	struct drm_device *dev = connector->base.dev;
>  	struct intel_panel *panel = &connector->panel;
>  	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	bool try_intel_interface = false, try_vesa_interface = false;
>  
> -	if (i915->params.enable_dpcd_backlight == 0)
> +	/* Check the VBT and user's module parameters to figure out which
> +	 * interfaces to probe
> +	 */
> +	switch (i915->params.enable_dpcd_backlight) {
> +	case INTEL_DP_AUX_BACKLIGHT_OFF:
>  		return -ENODEV;
> +	case INTEL_DP_AUX_BACKLIGHT_AUTO:
> +		switch (i915->vbt.backlight.type) {
> +		case INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE:
> +			try_vesa_interface = true;
> +			break;
> +		case INTEL_BACKLIGHT_DISPLAY_DDI:
> +			try_intel_interface = true;
> +			try_vesa_interface = true;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_ON:
> +		if (i915->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
> +			try_intel_interface = true;
> +
> +		try_vesa_interface = true;
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_FORCE_VESA:
> +		try_vesa_interface = true;
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL:
> +		try_intel_interface = true;
> +		break;
> +	}
>  
>  	/*
>  	 * A lot of eDP panels in the wild will report supporting both the
> @@ -630,13 +669,13 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	 * and will only work with the Intel interface. So, always probe for
>  	 * that first.
>  	 */
> -	if (intel_dp_aux_supports_hdr_backlight(connector)) {
> +	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector)) {
>  		drm_dbg_kms(dev, "Using Intel proprietary eDP backlight controls\n");
>  		panel->backlight.funcs = &intel_dp_hdr_bl_funcs;
>  		return 0;
>  	}
>  
> -	if (intel_dp_aux_supports_vesa_backlight(connector)) {
> +	if (try_vesa_interface && intel_dp_aux_supports_vesa_backlight(connector)) {
>  		drm_dbg_kms(dev, "Using VESA eDP backlight controls\n");
>  		panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
>  		return 0;
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 7f139ea4a90b..6939634e56ed 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -185,7 +185,7 @@ i915_param_named_unsafe(inject_probe_failure, uint, 0400,
>  
>  i915_param_named(enable_dpcd_backlight, int, 0400,
>  	"Enable support for DPCD backlight control"
> -	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enabled)");
> +	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enable, 2=force VESA interface, 3=force Intel interface)");
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_GVT)
>  i915_param_named(enable_gvt, bool, 0400,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
