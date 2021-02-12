Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE858319D58
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 12:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FC36E098;
	Fri, 12 Feb 2021 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4106E098;
 Fri, 12 Feb 2021 11:28:42 +0000 (UTC)
IronPort-SDR: aJKvRe8W5BIxSFi5KXutJrHnrCExR4RntJQi+Af91MHAqXBqg2WRkfx+C7rh4XviI6beZ7E6QD
 O5gxp35U8n+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="178889862"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="178889862"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 03:28:42 -0800
IronPort-SDR: 10O1SAjzXR69ChWDX/cN8MLqIhMl+B9DJrP/wpC0lbj/31h38bep16Q2KxFSH6WHcCsqjDYRfk
 71qik/sLdFaA==
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; d="scan'208";a="397943677"
Received: from mpetrica-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.176])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2021 03:28:38 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [RFC v4 05/11] drm/i915/dpcd_bl: Cleanup
 intel_dp_aux_vesa_enable_backlight() a bit
In-Reply-To: <20210208233902.1289693-6-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210208233902.1289693-1-lyude@redhat.com>
 <20210208233902.1289693-6-lyude@redhat.com>
Date: Fri, 12 Feb 2021 13:28:35 +0200
Message-ID: <87h7mhcyos.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Feb 2021, Lyude Paul <lyude@redhat.com> wrote:
> Get rid of the extraneous switch case in here, and just open code
> edp_backlight_mode as we only ever use it once.
>
> v4:
> * Check that backlight mode is DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD, not
>   DP_EDP_BACKLIGHT_CONTROL_MODE_MASK - imirkin
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  .../gpu/drm/i915/display/intel_dp_aux_backlight.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c37ccc8538cb..57218faed4a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -382,7 +382,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_panel *panel = &connector->panel;
> -	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
> +	u8 dpcd_buf, new_dpcd_buf;
>  	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
>  
>  	if (drm_dp_dpcd_readb(&intel_dp->aux,
> @@ -393,12 +393,8 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	}
>  
>  	new_dpcd_buf = dpcd_buf;
> -	edp_backlight_mode = dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>  
> -	switch (edp_backlight_mode) {
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_PWM:
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRESET:
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_PRODUCT:
> +	if ((dpcd_buf & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK) != DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD) {
>  		new_dpcd_buf &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
>  		new_dpcd_buf |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
>  
> @@ -406,13 +402,6 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  				       pwmgen_bit_count) != 1)

What baseline is this on? None that I can think of have the above != 1,
they're all < 0 AFAICT.

BR,
Jani.


>  			drm_dbg_kms(&i915->drm,
>  				    "Failed to write aux pwmgen bit count\n");
> -
> -		break;
> -
> -	/* Do nothing when it is already DPCD mode */
> -	case DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD:
> -	default:
> -		break;
>  	}
>  
>  	if (panel->backlight.edp.vesa.pwm_freq_pre_divider) {

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
