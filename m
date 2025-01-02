Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4A79FFAD0
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 16:12:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321F010E71B;
	Thu,  2 Jan 2025 15:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OVweIGQx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58FD10E00E;
 Thu,  2 Jan 2025 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735830749; x=1767366749;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=o4xg/FuUv9f9h9Z6CQX48LYZi+CgjKaOFDpapNsIEVg=;
 b=OVweIGQxFvJQFi7zGvjszj8curwG6BoQR0faRH9fnEkFgKb6U3TfvHVV
 zqiHLDKybyf1HTsYfZ7Ni512JaWtInOhA2E8x2sCtVdM9aTEIMnM66GYs
 fKiI4YBXVNUtvDQLFChNpP9y+/HVrrryFkwX0OJPZIv7SVs57h081weXZ
 9nyMxz/cUWr7ZlRtM5jIXGlI/pY+L7LH/zB4n66sxZ/cwH2s36q7ps0RL
 3hXrszCyqN9exB+p9L5PmQtqT3PEd/rNaLH6T0DKnnLZ05xd3YEJVMLve
 tBxmqNDwUJ+b03qfCNdb6MGTP0fd4I9FbQtn89KbVevLOh0mrpLWe2qYa A==;
X-CSE-ConnectionGUID: sEl8BK2ZSAmLAdB/KRhcpQ==
X-CSE-MsgGUID: 30/asBIcRpmh8xq5m62ufw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61446236"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="61446236"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 07:12:29 -0800
X-CSE-ConnectionGUID: KWwDqrWOQf+tY8DUkcIhWQ==
X-CSE-MsgGUID: V6sifAcCT1y/abjF2BbB4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; d="scan'208";a="101319817"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 07:12:27 -0800
Date: Thu, 2 Jan 2025 17:13:18 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 16/16] drm/i915/dp: compute config for 128b/132b SST
 w/o DSC
Message-ID: <Z3atDqSwlbpmaZ6k@ideak-desk.fi.intel.com>
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

Nit: no need for {} here and below.

The patch looks ok:
Reviewed-by: Imre Deak <imre.deak@intel.com>

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
