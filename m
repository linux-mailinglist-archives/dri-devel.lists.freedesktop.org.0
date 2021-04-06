Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAA354CDA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 08:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DAF6E7D3;
	Tue,  6 Apr 2021 06:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45130899DB;
 Tue,  6 Apr 2021 05:10:23 +0000 (UTC)
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 05 Apr 2021 22:10:23 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 05 Apr 2021 22:10:21 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
 by ironmsg02-blr.qualcomm.com with ESMTP; 06 Apr 2021 10:40:00 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
 id 1892A21B31; Tue,  6 Apr 2021 10:39:59 +0530 (IST)
From: Krishna Manikandan <mkrishn@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/4] drm/msm/disp/dpu1: add support for display for SC7280
 target
Date: Tue,  6 Apr 2021 10:39:49 +0530
Message-Id: <1617685792-14376-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
References: <1617685792-14376-1-git-send-email-mkrishn@codeaurora.org>
X-Mailman-Approved-At: Tue, 06 Apr 2021 06:25:33 +0000
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add required display hw catalog changes for SC7280 target.

Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 176 ++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c       |   6 +-
 drivers/gpu/drm/msm/msm_drv.c                  |   4 +-
 5 files changed, 177 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f353..ec27e6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -43,6 +43,9 @@
 #define PINGPONG_SDM845_SPLIT_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
 
+#define CTL_SC7280_MASK \
+	(BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_FETCH_ACTIVE))
+
 #define MERGE_3D_SM8150_MASK (0)
 
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
@@ -51,6 +54,8 @@
 
 #define INTF_SC7180_MASK BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE)
 
+#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
+
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
@@ -199,6 +204,18 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 };
 
+static const struct dpu_caps sc7280_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0x7,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
+	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
+	.ubwc_version = DPU_HW_UBWC_VER_30,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.max_linewidth = 2400,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
 static const struct dpu_mdp_cfg sdm845_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
@@ -268,6 +285,22 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	},
 };
 
+static const struct dpu_mdp_cfg sc7280_mdp[] = {
+	{
+	.name = "top_0", .id = MDP_TOP,
+	.base = 0x0, .len = 0x2014,
+	.highest_bank_bit = 0x1,
+	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
+		.reg_off = 0x2AC, .bit_off = 0},
+	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
+		.reg_off = 0x2AC, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
+		.reg_off = 0x2B4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
+		.reg_off = 0x2C4, .bit_off = 8},
+	},
+};
+
 /*************************************************************
  * CTL sub blocks config
  *************************************************************/
@@ -350,6 +383,29 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
 	},
 };
 
+static const struct dpu_ctl_cfg sc7280_ctl[] = {
+	{
+	.name = "ctl_0", .id = CTL_0,
+	.base = 0x15000, .len = 0x1E8,
+	.features = CTL_SC7280_MASK
+	},
+	{
+	.name = "ctl_1", .id = CTL_1,
+	.base = 0x16000, .len = 0x1E8,
+	.features = CTL_SC7280_MASK
+	},
+	{
+	.name = "ctl_2", .id = CTL_2,
+	.base = 0x17000, .len = 0x1E8,
+	.features = CTL_SC7280_MASK
+	},
+	{
+	.name = "ctl_3", .id = CTL_3,
+	.base = 0x18000, .len = 0x1E8,
+	.features = CTL_SC7280_MASK
+	},
+};
+
 /*************************************************************
  * SSPP sub blocks config
  *************************************************************/
@@ -475,6 +531,17 @@ static const struct dpu_sspp_cfg sm8250_sspp[] = {
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
 };
 
+static const struct dpu_sspp_cfg sc7280_sspp[] = {
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+		sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
+		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
+		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
+};
+
 /*************************************************************
  * MIXER sub blocks config
  *************************************************************/
@@ -550,6 +617,15 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
+static const struct dpu_lm_cfg sc7280_lm[] = {
+	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_0, 0, 0),
+	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_2, LM_3, 0),
+	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SC7180_MASK,
+		&sc7180_lm_sblk, PINGPONG_3, LM_2, 0),
+};
+
 /*************************************************************
  * DSPP sub blocks config
  *************************************************************/
@@ -602,42 +678,47 @@ static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
 		.len = 0x20, .version = 0x10000},
 };
 
-#define PP_BLK_TE(_name, _id, _base, _merge_3d) \
+static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
+	.dither = {.id = DPU_PINGPONG_DITHER, .base = 0xe0,
+	.len = 0x20, .version = 0x20000},
+};
+
+#define PP_BLK_TE(_name, _id, _base, _merge_3d, _sblk) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0xd4, \
 	.features = PINGPONG_SDM845_SPLIT_MASK, \
 	.merge_3d = _merge_3d, \
-	.sblk = &sdm845_pp_sblk_te \
+	.sblk = &_sblk \
 	}
-#define PP_BLK(_name, _id, _base, _merge_3d) \
+#define PP_BLK(_name, _id, _base, _merge_3d, _sblk) \
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0xd4, \
 	.features = PINGPONG_SDM845_MASK, \
 	.merge_3d = _merge_3d, \
-	.sblk = &sdm845_pp_sblk \
+	.sblk = &_sblk \
 	}
 
 static const struct dpu_pingpong_cfg sdm845_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0),
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, 0, sdm845_pp_sblk),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, 0, sdm845_pp_sblk),
 };
 
 static struct dpu_pingpong_cfg sc7180_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0),
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te),
 };
 
 static const struct dpu_pingpong_cfg sm8150_pp[] = {
-	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0),
-	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0),
-	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1),
-	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1),
-	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2),
-	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2),
+	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te),
+	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, MERGE_3D_0, sdm845_pp_sblk_te),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, MERGE_3D_1, sdm845_pp_sblk),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, MERGE_3D_1, sdm845_pp_sblk),
+	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, MERGE_3D_2, sdm845_pp_sblk),
+	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, MERGE_3D_2, sdm845_pp_sblk),
 };
 
 /*************************************************************
@@ -657,6 +738,12 @@ static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
+static const struct dpu_pingpong_cfg sc7280_pp[] = {
+	PP_BLK("pingpong_0", PINGPONG_0, 0x59000, 0, sc7280_pp_sblk),
+	PP_BLK("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk),
+	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk),
+	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk),
+};
 /*************************************************************
  * INTF sub blocks config
  *************************************************************/
@@ -689,6 +776,12 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
 	INTF_BLK("intf_3", INTF_3, 0x6B800, INTF_DP, 1, 24, INTF_SC7180_MASK),
 };
 
+static const struct dpu_intf_cfg sc7280_intf[] = {
+	INTF_BLK("intf_0", INTF_0, 0x34000, INTF_DP, 0, 24, INTF_SC7280_MASK),
+	INTF_BLK("intf_1", INTF_1, 0x35000, INTF_DSI, 0, 24, INTF_SC7280_MASK),
+	INTF_BLK("intf_5", INTF_5, 0x39000, INTF_EDP, 0, 24, INTF_SC7280_MASK),
+};
+
 /*************************************************************
  * VBIF sub blocks config
  *************************************************************/
@@ -896,6 +989,33 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	},
 };
 
+static const struct dpu_perf_cfg sc7280_perf_data = {
+	.max_bw_low = 4700000,
+	.max_bw_high = 8800000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 24,
+	.danger_lut_tbl = {0xffff, 0xffff, 0x0},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
 /*************************************************************
  * Hardware catalog init
  *************************************************************/
@@ -1026,6 +1146,29 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 	};
 }
 
+static void sc7280_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
+{
+	*dpu_cfg = (struct dpu_mdss_cfg){
+		.caps = &sc7280_dpu_caps,
+		.mdp_count = ARRAY_SIZE(sc7280_mdp),
+		.mdp = sc7280_mdp,
+		.ctl_count = ARRAY_SIZE(sc7280_ctl),
+		.ctl = sc7280_ctl,
+		.sspp_count = ARRAY_SIZE(sc7280_sspp),
+		.sspp = sc7280_sspp,
+		.mixer_count = ARRAY_SIZE(sc7280_lm),
+		.mixer = sc7280_lm,
+		.pingpong_count = ARRAY_SIZE(sc7280_pp),
+		.pingpong = sc7280_pp,
+		.intf_count = ARRAY_SIZE(sc7280_intf),
+		.intf = sc7280_intf,
+		.vbif_count = ARRAY_SIZE(sdm845_vbif),
+		.vbif = sdm845_vbif,
+		.perf = sc7280_perf_data,
+		.mdss_irqs = 0x1c07,
+	};
+}
+
 static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_400, .cfg_init = sdm845_cfg_init},
 	{ .hw_rev = DPU_HW_VER_401, .cfg_init = sdm845_cfg_init},
@@ -1033,6 +1176,7 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
 	{ .hw_rev = DPU_HW_VER_501, .cfg_init = sm8150_cfg_init},
 	{ .hw_rev = DPU_HW_VER_600, .cfg_init = sm8250_cfg_init},
 	{ .hw_rev = DPU_HW_VER_620, .cfg_init = sc7180_cfg_init},
+	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
 };
 
 void dpu_hw_catalog_deinit(struct dpu_mdss_cfg *dpu_cfg)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ea4647d..0cf7210 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -41,7 +41,7 @@
 #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
 #define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
 #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
-
+#define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
 
 #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
 #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
@@ -49,7 +49,7 @@
 #define IS_SDM670_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_410)
 #define IS_SDM855_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_500)
 #define IS_SC7180_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_620)
-
+#define IS_SC7280_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_720)
 
 #define DPU_HW_BLK_NAME_LEN	16
 
@@ -185,6 +185,7 @@ enum {
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_ACTIVE_CFG,
+	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_MAX
 };
 
@@ -193,11 +194,14 @@ enum {
  * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
  *                              pixel data arrives to this INTF
  * @DPU_INTF_TE                 INTF block has TE configuration support
+ * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
+                                than video timing
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
 	DPU_INTF_TE,
+	DPU_DATA_HCTL_EN,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 85f2c35..4620f67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -933,7 +933,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		DPU_DEBUG("REG_DMA is not defined");
 	}
 
-	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
+	if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss") ||
+		of_device_is_compatible(dev->dev->of_node, "qcom,sc7280-mdss"))
 		dpu_kms_parse_data_bus_icc_path(dpu_kms);
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
@@ -1221,6 +1222,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dpu", },
 	{ .compatible = "qcom,sc7180-dpu", },
+	{ .compatible = "qcom,sc7280-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index cd40788..fa2fedb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -204,6 +204,9 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 	case DPU_HW_VER_620:
 		writel_relaxed(0x1e, dpu_mdss->mmio + UBWC_STATIC);
 		break;
+	case DPU_HW_VER_720:
+		writel_relaxed(0x101e, dpu_mdss->mmio + UBWC_STATIC);
+		break;
 	}
 
 	return ret;
@@ -276,7 +279,8 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
 
-	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss")) {
+	if (!of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss") &&
+		!of_device_is_compatible(dev->dev->of_node, "qcom,sc7280-mdss")) {
 		ret = dpu_mdss_parse_data_bus_icc_path(dev, dpu_mdss);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a5c6b8c..e64f50a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1195,7 +1195,8 @@ static int add_display_components(struct device *dev,
 	 */
 	if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
 	    of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
-	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
+	    of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss") ||
+		of_device_is_compatible(dev->of_node, "qcom,sc7280-mdss")) {
 		ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
 		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to populate children devices\n");
@@ -1332,6 +1333,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
 	{ .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
 	{ .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
+	{ .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
