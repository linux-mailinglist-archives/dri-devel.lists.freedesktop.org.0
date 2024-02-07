Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E192C84CC98
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 15:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B86810E77C;
	Wed,  7 Feb 2024 14:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i0VK6IWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B7410E755;
 Wed,  7 Feb 2024 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707315912; x=1738851912;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hAxy9+qqBY0/e5/Hbii3Q9bPEnc2XYUFU5raA/qGiFs=;
 b=i0VK6IWne5RJrGIaOoRO73AonxJi+ajzk7FFy1t4KlvKSaOJqyg62Q8w
 PEyyLZfOXPa2XOtaOdocqYnritpj1Mt03mbsu1Z1CAIPvR92bHh5E5CjJ
 qVmbGRKKaSWT9PYaY0D5GdjIkfTr1MjjQJzLORAqzcaGuQavhpp3xT4qW
 Q5uaBVLs0QI/ihbEhdgbWoFoXP5kaTBXyDvVTWq5r17GGP5/N9vN4Fn54
 wvXsAgY3XfNWCJIvdiMuBuL/P4TgMYM1Upj05N4EeTt9S5ryKqTYYIQaZ
 rlF0fhhvJ3c8WFGGLuxPYsAtrhn0uYux2MJJM2aC2BKrailEAPFunOnBV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="18417779"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="18417779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 06:25:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1345315"
Received: from unknown (HELO ideak-desk.fi.intel.com) ([10.237.66.155])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 06:25:09 -0800
Date: Wed, 7 Feb 2024 16:25:27 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 14/19] drm/i915/dp: Compute DP tunel BW during encoder
 state computation
Message-ID: <ZcOS11NTAv+NFDee@ideak-desk.fi.intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-15-imre.deak@intel.com>
 <ZcK_33SsjSRhuALe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcK_33SsjSRhuALe@intel.com>
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

On Wed, Feb 07, 2024 at 01:25:19AM +0200, Ville Syrjälä wrote:
> On Tue, Jan 23, 2024 at 12:28:45PM +0200, Imre Deak wrote:
> > Compute the BW required through a DP tunnel on links with such tunnels
> > detected and add the corresponding atomic state during a modeset.
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c     | 16 +++++++++++++---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 13 +++++++++++++
> >  2 files changed, 26 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 78dfe8be6031d..6968fdb7ffcdf 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -2880,6 +2880,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
> >  			struct drm_connector_state *conn_state)
> >  {
> >  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> > +	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
> >  	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
> >  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> >  	const struct drm_display_mode *fixed_mode;
> > @@ -2980,6 +2981,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
> >  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
> >  	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
> >  
> > +	intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
> > +						 pipe_config);
> 
> Error handling seems awol?

Yes, along with checking the return from
drm_dp_tunnel_atomic_set_stream_bw(), thanks for spotting this.

> 
> > +
> >  	return 0;
> >  }
> >  
> > @@ -6087,6 +6091,15 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
> >  			return ret;
> >  	}
> >  
> > +	if (!intel_connector_needs_modeset(state, conn))
> > +		return 0;
> > +
> > +	ret = intel_dp_tunnel_atomic_check_state(state,
> > +						 intel_dp,
> > +						 intel_conn);
> > +	if (ret)
> > +		return ret;
> > +
> >  	/*
> >  	 * We don't enable port sync on BDW due to missing w/as and
> >  	 * due to not having adjusted the modeset sequence appropriately.
> > @@ -6094,9 +6107,6 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
> >  	if (DISPLAY_VER(dev_priv) < 9)
> >  		return 0;
> >  
> > -	if (!intel_connector_needs_modeset(state, conn))
> > -		return 0;
> > -
> >  	if (conn->has_tile) {
> >  		ret = intel_modeset_tile_group(state, conn->tile_group->id);
> >  		if (ret)
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > index 520393dc8b453..cbfab3173b9ef 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > @@ -42,6 +42,7 @@
> >  #include "intel_dp.h"
> >  #include "intel_dp_hdcp.h"
> >  #include "intel_dp_mst.h"
> > +#include "intel_dp_tunnel.h"
> >  #include "intel_dpio_phy.h"
> >  #include "intel_hdcp.h"
> >  #include "intel_hotplug.h"
> > @@ -523,6 +524,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
> >  				       struct drm_connector_state *conn_state)
> >  {
> >  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
> > +	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
> >  	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> >  	struct intel_dp *intel_dp = &intel_mst->primary->dp;
> >  	const struct intel_connector *connector =
> > @@ -619,6 +621,9 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
> >  
> >  	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
> >  
> > +	intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
> > +						 pipe_config);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -876,6 +881,14 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (intel_connector_needs_modeset(state, connector)) {
> > +		ret = intel_dp_tunnel_atomic_check_state(state,
> > +							 intel_connector->mst_port,
> > +							 intel_connector);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	return drm_dp_atomic_release_time_slots(&state->base,
> >  						&intel_connector->mst_port->mst_mgr,
> >  						intel_connector->port);
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrjälä
> Intel
