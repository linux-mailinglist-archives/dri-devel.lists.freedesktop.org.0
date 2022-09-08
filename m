Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C85B1AEC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FDA10EAA3;
	Thu,  8 Sep 2022 11:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8E710EAA3;
 Thu,  8 Sep 2022 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662635339; x=1694171339;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tjngWwxfvUvyASvMNxwwjKSETHDDSpQ6NEBUI4Fnnxo=;
 b=G14GvVQ8xwcC7c3/HW25negrV4OQFXn0dqJo0Q1Unk3AlNYjMgJY7Rap
 GSFMX66lGo2QfMSinmdfbrFiD6/BK4WUSK9d3QikEpAaQNOMRMKKd5erY
 PYnvVzofJk3BVEDOfzcw+ErhDeYPr8/cE47HEuzrvLU41rNG+vWGAe09y
 Z9E9syAOUa6jIwk+30t8R23oYZb75gvxtWh+kzuR5XiRbbxb/VeBpxbu7
 Ud90WSoO38u/l0KwYf8Xk1S7UNwRfXSjGWf+RXeqnPQjLLoGfrp5fFlSk
 dTIUE491W3hag90sdmBEIap9TCtkTh9CG6rue0lBc0EZO6IcXJH3is2T5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="295872945"
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="295872945"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 04:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; d="scan'208";a="648002076"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 08 Sep 2022 04:08:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 08 Sep 2022 14:08:55 +0300
Date: Thu, 8 Sep 2022 14:08:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Invert if/else ladder for
 frequency read
Message-ID: <YxnNRzQbXnt3zVh2@intel.com>
References: <20220907203041.1651514-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220907203041.1651514-1-lucas.demarchi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 07, 2022 at 01:30:41PM -0700, Lucas De Marchi wrote:
> Continue converting the driver to the convention of last version first,
> extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
> be handled by the first branch.
> 
> With the new ranges it's easier to see what platform a branch started to
> be taken. Besides the >= 11 change, the branch taken for GRAPHICS_VER == 10
> is also different, but currently there is no such platform in i915.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  .../gpu/drm/i915/gt/intel_gt_clock_utils.c    | 77 +++++++++----------
>  1 file changed, 37 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> index d5d1b04dbcad..93608c9349fd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_clock_utils.c
> @@ -78,77 +78,74 @@ static u32 read_clock_frequency(struct intel_uncore *uncore)
>  	u32 f19_2_mhz = 19200000;
>  	u32 f24_mhz = 24000000;
>  
> -	if (GRAPHICS_VER(uncore->i915) <= 4) {
> -		/*
> -		 * PRMs say:
> -		 *
> -		 *     "The value in this register increments once every 16
> -		 *      hclks." (through the “Clocking Configuration”
> -		 *      (“CLKCFG”) MCHBAR register)
> -		 */
> -		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
> -	} else if (GRAPHICS_VER(uncore->i915) <= 8) {
> -		/*
> -		 * PRMs say:
> -		 *
> -		 *     "The PCU TSC counts 10ns increments; this timestamp
> -		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
> -		 *      rolling over every 1.5 hours).
> -		 */
> -		return f12_5_mhz;
> -	} else if (GRAPHICS_VER(uncore->i915) <= 9) {

Is there a good reason each of these branches isn't just its own function?

> +	if (GRAPHICS_VER(uncore->i915) >= 11) {
>  		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
>  		u32 freq = 0;
>  
> +		/*
> +		 * First figure out the reference frequency. There are 2 ways
> +		 * we can compute the frequency, either through the
> +		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
> +		 * tells us which one we should use.
> +		 */
>  		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>  			freq = read_reference_ts_freq(uncore);
>  		} else {
> -			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
> +			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
> +
> +			if (GRAPHICS_VER(uncore->i915) >= 11)
> +				freq = gen11_get_crystal_clock_freq(uncore, c0);
> +			else
> +				freq = gen9_get_crystal_clock_freq(uncore, c0);
>  
>  			/*
>  			 * Now figure out how the command stream's timestamp
>  			 * register increments from this frequency (it might
>  			 * increment only every few clock cycle).
>  			 */
> -			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
> -				      CTC_SHIFT_PARAMETER_SHIFT);
> +			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> +				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>  		}
>  
>  		return freq;
> -	} else if (GRAPHICS_VER(uncore->i915) <= 12) {
> +	} else if (GRAPHICS_VER(uncore->i915) >= 9) {
>  		u32 ctc_reg = intel_uncore_read(uncore, CTC_MODE);
>  		u32 freq = 0;
>  
> -		/*
> -		 * First figure out the reference frequency. There are 2 ways
> -		 * we can compute the frequency, either through the
> -		 * TIMESTAMP_OVERRIDE register or through RPM_CONFIG. CTC_MODE
> -		 * tells us which one we should use.
> -		 */
>  		if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>  			freq = read_reference_ts_freq(uncore);
>  		} else {
> -			u32 c0 = intel_uncore_read(uncore, RPM_CONFIG0);
> -
> -			if (GRAPHICS_VER(uncore->i915) >= 11)
> -				freq = gen11_get_crystal_clock_freq(uncore, c0);
> -			else
> -				freq = gen9_get_crystal_clock_freq(uncore, c0);
> +			freq = IS_GEN9_LP(uncore->i915) ? f19_2_mhz : f24_mhz;
>  
>  			/*
>  			 * Now figure out how the command stream's timestamp
>  			 * register increments from this frequency (it might
>  			 * increment only every few clock cycle).
>  			 */
> -			freq >>= 3 - ((c0 & GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
> -				      GEN10_RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
> +			freq >>= 3 - ((ctc_reg & CTC_SHIFT_PARAMETER_MASK) >>
> +				      CTC_SHIFT_PARAMETER_SHIFT);
>  		}
>  
>  		return freq;
> +	} else if (GRAPHICS_VER(uncore->i915) >= 5) {
> +		/*
> +		 * PRMs say:
> +		 *
> +		 *     "The PCU TSC counts 10ns increments; this timestamp
> +		 *      reflects bits 38:3 of the TSC (i.e. 80ns granularity,
> +		 *      rolling over every 1.5 hours).
> +		 */
> +		return f12_5_mhz;
> +	} else {
> +		/*
> +		 * PRMs say:
> +		 *
> +		 *     "The value in this register increments once every 16
> +		 *      hclks." (through the “Clocking Configuration”
> +		 *      (“CLKCFG”) MCHBAR register)
> +		 */
> +		return RUNTIME_INFO(uncore->i915)->rawclk_freq * 1000 / 16;
>  	}
> -
> -	MISSING_CASE("Unknown gen, unable to read command streamer timestamp frequency\n");
> -	return 0;
>  }
>  
>  void intel_gt_init_clock_frequency(struct intel_gt *gt)
> -- 
> 2.37.2

-- 
Ville Syrjälä
Intel
