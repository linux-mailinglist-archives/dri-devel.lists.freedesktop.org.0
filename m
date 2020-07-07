Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C33217596
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 19:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAF46E0EB;
	Tue,  7 Jul 2020 17:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE456E0EB;
 Tue,  7 Jul 2020 17:50:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 6CA042A39FD
From: Robert Beckett <bob.beckett@collabora.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [RFC PATCH] drm/msm: Add vblank timestamp support for dpu1
Date: Tue,  7 Jul 2020 18:48:51 +0100
Message-Id: <20200707174922.7020-1-bob.beckett@collabora.com>
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

[RFC] some questions about modern vblank timestamp handling in context
of this patch:

1. When a driver is using output polling with no console defined and fb helpers
trigger an atomic mode set during initial output detection, existing
vblank->hwmode.crtc_clock is not set (no current mode).

While enabling vblank during the atomic commit we hit a warning in
drm_crtc_vblank_helper_get_vblank_timestamp_internal, which has a comment
indicating that it is expected to happen during initial modesetting of a crtc.

Given this, why is there a WARN_ON_ONCE? If it is expected, warnings just
pollute the log and cause alarm.
If it is there to warn on any future crtc_clock == 0, the the once version of
warn means it wont actually warn as it is disabled during the initial modeset.

2. It looks like drm_calc_timestamping_constants should be called by drivers to
set vblank->hwmode. The comment block for
drm_crtc_vblank_helper_get_vblank_timestamp_internal suggests that
drm_atomic_helper_update_legacy_modeset_state already calls it, yet the comment
block before drm_atomic_helper_update_legacy_modeset_state suggests that it
should only be used for drivers transitioning from legacy.

Where is the ideal place for new implementations to call it? I followed the
example of vkms which does it during vblank_enable handler.

3. When calling drm_calc_timestamping_constants, I used
crtc->state->adjusted_mode, which seemed like the most appropriate mode for that
point in the call chain. Is this the correct thing to use?

4. Is it safe to assume that crtc->mutex will already be held in call calls of
vblank_enable in an atomic driver?

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 69 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  7 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  5 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 10 ++-
 drivers/gpu/drm/msm/msm_drv.c               |  1 +
 5 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e15b42a780e0..7f2d9df699e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
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
index 0946a86b37b2..c0d95e63dff1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1653,6 +1653,13 @@ static u32 _dpu_encoder_calculate_linetime(struct dpu_encoder_virt *dpu_enc,
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
index 680527e28d09..96200de57291 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
@@ -350,6 +351,11 @@ static void dpu_kms_prepare_commit(struct msm_kms *kms,
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
@@ -402,8 +408,10 @@ static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 
 	DPU_ATRACE_BEGIN("kms_complete_commit");
 
-	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask)
+	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask) {
 		dpu_crtc_complete_commit(crtc);
+		drm_crtc_vblank_put(crtc);
+	}
 
 	DPU_ATRACE_END("kms_complete_commit");
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f6ce40bf3699..e9016b2bfd57 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -679,6 +679,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
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
