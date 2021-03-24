Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3E347B4F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3546EC51;
	Wed, 24 Mar 2021 15:00:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03CE6EBFF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:39 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z8so30546471ljm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ewaZlhe2MFNTmbeCLuqyoAlS7E6lrMJPstjPC4DiTo=;
 b=rQbjMVWoaJnNfSZAIS/v9St4zxV6clBGzD4wftMsaE9OJyvVtjowWZ/ChqWqxgK+LQ
 wGhe0WHlEhTTaNYxqC64NOXF/tm/Nw8BNbjsxNSWOZ9jkPrvZQs8FKxTkoInRf6GtttW
 +plfZcm8PWt+GUMSlp2JS9clM1269lDrOtMNdX/d+JrZl/uvUzqG5Wz/sFbImTQeCA0j
 6yA/wWAmx7qblnSl7TFuorN9hBPBqyO6Y9Q2Pm4n6/pLb1MMizTsrl45ZRpyifO2BJKJ
 joEXe/VSZxIqIPNgeDYWf4iNwFUrUgyBKrhJMMcdmEkj64FxpyDmpso9v0oKx9zEGWYW
 xzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ewaZlhe2MFNTmbeCLuqyoAlS7E6lrMJPstjPC4DiTo=;
 b=T593Byht07nl07BtLHbeo5/juyWSaMe2i30zX4XsbtdTVdYyjyhC9fHdLT8KaOFVei
 3v0DzEpUOn5LBDlW3g21NiyDqKUsTwGKa8Z4DOWi0D7zAv7FSTYTtALTDiUowsnYgSiL
 O5+dxJsxnhOc1TcT93r8c6eYUEPcJpzeOD0WyT2T6EH6Jg29SUXEH0MPvP4pSCAt1rbb
 wbHcpzehi6lg5TwVmCxq38DfoN3HZjiMjmp/C1EDBF/t78pSAxv1X0W9/jOj8wgm++eK
 Co8iknY9eAdsxiLT3vOUSsGmklGIRrzdP8rGXXCyBUHb9GSS1CnSROrOVLsKfnlpqWy1
 dP+Q==
X-Gm-Message-State: AOAM533GYxVv6/ZVKm2GepPHdAHpJePmXghIgTw9XHvRlmCX9Y1WdKzv
 DX+CXyzM5VVvdSgdyXZuCvbq9g==
X-Google-Smtp-Source: ABdhPJy98KcBgFXSv/sOY/L/e40Avb1qa2PS2CusoV7b3TkP9u/lUvV/fLU17hF0Gs43cSrCki7iGQ==
X-Received: by 2002:a2e:a318:: with SMTP id l24mr2333475lje.399.1616598037994; 
 Wed, 24 Mar 2021 08:00:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 06/21] drm/msm/dpu: get PINGPONG blocks directly rather than
 through RM
Date: Wed, 24 Mar 2021 18:00:09 +0300
Message-Id: <20210324150024.2768215-7-dmitry.baryshkov@linaro.org>
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

Each PINGPONG block is tied to a single LM. No LMs can share single PINGPONG
block. So there is no need to handle PINGPONG blocks through all resource
allocation/deallocation/assignment, just receive PINGPONG block as a part of
LM hardware instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 12 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     | 10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 99 ++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  9 +-
 8 files changed, 26 insertions(+), 114 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b3d50f6d976d..d98b4e4097fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -974,10 +974,9 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct drm_crtc *drm_crtc;
 	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp;
+	int num_lm, num_ctl;
 	int i, j;
 
 	if (!drm_enc) {
@@ -1020,18 +1019,11 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 			break;
 
 	/* Query resource that have been reserved in atomic check step. */
-	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
-		ARRAY_SIZE(hw_pp));
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 
-	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
-		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
-						: NULL;
-
 	cstate = to_dpu_crtc_state(drm_crtc->state);
 
 	for (i = 0; i < num_lm; i++) {
@@ -1040,6 +1032,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
 		cstate->mixers[i].hw_dspp = cstate->mixers[i].hw_lm->dspp;
+
+		dpu_enc->hw_pp[i] = cstate->mixers[i].hw_lm->pingpong;
 	}
 
 	cstate->num_mixers = num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 35675744a6b7..fd09b9ab9b4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -8,6 +8,7 @@
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_mdss.h"
+#include "dpu_hw_pingpong.h"
 
 #define LM_OP_MODE                        0x00
 #define LM_OUT_SIZE                       0x04
@@ -163,7 +164,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 
 struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+		const struct dpu_mdss_cfg *m,
+		struct dpu_hw_merge_3d **merge_3d_blks)
 {
 	struct dpu_hw_mixer *c;
 	const struct dpu_lm_cfg *cfg;
@@ -185,6 +187,8 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 
 	if (cfg->dspp && cfg->dspp < DSPP_MAX)
 		c->dspp = dpu_hw_dspp_init(cfg->dspp, addr, m);
+	if (cfg->pingpong && cfg->pingpong < PINGPONG_MAX)
+		c->pingpong = dpu_hw_pingpong_init(cfg->pingpong, addr, m, merge_3d_blks);
 
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_LM, idx);
 
@@ -193,7 +197,9 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 
 void dpu_hw_lm_destroy(struct dpu_hw_mixer *lm)
 {
-	if (lm)
+	if (lm) {
 		dpu_hw_dspp_destroy(lm->dspp);
+		dpu_hw_pingpong_destroy(lm->pingpong);
+	}
 	kfree(lm);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index effb78311a43..182740f2914b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -64,6 +64,7 @@ struct dpu_hw_mixer {
 	const struct dpu_lm_cfg   *cap;
 	const struct dpu_mdp_cfg  *mdp;
 	const struct dpu_ctl_cfg  *ctl;
+	struct dpu_hw_pingpong *pingpong;
 	struct dpu_hw_dspp *dspp;
 
 	/* ops */
@@ -83,16 +84,19 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_mixer, base);
 }
 
+struct dpu_hw_merge_3d;
 /**
  * dpu_hw_lm_init(): Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
  * @idx:  mixer index for which driver object is required
  * @addr: mapped register io address of MDP
  * @m :   pointer to mdss catalog data
+ * @merge_3d_blks: Pointer to merge 3d blocks
  */
 struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+		const struct dpu_mdss_cfg *m,
+		struct dpu_hw_merge_3d **merge_3d_blks);
 
 /**
  * dpu_hw_lm_destroy(): Destroys layer mixer driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index a9e960b8814b..a3db536210bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -149,6 +149,7 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
 	return container_of(hw, struct dpu_hw_pingpong, base);
 }
 
+struct dpu_rm;
 /**
  * dpu_hw_pingpong_init - initializes the pingpong driver for the passed
  *	pingpong idx.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 057fdf0ca9f4..0b936258bde0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -161,7 +161,6 @@ struct vsync_info {
 struct dpu_global_state {
 	struct drm_private_state base;
 
-	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2ddf02eda2e5..7792dff60bcd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -7,7 +7,6 @@
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
-#include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
@@ -41,14 +40,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_lm_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
-		struct dpu_hw_pingpong *hw;
-
-		if (rm->pingpong_blks[i]) {
-			hw = to_dpu_hw_pingpong(rm->pingpong_blks[i]);
-			dpu_hw_pingpong_destroy(hw);
-		}
-	}
 	for (i = 0; i < ARRAY_SIZE(rm->ctl_blks); i++) {
 		struct dpu_hw_ctl *hw;
 
@@ -85,24 +76,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 	memset(rm, 0, sizeof(*rm));
 
 	/* Interrogate HW catalog and create tracking items for hw blocks */
-	for (i = 0; i < cat->pingpong_count; i++) {
-		struct dpu_hw_pingpong *hw;
-		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
-
-		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
-			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
-			continue;
-		}
-		hw = dpu_hw_pingpong_init(pp->id, mmio, cat, dpu_kms->hw_merge_3d);
-		if (IS_ERR_OR_NULL(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed pingpong object creation: err %d\n",
-				rc);
-			goto fail;
-		}
-		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
-	}
-
 	for (i = 0; i < cat->intf_count; i++) {
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
@@ -154,7 +127,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
 			continue;
 		}
-		hw = dpu_hw_lm_init(lm->id, mmio, cat);
+		hw = dpu_hw_lm_init(lm->id, mmio, cat, dpu_kms->hw_merge_3d);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);
@@ -213,53 +186,6 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
 	return true;
 }
 
-/**
- * _dpu_rm_check_lm_and_get_connected_blks - check if proposed layer mixer meets
- *	proposed use case requirements, incl. hardwired dependent blocks like
- *	pingpong
- * @rm: dpu resource manager handle
- * @global_state: resources shared across multiple kms objects
- * @enc_id: encoder id requesting for allocation
- * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
- *      if lm, and all other hardwired blocks connected to the lm (pp) is
- *      available and appropriate
- * @pp_idx: output parameter, index of pingpong block attached to the layer
- *      mixer in rm->pingpong_blks[].
- * @reqs: input parameter, rm requirements for HW blocks needed in the
- *      datapath.
- * Return: true if lm matches all requirements, false otherwise
- */
-static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
-		struct dpu_global_state *global_state,
-		uint32_t enc_id, int lm_idx, int *pp_idx,
-		struct dpu_rm_requirements *reqs)
-{
-	const struct dpu_lm_cfg *lm_cfg;
-	int idx;
-
-	/* Already reserved? */
-	if (reserved_by_other(global_state->mixer_to_enc_id, lm_idx, enc_id)) {
-		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
-		return false;
-	}
-
-	lm_cfg = to_dpu_hw_mixer(rm->mixer_blks[lm_idx])->cap;
-	idx = lm_cfg->pingpong - PINGPONG_0;
-	if (idx < 0 || idx >= ARRAY_SIZE(rm->pingpong_blks)) {
-		DPU_ERROR("failed to get pp on lm %d\n", lm_cfg->pingpong);
-		return false;
-	}
-
-	if (reserved_by_other(global_state->pingpong_to_enc_id, idx, enc_id)) {
-		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
-				lm_cfg->pingpong);
-		return false;
-	}
-	*pp_idx = idx;
-
-	return true;
-}
-
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
 			       uint32_t enc_id,
@@ -267,7 +193,6 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 {
 	int lm_idx[MAX_BLOCKS];
-	int pp_idx[MAX_BLOCKS];
 	int i, j, lm_count = 0;
 
 	if (!reqs->topology.num_lm) {
@@ -284,9 +209,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		lm_count = 0;
 		lm_idx[lm_count] = i;
 
-		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
-				enc_id, i, &pp_idx[lm_count],
-				reqs)) {
+		if (reserved_by_other(global_state->mixer_to_enc_id, i, enc_id)) {
+			DPU_DEBUG("lm %d already reserved\n", i + LM_0);
 			continue;
 		}
 
@@ -304,10 +228,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 				continue;
 			}
 
-			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
-					global_state, enc_id, j,
-					&pp_idx[lm_count],
-					reqs)) {
+			if (reserved_by_other(global_state->mixer_to_enc_id, j, enc_id)) {
+				DPU_DEBUG("lm %d already reserved\n", j + LM_0);
 				continue;
 			}
 
@@ -323,10 +245,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 	for (i = 0; i < lm_count; i++) {
 		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
-		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 
-		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
-					 pp_idx[i] + PINGPONG_0);
+		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id);
 	}
 
 	return 0;
@@ -492,8 +412,6 @@ static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 void dpu_rm_release(struct dpu_global_state *global_state,
 		    struct drm_encoder *enc)
 {
-	_dpu_rm_clear_mapping(global_state->pingpong_to_enc_id,
-		ARRAY_SIZE(global_state->pingpong_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->mixer_to_enc_id,
 		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
@@ -548,11 +466,6 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	int i, num_blks, max_blks;
 
 	switch (type) {
-	case DPU_HW_BLK_PINGPONG:
-		hw_blks = rm->pingpong_blks;
-		hw_to_enc_id = global_state->pingpong_to_enc_id;
-		max_blks = ARRAY_SIZE(rm->pingpong_blks);
-		break;
 	case DPU_HW_BLK_LM:
 		hw_blks = rm->mixer_blks;
 		hw_to_enc_id = global_state->mixer_to_enc_id;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 4c0c15453c98..a618c0ef43db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -15,7 +15,6 @@ struct dpu_global_state;
 
 /**
  * struct dpu_rm - DPU dynamic hardware resource manager
- * @pingpong_blks: array of pingpong hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
@@ -23,7 +22,6 @@ struct dpu_global_state;
  * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
-	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 6714b088970f..23b587b10d77 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -835,20 +835,17 @@ DEFINE_EVENT(dpu_rm_iter_template, dpu_rm_reserve_ctls,
 );
 
 TRACE_EVENT(dpu_rm_reserve_lms,
-	TP_PROTO(uint32_t id, uint32_t enc_id, uint32_t pp_id),
-	TP_ARGS(id, enc_id, pp_id),
+	TP_PROTO(uint32_t id, uint32_t enc_id),
+	TP_ARGS(id, enc_id),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		id	)
 		__field(	uint32_t,		enc_id	)
-		__field(	uint32_t,		pp_id	)
 	),
 	TP_fast_assign(
 		__entry->id = id;
 		__entry->enc_id = enc_id;
-		__entry->pp_id = pp_id;
 	),
-	TP_printk("id:%d enc_id:%u pp_id:%u", __entry->id,
-		  __entry->enc_id, __entry->pp_id)
+	TP_printk("id:%d enc_id:%u", __entry->id, __entry->enc_id)
 );
 
 TRACE_EVENT(dpu_vbif_wait_xin_halt_fail,
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
