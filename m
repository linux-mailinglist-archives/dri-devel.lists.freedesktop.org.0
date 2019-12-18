Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5868124B9D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 16:25:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE386E7D2;
	Wed, 18 Dec 2019 15:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5386E56D;
 Wed, 18 Dec 2019 15:25:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 07:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="205873263"
Received: from unknown (HELO amanna.iind.intel.com) ([10.223.74.53])
 by orsmga007.jf.intel.com with ESMTP; 18 Dec 2019 07:25:17 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/i915/dp: [FIXME] Program vswing, pre-emphasis,
 test-pattern
Date: Wed, 18 Dec 2019 20:43:50 +0530
Message-Id: <20191218151350.19579-10-animesh.manna@intel.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218151350.19579-1-animesh.manna@intel.com>
References: <20191218151350.19579-1-animesh.manna@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, nidhi1.gupta@intel.com,
 Animesh Manna <animesh.manna@intel.com>, manasi.d.navare@intel.com,
 uma.shankar@intel.com, anshuman.gupta@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch process phy compliance request by programming requested
vswing, pre-emphasis and test pattern.

Note: FIXME tag added as design discusion is ongoing in previous patch
series. Some temporary fix added and the patch is under-development, not for
review.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 24 ++++++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 74 ++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.h      |  2 +
 drivers/gpu/drm/i915/i915_drv.h              |  2 +
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index e18ee1f17d6e..2d58ed249452 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -14084,6 +14084,9 @@ static int intel_atomic_check(struct drm_device *dev,
 	int ret, i;
 	bool any_ms = false;
 
+	if (dev_priv->dp_phy_comp)
+		return 0;
+
 	/* Catch I915_MODE_FLAG_INHERITED */
 	for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
 					    new_crtc_state, i) {
@@ -14692,10 +14695,23 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
 	struct intel_crtc *crtc;
+	const struct drm_connector_state *conn_state;
+	struct drm_connector *conn;
 	u64 put_domains[I915_MAX_PIPES] = {};
 	intel_wakeref_t wakeref = 0;
 	int i;
 
+	if(dev_priv->dp_phy_comp) {
+		for_each_new_connector_in_state(&state->base, conn, conn_state, i) {
+			struct intel_encoder *encoder =
+				to_intel_encoder(conn_state->best_encoder);
+			struct intel_dp *intel_dp = enc_to_intel_dp(&encoder->base);
+
+			intel_dp_process_phy_request(intel_dp);
+		}
+		goto dp_phy_comp1;
+	}
+
 	intel_atomic_commit_fence_wait(state);
 
 	drm_atomic_helper_wait_for_dependencies(&state->base);
@@ -14830,6 +14846,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	if (state->modeset && intel_can_enable_sagv(state))
 		intel_enable_sagv(dev_priv);
 
+dp_phy_comp1:
 	drm_atomic_helper_commit_hw_done(&state->base);
 
 	if (state->modeset) {
@@ -14921,6 +14938,7 @@ static int intel_atomic_commit(struct drm_device *dev,
 	state->wakeref = intel_runtime_pm_get(&dev_priv->runtime_pm);
 
 	drm_atomic_state_get(&state->base);
+	if (!dev_priv->dp_phy_comp) {
 	i915_sw_fence_init(&state->commit_ready,
 			   intel_atomic_commit_ready);
 
@@ -14959,11 +14977,13 @@ static int intel_atomic_commit(struct drm_device *dev,
 		intel_runtime_pm_put(&dev_priv->runtime_pm, state->wakeref);
 		return ret;
 	}
+	}
 
 	ret = drm_atomic_helper_setup_commit(&state->base, nonblock);
 	if (!ret)
 		ret = drm_atomic_helper_swap_state(&state->base, true);
 
+	if (!dev_priv->dp_phy_comp) {
 	if (ret) {
 		i915_sw_fence_commit(&state->commit_ready);
 
@@ -14974,6 +14994,7 @@ static int intel_atomic_commit(struct drm_device *dev,
 	dev_priv->wm.distrust_bios_wm = false;
 	intel_shared_dpll_swap_state(state);
 	intel_atomic_track_fbs(state);
+	}
 
 	if (state->global_state_changed) {
 		assert_global_state_locked(dev_priv);
@@ -14990,8 +15011,9 @@ static int intel_atomic_commit(struct drm_device *dev,
 
 	drm_atomic_state_get(&state->base);
 	INIT_WORK(&state->base.commit_work, intel_atomic_commit_work);
-
+	if (!dev_priv->dp_phy_comp) {
 	i915_sw_fence_commit(&state->commit_ready);
+	}
 	if (nonblock && state->modeset) {
 		queue_work(dev_priv->modeset_wq, &state->base.commit_work);
 	} else if (nonblock) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index f38929db1f2e..4b4fa9074d18 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5058,9 +5058,82 @@ static inline void intel_dp_phy_pattern_update(struct intel_dp *intel_dp)
 	}
 }
 
+static void
+intel_dp_autotest_phy_ddi_disable(struct intel_dp *intel_dp)
+{
+	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
+	struct drm_device *dev = intel_dig_port->base.base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	enum port port = intel_dig_port->base.port;
+	u32 ddi_buf_ctl_value, dp_tp_ctl_value, trans_ddi_func_ctl_value;
+
+	ddi_buf_ctl_value = I915_READ(DDI_BUF_CTL(port));
+	dp_tp_ctl_value = I915_READ(TGL_DP_TP_CTL(port));
+	trans_ddi_func_ctl_value = I915_READ(TRANS_DDI_FUNC_CTL(port));
+
+	ddi_buf_ctl_value        &= ~(DDI_BUF_CTL_ENABLE | DDI_PORT_WIDTH_MASK);
+	dp_tp_ctl_value          &= ~DP_TP_CTL_ENABLE;
+	trans_ddi_func_ctl_value &= ~(TRANS_DDI_FUNC_ENABLE |
+				      DDI_PORT_WIDTH_MASK);
+
+	I915_WRITE(DDI_BUF_CTL(port), ddi_buf_ctl_value);
+	I915_WRITE(TGL_DP_TP_CTL(port), dp_tp_ctl_value);
+	I915_WRITE(TRANS_DDI_FUNC_CTL(port), trans_ddi_func_ctl_value);
+}
+
+static void
+intel_dp_autotest_phy_ddi_enable(struct intel_dp *intel_dp, uint8_t lane_cnt)
+{
+	struct intel_digital_port *intel_dig_port = dp_to_dig_port(intel_dp);
+	struct drm_device *dev = intel_dig_port->base.base.dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	enum port port = intel_dig_port->base.port;
+	u32 ddi_buf_ctl_value, dp_tp_ctl_value, trans_ddi_func_ctl_value;
+
+	ddi_buf_ctl_value = I915_READ(DDI_BUF_CTL(port));
+	dp_tp_ctl_value = I915_READ(TGL_DP_TP_CTL(port));
+	trans_ddi_func_ctl_value = I915_READ(TRANS_DDI_FUNC_CTL(port));
+
+	ddi_buf_ctl_value |= DDI_BUF_CTL_ENABLE | DDI_PORT_WIDTH(lane_cnt);
+	dp_tp_ctl_value |= DP_TP_CTL_ENABLE;
+	trans_ddi_func_ctl_value |= TRANS_DDI_FUNC_ENABLE |
+				    DDI_PORT_WIDTH(lane_cnt);
+
+	I915_WRITE(TRANS_DDI_FUNC_CTL(port), trans_ddi_func_ctl_value);
+	I915_WRITE(TGL_DP_TP_CTL(port), dp_tp_ctl_value);
+	I915_WRITE(DDI_BUF_CTL(port), ddi_buf_ctl_value);
+}
+
+void intel_dp_process_phy_request(struct intel_dp *intel_dp)
+{
+	struct drm_dp_phy_test_params *data =
+		&intel_dp->compliance.test_data.phytest;
+	u8 link_status[DP_LINK_STATUS_SIZE];
+
+	if (!intel_dp_get_link_status(intel_dp, link_status)) {
+		DRM_DEBUG_KMS("failed to get link status\n");
+		return;
+	}
+
+	/* retrieve vswing & pre-emphasis setting */
+	intel_get_adjust_train(intel_dp, link_status);
+
+	intel_dp_autotest_phy_ddi_disable(intel_dp);
+
+	intel_dp_set_signal_levels(intel_dp);
+
+	intel_dp_phy_pattern_update(intel_dp);
+
+	intel_dp_autotest_phy_ddi_enable(intel_dp, data->num_lanes);
+
+	drm_dp_set_phy_test_pattern(&intel_dp->aux, data,
+				    link_status[DP_DPCD_REV]);
+}
+
 static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 {
 	u8 test_result = DP_TEST_NAK;
+	struct drm_i915_private *dev_priv = dp_to_i915(intel_dp);
 
 	test_result = intel_dp_prepare_phytest(intel_dp);
 	if (test_result != DP_TEST_ACK)
@@ -5068,6 +5141,7 @@ static u8 intel_dp_autotest_phy_pattern(struct intel_dp *intel_dp)
 
 	/* Set test active flag here so userspace doesn't interrupt things */
 	intel_dp->compliance.test_active = 1;
+	dev_priv->dp_phy_comp = true;
 
 	return test_result;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 0d0cb692f701..b1274ecffc7f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -120,6 +120,8 @@ void intel_dp_hdr_metadata_enable(struct intel_dp *intel_dp,
 				  const struct intel_crtc_state *crtc_state,
 				  const struct drm_connector_state *conn_state);
 bool intel_digital_port_connected(struct intel_encoder *encoder);
+void intel_dp_process_phy_request(struct intel_dp *intel_dp);
+
 
 static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 {
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 0781b6326b8c..e14cae4039a1 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1286,6 +1286,8 @@ struct drm_i915_private {
 
 	I915_SELFTEST_DECLARE(struct i915_selftest_stash selftest;)
 
+	bool dp_phy_comp;
+
 	/*
 	 * NOTE: This is the dri1/ums dungeon, don't add stuff here. Your patch
 	 * will be rejected. Instead look for a better place.
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
