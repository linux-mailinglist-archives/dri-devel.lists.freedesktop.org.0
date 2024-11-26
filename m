Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069C9D9B36
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A795E10E936;
	Tue, 26 Nov 2024 16:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ii38/zDA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C668D10E92C;
 Tue, 26 Nov 2024 16:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732637909; x=1764173909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o46MUwIW2/GxCMqt1KQacYLlMCFB738BRSiz6UGnxMQ=;
 b=Ii38/zDAgcri9SLcAmHKzKc2G1hALRdfkcQs0cRJYDdc19iL6xdkyLjo
 oHtim/KaO3cVdIdO2nKK8mmDjBU4z6kBiOf5lG+7rOswheF6la7zMS/or
 Gp3YlGvbwBbzkaJaoKrodlfzND57mj/quptmIyTzAXKggS/ytjOX/+4Z6
 /CytjpRNh/M9jFE/PjfV31e2HD2zJ/yRQLTI+k4/u1G9C/mGgs/xqQaQe
 nuhfbQLiVdcbnYh53kJJLAL0WMYQRFj1AZtTiyldBc6GLLGjrLU95cqeB
 BbyoDtTYuolRBwMCUCVqnHKF0Cp0i+KMdM1EaEZy543OmpIfuYiUCPaDf w==;
X-CSE-ConnectionGUID: M1+Ey6MPRp28mVQTwL5gwQ==
X-CSE-MsgGUID: PNEy/b6+T8apiVuHYFw+aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32181829"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="32181829"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:29 -0800
X-CSE-ConnectionGUID: 0/ozb+XkS0SPQfQLUtHPNw==
X-CSE-MsgGUID: w0Zo0SbaSj2r+n1R9wYFJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="91606412"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 08:18:27 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 4/4] drm/i915/dp_mst: Use intel_connector vs. drm_connector
 pointer in intel_dp_mst.c
Date: Tue, 26 Nov 2024 18:18:59 +0200
Message-ID: <20241126161859.1858058-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241126161859.1858058-1-imre.deak@intel.com>
References: <20241126161859.1858058-1-imre.deak@intel.com>
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

Follow the canonical way in intel_dp_mst.c, referencing a connector only
via a struct intel_connector pointer and naming this pointer 'connector'
instead of 'intel_connector', the only exception being the casting of
a drm_connector function parameter pointer to intel_connector, calling
the drm_connector pointer _connector.

Suggested-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 184 ++++++++++----------
 1 file changed, 90 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index b019c65703578..9bb997d8cd385 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -937,33 +937,32 @@ mst_connector_atomic_topology_check(struct intel_connector *connector,
 }
 
 static int
-mst_connector_atomic_check(struct drm_connector *connector,
+mst_connector_atomic_check(struct drm_connector *_connector,
 			   struct drm_atomic_state *_state)
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
-	struct intel_connector *intel_connector =
-		to_intel_connector(connector);
+	struct intel_connector *connector = to_intel_connector(_connector);
 	int ret;
 
-	ret = intel_digital_connector_atomic_check(connector, &state->base);
+	ret = intel_digital_connector_atomic_check(&connector->base, &state->base);
 	if (ret)
 		return ret;
 
-	ret = mst_connector_atomic_topology_check(intel_connector, state);
+	ret = mst_connector_atomic_topology_check(connector, state);
 	if (ret)
 		return ret;
 
-	if (intel_connector_needs_modeset(state, connector)) {
+	if (intel_connector_needs_modeset(state, &connector->base)) {
 		ret = intel_dp_tunnel_atomic_check_state(state,
-							 intel_connector->mst_port,
-							 intel_connector);
+							 connector->mst_port,
+							 connector);
 		if (ret)
 			return ret;
 	}
 
 	return drm_dp_atomic_release_time_slots(&state->base,
-						&intel_connector->mst_port->mst_mgr,
-						intel_connector->port);
+						&connector->mst_port->mst_mgr,
+						connector->port);
 }
 
 static void mst_stream_disable(struct intel_atomic_state *state,
@@ -1343,23 +1342,23 @@ static bool mst_stream_initial_fastset_check(struct intel_encoder *encoder,
 	return intel_dp_initial_fastset_check(primary_encoder, crtc_state);
 }
 
-static int mst_connector_get_ddc_modes(struct drm_connector *connector)
+static int mst_connector_get_ddc_modes(struct drm_connector *_connector)
 {
-	struct intel_connector *intel_connector = to_intel_connector(connector);
-	struct drm_i915_private *i915 = to_i915(intel_connector->base.dev);
-	struct intel_dp *intel_dp = intel_connector->mst_port;
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct intel_dp *intel_dp = connector->mst_port;
 	const struct drm_edid *drm_edid;
 	int ret;
 
-	if (drm_connector_is_unregistered(connector))
-		return intel_connector_update_modes(connector, NULL);
+	if (drm_connector_is_unregistered(&connector->base))
+		return intel_connector_update_modes(&connector->base, NULL);
 
 	if (!intel_display_driver_check_access(i915))
-		return drm_edid_connector_add_modes(connector);
+		return drm_edid_connector_add_modes(&connector->base);
 
-	drm_edid = drm_dp_mst_edid_read(connector, &intel_dp->mst_mgr, intel_connector->port);
+	drm_edid = drm_dp_mst_edid_read(&connector->base, &intel_dp->mst_mgr, connector->port);
 
-	ret = intel_connector_update_modes(connector, drm_edid);
+	ret = intel_connector_update_modes(&connector->base, drm_edid);
 
 	drm_edid_free(drm_edid);
 
@@ -1367,32 +1366,29 @@ static int mst_connector_get_ddc_modes(struct drm_connector *connector)
 }
 
 static int
-mst_connector_late_register(struct drm_connector *connector)
+mst_connector_late_register(struct drm_connector *_connector)
 {
-	struct intel_connector *intel_connector = to_intel_connector(connector);
+	struct intel_connector *connector = to_intel_connector(_connector);
 	int ret;
 
-	ret = drm_dp_mst_connector_late_register(connector,
-						 intel_connector->port);
+	ret = drm_dp_mst_connector_late_register(&connector->base, connector->port);
 	if (ret < 0)
 		return ret;
 
-	ret = intel_connector_register(connector);
+	ret = intel_connector_register(&connector->base);
 	if (ret < 0)
-		drm_dp_mst_connector_early_unregister(connector,
-						      intel_connector->port);
+		drm_dp_mst_connector_early_unregister(&connector->base, connector->port);
 
 	return ret;
 }
 
 static void
-mst_connector_early_unregister(struct drm_connector *connector)
+mst_connector_early_unregister(struct drm_connector *_connector)
 {
-	struct intel_connector *intel_connector = to_intel_connector(connector);
+	struct intel_connector *connector = to_intel_connector(_connector);
 
-	intel_connector_unregister(connector);
-	drm_dp_mst_connector_early_unregister(connector,
-					      intel_connector->port);
+	intel_connector_unregister(&connector->base);
+	drm_dp_mst_connector_early_unregister(&connector->base, connector->port);
 }
 
 static const struct drm_connector_funcs mst_connector_funcs = {
@@ -1406,23 +1402,25 @@ static const struct drm_connector_funcs mst_connector_funcs = {
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 };
 
-static int mst_connector_get_modes(struct drm_connector *connector)
+static int mst_connector_get_modes(struct drm_connector *_connector)
 {
-	return mst_connector_get_ddc_modes(connector);
+	struct intel_connector *connector = to_intel_connector(_connector);
+
+	return mst_connector_get_ddc_modes(&connector->base);
 }
 
 static int
-mst_connector_mode_valid_ctx(struct drm_connector *connector,
+mst_connector_mode_valid_ctx(struct drm_connector *_connector,
 			     struct drm_display_mode *mode,
 			     struct drm_modeset_acquire_ctx *ctx,
 			     enum drm_mode_status *status)
 {
-	struct intel_display *display = to_intel_display(connector->dev);
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
-	struct intel_connector *intel_connector = to_intel_connector(connector);
-	struct intel_dp *intel_dp = intel_connector->mst_port;
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct intel_display *display = to_intel_display(connector->base.dev);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_dp *intel_dp = connector->mst_port;
 	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
-	struct drm_dp_mst_port *port = intel_connector->port;
+	struct drm_dp_mst_port *port = connector->port;
 	const int min_bpp = 18;
 	int max_dotclk = display->cdclk.max_dotclk_freq;
 	int max_rate, mode_rate, max_lanes, max_link_clock;
@@ -1433,7 +1431,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *connector,
 	int target_clock = mode->clock;
 	int num_joined_pipes;
 
-	if (drm_connector_is_unregistered(connector)) {
+	if (drm_connector_is_unregistered(&connector->base)) {
 		*status = MODE_ERROR;
 		return 0;
 	}
@@ -1471,7 +1469,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *connector,
 	 *   corresponding link capabilities of the sink) in case the
 	 *   stream is uncompressed for it by the last branch device.
 	 */
-	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, intel_connector,
+	num_joined_pipes = intel_dp_num_joined_pipes(intel_dp, connector,
 						     mode->hdisplay, target_clock);
 	max_dotclk *= num_joined_pipes;
 
@@ -1485,14 +1483,14 @@ mst_connector_mode_valid_ctx(struct drm_connector *connector,
 		return 0;
 	}
 
-	if (intel_dp_has_dsc(intel_connector)) {
+	if (intel_dp_has_dsc(connector)) {
 		/*
 		 * TBD pass the connector BPC,
 		 * for now U8_MAX so that max BPC on that platform would be picked
 		 */
-		int pipe_bpp = intel_dp_dsc_compute_max_bpp(intel_connector, U8_MAX);
+		int pipe_bpp = intel_dp_dsc_compute_max_bpp(connector, U8_MAX);
 
-		if (drm_dp_sink_supports_fec(intel_connector->dp.fec_capability)) {
+		if (drm_dp_sink_supports_fec(connector->dp.fec_capability)) {
 			dsc_max_compressed_bpp =
 				intel_dp_dsc_get_max_compressed_bpp(dev_priv,
 								    max_link_clock,
@@ -1503,7 +1501,7 @@ mst_connector_mode_valid_ctx(struct drm_connector *connector,
 								    INTEL_OUTPUT_FORMAT_RGB,
 								    pipe_bpp, 64);
 			dsc_slice_count =
-				intel_dp_dsc_get_slice_count(intel_connector,
+				intel_dp_dsc_get_slice_count(connector,
 							     target_clock,
 							     mode->hdisplay,
 							     num_joined_pipes);
@@ -1527,40 +1525,40 @@ mst_connector_mode_valid_ctx(struct drm_connector *connector,
 }
 
 static struct drm_encoder *
-mst_connector_atomic_best_encoder(struct drm_connector *connector,
+mst_connector_atomic_best_encoder(struct drm_connector *_connector,
 				  struct drm_atomic_state *state)
 {
-	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
-											 connector);
-	struct intel_connector *intel_connector = to_intel_connector(connector);
-	struct intel_dp *intel_dp = intel_connector->mst_port;
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct drm_connector_state *connector_state =
+		drm_atomic_get_new_connector_state(state, &connector->base);
+	struct intel_dp *intel_dp = connector->mst_port;
 	struct intel_crtc *crtc = to_intel_crtc(connector_state->crtc);
 
 	return &intel_dp->mst_encoders[crtc->pipe]->base.base;
 }
 
 static int
-mst_connector_detect_ctx(struct drm_connector *connector,
+mst_connector_detect_ctx(struct drm_connector *_connector,
 			 struct drm_modeset_acquire_ctx *ctx, bool force)
 {
-	struct intel_display *display = to_intel_display(connector->dev);
-	struct drm_i915_private *i915 = to_i915(connector->dev);
-	struct intel_connector *intel_connector = to_intel_connector(connector);
-	struct intel_dp *intel_dp = intel_connector->mst_port;
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct intel_display *display = to_intel_display(connector->base.dev);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct intel_dp *intel_dp = connector->mst_port;
 
 	if (!intel_display_device_enabled(display))
 		return connector_status_disconnected;
 
-	if (drm_connector_is_unregistered(connector))
+	if (drm_connector_is_unregistered(&connector->base))
 		return connector_status_disconnected;
 
 	if (!intel_display_driver_check_access(i915))
-		return connector->status;
+		return connector->base.status;
 
-	intel_dp_flush_connector_commits(intel_connector);
+	intel_dp_flush_connector_commits(connector);
 
-	return drm_dp_mst_detect_port(connector, ctx, &intel_dp->mst_mgr,
-				      intel_connector->port);
+	return drm_dp_mst_detect_port(&connector->base, ctx, &intel_dp->mst_mgr,
+				      connector->port);
 }
 
 static const struct drm_connector_helper_funcs mst_connector_helper_funcs = {
@@ -1596,29 +1594,30 @@ static bool mst_connector_get_hw_state(struct intel_connector *connector)
 }
 
 static int mst_topology_add_connector_properties(struct intel_dp *intel_dp,
-						 struct drm_connector *connector,
+						 struct drm_connector *_connector,
 						 const char *pathprop)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
+	struct intel_connector *connector = to_intel_connector(_connector);
 
-	drm_object_attach_property(&connector->base,
+	drm_object_attach_property(&connector->base.base,
 				   display->drm->mode_config.path_property, 0);
-	drm_object_attach_property(&connector->base,
+	drm_object_attach_property(&connector->base.base,
 				   display->drm->mode_config.tile_property, 0);
 
-	intel_attach_force_audio_property(connector);
-	intel_attach_broadcast_rgb_property(connector);
+	intel_attach_force_audio_property(&connector->base);
+	intel_attach_broadcast_rgb_property(&connector->base);
 
 	/*
 	 * Reuse the prop from the SST connector because we're
 	 * not allowed to create new props after device registration.
 	 */
-	connector->max_bpc_property =
+	connector->base.max_bpc_property =
 		intel_dp->attached_connector->base.max_bpc_property;
-	if (connector->max_bpc_property)
-		drm_connector_attach_max_bpc_property(connector, 6, 12);
+	if (connector->base.max_bpc_property)
+		drm_connector_attach_max_bpc_property(&connector->base, 6, 12);
 
-	return drm_connector_set_path_property(connector, pathprop);
+	return drm_connector_set_path_property(&connector->base, pathprop);
 }
 
 static void
@@ -1691,64 +1690,61 @@ mst_topology_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	struct intel_dp *intel_dp = container_of(mgr, struct intel_dp, mst_mgr);
 	struct intel_display *display = to_intel_display(intel_dp);
 	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
-	struct intel_connector *intel_connector;
-	struct drm_connector *connector;
+	struct intel_connector *connector;
 	enum pipe pipe;
 	int ret;
 
-	intel_connector = intel_connector_alloc();
-	if (!intel_connector)
+	connector = intel_connector_alloc();
+	if (!connector)
 		return NULL;
 
-	connector = &intel_connector->base;
-
-	intel_connector->get_hw_state = mst_connector_get_hw_state;
-	intel_connector->sync_state = intel_dp_connector_sync_state;
-	intel_connector->mst_port = intel_dp;
-	intel_connector->port = port;
+	connector->get_hw_state = mst_connector_get_hw_state;
+	connector->sync_state = intel_dp_connector_sync_state;
+	connector->mst_port = intel_dp;
+	connector->port = port;
 	drm_dp_mst_get_port_malloc(port);
 
-	intel_dp_init_modeset_retry_work(intel_connector);
+	intel_dp_init_modeset_retry_work(connector);
 
-	ret = drm_connector_init_core(display->drm, connector, &mst_connector_funcs,
+	ret = drm_connector_init_core(display->drm, &connector->base, &mst_connector_funcs,
 				      DRM_MODE_CONNECTOR_DisplayPort, NULL);
 	if (ret)
 		goto err_put_port;
 
-	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
-	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
-	intel_connector->dp.dsc_hblank_expansion_quirk =
-		detect_dsc_hblank_expansion_quirk(intel_connector);
+	connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
+	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, connector);
+	connector->dp.dsc_hblank_expansion_quirk =
+		detect_dsc_hblank_expansion_quirk(connector);
 
-	drm_connector_helper_add(connector, &mst_connector_helper_funcs);
+	drm_connector_helper_add(&connector->base, &mst_connector_helper_funcs);
 
 	for_each_pipe(display, pipe) {
 		struct drm_encoder *enc =
 			&intel_dp->mst_encoders[pipe]->base.base;
 
-		ret = drm_connector_attach_encoder(&intel_connector->base, enc);
+		ret = drm_connector_attach_encoder(&connector->base, enc);
 		if (ret)
 			goto err_cleanup_connector;
 	}
 
-	ret = mst_topology_add_connector_properties(intel_dp, connector, pathprop);
+	ret = mst_topology_add_connector_properties(intel_dp, &connector->base, pathprop);
 	if (ret)
 		goto err_cleanup_connector;
 
-	ret = intel_dp_hdcp_init(dig_port, intel_connector);
+	ret = intel_dp_hdcp_init(dig_port, connector);
 	if (ret)
 		drm_dbg_kms(display->drm, "[%s:%d] HDCP MST init failed, skipping.\n",
-			    connector->name, connector->base.id);
+			    connector->base.name, connector->base.base.id);
 
-	drm_connector_add(connector);
+	drm_connector_add(&connector->base);
 
-	return connector;
+	return &connector->base;
 
 err_cleanup_connector:
-	drm_connector_cleanup(connector);
+	drm_connector_cleanup(&connector->base);
 err_put_port:
 	drm_dp_mst_put_port_malloc(port);
-	intel_connector_free(intel_connector);
+	intel_connector_free(connector);
 
 	return NULL;
 }
-- 
2.44.2

