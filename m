Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF41676CC43
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 14:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681D310E09B;
	Wed,  2 Aug 2023 12:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A7D10E55C;
 Wed,  2 Aug 2023 12:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690977960; x=1722513960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1gVPawpejBWad37SgQzdwXqtmR7Gh/q7rBge6IqLtN8=;
 b=JfLc45xL4iPwawNvBEmVxvl8WTwjXQ6k2nY5kELth8BBIBzQ4uW1dlEC
 FTn1qO6OG0Ao/FzwD/wlEQhg/adFwETPHQK0WrTKxLdwgRbpx/ihL+o3M
 GGYVgIVl0ITZYLWgffLqe2G/+bWKmzH34qkdfyW1V5GjgcqWLSY5Ie8VL
 LPEo3V+mIabk7se2MturqLRekrA0+La9zlk2+psFpfMb3eX0z4L2W8Pr3
 fL+PO7mBsHUiweqrTHmUStc9hKUuntiAQNcnIf8O+O3KdTRhgHjs7hI8z
 e6XE22pmVCo6T5KVu8LtFb6fEfAaOXTDMKlJesdBlyQPZqgyOUgZ9k5Ti g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359602653"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="359602653"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 05:05:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="706152285"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="706152285"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 05:05:57 -0700
Date: Wed, 2 Aug 2023 15:05:54 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 10/20] drm/i915/dp: Add functions to get min/max src
 input bpc with DSC
Message-ID: <ZMpGoijz4MnEZqeY@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-11-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-11-ankit.k.nautiyal@intel.com>
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

On Fri, Jul 28, 2023 at 09:41:40AM +0530, Ankit Nautiyal wrote:
> Separate out functions for getting maximum and minimum input BPC based
> on platforms, when DSC is used.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 38 +++++++++++++++++++------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7ec8a478e000..f41de126a8d3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1535,6 +1535,18 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
>  	return -EINVAL;
>  }
>  
> +static
> +u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
> +{
> +	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> +	if (DISPLAY_VER(i915) >= 12)
> +		return 12;
> +	if (DISPLAY_VER(i915) == 11)
> +		return 10;
> +
> +	return 0;
> +}
> +
>  int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> @@ -1542,11 +1554,12 @@ int intel_dp_dsc_compute_bpp(struct intel_dp *intel_dp, u8 max_req_bpc)
>  	u8 dsc_bpc[3] = {0};
>  	u8 dsc_max_bpc;
>  
> -	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
> -	if (DISPLAY_VER(i915) >= 12)
> -		dsc_max_bpc = min_t(u8, 12, max_req_bpc);
> -	else
> -		dsc_max_bpc = min_t(u8, 10, max_req_bpc);
> +	dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(i915);
> +
> +	if (!dsc_max_bpc)
> +		return dsc_max_bpc;
> +
> +	dsc_max_bpc = min_t(u8, dsc_max_bpc, max_req_bpc);
>  
>  	num_bpc = drm_dp_dsc_sink_supported_input_bpcs(intel_dp->dsc_dpcd,
>  						       dsc_bpc);
> @@ -1674,6 +1687,16 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
>  	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
>  }
>  
> +static
> +u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
> +{
> +	/* Min DSC Input BPC for ICL+ is 8 */
> +	if (DISPLAY_VER(i915) >= 11)
> +		return 8;
> +
> +	return 0;

So does it mean that for anything below gen 11, there is no limit at all?
Also it means that the condition below will never be executed for gen <= 11.

Stan

> +}
> +
>  int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  				struct intel_crtc_state *pipe_config,
>  				struct drm_connector_state *conn_state,
> @@ -1707,10 +1730,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  		pipe_bpp = pipe_config->pipe_bpp;
>  	}
>  
> -	/* Min Input BPC for ICL+ is 8 */
> -	if (pipe_bpp < 8 * 3) {
> +	if (pipe_bpp < intel_dp_dsc_min_src_input_bpc(dev_priv) * 3) {
>  		drm_dbg_kms(&dev_priv->drm,
> -			    "No DSC support for less than 8bpc\n");
> +			    "Computed BPC less than min supported by source for DSC\n");
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.40.1
> 
