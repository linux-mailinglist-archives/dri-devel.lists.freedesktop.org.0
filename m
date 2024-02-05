Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4684A168
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB51810F468;
	Mon,  5 Feb 2024 17:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZ7kNJuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030A610F468;
 Mon,  5 Feb 2024 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707155575; x=1738691575;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mvBwAci0hfF0WVWHk8bw7KAqyKGUEYorSGsSWdamIRM=;
 b=NZ7kNJuFGoNkKEvntIsK3sqFRo14gi89MdML/5UmzpAxQp1G/OGRkYPC
 iB3+YDSU0QWF5/pKAhWiTphelybduXfK7E5UQgk/5Fejzs4kNtupFVEvc
 eJC1AVWVD17GylzvP4vpOvJrrIgN/7jOZ7CkYoqZrfjt7nAcQ4Zb31zFi
 ajrtOV8wkXMz66H9AOEW+48mUcE5+BFjvjPa/f1pCtAr//faRMEVyMZIF
 x9vk4ajAJ+xyTzKcQr3AcOcS3CvCOMIMz5coiEz+k6e0xSw5Nlo9XdiW0
 9yNn1Qtwgeu4DloNcyc0IV4B7CmsyeyGaHEDsFDItbu07fNOBrCwjUGwQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="394995282"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="394995282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 09:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5382171"
Received: from unknown (HELO ideak-desk.fi.intel.com) ([10.237.66.155])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 09:52:53 -0800
Date: Mon, 5 Feb 2024 19:52:44 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/19] drm/i915/dp: Add DP tunnel atomic state and check
 BW limit
Message-ID: <ZcEgbFnnAyHyP24L@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-13-imre.deak@intel.com>
 <ZcEIlAB-pM0SSx1C@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcEIlAB-pM0SSx1C@intel.com>
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

On Mon, Feb 05, 2024 at 06:11:00PM +0200, Ville Syrjälä wrote:
> On Tue, Jan 23, 2024 at 12:28:43PM +0200, Imre Deak wrote:
> > Add the atomic state during a modeset required to enable the DP tunnel
> > BW allocation mode on links where such a tunnel was detected.
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic.c  |  8 ++++++++
> >  drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_link_bw.c |  5 +++++
> >  3 files changed, 32 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> > index 96ab37e158995..4236740ede9ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> > @@ -260,6 +260,10 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
> >  	if (crtc_state->post_csc_lut)
> >  		drm_property_blob_get(crtc_state->post_csc_lut);
> >  
> > +	if (crtc_state->dp_tunnel_ref.tunnel)
> > +		drm_dp_tunnel_ref_get(old_crtc_state->dp_tunnel_ref.tunnel,
> 
> I'd probably s/old_crtc_state/crtc_state/ here. Same pointer, but
> looks out of place given everyone else just operates on 'crtc_state' 
> here.

Ok, will change that.

> > +					&crtc_state->dp_tunnel_ref);
> 
> Shame we have to have this ref wrapper. But I guess no clean
> way to have a magic tracked pointer type that works like a
> normal pointer in C...

I suppose returning a pointer to a kmalloced drm_dp_tunnel_ref from
drm_tunnel_get() and freeing this in drm_tunnel_put() would be one way,
but that imo defeats the purpose of the tracker information being valid
even after put() (so that ref_tracker can print information about where
a particular reference was already dropped).

> 
> > +
> >  	crtc_state->update_pipe = false;
> >  	crtc_state->update_m_n = false;
> >  	crtc_state->update_lrr = false;
> > @@ -311,6 +315,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
> >  
> >  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
> >  	intel_crtc_free_hw_state(crtc_state);
> > +	if (crtc_state->dp_tunnel_ref.tunnel)
> > +		drm_dp_tunnel_ref_put(&crtc_state->dp_tunnel_ref);
> >  	kfree(crtc_state);
> >  }
> >  
> > @@ -346,6 +352,8 @@ void intel_atomic_state_clear(struct drm_atomic_state *s)
> >  	/* state->internal not reset on purpose */
> >  
> >  	state->dpll_set = state->modeset = false;
> > +
> > +	intel_dp_tunnel_atomic_cleanup_inherited_state(state);
> 
> This seems to be in the wrong patch?

Yes, I guess a more logical place is in

[PATCH 14/19] drm/i915/dp: Compute DP tunel BW during encoder state computation

where the state is added, will move it there.

> 
> >  }
> >  
> >  struct intel_crtc_state *
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > index b9f985a5e705b..46b27a32c8640 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -33,6 +33,7 @@
> >  #include <linux/string_helpers.h>
> >  
> >  #include <drm/display/drm_dp_helper.h>
> > +#include <drm/display/drm_dp_tunnel.h>
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_atomic_uapi.h>
> > @@ -73,6 +74,7 @@
> >  #include "intel_dp.h"
> >  #include "intel_dp_link_training.h"
> >  #include "intel_dp_mst.h"
> > +#include "intel_dp_tunnel.h"
> >  #include "intel_dpll.h"
> >  #include "intel_dpll_mgr.h"
> >  #include "intel_dpt.h"
> > @@ -4490,6 +4492,8 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
> >  	saved_state->crc_enabled = slave_crtc_state->crc_enabled;
> >  
> >  	intel_crtc_free_hw_state(slave_crtc_state);
> > +	if (slave_crtc_state->dp_tunnel_ref.tunnel)
> > +		drm_dp_tunnel_ref_put(&slave_crtc_state->dp_tunnel_ref);
> >  	memcpy(slave_crtc_state, saved_state, sizeof(*slave_crtc_state));
> >  	kfree(saved_state);
> >  
> > @@ -4505,6 +4509,10 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
> >  		      &master_crtc_state->hw.adjusted_mode);
> >  	slave_crtc_state->hw.scaling_filter = master_crtc_state->hw.scaling_filter;
> >  
> > +	if (master_crtc_state->dp_tunnel_ref.tunnel)
> > +		drm_dp_tunnel_ref_get(master_crtc_state->dp_tunnel_ref.tunnel,
> > +					&slave_crtc_state->dp_tunnel_ref);
> > +
> >  	copy_bigjoiner_crtc_state_nomodeset(state, slave_crtc);
> >  
> >  	slave_crtc_state->uapi.mode_changed = master_crtc_state->uapi.mode_changed;
> > @@ -4533,6 +4541,13 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
> >  	/* free the old crtc_state->hw members */
> >  	intel_crtc_free_hw_state(crtc_state);
> >  
> > +	if (crtc_state->dp_tunnel_ref.tunnel) {
> > +		drm_dp_tunnel_atomic_set_stream_bw(&state->base,
> > +						   crtc_state->dp_tunnel_ref.tunnel,
> > +						   crtc->pipe, 0);
> > +		drm_dp_tunnel_ref_put(&crtc_state->dp_tunnel_ref);
> > +	}
> > +
> >  	/* FIXME: before the switch to atomic started, a new pipe_config was
> >  	 * kzalloc'd. Code that depends on any field being zero should be
> >  	 * fixed, so that the crtc_state can be safely duplicated. For now,
> > @@ -5374,6 +5389,10 @@ static int intel_modeset_pipe(struct intel_atomic_state *state,
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = intel_dp_tunnel_atomic_add_state_for_crtc(state, crtc);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = intel_dp_mst_add_topology_state_for_crtc(state, crtc);
> >  	if (ret)
> >  		return ret;
> > diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
> > index 9c6d35a405a18..5b539ba996ddf 100644
> > --- a/drivers/gpu/drm/i915/display/intel_link_bw.c
> > +++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
> > @@ -8,6 +8,7 @@
> >  #include "intel_atomic.h"
> >  #include "intel_display_types.h"
> >  #include "intel_dp_mst.h"
> > +#include "intel_dp_tunnel.h"
> >  #include "intel_fdi.h"
> >  #include "intel_link_bw.h"
> >  
> > @@ -149,6 +150,10 @@ static int check_all_link_config(struct intel_atomic_state *state,
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = intel_dp_tunnel_atomic_check_link(state, limits);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = intel_fdi_atomic_check_link(state, limits);
> >  	if (ret)
> >  		return ret;
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrjälä
> Intel
