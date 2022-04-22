Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9E50C07C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C4710E61F;
	Fri, 22 Apr 2022 19:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A79E10E5D9;
 Fri, 22 Apr 2022 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650656743; x=1682192743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=poyufAb25mUxu3MKuHiEPPq7t/xvCQ6ASkkYx5dXtz0=;
 b=BN8ntlvqnngcZSw0U6tUGI/6Qq2wv2yrM+vyInGfza9EG+ksYbUeVQbt
 4LA2I5Bi4dxfuG2qIlzSxXM8uJ1MmdWDXCkDHt6Xh5RbGcsUrB6o8l46J
 F+GaA4dPUCE95r7Fw9txqUywUxPlCv2yqEU7K6REe14c1OE3xlIx9HMu1 E=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 22 Apr 2022 12:45:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:45:42 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 12:45:41 -0700
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 12:45:41 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/msm/dpu: introduce a wb_idx to be used for
 writeback interfaces
Date: Fri, 22 Apr 2022 12:45:27 -0700
Message-ID: <1650656729-8170-2-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650656729-8170-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1650656729-8170-1-git-send-email-quic_abhinavk@quicinc.com>
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

changes in v2:
	- add check for invalid phys having both intf and wb
	- merge the next change of using wb_idx in phys_wb

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 68 +++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 10 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  2 +-
 4 files changed, 51 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c12841..9ae9bd4 100644
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
@@ -1062,6 +1055,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
+		if (phys->hw_intf && phys->hw_wb) {
+			DPU_ERROR_ENC(dpu_enc,
+					"invalid phys both intf and wb block at idx: %d\n", i);
+			return;
+		}
+
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
@@ -1201,7 +1200,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
+static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
@@ -1213,16 +1212,28 @@ static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
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
@@ -2249,18 +2260,21 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 563ca08..cb5c7da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -250,7 +250,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 	const struct drm_display_mode *mode;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
-			phys_enc->intf_idx, mode->name, mode->hdisplay, mode->vdisplay);
+			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
 
 	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
 		return 0;
@@ -584,7 +584,7 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
  */
 static void dpu_encoder_phys_wb_destroy(struct dpu_encoder_phys *phys_enc)
 {
-	DPU_DEBUG("[wb:%d]\n", phys_enc->intf_idx - INTF_0);
+	DPU_DEBUG("[wb:%d]\n", phys_enc->wb_idx - WB_0);
 
 	if (!phys_enc)
 		return;
@@ -730,7 +730,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 
 	phys_enc = &wb_enc->base;
 	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->parent = p->parent;
@@ -738,7 +738,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
 	phys_enc->enc_spinlock = p->enc_spinlock;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
@@ -754,7 +754,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
-			phys_enc->intf_idx);
+			phys_enc->wb_idx);
 
 	return phys_enc;
 
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

