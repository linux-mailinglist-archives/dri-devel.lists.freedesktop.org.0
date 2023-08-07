Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 648107723CC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3705F10E28D;
	Mon,  7 Aug 2023 12:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7B510E289;
 Mon,  7 Aug 2023 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691411025; x=1722947025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oQgxCec7h18kQsGbcHCGrgI36SRVGwBolGfNhQCC0Q0=;
 b=YTgWPnzbh4KaxChZ+mNvRH72Zd9jm1oX9JSuIbzDqvFJfsiDrtDqK/zf
 28oKMr2exRkj/iFzGJevW1+JLaxgEERsaQECRI05xGhIgYJozTOXMAIAZ
 6zcRba4to09LliJGZCw6KCJW25lNLeX/OnZwBYwD5AzkYjNDo0ifhzsyh
 mYRhGEzS60h6b+h6pkyLgI/IWUL/wqR+D9WzZiql8blzu0pTE8OQjcm7X
 CDuh3Ipl4+luBj/5xvLoTESkcuoXF8i1waDbW6xdcbXpsZwUNTC4sfEx+
 8OM6/dZ8Cm2NlVriPiyjkkak+7JpzK/xuF3UAMEVCjGsWNaKuPRM/ls35 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="350121737"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="350121737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="730932763"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="730932763"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:23:41 -0700
Date: Mon, 7 Aug 2023 15:23:38 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 15/20] drm/i915/dp: Add DSC BPC/BPP constraints while
 selecting pipe bpp with DSC
Message-ID: <ZNDiShHbpyqKI+nX@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-16-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-16-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, anusha.srivatsa@intel.com,
 dri-devel@lists.freedesktop.org, navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 09:41:45AM +0530, Ankit Nautiyal wrote:
> Currently we check if the pipe_bpp selected is >= the
> min DSC bpc/bpp requirement. We do not check if it is <= the max DSC
> bpc/bpp requirement.
> 
> Add checks for max DSC BPC/BPP constraints while computing the
> pipe_bpp when DSC is in use.
> 
> v2: Fix the commit message.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c87c3836966c..b296db026fd8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1694,13 +1694,27 @@ u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
>  }
>  
>  static
> -bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
> +bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915,
> +				struct drm_connector_state *conn_state,
> +				struct link_config_limits *limits,
> +				int pipe_bpp)
>  {
> -	return pipe_bpp >= intel_dp_dsc_min_src_input_bpc(i915) * 3;
> +	u8 dsc_max_bpc, dsc_min_bpc, dsc_max_pipe_bpp, dsc_min_pipe_bpp;
> +
> +	dsc_max_bpc = min(intel_dp_dsc_max_src_input_bpc(i915), conn_state->max_requested_bpc);
> +	dsc_min_bpc = intel_dp_dsc_min_src_input_bpc(i915);
> +
> +	dsc_max_pipe_bpp = min(dsc_max_bpc * 3, limits->max_bpp);
> +	dsc_min_pipe_bpp = max(dsc_min_bpc * 3, limits->min_bpp);
> +
> +	return pipe_bpp >= dsc_min_pipe_bpp &&
> +	       pipe_bpp <= dsc_max_pipe_bpp;
>  }
>  
>  static
> -int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp)
> +int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp,
> +				struct drm_connector_state *conn_state,
> +				struct link_config_limits *limits)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	int forced_bpp;
> @@ -1710,7 +1724,7 @@ int intel_dp_force_dsc_pipe_bpp(struct intel_dp *intel_dp)
>  
>  	forced_bpp = intel_dp->force_dsc_bpc * 3;
>  
> -	if (is_dsc_pipe_bpp_sufficient(i915, forced_bpp)) {
> +	if (is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, forced_bpp)) {
>  		drm_dbg_kms(&i915->drm, "Input DSC BPC forced to %d\n", intel_dp->force_dsc_bpc);
>  		return forced_bpp;
>  	}
> @@ -1732,16 +1746,16 @@ static int intel_dp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  	u16 output_bpp, dsc_max_compressed_bpp = 0;
>  	int forced_bpp, pipe_bpp;
>  
> -	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
> +	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
>  
>  	if (forced_bpp) {
>  		pipe_bpp = forced_bpp;
>  	} else {
>  		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp, conn_state->max_requested_bpc);
>  
> -		if (!is_dsc_pipe_bpp_sufficient(i915, pipe_bpp)) {
> +		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>  			drm_dbg_kms(&i915->drm,
> -				    "Computed BPC less than min supported by source for DSC\n");
> +				    "Computed BPC is not in DSC BPC limits\n");
>  			return -EINVAL;
>  		}
>  	}
> @@ -1783,7 +1797,7 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	int pipe_bpp, forced_bpp;
>  
> -	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp);
> +	forced_bpp = intel_dp_force_dsc_pipe_bpp(intel_dp, conn_state, limits);
>  
>  	if (forced_bpp) {
>  		pipe_bpp = forced_bpp;
> @@ -1791,9 +1805,9 @@ static int intel_edp_dsc_compute_pipe_bpp(struct intel_dp *intel_dp,
>  		/* For eDP use max bpp that can be supported with DSC. */
>  		pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_dp,
>  							conn_state->max_requested_bpc);
> -		if (!is_dsc_pipe_bpp_sufficient(i915, pipe_bpp)) {
> +		if (!is_dsc_pipe_bpp_sufficient(i915, conn_state, limits, pipe_bpp)) {
>  			drm_dbg_kms(&i915->drm,
> -				    "Computed BPC less than min supported by source for DSC\n");
> +				    "Computed BPC is not in DSC BPC limits\n");
>  			return -EINVAL;
>  		}
>  	}
> -- 
> 2.40.1
> 
