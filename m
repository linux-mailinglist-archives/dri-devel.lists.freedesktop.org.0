Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B324B53A9CE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 17:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1264510EBCA;
	Wed,  1 Jun 2022 15:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B7310EBEF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 15:16:20 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y29so2350197ljd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2eSE4vtXMPto5OV84g5SX084sW0B2pU5dpSujoU3D/g=;
 b=V5LvxcGn5DtCsfNWzh4+XFTCGSgr7xAPzLFcC7etPamOMTJKhdNneMB5SUrVWMuHlj
 k39TiCkIeebHvGYig3xOb14yY5PidPVs8L67apfpo95Rk0LgmWxCWNFQ8cADO6EpFp5A
 VW5pyUgKcgm5JBO+2pvL4rsXzDC30/mPU7/e+qiOYYpJpNRhY1u99pHCwZUzDIPePTj5
 w4/evVUk5oYP4HnR+5AZ6AHzqiGE5W9w76BxwEV24wvWVpIw9Zjh1w6ZRoMq2c8GOYbK
 EdtZTBjoiqFzZ0viCnFl70caWt7sgiRr8MQc6++aE5momEPWBCtmHeK7VTjtHKFjvgXm
 na1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2eSE4vtXMPto5OV84g5SX084sW0B2pU5dpSujoU3D/g=;
 b=aXbbqzTZf6HnvtrCEFr1tVmhpwEacwaTHNGADWb/JOqqXcjCzCWZVRs2Ma+duheGEl
 lTZIhKdzscD0buUEd7NmPzMKT4xjpodfc1wMZU58J1PQ320LhjKyu4vg4KHnhbqJ57Du
 vL4iSbLX8r4IhvxY9ok8nKKls7J6zMLNy/oSIRHJUkcxIfWAUVtWTQZa0sUPz+U60+xi
 L7VXBHzzSt2S5ZqJaegb72ezuZxelrAeBnxOOKYB/Qgqpcf2q3m/iigZ7oscigxs+jRS
 FVubGA07FQkcogzIbRjsewYy7e615kfN7pJMZQ8YtkGFui4ndIx3NHvltfY9Yt+2ecvG
 uLQA==
X-Gm-Message-State: AOAM531rCwR5pnrhpA6/FMtn/GhDFuzmjO1VgGs4m1CvH/8nbpLQScZj
 9xULfYhEPQCLxPQag9HHTMtaAg==
X-Google-Smtp-Source: ABdhPJwuQxG6REyhN/2GCNrpukhFolyzb2TnBjv/d1ZV/ddSDK60pEzcxNFEsnDJRWf2W8HBGpzoPQ==
X-Received: by 2002:a2e:98cd:0:b0:253:df46:323e with SMTP id
 s13-20020a2e98cd000000b00253df46323emr35064213ljj.295.1654096578119; 
 Wed, 01 Jun 2022 08:16:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bp17-20020a056512159100b0047255d21186sm415294lfb.181.2022.06.01.08.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 08:16:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v1 4/5] drm/msm/dpu: constify struct dpu_mdss_cfg
Date: Wed,  1 Jun 2022 18:16:12 +0300
Message-Id: <20220601151613.1513554-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
References: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark struct dpu_mdss_cfg instance as a const pointer. This is mostly a
preparation for the next patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c       |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h       |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 11 +++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      |  9 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c          |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c         |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h         |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             |  8 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h             |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c           |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c              |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h              |  2 +-
 17 files changed, 31 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index a7492dd6ed65..c4139bc5de23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -413,7 +413,7 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	struct dpu_perf_cfg *cfg = &perf->catalog->perf;
+	const struct dpu_perf_cfg *cfg = &perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -468,7 +468,7 @@ static const struct file_operations dpu_core_perf_mode_fops = {
 int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 {
 	struct dpu_core_perf *perf = &dpu_kms->perf;
-	struct dpu_mdss_cfg *catalog = perf->catalog;
+	const struct dpu_mdss_cfg *catalog = perf->catalog;
 	struct dentry *entry;
 
 	entry = debugfs_create_dir("core_perf", parent);
@@ -517,7 +517,7 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
 
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
-		struct dpu_mdss_cfg *catalog,
+		const struct dpu_mdss_cfg *catalog,
 		struct clk *core_clk)
 {
 	perf->dev = dev;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 8dfcc6db7176..e3795995e145 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -68,7 +68,7 @@ struct dpu_core_perf_tune {
 struct dpu_core_perf {
 	struct drm_device *dev;
 	struct dentry *debugfs_root;
-	struct dpu_mdss_cfg *catalog;
+	const struct dpu_mdss_cfg *catalog;
 	struct clk *core_clk;
 	u64 core_clk_rate;
 	u64 max_core_clk_rate;
@@ -119,7 +119,7 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
  */
 int dpu_core_perf_init(struct dpu_core_perf *perf,
 		struct drm_device *dev,
-		struct dpu_mdss_cfg *catalog,
+		const struct dpu_mdss_cfg *catalog,
 		struct clk *core_clk);
 
 struct dpu_kms;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 52516eb20cb8..460df2a4831c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1207,7 +1207,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
-static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
+static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
@@ -1224,7 +1224,7 @@ static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
 	return INTF_MAX;
 }
 
-static enum dpu_wb dpu_encoder_get_wb(struct dpu_mdss_cfg *catalog,
+static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
 		enum dpu_intf_type type, u32 controller_id)
 {
 	int i = 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4829d1ce0cf8..53bb4639c8e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -103,8 +103,8 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_hw_wb_qos_cfg qos_cfg;
-	struct dpu_mdss_cfg *catalog;
-	struct dpu_qos_lut_tbl *qos_lut_tb;
+	const struct dpu_mdss_cfg *catalog;
+	const struct dpu_qos_lut_tbl *qos_lut_tb;
 
 	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
 		DPU_ERROR("invalid parameter(s)\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 367279371e8d..28fc11e8da4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1985,17 +1985,12 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
 };
 
-void dpu_hw_catalog_deinit(struct dpu_mdss_cfg *dpu_cfg)
-{
-	kfree(dpu_cfg);
-}
-
-struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
+const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev)
 {
 	int i;
 	struct dpu_mdss_cfg *dpu_cfg;
 
-	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
+	dpu_cfg = devm_kzalloc(dev, sizeof(*dpu_cfg), GFP_KERNEL);
 	if (!dpu_cfg)
 		return ERR_PTR(-ENOMEM);
 
@@ -2007,7 +2002,7 @@ struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
 	}
 
 	DPU_ERROR("unsupported chipset id:%X\n", hw_rev);
-	dpu_hw_catalog_deinit(dpu_cfg);
+
 	return ERR_PTR(-ENODEV);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4225f58d8f97..4e0d1ae21f6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -884,16 +884,11 @@ struct dpu_mdss_hw_cfg_handler {
 /**
  * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
  * hardcoded target specific catalog information in config structure
+ * @dev:          DPU device
  * @hw_rev:       caller needs provide the hardware revision.
  *
  * Return: dpu config structure
  */
-struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev);
-
-/**
- * dpu_hw_catalog_deinit - dpu hardware catalog cleanup
- * @dpu_cfg:      pointer returned from init function
- */
-void dpu_hw_catalog_deinit(struct dpu_mdss_cfg *dpu_cfg);
+const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev);
 
 #endif /* _DPU_HW_CATALOG_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 6f20d6b6dddd..184a1b27b13d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -158,7 +158,7 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
 }
 
 static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
-				       struct dpu_mdss_cfg *m,
+				       const struct dpu_mdss_cfg *m,
 				       void __iomem *addr,
 				       struct dpu_hw_blk_reg_map *b)
 {
@@ -186,7 +186,7 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 };
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
-				   struct dpu_mdss_cfg *m)
+				   const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_dsc *c;
 	struct dpu_dsc_cfg *cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index 164e5f5b1002..5fab8bbba764 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,7 @@ struct dpu_hw_dsc {
  * Returns: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
-				   struct dpu_mdss_cfg *m);
+				   const struct dpu_mdss_cfg *m);
 
 /**
  * dpu_hw_dsc_destroy - destroys dsc driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 01bb2d84c3a0..d83503ea2419 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -398,7 +398,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	return intr_status;
 }
 
-static void __intr_offset(struct dpu_mdss_cfg *m,
+static void __intr_offset(const struct dpu_mdss_cfg *m,
 		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
 {
 	hw->base_off = addr;
@@ -406,7 +406,7 @@ static void __intr_offset(struct dpu_mdss_cfg *m,
 }
 
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		struct dpu_mdss_cfg *m)
+		const struct dpu_mdss_cfg *m)
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 4154c5e2b4ae..46443955443c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -67,7 +67,7 @@ struct dpu_hw_intr {
  * @m :   pointer to mdss catalog data
  */
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
-		struct dpu_mdss_cfg *m);
+		const struct dpu_mdss_cfg *m);
 
 /**
  * dpu_hw_intr_destroy(): Cleanup interrutps hw object
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index ab7f1a4cc578..da4c7e4f304b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -761,7 +761,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms,
 
 static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 		void __iomem *addr,
-		struct dpu_mdss_cfg *catalog,
+		const struct dpu_mdss_cfg *catalog,
 		struct dpu_hw_blk_reg_map *b)
 {
 	int i;
@@ -782,7 +782,7 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
 }
 
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, struct dpu_mdss_cfg *catalog,
+		void __iomem *addr, const struct dpu_mdss_cfg *catalog,
 		bool is_virtual_pipe)
 {
 	struct dpu_hw_pipe *hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index a81e16657d61..7f7338fcddeb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -360,7 +360,7 @@ struct dpu_hw_sspp_ops {
 struct dpu_hw_pipe {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
-	struct dpu_mdss_cfg *catalog;
+	const struct dpu_mdss_cfg *catalog;
 	const struct dpu_mdp_cfg *mdp;
 
 	/* Pipe */
@@ -381,7 +381,7 @@ struct dpu_kms;
  * @is_virtual_pipe: is this pipe virtual pipe
  */
 struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
-		void __iomem *addr, struct dpu_mdss_cfg *catalog,
+		void __iomem *addr, const struct dpu_mdss_cfg *catalog,
 		bool is_virtual_pipe);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 2b9d931474e0..bba29c31f843 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -747,7 +747,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	unsigned int num_encoders;
 
 	struct msm_drm_private *priv;
-	struct dpu_mdss_cfg *catalog;
+	const struct dpu_mdss_cfg *catalog;
 
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
@@ -844,8 +844,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
 		dpu_rm_destroy(&dpu_kms->rm);
 	dpu_kms->rm_init = false;
 
-	if (dpu_kms->catalog)
-		dpu_hw_catalog_deinit(dpu_kms->catalog);
 	dpu_kms->catalog = NULL;
 
 	if (dpu_kms->vbif[VBIF_NRT])
@@ -907,7 +905,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 {
 	int i;
 	struct dpu_kms *dpu_kms;
-	struct dpu_mdss_cfg *cat;
+	const struct dpu_mdss_cfg *cat;
 	struct dpu_hw_mdp *top;
 
 	dpu_kms = to_dpu_kms(kms);
@@ -1095,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	pr_info("dpu hardware revision:0x%x\n", dpu_kms->core_rev);
 
-	dpu_kms->catalog = dpu_hw_catalog_init(dpu_kms->core_rev);
+	dpu_kms->catalog = dpu_hw_catalog_init(dev->dev, dpu_kms->core_rev);
 	if (IS_ERR_OR_NULL(dpu_kms->catalog)) {
 		rc = PTR_ERR(dpu_kms->catalog);
 		if (!dpu_kms->catalog)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 832a0769f2e7..ed80ed6784ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -69,7 +69,7 @@ struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
 	int core_rev;
-	struct dpu_mdss_cfg *catalog;
+	const struct dpu_mdss_cfg *catalog;
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9d2f0364d2c7..a747ffb96496 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -106,7 +106,7 @@ struct dpu_plane {
 	bool is_rt_pipe;
 	bool is_virtual;
 	struct list_head mplane_list;
-	struct dpu_mdss_cfg *catalog;
+	const struct dpu_mdss_cfg *catalog;
 };
 
 static const uint64_t supported_format_modifiers[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 06f03e7081bc..73b3442e7467 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -95,7 +95,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 }
 
 int dpu_rm_init(struct dpu_rm *rm,
-		struct dpu_mdss_cfg *cat,
+		const struct dpu_mdss_cfg *cat,
 		void __iomem *mmio)
 {
 	int rc, i;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 2f34a31d8d0d..59de72b381f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -42,7 +42,7 @@ struct dpu_rm {
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_init(struct dpu_rm *rm,
-		struct dpu_mdss_cfg *cat,
+		const struct dpu_mdss_cfg *cat,
 		void __iomem *mmio);
 
 /**
-- 
2.35.1

