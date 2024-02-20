Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2768D85C825
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840ED10E5A0;
	Tue, 20 Feb 2024 21:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvDS3cSZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2A610E572;
 Tue, 20 Feb 2024 21:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463923; x=1739999923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HbPqlmZ6T2Lp6gbeN6PqN4if5GIBNq65YJ1UnUHMywQ=;
 b=QvDS3cSZwy94TUII3nyi1P3HCmZ8zkiyT8gdyZu3tWZYHjJ/nRXQteeQ
 Jky4NyLB8P/ccJ/PTI/efsdhDBRnuPHBfmZK/ZRrRGU5ItAM6rfF0OOlw
 +CDf8+hGjionntf0ANcjWXB169xtlqxifkYejPXwSd7PAM7Hx7uWptWyb
 u6FywFu5DVOvlQ64O18YvbhXLBa1z+/snz0lrcHaWw+/oh9ebaRYobS66
 ARVUqveVnD7M/zxcqeL2dOZDBmrsBXXsgPtAVflE5V4T6c0LojF2U+4Nv
 SeMcRCs1nNchCNanQcKycfWPqdkhafL07917NQGDXP5W0Ntptn0Vtyd84 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738670"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061626"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:41 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH v2 15/21] drm/i915/dp: Compute DP tunnel BW during encoder
 state computation
Date: Tue, 20 Feb 2024 23:18:35 +0200
Message-Id: <20240220211841.448846-16-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220211841.448846-1-imre.deak@intel.com>
References: <20240220211841.448846-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Compute the BW required through a DP tunnel on links with such tunnels
detected and add the corresponding atomic state during a modeset.

v2:
- Fix error check of intel_dp_tunnel_compute_stream_bw(). (Ville)
- Move intel_dp_tunnel_atomic_cleanup_inherited_state() to this patch.
  (Ville)
- Move intel_dp_tunnel_atomic_clear_stream_bw() to this patch.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com> (v1)
---
 drivers/gpu/drm/i915/display/intel_atomic.c  |  2 ++
 drivers/gpu/drm/i915/display/intel_display.c |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c      | 16 ++++++++++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 13 ++++++++++++-
 4 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 798cb90361a83..2bb270f82932e 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -352,6 +352,8 @@ void intel_atomic_state_clear(struct drm_atomic_state *s)
 	/* state->internal not reset on purpose */
 
 	state->dpll_set = state->modeset = false;
+
+	intel_dp_tunnel_atomic_cleanup_inherited_state(state);
 }
 
 struct intel_crtc_state *
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 16973ebb7865d..20647c97e86fa 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4541,6 +4541,8 @@ intel_crtc_prepare_cleared_state(struct intel_atomic_state *state,
 	/* free the old crtc_state->hw members */
 	intel_crtc_free_hw_state(crtc_state);
 
+	intel_dp_tunnel_atomic_clear_stream_bw(state, crtc_state);
+
 	/* FIXME: before the switch to atomic started, a new pipe_config was
 	 * kzalloc'd. Code that depends on any field being zero should be
 	 * fixed, so that the crtc_state can be safely duplicated. For now,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f4f748d95ad17..5ad7808788745 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2875,6 +2875,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 			struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	const struct drm_display_mode *fixed_mode;
@@ -2975,7 +2976,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
 
-	return 0;
+	return intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
+							pipe_config);
 }
 
 void intel_dp_set_link_params(struct intel_dp *intel_dp,
@@ -6063,6 +6065,15 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 			return ret;
 	}
 
+	if (!intel_connector_needs_modeset(state, conn))
+		return 0;
+
+	ret = intel_dp_tunnel_atomic_check_state(state,
+						 intel_dp,
+						 intel_conn);
+	if (ret)
+		return ret;
+
 	/*
 	 * We don't enable port sync on BDW due to missing w/as and
 	 * due to not having adjusted the modeset sequence appropriately.
@@ -6070,9 +6081,6 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 	if (DISPLAY_VER(dev_priv) < 9)
 		return 0;
 
-	if (!intel_connector_needs_modeset(state, conn))
-		return 0;
-
 	if (conn->has_tile) {
 		ret = intel_modeset_tile_group(state, conn->tile_group->id);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 4b6c8ff974297..db1254b036f18 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -42,6 +42,7 @@
 #include "intel_dp.h"
 #include "intel_dp_hdcp.h"
 #include "intel_dp_mst.h"
+#include "intel_dp_tunnel.h"
 #include "intel_dpio_phy.h"
 #include "intel_hdcp.h"
 #include "intel_hotplug.h"
@@ -523,6 +524,7 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 				       struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
 	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
 	struct intel_dp *intel_dp = &intel_mst->primary->dp;
 	const struct intel_connector *connector =
@@ -619,7 +621,8 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 
-	return 0;
+	return intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
+							pipe_config);
 }
 
 /*
@@ -876,6 +879,14 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
+	if (intel_connector_needs_modeset(state, connector)) {
+		ret = intel_dp_tunnel_atomic_check_state(state,
+							 intel_connector->mst_port,
+							 intel_connector);
+		if (ret)
+			return ret;
+	}
+
 	return drm_dp_atomic_release_time_slots(&state->base,
 						&intel_connector->mst_port->mst_mgr,
 						intel_connector->port);
-- 
2.39.2

