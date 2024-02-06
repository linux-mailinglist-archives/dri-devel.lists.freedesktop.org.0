Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5B784C0A7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 00:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05533112F2E;
	Tue,  6 Feb 2024 23:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXONxfge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81B210E974;
 Tue,  6 Feb 2024 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707260928; x=1738796928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i/K0Mgc+35ytwVeFXggDBuxr/ZYinmU9wMiThkFEl64=;
 b=VXONxfgeJ6wvzhuQXc5UgqYeGHjl9iOX5Q3kTLcZ4o9T0rRZxFQ+r+su
 TN8Escj3b8cLYx1OuAi1gRhQYJyOfpAgoD7iMzL0w6klGcaNwhCQe+xNY
 V1dsJjjg1nN35zcVLtDrXY+bqxemd0jnUgVuIgfwC7CIMwS2N+u6c/yix
 7UvE0gdLKQg0UnmdJxiPuXpYxil5pCv8Fj2gRM4O9JhDkwARdWKTaEdyj
 kzfqdOWDW+CloDUIDKwIeAHytZ5jscjfC/OqRlK5Nh4wkTxz1c7XAYxd4
 Vbj1cv9lVq5pYoof4snGNggnsvx7JdLmkn0Q+NF4k9WkGr+ftjZzrMIpG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="752619"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="752619"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824320481"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; d="scan'208";a="824320481"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 06 Feb 2024 15:08:44 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 01:08:43 +0200
Date: Wed, 7 Feb 2024 01:08:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 11/19] drm/i915/dp: Add support for DP tunnel BW allocation
Message-ID: <ZcK7--cYow8bmnjY@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
 <20240123102850.390126-12-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240123102850.390126-12-imre.deak@intel.com>
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

On Tue, Jan 23, 2024 at 12:28:42PM +0200, Imre Deak wrote:
> Add support to enable the DP tunnel BW allocation mode. Follow-up
> patches will call the required helpers added here to prepare for a
> modeset on a link with DP tunnels, the last change in the patchset
> actually enabling BWA.
> 
> With BWA enabled, the driver will expose the full mode list a display
> supports, regardless of any BW limitation on a shared (Thunderbolt)
> link. Such BW limits will be checked against only during a modeset, when
> the driver has the full knowledge of each display's BW requirement.
> 
> If the link BW changes in a way that a connector's modelist may also
> change, userspace will get a hotplug notification for all the connectors
> sharing the same link (so it can adjust the mode used for a display).
> 
> The BW limitation can change at any point, asynchronously to modesets
> on a given connector, so a modeset can fail even though the atomic check
> for it passed. In such scenarios userspace will get a bad link
> notification and in response is supposed to retry the modeset.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig                  |  13 +
>  drivers/gpu/drm/i915/Kconfig.debug            |   1 +
>  drivers/gpu/drm/i915/Makefile                 |   3 +
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
>  .../gpu/drm/i915/display/intel_display_core.h |   1 +
>  .../drm/i915/display/intel_display_types.h    |   9 +
>  .../gpu/drm/i915/display/intel_dp_tunnel.c    | 642 ++++++++++++++++++
>  .../gpu/drm/i915/display/intel_dp_tunnel.h    | 131 ++++
>  8 files changed, 802 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> 
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index b5d6e3352071f..4636913c17868 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -155,6 +155,19 @@ config DRM_I915_PXP
>  	  protected session and manage the status of the alive software session,
>  	  as well as its life cycle.
>  
> +config DRM_I915_DP_TUNNEL
> +	bool "Enable DP tunnel support"
> +	depends on DRM_I915
> +	select DRM_DISPLAY_DP_TUNNEL
> +	default y
> +	help
> +	  Choose this option to detect DP tunnels and enable the Bandwidth
> +	  Allocation mode for such tunnels. This allows using the maximum
> +	  resolution allowed by the link BW on all displays sharing the
> +	  link BW, for instance on a Thunderbolt link.
> +
> +	  If in doubt, say "Y".
> +
>  menu "drm/i915 Debugging"
>  depends on DRM_I915
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
> index 5b7162076850c..bc18e2d9ea05d 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -28,6 +28,7 @@ config DRM_I915_DEBUG
>  	select STACKDEPOT
>  	select STACKTRACE
>  	select DRM_DP_AUX_CHARDEV
> +	select DRM_DISPLAY_DEBUG_DP_TUNNEL_STATE if DRM_I915_DP_TUNNEL
>  	select X86_MSR # used by igt/pm_rpm
>  	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
>  	select DRM_DEBUG_MM if DRM=y
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index c13f14edb5088..3ef6ed41e62b4 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -369,6 +369,9 @@ i915-y += \
>  	display/vlv_dsi.o \
>  	display/vlv_dsi_pll.o
>  
> +i915-$(CONFIG_DRM_I915_DP_TUNNEL) += \
> +	display/intel_dp_tunnel.o
> +
>  i915-y += \
>  	i915_perf.o
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index ec0d5168b5035..96ab37e158995 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -29,6 +29,7 @@
>   * See intel_atomic_plane.c for the plane-specific atomic functionality.
>   */
>  
> +#include <drm/display/drm_dp_tunnel.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
> @@ -38,6 +39,7 @@
>  #include "intel_atomic.h"
>  #include "intel_cdclk.h"
>  #include "intel_display_types.h"
> +#include "intel_dp_tunnel.h"
>  #include "intel_global_state.h"
>  #include "intel_hdcp.h"
>  #include "intel_psr.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/gpu/drm/i915/display/intel_display_core.h
> index a90f1aa201be8..0993d25a0a686 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -522,6 +522,7 @@ struct intel_display {
>  	} wq;
>  
>  	/* Grouping using named structs. Keep sorted. */
> +	struct drm_dp_tunnel_mgr *dp_tunnel_mgr;
>  	struct intel_audio audio;
>  	struct intel_dpll dpll;
>  	struct intel_fbc *fbc[I915_MAX_FBCS];
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index ae2e8cff9d691..b79db78b27728 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -33,6 +33,7 @@
>  
>  #include <drm/display/drm_dp_dual_mode_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> +#include <drm/display/drm_dp_tunnel.h>
>  #include <drm/display/drm_dsc.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_crtc.h>
> @@ -677,6 +678,8 @@ struct intel_atomic_state {
>  
>  	struct intel_shared_dpll_state shared_dpll[I915_NUM_PLLS];
>  
> +	struct intel_dp_tunnel_inherited_state *dp_tunnel_state;

'dp_tunnel_state' is a bit too generic sounding to me.
'inherited_tunnels' or something like that maybe?

> +
>  	/*
>  	 * Current watermarks can't be trusted during hardware readout, so
>  	 * don't bother calculating intermediate watermarks.
> @@ -1372,6 +1375,9 @@ struct intel_crtc_state {
>  		struct drm_dsc_config config;
>  	} dsc;
>  
> +	/* DP tunnel used for BW allocation. */
> +	struct drm_dp_tunnel_ref dp_tunnel_ref;
> +
>  	/* HSW+ linetime watermarks */
>  	u16 linetime;
>  	u16 ips_linetime;
> @@ -1775,6 +1781,9 @@ struct intel_dp {
>  	/* connector directly attached - won't be use for modeset in mst world */
>  	struct intel_connector *attached_connector;
>  
> +	struct drm_dp_tunnel *tunnel;
> +	bool tunnel_suspended:1;
> +
>  	/* mst connector list */
>  	struct intel_dp_mst_encoder *mst_encoders[I915_MAX_PIPES];
>  	struct drm_dp_mst_topology_mgr mst_mgr;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.c b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> new file mode 100644
> index 0000000000000..52dd0108a6c13
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.c
> @@ -0,0 +1,642 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +
> +#include <drm/display/drm_dp_tunnel.h>
> +
> +#include "intel_atomic.h"
> +#include "intel_display_limits.h"
> +#include "intel_display_types.h"
> +#include "intel_dp.h"
> +#include "intel_dp_link_training.h"
> +#include "intel_dp_mst.h"
> +#include "intel_dp_tunnel.h"
> +#include "intel_link_bw.h"
> +
> +struct intel_dp_tunnel_inherited_state {
> +	struct {
> +		struct drm_dp_tunnel_ref tunnel_ref;
> +	} tunnels[I915_MAX_PIPES];

Hmm. Does the extra middle-man struct buy us anything?

> +};
> +
> +static void destroy_tunnel(struct intel_dp *intel_dp)
> +{
> +	drm_dp_tunnel_destroy(intel_dp->tunnel);
> +	intel_dp->tunnel = NULL;
> +}
> +
> +void intel_dp_tunnel_disconnect(struct intel_dp *intel_dp)
> +{
> +	if (!intel_dp->tunnel)
> +		return;
> +
> +	destroy_tunnel(intel_dp);
> +}
> +
> +void intel_dp_tunnel_destroy(struct intel_dp *intel_dp)
> +{
> +	if (!intel_dp->tunnel)
> +		return;
> +
> +	if (intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		drm_dp_tunnel_disable_bw_alloc(intel_dp->tunnel);
> +
> +	destroy_tunnel(intel_dp);
> +}
> +
> +static int kbytes_to_mbits(int kbytes)
> +{
> +	return DIV_ROUND_UP(kbytes * 8, 1000);
> +}
> +
> +static int get_current_link_bw(struct intel_dp *intel_dp,
> +			       bool *below_dprx_bw)
> +{
> +	int rate = intel_dp_max_common_rate(intel_dp);
> +	int lane_count = intel_dp_max_common_lane_count(intel_dp);
> +	int bw;
> +
> +	bw = intel_dp_max_link_data_rate(intel_dp, rate, lane_count);
> +	*below_dprx_bw = bw < drm_dp_max_dprx_data_rate(rate, lane_count);
> +
> +	return bw;
> +}
> +
> +static int update_tunnel_state(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	bool old_bw_below_dprx;
> +	bool new_bw_below_dprx;
> +	int old_bw;
> +	int new_bw;
> +	int ret;
> +
> +	old_bw = get_current_link_bw(intel_dp, &old_bw_below_dprx);
> +
> +	ret = drm_dp_tunnel_update_state(intel_dp->tunnel);
> +	if (ret < 0) {
> +		drm_dbg_kms(&i915->drm,
> +			    "[DPTUN %s][ENCODER:%d:%s] State update failed (err %pe)\n",
> +			    drm_dp_tunnel_name(intel_dp->tunnel),
> +			    encoder->base.base.id,
> +			    encoder->base.name,
> +			    ERR_PTR(ret));
> +
> +		return ret;
> +	}
> +
> +	if (ret == 0 ||
> +	    !drm_dp_tunnel_bw_alloc_is_enabled(intel_dp->tunnel))
> +		return 0;
> +
> +	intel_dp_update_sink_caps(intel_dp);
> +
> +	new_bw = get_current_link_bw(intel_dp, &new_bw_below_dprx);
> +
> +	/* Suppress the notification if the mode list can't change due to bw. */
> +	if (old_bw_below_dprx == new_bw_below_dprx &&
> +	    !new_bw_below_dprx)
> +		return 0;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][ENCODER:%d:%s] Notify users about BW change: %d -> %d\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    kbytes_to_mbits(old_bw),
> +		    kbytes_to_mbits(new_bw));
> +
> +	return 1;
> +}
> +
> +static int allocate_initial_tunnel_bw(struct intel_dp *intel_dp,
> +				      struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	const struct intel_crtc *crtc;
> +	int tunnel_bw = 0;
> +	u8 pipe_mask;
> +	int err;
> +
> +	err = intel_dp_get_active_pipes(intel_dp, ctx,
> +					INTEL_DP_GET_PIPES_SYNC,
> +					&pipe_mask);
> +	if (err)
> +		return err;
> +
> +	for_each_intel_crtc_in_pipe_mask(&i915->drm, crtc, pipe_mask) {
> +		const struct intel_crtc_state *crtc_state =
> +			to_intel_crtc_state(crtc->base.state);
> +		int stream_bw = intel_dp_config_required_rate(crtc_state);
> +
> +		drm_dbg_kms(&i915->drm,
> +			    "[DPTUN %s][ENCODER:%d:%s][CRTC:%d:%s] Initial BW for stream %d: %d/%d Mb/s\n",
> +			    drm_dp_tunnel_name(intel_dp->tunnel),
> +			    encoder->base.base.id,
> +			    encoder->base.name,

I would try to have the id+name for each object on the same line.
Avoids the whole thing eating so many lines, and the two are related
so just makes sense.

> +			    crtc->base.base.id,
> +			    crtc->base.name,
> +			    crtc->pipe,
> +			    kbytes_to_mbits(stream_bw),
> +			    kbytes_to_mbits(tunnel_bw));
> +
> +		tunnel_bw += stream_bw;
> +	}
> +
> +	err = drm_dp_tunnel_alloc_bw(intel_dp->tunnel, tunnel_bw);
> +	if (err) {
> +		drm_dbg_kms(&i915->drm,
> +			    "[DPTUN %s][ENCODER:%d:%s] Initial BW allocation failed (err %pe)\n",
> +			    drm_dp_tunnel_name(intel_dp->tunnel),
> +			    encoder->base.base.id,
> +			    encoder->base.name,
> +			    ERR_PTR(err));
> +
> +		return err;
> +	}
> +
> +	return update_tunnel_state(intel_dp);
> +}
> +
> +static int detect_new_tunnel(struct intel_dp *intel_dp, struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	struct drm_dp_tunnel *tunnel;
> +	int ret;
> +
> +	tunnel = drm_dp_tunnel_detect(i915->display.dp_tunnel_mgr,
> +					&intel_dp->aux);
> +	if (IS_ERR(tunnel))
> +		return PTR_ERR(tunnel);
> +
> +	intel_dp->tunnel = tunnel;
> +
> +	ret = drm_dp_tunnel_enable_bw_alloc(intel_dp->tunnel);
> +	if (ret) {
> +		if (ret == -EOPNOTSUPP)
> +			return 0;
> +
> +		drm_dbg_kms(&i915->drm,
> +			    "[DPTUN %s][ENCODER:%d:%s] Failed to enable BW allocation mode (ret %pe)\n",
> +			    drm_dp_tunnel_name(intel_dp->tunnel),
> +			    encoder->base.base.id,
> +			    encoder->base.name,
> +			    ERR_PTR(ret));
> +
> +		/* Keep the tunnel with BWA disabled */
> +		return 0;
> +	}
> +
> +	ret = allocate_initial_tunnel_bw(intel_dp, ctx);
> +	if (ret < 0)
> +		intel_dp_tunnel_destroy(intel_dp);
> +
> +	return ret;
> +}
> +
> +int intel_dp_tunnel_detect(struct intel_dp *intel_dp, struct drm_modeset_acquire_ctx *ctx)
> +{
> +	int ret;
> +
> +	if (intel_dp_is_edp(intel_dp))
> +		return 0;
> +
> +	if (intel_dp->tunnel) {
> +		ret = update_tunnel_state(intel_dp);
> +		if (ret >= 0)
> +			return ret;
> +
> +		/* Try to recreate the tunnel after an update error. */
> +		intel_dp_tunnel_destroy(intel_dp);
> +	}
> +
> +	ret = detect_new_tunnel(intel_dp, ctx);
> +	if (ret >= 0 || ret == -EDEADLK)

This if-statement seems to achieve nothing. Was there supposed
be some error handling for the actual error cases here?

> +		return ret;
> +
> +	return ret;
> +}
> +
> +bool intel_dp_tunnel_bw_alloc_is_enabled(struct intel_dp *intel_dp)
> +{
> +	return intel_dp->tunnel &&
> +		drm_dp_tunnel_bw_alloc_is_enabled(intel_dp->tunnel);

We seem to have quite a few wrappers just for the NULL check.
I wonder if we should just make drm_dp_tunnel*() accept NULL
directly? Maybe something to think for the future...

> +}
> +
> +void intel_dp_tunnel_suspend(struct intel_dp *intel_dp)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +
> +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return;
> +
> +	drm_dbg_kms(&i915->drm, "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Suspend\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id, connector->base.name,
> +		    encoder->base.base.id, encoder->base.name);
> +
> +	intel_dp->tunnel_suspended = true;
> +}
> +
> +void intel_dp_tunnel_resume(struct intel_dp *intel_dp, bool dpcd_updated)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	int err = 0;
> +
> +	if (!intel_dp->tunnel_suspended)
> +		return;
> +
> +	intel_dp->tunnel_suspended = false;
> +
> +	drm_dbg_kms(&i915->drm, "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Resume\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id, connector->base.name,
> +		    encoder->base.base.id, encoder->base.name);
> +
> +	/* DPRX caps read required by tunnel detection */
> +	if (!dpcd_updated)
> +		err = intel_dp_read_dprx_caps(intel_dp, dpcd);
> +
> +	if (err)
> +		drm_dp_tunnel_set_io_error(intel_dp->tunnel);
> +	else
> +		err = drm_dp_tunnel_enable_bw_alloc(intel_dp->tunnel);
> +		/* TODO: allocate initial BW */
> +
> +	if (!err)
> +		return;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s] Tunnel can't be resumed, will drop and redect it (err %pe)\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id, connector->base.name,
> +		    encoder->base.base.id, encoder->base.name,
> +		    ERR_PTR(err));
> +}
> +
> +static struct drm_dp_tunnel *
> +get_inherited_tunnel_state(struct intel_atomic_state *state,
> +			   const struct intel_crtc *crtc)
> +{
> +	if (!state->dp_tunnel_state)
> +		return NULL;
> +
> +	return state->dp_tunnel_state->tunnels[crtc->pipe].tunnel_ref.tunnel;
> +}
> +
> +static int
> +add_inherited_tunnel_state(struct intel_atomic_state *state,
> +			   struct drm_dp_tunnel *tunnel,
> +			   const struct intel_crtc *crtc)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	struct drm_dp_tunnel *old_tunnel;
> +
> +	old_tunnel = get_inherited_tunnel_state(state, crtc);
> +	if (old_tunnel) {
> +		drm_WARN_ON(&i915->drm, old_tunnel != tunnel);
> +		return 0;
> +	}
> +
> +	if (!state->dp_tunnel_state) {
> +		state->dp_tunnel_state = kzalloc(sizeof(*state->dp_tunnel_state), GFP_KERNEL);

I was pondering if the dynamic allocation for this is super useful.
But I guess we anywya have to deal with various errors in the
places where this gets used so maybe not much benefit from
avoiding it.

> +		if (!state->dp_tunnel_state)
> +			return -ENOMEM;
> +	}
> +
> +	drm_dp_tunnel_ref_get(tunnel,
> +			      &state->dp_tunnel_state->tunnels[crtc->pipe].tunnel_ref);
> +
> +	return 0;
> +}
> +
> +static int check_inherited_tunnel_state(struct intel_atomic_state *state,
> +					struct intel_dp *intel_dp,
> +					const struct intel_digital_connector_state *old_conn_state)
> +{
> +	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	const struct intel_connector *connector =
> +		to_intel_connector(old_conn_state->base.connector);
> +	struct intel_crtc *old_crtc;
> +	const struct intel_crtc_state *old_crtc_state;
> +
> +	/*
> +	 * If a BWA tunnel gets detected only after the corresponding
> +	 * connector got enabled already without a BWA tunnel, or a different
> +	 * BWA tunnel (which was removed meanwhile) the old CRTC state won't
> +	 * contain the state of the current tunnel. This tunnel still has a
> +	 * reserved BW, which needs to be released, add the state for such
> +	 * inherited tunnels separately only to this atomic state.
> +	 */
> +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return 0;
> +
> +	if (!old_conn_state->base.crtc)
> +		return 0;
> +
> +	old_crtc = to_intel_crtc(old_conn_state->base.crtc);
> +	old_crtc_state = intel_atomic_get_old_crtc_state(state, old_crtc);
> +
> +	if (!old_crtc_state->hw.active ||
> +	    old_crtc_state->dp_tunnel_ref.tunnel == intel_dp->tunnel)
> +		return 0;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s][CRTC:%d:%s] Adding state for inherited tunnel %p\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id,
> +		    connector->base.name,
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    old_crtc->base.base.id,
> +		    old_crtc->base.name,
> +		    intel_dp->tunnel);
> +
> +	return add_inherited_tunnel_state(state, intel_dp->tunnel, old_crtc);
> +}
> +
> +void intel_dp_tunnel_atomic_cleanup_inherited_state(struct intel_atomic_state *state)
> +{
> +	enum pipe pipe;
> +
> +	if (!state->dp_tunnel_state)
> +		return;
> +
> +	for_each_pipe(to_i915(state->base.dev), pipe)
> +		if (state->dp_tunnel_state->tunnels[pipe].tunnel_ref.tunnel)
> +			drm_dp_tunnel_ref_put(&state->dp_tunnel_state->tunnels[pipe].tunnel_ref);
> +
> +	kfree(state->dp_tunnel_state);
> +	state->dp_tunnel_state = NULL;
> +}
> +
> +static int intel_dp_tunnel_atomic_add_group_state(struct intel_atomic_state *state,
> +						  struct drm_dp_tunnel *tunnel)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	u32 pipe_mask;
> +	int err;
> +
> +	if (!tunnel)
> +		return 0;
> +
> +	err = drm_dp_tunnel_atomic_get_group_streams_in_state(&state->base,
> +							      tunnel, &pipe_mask);
> +	if (err)
> +		return err;
> +
> +	drm_WARN_ON(&i915->drm, pipe_mask & ~((1 << I915_MAX_PIPES) - 1));
> +
> +	return intel_modeset_pipes_in_mask_early(state, "DPTUN", pipe_mask);
> +}
> +
> +int intel_dp_tunnel_atomic_add_state_for_crtc(struct intel_atomic_state *state,
> +					      struct intel_crtc *crtc)
> +{
> +	const struct intel_crtc_state *new_crtc_state =
> +		intel_atomic_get_new_crtc_state(state, crtc);
> +	const struct drm_dp_tunnel_state *tunnel_state;
> +	struct drm_dp_tunnel *tunnel = new_crtc_state->dp_tunnel_ref.tunnel;
> +
> +	if (!tunnel)
> +		return 0;
> +
> +	tunnel_state = drm_dp_tunnel_atomic_get_state(&state->base, tunnel);
> +	if (IS_ERR(tunnel_state))
> +		return PTR_ERR(tunnel_state);
> +
> +	return 0;
> +}
> +
> +static int check_group_state(struct intel_atomic_state *state,
> +			     struct intel_dp *intel_dp,
> +			     const struct intel_connector *connector,
> +			     struct intel_crtc *crtc)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	const struct intel_crtc_state *crtc_state;
> +
> +	crtc_state = intel_atomic_get_new_crtc_state(state, crtc);

Doesn't really need to be on its own line here.

> +
> +	if (!crtc_state->dp_tunnel_ref.tunnel)
> +		return 0;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s][CRTC:%d:%s] Adding group state for tunnel %p\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id,
> +		    connector->base.name,
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    crtc->base.base.id,
> +		    crtc->base.name,
> +		    intel_dp->tunnel);
> +
> +	return intel_dp_tunnel_atomic_add_group_state(state, crtc_state->dp_tunnel_ref.tunnel);
> +}
> +
> +int intel_dp_tunnel_atomic_check_state(struct intel_atomic_state *state,
> +				       struct intel_dp *intel_dp,
> +				       struct intel_connector *connector)
> +{
> +	const struct intel_digital_connector_state *old_conn_state =
> +		intel_atomic_get_new_connector_state(state, connector);

s/get_new/get_old/

> +	const struct intel_digital_connector_state *new_conn_state =
> +		intel_atomic_get_new_connector_state(state, connector);
> +	int err;
> +
> +	if (old_conn_state->base.crtc) {
> +		err = check_group_state(state, intel_dp, connector,
> +					to_intel_crtc(old_conn_state->base.crtc));
> +		if (err)
> +			return err;
> +	}
> +
> +	if (new_conn_state->base.crtc &&
> +	    new_conn_state->base.crtc != old_conn_state->base.crtc) {
> +		err = check_group_state(state, intel_dp, connector,
> +					to_intel_crtc(new_conn_state->base.crtc));
> +		if (err)
> +			return err;
> +	}
> +
> +	return check_inherited_tunnel_state(state, intel_dp, old_conn_state);
> +}
> +
> +void intel_dp_tunnel_atomic_compute_stream_bw(struct intel_atomic_state *state,
> +					      struct intel_dp *intel_dp,
> +					      const struct intel_connector *connector,
> +					      struct intel_crtc_state *crtc_state)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	struct intel_encoder *encoder = &dp_to_dig_port(intel_dp)->base;
> +	const struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);

We don't usually const anything but the states.

> +	int required_rate = intel_dp_config_required_rate(crtc_state);
> +
> +	if (!intel_dp_tunnel_bw_alloc_is_enabled(intel_dp))
> +		return;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][CONNECTOR:%d:%s][ENCODER:%d:%s][CRTC:%d:%s] Stream %d required BW %d Mb/s\n",
> +		    drm_dp_tunnel_name(intel_dp->tunnel),
> +		    connector->base.base.id,
> +		    connector->base.name,
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    crtc->base.base.id,
> +		    crtc->base.name,
> +		    crtc->pipe,
> +		    kbytes_to_mbits(required_rate));
> +
> +	drm_dp_tunnel_atomic_set_stream_bw(&state->base, intel_dp->tunnel,
> +					   crtc->pipe, required_rate);
> +
> +	drm_dp_tunnel_ref_get(intel_dp->tunnel,
> +			      &crtc_state->dp_tunnel_ref);
> +}
> +
> +/**
> + * intel_dp_tunnel_atomic_check_link - Check the DP tunnel atomic state
> + * @state: intel atomic state
> + * @limits: link BW limits
> + *
> + * Check the link configuration for all DP tunnels in @state. If the
> + * configuration is invalid @limits will be updated if possible to
> + * reduce the total BW, after which the configuration for all CRTCs in
> + * @state must be recomputed with the updated @limits.
> + *
> + * Returns:
> + *   - 0 if the confugration is valid
> + *   - %-EAGAIN, if the configuration is invalid and @limits got updated
> + *     with fallback values with which the configuration of all CRTCs in
> + *     @state must be recomputed
> + *   - Other negative error, if the configuration is invalid without a
> + *     fallback possibility, or the check failed for another reason
> + */
> +int intel_dp_tunnel_atomic_check_link(struct intel_atomic_state *state,
> +				      struct intel_link_bw_limits *limits)
> +{
> +	u32 failed_stream_mask;
> +	int err;
> +
> +	err = drm_dp_tunnel_atomic_check_stream_bws(&state->base,
> +						    &failed_stream_mask);
> +	if (err != -ENOSPC)
> +		return err;
> +
> +	err = intel_link_bw_reduce_bpp(state, limits,
> +				       failed_stream_mask, "DP tunnel link BW");
> +
> +	return err ? : -EAGAIN;
> +}
> +
> +void intel_dp_tunnel_atomic_alloc_bw(struct intel_atomic_state *state,
> +				     struct intel_encoder *encoder,
> +				     const struct intel_crtc_state *new_crtc_state,
> +				     const struct drm_connector_state *new_conn_state)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	struct drm_dp_tunnel *tunnel = new_crtc_state->dp_tunnel_ref.tunnel;
> +	const struct drm_dp_tunnel_state *new_tunnel_state;
> +	int err;
> +
> +	if (!tunnel)
> +		return;
> +
> +	new_tunnel_state = drm_dp_tunnel_atomic_get_new_state(&state->base, tunnel);
> +
> +	err = drm_dp_tunnel_alloc_bw(tunnel,
> +				     drm_dp_tunnel_atomic_get_tunnel_bw(new_tunnel_state));
> +	if (!err)
> +		return;
> +
> +	if (!intel_digital_port_connected(encoder))
> +		return;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][ENCODER:%d:%s] BW allocation failed on a connected sink (err %pe)\n",
> +		    drm_dp_tunnel_name(tunnel),
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    ERR_PTR(err));
> +
> +	intel_dp_queue_modeset_retry_for_link(state, encoder, new_crtc_state, new_conn_state);
> +}
> +
> +void intel_dp_tunnel_atomic_free_bw(struct intel_atomic_state *state,
> +				    struct intel_encoder *encoder,
> +				    const struct intel_crtc_state *old_crtc_state,
> +				    const struct drm_connector_state *old_conn_state)
> +{
> +	struct drm_i915_private *i915 = to_i915(state->base.dev);
> +	struct intel_crtc *old_crtc = to_intel_crtc(old_crtc_state->uapi.crtc);
> +	struct drm_dp_tunnel *tunnel;
> +	int err;
> +
> +	tunnel = get_inherited_tunnel_state(state, old_crtc);
> +	if (!tunnel)
> +		tunnel = old_crtc_state->dp_tunnel_ref.tunnel;

So what happens if we have tunnels in both places?

The one in old_crtc_state is stale enough that we don't
have to care about it?

> +
> +	if (!tunnel)
> +		return;
> +
> +	err = drm_dp_tunnel_alloc_bw(tunnel, 0);
> +	if (!err)
> +		return;
> +
> +	if (!intel_digital_port_connected(encoder))
> +		return;
> +
> +	drm_dbg_kms(&i915->drm,
> +		    "[DPTUN %s][ENCODER:%d:%s] BW freeing failed on a connected sink (err %pe)\n",
> +		    drm_dp_tunnel_name(tunnel),
> +		    encoder->base.base.id,
> +		    encoder->base.name,
> +		    ERR_PTR(err));
> +
> +	intel_dp_queue_modeset_retry_for_link(state, encoder, old_crtc_state, old_conn_state);
> +}
> +
> +int intel_dp_tunnel_mgr_init(struct drm_i915_private *i915)
> +{
> +	struct drm_dp_tunnel_mgr *tunnel_mgr;
> +	struct drm_connector_list_iter connector_list_iter;
> +	struct intel_connector *connector;
> +	int dp_connectors = 0;
> +
> +	drm_connector_list_iter_begin(&i915->drm, &connector_list_iter);
> +	for_each_intel_connector_iter(connector, &connector_list_iter) {
> +		if (connector->base.connector_type != DRM_MODE_CONNECTOR_DisplayPort)
> +			continue;
> +
> +		dp_connectors++;
> +	}
> +	drm_connector_list_iter_end(&connector_list_iter);
> +
> +	tunnel_mgr = drm_dp_tunnel_mgr_create(&i915->drm, dp_connectors);
> +	if (IS_ERR(tunnel_mgr))
> +		return PTR_ERR(tunnel_mgr);
> +
> +	i915->display.dp_tunnel_mgr = tunnel_mgr;
> +
> +	return 0;
> +}
> +
> +void intel_dp_tunnel_mgr_cleanup(struct drm_i915_private *i915)
> +{
> +	drm_dp_tunnel_mgr_destroy(i915->display.dp_tunnel_mgr);
> +	i915->display.dp_tunnel_mgr = NULL;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_tunnel.h b/drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> new file mode 100644
> index 0000000000000..bedba3ba9ad8d
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_dp_tunnel.h
> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __INTEL_DP_TUNNEL_H__
> +#define __INTEL_DP_TUNNEL_H__
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +struct drm_i915_private;
> +struct drm_connector_state;
> +struct drm_modeset_acquire_ctx;
> +
> +struct intel_atomic_state;
> +struct intel_connector;
> +struct intel_crtc;
> +struct intel_crtc_state;
> +struct intel_dp;
> +struct intel_encoder;
> +struct intel_link_bw_limits;
> +
> +#if defined(CONFIG_DRM_I915_DP_TUNNEL) && defined(I915)
> +
> +int intel_dp_tunnel_detect(struct intel_dp *intel_dp, struct drm_modeset_acquire_ctx *ctx);
> +void intel_dp_tunnel_disconnect(struct intel_dp *intel_dp);
> +void intel_dp_tunnel_destroy(struct intel_dp *intel_dp);
> +void intel_dp_tunnel_resume(struct intel_dp *intel_dp, bool dpcd_updated);
> +void intel_dp_tunnel_suspend(struct intel_dp *intel_dp);
> +
> +bool intel_dp_tunnel_bw_alloc_is_enabled(struct intel_dp *intel_dp);
> +
> +void
> +intel_dp_tunnel_atomic_cleanup_inherited_state(struct intel_atomic_state *state);
> +
> +void intel_dp_tunnel_atomic_compute_stream_bw(struct intel_atomic_state *state,
> +					      struct intel_dp *intel_dp,
> +					      const struct intel_connector *connector,
> +					      struct intel_crtc_state *crtc_state);
> +
> +int intel_dp_tunnel_atomic_add_state_for_crtc(struct intel_atomic_state *state,
> +					      struct intel_crtc *crtc);
> +int intel_dp_tunnel_atomic_check_link(struct intel_atomic_state *state,
> +				      struct intel_link_bw_limits *limits);
> +int intel_dp_tunnel_atomic_check_state(struct intel_atomic_state *state,
> +				       struct intel_dp *intel_dp,
> +				       struct intel_connector *connector);
> +void intel_dp_tunnel_atomic_alloc_bw(struct intel_atomic_state *state,
> +				     struct intel_encoder *encoder,
> +				     const struct intel_crtc_state *new_crtc_state,
> +				     const struct drm_connector_state *new_conn_state);
> +void intel_dp_tunnel_atomic_free_bw(struct intel_atomic_state *state,
> +				    struct intel_encoder *encoder,
> +				    const struct intel_crtc_state *old_crtc_state,
> +				    const struct drm_connector_state *old_conn_state);
> +
> +int intel_dp_tunnel_mgr_init(struct drm_i915_private *i915);
> +void intel_dp_tunnel_mgr_cleanup(struct drm_i915_private *i915);
> +
> +#else
> +
> +static inline int
> +intel_dp_tunnel_detect(struct intel_dp *intel_dp, struct drm_modeset_acquire_ctx *ctx)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline void intel_dp_tunnel_disconnect(struct intel_dp *intel_dp) {}
> +static inline void intel_dp_tunnel_destroy(struct intel_dp *intel_dp) {}
> +static inline void intel_dp_tunnel_resume(struct intel_dp *intel_dp, bool dpcd_updated) {}
> +static inline void intel_dp_tunnel_suspend(struct intel_dp *intel_dp) {}
> +
> +static inline bool intel_dp_tunnel_bw_alloc_is_enabled(struct intel_dp *intel_dp)
> +{
> +	return false;
> +}
> +
> +static inline void
> +intel_dp_tunnel_atomic_cleanup_inherited_state(struct intel_atomic_state *state) {}
> +
> +static inline void
> +intel_dp_tunnel_atomic_compute_stream_bw(struct intel_atomic_state *state,
> +					 struct intel_dp *intel_dp,
> +					 const struct intel_connector *connector,
> +					 struct intel_crtc_state *crtc_state) {}
> +
> +static inline int
> +intel_dp_tunnel_atomic_add_state_for_crtc(struct intel_atomic_state *state,
> +					  struct intel_crtc *crtc)
> +{
> +	return 0;
> +}
> +
> +static inline int
> +intel_dp_tunnel_atomic_check_link(struct intel_atomic_state *state,
> +				  struct intel_link_bw_limits *limits)
> +{
> +	return 0;
> +}
> +
> +static inline int
> +intel_dp_tunnel_atomic_check_state(struct intel_atomic_state *state,
> +				   struct intel_dp *intel_dp,
> +				   struct intel_connector *connector)
> +{
> +	return 0;
> +}
> +
> +static inline void
> +intel_dp_tunnel_atomic_alloc_bw(struct intel_atomic_state *state,
> +				struct intel_encoder *encoder,
> +				const struct intel_crtc_state *new_crtc_state,
> +				const struct drm_connector_state *new_conn_state) {}
> +static inline void
> +intel_dp_tunnel_atomic_free_bw(struct intel_atomic_state *state,
> +			       struct intel_encoder *encoder,
> +			       const struct intel_crtc_state *old_crtc_state,
> +			       const struct drm_connector_state *old_conn_state) {}
> +
> +static inline int
> +intel_dp_tunnel_mgr_init(struct drm_i915_private *i915)
> +{
> +	return 0;
> +}
> +
> +static inline void intel_dp_tunnel_mgr_cleanup(struct drm_i915_private *i915) {}
> +
> +#endif /* CONFIG_DRM_I915_DP_TUNNEL */
> +
> +#endif /* __INTEL_DP_TUNNEL_H__ */
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel
