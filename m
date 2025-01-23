Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E7A1A0FA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 10:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A546210E164;
	Thu, 23 Jan 2025 09:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSTntjkS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D0B10E164;
 Thu, 23 Jan 2025 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737625310; x=1769161310;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8o3XwouJaVxr8i1Fn1WmhSqn8CsB/ycHHa+M4kLJaC0=;
 b=GSTntjkS8a1MUG3ut4ZDi2FtI9q8Lr0ig8G4FVExdYkg1LTdNhHY5L2G
 X+LAZQnndx8CaYiIkPD1/JL9VINILRVEMLCiAQqug3zxVn/Q05dA6vlfU
 Tcsrg3CYmHXpQwGL6x1gYi1ABSnypRyq3FOGlm1I7bFGe0d9o563YUYa6
 GR7M2cUhCbOd3QYxopLUizf9utrQa4maj+OmdX/UNoB96v5npxBAo/m4c
 svW6yhZ7umTBKwxe4XbqteVJO3WCw0BJUbD7pTgZeVegyFNji/m18w1kg
 IH8x5fa3KtUpL7+1VDxOFiEcZiTM2yLUROT0pckwBBqqWiqlm/th3SpdS g==;
X-CSE-ConnectionGUID: efDfMyvBQnGrNztqvbDVYw==
X-CSE-MsgGUID: ZGNeF5ERRMiM6vJisNiYIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37374230"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37374230"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:41:49 -0800
X-CSE-ConnectionGUID: so+0SxacQJuJ6Be0i+uivQ==
X-CSE-MsgGUID: SJ1w2X40T8OM9J4kYWJ3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112057575"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.98])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 01:41:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, arun.r.murthy@intel.com, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/lttpr: Enable Extended Wake Timeout
In-Reply-To: <20250122053358.1545039-4-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250122053358.1545039-1-suraj.kandpal@intel.com>
 <20250122053358.1545039-4-suraj.kandpal@intel.com>
Date: Thu, 23 Jan 2025 11:41:44 +0200
Message-ID: <871pwtooiv.fsf@intel.com>
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

On Wed, 22 Jan 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Usually retimers take around 30 to 40ms to exit all devices from
> sleep state. Extended wake timeout mechanism helps to give
> that additional time.
>
> --v2
> -Grant the requested time only if greater than 1ms [Arun/Jani]
> -Reframe commit message [Arun]
>
> --v3
> -Move the function to drm_core [Dmitry/Jani]
>
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

for merging this via drm-misc-next along with the rest of the series.


> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c              | 4 ++++
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_dp_link_training.h | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 3693b36b9336..3b29a1b90fa6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -2594,6 +2594,7 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  {
>  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>  	bool is_mst = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
> +	bool transparent_mode;
>  	int ret;
>  
>  	intel_dp_set_link_params(intel_dp,
> @@ -2645,6 +2646,9 @@ static void mtl_ddi_pre_enable_dp(struct intel_atomic_state *state,
>  	if (!is_mst)
>  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
>  
> +	transparent_mode = intel_dp_lttpr_transparent_mode_enabled(intel_dp);
> +	drm_dp_lttpr_wake_timeout_setup(&intel_dp->aux, transparent_mode);
> +
>  	intel_dp_configure_protocol_converter(intel_dp, crtc_state);
>  	if (!is_mst)
>  		intel_dp_sink_enable_decompression(state,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 8b1977cfec50..c0f8473e7223 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -128,7 +128,7 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
>  	return true;
>  }
>  
> -static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> +bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
>  {
>  	return intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
>  					   DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] ==
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index 2066b9146762..46614124569f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -15,6 +15,7 @@ struct intel_dp;
>  
>  int intel_dp_read_dprx_caps(struct intel_dp *intel_dp, u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  int intel_dp_init_lttpr_and_dprx_caps(struct intel_dp *intel_dp);
> +bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp);
>  
>  void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
>  				     int link_rate, bool is_vrr);

-- 
Jani Nikula, Intel
