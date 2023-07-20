Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6208A75AA73
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 11:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ADA10E070;
	Thu, 20 Jul 2023 09:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84E610E592;
 Thu, 20 Jul 2023 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689844578; x=1721380578;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Fbh68JVhW/Qc3tOgu9+wdLoiOw82/wg3DM5lRYpWqjA=;
 b=RusL/MbukxUmsmm8X0JPwsPso91At+gPb43VFqQVJovzCO6ax0OP2LeB
 AIM/fGip/erh07CQO4eHa/0LARtr6ba/Qk3IC9vAgRCdU/KRPOjs+X8Ly
 DmJqdvCah+l3g1QukqUzrqqXh9aqaOsHf26XOstk3XICfVZ0ECMC6Ar89
 cZMHx3pk7azzBsVclgD8DK8XpiuPNp7CKsv4Z99fH1u30A9txMIJBJBJD
 UsTIGCfQDiEojtzAJaqY5jnnx4FASTwXVCSJgNUQ/Tc8b7XlMgXdkfLIM
 X/LyWwJ3zJhd33NzBe3iK25MqGAjvjZJUK7SHIJjXhXz8o+gHiP5hKX6w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="432879624"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="432879624"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789731747"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; d="scan'208";a="789731747"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 02:16:15 -0700
Date: Thu, 20 Jul 2023 12:16:08 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 06/19] drm/i915/display: Account for DSC not split case
 while computing cdclk
Message-ID: <ZLj7WIjcjdjCE5Ft@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-7-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230713103346.1163315-7-ankit.k.nautiyal@intel.com>
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

On Thu, Jul 13, 2023 at 04:03:33PM +0530, Ankit Nautiyal wrote:
> Currently we assume 2 Pixels Per Clock (PPC) while computing
> plane cdclk and min_cdlck. In cases where DSC single engine
> is used the throughput is 1 PPC.
> 
> So account for the above case, while computing cdclk.
> 
> v2: Use helper to get the adjusted pixel rate.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
>  drivers/gpu/drm/i915/display/intel_vdsc.c          | 12 ++++++++++++
>  drivers/gpu/drm/i915/display/intel_vdsc.h          |  2 ++
>  drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++--
>  4 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index dcc1f6941b60..701909966545 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2508,7 +2508,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
>  	int pixel_rate = crtc_state->pixel_rate;
>  
>  	if (DISPLAY_VER(dev_priv) >= 10)
> -		return DIV_ROUND_UP(pixel_rate, 2);
> +		return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
>  	else if (DISPLAY_VER(dev_priv) == 9 ||
>  		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
>  		return pixel_rate;
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 9d76c2756784..bbfdbf06da68 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -1038,3 +1038,15 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
>  out:
>  	intel_display_power_put(dev_priv, power_domain, wakeref);
>  }
> +
> +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate)
> +{
> +	/*
> +	 * If single VDSC engine is used, it uses one pixel per clock
> +	 * otherwise we use two pixels per clock.
> +	 */
> +	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
> +		return pixel_rate;
> +
> +	return DIV_ROUND_UP(pixel_rate, 2);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
> index 2cc41ff08909..3bb4b1980b6b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.h
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
> @@ -28,4 +28,6 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
>  void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
>  			    const struct intel_crtc_state *crtc_state);
>  
> +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate);
> +
>  #endif /* __INTEL_VDSC_H__ */
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 6b01a0b68b97..9eeb25ec4be9 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -17,6 +17,7 @@
>  #include "intel_fb.h"
>  #include "intel_fbc.h"
>  #include "intel_psr.h"
> +#include "intel_vdsc.h"
>  #include "skl_scaler.h"
>  #include "skl_universal_plane.h"
>  #include "skl_watermark.h"
> @@ -263,8 +264,7 @@ static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
>  {
>  	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
>  
> -	/* two pixels per clock */
> -	return DIV_ROUND_UP(pixel_rate, 2);
> +	return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);

Hi Ankit,

I think the thing what you are taking of is already handled here in intel_cdclk.c:

	/*
         * When we decide to use only one VDSC engine, since
         * each VDSC operates with 1 ppc throughput, pixel clock
         * cannot be higher than the VDSC clock (cdclk)
         * If there 2 VDSC engines, then pixel clock can't be higher than
         * VDSC clock(cdclk) * 2 and so on.
         */
        if (crtc_state->dsc.compression_enable) {
                int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);

                min_cdclk = max_t(int, min_cdclk,
                                  DIV_ROUND_UP(crtc_state->pixel_rate,
                                               num_vdsc_instances));
        }

Also even if something still have to be done here, I think we should preferrably
deal with anything related to DSC in a single place, to prevent any kind of
confusion(when those checks are scattered in different places, it is way more easy to forget/not notice something)

I think intel_pixel_rate_to_cdclk isn't supposed to know anything about DSC or any other specifics like audio checks and etc - it is
just dealing with the "default" uncompressed case.
Any other additional limitations or checks we apply after those, as there are
quite many anyway.

Stan


>  }
>  
>  static void
> -- 
> 2.40.1
> 
