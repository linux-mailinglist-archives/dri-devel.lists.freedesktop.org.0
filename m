Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80908702DF2
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FA310E1DC;
	Mon, 15 May 2023 13:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BBA10E1D5;
 Mon, 15 May 2023 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156834; x=1715692834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vk3MP0dR/qJwHu+wkKoimXE8DW0/t2thW/pmtWShnHU=;
 b=ewHClnBWUbOofcZXjg0KvLxAduKflKezZrEqOiJwStarf3tUe2/SWnc9
 BErf/zVIM2G/4ZiCmEiI3uGYCRe2LAhYlKZ3zLXa2FHxjVRoXYWaY0rd3
 cIqqgCcRlZbOuWwTloLU1rN6zt9Li2/O0JlqWKM2o7eDShTMl+SbINBix
 DYoql1qNGph8jGSLykqDHkdE1pO+2HRlRT1lp1qWzasdpkYAYVyRIQufG
 X/3tiDPXz2ZA71VV+lZollRRXKeB60w3188M0UBLjbnXC5AVvhdIHYnmP
 RYaCseeH6Z2X+53GUabZIaOtNgNlXjPwUpI/2BQlVxTTP+6b/mKXDusAU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="330817158"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="330817158"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731623597"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="731623597"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga008.jf.intel.com with SMTP; 15 May 2023 06:20:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 15 May 2023 16:20:29 +0300
Date: Mon, 15 May 2023 16:20:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 01/13] drm/i915/dp: Consider output_format while
 computing dsc bpp
Message-ID: <ZGIxnayBXmOUz8YT@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512062417.2584427-2-ankit.k.nautiyal@intel.com>
X-Patchwork-Hint: comment
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
Cc: stanislav.lisovskiy@intel.com, intel-gfx@lists.freedesktop.org,
 anusha.srivatsa@intel.com, navaremanasi@google.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 11:54:05AM +0530, Ankit Nautiyal wrote:
> While using DSC the compressed bpp is computed assuming RGB output
> format. Consider the output_format and compute the compressed bpp
> during mode valid and compute config steps.
> 
> For DP-MST we currently use RGB output format only, so continue
> using RGB while computing compressed bpp for MST case.
> 
> v2: Use output_bpp instead for pipe_bpp to clamp compressed_bpp. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 19 +++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 +
>  3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 0cc57681dc4d..263c30948117 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -734,6 +734,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
>  				u32 link_clock, u32 lane_count,
>  				u32 mode_clock, u32 mode_hdisplay,
>  				bool bigjoiner,
> +				enum intel_output_format output_format,
>  				u32 pipe_bpp,
>  				u32 timeslots)
>  {
> @@ -758,6 +759,10 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
>  	bits_per_pixel = ((link_clock * lane_count) * timeslots) /
>  			 (intel_dp_mode_to_fec_clock(mode_clock) * 8);
>  
> +	/* Bandwidth required for 420 is half, that of 444 format */
> +	if (output_format == INTEL_OUTPUT_FORMAT_YCBCR420)
> +		bits_per_pixel *= 2;
> +
>  	drm_dbg_kms(&i915->drm, "Max link bpp is %u for %u timeslots "
>  				"total bw %u pixel clock %u\n",
>  				bits_per_pixel, timeslots,
> @@ -1151,11 +1156,16 @@ intel_dp_mode_valid(struct drm_connector *_connector,
>  
>  	if (HAS_DSC(dev_priv) &&
>  	    drm_dp_sink_supports_dsc(intel_dp->dsc_dpcd)) {
> +		enum intel_output_format sink_format, output_format;
> +		int pipe_bpp;
> +
> +		sink_format = intel_dp_sink_format(connector, mode);
> +		output_format = intel_dp_output_format(connector, sink_format);
>  		/*
>  		 * TBD pass the connector BPC,
>  		 * for now U8_MAX so that max BPC on that platform would be picked
>  		 */
> -		int pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
> +		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, U8_MAX);
>  
>  		/*
>  		 * Output bpp is stored in 6.4 format so right shift by 4 to get the
> @@ -1175,6 +1185,7 @@ intel_dp_mode_valid(struct drm_connector *_connector,
>  							    target_clock,
>  							    mode->hdisplay,
>  							    bigjoiner,
> +							    output_format,
>  							    pipe_bpp, 64) >> 4;
>  			dsc_slice_count =
>  				intel_dp_dsc_get_slice_count(intel_dp,
> @@ -1707,6 +1718,7 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  							    adjusted_mode->crtc_clock,
>  							    adjusted_mode->crtc_hdisplay,
>  							    pipe_config->bigjoiner_pipes,
> +							    pipe_config->output_format,
>  							    pipe_bpp,
>  							    timeslots);
>  			/*
> @@ -1742,9 +1754,12 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
>  		 * calculation procedure is bit different for MST case.
>  		 */
>  		if (compute_pipe_bpp) {
> +			u16 output_bpp = intel_dp_output_bpp(pipe_config->output_format,
> +							     pipe_config->pipe_bpp);
> +
>  			pipe_config->dsc.compressed_bpp = min_t(u16,
>  								dsc_max_output_bpp >> 4,
> -								pipe_config->pipe_bpp);
> +								output_bpp);
>  		}
>  		pipe_config->dsc.slice_count = dsc_dp_slice_count;
>  		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index ef39e4f7a329..db86c2b71c1f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -107,6 +107,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
>  				u32 link_clock, u32 lane_count,
>  				u32 mode_clock, u32 mode_hdisplay,
>  				bool bigjoiner,
> +				enum intel_output_format output_format,
>  				u32 pipe_bpp,
>  				u32 timeslots);
>  u8 intel_dp_dsc_get_slice_count(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 63d61e610210..ee28bb89bffe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -973,6 +973,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *connector,
>  							    target_clock,
>  							    mode->hdisplay,
>  							    bigjoiner,
> +							    INTEL_OUTPUT_FORMAT_RGB,
>  							    pipe_bpp, 64) >> 4;
>  			dsc_slice_count =
>  				intel_dp_dsc_get_slice_count(intel_dp,
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
