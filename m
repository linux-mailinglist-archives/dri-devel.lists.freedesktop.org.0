Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5B2E1FC2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 18:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AEE6E0C5;
	Wed, 23 Dec 2020 17:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985916E06E;
 Wed, 23 Dec 2020 17:13:21 +0000 (UTC)
IronPort-SDR: NaThUbQL0Rgql8VZuSqmeb7oF6+yv05We4Ex8j87EOxsw3dQMHZoYNaSFcbymJDOlsO87O72Vc
 6+qCT5t3ythw==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="194494665"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="194494665"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 09:13:09 -0800
IronPort-SDR: ZRDYyDgII9EV81cbu9GINTG/C+CEGbePUs2x/sqVgpJv3PLp/5cL5qe48KmzkvWK+9b/xnpHTR
 1VfY1CzlJBvA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="374062808"
Received: from odonov3x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.250.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 09:12:58 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 8/9] drm/i915/dp: Allow forcing specific interfaces
 through enable_dpcd_backlight
In-Reply-To: <20201204223603.249878-9-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201204223603.249878-1-lyude@redhat.com>
 <20201204223603.249878-9-lyude@redhat.com>
Date: Wed, 23 Dec 2020 19:12:53 +0200
Message-ID: <87tuscmooa.fsf@intel.com>
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
 Vasily Khoruzhick <anarsoul@gmail.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Dec 2020, Lyude Paul <lyude@redhat.com> wrote:
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
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 45 +++++++++++++++++--
>  drivers/gpu/drm/i915/i915_params.c            |  2 +-
>  2 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 9a3ff3ffc158..eef14ab6bddc 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -609,15 +609,54 @@ static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
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

I take it this is what the machines report? *rolls eyes*.

> +			try_vesa_interface = true;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_ON:
> +		if (i915->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
> +			try_intel_interface = true;

This could use an explanation - why not try the intel interface in this
case?

Anyway, good enough,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

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
> @@ -626,13 +665,13 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  	 * and will only work with the Intel interface. So, always probe for
>  	 * that first.
>  	 */
> -	if (intel_dp_aux_supports_hdr_backlight(connector)) {
> +	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector)) {
>  		drm_dbg(dev, "Using Intel proprietary eDP backlight controls\n");
>  		panel->backlight.funcs = &intel_dp_hdr_bl_funcs;
>  		return 0;
>  	}
>  
> -	if (intel_dp_aux_supports_vesa_backlight(connector)) {
> +	if (try_vesa_interface && intel_dp_aux_supports_vesa_backlight(connector)) {
>  		drm_dbg(dev, "Using VESA eDP backlight controls\n");
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
