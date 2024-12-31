Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422B9FF066
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAA110E09F;
	Tue, 31 Dec 2024 15:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7y16DSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FD610E09F;
 Tue, 31 Dec 2024 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735660236; x=1767196236;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=jpkzNDFGb9M4zPpCUbjaMB968EEkstES4ycY/3d+poc=;
 b=S7y16DSt9VIM2QdBP3cppgddo3T2UieqIjqH99X9gxkL+w5iPn6sLXxU
 r1r23jDgLaNHswf9iyCxKXdLn8jauo5D6EAWpETya3MXFFMDPKyjgXCm0
 o4FIMEX4ka6hAbMhKKgjsr2nOduKw5uTpEPafNPEurbefIJ7rf58fR+4Z
 jS8ndqqv9He881xQpmvRYi7uQvY5X0FBAd/g7aU47eF8bx+Jcieli8ODD
 nhq08+m+iDF6QKVRd7ZwncZHbhFSVzGtx7m0RUaTxpeox4w1CEjZpS/vI
 /BOFXrB66S94hYk2q6Ymb2H2Cmgqg9p7TABqg5gwIwxr+kKsEkqqHJyx9 w==;
X-CSE-ConnectionGUID: 3sTbmM9OQUyaUEJ4kfEB1Q==
X-CSE-MsgGUID: /r9wdnN7SY6oEiFTRqINag==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="53484908"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="53484908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:50:36 -0800
X-CSE-ConnectionGUID: m0I1LD4XTkOu9muZ0OhRTg==
X-CSE-MsgGUID: cSzcue00TaOmSbX6LAjCFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101249991"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 07:50:35 -0800
Date: Tue, 31 Dec 2024 17:51:25 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 06/16] drm/i915/mst: split out a helper for figuring
 out the TU
Message-ID: <Z3QS_T1bOEaMeFXU@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <bde1edd1d6eac9d5e6519cb2e23b07ff6c71b181.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde1edd1d6eac9d5e6519cb2e23b07ff6c71b181.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:33:55PM +0200, Jani Nikula wrote:
> Extract intel_dp_mtp_tu_compute_config() for figuring out the TU. Move
> the link configuration and mst state access to the callers. This will be
> easier to adapt to 128b/132b SST.
> 
> v2: Don't add SST stuff here yet
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 53 ++++++++++++++-------
>  drivers/gpu/drm/i915/display/intel_dp_mst.h |  7 +++
>  2 files changed, 42 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 51f0248084b6..d08824d2fefe 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -209,31 +209,23 @@ static int intel_dp_mst_dsc_get_slice_count(const struct intel_connector *connec
>  					    num_joined_pipes);
>  }
>  
> -static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
> -					      struct intel_crtc_state *crtc_state,
> -					      int max_bpp, int min_bpp,
> -					      struct link_config_limits *limits,
> -					      struct drm_connector_state *conn_state,
> -					      int step, bool dsc)
> +int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
> +				   struct intel_crtc_state *crtc_state,
> +				   int max_bpp, int min_bpp,
> +				   struct drm_connector_state *conn_state,
> +				   int step, bool dsc)
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	struct drm_atomic_state *state = crtc_state->uapi.state;
> -	struct drm_dp_mst_topology_state *mst_state;
>  	struct intel_connector *connector =
>  		to_intel_connector(conn_state->connector);
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
> +	fixed20_12 pbn_div;
>  	int bpp, slots = -EINVAL;
>  	int dsc_slice_count = 0;
>  	int max_dpt_bpp;
>  
> -	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
> -	if (IS_ERR(mst_state))
> -		return PTR_ERR(mst_state);
> -
> -	crtc_state->lane_count = limits->max_lane_count;
> -	crtc_state->port_clock = limits->max_rate;
> -
>  	if (dsc) {
>  		if (!intel_dp_supports_fec(intel_dp, connector, crtc_state))
>  			return -EINVAL;
> @@ -241,8 +233,8 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		crtc_state->fec_enable = !intel_dp_is_uhbr(crtc_state);
>  	}
>  
> -	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
> -						      crtc_state->lane_count);
> +	pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
> +					   crtc_state->lane_count);

Nit: looking this up from drm_dp_mst_topology_state (once SST and MST is
separated done only in the MST case) instead of recalculating the same
would be better. Either way:

Reviewed-by: Imre Deak <imre.deak@intel.com>

>  
>  	max_dpt_bpp = intel_dp_mst_max_dpt_bpp(crtc_state, dsc);
>  	if (max_bpp > max_dpt_bpp) {
> @@ -302,7 +294,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		pbn.full = dfixed_const(intel_dp_mst_calc_pbn(adjusted_mode->crtc_clock,
>  							      link_bpp_x16,
>  							      remote_bw_overhead));
> -		remote_tu = DIV_ROUND_UP(pbn.full, mst_state->pbn_div.full);
> +		remote_tu = DIV_ROUND_UP(pbn.full, pbn_div.full);
>  
>  		/*
>  		 * Aligning the TUs ensures that symbols consisting of multiple
> @@ -320,7 +312,7 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  		 * allocated for the whole path and the TUs allocated for the
>  		 * first branch device's link also applies here.
>  		 */
> -		pbn.full = remote_tu * mst_state->pbn_div.full;
> +		pbn.full = remote_tu * pbn_div.full;
>  
>  		drm_WARN_ON(display->drm, remote_tu < crtc_state->dp_m_n.tu);
>  		crtc_state->dp_m_n.tu = remote_tu;
> @@ -355,6 +347,31 @@ static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
>  	return 0;
>  }
>  
> +static int mst_stream_find_vcpi_slots_for_bpp(struct intel_dp *intel_dp,
> +					      struct intel_crtc_state *crtc_state,
> +					      int max_bpp, int min_bpp,
> +					      struct link_config_limits *limits,
> +					      struct drm_connector_state *conn_state,
> +					      int step, bool dsc)
> +{
> +	struct drm_atomic_state *state = crtc_state->uapi.state;
> +	struct drm_dp_mst_topology_state *mst_state;
> +
> +	mst_state = drm_atomic_get_mst_topology_state(state, &intel_dp->mst_mgr);
> +	if (IS_ERR(mst_state))
> +		return PTR_ERR(mst_state);
> +
> +	crtc_state->lane_count = limits->max_lane_count;
> +	crtc_state->port_clock = limits->max_rate;
> +
> +	mst_state->pbn_div = drm_dp_get_vc_payload_bw(crtc_state->port_clock,
> +						      crtc_state->lane_count);
> +
> +	return intel_dp_mtp_tu_compute_config(intel_dp, crtc_state,
> +					      max_bpp, min_bpp,
> +					      conn_state, step, dsc);
> +}
> +
>  static int mst_stream_compute_link_config(struct intel_dp *intel_dp,
>  					  struct intel_crtc_state *crtc_state,
>  					  struct drm_connector_state *conn_state,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> index 8343804ce3f8..c6bdc1d190a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +struct drm_connector_state;
>  struct intel_atomic_state;
>  struct intel_crtc;
>  struct intel_crtc_state;
> @@ -30,4 +31,10 @@ bool intel_dp_mst_crtc_needs_modeset(struct intel_atomic_state *state,
>  void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp);
>  bool intel_dp_mst_verify_dpcd_state(struct intel_dp *intel_dp);
>  
> +int intel_dp_mtp_tu_compute_config(struct intel_dp *intel_dp,
> +				   struct intel_crtc_state *crtc_state,
> +				   int max_bpp, int min_bpp,
> +				   struct drm_connector_state *conn_state,
> +				   int step, bool dsc);
> +
>  #endif /* __INTEL_DP_MST_H__ */
> -- 
> 2.39.5
> 
