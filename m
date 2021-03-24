Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF52347B6D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C9F6EC66;
	Wed, 24 Mar 2021 15:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B816EC66
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:54 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y1so30575217ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3IDca3nqOqXSyUNz10xakktCdMK2whJw+bAaBI3H+b0=;
 b=MBs5F0ZbZrDWAAbHQiQ9WCJfaZ3l97BCQV4VBlnjuBW4EIG5Pg0IxMftbqbzDEsvpn
 25U9gSUbKZC8BGhefMevlllp5cgJOXe4dORWNCZ4S68/b6bKywcRKT41TNBCcgHI0UAi
 kpQnopwW76o+pgNWSflc3KWEAsDx3bQh3j48LmnggsOJxT/YlgIVdj8ud/nCDVky8tOM
 7h7PnL4RboOy7vJAi4HZgjENCRfMqlh6PyDRWJ6E0FUAekkV239TX8ntNJWN3CMbHBer
 6NvYspaK6tCDjT3Gj6eyQ4rqWJO8v8u3Qlgf2mgfxQXAvoYXuhsl2ALSzTxvhYhWp8J9
 0vrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3IDca3nqOqXSyUNz10xakktCdMK2whJw+bAaBI3H+b0=;
 b=PM9SM43I/Qh2E54+sW9csjiUpuDBw/6MqsGqCDXiiCOkrqMQyE01SFxBqaQxP33EV2
 V5ppNTJiKOJhxOj1cp/xX09JHJ5pKMIwDT/FK+KVNR9xKjCIwXsEhgnAMyHUQuSI/xGd
 +dH9qBQEKnM0zF6gc3QLImJgZ9MUtP5ErzVkFfyhjcMjOqJE1VXKGGs7qb1FoW17k46Z
 s9KiI0Cr8AjecIe6DM4henOm6HDY0lClKTg9dGlv/h2uuhDnBq1DrFInF2QixZF6OEZ6
 h1hmGvNkU5q1XEs6XZch76cmJ7Ks3BD//YZVzfu6XCogHIHTaps2OWYV2n88GwlFkwqB
 tvGg==
X-Gm-Message-State: AOAM533csoBCv1NZtDs6eC7MAlGki5ReBqK27YuK/8vAqO3UuaE+Wodb
 CbslorCyvfz0d8ChroPYg5CLxOPQ8F0Nfg==
X-Google-Smtp-Source: ABdhPJzhMaESB3CKC/dNPBIX68KWCfG+OpkVcyB9YQpzh7jm+fvmmgQTJuz9m2beGBFl1uD9AWs+6w==
X-Received: by 2002:a2e:a545:: with SMTP id e5mr2485167ljn.134.1616598051136; 
 Wed, 24 Mar 2021 08:00:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 17/21] drm/msm/dpu: call hw_top ops directly
Date: Wed, 24 Mar 2021 18:00:20 +0300
Message-Id: <20210324150024.2768215-18-dmitry.baryshkov@linaro.org>
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

Replace dpu_hw_top callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  17 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  27 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  | 123 +++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c    |  15 ++-
 5 files changed, 79 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 72a3cd08295e..d8574b2e3abc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -505,8 +505,7 @@ void dpu_encoder_helper_split_config(
 	 * update.
 	 */
 	if (phys_enc->split_role == ENC_ROLE_SOLO) {
-		if (hw_mdptop->ops.setup_split_pipe)
-			hw_mdptop->ops.setup_split_pipe(hw_mdptop, &cfg);
+		dpu_hw_setup_split_pipe(hw_mdptop, &cfg);
 		return;
 	}
 
@@ -521,8 +520,7 @@ void dpu_encoder_helper_split_config(
 	if (phys_enc->split_role == ENC_ROLE_MASTER) {
 		DPU_DEBUG_ENC(dpu_enc, "enable %d\n", cfg.en);
 
-		if (hw_mdptop->ops.setup_split_pipe)
-			hw_mdptop->ops.setup_split_pipe(hw_mdptop, &cfg);
+		dpu_hw_setup_split_pipe(hw_mdptop, &cfg);
 	}
 }
 
@@ -674,8 +672,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		return;
 	}
 
-	if (hw_mdptop->ops.setup_vsync_source &&
-			disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
+	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
@@ -685,7 +682,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 		else
 			vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
 
-		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
+		dpu_hw_setup_vsync_source(hw_mdptop, &vsync_cfg);
 	}
 }
 
@@ -1095,10 +1092,8 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 
 	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
-		dpu_enc->cur_master->hw_mdptop &&
-		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
-		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
-			dpu_enc->cur_master->hw_mdptop);
+		dpu_enc->cur_master->hw_mdptop)
+		dpu_hw_intf_audio_select(dpu_enc->cur_master->hw_mdptop);
 
 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index dae77d9c2c74..4c213adedcc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -50,7 +50,7 @@
 
 #define DCE_SEL                           0x450
 
-static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
+void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 		struct split_pipe_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -88,7 +88,7 @@ static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 	DPU_REG_WRITE(c, SPLIT_DISPLAY_EN, cfg->en & 0x1);
 }
 
-static bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
+bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
 		enum dpu_clk_ctrl_type clk_ctrl, bool enable)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -122,7 +122,7 @@ static bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
 }
 
 
-static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
+void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
 		struct dpu_danger_safe_status *status)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -151,7 +151,7 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
 	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
 }
 
-static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
+void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
 		struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -219,7 +219,7 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
 	}
 }
 
-static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
+void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
 		struct dpu_danger_safe_status *status)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -248,7 +248,7 @@ static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
 	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x1;
 }
 
-static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
+void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -260,17 +260,6 @@ static void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp)
 	DPU_REG_WRITE(c, HDMI_DP_CORE_SELECT, 0x1);
 }
 
-static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
-		unsigned long cap)
-{
-	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
-	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
-	ops->get_danger_status = dpu_hw_get_danger_status;
-	ops->setup_vsync_source = dpu_hw_setup_vsync_source;
-	ops->get_safe_status = dpu_hw_get_safe_status;
-	ops->intf_audio_select = dpu_hw_intf_audio_select;
-}
-
 static const struct dpu_mdp_cfg *_top_offset(enum dpu_mdp mdp,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -315,12 +304,8 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
 		return ERR_PTR(-EINVAL);
 	}
 
-	/*
-	 * Assign ops
-	 */
 	mdp->idx = idx;
 	mdp->caps = cfg;
-	_setup_mdp_ops(&mdp->ops, mdp->caps->features);
 
 	dpu_hw_blk_init(&mdp->base, DPU_HW_BLK_TOP, idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index 8018fff5667a..6745711bf129 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -68,70 +68,66 @@ struct dpu_vsync_source_cfg {
 	u32 vsync_source;
 };
 
-/**
- * struct dpu_hw_mdp_ops - interface to the MDP TOP Hw driver functions
+/*
  * Assumption is these functions will be called after clocks are enabled.
- * @setup_split_pipe : Programs the pipe control registers
- * @setup_pp_split : Programs the pp split control registers
- * @setup_traffic_shaper : programs traffic shaper control
  */
-struct dpu_hw_mdp_ops {
-	/** setup_split_pipe() : Regsiters are not double buffered, thisk
-	 * function should be called before timing control enable
-	 * @mdp  : mdp top context driver
-	 * @cfg  : upper and lower part of pipe configuration
-	 */
-	void (*setup_split_pipe)(struct dpu_hw_mdp *mdp,
-			struct split_pipe_cfg *p);
-
-	/**
-	 * setup_traffic_shaper() : Setup traffic shaper control
-	 * @mdp  : mdp top context driver
-	 * @cfg  : traffic shaper configuration
-	 */
-	void (*setup_traffic_shaper)(struct dpu_hw_mdp *mdp,
-			struct traffic_shaper_cfg *cfg);
-
-	/**
-	 * setup_clk_force_ctrl - set clock force control
-	 * @mdp: mdp top context driver
-	 * @clk_ctrl: clock to be controlled
-	 * @enable: force on enable
-	 * @return: if the clock is forced-on by this function
-	 */
-	bool (*setup_clk_force_ctrl)(struct dpu_hw_mdp *mdp,
-			enum dpu_clk_ctrl_type clk_ctrl, bool enable);
-
-	/**
-	 * get_danger_status - get danger status
-	 * @mdp: mdp top context driver
-	 * @status: Pointer to danger safe status
-	 */
-	void (*get_danger_status)(struct dpu_hw_mdp *mdp,
-			struct dpu_danger_safe_status *status);
-
-	/**
-	 * setup_vsync_source - setup vsync source configuration details
-	 * @mdp: mdp top context driver
-	 * @cfg: vsync source selection configuration
-	 */
-	void (*setup_vsync_source)(struct dpu_hw_mdp *mdp,
-				struct dpu_vsync_source_cfg *cfg);
-
-	/**
-	 * get_safe_status - get safe status
-	 * @mdp: mdp top context driver
-	 * @status: Pointer to danger safe status
-	 */
-	void (*get_safe_status)(struct dpu_hw_mdp *mdp,
-			struct dpu_danger_safe_status *status);
-
-	/**
-	 * intf_audio_select - select the external interface for audio
-	 * @mdp: mdp top context driver
-	 */
-	void (*intf_audio_select)(struct dpu_hw_mdp *mdp);
-};
+
+/**
+ * dpu_hw_setup_split_pipe() : Regsiters are not double buffered, thisk
+ * function should be called before timing control enable
+ * @mdp  : mdp top context driver
+ * @cfg  : upper and lower part of pipe configuration
+ */
+void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
+		struct split_pipe_cfg *p);
+
+/**
+ * dpu_hw_setup_traffic_shaper() : Setup traffic shaper control
+ * @mdp  : mdp top context driver
+ * @cfg  : traffic shaper configuration
+ */
+void dpu_hw_setup_traffic_shaper(struct dpu_hw_mdp *mdp,
+		struct traffic_shaper_cfg *cfg);
+
+/**
+ * dpu_hw_setup_clk_force_ctrl - set clock force control
+ * @mdp: mdp top context driver
+ * @clk_ctrl: clock to be controlled
+ * @enable: force on enable
+ * @return: if the clock is forced-on by this function
+ */
+bool dpu_hw_setup_clk_force_ctrl(struct dpu_hw_mdp *mdp,
+		enum dpu_clk_ctrl_type clk_ctrl, bool enable);
+
+/**
+ * dpu_hw_get_danger_status - get danger status
+ * @mdp: mdp top context driver
+ * @status: Pointer to danger safe status
+ */
+void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
+		struct dpu_danger_safe_status *status);
+
+/**
+ * dpu_hw_setup_vsync_source - setup vsync source configuration details
+ * @mdp: mdp top context driver
+ * @cfg: vsync source selection configuration
+ */
+void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
+			struct dpu_vsync_source_cfg *cfg);
+
+/**
+ * dpu_hw_get_safe_status - get safe status
+ * @mdp: mdp top context driver
+ * @status: Pointer to danger safe status
+ */
+void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
+		struct dpu_danger_safe_status *status);
+
+/**
+ * dpu_hw_intf_audio_select - select the external interface for audio
+ * @mdp: mdp top context driver
+ */
+void dpu_hw_intf_audio_select(struct dpu_hw_mdp *mdp);
 
 struct dpu_hw_mdp {
 	struct dpu_hw_blk base;
@@ -140,9 +136,6 @@ struct dpu_hw_mdp {
 	/* top */
 	enum dpu_mdp idx;
 	const struct dpu_mdp_cfg *caps;
-
-	/* ops */
-	struct dpu_hw_mdp_ops ops;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8e00214426bc..28a52ebe1195 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -67,13 +67,11 @@ static int _dpu_danger_signal_status(struct seq_file *s,
 	pm_runtime_get_sync(&kms->pdev->dev);
 	if (danger_status) {
 		seq_puts(s, "\nDanger signal status:\n");
-		if (kms->hw_mdp->ops.get_danger_status)
-			kms->hw_mdp->ops.get_danger_status(kms->hw_mdp,
+		dpu_hw_get_danger_status(kms->hw_mdp,
 					&status);
 	} else {
 		seq_puts(s, "\nSafe signal status:\n");
-		if (kms->hw_mdp->ops.get_danger_status)
-			kms->hw_mdp->ops.get_danger_status(kms->hw_mdp,
+		dpu_hw_get_danger_status(kms->hw_mdp,
 					&status);
 	}
 	pm_runtime_put_sync(&kms->pdev->dev);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 7e08f40e7e6f..c9351c69834a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -168,9 +168,8 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	if (!mdp->ops.setup_clk_force_ctrl ||
-			!vbif->ops.set_limit_conf ||
-			!vbif->ops.set_halt_ctrl)
+	if (!vbif->ops.set_limit_conf ||
+	    !vbif->ops.set_halt_ctrl)
 		return;
 
 	/* set write_gather_en for all write clients */
@@ -185,7 +184,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
 		params->vbif_idx);
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
+	forced_on = dpu_hw_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
@@ -198,7 +197,7 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
 
 	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
+		dpu_hw_setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
@@ -229,7 +228,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	if (!vbif->ops.set_qos_remap || !mdp->ops.setup_clk_force_ctrl) {
+	if (!vbif->ops.set_qos_remap) {
 		DPU_DEBUG("qos remap not supported\n");
 		return;
 	}
@@ -242,7 +241,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
+	forced_on = dpu_hw_setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
 
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
 		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
@@ -253,7 +252,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 	}
 
 	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
+		dpu_hw_setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
