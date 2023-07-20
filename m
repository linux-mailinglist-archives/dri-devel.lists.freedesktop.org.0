Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99B75AA91
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512BB10E0A3;
	Thu, 20 Jul 2023 09:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460F310E0A3;
 Thu, 20 Jul 2023 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689845049; x=1721381049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=N3D6G6sriGY+FmslOWAmVIp3XfpnvVnBLCZ5di+d1gM=;
 b=gC6t3x4ivZIjsnhomfYBvEpK+RrLshtOHVT9WTRN90zvqZNmPN7fP2wC
 SJUcXvC0btEMNw+yrpGvzfJ0oamhcLHY/pUWT0Kngk5ziWHnXeMDrAyZG
 tdQ30BBnsPUiGtHQJaj75xlcNByU6on4nuNFvfQg89IqfB2W4cON4QN6r
 nFt8V5o/+gDoTWYwbsSa4tf4lR6TtiYuueo0CL15v3O/rCrx92XHiVrU3
 yb2hPc6rSP8WhH/6QTDq68DuBlyFZOYkKkfU+6HBlsESEzZBXy/DiyWLA
 GeaTB3xCMct3ig1Tlv+1u+K6BcW0zADskx3aKUnQZyoPhmKIWIgKCpkGP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356646643"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="356646643"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="867776054"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:24:08 -0700
Date: Thu, 20 Jul 2023 12:24:04 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 07/19] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Message-ID: <ZLj9NArcFWXo3G5J@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-8-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713103346.1163315-8-ankit.k.nautiyal@intel.com>
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

On Thu, Jul 13, 2023 at 04:03:34PM +0530, Ankit Nautiyal wrote:
> As per Bsepc:49259, Bigjoiner BW check puts restriction on the
> compressed bpp for a given CDCLK, pixelclock in cases where
> Bigjoiner + DSC are used.
> 
> Currently compressed bpp is computed first, and it is ensured that
> the bpp will work at least with the max CDCLK freq.
> 
> Since the CDCLK is computed later, lets account for Bigjoiner BW
> check while calculating Min CDCLK.
> 
> v2: Use pixel clock in the bw calculations. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 61 +++++++++++++++++-----
>  1 file changed, 47 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 701909966545..788dba576294 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2533,6 +2533,51 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
>  	return min_cdclk;
>  }
>  
> +static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> +	int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
> +	int min_cdclk = 0;
> +
> +	/*
> +	 * When we decide to use only one VDSC engine, since
> +	 * each VDSC operates with 1 ppc throughput, pixel clock
> +	 * cannot be higher than the VDSC clock (cdclk)
> +	 * If there 2 VDSC engines, then pixel clock can't be higher than
> +	 * VDSC clock(cdclk) * 2 and so on.
> +	 */
> +	min_cdclk = max_t(int, min_cdclk,
> +			  DIV_ROUND_UP(crtc_state->pixel_rate, num_vdsc_instances));
> +
> +	if (crtc_state->bigjoiner_pipes) {
> +		int pixel_clock = crtc_state->hw.adjusted_mode.clock;
> +
> +		/*
> +		 * According to Bigjoiner bw check:
> +		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
> +		 *
> +		 * We have already computed compressed_bpp, so now compute the min CDCLK that
> +		 * is required to support this compressed_bpp.
> +		 *
> +		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
> +		 *
> +		 * Since PPC = 2 with bigjoiner
> +		 * => CDCLK >= compressed_bpp * Pixel clock  / 2 * Bigjoiner Interface bits
> +		 *
> +		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
> +		 * Check if we need to use FEC overhead in the above calculations.

There is already some function used in intel_dp.c:

intel_dp_mode_to_fec_clock(mode_clock) => Should you may be just use that one, to account FEC
overhead?

> +		 */
> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
> +		int min_cdclk_bj = (crtc_state->dsc.compressed_bpp * pixel_clock) /
> +				   (2 * bigjoiner_interface_bits);

I would use "num_vdsc_instances" instead of 2, since we even get those explicitly.

> +
> +		min_cdclk = max(min_cdclk, min_cdclk_bj);
> +	}
> +
> +	return min_cdclk;
> +}
> +
>  int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>  {
>  	struct drm_i915_private *dev_priv =
> @@ -2604,20 +2649,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
>  	/* Account for additional needs from the planes */
>  	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
>  
> -	/*
> -	 * When we decide to use only one VDSC engine, since
> -	 * each VDSC operates with 1 ppc throughput, pixel clock
> -	 * cannot be higher than the VDSC clock (cdclk)
> -	 * If there 2 VDSC engines, then pixel clock can't be higher than
> -	 * VDSC clock(cdclk) * 2 and so on.
> -	 */
> -	if (crtc_state->dsc.compression_enable) {
> -		int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
> -
> -		min_cdclk = max_t(int, min_cdclk,
> -				  DIV_ROUND_UP(crtc_state->pixel_rate,
> -					       num_vdsc_instances));
> -	}
> +	if (crtc_state->dsc.compression_enable)
> +		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));


With notes above taken care of:

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

>  
>  	/*
>  	 * HACK. Currently for TGL/DG2 platforms we calculate
> -- 
> 2.40.1
> 
