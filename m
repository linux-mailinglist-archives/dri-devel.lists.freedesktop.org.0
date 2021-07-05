Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BE03BB4DC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 03:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1AC89BF1;
	Mon,  5 Jul 2021 01:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9299C89BFC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 01:25:21 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id t17so29604093lfq.0
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=47c58xNuBVy+HjyyUwDzPJ7gG0EJZF2uit+Xjm3vGpk=;
 b=THfowcWEIHKKRnHx7T9ErQQ7yGDwuPiwOBLhTb0tVAFfGL6wyGlJePupuP52m/ztVd
 K8DX8Hu/XyE7kY/NPhJqu/zy3X/DeedsHTNwSNcMGLS3NzX3bYco9lmgAHTBEIWBs9PZ
 xkyq//R11r3HdTM3MjGvmprzDjLY1Sg2L+f/0foTsNrzKN6YBmf7Kqh1Rsz6iB30hj8G
 oqiWuaU3Sd8y8pCi29XIbKwQ4Fji5sHJ416iEU9mJ1xi3TUmSnPhDYw/oTTQYukcwKT/
 fOe2p8RGiYshgc0jC14PgTwsdU4f9BqPQxW7951Ab0ZEyqlJ4q5yyHjTRKAd3K/ilUcY
 cAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=47c58xNuBVy+HjyyUwDzPJ7gG0EJZF2uit+Xjm3vGpk=;
 b=tyOkDCUXahC+Z1+MJfHLZQD35FaC8pohPAmYGHDduBjlkMx90e8laqXVTR9pUTOqei
 n0/2O4OH+eXhb8onrZqHcHVhHu9C9bV+8wT0oSEpNL8zbXfMt03xOozG0xiBZw054aFW
 ot1IvStVEpANPjz7ZrMHM9lvHOuIeXMdUPlqSDNoDRtvq5o3vJrljZ0k1d9qty4a0DmL
 9vKPux04997mTmSVywLEkgoDlq1Y/QSPk097OZb9Kv4Vu06Eeo0W0PWuNdG3jP5EBiCA
 5alaG5Xwsd3tq4BjuTi59OD6WfF7BlxQwgrrGlY0cuuZUgl1GEZpYF+gp+g7cafsJ8lx
 7cqw==
X-Gm-Message-State: AOAM533wHRJX95ZtlL+Bh0I+voUrIMi8SmHayMJBI6hHg7ruwBcOJ4+u
 CTXosYsWzn3JgT5GcSJBy0HLQQ==
X-Google-Smtp-Source: ABdhPJxnACshRINIgQcUAbT/5mdiOCWgm8gLAq5nUsrUgIuxb+iGn2wNrWo5J8ccebNR04SIPLIwSA==
X-Received: by 2002:a19:dc5e:: with SMTP id f30mr8717604lfj.318.1625448320035; 
 Sun, 04 Jul 2021 18:25:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 18:25:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 17/22] drm/msm/dpu: add support for SSPP allocation to RM
Date: Mon,  5 Jul 2021 04:21:10 +0300
Message-Id: <20210705012115.4179824-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
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

Add support for handling and allocting SSPP blocks through the resource
manager. Handling code is not converted to use it though.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 10 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 18 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 81 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  6 ++
 5 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 00098e33391e..c5ac8defa073 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -387,6 +387,16 @@ struct dpu_hw_pipe {
 	struct dpu_hw_sspp_ops ops;
 };
 
+/**
+ * to_dpu_hw_pipe - convert base object dpu_hw_base to container
+ * @hw: Pointer to base hardware block
+ * return: Pointer to hardware block container
+ */
+static inline struct dpu_hw_pipe *to_dpu_hw_pipe(struct dpu_hw_blk *hw)
+{
+	return container_of(hw, struct dpu_hw_pipe, base);
+}
+
 /**
  * dpu_hw_sspp_init - initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index ab65c817eb42..04a2ab548f54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -159,6 +159,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
+	uint32_t pipe_to_plane_id[SSPP_MAX - SSPP_NONE];
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3850f2714bf3..61008e8afb0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1234,8 +1234,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
-
 		kfree(pdpu);
 	}
 }
@@ -1389,14 +1387,13 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	pdpu->pipe = pipe;
 
 	/* initialize underlying h/w driver */
-	pdpu->pipe_hw = dpu_hw_sspp_init(pipe, kms->mmio, kms->catalog);
-	if (IS_ERR(pdpu->pipe_hw)) {
-		DPU_ERROR("[%u]SSPP init failed\n", pipe);
-		ret = PTR_ERR(pdpu->pipe_hw);
+	if (!kms->rm.sspp_blks[pipe - SSPP_NONE])
 		goto clean_plane;
-	} else if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
+	pdpu->pipe_hw = to_dpu_hw_pipe(kms->rm.sspp_blks[pipe - SSPP_NONE]);
+
+	if (!pdpu->pipe_hw->cap || !pdpu->pipe_hw->cap->sblk) {
 		DPU_ERROR("[%u]SSPP init returned invalid cfg\n", pipe);
-		goto clean_sspp;
+		goto clean_plane;
 	}
 
 	format_list = pdpu->pipe_hw->cap->sblk->format_list;
@@ -1406,7 +1403,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 				format_list, num_formats,
 				supported_format_modifiers, type, NULL);
 	if (ret)
-		goto clean_sspp;
+		goto clean_plane;
 
 	pdpu->catalog = kms->catalog;
 
@@ -1432,9 +1429,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 					pipe, plane->base.id);
 	return plane;
 
-clean_sspp:
-	if (pdpu && pdpu->pipe_hw)
-		dpu_hw_sspp_destroy(pdpu->pipe_hw);
 clean_plane:
 	kfree(pdpu);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..21c9e513f1f6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -8,6 +8,7 @@
 #include "dpu_hw_lm.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_sspp.h"
 #include "dpu_hw_intf.h"
 #include "dpu_hw_dspp.h"
 #include "dpu_hw_merge3d.h"
@@ -35,6 +36,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks); i++) {
+		struct dpu_hw_pipe *hw;
+
+		if (rm->sspp_blks[i]) {
+			hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
+			dpu_hw_sspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
@@ -166,6 +175,24 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->sspp_count; i++) {
+		struct dpu_hw_pipe *hw;
+		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
+
+		if (sspp->id <= SSPP_NONE || sspp->id >= SSPP_MAX) {
+			DPU_ERROR("skip sspp %d with invalid id\n", sspp->id);
+			continue;
+		}
+		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed sspp object creation: err %d\n",
+				rc);
+			goto fail;
+		}
+		rm->sspp_blks[sspp->id - SSPP_NONE] = &hw->base;
+	}
+
 	for (i = 0; i < cat->intf_count; i++) {
 		struct dpu_hw_intf *hw;
 		const struct dpu_intf_cfg *intf = &cat->intf[i];
@@ -660,3 +687,57 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale)
+{
+	int i;
+	enum dpu_sspp pipe = SSPP_NONE;
+	struct dpu_hw_pipe *pipe_hw;
+	bool retry = false;
+
+retry_loop:
+	for (i = 0; i < ARRAY_SIZE(rm->sspp_blks) && pipe == SSPP_NONE; i++) {
+		if (!rm->sspp_blks[i])
+			continue;
+		if (reserved_by_other(global_state->pipe_to_plane_id, i, plane_id))
+			continue;
+
+		pipe_hw = to_dpu_hw_pipe(rm->sspp_blks[i]);
+
+		/* skip incompatible planes */
+		if (scale && !(pipe_hw->cap->features & DPU_SSPP_SCALER))
+			continue;
+
+		if (yuv && (!(pipe_hw->cap->features & DPU_SSPP_SCALER) ||
+			    !(pipe_hw->cap->features & DPU_SSPP_CSC_ANY)))
+			continue;
+
+		/* For non-yuv, non-scaled planes try to find simple (DMA)
+		 * plane, fallback to VIG on a second try.
+		 *
+		 * This way we'd leave VIG pipes to be later used for YUV formats.
+		 */
+
+		if (!scale && !yuv && !retry &&
+		    (pipe_hw->cap->features & (DPU_SSPP_SCALER | DPU_SSPP_CSC_ANY)))
+			continue;
+
+		pipe = i + SSPP_NONE;
+	};
+
+	if (!scale && !yuv && !retry && pipe == SSPP_NONE) {
+		retry = true;
+		goto retry_loop;
+	}
+
+	if (pipe != SSPP_NONE)
+		global_state->pipe_to_plane_id[pipe - SSPP_NONE] = plane_id;
+
+	return pipe;
+}
+
+void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id)
+{
+	_dpu_rm_clear_mapping(global_state->pipe_to_plane_id,
+			ARRAY_SIZE(global_state->pipe_to_plane_id), plane_id);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..b759fe39f6d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -16,6 +16,7 @@ struct dpu_global_state;
 /**
  * struct dpu_rm - DPU dynamic hardware resource manager
  * @pingpong_blks: array of pingpong hardware resources
+ * @sspp_blks: array of sspp hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
@@ -25,6 +26,7 @@ struct dpu_global_state;
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
+	struct dpu_hw_blk *sspp_blks[SSPP_MAX - SSPP_NONE];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
@@ -88,5 +90,9 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
+
+enum dpu_sspp dpu_rm_get_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id, bool yuv, bool scale);
+void dpu_rm_release_sspp(struct dpu_rm *rm, struct dpu_global_state *global_state, uint32_t plane_id);
+
 #endif /* __DPU_RM_H__ */
 
-- 
2.30.2

