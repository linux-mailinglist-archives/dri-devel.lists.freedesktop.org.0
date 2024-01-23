Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518FE838BC9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A37F10E7A2;
	Tue, 23 Jan 2024 10:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C9910E76E;
 Tue, 23 Jan 2024 10:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005721; x=1737541721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SiGBezTlCUPjMEVgldPF8t4rrQVF88naNV3YWnQjwhs=;
 b=WVVzo/3fnXUQ2VA4yZfCKKZLiyGJBZ5dW4rsQUCYyLce44IWI0e0qzsQ
 RFFLjWExcUYCONkM59hVG2I4zZm8WV7h65aG6G6joHiJYxZdj/OYDg9zS
 5Syf+4z/JGkH+o7eOf25mkFlt2fRNkh4ytGj7ZiO9fvi1KQoG1lu5Tz+t
 k02xPimfKYtKRKP1LOEH+whc6A76SXHYXuLZnO/KqfsZefB0U+gDumA/j
 aBvVEaOXHUzLOLuAw17GPD445Fm2R3dyH4A87joaX83j1yg/EhZerO+ow
 0N+rirgdQ8Py3O5uIREG+du+jdW5IIoChxwYIkxlPphC4FfTFRES/lLZd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134123"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134123"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283367"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283367"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:40 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 03/19] drm/i915/dp: Add support to notify MST connectors to
 retry modesets
Date: Tue, 23 Jan 2024 12:28:34 +0200
Message-Id: <20240123102850.390126-4-imre.deak@intel.com>
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

On shared (Thunderbolt) links with DP tunnels, the modeset may need to
be retried on all connectors on the link due to a link BW limitation
arising only after the atomic check phase. To support this add a helper
function queuing a work to retry the modeset on a given port's connector
and at the same time any MST connector with streams through the same
port. A follow-up change enabling the DP tunnel Bandwidth Allocation
Mode will take this into use.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c  |  5 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 55 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |  8 +++
 .../drm/i915/display/intel_dp_link_training.c |  3 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  2 +
 5 files changed, 67 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index a92e959c8ac7b..0caebbb3e2dbb 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8060,8 +8060,9 @@ void intel_hpd_poll_fini(struct drm_i915_private *i915)
 	/* Kill all the work that may have been queued by hpd. */
 	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
 	for_each_intel_connector_iter(connector, &conn_iter) {
-		if (connector->modeset_retry_work.func)
-			cancel_work_sync(&connector->modeset_retry_work);
+		if (connector->modeset_retry_work.func &&
+		    cancel_work_sync(&connector->modeset_retry_work))
+			drm_connector_put(&connector->base);
 		if (connector->hdcp.shim) {
 			cancel_delayed_work_sync(&connector->hdcp.check_work);
 			cancel_work_sync(&connector->hdcp.prop_work);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index ab415f41924d7..4e36c2c39888e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2837,6 +2837,50 @@ intel_dp_audio_compute_config(struct intel_encoder *encoder,
 					intel_dp_is_uhbr(pipe_config);
 }
 
+void intel_dp_queue_modeset_retry_work(struct intel_connector *connector)
+{
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+
+	drm_connector_get(&connector->base);
+	if (!queue_work(i915->unordered_wq, &connector->modeset_retry_work))
+		drm_connector_put(&connector->base);
+}
+
+void
+intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
+				      struct intel_encoder *encoder,
+				      const struct intel_crtc_state *crtc_state,
+				      const struct drm_connector_state *conn_state)
+{
+	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
+	struct intel_connector *connector;
+	struct intel_digital_connector_state *iter_conn_state;
+	struct intel_dp *intel_dp;
+	int i;
+
+	if (conn_state) {
+		connector = to_intel_connector(conn_state->connector);
+		intel_dp_queue_modeset_retry_work(connector);
+
+		return;
+	}
+
+	if (drm_WARN_ON(&i915->drm,
+			!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)))
+		return;
+
+	intel_dp = enc_to_intel_dp(encoder);
+
+	for_each_new_intel_connector_in_state(state, connector, iter_conn_state, i) {
+		(void)iter_conn_state;
+
+		if (connector->mst_port != intel_dp)
+			continue;
+
+		intel_dp_queue_modeset_retry_work(connector);
+	}
+}
+
 int
 intel_dp_compute_config(struct intel_encoder *encoder,
 			struct intel_crtc_state *pipe_config,
@@ -6436,6 +6480,14 @@ static void intel_dp_modeset_retry_work_fn(struct work_struct *work)
 	mutex_unlock(&connector->dev->mode_config.mutex);
 	/* Send Hotplug uevent so userspace can reprobe */
 	drm_kms_helper_connector_hotplug_event(connector);
+
+	drm_connector_put(connector);
+}
+
+void intel_dp_init_modeset_retry_work(struct intel_connector *connector)
+{
+	INIT_WORK(&connector->modeset_retry_work,
+		  intel_dp_modeset_retry_work_fn);
 }
 
 bool
@@ -6452,8 +6504,7 @@ intel_dp_init_connector(struct intel_digital_port *dig_port,
 	int type;
 
 	/* Initialize the work for modeset in case of link train failure */
-	INIT_WORK(&intel_connector->modeset_retry_work,
-		  intel_dp_modeset_retry_work_fn);
+	intel_dp_init_modeset_retry_work(intel_connector);
 
 	if (drm_WARN(dev, dig_port->max_lanes < 1,
 		     "Not enough lanes (%d) for DP on [ENCODER:%d:%s]\n",
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 530cc97bc42f4..105c2086310db 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -23,6 +23,8 @@ struct intel_digital_port;
 struct intel_dp;
 struct intel_encoder;
 
+struct work_struct;
+
 struct link_config_limits {
 	int min_rate, max_rate;
 	int min_lane_count, max_lane_count;
@@ -43,6 +45,12 @@ void intel_dp_adjust_compliance_config(struct intel_dp *intel_dp,
 bool intel_dp_limited_color_range(const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state);
 int intel_dp_min_bpp(enum intel_output_format output_format);
+void intel_dp_init_modeset_retry_work(struct intel_connector *connector);
+void intel_dp_queue_modeset_retry_work(struct intel_connector *connector);
+void intel_dp_queue_modeset_retry_for_link(struct intel_atomic_state *state,
+					   struct intel_encoder *encoder,
+					   const struct intel_crtc_state *crtc_state,
+					   const struct drm_connector_state *conn_state);
 bool intel_dp_init_connector(struct intel_digital_port *dig_port,
 			     struct intel_connector *intel_connector);
 void intel_dp_set_link_params(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 1abfafbbfa757..7b140cbf8dd31 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -1075,7 +1075,6 @@ static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 						     const struct intel_crtc_state *crtc_state)
 {
 	struct intel_connector *intel_connector = intel_dp->attached_connector;
-	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
 
 	if (!intel_digital_port_connected(&dp_to_dig_port(intel_dp)->base)) {
 		lt_dbg(intel_dp, DP_PHY_DPRX, "Link Training failed on disconnected sink.\n");
@@ -1093,7 +1092,7 @@ static void intel_dp_schedule_fallback_link_training(struct intel_dp *intel_dp,
 	}
 
 	/* Schedule a Hotplug Uevent to userspace to start modeset */
-	queue_work(i915->unordered_wq, &intel_connector->modeset_retry_work);
+	intel_dp_queue_modeset_retry_work(intel_connector);
 }
 
 /* Perform the link training on all LTTPRs and the DPRX on a link. */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 5fa25a5a36b55..b15e43ebf138b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -1542,6 +1542,8 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	intel_connector->port = port;
 	drm_dp_mst_get_port_malloc(port);
 
+	intel_dp_init_modeset_retry_work(intel_connector);
+
 	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
 	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
 	intel_connector->dp.dsc_hblank_expansion_quirk =
-- 
2.39.2

