Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B95D77F19A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3062C10E3FF;
	Thu, 17 Aug 2023 07:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DA910E3FF;
 Thu, 17 Aug 2023 07:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692259133; x=1723795133;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AKCMXR2msLblYwZDbaOf7opCILVnTimJQmufhDVygHc=;
 b=JqbOC2ZAparZTFyewOg7TnG2/gOc972NkMsutzHTqKFyXXUNEym4xiy1
 tJvafVt5bHV86mttWTKmOndt22SnGfltZIywcTOWk8QxwyIYRre6cgcb7
 E1KIJT/kx1XtAf3qOCupPlyrPBBInibPdC+tS7nB8A4OlgVIwujiZVRmg
 U+NM7kNuebL0h3tqoZZNLzALnRdym4oqk63/MGmS3fQyYcqhGvXepGZXQ
 SgLrTLrFhElQfD5jdMQ8ArnPRGD42/Rd20a6LwabGhXIuqsPYCYYl6UrF
 pcTfOyrPBlQb7cLKGcDzZnvKueYkC3X9iVjmIZIUUxYI9xI9+/yP7iIqI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="357708373"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="357708373"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804540664"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="804540664"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 00:58:49 -0700
Date: Thu, 17 Aug 2023 10:58:41 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 10/20] drm/i915/dp: Add functions to get min/max src
 input bpc with DSC
Message-ID: <ZN3TMSOzcAiNddvT@intel.com>
References: <20230810130319.3708392-1-ankit.k.nautiyal@intel.com>
 <20230810130319.3708392-11-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810130319.3708392-11-ankit.k.nautiyal@intel.com>
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

On Thu, Aug 10, 2023 at 06:33:09PM +0530, Ankit Nautiyal wrote:
> Separate out functions for getting maximum and minimum input BPC based
> on platforms, when DSC is used.
> 
> v2: Use HAS_DSC macro instead of platform check while getting min input
> bpc. (Stan)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 35 +++++++++++++++++++------
>  1 file changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c13efd0b7c98..b414d09b5e80 100644
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
> @@ -1674,6 +1687,13 @@ static bool intel_dp_dsc_supports_format(struct intel_dp *intel_dp,
>  	return drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd, sink_dsc_format);
>  }
>  
> +static
> +u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
> +{
> +	/* Min DSC Input BPC for ICL+ is 8 */
> +	return HAS_DSC(i915) ? 8 : 0;
> +}
> +
>  int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  				struct intel_crtc_state *pipe_config,
>  				struct drm_connector_state *conn_state,
> @@ -1707,10 +1727,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
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
