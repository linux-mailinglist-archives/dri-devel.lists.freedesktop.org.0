Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82C347B60
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 16:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998BD6EC7A;
	Wed, 24 Mar 2021 15:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6146EA20
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:49 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id 75so32424700lfa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlS3zRpPMgse9749bPkDUSuQVwNUKb3VFrOOXA8caNA=;
 b=ESB4Lv6+WQjAXnH86xlpfoIwqu0ElIzVVNbFSHSpdVLICYlRsXtatUJzUK0RyND5J3
 ASR201De53+zQY8S8HXgmXO8O7mvN940zYlXs4/mHFwqZ3LtWwlQm2lYPMg+ecQXDE7R
 Uu931MEvrf7CrnRNIV2CsQlm7U6I/+qwXX3qFrq+UAztsL/37I6ULelFFuoi58aaf1p8
 uu2oLKbB0aRXyo6obcHlwIBOTBa2wWmF78xsvw9Nxn/QMP6sDiB1D/jUfU+g6nE1/2Dp
 98L7anrEkJaYdq4BqvSH5caVYm7E2PhhpxB2J4Y3Z2xPJ8lulht1TLgth+Q2sbEtEv/z
 Utcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlS3zRpPMgse9749bPkDUSuQVwNUKb3VFrOOXA8caNA=;
 b=G/ZvOgTrSJVUf80aBqBZ4P85QB9uYDzb9tY5cbFCMjabfTfBt0OVdIh9CQDWvnXKwE
 w1WAjcyyA7doK53PoS76AjdAxBlkusMTy9+019T0AvzI0e1J57nH4rP0AUrMkgJxvC4O
 BF4k6p4w3PJNL2IsCBId1KXYBhm7YS8tPpO9wf6Ef1/C7YbbSrS1py3ke0NxahN4jw3S
 WQr/aXy6IabyBeYOo2Bek8JgcnEKAWa50WJB9+pkJvwLLdSoJkkcgriExH8LOf1kctLD
 ZNTuTpzSCJbDQI+w7hlEYM7+siPdwumrccCWS9j7jWzSGwSdlVneQ81bEvqMBPCHMThK
 D4Dg==
X-Gm-Message-State: AOAM530bNK1Os8jn5C/0+36jTvCjsQzhspuueykuZR59XvfyInfEFr5k
 0xpg+h1RuPTgOADIqfO8w9mI6w==
X-Google-Smtp-Source: ABdhPJw6mKlhdlg2Nr7Bbg54lMGjT4FkfnApmL+j/eO1waUSksOMCUAi4Y+z+EqROaj8OsgFT0tIvA==
X-Received: by 2002:a05:6512:b90:: with SMTP id
 b16mr2045859lfv.209.1616598047426; 
 Wed, 24 Mar 2021 08:00:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 14/21] drm/msm/dpu: call hw_pingpong ops directly
Date: Wed, 24 Mar 2021 18:00:17 +0300
Message-Id: <20210324150024.2768215-15-dmitry.baryshkov@linaro.org>
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

Replace dpu_hw_pingpong callbacks with direct functions calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  31 ++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  36 ++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 111 ++++++++----------
 4 files changed, 70 insertions(+), 112 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ac03f329491d..72a3cd08295e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -226,14 +226,14 @@ static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bp
 		dither_cfg.temporal_en = 0;
 		break;
 	default:
-		hw_pp->ops.setup_dither(hw_pp, NULL);
+		dpu_hw_pingpong_setup_dither(hw_pp, NULL);
 		return;
 	}
 
 	memcpy(&dither_cfg.matrix, dither_matrix,
 			sizeof(u32) * DITHER_MATRIX_SZ);
 
-	hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
+	dpu_hw_pingpong_setup_dither(hw_pp, &dither_cfg);
 }
 
 void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index adbd59326b99..0525db90f2c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -345,12 +345,6 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 
 	DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
 
-	if (!phys_enc->hw_pp->ops.setup_tearcheck ||
-		!phys_enc->hw_pp->ops.enable_tearcheck) {
-		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-		return;
-	}
-
 	dpu_kms = phys_enc->dpu_kms;
 
 	/*
@@ -401,8 +395,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 		phys_enc->hw_pp->idx - PINGPONG_0, tc_cfg.sync_cfg_height,
 		tc_cfg.sync_threshold_start, tc_cfg.sync_threshold_continue);
 
-	phys_enc->hw_pp->ops.setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
-	phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, tc_enable);
+	dpu_hw_pingpong_setup_tearcheck(phys_enc->hw_pp, &tc_cfg);
+	dpu_hw_pingpong_enable_tearcheck(phys_enc->hw_pp, tc_enable);
 }
 
 static void _dpu_encoder_phys_cmd_pingpong_config(
@@ -479,11 +473,11 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
 static void _dpu_encoder_phys_cmd_connect_te(
 		struct dpu_encoder_phys *phys_enc, bool enable)
 {
-	if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.connect_external_te)
+	if (!phys_enc->hw_pp)
 		return;
 
 	trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
-	phys_enc->hw_pp->ops.connect_external_te(phys_enc->hw_pp, enable);
+	dpu_hw_pingpong_connect_external_te(phys_enc->hw_pp, enable);
 }
 
 static void dpu_encoder_phys_cmd_prepare_idle_pc(
@@ -495,19 +489,13 @@ static void dpu_encoder_phys_cmd_prepare_idle_pc(
 static int dpu_encoder_phys_cmd_get_line_count(
 		struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_hw_pingpong *hw_pp;
-
 	if (!phys_enc->hw_pp)
 		return -EINVAL;
 
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return -EINVAL;
 
-	hw_pp = phys_enc->hw_pp;
-	if (!hw_pp->ops.get_line_count)
-		return -EINVAL;
-
-	return hw_pp->ops.get_line_count(hw_pp);
+	return dpu_hw_pingpong_get_line_count(phys_enc->hw_pp);
 }
 
 static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
@@ -528,8 +516,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
-	if (phys_enc->hw_pp->ops.enable_tearcheck)
-		phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
+	dpu_hw_pingpong_enable_tearcheck(phys_enc->hw_pp, false);
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 }
 
@@ -582,7 +569,7 @@ static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
 	if (!phys_enc)
 		return false;
 
-	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
+	dpu_hw_pingpong_get_vsync_info(phys_enc->hw_pp, &info);
 	if (info.wr_ptr_line_count > 0 &&
 	    info.wr_ptr_line_count < phys_enc->cached_mode.vdisplay)
 		return true;
@@ -605,7 +592,7 @@ static void dpu_encoder_phys_cmd_prepare_commit(
 		return;
 
 	/* If autorefresh is already disabled, we have nothing to do */
-	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
+	if (!dpu_hw_pingpong_get_autorefresh(phys_enc->hw_pp, NULL))
 		return;
 
 	/*
@@ -617,7 +604,7 @@ static void dpu_encoder_phys_cmd_prepare_commit(
 	 * 5. Enable TE back
 	 */
 	_dpu_encoder_phys_cmd_connect_te(phys_enc, false);
-	phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
+	dpu_hw_pingpong_setup_autorefresh(phys_enc->hw_pp, 0, false);
 
 	do {
 		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 5c1ce835cf49..9c78dd06188b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -61,7 +61,7 @@ static const struct dpu_pingpong_cfg *_pingpong_offset(enum dpu_pingpong pp,
 	return ERR_PTR(-EINVAL);
 }
 
-static void dpu_hw_pp_setup_dither(struct dpu_hw_pingpong *pp,
+void dpu_hw_pingpong_setup_dither(struct dpu_hw_pingpong *pp,
 				    struct dpu_hw_dither_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -92,7 +92,7 @@ static void dpu_hw_pp_setup_dither(struct dpu_hw_pingpong *pp,
 	DPU_REG_WRITE(c, base + PP_DITHER_EN, 1);
 }
 
-static int dpu_hw_pp_setup_te_config(struct dpu_hw_pingpong *pp,
+int dpu_hw_pingpong_setup_tearcheck(struct dpu_hw_pingpong *pp,
 		struct dpu_hw_tear_check *te)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -122,7 +122,7 @@ static int dpu_hw_pp_setup_te_config(struct dpu_hw_pingpong *pp,
 	return 0;
 }
 
-static void dpu_hw_pp_setup_autorefresh_config(struct dpu_hw_pingpong *pp,
+void dpu_hw_pingpong_setup_autorefresh(struct dpu_hw_pingpong *pp,
 					       u32 frame_count, bool enable)
 {
 	DPU_REG_WRITE(&pp->hw, PP_AUTOREFRESH_CONFIG,
@@ -130,13 +130,13 @@ static void dpu_hw_pp_setup_autorefresh_config(struct dpu_hw_pingpong *pp,
 }
 
 /*
- * dpu_hw_pp_get_autorefresh_config - Get autorefresh config from HW
+ * dpu_hw_pingpong_get_autorefresh - Get autorefresh config from HW
  * @pp:          DPU pingpong structure
  * @frame_count: Used to return the current frame count from hw
  *
  * Returns: True if autorefresh enabled, false if disabled.
  */
-static bool dpu_hw_pp_get_autorefresh_config(struct dpu_hw_pingpong *pp,
+bool dpu_hw_pingpong_get_autorefresh(struct dpu_hw_pingpong *pp,
 					     u32 *frame_count)
 {
 	u32 val = DPU_REG_READ(&pp->hw, PP_AUTOREFRESH_CONFIG);
@@ -145,7 +145,7 @@ static bool dpu_hw_pp_get_autorefresh_config(struct dpu_hw_pingpong *pp,
 	return !!((val & BIT(31)) >> 31);
 }
 
-static int dpu_hw_pp_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp,
+int dpu_hw_pingpong_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp,
 		u32 timeout_us)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -162,7 +162,7 @@ static int dpu_hw_pp_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp,
 	return rc;
 }
 
-static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
+int dpu_hw_pingpong_enable_tearcheck(struct dpu_hw_pingpong *pp, bool enable)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -174,7 +174,7 @@ static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
 	return 0;
 }
 
-static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
+int dpu_hw_pingpong_connect_external_te(struct dpu_hw_pingpong *pp,
 		bool enable_external_te)
 {
 	struct dpu_hw_blk_reg_map *c = &pp->hw;
@@ -197,7 +197,7 @@ static int dpu_hw_pp_connect_external_te(struct dpu_hw_pingpong *pp,
 	return orig;
 }
 
-static int dpu_hw_pp_get_vsync_info(struct dpu_hw_pingpong *pp,
+int dpu_hw_pingpong_get_vsync_info(struct dpu_hw_pingpong *pp,
 		struct dpu_hw_pp_vsync_info *info)
 {
 	struct dpu_hw_blk_reg_map *c;
@@ -220,7 +220,7 @@ static int dpu_hw_pp_get_vsync_info(struct dpu_hw_pingpong *pp,
 	return 0;
 }
 
-static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
+u32 dpu_hw_pingpong_get_line_count(struct dpu_hw_pingpong *pp)
 {
 	struct dpu_hw_blk_reg_map *c = &pp->hw;
 	u32 height, init;
@@ -246,21 +246,6 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 	return line;
 }
 
-static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
-				unsigned long features)
-{
-	c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
-	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
-	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
-	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
-	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
-	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
-	c->ops.get_line_count = dpu_hw_pp_get_line_count;
-
-	c->ops.setup_dither = dpu_hw_pp_setup_dither;
-};
-
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 		void __iomem *addr,
 		const struct dpu_mdss_cfg *m,
@@ -281,7 +266,6 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
 
 	c->idx = idx;
 	c->caps = cfg;
-	_setup_pingpong_ops(c, c->caps->features);
 
 	if (cfg->merge_3d && cfg->merge_3d < MERGE_3D_MAX)
 		c->merge_3d = merge_3d_blks[cfg->merge_3d - MERGE_3D_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index a3db536210bf..78d2fed4c6a3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -56,75 +56,65 @@ struct dpu_hw_dither_cfg {
 	u32 matrix[DITHER_MATRIX_SZ];
 };
 
-/**
- *
- * struct dpu_hw_pingpong_ops : Interface to the pingpong Hw driver functions
+/*
  *  Assumption is these functions will be called after clocks are enabled
- *  @setup_tearcheck : program tear check values
- *  @enable_tearcheck : enables tear check
- *  @get_vsync_info : retries timing info of the panel
- *  @setup_autorefresh : configure and enable the autorefresh config
- *  @get_autorefresh : retrieve autorefresh config from hardware
- *  @setup_dither : function to program the dither hw block
- *  @get_line_count: obtain current vertical line counter
  */
-struct dpu_hw_pingpong_ops {
-	/**
-	 * enables vysnc generation and sets up init value of
-	 * read pointer and programs the tear check cofiguration
-	 */
-	int (*setup_tearcheck)(struct dpu_hw_pingpong *pp,
-			struct dpu_hw_tear_check *cfg);
 
-	/**
-	 * enables tear check block
-	 */
-	int (*enable_tearcheck)(struct dpu_hw_pingpong *pp,
-			bool enable);
+/**
+ * enables vysnc generation and sets up init value of
+ * read pointer and programs the tear check cofiguration
+ */
+int dpu_hw_pingpong_setup_tearcheck(struct dpu_hw_pingpong *pp,
+		struct dpu_hw_tear_check *cfg);
 
-	/**
-	 * read, modify, write to either set or clear listening to external TE
-	 * @Return: 1 if TE was originally connected, 0 if not, or -ERROR
-	 */
-	int (*connect_external_te)(struct dpu_hw_pingpong *pp,
-			bool enable_external_te);
+/**
+ * enables tear check block
+ */
+int dpu_hw_pingpong_enable_tearcheck(struct dpu_hw_pingpong *pp,
+		bool enable);
 
-	/**
-	 * provides the programmed and current
-	 * line_count
-	 */
-	int (*get_vsync_info)(struct dpu_hw_pingpong *pp,
-			struct dpu_hw_pp_vsync_info  *info);
+/**
+ * read, modify, write to either set or clear listening to external TE
+ * @Return: 1 if TE was originally connected, 0 if not, or -ERROR
+ */
+int dpu_hw_pingpong_connect_external_te(struct dpu_hw_pingpong *pp,
+		bool enable_external_te);
 
-	/**
-	 * configure and enable the autorefresh config
-	 */
-	void (*setup_autorefresh)(struct dpu_hw_pingpong *pp,
-				  u32 frame_count, bool enable);
+/**
+ * provides the programmed and current
+ * line_count
+ */
+int dpu_hw_pingpong_get_vsync_info(struct dpu_hw_pingpong *pp,
+		struct dpu_hw_pp_vsync_info  *info);
 
-	/**
-	 * retrieve autorefresh config from hardware
-	 */
-	bool (*get_autorefresh)(struct dpu_hw_pingpong *pp,
-				u32 *frame_count);
+/**
+ * configure and enable the autorefresh config
+ */
+void dpu_hw_pingpong_setup_autorefresh(struct dpu_hw_pingpong *pp,
+			  u32 frame_count, bool enable);
 
-	/**
-	 * poll until write pointer transmission starts
-	 * @Return: 0 on success, -ETIMEDOUT on timeout
-	 */
-	int (*poll_timeout_wr_ptr)(struct dpu_hw_pingpong *pp, u32 timeout_us);
+/**
+ * retrieve autorefresh config from hardware
+ */
+bool dpu_hw_pingpong_get_autorefresh(struct dpu_hw_pingpong *pp,
+			u32 *frame_count);
 
-	/**
-	 * Obtain current vertical line counter
-	 */
-	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
+/**
+ * poll until write pointer transmission starts
+ * @Return: 0 on success, -ETIMEDOUT on timeout
+ */
+int dpu_hw_pingpong_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp, u32 timeout_us);
 
-	/**
-	 * Setup dither matix for pingpong block
-	 */
-	void (*setup_dither)(struct dpu_hw_pingpong *pp,
-			struct dpu_hw_dither_cfg *cfg);
-};
+/**
+ * Obtain current vertical line counter
+ */
+u32 dpu_hw_pingpong_get_line_count(struct dpu_hw_pingpong *pp);
+
+/**
+ * Setup dither matix for pingpong block
+ */
+void dpu_hw_pingpong_setup_dither(struct dpu_hw_pingpong *pp,
+		struct dpu_hw_dither_cfg *cfg);
 
 struct dpu_hw_pingpong {
 	struct dpu_hw_blk base;
@@ -134,9 +124,6 @@ struct dpu_hw_pingpong {
 	enum dpu_pingpong idx;
 	const struct dpu_pingpong_cfg *caps;
 	struct dpu_hw_merge_3d *merge_3d;
-
-	/* ops */
-	struct dpu_hw_pingpong_ops ops;
 };
 
 /**
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
