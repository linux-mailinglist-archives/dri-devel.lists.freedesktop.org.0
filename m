Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63946E51C8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE4C10E5F1;
	Mon, 17 Apr 2023 20:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ECA10E5E9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 20:21:54 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A75293F9A4;
 Mon, 17 Apr 2023 22:21:52 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Apr 2023 22:21:50 +0200
Subject: [PATCH v2 11/17] drm/msm/dpu: Disable MDP vsync source selection
 on DPU 5.0.0 and above
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v2-11-ef76c877eb97@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since hardware revision 5.0.0 the TE configuration moved out of the
PINGPONG block into the INTF block, including vsync source selection
that was previously part of MDP top.  Writing to the MDP_VSYNC_SEL
register has no effect anymore and is omitted downstream via the
DPU/SDE_MDP_VSYNC_SEL feature flag.  This flag is only added to INTF
blocks used by hardware prior to 5.0.0.

The code that writes to these registers in the INTF block will follow in
subsequent patches.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         | 52 +++++++++++++++-------
 4 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index b7845591c384..6906f8046b9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -30,7 +30,7 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x458,
-	.features = 0,
+	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 5b9b3b99f1b5..14ce397800d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -30,7 +30,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
+	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71584cd56fd7..599e177b89dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -48,6 +48,8 @@ enum {
  * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
  * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
  *			   in a failure
+ * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
+ *                         (moved into INTF block since DPU 5.0.0)
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -59,6 +61,7 @@ enum {
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_PERIPH_0_REMOVED,
+	DPU_MDP_VSYNC_SEL,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 2bb02e17ee52..9ea15a647a66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -126,28 +126,16 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
 	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
 }
 
-static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
+static void dpu_hw_setup_vsync_source_v1(struct dpu_hw_mdp *mdp,
 		struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
-	u32 reg, wd_load_value, wd_ctl, wd_ctl2, i;
-	static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
+	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
 
-	if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
+	if (!mdp || !cfg)
 		return;
 
 	c = &mdp->hw;
-	reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
-	for (i = 0; i < cfg->pp_count; i++) {
-		int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
-
-		if (pp_idx >= ARRAY_SIZE(pp_offset))
-			continue;
-
-		reg &= ~(0xf << pp_offset[pp_idx]);
-		reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
-	}
-	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
 
 	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
 			cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_0) {
@@ -194,6 +182,33 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
 	}
 }
 
+static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
+		struct dpu_vsync_source_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 reg, i;
+	static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
+
+	if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
+		return;
+
+	c = &mdp->hw;
+
+	reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
+	for (i = 0; i < cfg->pp_count; i++) {
+		int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
+
+		if (pp_idx >= ARRAY_SIZE(pp_offset))
+			continue;
+
+		reg &= ~(0xf << pp_offset[pp_idx]);
+		reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
+	}
+	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
+
+	dpu_hw_setup_vsync_source_v1(mdp, cfg);
+}
+
 static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
 		struct dpu_danger_safe_status *status)
 {
@@ -241,7 +256,12 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
 	ops->get_danger_status = dpu_hw_get_danger_status;
-	ops->setup_vsync_source = dpu_hw_setup_vsync_source;
+
+	if (cap & BIT(DPU_MDP_VSYNC_SEL))
+		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
+	else
+		ops->setup_vsync_source = dpu_hw_setup_vsync_source_v1;
+
 	ops->get_safe_status = dpu_hw_get_safe_status;
 
 	if (cap & BIT(DPU_MDP_AUDIO_SELECT))

-- 
2.40.0

