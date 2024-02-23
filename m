Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6196C861F66
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 23:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C4A10E0DB;
	Fri, 23 Feb 2024 22:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJSD8NJe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146C110E0A4;
 Fri, 23 Feb 2024 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708726212; x=1740262212;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9XcAb/yi4OmFEDXaQ3X7PpQLmlju/R44OToeY4PSen8=;
 b=CJSD8NJeA7aB4e6gYqrUPPSyWAQ0lrr5BK7GYRf835To1H/gd7ikJ0pF
 y/V0w1pe/INQZmUSJnxGV/BiHw86Se3awYvE5IlgCQga4Yg4zNozf203X
 9yuGMBPmfJxEM5H6nGo//m5TIA0vj9DZ5VYcyZjtw3W8YOTzlMRhB4ZQX
 enFrZYfLdkjOVEgONUenJ+n+zlll6kB/i/UsJSxP2NcKkiIbaCFut3RFf
 47ApndAfuuDW9TVJ70DWq7crt6oNTZmifbeTHC++/9dzSNrNlNc7JBPxw
 G8PvzjuRmXv82bmmgpjkNswaXXHE4MZ1jOa0XHGo0wHMMCu0+bb1Wy9Y1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="3222753"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="3222753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 14:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="10733235"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 14:09:19 -0800
Date: Sat, 24 Feb 2024 00:09:41 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/21] drm/i915/dp: Add way to get active pipes with
 syncing commits
Message-ID: <ZdkXpcnE6U4AWjVE@ideak-desk.fi.intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
 <20240220211841.448846-12-imre.deak@intel.com>
 <ZdkKEcbbbVUgIOmF@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdkKEcbbbVUgIOmF@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 23, 2024 at 11:11:45PM +0200, Ville Syrjälä wrote:
> On Tue, Feb 20, 2024 at 11:18:31PM +0200, Imre Deak wrote:
> > Add a way to get the active pipes through a given DP port by syncing
> > against a related pending non-blocking commit. Atm
> > intel_dp_get_active_pipes() will only try to sync a given pipe and if
> > that would block ignore the pipe. A follow-up change enabling the DP
> > tunnel BW allocation mode will need to ensure that all active pipes are
> > returned.
> > 
> > This change will use intel_crtc_state::uapi.commit instead of the
> > corresponding commit in the connector state. This shouldn't make a
> > difference, since the two commit objects match for an active pipe.
> 
> There is a slight difference here in that a non-modeset/fastset commit
> will not have the connector inluded in the state and thus
> connector->state.commit will be updated.
> 
> I think the original idea of the code was to just skip anything that
> looks like it's already undergoing a full modeset. With this we might
> skip the retrain if there happens to be any kind of commit happening
> on the crtc. Althoguh it seems that the original code is already
> broken in the same way when there's a fastset happening in parallel.

Ok, didn't think of it. Are you ok to sync instead of try-sync the pipes
in case of link re-training?

> > A follow-up patchset will remove syncing during TC port reset, which
> > should reset a port/pipe even if syncing against a commit would block.
> > Syncing OTOH is not needed there, since the commit used for the reset
> > implies a sync already. For now add a TODO comment for this.
> > 
> > v2:
> > - Add a separate function to try-sync the pipes. (Ville)
> > 
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_crtc.c | 27 +++++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_crtc.h |  1 +
> >  drivers/gpu/drm/i915/display/intel_dp.c   |  6 ++---
> >  drivers/gpu/drm/i915/display/intel_tc.c   |  7 ++++++
> >  4 files changed, 37 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> > index 25593f6aae7de..17ed2e62cc66a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> > @@ -654,3 +654,30 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
> >  out:
> >  	intel_psr_unlock(new_crtc_state);
> >  }
> > +
> > +/**
> > + * intel_crtc_try_sync_pipes - Try syncing pending commits on a set of pipes
> > + * @i915: i915 device object
> > + * @pipe_mask: Mask of pipes to sync
> > + *
> > + * Try to sync a pending non-blocking commit for the provided pipes in
> > + * @pipe_mask. The commit won't be synced if this would block.
> > + *
> > + * Return a mask of the pipes that got synced or didn't need syncing.
> > + */
> > +u32 intel_crtc_try_sync_pipes(struct drm_i915_private *i915, u32 pipe_mask)
> > +{
> > +	struct intel_crtc *crtc;
> > +	u32 synced = 0;
> > +
> > +	for_each_intel_crtc_in_pipe_mask(&i915->drm, crtc, pipe_mask) {
> > +		const struct intel_crtc_state *crtc_state =
> > +			to_intel_crtc_state(crtc->base.state);
> > +
> > +		if (!crtc_state->uapi.commit ||
> > +		    try_wait_for_completion(&crtc_state->uapi.commit->hw_done))
> > +			synced |= BIT(crtc->pipe);
> > +	}
> > +
> > +	return synced;
> > +}
> > diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
> > index 22d7993d1f0ba..71a5b93166da7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> > +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> > @@ -47,5 +47,6 @@ struct intel_crtc *intel_crtc_for_pipe(struct drm_i915_private *i915,
> >  void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
> >  				     enum pipe pipe);
> >  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
> > +u32 intel_crtc_try_sync_pipes(struct drm_i915_private *i915, u32 pipe_mask);
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index d9e75922ff8f5..d0452d3e534a7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -5048,10 +5048,6 @@ int intel_dp_get_active_pipes(struct intel_dp *intel_dp,
> >  		if (!crtc_state->hw.active)
> >  			continue;
> >  
> > -		if (conn_state->commit &&
> > -		    !try_wait_for_completion(&conn_state->commit->hw_done))
> > -			continue;
> > -
> >  		*pipe_mask |= BIT(crtc->pipe);
> >  	}
> >  	drm_connector_list_iter_end(&conn_iter);
> > @@ -5091,6 +5087,8 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
> >  	if (ret)
> >  		return ret;
> >  
> > +	pipe_mask &= intel_crtc_try_sync_pipes(dev_priv, pipe_mask);
> > +
> >  	if (pipe_mask == 0)
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> > index 6b374d481cd9e..14d17903a81f5 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tc.c
> > +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> > @@ -7,6 +7,7 @@
> >  #include "i915_reg.h"
> >  #include "intel_atomic.h"
> >  #include "intel_cx0_phy_regs.h"
> > +#include "intel_crtc.h"
> >  #include "intel_ddi.h"
> >  #include "intel_de.h"
> >  #include "intel_display.h"
> > @@ -1663,6 +1664,12 @@ static int reset_link_commit(struct intel_tc_port *tc,
> >  	if (ret)
> >  		return ret;
> >  
> > +	/*
> > +	 * TODO: remove the following, since an output must be reset
> > +	 * even if we had to wait for a non-blocking commit on a pipe.
> > +	 */
> > +	pipe_mask &= intel_crtc_try_sync_pipes(i915, pipe_mask);
> > +
> >  	if (!pipe_mask)
> >  		return 0;
> >  
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrjälä
> Intel
