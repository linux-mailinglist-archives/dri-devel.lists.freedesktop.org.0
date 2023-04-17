Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE46E5511
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 01:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828D10E647;
	Mon, 17 Apr 2023 23:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2107C10E636
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 23:14:21 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AE8EC3F8D4;
 Tue, 18 Apr 2023 01:14:18 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 18 Apr 2023 01:14:18 +0200
Subject: [PATCH 3/3] drm/msm/dpu: Pass catalog pointers directly from RM
 instead of IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-dpu-drop-useless-for-lookup-v1-3-b9897ceb6f3e@somainline.org>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Resource Manager already iterates over all available blocks from the
catalog, only to pass their ID to a dpu_hw_xxx_init() function which
uses an _xxx_offset() helper to search for and find the exact same
catalog pointer again to initialize the block with, fallible error
handling and all.

Instead, pass const pointers to the catalog entries directly to these
_init functions and drop the for loops entirely, saving on both
readability complexity and unnecessary cycles at boot.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 30 +++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 10 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 33 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       |  8 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
 23 files changed, 127 insertions(+), 366 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index bbdc95ce374a..dec0111bf65e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -53,23 +53,6 @@ static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
 	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
 
-static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->ctl_count; i++) {
-		if (ctl == m->ctl[i].id) {
-			b->blk_addr = addr + m->ctl[i].base;
-			b->log_mask = DPU_DBG_MASK_CTL;
-			return &m->ctl[i];
-		}
-	}
-	return ERR_PTR(-ENOMEM);
-}
-
 static int _mixer_stages(const struct dpu_lm_cfg *mixer, int count,
 		enum dpu_lm lm)
 {
@@ -676,27 +659,22 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
 		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 };
 
-struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
+struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_ctl *c;
-	const struct dpu_ctl_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _ctl_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		pr_err("failed to create dpu_hw_ctl %d\n", idx);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
 	_setup_ctl_ops(&c->ops, c->caps->features);
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->mixer_count = m->mixer_count;
 	c->mixer_hw_caps = m->mixer;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 78611a831697..88f4f3eb98ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -261,13 +261,13 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 }
 
 /**
- * dpu_hw_ctl_init(): Initializes the ctl_path hw driver object.
- * should be called before accessing every ctl path registers.
- * @idx:  ctl_path index for which driver object is required
+ * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
+ * Should be called before accessing any ctl_path register.
+ * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
- * @m :   pointer to mdss catalog data
+ * @m:    pointer to MDSS catalog data
  */
-struct dpu_hw_ctl *dpu_hw_ctl_init(enum dpu_ctl idx,
+struct dpu_hw_ctl *dpu_hw_ctl_init(const struct dpu_ctl_cfg *cfg,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 4e1396575e6a..89e1a9f945c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -175,24 +175,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
-				       const struct dpu_mdss_cfg *m,
-				       void __iomem *addr,
-				       struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->dsc_count; i++) {
-		if (dsc == m->dsc[i].id) {
-			b->blk_addr = addr + m->dsc[i].base;
-			b->log_mask = DPU_DBG_MASK_DSC;
-			return &m->dsc[i];
-		}
-	}
-
-	return NULL;
-}
-
 static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 			   unsigned long cap)
 {
@@ -203,23 +185,19 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 };
 
-struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
-				   const struct dpu_mdss_cfg *m)
+struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
+				   void __iomem *addr)
 {
 	struct dpu_hw_dsc *c;
-	const struct dpu_dsc_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _dsc_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_DSC;
 
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->caps = cfg;
 	_setup_dsc_ops(&c->ops, c->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index ae9b5db53d7f..287ec5f1e170 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -61,14 +61,13 @@ struct dpu_hw_dsc {
 };
 
 /**
- * dpu_hw_dsc_init - initializes the dsc block for the passed dsc idx.
- * @idx:  DSC index for which driver object is required
+ * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
+ * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @m:    Pointer to mdss catalog data
- * Returns: Error code or allocated dpu_hw_dsc context
+ * Return: Error code or allocated dpu_hw_dsc context
  */
-struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
-				   const struct dpu_mdss_cfg *m);
+struct dpu_hw_dsc *dpu_hw_dsc_init(const struct dpu_dsc_cfg *cfg,
+		void __iomem *addr);
 
 /**
  * dpu_hw_dsc_destroy - destroys dsc driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 8ab5ace34a2d..9419b2209af8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -68,49 +68,23 @@ static void _setup_dspp_ops(struct dpu_hw_dspp *c,
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 }
 
-static const struct dpu_dspp_cfg *_dspp_offset(enum dpu_dspp dspp,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	if (!m || !addr || !b)
-		return ERR_PTR(-EINVAL);
-
-	for (i = 0; i < m->dspp_count; i++) {
-		if (dspp == m->dspp[i].id) {
-			b->blk_addr = addr + m->dspp[i].base;
-			b->log_mask = DPU_DBG_MASK_DSPP;
-			return &m->dspp[i];
-		}
-	}
-
-	return ERR_PTR(-EINVAL);
-}
-
-struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
-			void __iomem *addr,
-			const struct dpu_mdss_cfg *m)
+struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
+			void __iomem *addr)
 {
 	struct dpu_hw_dspp *c;
-	const struct dpu_dspp_cfg *cfg;
 
-	if (!addr || !m)
+	if (!addr)
 		return ERR_PTR(-EINVAL);
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _dspp_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_DSPP;
 
 	/* Assign ops */
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->cap = cfg;
 	_setup_dspp_ops(c, c->cap->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
index 05ecfdfac93b..bea965681330 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
@@ -79,14 +79,14 @@ static inline struct dpu_hw_dspp *to_dpu_hw_dspp(struct dpu_hw_blk *hw)
 }
 
 /**
- * dpu_hw_dspp_init - initializes the dspp hw driver object.
- * should be called once before accessing every dspp.
- * @idx:  DSPP index for which driver object is required
+ * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
+ * should be called once before accessing every DSPP.
+ * @cfg:  DSPP catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @Return: pointer to structure or ERR_PTR
+ * Return: pointer to structure or ERR_PTR
  */
-struct dpu_hw_dspp *dpu_hw_dspp_init(enum dpu_dspp idx,
-	void __iomem *addr, const struct dpu_mdss_cfg *m);
+struct dpu_hw_dspp *dpu_hw_dspp_init(const struct dpu_dspp_cfg *cfg,
+	void __iomem *addr);
 
 /**
  * dpu_hw_dspp_destroy(): Destroys DSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 425465011c80..bbf475a1cb45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -67,7 +67,7 @@ struct dpu_hw_intr {
 /**
  * dpu_hw_intr_init(): Initializes the interrupts hw object
  * @addr: mapped register io address of MDP
- * @m :   pointer to mdss catalog data
+ * @m:    pointer to MDSS catalog data
  */
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a9c90249a6ac..96e95984073b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -73,25 +73,6 @@
 #define INTF_MISR_CTRL			0x180
 #define INTF_MISR_SIGNATURE		0x184
 
-static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->intf_count; i++) {
-		if ((intf == m->intf[i].id) &&
-		(m->intf[i].type != INTF_NONE)) {
-			b->blk_addr = addr + m->intf[i].base;
-			b->log_mask = DPU_DBG_MASK_INTF;
-			return &m->intf[i];
-		}
-	}
-
-	return ERR_PTR(-EINVAL);
-}
-
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct intf_timing_params *p,
 		const struct dpu_format *fmt)
@@ -351,28 +332,27 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
 	ops->collect_misr = dpu_hw_intf_collect_misr;
 }
 
-struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
+		void __iomem *addr)
 {
 	struct dpu_hw_intf *c;
-	const struct dpu_intf_cfg *cfg;
+
+	if (cfg->type == INTF_NONE) {
+		pr_err("Cannot create interface hw object for INTF_NONE type\n");
+		return ERR_PTR(-EINVAL);
+	}
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _intf_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		pr_err("failed to create dpu_hw_intf %d\n", idx);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_INTF;
 
 	/*
 	 * Assign ops
 	 */
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->cap = cfg;
 	_setup_intf_ops(&c->ops, c->cap->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index e07b2e33af3e..102c4f0e812b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -96,15 +96,13 @@ struct dpu_hw_intf {
 };
 
 /**
- * dpu_hw_intf_init(): Initializes the intf driver for the passed
- * interface idx.
- * @idx:  interface index for which driver object is required
+ * dpu_hw_intf_init() - Initializes the INTF driver for the passed
+ * interface catalog entry.
+ * @cfg:  interface catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
- * @m :   pointer to mdss catalog data
  */
-struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
+		void __iomem *addr);
 
 /**
  * dpu_hw_intf_destroy(): Destroys INTF driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index f5120ea91ede..214f207ddf8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -30,24 +30,6 @@
 #define LM_MISR_SIGNATURE                0x314
 
 
-static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->mixer_count; i++) {
-		if (mixer == m->mixer[i].id) {
-			b->blk_addr = addr + m->mixer[i].base;
-			b->log_mask = DPU_DBG_MASK_LM;
-			return &m->mixer[i];
-		}
-	}
-
-	return ERR_PTR(-ENOMEM);
-}
-
 /**
  * _stage_offset(): returns the relative offset of the blend registers
  * for the stage to be setup
@@ -160,8 +142,7 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
-		struct dpu_hw_lm_ops *ops,
+static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
 		unsigned long features)
 {
 	ops->setup_mixer_out = dpu_hw_lm_setup_out;
@@ -175,27 +156,22 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 	ops->collect_misr = dpu_hw_lm_collect_misr;
 }
 
-struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
+		void __iomem *addr)
 {
 	struct dpu_hw_mixer *c;
-	const struct dpu_lm_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _lm_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_LM;
 
 	/* Assign ops */
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(m, &c->ops, c->cap->features);
+	_setup_mixer_ops(&c->ops, c->cap->features);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 652ddfdedec3..36992d046a53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -93,15 +93,13 @@ static inline struct dpu_hw_mixer *to_dpu_hw_mixer(struct dpu_hw_blk *hw)
 }
 
 /**
- * dpu_hw_lm_init(): Initializes the mixer hw driver object.
+ * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
- * @idx:  mixer index for which driver object is required
+ * @cfg:  mixer catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
- * @m :   pointer to mdss catalog data
  */
-struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
+		void __iomem *addr);
 
 /**
  * dpu_hw_lm_destroy(): Destroys layer mixer driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index def0a87fdba5..90e0e05eff8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -14,24 +14,6 @@
 #define MERGE_3D_MUX  0x000
 #define MERGE_3D_MODE 0x004
 
-static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->merge_3d_count; i++) {
-		if (idx == m->merge_3d[i].id) {
-			b->blk_addr = addr + m->merge_3d[i].base;
-			b->log_mask = DPU_DBG_MASK_PINGPONG;
-			return &m->merge_3d[i];
-		}
-	}
-
-	return ERR_PTR(-EINVAL);
-}
-
 static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
 			enum dpu_3d_blend_mode mode_3d)
 {
@@ -55,24 +37,19 @@ static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
 	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
 
-struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
+		void __iomem *addr)
 {
 	struct dpu_hw_merge_3d *c;
-	const struct dpu_merge_3d_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _merge_3d_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_PINGPONG;
 
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->caps = cfg;
 	_setup_merge_3d_ops(c, c->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index 81fd1d5f718e..19cec5e88722 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -46,16 +46,14 @@ static inline struct dpu_hw_merge_3d *to_dpu_hw_merge_3d(struct dpu_hw_blk *hw)
 }
 
 /**
- * dpu_hw_merge_3d_init - initializes the merge_3d driver for the passed
- *	merge_3d idx.
- * @idx:  Pingpong index for which driver object is required
+ * dpu_hw_merge_3d_init() - Initializes the merge_3d driver for the passed
+ * merge3d catalog entry.
+ * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @m:    Pointer to mdss catalog data
- * Returns: Error code or allocated dpu_hw_merge_3d context
+ * Return: Error code or allocated dpu_hw_merge_3d context
  */
-struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(enum dpu_merge_3d idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_merge_3d *dpu_hw_merge_3d_init(const struct dpu_merge_3d_cfg *cfg,
+		void __iomem *addr);
 
 /**
  * dpu_hw_merge_3d_destroy - destroys merge_3d driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 0fcad9760b6f..3822e0657767 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -42,24 +42,6 @@ static u32 dither_depth_map[DITHER_DEPTH_MAP_INDEX] = {
 	0, 0, 0, 0, 0, 0, 0, 1, 2
 };
 
-static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->pingpong_count; i++) {
-		if (pp == m->pingpong[i].id) {
-			b->blk_addr = addr + m->pingpong[i].base;
-			b->log_mask = DPU_DBG_MASK_PINGPONG;
-			return &m->pingpong[i];
-		}
-	}
-
-	return ERR_PTR(-EINVAL);
-}
-
 static void dpu_hw_pp_setup_dither(struct dpu_hw_pingpong *pp,
 				    struct dpu_hw_dither_cfg *cfg)
 {
@@ -290,24 +272,19 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
-struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
+		void __iomem *addr)
 {
 	struct dpu_hw_pingpong *c;
-	const struct dpu_pingpong_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _pingpong_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_PINGPONG;
 
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->caps = cfg;
 	_setup_pingpong_ops(c, c->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index c00223441d99..51e9093621a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -165,16 +165,14 @@ static inline struct dpu_hw_pingpong *to_dpu_hw_pingpong(struct dpu_hw_blk *hw)
 }
 
 /**
- * dpu_hw_pingpong_init - initializes the pingpong driver for the passed
- *	pingpong idx.
- * @idx:  Pingpong index for which driver object is required
+ * dpu_hw_pingpong_init() - initializes the pingpong driver for the passed
+ * pingpong catalog entry.
+ * @cfg:  Pingpong catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @m:    Pointer to mdss catalog data
- * Returns: Error code or allocated dpu_hw_pingpong context
+ * Return: Error code or allocated dpu_hw_pingpong context
  */
-struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
+		void __iomem *addr);
 
 /**
  * dpu_hw_pingpong_destroy - destroys pingpong driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index bb3ddec5c7d7..2407e10789bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -771,32 +771,10 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 }
 #endif
 
-
-static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *catalog,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	if ((sspp < SSPP_MAX) && catalog && addr && b) {
-		for (i = 0; i < catalog->sspp_count; i++) {
-			if (sspp == catalog->sspp[i].id) {
-				b->blk_addr = addr + catalog->sspp[i].base;
-				b->log_mask = DPU_DBG_MASK_SSPP;
-				return &catalog->sspp[i];
-			}
-		}
-	}
-
-	return ERR_PTR(-ENOMEM);
-}
-
-struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
+struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 		void __iomem *addr, const struct dpu_mdss_cfg *catalog)
 {
 	struct dpu_hw_sspp *hw_pipe;
-	const struct dpu_sspp_cfg *cfg;
 
 	if (!addr || !catalog)
 		return ERR_PTR(-EINVAL);
@@ -805,15 +783,12 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
 	if (!hw_pipe)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _sspp_offset(idx, addr, catalog, &hw_pipe->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(hw_pipe);
-		return ERR_PTR(-EINVAL);
-	}
+	hw_pipe->hw.blk_addr = addr + cfg->base;
+	hw_pipe->hw.log_mask = DPU_DBG_MASK_SSPP;
 
 	/* Assign ops */
 	hw_pipe->ubwc = catalog->ubwc;
-	hw_pipe->idx = idx;
+	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 5004a02fd61e..806035c5397f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -361,13 +361,13 @@ struct dpu_hw_sspp {
 
 struct dpu_kms;
 /**
- * dpu_hw_sspp_init - initializes the sspp hw driver object.
+ * dpu_hw_sspp_init() - Initializes the sspp hw driver object.
  * Should be called once before accessing every pipe.
- * @idx:  Pipe index for which driver object is required
+ * @cfg:  Pipe catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @catalog : Pointer to mdss catalog data
+ * @catalog: Pointer to MDSS catalog data
  */
-struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
+struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 		void __iomem *addr, const struct dpu_mdss_cfg *catalog);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
index 16c56e240706..a5121a50b2bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c
@@ -211,45 +211,22 @@ static void _setup_vbif_ops(struct dpu_hw_vbif_ops *ops,
 	ops->set_write_gather_en = dpu_hw_set_write_gather_en;
 }
 
-static const struct dpu_vbif_cfg *_top_offset(enum dpu_vbif vbif,
-		const struct dpu_mdss_cfg *m,
-		void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->vbif_count; i++) {
-		if (vbif == m->vbif[i].id) {
-			b->blk_addr = addr + m->vbif[i].base;
-			b->log_mask = DPU_DBG_MASK_VBIF;
-			return &m->vbif[i];
-		}
-	}
-
-	return ERR_PTR(-EINVAL);
-}
-
-struct dpu_hw_vbif *dpu_hw_vbif_init(enum dpu_vbif idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m)
+struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
+		void __iomem *addr)
 {
 	struct dpu_hw_vbif *c;
-	const struct dpu_vbif_cfg *cfg;
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _top_offset(idx, m, addr, &c->hw);
-	if (IS_ERR_OR_NULL(cfg)) {
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_VBIF;
 
 	/*
 	 * Assign ops
 	 */
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->cap = cfg;
 	_setup_vbif_ops(&c->ops, c->cap->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
index 6417aa28d32c..7e10d2a172b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h
@@ -106,14 +106,13 @@ struct dpu_hw_vbif {
 };
 
 /**
- * dpu_hw_vbif_init - initializes the vbif driver for the passed interface idx
- * @idx:  Interface index for which driver object is required
+ * dpu_hw_vbif_init() - Initializes the VBIF driver for the passed
+ * VBIF catalog entry.
+ * @cfg:  VBIF catalog entry for which driver object is required
  * @addr: Mapped register io address of MDSS
- * @m:    Pointer to mdss catalog data
  */
-struct dpu_hw_vbif *dpu_hw_vbif_init(enum dpu_vbif idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_vbif *dpu_hw_vbif_init(const struct dpu_vbif_cfg *cfg,
+		void __iomem *addr);
 
 void dpu_hw_vbif_destroy(struct dpu_hw_vbif *vbif);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index f33b48045b5c..4834866d72fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -52,22 +52,6 @@
 /* WB_QOS_CTRL */
 #define WB_QOS_CTRL_DANGER_SAFE_EN            BIT(0)
 
-static const struct dpu_wb_cfg *_wb_offset(enum dpu_wb wb,
-		const struct dpu_mdss_cfg *m, void __iomem *addr,
-		struct dpu_hw_blk_reg_map *b)
-{
-	int i;
-
-	for (i = 0; i < m->wb_count; i++) {
-		if (wb == m->wb[i].id) {
-			b->blk_addr = addr + m->wb[i].base;
-			b->log_mask = DPU_DBG_MASK_WB;
-			return &m->wb[i];
-		}
-	}
-	return ERR_PTR(-EINVAL);
-}
-
 static void dpu_hw_wb_setup_outaddress(struct dpu_hw_wb *ctx,
 		struct dpu_hw_wb_cfg *data)
 {
@@ -242,28 +226,23 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 }
 
-struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
-		void __iomem *addr, const struct dpu_mdss_cfg *m)
+struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
+		void __iomem *addr)
 {
 	struct dpu_hw_wb *c;
-	const struct dpu_wb_cfg *cfg;
 
-	if (!addr || !m)
+	if (!addr)
 		return ERR_PTR(-EINVAL);
 
 	c = kzalloc(sizeof(*c), GFP_KERNEL);
 	if (!c)
 		return ERR_PTR(-ENOMEM);
 
-	cfg = _wb_offset(idx, m, addr, &c->hw);
-	if (IS_ERR(cfg)) {
-		WARN(1, "Unable to find wb idx=%d\n", idx);
-		kfree(c);
-		return ERR_PTR(-EINVAL);
-	}
+	c->hw.blk_addr = addr + cfg->base;
+	c->hw.log_mask = DPU_DBG_MASK_WB;
 
 	/* Assign ops */
-	c->idx = idx;
+	c->idx = cfg->id;
 	c->caps = cfg;
 	_setup_wb_ops(&c->ops, c->caps->features);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index b91923f879f1..e4f85409c624 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -92,14 +92,13 @@ struct dpu_hw_wb {
 };
 
 /**
- * dpu_hw_wb_init(): Initializes and return writeback hw driver object.
- * @idx:  wb_path index for which driver object is required
+ * dpu_hw_wb_init() - Initializes the writeback hw driver object.
+ * @cfg:  wb_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
- * @m :   pointer to mdss catalog data
+ * Return: Error code or allocated dpu_hw_wb context
  */
-struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
-		void __iomem *addr,
-		const struct dpu_mdss_cfg *m);
+struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
+		void __iomem *addr);
 
 /**
  * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..c24f487db710 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1084,16 +1084,17 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	}
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
-		u32 vbif_idx = dpu_kms->catalog->vbif[i].id;
-
-		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
-				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
-			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
-			dpu_kms->hw_vbif[vbif_idx] = NULL;
+		struct dpu_hw_vbif *hw;
+		const struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
+
+		hw = dpu_hw_vbif_init(vbif, dpu_kms->vbif[vbif->id]);
+		if (IS_ERR(hw)) {
+			rc = PTR_ERR(hw);
+			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
 			goto power_error;
 		}
+
+		dpu_kms->hw_vbif[vbif->id] = hw;
 	}
 
 	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88a73f7..6ac2609ab8ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
 			continue;
 		}
-		hw = dpu_hw_lm_init(lm->id, mmio, cat);
+		hw = dpu_hw_lm_init(lm, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);
@@ -143,7 +143,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
 			continue;
 		}
-		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
+		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed merge_3d object creation: err %d\n",
@@ -161,7 +161,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
 			continue;
 		}
-		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
+		hw = dpu_hw_pingpong_init(pp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
@@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
 			continue;
 		}
-		hw = dpu_hw_intf_init(intf->id, mmio, cat);
+		hw = dpu_hw_intf_init(intf, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
@@ -203,7 +203,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 
-		hw = dpu_hw_wb_init(wb->id, mmio, cat);
+		hw = dpu_hw_wb_init(wb, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed wb object creation: err %d\n", rc);
@@ -220,7 +220,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
 			continue;
 		}
-		hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
+		hw = dpu_hw_ctl_init(ctl, mmio, cat);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);
@@ -237,7 +237,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
 			continue;
 		}
-		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
+		hw = dpu_hw_dspp_init(dspp, mmio);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dspp object creation: err %d\n", rc);
@@ -250,7 +250,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_dsc *hw;
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
-		hw = dpu_hw_dsc_init(dsc->id, mmio, cat);
+		hw = dpu_hw_dsc_init(dsc, mmio);
 		if (IS_ERR_OR_NULL(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dsc object creation: err %d\n", rc);
@@ -268,7 +268,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 
-		hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
+		hw = dpu_hw_sspp_init(sspp, mmio, cat);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed sspp object creation: err %d\n", rc);

-- 
2.40.0

