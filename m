Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E479EB34
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 16:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B438889101;
	Wed, 13 Sep 2023 14:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7A610E24C;
 Wed, 13 Sep 2023 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694615806; x=1726151806;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JpNbZ0bggklpxemUIqL03n4LjOB85pfBbv3L5CBdVqU=;
 b=kZo6iL6gKGn7CII27KnwRlshUQl0IwNSAkTgJJ2k3XkJi+SODO6+Gsie
 hXVV+U73vYZeECR1VbGjl6RZnmsmfFVIkL8j5+/AMdjMY+wO6FPltArfL
 v7NHiA/xH+CKhqhonss5raodtEw0UT4em+wkpHP6ExQAMhIvrVqygSDti
 pWoptxESG5QnQ7EjqFcpEwrNuVocdpDZ8R+T0y70IVbQJsHdHPVOmBSx3
 7aVvsNnAARbFLrgOnFnxM2t3wh81+Ml/tXGP1+EaY/nrSqBLDs7CZaDQ3
 yUpe3F4AAZiRTN5JCir1tAw6oTgQvcasg9UZC9tK8HdT0V4l56BQVyMaY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409629085"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="409629085"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 07:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="834326777"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="834326777"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by FMSMGA003.fm.intel.com with SMTP; 13 Sep 2023 07:36:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 Sep 2023 17:36:42 +0300
Date: Wed, 13 Sep 2023 17:36:42 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Luca Coelho <luca@coelho.fi>
Subject: Re: [Intel-gfx] [PATCH v2 08/11] drm/i915: Introduce
 crtc_state->enhanced_framing
Message-ID: <ZQHI-nrvFQvhoBwP@intel.com>
References: <20230502143906.2401-9-ville.syrjala@linux.intel.com>
 <20230503113659.16305-1-ville.syrjala@linux.intel.com>
 <c11fcc5b7920363e885826d31a4fd01e4dbb00a5.camel@coelho.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c11fcc5b7920363e885826d31a4fd01e4dbb00a5.camel@coelho.fi>
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

On Thu, May 25, 2023 at 12:51:28PM +0300, Luca Coelho wrote:
> On Wed, 2023-05-03 at 14:36 +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Track DP enhanced framing properly in the crtc state instead
> > of relying just on the cached DPCD everywhere, and hook it
> > up into the state check and dump.
> > 
> > v2: Actually set enhanced_framing in .compute_config()
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/g4x_dp.c                 | 10 ++++++++--
> >  drivers/gpu/drm/i915/display/intel_crt.c              |  2 ++
> >  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c  |  5 +++--
> >  drivers/gpu/drm/i915/display/intel_ddi.c              | 11 +++++++++--
> >  drivers/gpu/drm/i915/display/intel_display.c          |  1 +
> >  drivers/gpu/drm/i915/display/intel_display_types.h    |  2 ++
> >  drivers/gpu/drm/i915/display/intel_dp.c               |  3 +++
> >  drivers/gpu/drm/i915/display/intel_dp_link_training.c |  2 +-
> >  8 files changed, 29 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
> > index 920d570f7594..534546ea7d0b 100644
> > --- a/drivers/gpu/drm/i915/display/g4x_dp.c
> > +++ b/drivers/gpu/drm/i915/display/g4x_dp.c
> > @@ -141,7 +141,7 @@ static void intel_dp_prepare(struct intel_encoder *encoder,
> >  
> >  		intel_de_rmw(dev_priv, TRANS_DP_CTL(crtc->pipe),
> >  			     TRANS_DP_ENH_FRAMING,
> > -			     drm_dp_enhanced_frame_cap(intel_dp->dpcd) ?
> > +			     pipe_config->enhanced_framing ?
> >  			     TRANS_DP_ENH_FRAMING : 0);
> >  	} else {
> >  		if (IS_G4X(dev_priv) && pipe_config->limited_color_range)
> > @@ -153,7 +153,7 @@ static void intel_dp_prepare(struct intel_encoder *encoder,
> >  			intel_dp->DP |= DP_SYNC_VS_HIGH;
> >  		intel_dp->DP |= DP_LINK_TRAIN_OFF;
> >  
> > -		if (drm_dp_enhanced_frame_cap(intel_dp->dpcd))
> > +		if (pipe_config->enhanced_framing)
> >  			intel_dp->DP |= DP_ENHANCED_FRAMING;
> >  
> >  		if (IS_CHERRYVIEW(dev_priv))
> > @@ -351,6 +351,9 @@ static void intel_dp_get_config(struct intel_encoder *encoder,
> >  		u32 trans_dp = intel_de_read(dev_priv,
> >  					     TRANS_DP_CTL(crtc->pipe));
> >  
> > +		if (trans_dp & TRANS_DP_ENH_FRAMING)
> > +			pipe_config->enhanced_framing = true;
> > +
> >  		if (trans_dp & TRANS_DP_HSYNC_ACTIVE_HIGH)
> >  			flags |= DRM_MODE_FLAG_PHSYNC;
> >  		else
> > @@ -361,6 +364,9 @@ static void intel_dp_get_config(struct intel_encoder *encoder,
> >  		else
> >  			flags |= DRM_MODE_FLAG_NVSYNC;
> >  	} else {
> > +		if (tmp & DP_ENHANCED_FRAMING)
> > +			pipe_config->enhanced_framing = true;
> > +
> >  		if (tmp & DP_SYNC_HS_HIGH)
> >  			flags |= DRM_MODE_FLAG_PHSYNC;
> >  		else
> > diff --git a/drivers/gpu/drm/i915/display/intel_crt.c b/drivers/gpu/drm/i915/display/intel_crt.c
> > index 13519f78cf9f..52af64aa9953 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crt.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crt.c
> > @@ -449,6 +449,8 @@ static int hsw_crt_compute_config(struct intel_encoder *encoder,
> >  	/* FDI must always be 2.7 GHz */
> >  	pipe_config->port_clock = 135000 * 2;
> >  
> > +	pipe_config->enhanced_framing = true;
> > +
> 
> Just curious, why are you setting it to true by default here?

We always want to use enhanced framing with FDI. Setting it here
and doing the readout allows us to also state check it also for FDI.

> 
> Otherwise, the changes look reasonable:
> 
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>
> 
> --
> Cheers,
> Luca.

-- 
Ville Syrjälä
Intel
