Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE6347B56
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0726C6EC53;
	Wed, 24 Mar 2021 15:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC37F6EBFF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:37 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 184so30595062ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjHivPrqaqsAoJFEeR3ZaJm6gd/MnQRlxG1gYfEfS1Y=;
 b=iQqBJeEURzXhRjjS48/g8gQftOpvxwbzQ2AWxotoAjqHCEZ++BHc9yN8XaTPKf7iEH
 hb90+ZRMDwoVS3vBASY+D7vW7mBFdb5nOYJ7ItsYj9gI8fLdQ4brBu7GBh8edIM6a/aI
 GzhZ+HOCVWnOiEZcxl5iC/R+qJvsTWCFT2LFI3d5RknSrYScPvnaJS2lgU2JM5RfFWBP
 zbb48RCSgbNuQQ9Q2Uz6Tfotx22igOlJXEtE4HjARrFyOcrSnGNGhS/u+yEnhu147zv5
 Mv77uzVH1M28kcz8ba/+mbR5cfP+9t7dVsH0SzlkaDWgegg56HWsstFBNiMTotwjCrKr
 58bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjHivPrqaqsAoJFEeR3ZaJm6gd/MnQRlxG1gYfEfS1Y=;
 b=FOG/S1D00u0I+59Zz1aJ36NOWS9A+qmtMzY/GPv27cRumkd05bM5cg2YdVcubARLF7
 pYatljKaxeYR5srvwoqGzhPugWmmkWe0KtUmzmBY/mug1TzJRKabpelO4POTA+XxJFrS
 XYOGrs+kuYXP7tZy12Qxh7XXXR34NFqvejSkRz6DRajgq2K2eRV6gtjLdb5sMAxJFNHE
 QlsvJ6c6djo3w8Uvg3zXV+c3OXBSUoib1QMBldnByplSqRBf8TtfqoPjJ90IEwwL1ctu
 meGTa35faFzJDA3wHXisdkXkQmh3yuueVvl7gfGer424JGFUy4thhwDFexp7uIlpK2e5
 5hMw==
X-Gm-Message-State: AOAM533912t+wHQzI1fRAjBJjepEW9B5LxmCJ0qIoqdpaUb3rWf2OfFn
 sltlajXjtnCRc9OuKdGXXS2SoA==
X-Google-Smtp-Source: ABdhPJwzc7RAGodZqGlojo69Aha0EeGzkDU+EsMn5qL5x4MVqe1397aPlyiT7ER/jOMZJFCugJt29Q==
X-Received: by 2002:a2e:8e78:: with SMTP id t24mr2413984ljk.161.1616598036186; 
 Wed, 24 Mar 2021 08:00:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 05/21] drm/msm/dpu: get MERGE_3D blocks directly rather than
 through RM
Date: Wed, 24 Mar 2021 18:00:08 +0300
Message-Id: <20210324150024.2768215-6-dmitry.baryshkov@linaro.org>
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

MERGE_3D blocks are not really handled by resource manager, they are
used by corresponding PP blocks directly, each merge_3d is used by two
known PP blocks. So allocate them outside of RM and use them directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 11 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  7 +++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  6 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 27 +++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 36 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  8 ++---
 7 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 9a69fad832cd..e77a68c2fc73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -284,7 +284,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
 	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
 	if (phys_enc->hw_pp->merge_3d)
-		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->id;
+		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
@@ -298,11 +298,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 				true,
 				phys_enc->hw_pp->idx);
 
-	if (phys_enc->hw_pp->merge_3d) {
-		struct dpu_hw_merge_3d *merge_3d = to_dpu_hw_merge_3d(phys_enc->hw_pp->merge_3d);
-
-		merge_3d->ops.setup_3d_mode(merge_3d, intf_cfg.mode_3d);
-	}
+	if (phys_enc->hw_pp->merge_3d)
+		phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d, intf_cfg.mode_3d);
 
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 
@@ -461,7 +458,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	ctl->ops.update_pending_flush_intf(ctl, phys_enc->hw_intf->idx);
 	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
-		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->id);
+		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 92cd724263ce..89c1123d957f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -8,6 +8,7 @@
 #include "dpu_hwio.h"
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_pingpong.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_kms.h"
 #include "dpu_trace.h"
 
@@ -263,7 +264,8 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+		const struct dpu_mdss_cfg *m,
+		struct dpu_hw_merge_3d **merge_3d_blks)
 {
 	struct dpu_hw_pingpong *c;
 	const struct dpu_pingpong_cfg *cfg;
@@ -282,6 +284,9 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 	c->caps = cfg;
 	_setup_pingpong_ops(c, c->caps->features);
 
+	if (cfg->merge_3d && cfg->merge_3d < MERGE_3D_MAX)
+		c->merge_3d = merge_3d_blks[cfg->merge_3d - MERGE_3D_0];
+
 	dpu_hw_blk_init(&c->base, DPU_HW_BLK_PINGPONG, idx);
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 845b9ce80e31..a9e960b8814b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -133,7 +133,7 @@ struct dpu_hw_pingpong {
 	/* pingpong */
 	enum dpu_pingpong idx;
 	const struct dpu_pingpong_cfg *caps;
-	struct dpu_hw_blk *merge_3d;
+	struct dpu_hw_merge_3d *merge_3d;
 
 	/* ops */
 	struct dpu_hw_pingpong_ops ops;
@@ -155,11 +155,13 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
  * @idx:  Pingpong index for which driver object is required
  * @addr: Mapped register io address of MDP
  * @m:    Pointer to mdss catalog data
+ * @merge_3d_blks: Pointer to merge 3d blocks
  * Returns: Error code or allocated dpu_hw_pingpong context
  */
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+		const struct dpu_mdss_cfg *m,
+		struct dpu_hw_merge_3d **merge_3d_blks);
 
 /**
  * dpu_hw_pingpong_destroy - destroys pingpong driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 85f2c3564c96..8e00214426bc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -22,6 +22,7 @@
 #include "dpu_kms.h"
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
+#include "dpu_hw_merge3d.h"
 #include "dpu_hw_vbif.h"
 #include "dpu_vbif.h"
 #include "dpu_encoder.h"
@@ -687,6 +688,16 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
+	/* After RM destroy, as PP blocks reference MERGE_3D blocks */
+	if (dpu_kms->catalog) {
+		for (i = 0; i < dpu_kms->catalog->merge_3d_count; i++) {
+			u32 merge_3d_idx = dpu_kms->catalog->merge_3d[i].id;
+
+			if ((merge_3d_idx < MERGE_3D_MAX) && dpu_kms->hw_merge_3d[merge_3d_idx])
+				dpu_hw_merge_3d_destroy(dpu_kms->hw_merge_3d[merge_3d_idx]);
+		}
+	}
+
 	if (dpu_kms->catalog)
 		dpu_hw_catalog_deinit(dpu_kms->catalog);
 	dpu_kms->catalog = NULL;
@@ -962,7 +973,21 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto power_error;
 	}
 
-	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
+	/* Before RM init so PP blocks can find MERGE_3D blocks */
+	for (i = 0; i < dpu_kms->catalog->merge_3d_count; i++) {
+		u32 merge_3d_idx = dpu_kms->catalog->merge_3d[i].id;
+
+		dpu_kms->hw_merge_3d[i] = dpu_hw_merge_3d_init(merge_3d_idx,
+				dpu_kms->mmio, dpu_kms->catalog);
+		if (IS_ERR(dpu_kms->hw_merge_3d[merge_3d_idx])) {
+			rc = PTR_ERR(dpu_kms->hw_merge_3d[merge_3d_idx]);
+			DPU_ERROR("failed to init merge_3d %d: %d\n", merge_3d_idx, rc);
+			dpu_kms->hw_merge_3d[merge_3d_idx] = NULL;
+			goto power_error;
+		}
+	}
+
+	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
 		goto power_error;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 195a854245fa..057fdf0ca9f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -123,6 +123,7 @@ struct dpu_kms {
 	bool rm_init;
 
 	struct dpu_hw_vbif *hw_vbif[VBIF_MAX];
+	struct dpu_hw_merge_3d *hw_merge_3d[MERGE_3D_MAX];
 	struct dpu_hw_mdp *hw_mdp;
 
 	bool has_danger_ctrl;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index bb03ff8b8c9f..2ddf02eda2e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -9,7 +9,6 @@
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_pingpong.h"
 #include "dpu_hw_intf.h"
-#include "dpu_hw_merge3d.h"
 #include "dpu_encoder.h"
 #include "dpu_trace.h"
 
@@ -50,14 +49,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_pingpong_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->merge_3d_blks); i++) {
-		struct dpu_hw_merge_3d *hw;
-
-		if (rm->merge_3d_blks[i]) {
-			hw = to_dpu_hw_merge_3d(rm->merge_3d_blks[i]);
-			dpu_hw_merge_3d_destroy(hw);
-		}
-	}
 	for (i = 0; i < ARRAY_SIZE(rm->ctl_blks); i++) {
 		struct dpu_hw_ctl *hw;
 
@@ -79,9 +70,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 }
 
 int dpu_rm_init(struct dpu_rm *rm,
-		struct dpu_mdss_cfg *cat,
-		void __iomem *mmio)
+		struct dpu_kms *dpu_kms)
 {
+	struct dpu_mdss_cfg *cat = dpu_kms->catalog;
+	void __iomem *mmio = dpu_kms->mmio;
 	int rc, i;
 
 	if (!rm || !cat || !mmio) {
@@ -93,24 +85,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 	memset(rm, 0, sizeof(*rm));
 
 	/* Interrogate HW catalog and create tracking items for hw blocks */
-	for (i = 0; i < cat->merge_3d_count; i++) {
-		struct dpu_hw_merge_3d *hw;
-		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
-
-		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
-			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
-			continue;
-		}
-		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
-			rc = PTR_ERR(hw);
-			DPU_ERROR("failed merge_3d object creation: err %d\n",
-				rc);
-			goto fail;
-		}
-		rm->merge_3d_blks[merge_3d->id - MERGE_3D_0] = &hw->base;
-	}
-
 	for (i = 0; i < cat->pingpong_count; i++) {
 		struct dpu_hw_pingpong *hw;
 		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
@@ -119,15 +93,13 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
 			continue;
 		}
-		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
+		hw = dpu_hw_pingpong_init(pp->id, mmio, cat, dpu_kms->hw_merge_3d);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
 				rc);
 			goto fail;
 		}
-		if (pp->merge_3d && pp->merge_3d < MERGE_3D_MAX)
-			hw->merge_3d = rm->merge_3d_blks[pp->merge_3d - MERGE_3D_0];
 		rm->pingpong_blks[pp->id - PINGPONG_0] = &hw->base;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 91952af6c75b..4c0c15453c98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -27,22 +27,20 @@ struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
-	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 
 	uint32_t lm_max_width;
 };
 
+struct dpu_kms;
 /**
  * dpu_rm_init - Read hardware catalog and create reservation tracking objects
  *	for all HW blocks.
  * @rm: DPU Resource Manager handle
- * @cat: Pointer to hardware catalog
- * @mmio: mapped register io address of MDP
+ * @dpu_kms: DPU KMS data
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_init(struct dpu_rm *rm,
-		struct dpu_mdss_cfg *cat,
-		void __iomem *mmio);
+		struct dpu_kms *dpu_kms);
 
 /**
  * dpu_rm_destroy - Free all memory allocated by dpu_rm_init
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
