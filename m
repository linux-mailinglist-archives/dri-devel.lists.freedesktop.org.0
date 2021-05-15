Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231C3381BA6
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 00:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6E6E45E;
	Sat, 15 May 2021 22:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BD06E45E
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 22:58:04 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id v5so2735562ljg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 15:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5qe9ZMM3P04rkX7k1lm5GVbCa/n902FJD9qz2YgUU8=;
 b=F9oY67eB5OfIf1EHpVLm01gK+I6Kawvh9AGiGrEU0qVXMnIb0gGpusvk8N3gw+5aot
 DAVls/3BydP4pL0PcdO2hDYbsck+qzjoE42q4dBDaqOnQw01yR5LEzTtBpzpFiZaLMCx
 r6tLmjwT/32GBWwen7AUis9OebhPrXJJ48WAX9udmh9VCRDfq6a/EI5TZ4K8bE6EPp9m
 meHB7kMUNka3g/R9Ji20FZy8kpXNN3pecx5BHiGXQ2sGcK9SI818T7wMdnYMdYpesru+
 OnxsADAImCN/m3WOwJje53iUnmK9IiWgpoCYjqAZrQXeDo7TKUoVnLt0557j6taaCjdV
 Ckaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5qe9ZMM3P04rkX7k1lm5GVbCa/n902FJD9qz2YgUU8=;
 b=DqciOnUuO62/zmJd+j4Tq/xOp76huOtdByapLB7vEOQ4FGOS+PZfuhm5xS2jUVqCmc
 Z2QU/vyGt+HTV9Mb5rhqYRmeo7PbgmBEPoqPSKoBclTa6l+8/99M31UqxPFugV2mCoJK
 XoG+EVirT/ccu75Ku1idEvRhbRN8jBxiD+nmWcipGrUT1Uf8nMa/mdqRvkpbnGCRKpdj
 /KGESeNbRbM1STCBLmbZJXkRkmS1+KuChaU23/hXO8hJ+9VCkTFyvFuR+v9GIPpNGegB
 VECemrYqKieozJiOaqKVQD21X0ovmk2F0xh8Orqa+kTbwHJbIRJXojWfzIQx+QrlK81D
 Pafw==
X-Gm-Message-State: AOAM531WAP9Y1IY9QHyr4KZzS9PHK6v6bE6JoMVE+PzU2WEF/zNhjpOi
 4HLH6KNm34PFo8M/qzgfHyuPJA==
X-Google-Smtp-Source: ABdhPJwKWIVCvPvS9kbJihYuaVtH4VrYdKg46zhpI5bhVqGZTwr9oBL7gfyFJyqTd7MTcby0yI0u5g==
X-Received: by 2002:a2e:90d6:: with SMTP id o22mr18584895ljg.473.1621119483251; 
 Sat, 15 May 2021 15:58:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:58:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 4/6] drm/msm/dpu: get INTF blocks directly rather than
 through RM
Date: Sun, 16 May 2021 01:57:55 +0300
Message-Id: <20210515225757.1989955-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  8 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 24 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 91 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 -
 9 files changed, 28 insertions(+), 156 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3f4d2ba53604..8a8a98f9d132 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -456,26 +456,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
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
@@ -1007,7 +987,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	int num_lm, num_ctl;
-	int i, j;
+	int i;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -1069,8 +1049,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	cstate->num_mixers = num_lm;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		int num_blk;
-		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
 		if (!dpu_enc->hw_pp[i]) {
@@ -1088,16 +1066,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
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
index 99a5d73c9b88..09db83f8339f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -26,14 +26,6 @@ struct dpu_encoder_hw_resources {
 	enum dpu_intf_mode intfs[INTF_MAX];
 };
 
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
index ecbc4be98980..fc8f070981c2 100644
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
index b2be39b9144e..adbd59326b99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -541,13 +541,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
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
@@ -747,7 +740,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_cmd_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 4feec24162bc..4333b94cb04f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -477,13 +477,6 @@ static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
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
@@ -688,7 +681,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-	ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ca89229d9f42..364ab1987510 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -683,6 +683,12 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
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
@@ -1021,6 +1027,24 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
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
index 0b936258bde0..6e2ec3171a79 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -124,6 +124,7 @@ struct dpu_kms {
 
 	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
 	struct dpu_hw_merge_3d *hw_merge_3d[MERGE_3D_MAX];
+	struct dpu_hw_intf *hw_intf[INTF_MAX];
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
@@ -163,7 +164,6 @@ struct dpu_global_state {
 
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
-	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index acadb7240d09..c36700a06ff2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -48,14 +48,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
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
@@ -110,27 +102,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		}
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
@@ -305,54 +276,6 @@ static int _dpu_rm_reserve_ctls(
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
@@ -374,11 +297,6 @@ static int _dpu_rm_make_reservation(
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_intf_related_hw(rm, global_state, enc->base.id,
-				&reqs->hw_res);
-	if (ret)
-		return ret;
-
 	return ret;
 }
 
@@ -387,8 +305,6 @@ static int _dpu_rm_populate_requirements(
 		struct dpu_rm_requirements *reqs,
 		struct msm_display_topology req_topology)
 {
-	dpu_encoder_get_hw_resources(enc, &reqs->hw_res);
-
 	reqs->topology = req_topology;
 
 	DRM_DEBUG_KMS("num_lm: %d num_enc: %d num_intf: %d\n",
@@ -416,8 +332,6 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
 		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
-		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -476,11 +390,6 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->ctl_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->ctl_blks);
 		break;
-	case DPU_HW_BLK_INTF:
-		hw_blks = rm->intf_blks;
-		hw_to_enc_id = global_state->intf_to_enc_id;
-		max_blks = ARRAY_SIZE(rm->intf_blks);
-		break;
 	default:
 		DPU_ERROR("blk type %d not managed by rm\n", type);
 		return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index a618c0ef43db..ee90b1233430 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -17,14 +17,12 @@ struct dpu_global_state;
  * struct dpu_rm - DPU dynamic hardware resource manager
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
- * @intf_blks: array of intf hardware resources
  * @lm_max_width: cached layer mixer maximum width
  * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
-	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 
 	uint32_t lm_max_width;
 };
-- 
2.30.2

