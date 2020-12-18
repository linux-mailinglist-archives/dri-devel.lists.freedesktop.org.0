Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E962DF525
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAC46E157;
	Sun, 20 Dec 2020 11:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4746E087;
 Fri, 18 Dec 2020 10:27:40 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com)
 ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 18 Dec 2020 02:27:40 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA;
 18 Dec 2020 02:27:38 -0800
X-QCInternal: smtphost
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 18 Dec 2020 15:57:10 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 903563F56; Fri, 18 Dec 2020 02:27:09 -0800 (PST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v2] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
 driver
Date: Fri, 18 Dec 2020 02:27:07 -0800
Message-Id: <1608287227-17685-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
Cc: mkrishn@codeaurora.org, dianders@chromium.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, ddavenport@chromium.org,
 hoegsberg@chromium.org, swboyd@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the flag vblank_disable_immediate = true to turn off vblank irqs
immediately as soon as drm_vblank_put is requested so that there are
no irqs triggered during idle state. This will reduce cpu wakeups
and help in power saving.

To enable vblank_disable_immediate flag the underlying KMS driver
needs to support high precision vblank timestamping and also a
reliable way of providing vblank counter which is incrementing
at the leading edge of vblank.

This patch also brings in changes to support vblank_disable_immediate
requirement in dpu driver.

Changes in v1:
 - Specify reason to add vblank timestamp support. (Rob)
 - Add changes to provide vblank counter from dpu driver.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 80 ++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 30 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 11 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  1 +
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 17 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  5 ++
 6 files changed, 144 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4662e8..9a80981 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -65,6 +65,83 @@ static void dpu_crtc_destroy(struct drm_crtc *crtc)
 	kfree(dpu_crtc);
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
+static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	encoder = get_encoder_from_crtc(crtc);
+	if (!encoder) {
+		DRM_ERROR("no encoder found for crtc %d\n", crtc->index);
+		return false;
+	}
+
+	return dpu_encoder_get_frame_count(encoder);
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
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, struct dpu_format *format)
 {
@@ -1243,6 +1320,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.early_unregister = dpu_crtc_early_unregister,
 	.enable_vblank  = msm_crtc_enable_vblank,
 	.disable_vblank = msm_crtc_disable_vblank,
+	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
+	.get_vblank_counter = dpu_crtc_get_vblank_counter,
 };
 
 static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
@@ -1251,6 +1330,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
 /* initialize crtc */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7f5c25..5cd3f31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -425,6 +425,36 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 	return 0;
 }
 
+int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	struct dpu_encoder_phys *phys;
+	int framecount = 0;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	phys = dpu_enc ? dpu_enc->cur_master : NULL;
+
+	if (phys && phys->ops.get_frame_count)
+		framecount = phys->ops.get_frame_count(phys);
+
+	return framecount;
+}
+
+int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	struct dpu_encoder_phys *phys;
+	int linecount = 0;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	phys = dpu_enc ? dpu_enc->cur_master : NULL;
+
+	if (phys && phys->ops.get_line_count)
+		linecount = phys->ops.get_line_count(phys);
+
+	return linecount;
+}
+
 void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
 				  struct dpu_encoder_hw_resources *hw_res)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index b491346..99a5d73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -156,5 +156,16 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc);
  */
 void dpu_encoder_set_idle_timeout(struct drm_encoder *drm_enc,
 							u32 idle_timeout);
+/**
+ * dpu_encoder_get_linecount - get interface line count for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
+
+/**
+ * dpu_encoder_get_frame_count - get interface frame count for the encoder.
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
 
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f8f2515..ecbc4be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -143,6 +143,7 @@ struct dpu_encoder_phys_ops {
 	void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
 	void (*restore)(struct dpu_encoder_phys *phys);
 	int (*get_line_count)(struct dpu_encoder_phys *phys);
+	int (*get_frame_count)(struct dpu_encoder_phys *phys);
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9a69fad..f983595 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -658,6 +658,22 @@ static int dpu_encoder_phys_vid_get_line_count(
 	return phys_enc->hw_intf->ops.get_line_count(phys_enc->hw_intf);
 }
 
+static int dpu_encoder_phys_vid_get_frame_count(
+		struct dpu_encoder_phys *phys_enc)
+{
+	struct intf_status s = {0};
+
+	if (!dpu_encoder_phys_vid_is_master(phys_enc))
+		return -EINVAL;
+
+	if (!phys_enc->hw_intf || !phys_enc->hw_intf->ops.get_status)
+		return -EINVAL;
+
+	phys_enc->hw_intf->ops.get_status(phys_enc->hw_intf, &s);
+
+	return s.frame_count;
+}
+
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
@@ -676,6 +692,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
 	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
 	ops->get_line_count = dpu_encoder_phys_vid_get_line_count;
+	ops->get_frame_count = dpu_encoder_phys_vid_get_frame_count;
 }
 
 struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 374b0e8..764a773 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_file.h>
+#include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
@@ -1020,6 +1021,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	 */
 	dev->mode_config.allow_fb_modifiers = true;
 
+	dev->max_vblank_count = 0;
+	/* Disable vblank irqs aggressively for power-saving */
+	dev->vblank_disable_immediate = true;
+
 	/*
 	 * _dpu_kms_drm_obj_init should create the DRM related objects
 	 * i.e. CRTCs, planes, encoders, connectors and so forth
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
