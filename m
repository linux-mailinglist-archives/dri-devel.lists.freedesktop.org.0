Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72223704A2D
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 12:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3070210E349;
	Tue, 16 May 2023 10:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120EC10E343;
 Tue, 16 May 2023 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684231926; x=1715767926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xrTIYGxTa/AI4UsPVRGNe6sRGMbPC9u9MqFGTuoMCMM=;
 b=GwmawGgwLlZ8AZKV7Hsibic70EW7YCwq+Uxawxe0hwWKWZJx9yF9a44o
 f0lWKT6KChE01NKJ/JiTAtcAe8x185OecmK0gzsEE9Ff7o3E4I3YTr7NM
 J2ia0BR9vEt9joUCN8wFSHfetKUbjOZEuvLOCHWz3usKAp5uRnLWqgKyH
 XcbisILOgimrL97YpaS6T+dbV0Bj+9yDU9V+X8S51U7oxRSX99b5qsp8Z
 q49hpHinNWDT13xzy/RMMhyGb/rM+mJSmuXzmkMooTnMIMkci5Sm+TuyZ
 C5Sa1MoMfQyx6PP4d19ljr/sNWzw8X7TmvhjzeixnLaeQjBtmL6iknMPm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="379611793"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="379611793"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731940749"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="731940749"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:11:56 -0700
Date: Tue, 16 May 2023 13:11:50 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 05/13] drm/i915/intel_cdclk: Add vdsc with bigjoiner
 constraints on min_cdlck
Message-ID: <ZGNWnP1/vWckkAkA@intel.com>
References: <20230512062417.2584427-1-ankit.k.nautiyal@intel.com>
 <20230512062417.2584427-6-ankit.k.nautiyal@intel.com>
 <ZGJFYziCKeW-vfpF@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGJFYziCKeW-vfpF@intel.com>
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, anusha.srivatsa@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 05:44:51PM +0300, Ville Syrjälä wrote:
> On Fri, May 12, 2023 at 11:54:09AM +0530, Ankit Nautiyal wrote:
> > As per Bsepc:49259, Bigjoiner BW check puts restriction on the
> > compressed bpp for a given CDCLK, pixelclock in cases where
> > Bigjoiner + DSC are used.
> > 
> > Currently compressed bpp is computed first, and it is ensured that
> > the bpp will work at least with the max CDCLK freq.
> > 
> > Since the CDCLK is computed later, lets account for Bigjoiner BW
> > check while calculating Min CDCLK.
> > 
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cdclk.c | 49 ++++++++++++++++++----
> >  1 file changed, 42 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > index 6bed75f1541a..3532640c5027 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > @@ -2520,6 +2520,46 @@ static int intel_planes_min_cdclk(const struct intel_crtc_state *crtc_state)
> >  	return min_cdclk;
> >  }
> >  
> > +static int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state)
> > +{
> > +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> > +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> > +	int min_cdclk = 0;
> > +
> > +	/*
> > +	 * When we decide to use only one VDSC engine, since
> > +	 * each VDSC operates with 1 ppc throughput, pixel clock
> > +	 * cannot be higher than the VDSC clock (cdclk)
> > +	 */
> > +	if (!crtc_state->dsc.dsc_split)
> > +		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
> > +
> > +	if (crtc_state->bigjoiner_pipes) {
> > +		/*
> > +		 * According to Bigjoiner bw check:
> > +		 * compressed_bpp <= PPC * CDCLK * Big joiner Interface bits / Pixel clock
> > +		 *
> > +		 * We have already computed compressed_bpp, so now compute the min CDCLK that
> > +		 * is required to support this compressed_bpp.
> > +		 *
> > +		 * => CDCLK >= compressed_bpp * Pixel clock / (PPC * Bigjoiner Interface bits)
> > +		 *
> > +		 * Since Num of pipes joined = 2, and PPC = 2 with bigjoiner
> > +		 * => CDCLK >= compressed_bpp * pixel_rate  / Bigjoiner Interface bits
> > +		 *
> > +		 * #TODO Bspec mentions to account for FEC overhead while using pixel clock.
> > +		 * Check if we need to use FEC overhead in the above calculations.
> > +		 */
> > +		int bigjoiner_interface_bits = DISPLAY_VER(i915) > 13 ? 36 : 24;
> > +		int min_cdclk_bj = crtc_state->dsc.compressed_bpp * crtc_state->pixel_rate /
> > +				   bigjoiner_interface_bits;
> 
> pixel_rate is the downscale adjusted thing, so it doesn't seem
> like the correct thing to use here.
> 
> Hmm. Assuming that the single VDSC engine really throttles the entire
> pipe to 1 PPC then we should probably account for the 1 vs. 2 PPC
> difference in *_plane_min_cdclk() and intel_pixel_rate_to_cdclk()
> directly. Currently all of those assume 2 PPC.

Main thing is to properly align that one you propose above with that check,
where we decide how many VDSC engines to use:

        /*
         * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
         * is greater than the maximum Cdclock and if slice count is even
         * then we need to use 2 VDSC instances.
         */
        if (adjusted_mode->crtc_clock > dev_priv->max_cdclk_freq) {
                if (pipe_config->dsc.slice_count > 1) {
                        pipe_config->dsc.dsc_split = true;
                } else {
                        drm_dbg_kms(&dev_priv->drm,
                                    "Cannot split stream to use 2 VDSC instances\n");
                        return -EINVAL;
                }
        }

Otherwise I agree that we should do that check preferrably in *_plane_min_cdclk
and use plane data rate which is adjusted after scaling is applied(I think we even have correspondent function there)
It is strange that scaling wasn't mentioned in BSpec formula.
I would also say that we should account for number of slices(i.e VDSC engines) now only in Bigjoiner case, but always, as I understand that number can be different not only for Bigjoiner cases.

Stan


> 
> > +
> > +		min_cdclk = max(min_cdclk, min_cdclk_bj);
> > +	}
> > +
> > +	return min_cdclk;
> > +}
> > +
> >  int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
> >  {
> >  	struct drm_i915_private *dev_priv =
> > @@ -2591,13 +2631,8 @@ int intel_crtc_compute_min_cdclk(const struct intel_crtc_state *crtc_state)
> >  	/* Account for additional needs from the planes */
> >  	min_cdclk = max(intel_planes_min_cdclk(crtc_state), min_cdclk);
> >  
> > -	/*
> > -	 * When we decide to use only one VDSC engine, since
> > -	 * each VDSC operates with 1 ppc throughput, pixel clock
> > -	 * cannot be higher than the VDSC clock (cdclk)
> > -	 */
> > -	if (crtc_state->dsc.compression_enable && !crtc_state->dsc.dsc_split)
> > -		min_cdclk = max(min_cdclk, (int)crtc_state->pixel_rate);
> > +	if (crtc_state->dsc.compression_enable)
> > +		min_cdclk = max(min_cdclk, intel_vdsc_min_cdclk(crtc_state));
> >  
> >  	/*
> >  	 * HACK. Currently for TGL/DG2 platforms we calculate
> > -- 
> > 2.25.1
> 
> -- 
> Ville Syrjälä
> Intel
