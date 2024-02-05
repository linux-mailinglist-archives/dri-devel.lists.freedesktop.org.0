Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E2849F4A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 17:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7A410FA92;
	Mon,  5 Feb 2024 16:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJ3qxXUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3189D10FA8E;
 Mon,  5 Feb 2024 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707149465; x=1738685465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jdXOXILKO9qbkdCQC9cZTOyr3SR4BijmAVEL2f5L2TY=;
 b=jJ3qxXUEcYTAJvukzhgMtwjgqJ+DorlD3YBNRBd9h1mnzkOl3QpdgRC+
 PwH3MaYiHTSg8/BhjdQYhOvPOPOURRqi1DgWAh/7Gb3oCSDVip+fCdkSY
 bY/9R3fTs69zZjBR9pmvEpNoGY7H6/9hXL+lEsgHE0x2PDV2juW2D4g4B
 WAm7LtFvEkhdqwBC2vvnZCtc8OtGTYHYhnlWok7+xw766TkeFu/FvQ+/u
 k2lqgyXiu8i7vYAhqUhBAGA91VrgObt95T8G95L1O0VRbI+XVTsDVFrHb
 jDeUDUvi8G5mkjysEC3NwGUNQwDiMK3GbtCstG8QALNYu5eyyyvb0CP0D A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="11197171"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11197171"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 08:11:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="823894482"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="823894482"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 05 Feb 2024 08:11:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 18:11:00 +0200
Date: Mon, 5 Feb 2024 18:11:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 12/19] drm/i915/dp: Add DP tunnel atomic state and check
 BW limit
Message-ID: <ZcEIlAB-pM0SSx1C@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-13-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123102850.390126-13-imre.deak@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 12:28:43PM +0200, Imre Deak wrote:
> Add the atomic state during a modeset required to enable the DP tunnel
> BW allocation mode on links where such a tunnel was detected.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c  |  8 ++++++++
>  drivers/gpu/drm/i915/display/intel_display.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_link_bw.c |  5 +++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 96ab37e158995..4236740ede9ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -260,6 +260,10 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	if (crtc_state->post_csc_lut)
>  		drm_property_blob_get(crtc_state->post_csc_lut);
>  
> +	if (crtc_state->dp_tunnel_ref.tunnel)
> +		drm_dp_tunnel_ref_get(old_crtc_state->dp_tunnel_ref.tunnel,

I'd probably s/old_crtc_state/crtc_state/ here. Same pointer, but
looks out of place given everyone else just operates on 'crtc_state' 
here.

> +					&crtc_state->dp_tunnel_ref);

Shame we have to have this ref wrapper. But I guess no clean
way to have a magic tracked pointer type that works like a
normal pointer in C...

> +
>  	crtc_state->update_pipe = false;
>  	crtc_state->update_m_n = false;
>  	crtc_state->update_lrr = false;
> @@ -311,6 +315,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
>  
>  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
>  	intel_crtc_free_hw_state(crtc_state);
> +	if (crtc_state->dp_tunnel_ref.tunnel)
> +		drm_dp_tunnel_ref_put(&crtc_state->dp_tunnel_ref);
>  	kfree(crtc_state);
>  }
>  
> @@ -346,6 +352,8 @@ void intel_atomic_state_clear(struct drm_atomic_state *s)
>  	/* state->internal not reset on purpose */
>  
>  	state->dpll_set = state->modeset = false;
> +
> +	intel_dp_tunnel_atomic_cleanup_inherited_state(state);

This seems to be in the wrong patch?

>  }
>  
>  struct intel_crtc_state *
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index b9f985a5e705b..46b27a32c8640 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -33,6 +33,7 @@
>  #include <linux/string_helpers.h>
>  
>  #include <drm/display/drm_dp_helper.h>
> +#include <drm/display/drm_dp_tunnel.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_uapi.h>
> @@ -73,6 +74,7 @@
>  #include "intel_dp.h"
>  #include "intel_dp_link_training.h"
>  #include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_dpll.h"
>  #include "intel_dpll_mgr.h"
>  #include "intel_dpt.h"
> @@ -4490,6 +4492,8 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
>  	saved_state->crc_enabled = slave_crtc_state->crc_enabled;
>  
>  	intel_crtc_free_hw_state(slave_crtc_state);
> +	if (slave_crtc_state->dp_tunnel_ref.tunnel)
> +		drm_dp_tunnel_ref_put(&slave_crtc_state->dp_tunnel_ref);
>  	memcpy(slave_crtc_state, saved_state, sizeof(*slave_crtc_state));
>  	kfree(saved_state);
>  
> @@ -4505,6 +4509,10 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
>  		      &master_crtc_state->hw.adjusted_mode);
>  	slave_crtc_state->hw.scaling_filter = master_crtc_state->hw.scaling_filter;
>  
> +	if (master_crtc_state->dp_tunnel_ref.tunnel)
> +		drm_dp_tunnel_ref_get(master_crtc_state->dp_tunnel_ref.tunnel,
> +					&slave_crtc_state->dp_tunnel_ref);
> +
>  	copy_bigjoiner_crtc_state_nomodeset(state, slave_crtc);
>  
>  	slave_crtc_state->uapi.mode_changed = master_crtc_state->uapi.mode_changed;
> @@ -4533,6 +4541,13 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
>  	/* free the old crtc_state->hw members */
>  	intel_crtc_free_hw_state(crtc_state);
>  
> +	if (crtc_state->dp_tunnel_ref.tunnel) {
> +		drm_dp_tunnel_atomic_set_stream_bw(&state->base,
> +						   crtc_state->dp_tunnel_ref.tunnel,
> +						   crtc->pipe, 0);
> +		drm_dp_tunnel_ref_put(&crtc_state->dp_tunnel_ref);
> +	}
> +
>  	/* FIXME: before the switch to atomic started, a new pipe_config was
>  	 * kzalloc'd. Code that depends on any field being zero should be
>  	 * fixed, so that the crtc_state can be safely duplicated. For now,
> @@ -5374,6 +5389,10 @@ static int intel_modeset_pipe(struct intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>  
> +	ret = intel_dp_tunnel_atomic_add_state_for_crtc(state, crtc);
> +	if (ret)
> +		return ret;
> +
>  	ret = intel_dp_mst_add_topology_state_for_crtc(state, crtc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
> index 9c6d35a405a18..5b539ba996ddf 100644
> --- a/drivers/gpu/drm/i915/display/intel_link_bw.c
> +++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
> @@ -8,6 +8,7 @@
>  #include "intel_atomic.h"
>  #include "intel_display_types.h"
>  #include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_fdi.h"
>  #include "intel_link_bw.h"
>  
> @@ -149,6 +150,10 @@ static int check_all_link_config(struct intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>  
> +	ret = intel_dp_tunnel_atomic_check_link(state, limits);
> +	if (ret)
> +		return ret;
> +
>  	ret = intel_fdi_atomic_check_link(state, limits);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
