Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F130E772427
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 14:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F360010E290;
	Mon,  7 Aug 2023 12:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4523489F27;
 Mon,  7 Aug 2023 12:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691411729; x=1722947729;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=diHS1Ly5/jv//8ADbxP9bBZM+0FQ4EJqdRg8DkLJw8Y=;
 b=dvQw8RQA8KLni27uVgXdJBLCImi3I5antKnzLcmqY3EH7336F1d4gqaN
 xOaVWxXb6ZfLj99/wqfaL2uWIJWJdanNH3k9jiRUVZeiJ3V3UCUU9Z/Yl
 x3YR5c2+QtI5qBBZFqcMMRYTOeIqXIoDoo54EHuF25SmX4ptFnA73jIyy
 yDQy8QEQJpvW8/62sN7F8YBF+NUu/LPV7EpqHTLcsjfNRW72ouVohBnCL
 o+g5tHNJ9cgJaHB4DMCRRa89Wz1xUt6Xl854vzFFCOdin+GzWAl2sSnAL
 iWBP3znxe/lG4GyFHFRjy15flQ9PbdkmbyFIxSwcZcLQVFDrrU6h4inKG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="367990622"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="367990622"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="854651907"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200"; d="scan'208";a="854651907"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 05:35:17 -0700
Date: Mon, 7 Aug 2023 15:35:14 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 16/20] drm/i915/dp: Separate out function to get
 compressed bpp with joiner
Message-ID: <ZNDlAmn8FyZPQRmX@intel.com>
References: <20230728041150.2524032-1-ankit.k.nautiyal@intel.com>
 <20230728041150.2524032-17-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728041150.2524032-17-ankit.k.nautiyal@intel.com>
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

On Fri, Jul 28, 2023 at 09:41:46AM +0530, Ankit Nautiyal wrote:
> Pull the code to get joiner constraints on maximum compressed bpp into
> separate function.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 54 ++++++++++++++-----------
>  1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index b296db026fd8..9720d32c6301 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -740,6 +740,32 @@ u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 p
>  	return bits_per_pixel;
>  }

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

>  
> +static
> +u32 get_max_compressed_bpp_with_joiner(struct drm_i915_private *i915,
> +				       u32 mode_clock, u32 mode_hdisplay,
> +				       bool bigjoiner)
> +{
> +	u32 max_bpp_small_joiner_ram;
> +
> +	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
> +	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) / mode_hdisplay;
> +
> +	if (bigjoiner) {
> +		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
> +		/* With bigjoiner multiple dsc engines are used in parallel so PPC is 2 */
> +		int ppc = 2;
> +		u32 max_bpp_bigjoiner =
> +			i915->display.cdclk.max_cdclk_freq * ppc * bigjoiner_interface_bits /
> +			intel_dp_mode_to_fec_clock(mode_clock);
> +
> +		max_bpp_small_joiner_ram *= 2;
> +
> +		return min(max_bpp_small_joiner_ram, max_bpp_bigjoiner);
> +	}
> +
> +	return max_bpp_small_joiner_ram;
> +}
> +
>  u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>  					u32 link_clock, u32 lane_count,
>  					u32 mode_clock, u32 mode_hdisplay,
> @@ -748,7 +774,7 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>  					u32 pipe_bpp,
>  					u32 timeslots)
>  {
> -	u32 bits_per_pixel, max_bpp_small_joiner_ram;
> +	u32 bits_per_pixel, joiner_max_bpp;
>  
>  	/*
>  	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
> @@ -788,29 +814,9 @@ u16 intel_dp_dsc_get_max_compressed_bpp(struct drm_i915_private *i915,
>  				(link_clock * lane_count * 8),
>  				intel_dp_mode_to_fec_clock(mode_clock));
>  
> -	/* Small Joiner Check: output bpp <= joiner RAM (bits) / Horiz. width */
> -	max_bpp_small_joiner_ram = small_joiner_ram_size_bits(i915) /
> -		mode_hdisplay;
> -
> -	if (bigjoiner)
> -		max_bpp_small_joiner_ram *= 2;
> -
> -	/*
> -	 * Greatest allowed DSC BPP = MIN (output BPP from available Link BW
> -	 * check, output bpp from small joiner RAM check)
> -	 */
> -	bits_per_pixel = min(bits_per_pixel, max_bpp_small_joiner_ram);
> -
> -	if (bigjoiner) {
> -		int bigjoiner_interface_bits = DISPLAY_VER(i915) >= 14 ? 36 : 24;
> -		/* With bigjoiner multiple dsc engines are used in parallel so PPC is 2 */
> -		int ppc = 2;
> -		u32 max_bpp_bigjoiner =
> -			i915->display.cdclk.max_cdclk_freq * ppc * bigjoiner_interface_bits /
> -			intel_dp_mode_to_fec_clock(mode_clock);
> -
> -		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
> -	}
> +	joiner_max_bpp = get_max_compressed_bpp_with_joiner(i915, mode_clock,
> +							    mode_hdisplay, bigjoiner);
> +	bits_per_pixel = min(bits_per_pixel, joiner_max_bpp);
>  
>  	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
>  
> -- 
> 2.40.1
> 
