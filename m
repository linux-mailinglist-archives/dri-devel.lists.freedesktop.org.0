Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28792485C22
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 00:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8A210E3F5;
	Wed,  5 Jan 2022 23:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947C110E1F6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 23:10:40 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id k27so1276166ljc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 15:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtxeCNXCAlCxjAJdQI0NXa+A49s23ASjB/ARJonwM0w=;
 b=AzVUrvGc07ok5WA8w6p3WjJmW7uh1UaxWpF+Bv+IzWSfemWvMUX9H7vLrkhgvP1wlY
 hwtgfA2aqa1j1lfMVv5QHm8Z2htwKPrQWBvgY9CsGnabvMZzbuCu5VFZTA1HqxjqT6ah
 LXFAC5JM4XlcSnrqTz+qYQM/4I6B6bGor26v1GqorgsOjcYsdwUrsF+f+Yxw7bRDd39N
 2iKi2tjaR+4shFzFx4LAho0LjYJoCasoyXmAD9rK+FpmSl9KDP9UN1mfIXpf00kDQylA
 G03HJjeGixCttiMP8/MvoRZ8sfFH0ChH8hNiw4dlsYWMUbdbI8MlsNdzULUbnscQlUzk
 sSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtxeCNXCAlCxjAJdQI0NXa+A49s23ASjB/ARJonwM0w=;
 b=gA2fQZejjiwzvH2UhQI6epg41dtvhSEIgpsB34npNos55gdcK0SLY8C0Q6peuVZSE1
 6SaVm8FfpPID+DRJk9/+ENoqbN1atLMxhHEyuLzRhgY72zb5dcec5g3LBlozewJxWZym
 Fczv7ikPsjmOTFZqqiVPjBGYWKIl36onb9eHKaiW6oXPCTQNoBosbuEKnNY2qD4M1g+9
 R6p64YEjXxuzVX+VTkEu6nKYPGnYLf7lGmOi99EwlljIcWzVBmgKaST+cQy2zbgE+B5X
 b7I2qziMj08AJVvchgNuyF/TgyntPaSdWhSqQY+cQIieWTUGN+1NMrwFDKkw3GF3b6Lu
 NAVQ==
X-Gm-Message-State: AOAM532BNY+TSRVnoUmhGNNvuhOSuA1yctQ4UVeP16WZOzEpJPY8XaEn
 vma7VhYxJ1rUaVsxx/kBINjh5A==
X-Google-Smtp-Source: ABdhPJxePWFI5o4i3LfyxWDlTecjNGOa4xvYwJ+PxdSvNpiqHQEtsx7jznuiuw803U9hREuLiZGeXA==
X-Received: by 2002:a2e:bf24:: with SMTP id c36mr29384574ljr.117.1641424238909; 
 Wed, 05 Jan 2022 15:10:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:10:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v4 5/5] drm/msm/dpu: move VBIF blocks handling to dpu_rm
Date: Thu,  6 Jan 2022 02:10:31 +0300
Message-Id: <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move handling of VBIF blocks into dpu_rm. This serves the purpose of
unification of handling of all hardware blocks inside the DPU driver.
This removes hand-coded loops in dpu_vbif (which look for necessary VBIF
instance by looping through the dpu_kms->hw_vbif and comparing
vbif_idx).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 28 +--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 21 ++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      | 12 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    | 26 ++++++-------------
 6 files changed, 42 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index 6417aa28d32c..895e86dabcb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -8,6 +8,7 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
+#include "dpu_hw_blk.h"
 
 struct dpu_hw_vbif;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 47fe11a84a77..4a1983d8561b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -782,8 +782,6 @@ static long dpu_kms_round_pixclk(struct msm_kms *kms, unsigned long rate,
 
 static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 {
-	int i;
-
 	if (dpu_kms->hw_intr)
 		dpu_hw_intr_destroy(dpu_kms->hw_intr);
 	dpu_kms->hw_intr = NULL;
@@ -791,15 +789,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 	/* safe to call these more than once during shutdown */
 	_dpu_kms_mmu_destroy(dpu_kms);
 
-	if (dpu_kms->catalog) {
-		for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-			u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
-
-			if ((vbif_idx < VBIF_MAX) && dpu_kms->hw_vbif[vbif_idx])
-				dpu_hw_vbif_destroy(dpu_kms->hw_vbif[vbif_idx]);
-		}
-	}
-
 	if (dpu_kms->rm_init)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
@@ -1027,7 +1016,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 {
 	struct dpu_kms *dpu_kms;
 	struct drm_device *dev;
-	int i, rc = -EINVAL;
+	int rc = -EINVAL;
 
 	if (!kms) {
 		DPU_ERROR("invalid kms\n");
@@ -1116,21 +1105,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto power_error;
 	}
 
-	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
-
-		dpu_kms->hw_vbif[i] = dpu_hw_vbif_init(vbif_idx,
-				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
-			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
-			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
-			dpu_kms->hw_vbif[vbif_idx] = NULL;
-			goto power_error;
-		}
-	}
-
 	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
 			_dpu_kms_get_clk(dpu_kms, "core"));
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 3f518c809e33..b96c901483ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -105,7 +105,6 @@ struct dpu_kms {
 	struct dpu_rm rm;
 	bool rm_init;
 
-	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index bf4d72356a12..2301ac114920 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -78,6 +78,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 		if (rm->hw_intf[i])
 			dpu_hw_intf_destroy(rm->hw_intf[i]);
 	}
+	for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++) {
+		if (rm->hw_vbif[i])
+			dpu_hw_vbif_destroy(rm->hw_vbif[i]);
+	}
 
 	return 0;
 }
@@ -212,6 +216,23 @@ int dpu_rm_init(struct dpu_rm *rm,
 		rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
 	}
 
+	for (i = 0; i < cat->vbif_count; i++) {
+		struct dpu_hw_vbif *hw;
+		const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
+
+		if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
+			DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
+			continue;
+		}
+		hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
+		if (IS_ERR_OR_NULL(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed vbif object creation: err %d\n", rc);
+			goto fail;
+		}
+		rm->hw_vbif[vbif->id - VBIF_0] = hw;
+	}
+
 	return 0;
 
 fail:
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 9b13200a050a..a15977bdceeb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -20,6 +20,7 @@ struct dpu_global_state;
  * @ctl_blks: array of ctl hardware resources
  * @hw_intf: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
+ * @hw_vbif: array of vbif hardware resources
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -28,6 +29,7 @@ struct dpu_rm {
 	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
+	struct dpu_hw_vbif *hw_vbif[VBIF_MAX - VBIF_0];
 };
 
 /**
@@ -95,5 +97,15 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
 	return rm->hw_intf[intf_idx - INTF_0];
 }
 
+/**
+ * dpu_rm_get_vbif - Return a struct dpu_hw_vbif instance given it's index.
+ * @rm: DPU Resource Manager handle
+ * @vbif_idx: VBIF's index
+ */
+static inline struct dpu_hw_vbif *dpu_rm_get_vbif(struct dpu_rm *rm, enum dpu_vbif vbif_idx)
+{
+	return rm->hw_vbif[vbif_idx - VBIF_0];
+}
+
 #endif /* __DPU_RM_H__ */
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 21d20373eb8b..00ac2aa81651 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -152,15 +152,10 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	struct dpu_hw_mdp *mdp;
 	bool forced_on = false;
 	u32 ot_lim;
-	int ret, i;
+	int ret;
 
 	mdp = dpu_kms->hw_mdp;
-
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx)
-			vbif = dpu_kms->hw_vbif[i];
-	}
+	vbif = dpu_rm_get_vbif(&dpu_kms->rm, params->vbif_idx);
 
 	if (!vbif || !mdp) {
 		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
@@ -216,14 +211,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 	mdp = dpu_kms->hw_mdp;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		if (dpu_kms->hw_vbif[i] &&
-				dpu_kms->hw_vbif[i]->idx == params->vbif_idx) {
-			vbif = dpu_kms->hw_vbif[i];
-			break;
-		}
-	}
-
+	vbif = dpu_rm_get_vbif(&dpu_kms->rm, params->vbif_idx);
 	if (!vbif || !vbif->cap) {
 		DPU_ERROR("invalid vbif %d\n", params->vbif_idx);
 		return;
@@ -261,8 +249,8 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 	struct dpu_hw_vbif *vbif;
 	u32 i, pnd, src;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		vbif = dpu_kms->hw_vbif[i];
+	for (i = VBIF_0; i < VBIF_MAX; i++) {
+		vbif = dpu_rm_get_vbif(&dpu_kms->rm, i);
 		if (vbif && vbif->ops.clear_errors) {
 			vbif->ops.clear_errors(vbif, &pnd, &src);
 			if (pnd || src) {
@@ -278,8 +266,8 @@ void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 	struct dpu_hw_vbif *vbif;
 	int i, j;
 
-	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
-		vbif = dpu_kms->hw_vbif[i];
+	for (i = VBIF_0; i < VBIF_MAX; i++) {
+		vbif = dpu_rm_get_vbif(&dpu_kms->rm, i);
 		if (vbif && vbif->cap && vbif->ops.set_mem_type) {
 			for (j = 0; j < vbif->cap->memtype_count; j++)
 				vbif->ops.set_mem_type(
-- 
2.34.1

