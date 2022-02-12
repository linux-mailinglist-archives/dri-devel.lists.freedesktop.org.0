Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27434B3A6D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 10:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5410F3B7;
	Sun, 13 Feb 2022 09:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9610E2C7;
 Sat, 12 Feb 2022 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644670317; x=1676206317;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=50dQc5iRLoamDKuzYExF3DU1PtV7IcxnHnP59rMc5AY=;
 b=qsn0ckNfTei4SBnqpe+y6Y6c6VuUe1AlyCiwq0+vDZY5DA0eLe6u4Z+U
 smVCldPQWVWqyOrnasj/DRws3tNGm8Ygn0KYGdsd9NS3tuljEkvg0t/Az
 R3DYVtsIg0PQcoMw648n4sjdZt/RGsJUSEZ0VR0cL2mqrClvR3MCVuT/G o=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 12 Feb 2022 04:51:57 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 12 Feb 2022 04:51:56 -0800
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 12 Feb 2022 18:21:43 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 4F5B6157F; Sat, 12 Feb 2022 18:21:42 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: y@qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [v1 2/2] drm/msm/disp/dpu1: Add PSR support for eDP interface in dpu
 driver
Date: Sat, 12 Feb 2022 18:21:35 +0530
Message-Id: <1644670295-25068-2-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644670295-25068-1-git-send-email-quic_vpolimer@quicinc.com>
References: <y> <1644670295-25068-1-git-send-email-quic_vpolimer@quicinc.com>
X-Mailman-Approved-At: Sun, 13 Feb 2022 09:00:38 +0000
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_vproddut@quicinc.com, dianders@chromium.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable PSR on eDP interface using drm self-refresh librabry.
This patch uses a trigger from self-refresh library to enter/exit
into PSR, when there are no updates from framework.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/bridge/panel.c              | 64 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 30 +++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 71 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 4 files changed, 142 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index b32295a..c440546 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -102,31 +102,71 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 		drm_connector_cleanup(connector);
 }
 
-static void panel_bridge_pre_enable(struct drm_bridge *bridge)
+static void panel_bridge_pre_enable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *cstate;
+	int i;
+
+	if (old_bridge_state->base.state) {
+		for_each_old_crtc_in_state(old_bridge_state->base.state, crtc, cstate, i) {
+			if (cstate->self_refresh_active && cstate->active)
+				return;
+		}
+	}
 	drm_panel_prepare(panel_bridge->panel);
 }
 
-static void panel_bridge_enable(struct drm_bridge *bridge)
+static void panel_bridge_enable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *cstate;
+	int i;
+
+	if (old_bridge_state->base.state) {
+		for_each_old_crtc_in_state(old_bridge_state->base.state, crtc, cstate, i) {
+			if (cstate->self_refresh_active)
+				return;
+		}
+	}
 	drm_panel_enable(panel_bridge->panel);
 }
 
-static void panel_bridge_disable(struct drm_bridge *bridge)
+static void panel_bridge_disable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *cstate;
+	int i;
+
+	if (old_bridge_state->base.state) {
+		for_each_new_crtc_in_state(old_bridge_state->base.state, crtc, cstate, i) {
+			if (cstate->self_refresh_active)
+				return;
+		}
+	}
 	drm_panel_disable(panel_bridge->panel);
 }
 
-static void panel_bridge_post_disable(struct drm_bridge *bridge)
+static void panel_bridge_post_disable(struct drm_bridge *bridge,
+		struct drm_bridge_state *old_bridge_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *cstate;
+	int i;
+
+	if (old_bridge_state->base.state) {
+		for_each_new_crtc_in_state(old_bridge_state->base.state, crtc, cstate, i) {
+			if (cstate->self_refresh_active)
+				return;
+		}
+	}
 	drm_panel_unprepare(panel_bridge->panel);
 }
 
@@ -141,10 +181,10 @@ static int panel_bridge_get_modes(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
-	.pre_enable = panel_bridge_pre_enable,
-	.enable = panel_bridge_enable,
-	.disable = panel_bridge_disable,
-	.post_disable = panel_bridge_post_disable,
+	.atomic_pre_enable = panel_bridge_pre_enable,
+	.atomic_enable = panel_bridge_enable,
+	.atomic_disable = panel_bridge_disable,
+	.atomic_post_disable = panel_bridge_post_disable,
 	.get_modes = panel_bridge_get_modes,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e7c9fe1..90223b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_self_refresh_helper.h>
 
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
@@ -457,7 +458,6 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0,
 			mixer[i].flush_mask);
-
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
 			&stage_cfg);
 	}
@@ -951,6 +951,14 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
 
+	if (old_crtc_state->self_refresh_active) {
+		drm_for_each_encoder_mask(encoder, crtc->dev,
+				 old_crtc_state->encoder_mask) {
+			dpu_encoder_assign_crtc(encoder, NULL);
+		}
+		return;
+	}
+
 	/* Disable/save vblank irq handling */
 	drm_crtc_vblank_off(crtc);
 
@@ -962,7 +970,8 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 		 */
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
 			release_bandwidth = true;
-		dpu_encoder_assign_crtc(encoder, NULL);
+		if (!crtc->state->self_refresh_active)
+			dpu_encoder_assign_crtc(encoder, NULL);
 	}
 
 	/* wait for frame_event_done completion */
@@ -1010,6 +1019,8 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct drm_encoder *encoder;
 	bool request_bandwidth = false;
+	struct drm_crtc_state *old_crtc_state =
+		drm_atomic_get_old_crtc_state(state, crtc);
 
 	pm_runtime_get_sync(crtc->dev->dev);
 
@@ -1032,8 +1043,10 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
 	dpu_crtc->enabled = true;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
-		dpu_encoder_assign_crtc(encoder, crtc);
+	if (!old_crtc_state->self_refresh_active) {
+		drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
+			dpu_encoder_assign_crtc(encoder, crtc);
+	}
 
 	/* Enable/restore vblank irq handling */
 	drm_crtc_vblank_on(crtc);
@@ -1069,7 +1082,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	pstates = kzalloc(sizeof(*pstates) * DPU_STAGE_MAX * 4, GFP_KERNEL);
 
-	if (!crtc_state->enable || !crtc_state->active) {
+	if (!crtc_state->enable || !crtc_state->active || crtc_state->self_refresh_active) {
 		DRM_DEBUG_ATOMIC("crtc%d -> enable %d, active %d, skip atomic_check\n",
 				crtc->base.id, crtc_state->enable,
 				crtc_state->active);
@@ -1497,7 +1510,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 {
 	struct drm_crtc *crtc = NULL;
 	struct dpu_crtc *dpu_crtc = NULL;
-	int i;
+	int i, ret;
 
 	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
 	if (!dpu_crtc)
@@ -1534,6 +1547,11 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	/* initialize event handling */
 	spin_lock_init(&dpu_crtc->event_lock);
 
+	ret = drm_self_refresh_helper_init(crtc);
+	if (ret)
+		DPU_ERROR("Failed to initialize %s with SR helpers %d\n",
+			crtc->name, ret);
+
 	DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc->name);
 	return crtc;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db..461fdd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+static inline bool is_self_refresh_active(struct drm_crtc_state *state)
+{
+	if (state && state->self_refresh_active)
+		return true;
+
+	return false;
+}
+
 static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
@@ -600,6 +608,9 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
+	if (crtc_state->self_refresh_active)
+		return ret;
+
 	/* perform atomic check on the first physical encoder (master) */
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
@@ -1138,15 +1149,19 @@ void dpu_encoder_virt_runtime_resume(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc,
+	struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
+	struct drm_crtc_state *old_crtc_state;
+	struct drm_crtc *crtc;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
+	crtc = dpu_enc->crtc;
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 	priv = drm_enc->dev->dev_private;
@@ -1170,21 +1185,59 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
-	dpu_enc->enabled = true;
+	/* Coming back from self refresh, exit PSR */
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS &&
+			is_self_refresh_active(old_crtc_state))
+		msm_dp_display_set_psr(dpu_enc->dp, false);
 
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS &&
+			!is_self_refresh_active(old_crtc_state)) {
+		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
+		if (ret) {
+			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
+				ret);
+			goto out;
+		}
+	}
+
+	dpu_enc->enabled = true;
 out:
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
+static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc,
+	struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *old_state;
 	int i = 0;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
+	if (!drm_enc) {
+		DPU_ERROR("invalid encoder\n");
+		return;
+	}
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	crtc = dpu_enc->crtc;
+
+	/* Enter PSR if encoder supports */
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS  && is_self_refresh_active(crtc->state))
+		msm_dp_display_set_psr(dpu_enc->dp, true);
+
+	old_state = drm_atomic_get_old_crtc_state(state, crtc);
+
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && is_self_refresh_active(old_state)) {
+		msm_dp_display_set_psr(dpu_enc->dp, false);
+		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
+			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
+		return;
+	}
+
 	mutex_lock(&dpu_enc->enc_lock);
 	dpu_enc->enabled = false;
 
@@ -1194,6 +1247,9 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && !is_self_refresh_active(crtc->state))
+		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
+			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
@@ -1204,7 +1260,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 			phys->ops.disable(phys);
 	}
 
-
 	/* after phys waits for frame-done, should be no more frames pending */
 	if (atomic_xchg(&dpu_enc->frame_done_timeout_ms, 0)) {
 		DPU_ERROR("enc%d timeout pending\n", drm_enc->base.id);
@@ -1219,6 +1274,10 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && !is_self_refresh_active(crtc->state))
+		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
+			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
+
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
@@ -2094,8 +2153,8 @@ static void dpu_encoder_frame_done_timeout(struct timer_list *t)
 
 static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.mode_set = dpu_encoder_virt_mode_set,
-	.disable = dpu_encoder_virt_disable,
-	.enable = dpu_encoder_virt_enable,
+	.atomic_disable = dpu_encoder_virt_disable,
+	.atomic_enable = dpu_encoder_virt_enable,
 	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a..aed8e09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -495,7 +495,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
 		return;
 	}
 
-	if (!crtc->state->active) {
+	if (!crtc->state->active && !crtc->state->self_refresh_active) {
 		DPU_DEBUG("[crtc:%d] not active\n", crtc->base.id);
 		return;
 	}
-- 
2.7.4

