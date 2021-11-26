Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F18D45E46E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 03:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E866B6E4B7;
	Fri, 26 Nov 2021 02:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F12B16E448
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 02:26:47 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bu18so20631928lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 18:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80LKuN/tcEA+Bcj0tg6X3nyrCTUndXNZko1Vc1kJ9dQ=;
 b=rXZcx0cICa+WZma5dmy+PY9lYpLq2T3ISIfUMy+atBDDpn00ElUPLSoTwNM6sKWrjF
 IN9lugWTjzjsM2vyGPpOArhvOJfJGSC8ChzWF09Cgq3mR9qdng5hV2EXr8JUrZ5pkD9h
 c2lzl2Zt3Yn6x5+C50f7izp8YoFSgctDhcSkAY1S8oW3OMyHrwJ7pJBAreplDBlO/QT5
 x8Bu5XMaAW0dC4BrTPnN5c+QbzoHHOFsEOrHkn+z06vqb3M4c+P88zivIcmboMEFpMJo
 urIiFBr9IYlDktOwRnI1F+RTAcH3zFtUrz/l1V18F/H6uyNtzNG/4QplV5oMvCRVYzf3
 5Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80LKuN/tcEA+Bcj0tg6X3nyrCTUndXNZko1Vc1kJ9dQ=;
 b=0YfoP43c+u/Fu+J8K2gWDv9GNoO7japtYoVcAyp5uTWk0rg9xlbjsPxi5LFw+2OsJw
 vzGg0y191QynMqRZFH9U1z5Sr5MttcjINTUl4ot5H0Tuewcx0j5u4O67eRjfGB9VVvWl
 odZeq+KHhrO7ux0c/WNoWkUlV5SUfR+NLQN2XqZdNFGUUmmZKpOg53SRtdV+K7KENK8f
 c4UTig9j670dldiMXr3U05voZwKKblVHlxK9QbU6/Ob1A9BDok9QkFo1B+7fn2YR5sF8
 aKO8fS68rwTXt7VZNNfCmgaEVpEyNWS9ZdCJlR7+AQU/3ds+QDb6bYpvNVmc8eGe4aJ7
 yrcg==
X-Gm-Message-State: AOAM531IM9j5eCjZMmwk4m3IQK86Rlq1hFleE+ognUGcM3z2pCr6cKVi
 BtTfDucAEtx92fzkNfTW32BJTw==
X-Google-Smtp-Source: ABdhPJz3LJLCoB4W6LPrHPe1EcpF8FHNLgdXNPYHY+MWn2RmuE5EfjSHKo+ydPF8TJe1r7twf0YpKQ==
X-Received: by 2002:a05:6512:2615:: with SMTP id
 bt21mr28804976lfb.129.1637893606195; 
 Thu, 25 Nov 2021 18:26:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x6sm388764lff.125.2021.11.25.18.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 18:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v3 2/3] drm/msm/dpu: get INTF blocks directly rather than
 through RM
Date: Fri, 26 Nov 2021 05:26:41 +0300
Message-Id: <20211126022642.1105979-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
References: <20211126022642.1105979-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder.
So allocate them outside of RM and use them directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 36 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   | 16 ----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 24 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 92 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 -
 9 files changed, 28 insertions(+), 165 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e7ee4cfb8461..95674bbf75f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -420,26 +420,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
 	return linecount;
 }
 
-void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
-				  struct dpu_encoder_hw_resources *hw_res)
-{
-	struct dpu_encoder_virt *dpu_enc = NULL;
-	int i = 0;
-
-	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	DPU_DEBUG_ENC(dpu_enc, "\n");
-
-	/* Query resources used by phys encs, expected to be without overlap */
-	memset(hw_res, 0, sizeof(*hw_res));
-
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.get_hw_resources)
-			phys->ops.get_hw_resources(phys, hw_res);
-	}
-}
-
 static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
@@ -973,7 +953,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	int num_lm, num_ctl, num_pp;
-	int i, j;
+	int i;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -1043,8 +1023,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	cstate->num_mixers = num_lm;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		int num_blk;
-		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
 		if (!dpu_enc->hw_pp[i]) {
@@ -1062,16 +1040,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
-		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
-			global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
-			hw_blk, ARRAY_SIZE(hw_blk));
-		for (j = 0; j < num_blk; j++) {
-			struct dpu_hw_intf *hw_intf;
-
-			hw_intf = to_dpu_hw_intf(hw_blk[i]);
-			if (hw_intf->idx == phys->intf_idx)
-				phys->hw_intf = hw_intf;
-		}
+		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
+			phys->hw_intf = dpu_kms->hw_intf[phys->intf_idx];
 
 		if (!phys->hw_intf) {
 			DPU_ERROR_ENC(dpu_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index e241914a9677..722dd7db6bdf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -18,22 +18,6 @@
 
 #define IDLE_TIMEOUT	(66 - 16/2)
 
-/**
- * Encoder functions and data types
- * @intfs:	Interfaces this encoder is using, INTF_MODE_NONE if unused
- */
-struct dpu_encoder_hw_resources {
-	enum dpu_intf_mode intfs[INTF_MAX];
-};
-
-/**
- * dpu_encoder_get_hw_resources - Populate table of required hardware resources
- * @encoder:	encoder pointer
- * @hw_res:	resource table to populate with encoder required resources
- */
-void dpu_encoder_get_hw_resources(struct drm_encoder *encoder,
-				  struct dpu_encoder_hw_resources *hw_res);
-
 /**
  * dpu_encoder_assign_crtc - Link the encoder to the crtc it's assigned to
  * @encoder:	encoder pointer
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..42febfce79c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -91,9 +91,6 @@ struct dpu_encoder_virt_ops {
  * @disable:			DRM Call. Disable mode.
  * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @destroy:			DRM Call. Destroy and release resources.
- * @get_hw_resources:		Populate the structure with the hardware
- *				resources that this phys_enc is using.
- *				Expect no overlap between phys_encs.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -129,8 +126,6 @@ struct dpu_encoder_phys_ops {
 			    struct drm_crtc_state *crtc_state,
 			    struct drm_connector_state *conn_state);
 	void (*destroy)(struct dpu_encoder_phys *encoder);
-	void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
-				 struct dpu_encoder_hw_resources *hw_res);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 34a6940d12c5..7d2beea9cc4e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -534,13 +534,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(cmd_enc);
 }
 
-static void dpu_encoder_phys_cmd_get_hw_resources(
-		struct dpu_encoder_phys *phys_enc,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_CMD;
-}
-
 static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -736,7 +729,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_cmd_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 185379b18572..9863e5ee61f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -465,13 +465,6 @@ static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(phys_enc);
 }
 
-static void dpu_encoder_phys_vid_get_hw_resources(
-		struct dpu_encoder_phys *phys_enc,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_VIDEO;
-}
-
 static int dpu_encoder_phys_vid_wait_for_vblank(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -680,7 +673,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8e2236fe5039..cf9a24777f76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -741,6 +741,12 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
 				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
 		}
+		for (i = 0; i < dpu_kms->catalog->intf_count; i++) {
+			u32 intf_idx = dpu_kms->catalog->intf[i].id;
+
+			if ((intf_idx < INTF_MAX) && dpu_kms->hw_intf[intf_idx])
+				dpu_hw_intf_destroy(dpu_kms->hw_intf[intf_idx]);
+		}
 	}
 
 	if (dpu_kms->rm_init)
@@ -1069,6 +1075,24 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		}
 	}
 
+	for (i = 0; i < dpu_kms->catalog->intf_count; i++) {
+		u32 intf_idx = dpu_kms->catalog->intf[i].id;
+
+		if (dpu_kms->catalog->intf[i].type == INTF_NONE)
+			continue;
+
+		dpu_kms->hw_intf[intf_idx] = dpu_hw_intf_init(intf_idx,
+				dpu_kms->mmio, dpu_kms->catalog);
+		if (IS_ERR_OR_NULL(dpu_kms->hw_intf[intf_idx])) {
+			rc = PTR_ERR(dpu_kms->hw_intf[intf_idx]);
+			if (!dpu_kms->hw_intf[intf_idx])
+				rc = -EINVAL;
+			DPU_ERROR("failed to init intf %d: %d\n", intf_idx, rc);
+			dpu_kms->hw_intf[intf_idx] = NULL;
+			goto power_error;
+		}
+	}
+
 	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
 			_dpu_kms_get_clk(dpu_kms, "core"));
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 775bcbda860f..48b59971ee8e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -106,6 +106,7 @@ struct dpu_kms {
 	bool rm_init;
 
 	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
+	struct dpu_hw_intf *hw_intf[INTF_MAX];
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
@@ -144,7 +145,6 @@ struct dpu_global_state {
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
-	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..d8d3f87a0ed2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -28,7 +28,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
  */
 struct dpu_rm_requirements {
 	struct msm_display_topology topology;
-	struct dpu_encoder_hw_resources hw_res;
 };
 
 int dpu_rm_destroy(struct dpu_rm *rm)
@@ -67,14 +66,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_ctl_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->intf_blks); i++) {
-		struct dpu_hw_intf *hw;
-
-		if (rm->intf_blks[i]) {
-			hw = to_dpu_hw_intf(rm->intf_blks[i]);
-			dpu_hw_intf_destroy(hw);
-		}
-	}
 
 	return 0;
 }
@@ -166,27 +157,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
-	for (i = 0; i < cat->intf_count; i++) {
-		struct dpu_hw_intf *hw;
-		const struct dpu_intf_cfg *intf = &cat->intf[i];
-
-		if (intf->type == INTF_NONE) {
-			DPU_DEBUG("skip intf %d with type none\n", i);
-			continue;
-		}
-		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
-			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
-			continue;
-		}
-		hw = dpu_hw_intf_init(intf->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed intf object creation: err %d\n", rc);
-			goto fail;
-		}
-		rm->intf_blks[intf->id - INTF_0] = &hw->base;
-	}
-
 	for (i = 0; i < cat->ctl_count; i++) {
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
@@ -452,54 +422,6 @@ static int _dpu_rm_reserve_ctls(
 	return 0;
 }
 
-static int _dpu_rm_reserve_intf(
-		struct dpu_rm *rm,
-		struct dpu_global_state *global_state,
-		uint32_t enc_id,
-		uint32_t id)
-{
-	int idx = id - INTF_0;
-
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->intf_blks)) {
-		DPU_ERROR("invalid intf id: %d", id);
-		return -EINVAL;
-	}
-
-	if (!rm->intf_blks[idx]) {
-		DPU_ERROR("couldn't find intf id %d\n", id);
-		return -EINVAL;
-	}
-
-	if (reserved_by_other(global_state->intf_to_enc_id, idx, enc_id)) {
-		DPU_ERROR("intf id %d already reserved\n", id);
-		return -ENAVAIL;
-	}
-
-	global_state->intf_to_enc_id[idx] = enc_id;
-	return 0;
-}
-
-static int _dpu_rm_reserve_intf_related_hw(
-		struct dpu_rm *rm,
-		struct dpu_global_state *global_state,
-		uint32_t enc_id,
-		struct dpu_encoder_hw_resources *hw_res)
-{
-	int i, ret = 0;
-	u32 id;
-
-	for (i = 0; i < ARRAY_SIZE(hw_res->intfs); i++) {
-		if (hw_res->intfs[i] == INTF_MODE_NONE)
-			continue;
-		id = i + INTF_0;
-		ret = _dpu_rm_reserve_intf(rm, global_state, enc_id, id);
-		if (ret)
-			return ret;
-	}
-
-	return ret;
-}
-
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -521,11 +443,6 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_intf_related_hw(rm, global_state, enc->base.id,
-				&reqs->hw_res);
-	if (ret)
-		return ret;
-
 	return ret;
 }
 
@@ -534,8 +451,6 @@ static int _dpu_rm_populate_requirements(
 		struct dpu_rm_requirements *reqs,
 		struct msm_display_topology req_topology)
 {
-	dpu_encoder_get_hw_resources(enc, &reqs->hw_res);
-
 	reqs->topology = req_topology;
 
 	DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
@@ -565,8 +480,6 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
-		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -630,11 +543,6 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->ctl_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->ctl_blks);
 		break;
-	case DPU_HW_BLK_INTF:
-		hw_blks = rm->intf_blks;
-		hw_to_enc_id = global_state->intf_to_enc_id;
-		max_blks = ARRAY_SIZE(rm->intf_blks);
-		break;
 	case DPU_HW_BLK_DSPP:
 		hw_blks = rm->dspp_blks;
 		hw_to_enc_id = global_state->dspp_to_enc_id;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..27afe55f1f55 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -18,7 +18,6 @@ struct dpu_global_state;
  * @pingpong_blks: array of pingpong hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
- * @intf_blks: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
  * @lm_max_width: cached layer mixer maximum width
  * @rm_lock: resource manager mutex
@@ -27,7 +26,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
-	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 
-- 
2.33.0

