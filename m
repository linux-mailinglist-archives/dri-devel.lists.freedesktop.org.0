Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F6838BF3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EF210F1A0;
	Tue, 23 Jan 2024 10:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32F210F17B;
 Tue, 23 Jan 2024 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005736; x=1737541736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UhDECuvbrf8EjdLUYCZ42sEfMsO290cn3+KNjYPw+wI=;
 b=MBw/KDs2Q/bGbTqa7v+bDo7cR4UieZizs1Wf6cHaFO7z9E7qQyb1pvav
 UjaiDrhXc/P8eMA/5UcAblyg1R3YyREZ4Er5/tTIlzjLUEiB20Uy7kJ6X
 9V9ormSlb5zKt1vj0dlz1N3MKxj5EE4o1yHHWk6GYHnbbTpyAB1guedZz
 1kCPAvmcXJDGuhAtu1QL9uv2ifABhR9Yos+atF5qvLle7v1mZe+ute6ue
 jG2AKYHguSK1dN6BRA3//VV8XwbD84lhVgvtl9feu2NyZRBoGDJVtqEwM
 wvZ/HNuWtQyFc8h3d3Sdahu9kAxyujx+zcrnuZao5s1a3dDjY/yWphSv4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134245"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134245"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283429"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283429"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:54 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/19] drm/i915/dp: Compute DP tunel BW during encoder state
 computation
Date: Tue, 23 Jan 2024 12:28:45 +0200
Message-Id: <20240123102850.390126-15-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123102850.390126-1-imre.deak@intel.com>
References: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compute the BW required through a DP tunnel on links with such tunnels
detected and add the corresponding atomic state during a modeset.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c     | 16 +++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 13 +++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 78dfe8be6031d..6968fdb7ffcdf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2880,6 +2880,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 			struct drm_connector_state *conn_state)
 {
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
+	struct intel_atomic_state *state = to_intel_atomic_state(conn_state->state);
 	struct drm_display_mode *adjusted_mode = &pipe_config->hw.adjusted_mode;
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	const struct drm_display_mode *fixed_mode;
@@ -2980,6 +2981,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
 
+	intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
+						 pipe_config);
+
 	return 0;
 }
 
@@ -6087,6 +6091,15 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
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
@@ -6094,9 +6107,6 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 	if (DISPLAY_VER(dev_priv) < 9)
 		return 0;
 
-	if (!intel_connector_needs_modeset(state, conn))
-		return 0;
-
 	if (conn->has_tile) {
 		ret = intel_modeset_tile_group(state, conn->tile_group->id);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 520393dc8b453..cbfab3173b9ef 100644
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
@@ -619,6 +621,9 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
 
 	intel_psr_compute_config(intel_dp, pipe_config, conn_state);
 
+	intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
+						 pipe_config);
+
 	return 0;
 }
 
@@ -876,6 +881,14 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
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

