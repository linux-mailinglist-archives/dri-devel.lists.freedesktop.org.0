Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E22AB683A
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 11:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6894910E5FF;
	Wed, 14 May 2025 09:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FNTAGICY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B6610E5FF;
 Wed, 14 May 2025 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747216701; x=1778752701;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HVL87PUyj8hAOrze4BEi42JicmtVmP4pFT4ZsWlTY2s=;
 b=FNTAGICYWvL8p62/bD/I7i6nFRibeO3WQqJgNaGpcYZlMUaLDvBhE+9l
 zOdNvPM25+Podrk6xOeOQkdrkGhLOnGoXf4l9fJNxuc3m+xBXgtXpA6vh
 vBxnfne17osh9QvreeTTbjuvRXYQDbBvGSzXKKkK2w7gcPgOvRGr/Bbga
 w2KV2qzhoc7XKo4PNwztWwv5HYCOnOCBKLElsd/gb3FNCz7WL+JtOOOBx
 TVp8z+5PLbjdb+ek/CDwbzeL4+VX9+bLsfTzbYiAx60vprTAZFjm2wp0m
 ft1pHJatHICm1ZiaiIksyjth+x9ODgQ5UUNwtMuAvyLKKXloTbcJmnQmh w==;
X-CSE-ConnectionGUID: I9uY/5L5QDiy5MA0o9n7XQ==
X-CSE-MsgGUID: Yw1QbYIQSESFJbVBLjQQOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52908653"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="52908653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:58:21 -0700
X-CSE-ConnectionGUID: kcXD03zfQcacSUCbuL2OUg==
X-CSE-MsgGUID: NBuVwSQuTD6ruSkx3NWuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="138042591"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.180])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 02:58:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/dp: Add quirk for panel with HBR3 without TPS4
In-Reply-To: <20250514084356.1558407-3-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250514084356.1558407-1-ankit.k.nautiyal@intel.com>
 <20250514084356.1558407-3-ankit.k.nautiyal@intel.com>
Date: Wed, 14 May 2025 12:58:16 +0300
Message-ID: <87y0uzh5tz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 14 May 2025, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> For DP, TPS4 is a requirement for supporting HBR3, but for eDP its a
> bit ambiguous. Some broken eDP sinks declare support for HBR3 without
> TPS4, but are unable to produce a stable output. For these panels
> add a quirk to reject HBR3 rate if TPS4 is not supported.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c |  2 +
>  drivers/gpu/drm/i915/display/intel_dp.c | 74 ++++++++++++++++++++++---
>  include/drm/display/drm_dp_helper.h     |  8 +++
>  3 files changed, 77 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 56c7e3318f01..6f849146dd98 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2519,6 +2519,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>  	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>  	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
> +	/* Novatek panel */
> +	{ OUI(0x38, 0xEC, 0x11), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBR3_WITHOUT_TPS4) },
>  };
>  
>  #undef OUI
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 97cf80372264..6c5debc8310d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -173,12 +173,53 @@ int intel_dp_link_symbol_clock(int rate)
>  	return DIV_ROUND_CLOSEST(rate * 10, intel_dp_link_symbol_size(rate));
>  }
>  
> +static bool detected_hbr3_tps4_quirk(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	struct drm_dp_aux *aux = &intel_dp->aux;
> +	struct drm_dp_desc desc;
> +
> +	if (drm_dp_read_desc(aux, &desc, drm_dp_is_branch(intel_dp->dpcd)) < 0)
> +		return false;
> +
> +	if (!drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_HBR3_WITHOUT_TPS4))
> +		return false;
> +
> +	drm_dbg_kms(display->drm,
> +		    "[CONNECTOR:%d:%s] HBR3 without TPS4 quirk detected\n",
> +		    connector->base.base.id, connector->base.name);
> +
> +	return true;
> +}

This function is unnecessary. It's just
drm_dp_has_quirk(&intel_dp->desc, ...) and that's it.

You already have the desc, no need to read it again, and the debug
logging is kind of excessive.

(We might want to add generic quirk detection debug logging in
drm_dp_get_quirks() but that's another matter.)

> +
>  static int max_dprx_rate(struct intel_dp *intel_dp)
>  {
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	int max_rate;
> +
>  	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> -		return drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
> +		max_rate = drm_dp_tunnel_max_dprx_rate(intel_dp->tunnel);
> +	else
> +		max_rate = drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
>  
> -	return drm_dp_bw_code_to_link_rate(intel_dp->dpcd[DP_MAX_LINK_RATE]);
> +	/*
> +	 * For DP TPS4 is a requirement for supporting HBR3, but for eDP its a
> +	 * bit ambiguous. Some broken eDP sinks declare support for HBR3 without
> +	 * TPS4, but are unable to produce a stable output. For these panels
> +	 * reject HBR3 when TPS4 is not available.
> +	 */
> +	if (max_rate >= 810000 &&
> +	    !drm_dp_tps4_supported(intel_dp->dpcd) &&
> +	    detected_hbr3_tps4_quirk(intel_dp)) {
> +		drm_dbg_kms(display->drm,
> +			    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
> +			    encoder->base.base.id, encoder->base.name);
> +		max_rate = 540000;
> +	}

All of this would be greatly simplified if you made the quirk just "max
rate is hbr2". The way this is defined now is complicated by the TPS4
stuff, and that's pretty much irrelevant for what the quirk actually
does, i.e. limits the max rate to 540000.

> +
> +	return max_rate;
>  }
>  
>  static int max_dprx_lane_count(struct intel_dp *intel_dp)
> @@ -4254,6 +4295,9 @@ static void intel_edp_mso_init(struct intel_dp *intel_dp)
>  static void
>  intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>  {
> +	struct intel_display *display = to_intel_display(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +
>  	intel_dp->num_sink_rates = 0;
>  
>  	if (intel_dp->edp_dpcd[0] >= DP_EDP_14) {
> @@ -4264,10 +4308,7 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>  				 sink_rates, sizeof(sink_rates));
>  
>  		for (i = 0; i < ARRAY_SIZE(sink_rates); i++) {
> -			int val = le16_to_cpu(sink_rates[i]);
> -
> -			if (val == 0)
> -				break;
> +			int rate;
>  
>  			/* Value read multiplied by 200kHz gives the per-lane
>  			 * link rate in kHz. The source rates are, however,
> @@ -4275,7 +4316,26 @@ intel_edp_set_sink_rates(struct intel_dp *intel_dp)
>  			 * back to symbols is
>  			 * (val * 200kHz)*(8/10 ch. encoding)*(1/8 bit to Byte)
>  			 */
> -			intel_dp->sink_rates[i] = (val * 200) / 10;
> +			rate = le16_to_cpu(sink_rates[i]) * 200 / 10;
> +
> +			if (rate == 0)
> +				break;
> +			/*
> +			 * For DP TPS4 is a requirement for supporting HBR3, but for eDP its a
> +			 * bit ambiugous. Some broken eDP sinks declare support for HBR3 without
> +			 * TPS4, but are unable to produce a stable output. For these panels
> +			 * reject HBR3 when TPS4 is not available.
> +			 */
> +			if (rate >= 810000 &&
> +			    !drm_dp_tps4_supported(intel_dp->dpcd) &&
> +			    detected_hbr3_tps4_quirk(intel_dp)) {
> +				drm_dbg_kms(display->drm,
> +					    "[ENCODER:%d:%s] Rejecting HBR3 due to missing TPS4 support\n",
> +					    encoder->base.base.id, encoder->base.name);
> +				break;
> +			}

Ditto.

> +
> +			intel_dp->sink_rates[i] = rate;
>  		}
>  		intel_dp->num_sink_rates = i;
>  	}
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 7b19192c7031..8021e9db67f2 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -809,6 +809,14 @@ enum drm_dp_quirk {
>  	 * requires enabling DSC.
>  	 */
>  	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
> +
> +	/**
> +	 * @DP_DPCD_QUIRK_HBR3_WITHOUT_TPS4:
> +	 *
> +	 * The device supports HBR3 without TPS4 but is unable to produce
> +	 * stable output.
> +	 */
> +	DP_DPCD_QUIRK_HBR3_WITHOUT_TPS4,

Ditto.

>  };
>  
>  /**

-- 
Jani Nikula, Intel
