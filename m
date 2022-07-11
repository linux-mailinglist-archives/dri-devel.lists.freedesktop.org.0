Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEA0570388
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3598E53F;
	Mon, 11 Jul 2022 12:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699A98E535;
 Mon, 11 Jul 2022 12:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657544254; x=1689080254;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Ag4KJcMdjJYGFz4PndGZ7BSSeB/P26WcU/vYUyjwibI=;
 b=AXnXkzqcJGOlfJd7cLtHVLahjJKZm67HiUZOT9IL6QsEQNbcAbRN41iL
 EP5/phPiWOLlD49zLmJxbsPeWi+0onfG9F/+sPIhinTUWPnrNno8tzX26
 jsyMAIlH+XGaaloFMazRK9gT58NZ4jXORcR1qa4nz39TRjzyvajH5M0Ra o=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Jul 2022 05:57:34 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Jul 2022 05:57:33 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2022 18:27:08 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id C45583E36; Mon, 11 Jul 2022 18:27:06 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v6 01/10] drm/msm/disp/dpu: clear dpu_assign_crtc and get crtc
 from connector state instead of dpu_enc
Date: Mon, 11 Jul 2022 18:26:55 +0530
Message-Id: <1657544224-10680-2-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update crtc retrieval from dpu_enc to dpu_enc connector state,
since new links get set as part of the dpu enc virt mode set.
The dpu_enc->crtc cache is no more needed, hence cleaning it as
part of this change.

Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 30 ++++++++++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  8 --------
 3 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b56f777..f91e3d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -972,7 +972,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 		 */
 		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_VIDEO)
 			release_bandwidth = true;
-		dpu_encoder_assign_crtc(encoder, NULL);
 	}
 
 	/* wait for frame_event_done completion */
@@ -1042,9 +1041,6 @@ static void dpu_crtc_enable(struct drm_crtc *crtc,
 	trace_dpu_crtc_enable(DRMID(crtc), true, dpu_crtc);
 	dpu_crtc->enabled = true;
 
-	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
-		dpu_encoder_assign_crtc(encoder, crtc);
-
 	/* Enable/restore vblank irq handling */
 	drm_crtc_vblank_on(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb..0fddc9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -181,7 +181,6 @@ struct dpu_encoder_virt {
 
 	bool intfs_swapped;
 
-	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
 	struct dentry *debugfs_root;
@@ -1245,6 +1244,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
+	struct drm_crtc *crtc;
 	unsigned long lock_flags;
 
 	if (!drm_enc || !phy_enc)
@@ -1253,9 +1253,14 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_BEGIN("encoder_vblank_callback");
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
+	if (!dpu_enc->connector || !dpu_enc->connector->state)
+		return;
+
+	crtc = dpu_enc->connector->state->crtc;
+
 	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	if (dpu_enc->crtc)
-		dpu_crtc_vblank_callback(dpu_enc->crtc);
+	if (crtc)
+		dpu_crtc_vblank_callback(crtc);
 	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 
 	atomic_inc(&phy_enc->vsync_cnt);
@@ -1280,29 +1285,22 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_END("encoder_underrun_callback");
 }
 
-void dpu_encoder_assign_crtc(struct drm_encoder *drm_enc, struct drm_crtc *crtc)
-{
-	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	unsigned long lock_flags;
-
-	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	/* crtc should always be cleared before re-assigning */
-	WARN_ON(crtc && dpu_enc->crtc);
-	dpu_enc->crtc = crtc;
-	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
-}
-
 void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 					struct drm_crtc *crtc, bool enable)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct drm_crtc *new_crtc;
 	unsigned long lock_flags;
 	int i;
 
 	trace_dpu_enc_vblank_cb(DRMID(drm_enc), enable);
 
+	if (!dpu_enc->connector || !dpu_enc->connector->state)
+		return;
+
+	new_crtc = dpu_enc->connector->state->crtc;
 	spin_lock_irqsave(&dpu_enc->enc_spinlock, lock_flags);
-	if (dpu_enc->crtc != crtc) {
+	if (!new_crtc || new_crtc != crtc) {
 		spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 781d41c..edba815 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -39,14 +39,6 @@ struct msm_display_info {
 };
 
 /**
- * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
- * @encoder:	encoder pointer
- * @crtc:	crtc pointer
- */
-void dpu_encoder_assign_crtc(struct drm_encoder *encoder,
-			     struct drm_crtc *crtc);
-
-/**
  * dpu_encoder_toggle_vblank_for_crtc - Toggles vblank interrupts on or off if
  *	the encoder is assigned to the given crtc
  * @encoder:	encoder pointer
-- 
2.7.4

