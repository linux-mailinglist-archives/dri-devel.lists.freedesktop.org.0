Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C47C68DB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD3110E47E;
	Thu, 12 Oct 2023 09:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9A710E471
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:01:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so662757f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697101295; x=1697706095; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AjfmFS20UYqlJ/taW09s08m2F8/Y0HJxKAV8Zh/Etqw=;
 b=BlkEhLuB2qPhrC7+pWC1YHyFOPnbu2GYfqYw+ndrkB1ST3zeQOyGgxbmFXWuSOCue6
 W/vthbS6ZrEioyVM7dQ2emeea+E/x0vSjVbXsq48e3FmJ4h3jPOZtaM3E45oyUq8nT8v
 bt5z5hcc+sB8yuCTsEtXR28OwgquLA5NNBhcgjaUFl+yxHYEx/aPmc8zQbNkH3r4X65D
 D9zzEmWNJA1kH9gsOxgwtmUPaV4bIenxpxKHO0ngvzdbFsJskhVPvmfPNfz4gmR7Ee6Y
 2Z0eDXQVi0aNipZ4SW2kFFei6t8SVM0eXt/VrTEnvzURLfghIeFu0ukFE92j/CsC1Cn/
 t2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101295; x=1697706095;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AjfmFS20UYqlJ/taW09s08m2F8/Y0HJxKAV8Zh/Etqw=;
 b=Ms0zF44cguWhv3Sgq6I0MsNqBLVQt+nB5iwiZaNVtN3ye915wRBUIJmCfOSxJp5nlB
 i3nnUdrVqf0FXSYLLOFAq69fLCqV6gCPWt70l+mbIVY1qEQbwc0HJRrwXJ+nHcLcr59k
 7yJTksL4jHXqc1PG//TOtceZrAiLyzyQnuwLpIdhELD6D4JmB5sGyNdsq+wfIniMfUBQ
 knTslqHWXujbShJUe127Lfydb+cweHEUNeWsJqYWmNAOzwmtOV7vXuBXT8TFociG2ZzL
 Gpc60m6B7eGvBiLYf+ihVi5NxRX+uaGhPMQqagSiKsa5ooEHy7VrsWr4V/4L7l73c7zv
 2yLA==
X-Gm-Message-State: AOJu0YzlphigL4O/+2sw5tQsNLKi9F89ZeVv7NXSZ61/FOOAfOB8PqDA
 bpUZUNSC2HWbT5OJlJWVoYok2Q==
X-Google-Smtp-Source: AGHT+IEwEc9MQ59m/leUNBTbXp9LGFkyp/vfLwP3aWIn42gU+Zg5Xam0Ss30Pa646TGHjKJp9+Qdjw==
X-Received: by 2002:a5d:6145:0:b0:31f:ec91:39a7 with SMTP id
 y5-20020a5d6145000000b0031fec9139a7mr21147464wrt.14.1697101295484; 
 Thu, 12 Oct 2023 02:01:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm17811176wru.35.2023.10.12.02.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:01:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 12 Oct 2023 11:01:28 +0200
Subject: [PATCH v3 2/5] drm/msm/dpu: add setup_clk_force_ctrl() op to sspp & wb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-2-4bcad69812d3@linaro.org>
References: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
In-Reply-To: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8737;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pujq/OOrCXK2eVO4M3+gODSxaN3YL6p2rQxE7QIJWXU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJ7XqOIxnO2laK5aCm7FLFPRr+2Y+LFaoEi3B5ZLN
 llIje+iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSe16gAKCRB33NvayMhJ0XRwD/
 9gJxHalBo9xSqpokhxT84v3+qE8YXn2s/6Wm5MJxAFkOAVnuGjfOFrX/kCsX656lB03ZYvx+8ddCGC
 JMTW9d/Xb2DHJDv1wnGDeq4nNoQyFhoTIymqnrRN19dqGPWerd8t+gzJ/fCwRvGM8BBr0yFKjXk8h2
 i6b9F3PEXJ77UHzXkNPRqvMuc5r38bdADxzqzNOfLrG44Y7a/FmDsWGkOx/j1juFLjUiAqXfePVmtO
 OALvcBWesv4MNDXNmjVMWHigWqThKHr8FutaBcyHFvFxOcrc30Rv+PolNixSz0Xs2QCHYHZumytg6a
 z+qjb5PqpKBpf30AlEf30iBJwWSqjXsUFMsED43Xk+Y1W8UsKEUQsgbI2jHJE6jvfv8JxuEIVoi0Ti
 V2Gt+xgsAR7JKxARmxsmGk9F/NXQz7QMwrsUQ0Vlmg9A1nAMd4To/c+T//TSL/AU9jujxK5YC05smA
 MRPMZt2qmp+lVr7rq78PoKUVvwGgfaMCh6BGb1SnFURVirk49LqjLwnJ10BD3TJwvbeL5m0nPwnUs3
 1r4CewdbMw60GLnQJYskk635a3msZbhx8yorm756GzDyy3hf/br6Vi92Dutm1kKswWXSLLyf9lGcI3
 1M+50FUBAytaMFdBiS8iwoQdxHPqA+z+81HaMcieUxEcc7CKz+tcBhZZtsuA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from SM8550, the SSPP & WB clock controls are moved
the SSPP and WB register range, as it's called "VBIF_CLK_SPLIT"
downstream.

Implement setup_clk_force_ctrl() only starting from major version 9
which corresponds to SM8550 MDSS.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 21 ++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 12 +++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   |  7 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  4 ++--
 5 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index f2192de93713..8e3c65989c49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -69,6 +69,7 @@
 #define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
+#define SSPP_CLK_CTRL                      0x330
 
 /* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
 #define MDSS_MDP_OP_DEINTERLACE            BIT(22)
@@ -581,8 +582,18 @@ static void dpu_hw_sspp_setup_cdp(struct dpu_sw_pipe *pipe,
 	dpu_setup_cdp(&ctx->hw, cdp_cntl_offset, fmt, enable);
 }
 
+static bool dpu_hw_sspp_setup_clk_force_ctrl(struct dpu_hw_sspp *ctx, bool enable)
+{
+	static const struct dpu_clk_ctrl_reg sspp_clk_ctrl = {
+		.reg_off = SSPP_CLK_CTRL,
+		.bit_off = 0
+	};
+
+	return dpu_hw_clk_force_ctrl(&ctx->hw, &sspp_clk_ctrl, enable);
+}
+
 static void _setup_layer_ops(struct dpu_hw_sspp *c,
-		unsigned long features)
+		unsigned long features, const struct dpu_mdss_version *mdss_rev)
 {
 	c->ops.setup_format = dpu_hw_sspp_setup_format;
 	c->ops.setup_rects = dpu_hw_sspp_setup_rects;
@@ -612,6 +623,9 @@ static void _setup_layer_ops(struct dpu_hw_sspp *c,
 
 	if (test_bit(DPU_SSPP_CDP, &features))
 		c->ops.setup_cdp = dpu_hw_sspp_setup_cdp;
+
+	if (mdss_rev->core_major_ver >= 9)
+		c->ops.setup_clk_force_ctrl = dpu_hw_sspp_setup_clk_force_ctrl;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -672,7 +686,8 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 #endif
 
 struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct msm_mdss_data *mdss_data)
+		void __iomem *addr, const struct msm_mdss_data *mdss_data,
+		const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_sspp *hw_pipe;
 
@@ -690,7 +705,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
-	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
+	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
 
 	return hw_pipe;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index cbf4f95ff0fd..f93969fddb22 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -271,6 +271,14 @@ struct dpu_hw_sspp_ops {
 	void (*setup_qos_ctrl)(struct dpu_hw_sspp *ctx,
 			       bool danger_safe_en);
 
+	/**
+	 * setup_clk_force_ctrl - setup clock force control
+	 * @ctx: Pointer to pipe context
+	 * @enable: enable clock force if true
+	 */
+	bool (*setup_clk_force_ctrl)(struct dpu_hw_sspp *ctx,
+				     bool enable);
+
 	/**
 	 * setup_histogram - setup histograms
 	 * @ctx: Pointer to pipe context
@@ -334,9 +342,11 @@ struct dpu_kms;
  * @cfg:  Pipe catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
  * @mdss_data: UBWC / MDSS configuration data
+ * @mdss_rev: dpu core's major and minor versions
  */
 struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct msm_mdss_data *mdss_data);
+		void __iomem *addr, const struct msm_mdss_data *mdss_data,
+		const struct dpu_mdss_version *mdss_rev);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index ebc416400382..9668fb97c047 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -43,6 +43,7 @@
 #define WB_MUX                                0x150
 #define WB_CROP_CTRL                          0x154
 #define WB_CROP_OFFSET                        0x158
+#define WB_CLK_CTRL                           0x178
 #define WB_CSC_BASE                           0x260
 #define WB_DST_ADDR_SW_STATUS                 0x2B0
 #define WB_CDP_CNTL                           0x2B4
@@ -175,8 +176,18 @@ static void dpu_hw_wb_bind_pingpong_blk(
 	DPU_REG_WRITE(c, WB_MUX, mux_cfg);
 }
 
+static bool dpu_hw_wb_setup_clk_force_ctrl(struct dpu_hw_wb *ctx, bool enable)
+{
+	static const struct dpu_clk_ctrl_reg wb_clk_ctrl = {
+		.reg_off = WB_CLK_CTRL,
+		.bit_off = 0
+	};
+
+	return dpu_hw_clk_force_ctrl(&ctx->hw, &wb_clk_ctrl, enable);
+}
+
 static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
-		unsigned long features)
+		unsigned long features, const struct dpu_mdss_version *mdss_rev)
 {
 	ops->setup_outaddress = dpu_hw_wb_setup_outaddress;
 	ops->setup_outformat = dpu_hw_wb_setup_format;
@@ -192,10 +203,13 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 
 	if (test_bit(DPU_WB_INPUT_CTRL, &features))
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
+
+	if (mdss_rev->core_major_ver >= 9)
+		ops->setup_clk_force_ctrl = dpu_hw_wb_setup_clk_force_ctrl;
 }
 
 struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
-		void __iomem *addr)
+		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_wb *c;
 
@@ -212,7 +226,7 @@ struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_wb_ops(&c->ops, c->caps->features);
+	_setup_wb_ops(&c->ops, c->caps->features, mdss_rev);
 
 	return c;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index 2d7db2efa3d0..88792f450a92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -29,6 +29,7 @@ struct dpu_hw_wb_cfg {
  *  @setup_outformat: setup output format of writeback block from writeback job
  *  @setup_qos_lut:   setup qos LUT for writeback block based on input
  *  @setup_cdp:       setup chroma down prefetch block for writeback block
+ *  @setup_clk_force_ctrl: setup clock force control
  *  @bind_pingpong_blk: enable/disable the connection with ping-pong block
  */
 struct dpu_hw_wb_ops {
@@ -48,6 +49,9 @@ struct dpu_hw_wb_ops {
 			  const struct dpu_format *fmt,
 			  bool enable);
 
+	bool (*setup_clk_force_ctrl)(struct dpu_hw_wb *ctx,
+				     bool enable);
+
 	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
 				  const enum dpu_pingpong pp);
 };
@@ -74,10 +78,11 @@ struct dpu_hw_wb {
  * dpu_hw_wb_init() - Initializes the writeback hw driver object.
  * @cfg:  wb_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_rev: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_wb context
  */
 struct dpu_hw_wb *dpu_hw_wb_init(const struct dpu_wb_cfg *cfg,
-		void __iomem *addr);
+		void __iomem *addr, const struct dpu_mdss_version *mdss_rev);
 
 /**
  * dpu_hw_wb_destroy(): Destroy writeback hw driver object.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643c71a..f363bcfdfd70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -175,7 +175,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_wb *hw;
 		const struct dpu_wb_cfg *wb = &cat->wb[i];
 
-		hw = dpu_hw_wb_init(wb, mmio);
+		hw = dpu_hw_wb_init(wb, mmio, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed wb object creation: err %d\n", rc);
@@ -231,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
+		hw = dpu_hw_sspp_init(sspp, mmio, mdss_data, cat->mdss_ver);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed sspp object creation: err %d\n", rc);

-- 
2.34.1

