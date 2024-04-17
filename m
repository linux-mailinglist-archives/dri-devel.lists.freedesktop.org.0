Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C75D8A7FF3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 11:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F4A113333;
	Wed, 17 Apr 2024 09:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h9h0uxBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2680113330;
 Wed, 17 Apr 2024 09:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713346785; x=1744882785;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zvVugPyu+y2p2fBl+xfTnAm3IxTYfe1nJK3ynLtEv1g=;
 b=h9h0uxBkZmd1b9wPw80IUP2dETbUApqEWfdwWAhsvP6AWIaDexFN1IpG
 etnrEcVUHS9LKHObTmgiPUlghOv9HPN1hksQcwVxRjXpltjcnlCdWydKY
 ivN6NWjKZAzSeCYz7k1NBD0ZIpHOSsRynsmu/58v/mohVYSapP6/Bw6cy
 +C72oeFXFNmtW3RfMn/zTnMlETXUgNmYJsEw/+2E2tDOooySRHw7HyDul
 8HniCT9hkhb5I4ZWUHpyCIcahMAixTsCBAl/nmgScDDC7Nhhz2ZBsxAvd
 /9ES7SJjF3ubiVbKCc3bP7Ftm8teLPqSOSrBqVvneoiVTnS0W8MPx+sas w==;
X-CSE-ConnectionGUID: hN2TbvpeTn2fE+EmJdQV+w==
X-CSE-MsgGUID: Wr883DPfTKW6uGTtNt1vIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20248711"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="20248711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:39:45 -0700
X-CSE-ConnectionGUID: lBACt1ONRJCPpw3H1K1KuQ==
X-CSE-MsgGUID: iCk7aqxPReqKpSKk8Y6N6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="45865502"
Received: from vpus-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.45.164])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:39:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Khaled Almahallawy
 <khaled.almahallawy@intel.com>
Subject: Re: [PATCH v2 11/11] drm/i915/dp_mst: Enable HBLANK expansion quirk
 for UHBR rates
In-Reply-To: <20240416221010.376865-12-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240416221010.376865-1-imre.deak@intel.com>
 <20240416221010.376865-12-imre.deak@intel.com>
Date: Wed, 17 Apr 2024 12:39:40 +0300
Message-ID: <87y19cxr8j.fsf@intel.com>
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

On Wed, 17 Apr 2024, Imre Deak <imre.deak@intel.com> wrote:
> Enabling the 5k@60Hz uncompressed mode on the MediaTek/Dell U3224KBA
> monitor results in a blank screen, at least on MTL platforms on UHBR
> link rates with some (<30) uncompressed bpp values. Enabling compression
> fixes the problem, so do that for now. Windows enables DSC always if the
> sink supports it and forcing it to enable the mode without compression
> leads to the same problem above (which suggests a panel issue with
> uncompressed mode).
>
> The same 5k mode on non-UHBR link rates is not affected and lower
> resolution modes are not affected either. The problem is similar to the
> one fixed by the HBLANK expansion quirk on Synaptics hubs, with the
> difference that the problematic mode has a longer HBLANK duration. Also
> the monitor doesn't report supporting HBLANK expansion; either its
> internal MST hub does the expansion internally - similarly to the
> Synaptics hub - or the issue has another root cause, but still related
> to the mode's short HBLANK duration. Enable the quirk for the monitor
> adjusting the detection for the above differences.
>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Tested-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c     |  2 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 22 +++++++++++++++++----
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 023907da98581..79a615667aab1 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2281,6 +2281,8 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
>  	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) },
>  	/* Synaptics DP1.4 MST hubs require DSC for some modes on which it applies HBLANK expansion. */
>  	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID_ANY, true, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
> +	/* MediaTek panels (at least in U3224KBA) require DSC for modes with a short HBLANK on UHBR links. */
> +	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
>  	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
>  	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
>  };
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index fb5e167c3c659..71b01f7631919 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -421,15 +421,22 @@ static int mode_hblank_period_ns(const struct drm_display_mode *mode)
>  
>  static bool
>  hblank_expansion_quirk_needs_dsc(const struct intel_connector *connector,
> -				 const struct intel_crtc_state *crtc_state)
> +				 const struct intel_crtc_state *crtc_state,
> +				 const struct link_config_limits *limits)
>  {
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
> +	bool is_uhbr_sink = connector->mst_port &&
> +			    drm_dp_uhbr_channel_coding_supported(connector->mst_port->dpcd);

Why do you combine connector->mst_port to "is uhbr sink"? I think it's
confusing.

> +	int hblank_limit = is_uhbr_sink ? 500 : 300;
>  
>  	if (!connector->dp.dsc_hblank_expansion_quirk)
>  		return false;
>  
> -	if (mode_hblank_period_ns(adjusted_mode) > 300)
> +	if (is_uhbr_sink && !drm_dp_is_uhbr_rate(limits->max_rate))

I'm not saying that's not correct, but I find that condition a bit
surprising. "This does not apply to sinks capable of 128b/132b, but not
running at UHBR."

IOW, this applies to sinks not capable of 128b/132b, and sinks capable
of 128b/132b and running at UHBR.

A head scratcher.

> +		return false;
> +
> +	if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
>  		return false;
>  
>  	return true;
> @@ -445,7 +452,7 @@ adjust_limits_for_dsc_hblank_expansion_quirk(const struct intel_connector *conne
>  	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>  	int min_bpp_x16 = limits->link.min_bpp_x16;
>  
> -	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state))
> +	if (!hblank_expansion_quirk_needs_dsc(connector, crtc_state, limits))
>  		return true;
>  
>  	if (!dsc) {
> @@ -1604,7 +1611,14 @@ static bool detect_dsc_hblank_expansion_quirk(const struct intel_connector *conn
>  			      DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC))
>  		return false;
>  
> -	if (!(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
> +	/*
> +	 * UHBR (MST sink) devices requiring this quirk doesn't advertise the

What are you trying to say with "UHBR (MST sink)"? We've (read: I) have
been confused by this in the past, and casually equating UHBR and MST
isn't helping.

BR,
Jani.


> +	 * HBLANK expansion support. Presuming that they perform HBLANK
> +	 * expansion internally, or are affected by this issue on modes with a
> +	 * short HBLANK for other reasons.
> +	 */
> +	if (!drm_dp_uhbr_channel_coding_supported(dpcd) &&
> +	    !(dpcd[DP_RECEIVE_PORT_0_CAP_0] & DP_HBLANK_EXPANSION_CAPABLE))
>  		return false;
>  
>  	drm_dbg_kms(&i915->drm,

-- 
Jani Nikula, Intel
