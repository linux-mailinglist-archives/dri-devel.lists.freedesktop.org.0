Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0479EB4C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 16:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25310E463;
	Wed, 13 Sep 2023 14:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A6310E072;
 Wed, 13 Sep 2023 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694616111; x=1726152111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CjVV9xvhEMv97Jc9gVwxA0bhg16EarfXLqk54Hv6BB0=;
 b=W9MVJE2arPLtN1T/LbuuBRTnjXCo1FXkCNtTo05Tf8YYzIp/QFjOf8dM
 jdJVni5YuC3gycmpjM9pByzJtE+NzA0Sps60cVv72Knopj68PuP7qEVsv
 by4o8AFabFNTDDMVPzah+UBwlVksLTqBWRRaRcCMKpmV7qQmjxR5dByys
 jWQzw533O+zM+jKGt/Cht17d84CZlzxnfmc2MH30VO/GtRgxa2j+5G8uQ
 qxqyQF3/3Nu8q/RqIEYZ7cRqdr6WTJnaxuazLB+TzbA8WN0msahBckEeJ
 CHz26fE051wtSwH6UR1+SlmPqCwOxboZ+1Ml9Gg1HXcVPeMh1RYv9AbsT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409630190"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="409630190"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 07:41:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="834327224"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="834327224"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by FMSMGA003.fm.intel.com with SMTP; 13 Sep 2023 07:41:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 17:41:48 +0300
Date: Wed, 13 Sep 2023 17:41:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Luca Coelho <luca@coelho.fi>
Subject: Re: [Intel-gfx] [PATCH 05/11] drm/i915: Check lane count when
 determining FEC support
Message-ID: <ZQHKLFQiygq_OKgV@intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-6-ville.syrjala@linux.intel.com>
 <e73031cb908653d57684775d66771998dedf71b0.camel@coelho.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e73031cb908653d57684775d66771998dedf71b0.camel@coelho.fi>
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

On Thu, May 25, 2023 at 11:09:30AM +0300, Luca Coelho wrote:
> On Tue, 2023-05-02 at 17:39 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > ICL doesn't support FEC with a x1 DP link. Make sure
> > we don't try to enable FEC in such cases.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index b27b4fb71ed7..9ac199444155 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -1218,7 +1218,8 @@ static bool intel_dp_source_supports_fec(struct intel_dp *intel_dp,
> >  	if (DISPLAY_VER(dev_priv) >= 12)
> >  		return true;
> >  
> > -	if (DISPLAY_VER(dev_priv) == 11 && encoder->port != PORT_A)
> > +	if (DISPLAY_VER(dev_priv) == 11 &&
> > +	    encoder->port != PORT_A && pipe_config->lane_count != 1)
> >  		return true;
> >  
> >  	return false;
> > @@ -1234,7 +1235,7 @@ static bool intel_dp_supports_fec(struct intel_dp *intel_dp,
> >  static bool intel_dp_supports_dsc(struct intel_dp *intel_dp,
> >  				  const struct intel_crtc_state *crtc_state)
> >  {
> > -	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP) && !crtc_state->fec_enable)
> > +	if (!intel_dp_is_edp(intel_dp) && !crtc_state->fec_enable)
> 
> I'm probably missing something, but this change...

This should have been a separate change I suppose. What this is
currently asserting is DP-SST needs FEC to use DSC, but so does DP-MST
which this is totally forgetting to check. eDP is only case where we
can skip FEC.

> 
> 
> >  		return false;
> >  
> >  	return intel_dsc_source_support(crtc_state) &&
> > @@ -1580,15 +1581,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  	int pipe_bpp;
> >  	int ret;
> >  
> > -	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
> > -		intel_dp_supports_fec(intel_dp, pipe_config);
> > -
> > -	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
> > -		return -EINVAL;
> > -
> > -	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
> > -		return -EINVAL;
> > -
> >  	if (compute_pipe_bpp)
> >  		pipe_bpp = intel_dp_dsc_compute_bpp(intel_dp, conn_state->max_requested_bpc);
> >  	else
> > @@ -1615,6 +1607,15 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
> >  	pipe_config->port_clock = limits->max_rate;
> >  	pipe_config->lane_count = limits->max_lane_count;
> >  
> > +	pipe_config->fec_enable = !intel_dp_is_edp(intel_dp) &&
> > +		intel_dp_supports_fec(intel_dp, pipe_config);
> > +
> > +	if (!intel_dp_supports_dsc(intel_dp, pipe_config))
> > +		return -EINVAL;
> > +
> > +	if (!intel_dp_dsc_supports_format(intel_dp, pipe_config->output_format))
> > +		return -EINVAL;
> > +
> >  	if (intel_dp_is_edp(intel_dp)) {
> >  		pipe_config->dsc.compressed_bpp =
> >  			min_t(u16, drm_edp_dsc_sink_output_bpp(intel_dp->dsc_dpcd) >> 4,
> 
> ...and this code move are not explained in the commit message? How are
> they related?

This is moved becaue we need to compute lanel_count before we can
actually check it.

-- 
Ville Syrjälä
Intel
