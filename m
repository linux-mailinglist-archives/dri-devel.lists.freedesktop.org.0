Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDC507E70
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 03:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AC210F033;
	Wed, 20 Apr 2022 01:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03A210EF57;
 Wed, 20 Apr 2022 01:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650419212; x=1681955212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=PriL7RU+Oje5SnABCywYcSoVrDw/FTbMNMroQGDqzjY=;
 b=c/dGN69sEMeyJCmVoBWX2jNYNUydxhZohT59vctiLAkkJleTpD5guGFB
 GJlsOQhkPmETmiTjkrgCp/MpCS7z1dv0uAxKH5bGvGbR1n0Mj4aCnfejA
 kGhZfFGWAGBju1suHUSjjabT6gvP4qjZtAg4Kjmse3kNDGpfPUhHRspKO U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 19 Apr 2022 18:46:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:46:43 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:39 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 19 Apr 2022 18:46:38 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 10/17] drm/msm/dpu: make changes to dpu_encoder to support
 virtual encoder
Date: Tue, 19 Apr 2022 18:46:02 -0700
Message-ID: <1650419169-13760-11-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make changes to dpu_encoder to support virtual encoder needed
to support writeback for dpu.

changes in v2:
	- add the writeback parts to dpu_encoder_helper_phys_cleanup
	- rebase on tip of msm-next and fix related dependencies
	- get the writeback blocks directly from RM

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 71 +++++++++++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 +
 2 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e31ad3..06b8631 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -928,6 +928,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	int num_lm, num_ctl, num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
+	enum dpu_hw_blk_type blk_type;
 	int i;
 
 	if (!drm_enc) {
@@ -1009,12 +1010,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
-		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
-			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
+		if (dpu_encoder_get_intf_mode(&dpu_enc->base) == INTF_MODE_WB_LINE)
+			blk_type = DPU_HW_BLK_WB;
+		else
+			blk_type = DPU_HW_BLK_INTF;
+
+		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
+			if (blk_type == DPU_HW_BLK_INTF)
+				phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
+			else if (blk_type == DPU_HW_BLK_WB)
+				phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->intf_idx);
+		}
 
-		if (!phys->hw_intf) {
+		if (!phys->hw_intf && !phys->hw_wb) {
 			DPU_ERROR_ENC(dpu_enc,
-				      "no intf block assigned at idx: %d\n", i);
+				      "no intf ow wb block assigned at idx: %d\n", i);
 			return;
 		}
 
@@ -1157,15 +1167,22 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
+static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
 
-	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
-		    && catalog->intf[i].controller_id == controller_id) {
-			return catalog->intf[i].id;
+	if (type != INTF_WB) {
+		for (i = 0; i < catalog->intf_count; i++) {
+			if (catalog->intf[i].type == type
+				&& catalog->intf[i].controller_id == controller_id) {
+				return catalog->intf[i].id;
+			}
+		}
+	} else {
+		for (i = 0; i < catalog->wb_count; i++) {
+			if (catalog->wb[i].id == controller_id)
+				return catalog->wb[i].id;
 		}
 	}
 
@@ -1886,16 +1903,27 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 
 	dpu_encoder_helper_reset_mixers(phys_enc);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
-			phys_enc->hw_intf->ops.bind_pingpong_blk(
-					dpu_enc->phys_encs[i]->hw_intf, false,
-					dpu_enc->phys_encs[i]->hw_pp->idx);
+	if (phys_enc->hw_wb) {
+		/* disable the PP block */
+		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
+			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
+					phys_enc->hw_pp->idx);
 
-		/* mark INTF flush as pending */
-		if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
-			phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
-					dpu_enc->phys_encs[i]->hw_intf->idx);
+		/* mark WB flush as pending */
+		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
+			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
+	} else {
+		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
+				phys_enc->hw_intf->ops.bind_pingpong_blk(
+						dpu_enc->phys_encs[i]->hw_intf, false,
+						dpu_enc->phys_encs[i]->hw_pp->idx);
+
+			/* mark INTF flush as pending */
+			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
+				phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
+						dpu_enc->phys_encs[i]->hw_intf->idx);
+		}
 	}
 
 	/* reset the merge 3D HW block */
@@ -2111,6 +2139,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	case DRM_MODE_ENCODER_TMDS:
 		intf_type = INTF_DP;
 		break;
+	case DRM_MODE_ENCODER_VIRTUAL:
+		intf_type = INTF_WB;
+		break;
 	}
 
 	WARN_ON(disp_info->num_of_h_tiles < 1);
@@ -2145,11 +2176,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
+		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
 													intf_type,
 													controller_id);
 		if (phys_params.intf_idx == INTF_MAX) {
-			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
+			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
 						  intf_type, controller_id);
 			ret = -EINVAL;
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 544a9a4..0b80af4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -11,6 +11,7 @@
 
 #include "dpu_kms.h"
 #include "dpu_hw_intf.h"
+#include "dpu_hw_wb.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_top.h"
@@ -165,6 +166,7 @@ enum dpu_intr_idx {
  * @hw_ctl:		Hardware interface to the ctl registers
  * @hw_pp:		Hardware interface to the ping pong registers
  * @hw_intf:		Hardware interface to the intf registers
+ * @hw_wb:		Hardware interface to the wb registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
  * @enabled:		Whether the encoder has enabled and running a mode
@@ -193,6 +195,7 @@ struct dpu_encoder_phys {
 	struct dpu_hw_ctl *hw_ctl;
 	struct dpu_hw_pingpong *hw_pp;
 	struct dpu_hw_intf *hw_intf;
+	struct dpu_hw_wb *hw_wb;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
 	enum dpu_enc_split_role split_role;
-- 
2.7.4

