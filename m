Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC377241E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECA310E28E;
	Mon,  7 Aug 2023 12:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4143110E28E;
 Mon,  7 Aug 2023 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691411614; x=1722947614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ctd7oVPivPnSbL4T2PczsoHO/VdLs4VQMjBx3eUVByU=;
 b=ffJxdGNkTO+9OFB3UzHXyT/QfDUfVyJxlDLx4cpxZJ6VAp6XpC/qj7ky
 1it+KsrkmJ1bHK0JBvxg8t3gvIYK5JRVJK8+Ma2S4qLyoch7Z8EzDZ119
 HZUwMtWHaLj0kSl+YCQBBA17wI5wUwMnA75OONV1n/ggCjLvdiAhHXDOG
 ypp2Feqkz6bS/VVKaAlD+p7HkhiBxQ8xQXu05dOWbXrnetzEGEB9IIor4
 sjGRSAwpjE7Q8jljNqx60pcG1JnNRu9bUrzkQg/++njbetGI1YcM9ypUS
 xJn8iXt7b/z7nKLA52ruwuoiFdlnj8ks7lEinZS/hWf7oh6TXaHoSKSI0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="373282788"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="373282788"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="760459389"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="760459389"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:33:30 -0700
Date: Mon, 7 Aug 2023 15:33:28 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 11/20] drm/i915/dp: Check min bpc DSC limits for
 dsc_force_bpc also
Message-ID: <ZNDkmD0NdazyWNVj@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-12-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-12-ankit.k.nautiyal@intel.com>
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

On Fri, Jul 28, 2023 at 09:41:41AM +0530, Ankit Nautiyal wrote:
> For DSC the min BPC is 8 for ICL+ and so the min pipe_bpp is 24.
> Check this condition for cases where bpc is forced by debugfs flag
> dsc_force_bpc. If the check fails, then WARN and ignore the debugfs
> flag.
> 
> For MST case the pipe_bpp is already computed (hardcoded to be 24),
> and this check is not required.

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 48 ++++++++++++++++---------
>  1 file changed, 31 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index f41de126a8d3..78ac8f4fd348 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1697,6 +1697,12 @@ u8 intel_dp_dsc_min_src_input_bpc(struct drm_i915_private *i915)
>  	return 0;
>  }
>  
> +static
> +bool is_dsc_pipe_bpp_sufficient(struct drm_i915_private *i915, int pipe_bpp)
> +{
> +	return pipe_bpp >= intel_dp_dsc_min_src_input_bpc(i915) * 3;
> +}
> +
>  int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  				struct intel_crtc_state *pipe_config,
>  				struct drm_connector_state *conn_state,
> @@ -1708,7 +1714,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  	struct drm_i915_private *dev_priv = to_i915(dig_port->base.base.dev);
>  	const struct drm_display_mode *adjusted_mode =
>  		&pipe_config->hw.adjusted_mode;
> -	int pipe_bpp;
>  	int ret;
>  
>  	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
> @@ -1720,28 +1725,37 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
>  		return -EINVAL;
>  
> -	if (intel_dp->force_dsc_bpc && compute_pipe_bpp) {
> -		pipe_bpp = intel_dp->force_dsc_bpc * 3;
> -		drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
> -			    intel_dp->force_dsc_bpc);
> -	} else if (compute_pipe_bpp) {
> -		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
> -	} else {
> -		pipe_bpp = pipe_config->pipe_bpp;
> -	}
> +	if (compute_pipe_bpp) {
> +		int pipe_bpp;
> +		int forced_bpp = intel_dp->force_dsc_bpc * 3;
>  
> -	if (pipe_bpp < intel_dp_dsc_min_src_input_bpc(dev_priv) * 3) {
> -		drm_dbg_kms(&dev_priv->drm,
> -			    "Computed BPC less than min supported by source for DSC\n");
> -		return -EINVAL;
> +		if (forced_bpp && is_dsc_pipe_bpp_sufficient(dev_priv, forced_bpp)) {
> +			pipe_bpp = forced_bpp;
> +			drm_dbg_kms(&dev_priv->drm, "Input DSC BPC forced to %d\n",
> +				    intel_dp->force_dsc_bpc);
> +		} else {
> +			drm_WARN(&dev_priv->drm, forced_bpp,
> +				 "Cannot force DSC BPC:%d, due to DSC BPC limits\n",
> +				 intel_dp->force_dsc_bpc);
> +
> +			pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp,
> +							    conn_state->max_requested_bpc);
> +
> +			if (!is_dsc_pipe_bpp_sufficient(dev_priv, pipe_bpp)) {
> +				drm_dbg_kms(&dev_priv->drm,
> +					    "Computed BPC less than min supported by source for DSC\n");
> +				return -EINVAL;
> +			}
> +		}
> +
> +		pipe_config->pipe_bpp = pipe_bpp;
>  	}
>  
>  	/*
> -	 * For now enable DSC for max bpp, max link rate, max lane count.
> +	 * For now enable DSC for max link rate, max lane count.
>  	 * Optimize this later for the minimum possible link rate/lane count
>  	 * with DSC enabled for the requested mode.
>  	 */
> -	pipe_config->pipe_bpp = pipe_bpp;
>  	pipe_config->port_clock = limits->max_rate;
>  	pipe_config->lane_count = limits->max_lane_count;
>  
> @@ -1770,7 +1784,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  								    adjusted_mode->crtc_hdisplay,
>  								    pipe_config->bigjoiner_pipes,
>  								    pipe_config->output_format,
> -								    pipe_bpp,
> +								    pipe_config->pipe_bpp,
>  								    timeslots);
>  			if (!dsc_max_compressed_bpp) {
>  				drm_dbg_kms(&dev_priv->drm,
> -- 
> 2.40.1
> 
