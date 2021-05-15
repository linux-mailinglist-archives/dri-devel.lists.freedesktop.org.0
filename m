Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FD381B98
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 00:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C176E456;
	Sat, 15 May 2021 22:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630AF6E456
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 22:58:02 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id w4so2752066ljw.9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yAdVAHX0DUpLEvZMk6JuLqTaqGiu1ixMcWIXbtyHNxM=;
 b=mb8pj9WCvdFLUcPExJx42vwYma1QNPoOrmJdIcRcDuuqQlxGEUr19he9413/1609up
 JCZpaYgIiqMXfBQ+pW+kvnOJ6XAGLPRo8ObVBFDyg2B+f+htEm4v+O0/zBygzWYYprA4
 md4UEIC0qpOdW4yBZdU32D//0nru37Q807AMNS/WRyd+oUx4Wh5R/tBjEp5dDhadWYbq
 QRRRQzdqwyyktV+wEIxRyqQGEORNxkgROkJtAYQGKk6XaZFyiu2dvzabcJpSGmlseIHj
 2QJlK1pBpQFcbtK+y3ZrlMhdthpGO5M5xzEbUWGBkkUtsrheUUmzqkR7VlmhAHptLnyC
 S1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yAdVAHX0DUpLEvZMk6JuLqTaqGiu1ixMcWIXbtyHNxM=;
 b=IPh6ExjBeEZ6TJUlAAUcN3PM0sxq7OZ2okN30GjgC3zL9C9QTbCjEK3OuWWTsM9LcF
 hM8ZsHhh8VBbfwAfX9a+ZLTDtm3gn5mJPH0wzWd1WcpsrsA2U6CTFq72Qwks8yad6pNB
 m8lDudqfdHoOcn2SU5GbdIYXeTLfTt2OplPPNktQbncZTmafwsjefUbFgFNqLQyD31CR
 mUao5Lsqrg27/ezfuBMEYGJbfbME5TmKogscPjacEigGhs5i+xJnPLUueaYSyeOaDpry
 2T50YgWa+F7TJsA2ko3NiCn4vpF/snpgvPWoCUF4l+qa8v1kxd2HbOEkJTfEhuoo43r+
 nIsg==
X-Gm-Message-State: AOAM533/d5Yhgg/PAPx97OJ5UjomzzI9JyRserINZjVnWz+oVPK3mQBS
 bgn0bxlDqCsmDUwBA6jirslS0gIl30cLpg==
X-Google-Smtp-Source: ABdhPJwJDqXYXcBjYPio8hIM0nbQl2EN+vOWyQ4cieoNkWRCmR9jHKHfmBVfkg8nrzmk2yqzIes+gQ==
X-Received: by 2002:a2e:814d:: with SMTP id t13mr41423262ljg.467.1621119480673; 
 Sat, 15 May 2021 15:58:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 15:58:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 1/6] drm/msm/dpu: get DSPP blocks directly rather than
 through RM
Date: Sun, 16 May 2021 01:57:52 +0300
Message-Id: <20210515225757.1989955-2-dmitry.baryshkov@linaro.org>
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

Each DSPP block is tied to a single LM. No LMs can share single DSPP
block. So there is no need to handle DSPP blocks through all resource
allocation/deallocation/assignment, just receive DSPP block as a part of
LM hardware instance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 50 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 -
 6 files changed, 11 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d942052db8a..2b750da8b30c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1007,7 +1007,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	int num_lm, num_ctl, num_pp;
 	int i, j;
 
@@ -1058,9 +1057,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1073,7 +1069,7 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = cstate->mixers[i].hw_lm->dspp;
 	}
 
 	cstate->num_mixers = num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index cb6bb7a22c15..7f02078db7e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -5,6 +5,7 @@
 #include "dpu_kms.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hwio.h"
+#include "dpu_hw_dspp.h"
 #include "dpu_hw_lm.h"
 #include "dpu_hw_mdss.h"
 
@@ -182,10 +183,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
 	c->cap = cfg;
 	_setup_mixer_ops(m, &c->ops, c->cap->features);
 
+	if (cfg->dspp && cfg->dspp < DSPP_MAX)
+		c->dspp = dpu_hw_dspp_init(cfg->dspp, addr, m);
+
 	return c;
 }
 
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
index f9c83d6e427a..6e7b5578cc81 100644
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
@@ -204,23 +203,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->ctl_blks[ctl->id - CTL_0] = &hw->base;
 	}
 
-	for (i = 0; i < cat->dspp_count; i++) {
-		struct dpu_hw_dspp *hw;
-		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
-
-		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
-			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
-			continue;
-		}
-		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed dspp object creation: err %d\n", rc);
-			goto fail;
-		}
-		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
-	}
-
 	return 0;
 
 fail:
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

