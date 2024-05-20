Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607E8C9CDC
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 14:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D3F10E368;
	Mon, 20 May 2024 12:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R9S69HXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA6410E3DF;
 Mon, 20 May 2024 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716206925; x=1747742925;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BSga6ey6kC+4b2s4QyYdUg/3A+B0B4mR7EVMFqbgB28=;
 b=R9S69HXULKKZqtBRUXxeqoyCt90k/iO19rNKkiZkCqxwZ8sXMQQCWGII
 T4sZbBHhp2AXd+pLJcaVvx68OBN+1qAgf2kyzqEcpssKtkEEh+FBL0rG4
 c7SX/c2BqMIRXWq0p0QzogpAIltR4t5SxGT+rIF/Vt/Aceskd6L1WG4uN
 EszZPjKdOv91ryaaK1MzNvZZ+KY9jRCwkHmmmsrQv0ZCSueEr2F8s++Zf
 SY9gS7dpVpAVGVs3D1eR8698GH6Ku9P0OeLm8t9Zrsglq96GDji5rl74V
 xCdVoy3OjKtbPEebvJHxuD7onJPPZwqjL4rD9mptm8qG+Ju6760P+K4lf g==;
X-CSE-ConnectionGUID: dXxgItZ8QV2BOVS/ELm2sA==
X-CSE-MsgGUID: 2yKyHGcLTmCoiGmWCXKvTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23737056"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="23737056"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:08:38 -0700
X-CSE-ConnectionGUID: eOP3PySuTZqLEtz9a79s4Q==
X-CSE-MsgGUID: 8LzIpsg0TUu34P8IjNEJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="37044318"
Received: from unknown (HELO localhost) ([10.245.246.99])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 05:08:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Animesh Manna <animesh.manna@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jouni.hogander@intel.com,
 arun.r.murthy@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v5 4/6] drm/i915/alpm: Add compute config for lobf
In-Reply-To: <20240520104822.1116122-5-animesh.manna@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240520104822.1116122-1-animesh.manna@intel.com>
 <20240520104822.1116122-5-animesh.manna@intel.com>
Date: Mon, 20 May 2024 15:08:31 +0300
Message-ID: <877cfou1mo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 20 May 2024, Animesh Manna <animesh.manna@intel.com> wrote:
> Link Off Between Active Frames, is a new feature for eDP
> that allows the panel to go to lower power state after
> transmission of data. This is a feature on top of ALPM, AS SDP.
> Add compute config during atomic-check phase.
>
> v1: RFC version.
> v2: Add separate flag for auxless-alpm. [Jani]
> v3:
> - intel_dp->lobf_supported replaced with crtc_state->has_lobf. [Jouni]
> - Add DISPLAY_VER() check. [Jouni]
> - Modify function name of get_aux_less_status. [Jani]
> v4: Add enum alpm_mode to hold the aux-wake/less capability.
> v5: Add alpm_dpcd to intel_dp and use aux_wake_supported()/
> aux_less_wake_supported() instead of enum alpm_mode. [Jouni]
>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_alpm.c     | 61 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_alpm.h     |  5 ++
>  .../drm/i915/display/intel_display_types.h    |  5 ++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  4 ++
>  4 files changed, 75 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index 7307e02277d6..c2334197e723 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -11,6 +11,26 @@
>  #include "intel_dp_aux.h"
>  #include "intel_psr_regs.h"
>  
> +static bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp)
> +{
> +	return intel_dp->alpm_dpcd & DP_ALPM_CAP;
> +}
> +
> +static bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp)
> +{
> +	return intel_dp->alpm_dpcd & DP_ALPM_AUX_LESS_CAP;
> +}
> +
> +void intel_alpm_get_capability(struct intel_dp *intel_dp)
> +{
> +	u8 dpcd;
> +
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP, &dpcd) < 0)
> +		return;
> +
> +	intel_dp->alpm_dpcd = dpcd;
> +}
> +
>  /*
>   * See Bspec: 71632 for the table
>   *
> @@ -243,6 +263,47 @@ bool intel_alpm_compute_params(struct intel_dp *intel_dp,
>  	return true;
>  }
>  
> +void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,

Please prefer something_something_compute_config() naming instead of
something_compute_something_config().

BR,
Jani.

> +				    struct intel_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	int waketime_in_lines, first_sdp_position;
> +	int context_latency, guardband;
> +
> +	if (!intel_dp_is_edp(intel_dp))
> +		return;
> +
> +	if (DISPLAY_VER(i915) < 20)
> +		return;
> +
> +	if (!intel_dp_as_sdp_supported(intel_dp))
> +		return;
> +
> +	if (crtc_state->has_psr)
> +		return;
> +
> +	if (!(intel_alpm_aux_wake_supported(intel_dp) ||
> +	      intel_alpm_aux_less_wake_supported(intel_dp)))
> +		return;
> +
> +	if (!intel_alpm_compute_params(intel_dp, crtc_state))
> +		return;
> +
> +	context_latency = adjusted_mode->crtc_vblank_start - adjusted_mode->crtc_vdisplay;
> +	guardband = adjusted_mode->crtc_vtotal -
> +		    adjusted_mode->crtc_vdisplay - context_latency;
> +	first_sdp_position = adjusted_mode->crtc_vtotal - adjusted_mode->crtc_vsync_start;
> +	if (intel_alpm_aux_less_wake_supported(intel_dp))
> +		waketime_in_lines = intel_dp->alpm_parameters.io_wake_lines;
> +	else
> +		waketime_in_lines = intel_dp->alpm_parameters.fast_wake_lines;
> +
> +	crtc_state->has_lobf = (context_latency + guardband) >
> +		(first_sdp_position + waketime_in_lines);
> +}
> +
>  static void lnl_alpm_configure(struct intel_dp *intel_dp)
>  {
>  	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index c45d078e5a6b..45c07f023a63 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -10,9 +10,14 @@
>  
>  struct intel_dp;
>  struct intel_crtc_state;
> +struct drm_connector_state;
>  
> +void intel_alpm_get_capability(struct intel_dp *intel_dp);
>  bool intel_alpm_compute_params(struct intel_dp *intel_dp,
>  			       struct intel_crtc_state *crtc_state);
> +void intel_alpm_compute_lobf_config(struct intel_dp *intel_dp,
> +				    struct intel_crtc_state *crtc_state,
> +				    struct drm_connector_state *conn_state);
>  void intel_alpm_configure(struct intel_dp *intel_dp);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 0ad6134ba94e..d77a9f22b5c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1410,6 +1410,9 @@ struct intel_crtc_state {
>  
>  	/* for loading single buffered registers during vblank */
>  	struct drm_vblank_work vblank_work;
> +
> +	/* LOBF flag */
> +	bool has_lobf;
>  };
>  
>  enum intel_pipe_crc_source {
> @@ -1845,6 +1848,8 @@ struct intel_dp {
>  		u8 silence_period_sym_clocks;
>  		u8 lfps_half_cycle_num_of_syms;
>  	} alpm_parameters;
> +
> +	u8 alpm_dpcd;
>  };
>  
>  enum lspcon_vendor {
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c0a3b6d50681..61ee66ad8bd0 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -48,6 +48,7 @@
>  #include "i915_drv.h"
>  #include "i915_irq.h"
>  #include "i915_reg.h"
> +#include "intel_alpm.h"
>  #include "intel_atomic.h"
>  #include "intel_audio.h"
>  #include "intel_backlight.h"
> @@ -3000,6 +3001,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>  	intel_vrr_compute_config(pipe_config, conn_state);
>  	intel_dp_compute_as_sdp(intel_dp, pipe_config);
>  	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
> +	intel_alpm_compute_lobf_config(intel_dp, pipe_config, conn_state);
>  	intel_dp_drrs_compute_config(connector, pipe_config, link_bpp_x16);
>  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
>  	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
> @@ -6616,6 +6618,8 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>  
>  	intel_pps_init_late(intel_dp);
>  
> +	intel_alpm_get_capability(intel_dp);
> +
>  	return true;
>  
>  out_vdd_off:

-- 
Jani Nikula, Intel
