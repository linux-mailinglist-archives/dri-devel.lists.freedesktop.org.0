Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D42A2761B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A20810E69E;
	Tue,  4 Feb 2025 15:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MLidxa70";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F3410E35C;
 Tue,  4 Feb 2025 15:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738683485; x=1770219485;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EWFl7BaBiKu2zF0TiwD1NSxJ/rHN931Ds5/23oCK/i8=;
 b=MLidxa70+OY/4XfkP3pyauTTIcikRtcW3z+htUAjXX7dUE6QbMr0caVV
 Nx4LjPrD6EiEhiia5z3rl5E5x2DwqrAJotdhPMju0591wbp+Xvf8BROzc
 onbMklJubkN1vc1t6Pb4EZD/ldLFh3Xy6KssM+W4RFr+vTqbhW+k7KONg
 Jtw+Sn3XeDeYUnsJxmjhjVto7wJgCNWc5sOlmmNI40DvGbRMhqrhOUGWB
 0kS6RX6TAFvxNEP5FdTdXzx8sDz5Xe5p68LllD2yntZiuNnRmP2D0Fca4
 FzYwp75Ika+TqELZOLWjEeepkbYxxpMfO1AEKNQN+yAJ8TxIwF5vgvOSo w==;
X-CSE-ConnectionGUID: NwmGXFmWTAmiI/FJRq0tAg==
X-CSE-MsgGUID: QbyDp0UuSPmlNYiNL00G1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="26816860"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="26816860"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:38:05 -0800
X-CSE-ConnectionGUID: 3oU90jSHQCak+nh87EQzAQ==
X-CSE-MsgGUID: OCNsk890RSqApXBhvDoV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110459972"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:38:04 -0800
Date: Tue, 4 Feb 2025 17:38:58 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/16] drm/i915/dp: compute config for 128b/132b SST
 w/o DSC
Message-ID: <Z6I0knh2Kt5T0JrT@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <b239079a989ce11d60e9467cb1125bc2033ae0bd.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b239079a989ce11d60e9467cb1125bc2033ae0bd.1734643485.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2024 at 11:34:05PM +0200, Jani Nikula wrote:
> Enable basic 128b/132b SST functionality without compression. Reuse
> intel_dp_mtp_tu_compute_config() to figure out the TU after we've
> determined we need to use an UHBR rate.
> 
> It's slightly complicated as the M/N computation is done in different
> places in MST and SST paths, so we need to avoid trashing the values
> later for UHBR.
> 
> If uncompressed UHBR fails, we drop to compressed non-UHBR, which is
> quite likely to fail as well. We still lack 128b/132b SST+DSC.
> 
> We need mst_master_transcoder also for 128b/132b SST. Use cpu_transcoder
> directly. Enhanced framing is "don't care" for 128b/132b link.
> 
> v2: mst_master_transcoder, enhanced framing (Imre)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 34 +++++++++++++++++--------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index fba3af338280..d14a42f02ba8 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2525,8 +2525,8 @@ intel_dp_compute_config_limits(struct intel_dp *intel_dp,
>  	limits->min_rate = intel_dp_min_link_rate(intel_dp);
>  	limits->max_rate = intel_dp_max_link_rate(intel_dp);
>  
> -	/* FIXME 128b/132b SST support missing */
> -	if (!is_mst)
> +	/* FIXME 128b/132b SST+DSC support missing */
> +	if (!is_mst && dsc)
>  		limits->max_rate = min(limits->max_rate, 810000);
>  	limits->min_rate = min(limits->min_rate, limits->max_rate);
>  
> @@ -2640,6 +2640,13 @@ intel_dp_compute_link_config(struct intel_encoder *encoder,
>  		 */
>  		ret = intel_dp_compute_link_config_wide(intel_dp, pipe_config,
>  							conn_state, &limits);
> +		if (!ret && intel_dp_is_uhbr(pipe_config))
> +			ret = intel_dp_mtp_tu_compute_config(intel_dp,
> +							     pipe_config,
> +							     pipe_config->pipe_bpp,
> +							     pipe_config->pipe_bpp,
> +							     conn_state,
> +							     0, false);

Missed this in my review: intel_dp_mtp_tu_compute_config() for this to
work, it needs to handle step == 0, i.e. if (step == 0) break; at the
end of the bpp loop.

>  		if (ret)
>  			dsc_needed = true;
>  	}
> @@ -3148,8 +3155,13 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  	pipe_config->limited_color_range =
>  		intel_dp_limited_color_range(pipe_config, conn_state);
>  
> -	pipe_config->enhanced_framing =
> -		drm_dp_enhanced_frame_cap(intel_dp->dpcd);
> +	if (intel_dp_is_uhbr(pipe_config)) {
> +		/* 128b/132b SST also needs this */
> +		pipe_config->mst_master_transcoder = pipe_config->cpu_transcoder;
> +	} else {
> +		pipe_config->enhanced_framing =
> +			drm_dp_enhanced_frame_cap(intel_dp->dpcd);
> +	}
>  
>  	if (pipe_config->dsc.compression_enable)
>  		link_bpp_x16 = pipe_config->dsc.compressed_bpp_x16;
> @@ -3180,12 +3192,14 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  
>  	intel_dp_audio_compute_config(encoder, pipe_config, conn_state);
>  
> -	intel_link_compute_m_n(link_bpp_x16,
> -			       pipe_config->lane_count,
> -			       adjusted_mode->crtc_clock,
> -			       pipe_config->port_clock,
> -			       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
> -			       &pipe_config->dp_m_n);
> +	if (!intel_dp_is_uhbr(pipe_config)) {
> +		intel_link_compute_m_n(link_bpp_x16,
> +				       pipe_config->lane_count,
> +				       adjusted_mode->crtc_clock,
> +				       pipe_config->port_clock,
> +				       intel_dp_bw_fec_overhead(pipe_config->fec_enable),
> +				       &pipe_config->dp_m_n);
> +	}
>  
>  	/* FIXME: abstract this better */
>  	if (pipe_config->splitter.enable)
> -- 
> 2.39.5
> 
