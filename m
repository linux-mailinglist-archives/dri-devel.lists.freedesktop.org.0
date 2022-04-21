Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B87CD50AA51
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 22:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DC310E0FA;
	Thu, 21 Apr 2022 20:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994910E0D0;
 Thu, 21 Apr 2022 20:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650574165; x=1682110165;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ozSDU7h+lssKkm0D2tipzMBvvcf6IcgXNuC+zfkGVnM=;
 b=DV+qPKHNwK90zVz4hFqdfyz8HoHr3v+96yLOiLjq1lRt1Se6m9pE/chb
 uwjCUX6ANmWcTWbS5R/UtcusxWeoHTIX2+bJfoRDcv1BQF29ihNGV6yjR
 HaT7VGjD79h0txpBgX3xi1sAVgHgB9Oyt2Nj8Vpy8x8mP8HcQLDS0j8en E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 21 Apr 2022 13:49:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:49:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:43 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 21 Apr 2022 13:48:42 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC 1/4] drm/msm/dpu: introduce a wb_idx to be used for writeback
 interfaces
Date: Thu, 21 Apr 2022 13:48:29 -0700
Message-ID: <1650574112-25294-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using intf_idx even for writeback interfaces is confusing
because intf_idx is of type enum dpu_intf but the index used
for writeback is of type enum dpu_wb.

In addition, this makes it easier to separately check the
availability of the two as its possible that there are boards
which don't have any physical display connected but can still
work in writeback mode.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 62 +++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  2 +-
 3 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c12841..054d7e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -962,7 +962,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	int num_lm, num_ctl, num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
-	enum dpu_hw_blk_type blk_type;
 	int i;
 
 	if (!drm_enc) {
@@ -1044,17 +1043,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
-		if (dpu_encoder_get_intf_mode(&dpu_enc->base) == INTF_MODE_WB_LINE)
-			blk_type = DPU_HW_BLK_WB;
-		else
-			blk_type = DPU_HW_BLK_INTF;
+		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
+			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
 
-		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
-			if (blk_type == DPU_HW_BLK_INTF)
-				phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
-			else if (blk_type == DPU_HW_BLK_WB)
-				phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->intf_idx);
-		}
+		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
+			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
 
 		if (!phys->hw_intf && !phys->hw_wb) {
 			DPU_ERROR_ENC(dpu_enc,
@@ -1201,7 +1194,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
+static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
@@ -1213,16 +1206,28 @@ static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
 				return catalog->intf[i].id;
 			}
 		}
-	} else {
-		for (i = 0; i < catalog->wb_count; i++) {
-			if (catalog->wb[i].id == controller_id)
-				return catalog->wb[i].id;
-		}
 	}
 
 	return INTF_MAX;
 }
 
+static enum dpu_wb dpu_encoder_get_wb(struct dpu_mdss_cfg *catalog,
+		enum dpu_intf_type type, u32 controller_id)
+{
+	int i = 0;
+
+	if (type != INTF_WB)
+		goto end;
+
+	for (i = 0; i < catalog->wb_count; i++) {
+		if (catalog->wb[i].id == controller_id)
+			return catalog->wb[i].id;
+	}
+
+end:
+	return WB_MAX;
+}
+
 static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
@@ -2249,18 +2254,21 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
 				i, controller_id, phys_params.split_role);
 
-		/*
-		 * FIXME: have separate intf_idx and wb_idx to avoid using
-		 * enum dpu_intf type for wb_idx and also to be able to
-		 * not bail out when there is no intf for boards which dont
-		 * have a display connected to them.
-		 * Having a valid wb_idx but not a intf_idx can be a valid
-		 * combination moving forward.
-		 */
-		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
+		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
 													intf_type,
 													controller_id);
-		if (phys_params.intf_idx == INTF_MAX) {
+
+		phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
+				intf_type, controller_id);
+		/*
+		 * For boards which have no physical displays, having no interface
+		 * is fine because it can still be used with just writeback.
+		 * If we try without a display on a board which uses a DPU in which
+		 * writeback is not supported, then this will still fail as it will not
+		 * find any writeback in the catalog.
+		 */
+		if ((phys_params.intf_idx == INTF_MAX) &&
+				(phys_params.wb_idx == WB_MAX)) {
 			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
 						  intf_type, controller_id);
 			ret = -EINVAL;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 04d037e..f2af07d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -181,6 +181,7 @@ enum dpu_intr_idx {
  * @split_role:		Role to play in a split-panel configuration
  * @intf_mode:		Interface mode
  * @intf_idx:		Interface index on dpu hardware
+ * @wb_idx:			Writeback index on dpu hardware
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  * @enable_state:	Enable state tracking
  * @vblank_refcount:	Reference count of vblank request
@@ -209,6 +210,7 @@ struct dpu_encoder_phys {
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf_mode intf_mode;
 	enum dpu_intf intf_idx;
+	enum dpu_wb wb_idx;
 	spinlock_t *enc_spinlock;
 	enum dpu_enc_enable_state enable_state;
 	atomic_t vblank_refcount;
@@ -275,6 +277,7 @@ struct dpu_encoder_phys_cmd {
  * @parent_ops:		Callbacks exposed by the parent to the phys_enc
  * @split_role:		Role to play in a split-panel configuration
  * @intf_idx:		Interface index this phys_enc will control
+ * @wb_idx:			Writeback index this phys_enc will control
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  */
 struct dpu_enc_phys_init_params {
@@ -283,6 +286,7 @@ struct dpu_enc_phys_init_params {
 	const struct dpu_encoder_virt_ops *parent_ops;
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf intf_idx;
+	enum dpu_wb wb_idx;
 	spinlock_t *enc_spinlock;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ba82e54..2f34a31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -103,7 +103,7 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
  * @rm: DPU Resource Manager handle
  * @wb_idx: WB index
  */
-static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_intf wb_idx)
+static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_wb wb_idx)
 {
 	return rm->hw_wb[wb_idx - WB_0];
 }
-- 
2.7.4

