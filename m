Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54175347B52
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FBF6EC4B;
	Wed, 24 Mar 2021 15:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEF76EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:36 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id u10so30620354lju.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNTLXvqLsHODZghy5dNRi2QvLtORELZGn1VEjilYqGY=;
 b=NqI+fMBfn6XxtstrYtg1ZR+XxLMePJUyskX7ryxQAE9k9oBJcPIuwUFLhLWCVX7Q4S
 dJWqTGH0vF44CrNvQCwqgT2laMJEwSsLixPj3ujYK9RrJXX8qsjbYmTFrykAN1W3dMV+
 tJbGJ7pQ1rF9wmbdJz6CdO7Is466XV2pLGydz3J44feiXQIKnPlQPFEW5Ifehp7txu4n
 +hipvl0jJNMxnXyB0+WM03Svg77Z5TQXmRm05vjrBuUzu23Xiw2OMREmHohfkk3q54dX
 J6Q3XtpDvyG9ZftroJSxP3j1N8XUvw/R5ep1sa2qDJlH758/kxVmaatC4GggSfTga4Id
 FEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNTLXvqLsHODZghy5dNRi2QvLtORELZGn1VEjilYqGY=;
 b=LJsytPR5AXXjhFx7el04IhpTrYn0qX910RUcRZtiVbZ3SEOpyFacGY6gLSly8MUzyt
 qzLsvEUUWlj3Ka4TW2ghUFcBViBwKtGOGzzgl58kaNK5Y+YUt/12DxIy41yeS2O+rvJa
 DdkTJo0UyVIPSlXjnhWhRGo/PDp/IcQxxlfbB3+cL/yMwunFizYXUE7yU6zOUtC1PtT8
 m30AYOCvvj8/7Cnyv2U92s+LxYMc7rt/4F9wgYKtxmIyF0HS1PCIHadzmpwtLgwBxJwS
 /QPxOkiX+N3nvJhoL19HxhWaNBxl5nGb1fEjqFBapn29tlsnM/D4s5M1UwvtcbFuWHaw
 +DWA==
X-Gm-Message-State: AOAM531IOQcGXua/+osyVGZYwtBflLkx9VMPZx8TK9LiKM5K+4OwzCyC
 AUxxQaAPdIr6VjqQ+isgJvCHGQ==
X-Google-Smtp-Source: ABdhPJzVFf7m7auwi/rsKAz/YH+kymbvHqvyJ+CW234QQtNXR5I4A4KvYml1QHWpr/pgwi2gZlF+oA==
X-Received: by 2002:a05:651c:28b:: with SMTP id
 b11mr2354175ljo.219.1616598035022; 
 Wed, 24 Mar 2021 08:00:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 04/21] drm/msm/dpu: get DSPP blocks directly rather than
 through RM
Date: Wed, 24 Mar 2021 18:00:07 +0300
Message-Id: <20210324150024.2768215-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Each DSPP block is tied to a single LM. No LMs can share single DSPP
block. So there is no need to handle DSPP blocks through all resource
allocation/deallocation/assignment, just receive DSPP block as a part of
LM hardware instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 116 ++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 -
 6 files changed, 44 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 288e95ee8e1d..b3d50f6d976d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -977,7 +977,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	int num_lm, num_ctl, num_pp;
 	int i, j;
 
@@ -1028,9 +1027,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1043,7 +1039,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = cstate->mixers[i].hw_lm->dspp;
 	}
 
 	cstate->num_mixers = num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 76f8b8f75b82..35675744a6b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -5,6 +5,7 @@
 #include "dpu_kms.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hwio.h"
+#include "dpu_hw_dspp.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_mdss.h"
 
@@ -182,6 +183,9 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 	c->cap = cfg;
 	_setup_mixer_ops(m, &c->ops, c->cap->features);
 
+	if (cfg->dspp && cfg->dspp < DSPP_MAX)
+		c->dspp = dpu_hw_dspp_init(cfg->dspp, addr, m);
+
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx);
 
 	return c;
@@ -189,5 +193,7 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 
 void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
 {
+	if (lm)
+		dpu_hw_dspp_destroy(lm->dspp);
 	kfree(lm);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 4a6b2de19ef6..effb78311a43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -64,6 +64,7 @@ struct dpu_hw_mixer {
 	const struct dpu_lm_cfg   *cap;
 	const struct dpu_mdp_cfg  *mdp;
 	const struct dpu_ctl_cfg  *ctl;
+	struct dpu_hw_dspp *dspp;
 
 	/* ops */
 	struct dpu_hw_lm_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index d6717d6672f7..195a854245fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -164,7 +164,6 @@ struct dpu_global_state {
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
-	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index fd2d104f0a91..bb03ff8b8c9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -9,7 +9,6 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
-#include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
@@ -35,6 +34,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
+		struct dpu_hw_mixer *hw;
+
+		if (rm->mixer_blks[i]) {
+			hw = to_dpu_hw_mixer(rm->mixer_blks[i]);
+			dpu_hw_lm_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
@@ -51,14 +58,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_merge_3d_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks); i++) {
-		struct dpu_hw_mixer *hw;
-
-		if (rm->mixer_blks[i]) {
-			hw = to_dpu_hw_mixer(rm->mixer_blks[i]);
-			dpu_hw_lm_destroy(hw);
-		}
-	}
 	for (i = 0; i < ARRAY_SIZE(rm->ctl_blks); i++) {
 		struct dpu_hw_ctl *hw;
 
@@ -94,40 +93,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 	memset(rm, 0, sizeof(*rm));
 
 	/* Interrogate HW catalog and create tracking items for hw blocks */
-	for (i = 0; i < cat->mixer_count; i++) {
-		struct dpu_hw_mixer *hw;
-		const struct dpu_lm_cfg *lm = &cat->mixer[i];
-
-		if (lm->pingpong == PINGPONG_MAX) {
-			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
-			continue;
-		}
-
-		if (lm->id < LM_0 || lm->id >= LM_MAX) {
-			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
-			continue;
-		}
-		hw = dpu_hw_lm_init(lm->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed lm object creation: err %d\n", rc);
-			goto fail;
-		}
-		rm->mixer_blks[lm->id - LM_0] = &hw->base;
-
-		if (!rm->lm_max_width) {
-			rm->lm_max_width = lm->sblk->maxwidth;
-		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
-			/*
-			 * Don't expect to have hw where lm max widths differ.
-			 * If found, take the min.
-			 */
-			DPU_ERROR("unsupported: lm maxwidth differs\n");
-			if (rm->lm_max_width > lm->sblk->maxwidth)
-				rm->lm_max_width = lm->sblk->maxwidth;
-		}
-	}
-
 	for (i = 0; i < cat->merge_3d_count; i++) {
 		struct dpu_hw_merge_3d *hw;
 		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
@@ -204,21 +169,38 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->ctl_blks[ctl->id - CTL_0] = &hw->base;
 	}
 
-	for (i = 0; i < cat->dspp_count; i++) {
-		struct dpu_hw_dspp *hw;
-		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
+	for (i = 0; i < cat->mixer_count; i++) {
+		struct dpu_hw_mixer *hw;
+		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
-			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
+		if (lm->pingpong == PINGPONG_MAX) {
+			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
+			continue;
+		}
+
+		if (lm->id < LM_0 || lm->id >= LM_MAX) {
+			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
 			continue;
 		}
-		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
+		hw = dpu_hw_lm_init(lm->id, mmio, cat);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
-			DPU_ERROR("failed dspp object creation: err %d\n", rc);
+			DPU_ERROR("failed lm object creation: err %d\n", rc);
 			goto fail;
 		}
-		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
+		rm->mixer_blks[lm->id - LM_0] = &hw->base;
+
+		if (!rm->lm_max_width) {
+			rm->lm_max_width = lm->sblk->maxwidth;
+		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
+			/*
+			 * Don't expect to have hw where lm max widths differ.
+			 * If found, take the min.
+			 */
+			DPU_ERROR("unsupported: lm maxwidth differs\n");
+			if (rm->lm_max_width > lm->sblk->maxwidth)
+				rm->lm_max_width = lm->sblk->maxwidth;
+		}
 	}
 
 	return 0;
@@ -271,15 +253,13 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
  *      available and appropriate
  * @pp_idx: output parameter, index of pingpong block attached to the layer
  *      mixer in rm->pingpong_blks[].
- * @dspp_idx: output parameter, index of dspp block attached to the layer
- *      mixer in rm->dspp_blks[].
  * @reqs: input parameter, rm requirements for HW blocks needed in the
  *      datapath.
  * Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
+		uint32_t enc_id, int lm_idx, int *pp_idx,
 		struct dpu_rm_requirements *reqs)
 {
 	const struct dpu_lm_cfg *lm_cfg;
@@ -305,22 +285,6 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	}
 	*pp_idx = idx;
 
-	if (!reqs->topology.num_dspp)
-		return true;
-
-	idx = lm_cfg->dspp - DSPP_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
-		DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
-		return false;
-	}
-
-	if (reserved_by_other(global_state->dspp_to_enc_id, idx, enc_id)) {
-		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
-				lm_cfg->dspp);
-		return false;
-	}
-	*dspp_idx = idx;
-
 	return true;
 }
 
@@ -332,7 +296,6 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 {
 	int lm_idx[MAX_BLOCKS];
 	int pp_idx[MAX_BLOCKS];
-	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, j, lm_count = 0;
 
 	if (!reqs->topology.num_lm) {
@@ -351,7 +314,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
 				enc_id, i, &pp_idx[lm_count],
-				&dspp_idx[lm_count], reqs)) {
+				reqs)) {
 			continue;
 		}
 
@@ -371,7 +334,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
-					&pp_idx[lm_count], &dspp_idx[lm_count],
+					&pp_idx[lm_count],
 					reqs)) {
 				continue;
 			}
@@ -389,8 +352,6 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	for (i = 0; i < lm_count; i++) {
 		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
 		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
-		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			reqs->topology.num_dspp ? enc_id : 0;
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
@@ -635,11 +596,6 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->intf_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->intf_blks);
 		break;
-	case DPU_HW_BLK_DSPP:
-		hw_blks = rm->dspp_blks;
-		hw_to_enc_id = global_state->dspp_to_enc_id;
-		max_blks = ARRAY_SIZE(rm->dspp_blks);
-		break;
 	default:
 		DPU_ERROR("blk type %d not managed by rm\n", type);
 		return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..91952af6c75b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -19,7 +19,6 @@ struct dpu_global_state;
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
- * @dspp_blks: array of dspp hardware resources
  * @lm_max_width: cached layer mixer maximum width
  * @rm_lock: resource manager mutex
  */
@@ -28,7 +27,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
-	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 
 	uint32_t lm_max_width;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
