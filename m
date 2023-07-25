Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92FB76104C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 12:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8ED10E0A3;
	Tue, 25 Jul 2023 10:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A85510E0AE;
 Tue, 25 Jul 2023 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690279837; x=1721815837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tqEmZ9/sxTy9/Zw+eiFtKjsakiMB9PLzcVDZPBeMklw=;
 b=X7s7vU3LS+HoKykTYM5mbDx9T3tvqLynf/MUNkrK1C2K8+q11xL7Y9d0
 IoDkoNG2ia5aihiJx+HulmKkaPSltKnRvtc4tGY7WZMrHLcpliQ3YXtYW
 PHcTniad+TnAooCj7F4VdN0+Qjut1vQRDtMCdOr1Kjwcx5Z25JRm5Gd2c
 JFKI7YbqBqqZCrilLw0h3BGP3xS6a3PivHxx76jkMUDOln0Sf1VF6r6E6
 aTxgO/gxyl+nQ9ehViibx8apBM8zkEIod2j9/qX3xhesVe85oiUuwKNRy
 L6MNXJ0TCmlCw2nxwcv0Q406yw1OxP4RCFkRQ1tPNe+Rf9Nn57qWY2/j3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="371287060"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="371287060"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 03:10:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="729296518"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="729296518"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 03:10:33 -0700
Date: Tue, 25 Jul 2023 13:10:22 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 06/19] drm/i915/display: Account for DSC not split case
 while computing cdclk
Message-ID: <ZL+fcPALvPpotftH@intel.com>
References: <20230713103346.1163315-1-ankit.k.nautiyal@intel.com>
 <20230713103346.1163315-7-ankit.k.nautiyal@intel.com>
 <ZLj7WIjcjdjCE5Ft@intel.com>
 <b0af2b8b-9ad7-d598-b7d4-c9aa6dde56c5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0af2b8b-9ad7-d598-b7d4-c9aa6dde56c5@intel.com>
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

On Tue, Jul 25, 2023 at 11:22:52AM +0530, Nautiyal, Ankit K wrote:
> 
> On 7/20/2023 2:46 PM, Lisovskiy, Stanislav wrote:
> > On Thu, Jul 13, 2023 at 04:03:33PM +0530, Ankit Nautiyal wrote:
> > > Currently we assume 2 Pixels Per Clock (PPC) while computing
> > > plane cdclk and min_cdlck. In cases where DSC single engine
> > > is used the throughput is 1 PPC.
> > > 
> > > So account for the above case, while computing cdclk.
> > > 
> > > v2: Use helper to get the adjusted pixel rate.
> > > 
> > > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_cdclk.c         |  2 +-
> > >   drivers/gpu/drm/i915/display/intel_vdsc.c          | 12 ++++++++++++
> > >   drivers/gpu/drm/i915/display/intel_vdsc.h          |  2 ++
> > >   drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++--
> > >   4 files changed, 17 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > > index dcc1f6941b60..701909966545 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > > @@ -2508,7 +2508,7 @@ static int intel_pixel_rate_to_cdclk(const struct intel_crtc_state *crtc_state)
> > >   	int pixel_rate = crtc_state->pixel_rate;
> > >   	if (DISPLAY_VER(dev_priv) >= 10)
> > > -		return DIV_ROUND_UP(pixel_rate, 2);
> > > +		return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
> > >   	else if (DISPLAY_VER(dev_priv) == 9 ||
> > >   		 IS_BROADWELL(dev_priv) || IS_HASWELL(dev_priv))
> > >   		return pixel_rate;
> > > diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> > > index 9d76c2756784..bbfdbf06da68 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> > > @@ -1038,3 +1038,15 @@ void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
> > >   out:
> > >   	intel_display_power_put(dev_priv, power_domain, wakeref);
> > >   }
> > > +
> > > +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate)
> > > +{
> > > +	/*
> > > +	 * If single VDSC engine is used, it uses one pixel per clock
> > > +	 * otherwise we use two pixels per clock.
> > > +	 */
> > > +	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
> > > +		return pixel_rate;
> > > +
> > > +	return DIV_ROUND_UP(pixel_rate, 2);
> > > +}
> > > diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.h b/drivers/gpu/drm/i915/display/intel_vdsc.h
> > > index 2cc41ff08909..3bb4b1980b6b 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_vdsc.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
> > > @@ -28,4 +28,6 @@ void intel_dsc_dsi_pps_write(struct intel_encoder *encoder,
> > >   void intel_dsc_dp_pps_write(struct intel_encoder *encoder,
> > >   			    const struct intel_crtc_state *crtc_state);
> > > +int intel_dsc_get_adjusted_pixel_rate(const struct intel_crtc_state *crtc_state, int pixel_rate);
> > > +
> > >   #endif /* __INTEL_VDSC_H__ */
> > > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > index 6b01a0b68b97..9eeb25ec4be9 100644
> > > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > @@ -17,6 +17,7 @@
> > >   #include "intel_fb.h"
> > >   #include "intel_fbc.h"
> > >   #include "intel_psr.h"
> > > +#include "intel_vdsc.h"
> > >   #include "skl_scaler.h"
> > >   #include "skl_universal_plane.h"
> > >   #include "skl_watermark.h"
> > > @@ -263,8 +264,7 @@ static int icl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
> > >   {
> > >   	unsigned int pixel_rate = intel_plane_pixel_rate(crtc_state, plane_state);
> > > -	/* two pixels per clock */
> > > -	return DIV_ROUND_UP(pixel_rate, 2);
> > > +	return intel_dsc_get_adjusted_pixel_rate(crtc_state, pixel_rate);
> > Hi Ankit,
> > 
> > I think the thing what you are taking of is already handled here in intel_cdclk.c:
> > 
> > 	/*
> >           * When we decide to use only one VDSC engine, since
> >           * each VDSC operates with 1 ppc throughput, pixel clock
> >           * cannot be higher than the VDSC clock (cdclk)
> >           * If there 2 VDSC engines, then pixel clock can't be higher than
> >           * VDSC clock(cdclk) * 2 and so on.
> >           */
> >          if (crtc_state->dsc.compression_enable) {
> >                  int num_vdsc_instances = intel_dsc_get_num_vdsc_instances(crtc_state);
> > 
> >                  min_cdclk = max_t(int, min_cdclk,
> >                                    DIV_ROUND_UP(crtc_state->pixel_rate,
> >                                                 num_vdsc_instances));
> >          }
> 
> As far as I understand this condition is coming from the pixel clock
> limitation as an input to the splitter (Bspec: 49259):
> 
> Pipe BW check:
> 
> Pixel clock < PPC * CDCLK frequency * Number of pipes joined
> 
> PPC = 1 or 2 depending on number of DSC engines used within the pipe.
> 
> So it implies CDCLK frequency > Pixel clock / (PPC * Number of pipes joined)
> 
> num_vdsc_instances is actually giving us (PPC * number of pipes joined).
> 
> 
> I completely agree that there will be no effect of the change on the
> min_cdclk that gets computed in any case, whether DSC, 1 engine, 2 engine, 
> bigjoiner or no DSC.
> 
> Only thing is for the case where 1 DSC engine is used, what
> intel_pixel_rate_to_cdclk return will be different, and its due to the fact
> that pipe is driven with 1PPC.
> 
> But as I said, the min_cdclk computed will be same as without patch. So we
> can certainly do away with this change, and I can drop this from the patch.
> 
> 
> But in case of icl_plane_min_cdclk, currently we are dividing the
> plane_pixel_rate by 2, citing that we use 2 pixel per clock, to get the
> plane_min_cdclk.
> 
> Should this not be 1 PPC in case where single DSC engine is used? In that
> case plane_min_cdclk will be double. Should we keep the change only for
> plane_min_cdclk then?

Those are different cases:


1) When we are not using DSC, we are always processing
2 pixels per CDCLK, starting from gen 10. It is reflected in both intel_pixel_rate_to_cdclk
and icl_plane_min_cdclk(which is a bit of a tautology I agree, but anyways we always take 
all limitations and use max(worst case) of them)

2) When we are using DSC. In that case we could use 1 or VDSC engines, which would set PPC to
1 or 2 correspondently. So whenever we happen to use DSC that condition will take max of
the CDCLK obtained by other requirements and that formula.
However in non-compressed case when there is no DSC, we should even be insterested in querying
how many VDSC instances we have, amount of pixels processed per CDCLK isn't related to this in
that case.

Stan

> 
> 
> Regards,
> 
> Ankit
> 
> 
> > 
> > Also even if something still have to be done here, I think we should preferrably
> > deal with anything related to DSC in a single place, to prevent any kind of
> > confusion(when those checks are scattered in different places, it is way more easy to forget/not notice something)
> > 
> > I think intel_pixel_rate_to_cdclk isn't supposed to know anything about DSC or any other specifics like audio checks and etc - it is
> > just dealing with the "default" uncompressed case.
> > Any other additional limitations or checks we apply after those, as there are
> > quite many anyway.
> > 
> > Stan
> > 
> > 
> > >   }
> > >   static void
> > > -- 
> > > 2.40.1
> > > 
