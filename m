Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DB234AEA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 20:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6AC6EB2D;
	Fri, 31 Jul 2020 18:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2B16EB2D;
 Fri, 31 Jul 2020 18:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 47790299373
From: Robert Beckett <bob.beckett@collabora.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm: Add vblank timestamp support for dpu1
Date: Fri, 31 Jul 2020 19:25:49 +0100
Message-Id: <20200731182639.10949-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Robert Beckett <bob.beckett@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add vblank timestamp support via drm helpers

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 71 ++++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  5 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 10 ++-
 drivers/gpu/drm/msm/msm_drv.c               |  1 +
 5 files changed, 92 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..b62552cad135 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -297,8 +297,8 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
 		dpu_crtc->vblank_cb_time = ktime_get();
 	else
 		dpu_crtc->vblank_cb_count++;
-	_dpu_crtc_complete_flip(crtc);
 	drm_crtc_handle_vblank(crtc);
+	_dpu_crtc_complete_flip(crtc);
 	trace_dpu_crtc_vblank_cb(DRMID(crtc));
 }
 
@@ -1320,6 +1320,73 @@ static void dpu_crtc_early_unregister(struct drm_crtc *crtc)
 	debugfs_remove_recursive(dpu_crtc->debugfs_root);
 }
 
+static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder(encoder, dev)
+		if (encoder->crtc == crtc)
+			return encoder;
+
+	return NULL;
+}
+
+static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
+					   bool in_vblank_irq,
+					   int *vpos, int *hpos,
+					   ktime_t *stime, ktime_t *etime,
+					   const struct drm_display_mode *mode)
+{
+	unsigned int pipe = crtc->index;
+	struct drm_encoder *encoder;
+	int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
+
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder) {
+		DRM_ERROR("no encoder found for crtc %d\n", pipe);
+		return false;
+	}
+
+	vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
+	vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
+
+	/*
+	 * the line counter is 1 at the start of the VSYNC pulse and VTOTAL at
+	 * the end of VFP. Translate the porch values relative to the line
+	 * counter positions.
+	 */
+
+	vactive_start = vsw + vbp + 1;
+
+	vactive_end = vactive_start + mode->crtc_vdisplay;
+
+	/* last scan line before VSYNC */
+	vfp_end = mode->crtc_vtotal;
+
+	if (stime)
+		*stime = ktime_get();
+
+	line = dpu_encoder_get_linecount(encoder);
+
+	if (line < vactive_start)
+		line -= vactive_start;
+	else if (line > vactive_end)
+		line = line - vfp_end - vactive_start;
+	else
+		line -= vactive_start;
+
+	*vpos = line;
+	*hpos = 0;
+
+	if (etime)
+		*etime = ktime_get();
+
+	return true;
+}
+
+
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
 	.destroy = dpu_crtc_destroy,
@@ -1331,6 +1398,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.early_unregister = dpu_crtc_early_unregister,
 	.enable_vblank  = msm_crtc_enable_vblank,
 	.disable_vblank = msm_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
 };
 
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
@@ -1339,6 +1407,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
 /* initialize crtc */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a97f6d2e5a08..1d7d676355ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1659,6 +1659,13 @@ static u32 _dpu_encoder_calculate_linetime(struct dpu_encoder_virt *dpu_enc,
 	return line_time;
 }
 
+int dpu_encoder_get_linecount(struct drm_encoder *encoder)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(encoder);
+
+	return dpu_enc->cur_master->ops.get_line_count(dpu_enc->cur_master);
+}
+
 int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time)
 {
 	struct drm_display_mode *mode;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index b4913465e602..f492ef0a2b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -85,6 +85,11 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *encoder);
  */
 void dpu_encoder_kickoff(struct drm_encoder *encoder);
 
+/**
+ * dpu_encoder_get_linecount - get the current scanline count for this encoder
+ */
+int dpu_encoder_get_linecount(struct drm_encoder *encoder);
+
 /**
  * dpu_encoder_wakeup_time - get the time of the next vsync
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c0a4d4e16d82..db8a461a1786 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
@@ -337,6 +338,11 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
 	if (!kms)
 		return;
 
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		if (crtc_state->mode.crtc_clock)
+			drm_crtc_vblank_get(crtc);
+	}
+
 	/* Call prepare_commit for all affected encoders */
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
 		drm_for_each_encoder_mask(encoder, crtc->dev,
@@ -389,8 +395,10 @@ static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 	DPU_ATRACE_BEGIN("kms_complete_commit");
 
-	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask)
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
 		dpu_crtc_complete_commit(crtc);
+		drm_crtc_vblank_put(crtc);
+	}
 
 	DPU_ATRACE_END("kms_complete_commit");
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 36d98d4116ca..01734191cd31 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -687,6 +687,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
+	drm_calc_timestamping_constants(crtc, &crtc->state->adjusted_mode);
 	DBG("dev=%p, crtc=%u", dev, pipe);
 	return vblank_ctrl_queue_work(priv, pipe, true);
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
