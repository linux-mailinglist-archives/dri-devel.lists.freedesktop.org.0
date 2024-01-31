Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186284456D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 17:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2095510FB5F;
	Wed, 31 Jan 2024 16:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CB110FB5F;
 Wed, 31 Jan 2024 16:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706720358; x=1738256358;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=llEZ7Y2zH4fEC2yooBXqirETvWFMHv/8iVr9SzBwNBc=;
 b=Ykh584k951MdXAogLwu72xMjrgIjBy15gg0BdlAyscFQ0C9NdeGFlKQd
 RmpdIQ7GpgYTZ9qegZd+TE2BSx2/CC6Bs4XopHzohpgLVoM0X/O8RS2Wy
 BxrTe6Sd8QMzJgH0pMYHyjjEGJ9dGUMPuJvt7j+PJxLR9iiagMXOUFWqF
 2DmuyX6s3GrL39U57PPzjox7OUUf+Q3YQJulNjyPRO4J5jKDeQW6GxOhc
 Pd+47ZQLDnpR0CtB+qPEFfIXb6c1anE/awX0nxeGIWMvAZBIVKYeIhCiF
 Hlj/WuVi7hkZTOWXiJvLZ41fFEUMPLE+4BAYd1Dm4CkUEFpKCq4lTHU9O A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17032271"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="17032271"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 08:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="1119668956"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="1119668956"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 08:59:09 -0800
Date: Wed, 31 Jan 2024 18:59:26 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 18/19] drm/i915/dp: Suspend/resume DP tunnels
Message-ID: <Zbp8bufhy8dYd+eT@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-19-imre.deak@intel.com>
 <ZbpyzoRpe1ngWJpb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbpyzoRpe1ngWJpb@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 06:18:22PM +0200, Ville Syrjälä wrote:
> On Tue, Jan 23, 2024 at 12:28:49PM +0200, Imre Deak wrote:
> > Suspend and resume DP tunnels during system suspend/resume, disabling
> > the BW allocation mode during suspend, re-enabling it after resume. This
> > reflects the link's BW management component (Thunderbolt CM) disabling
> > BWA during suspend. Before any BW requests the driver must read the
> > sink's DPRX capabilities (since the BW manager requires this
> > information, so snoops for it on AUX), so ensure this read takes place.
> 
> Isn't that going to screw up the age old problem of .compute_config()
> potentially failing during the resume modeset if we no longer have
> the same amount of bandwidth available as we had before suspend?
> So far we've been getting away with this exactly by not updating 
> the dpcd stuff before the modeset during resume.

Right, in the case where this would be a problem (so not counting where
the caps haven't been read out yet and so we update here
intel_dp->dpcd), the caps in intel_dp->dpcd will be preserved, not
actually updated with the read-out values, see intel_dp_tunnel_resume()
in patch 11.

The same goes for the tunnel (group) BW: it will not be updated during
resume (by way of the connector/tunnel detection being blocked during
the restore modeset), so the restore modeset should see the same amount
of BW as there was during suspend.

> 
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 8ebfb039000f6..bc138a54f8d7b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -36,6 +36,7 @@
> >  #include <asm/byteorder.h>
> >  
> >  #include <drm/display/drm_dp_helper.h>
> > +#include <drm/display/drm_dp_tunnel.h>
> >  #include <drm/display/drm_dsc_helper.h>
> >  #include <drm/display/drm_hdmi_helper.h>
> >  #include <drm/drm_atomic_helper.h>
> > @@ -3320,18 +3321,21 @@ void intel_dp_sync_state(struct intel_encoder *encoder,
> >  			 const struct intel_crtc_state *crtc_state)
> >  {
> >  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> > -
> > -	if (!crtc_state)
> > -		return;
> > +	bool dpcd_updated = false;
> >  
> >  	/*
> >  	 * Don't clobber DPCD if it's been already read out during output
> >  	 * setup (eDP) or detect.
> >  	 */
> > -	if (intel_dp->dpcd[DP_DPCD_REV] == 0)
> > +	if (crtc_state && intel_dp->dpcd[DP_DPCD_REV] == 0) {
> >  		intel_dp_get_dpcd(intel_dp);
> > +		dpcd_updated = true;
> > +	}
> >  
> > -	intel_dp_reset_max_link_params(intel_dp);
> > +	intel_dp_tunnel_resume(intel_dp, dpcd_updated);
> > +
> > +	if (crtc_state)
> > +		intel_dp_reset_max_link_params(intel_dp);
> >  }
> >  
> >  bool intel_dp_initial_fastset_check(struct intel_encoder *encoder,
> > @@ -5973,6 +5977,8 @@ void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder)
> >  	struct intel_dp *intel_dp = enc_to_intel_dp(intel_encoder);
> >  
> >  	intel_pps_vdd_off_sync(intel_dp);
> > +
> > +	intel_dp_tunnel_suspend(intel_dp);
> >  }
> >  
> >  void intel_dp_encoder_shutdown(struct intel_encoder *intel_encoder)
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrjälä
> Intel
