Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B68A7F87
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 11:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871D111332B;
	Wed, 17 Apr 2024 09:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cpyab7zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F3111332A;
 Wed, 17 Apr 2024 09:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713345724; x=1744881724;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9CeIibxed42B1acVBWPXs3GcYqWBMBHkpeHRy1LEaYo=;
 b=Cpyab7zhAG9x7ust3vA0hmNUMCP17CIxf6QqB7XaOSGFaNjugoAJ3F72
 MzGreQsYD7Xq7aR933JjfGLreq2VdJFbcr9V4k2VZYx7NILn1Q5gFgKrm
 SUSuLxu8CfTlEKdPQBBJxSkR29g2qEuquH77Tptgh09lW5B/d5EzTBZzP
 5S6RPincsIP2vX8O0nuiN22THN7njdllYM8BkUqFrp7OJxVQ1LDiHUh69
 U8IkKqQe+DhXTE5cE4UBZwJjUWRD48RvBCi3uzPfBU8vxL8BPPYk7a90T
 Ek0Pp0g4WPRlsJx6vWW9lCO1n35+/Y7p6VU3Xq3eL665Am/DOsG6vtTAq A==;
X-CSE-ConnectionGUID: k6lbyy1nQ1eAGRhYRKyqqg==
X-CSE-MsgGUID: YzIzOdWLTxuUN0Tr0dfg0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19385880"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="19385880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:22:04 -0700
X-CSE-ConnectionGUID: X4S4m3WTQ+G70Et2O/PL4g==
X-CSE-MsgGUID: UXAPG/fDRcuQg3UHUbk6/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="22640929"
Received: from vpus-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.45.164])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 02:22:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Manasi Navare <navaremanasi@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 07/11] drm/dp: Add
 drm_dp_uhbr_channel_coding_supported()
In-Reply-To: <20240416221010.376865-8-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240416221010.376865-1-imre.deak@intel.com>
 <20240416221010.376865-8-imre.deak@intel.com>
Date: Wed, 17 Apr 2024 12:21:58 +0300
Message-ID: <871q74z6mh.fsf@intel.com>
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
> Factor out a function to check for UHBR channel coding support used by a
> follow-up patch in the patchset.
>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  include/drm/display/drm_dp_helper.h     | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 23808e9d41d5d..41127069b55e4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -225,7 +225,7 @@ static void intel_dp_set_dpcd_sink_rates(struct intel_dp *intel_dp)
>  	 * Sink rates for 128b/132b. If set, sink should support all 8b/10b
>  	 * rates and 10 Gbps.
>  	 */
> -	if (intel_dp->dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B) {
> +	if (drm_dp_uhbr_channel_coding_supported(intel_dp->dpcd)) {
>  		u8 uhbr_rates = 0;
>  
>  		BUILD_BUG_ON(ARRAY_SIZE(intel_dp->sink_rates) < ARRAY_SIZE(dp_rates) + 3);
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index baf9949ff96fc..8a64fe8d97af2 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -251,6 +251,12 @@ drm_dp_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_8B10B;
>  }
>  
> +static inline bool
> +drm_dp_uhbr_channel_coding_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +	return dpcd[DP_MAIN_LINK_CHANNEL_CODING] & DP_CAP_ANSI_128B132B;
> +}

Nitpick, "uhbr channel coding" is not pedantically correct, and it does
rub me the wrong way.

Yes, using 128b/132b channel coding implies UHBR, and UHBR requires
128b/132b channel coding, but they are not the same thing. We do
conflate the two quite a bit in the code, checking for UHBR when we
really mean 128b/132b, but embedding this confusion in the function name
directly is a bit much.

I've named the link training functions drm_dp_128b132b_* in the same
file, and I think this one should be named similarly. Maybe just
drm_dp_128b132b_supported(), and rename
drm_dp_channel_coding_supported() to drm_dp_8b10b_supported() to unify?

BR,
Jani.



> +
>  static inline bool
>  drm_dp_alternate_scrambler_reset_cap(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {

-- 
Jani Nikula, Intel
