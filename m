Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21AABAB7E
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 19:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5810E19E;
	Sat, 17 May 2025 17:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dI72Me8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8308910E192;
 Sat, 17 May 2025 17:33:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A3C2EA4DFD5;
 Sat, 17 May 2025 17:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13959C4CEEF;
 Sat, 17 May 2025 17:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747503180;
 bh=Dw0TlSQr5Xv4frjpKjptRKWHQaaWSaOXl0Acqm3emwc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dI72Me8vGbHVBGHR0h5VsWRrbODt3OSl0BVvChcdCQAso6T7HjbuoWAAbWv0nHo+V
 cF0pUZnbxW9zXRRUW3NjWau0+xtWrsDTYTKJLBUJxSDP2RBCxURuW/Tw3KWQ8NP+32
 l+alGxOqeP2Lz5PEq7GTRKTUBnUbztUPhpu9eIE2v9dH0/ALZxurGZGkOstCevMc4K
 Gdw29tZCl7mavNbvgBXOm/SSwGkBE25uM9sSqovxGacuVtc+SDqqSI52bG4Z6WAbXS
 TU56g8SNk6UV9KHAPDdFOmz2TL1erpcn2Ad7P2+FuHr4XULd99JHsgzBi/whH8s5oa
 NFm8TRdtNBs+g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:37 +0200
Subject: [PATCH RFT v3 03/14] drm/msm: Use the central UBWC config database
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
In-Reply-To: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=21687;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=HSA7CBUgEyfFA8nAEU9KMXn+u1V2g79EvMQKtY5xKo8=;
 b=g2gbRK45AH43Aq8wIUYRgGNouQzd0GMvJ9SOV0SbRy2R5jL3jKdsTkCgJPk/v+aYj4vXl2uUV
 FM4HAMD4bLbCRI1n1V2bwlJKnmU1VItUTGh4AEHKV28FR5fZpMBbYUZ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As discussed a lot in the past, the UBWC config must be coherent across
a number of IP blocks (currently display and GPU, but it also may/will
concern camera/video as the drivers evolve).

So far, we've been trying to keep the values reasonable in each of the
two drivers separately, but it really make sense to do so centrally,
especially given certain fields (e.g. HBB) may need to be gathered
dynamically.

To reduce room for error, move to fetching the config from a central
source, so that the data programmed into the hardware is consistent
across all multimedia blocks that request it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig                 |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
 drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
 10 files changed, 73 insertions(+), 309 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7f127e2ae44292f8f5c7ff6a9251c3d7ec8c9f58..6579ac907b83bc8042388e4efbaa250ebe771ac5 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -95,6 +95,7 @@ config DRM_MSM_DPU
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
 	select DRM_DISPLAY_DSC_HELPER
+	select QCOM_UBWC_CONFIG
 	default y
 	help
 	  Compile in support for the Display Processing Unit in
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 32c7c80845533d720683dbcde3978d98f4972cce..54ccb1e5a89c75452ac6d53d201999d1124be8cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -10,11 +10,11 @@
 #include "dpu_hw_sspp.h"
 #include "dpu_kms.h"
 
-#include "msm_mdss.h"
-
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
 
+#include <linux/soc/qcom/ubwc.h>
+
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
 
 /* SSPP registers */
@@ -684,7 +684,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 				     const struct dpu_sspp_cfg *cfg,
 				     void __iomem *addr,
-				     const struct msm_mdss_data *mdss_data,
+				     const struct qcom_ubwc_cfg_data *mdss_data,
 				     const struct dpu_mdss_version *mdss_rev)
 {
 	struct dpu_hw_sspp *hw_pipe;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..7957a3ab6b68cbbd2fd9e1f48673b42d1c8a225a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -308,7 +308,7 @@ struct dpu_hw_sspp_ops {
 struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
-	const struct msm_mdss_data *ubwc;
+	const struct qcom_ubwc_cfg_data *ubwc;
 
 	/* Pipe */
 	enum dpu_sspp idx;
@@ -323,7 +323,7 @@ struct dpu_kms;
 struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 				     const struct dpu_sspp_cfg *cfg,
 				     void __iomem *addr,
-				     const struct msm_mdss_data *mdss_data,
+				     const struct qcom_ubwc_cfg_data *mdss_data,
 				     const struct dpu_mdss_version *mdss_rev);
 
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..6667de3154e078b74f797ce1b92d4625c1503f9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -20,9 +20,10 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "msm_drv.h"
 #include "msm_mmu.h"
-#include "msm_mdss.h"
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
@@ -1189,10 +1190,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto err_pm_put;
 	}
 
-	dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
+	dpu_kms->mdss = qcom_ubwc_config_get_data();
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
-		DPU_ERROR("failed to get MDSS data: %d\n", rc);
+		DPU_ERROR("failed to get UBWC config data: %d\n", rc);
 		goto err_pm_put;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index a57ec2ec106083e8f93578e4307e8b13ae549c08..993cf512f8c509ac4e28a60a1a31b262f4a54f98 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -60,7 +60,7 @@ struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
 	const struct dpu_mdss_cfg *catalog;
-	const struct msm_mdss_data *mdss;
+	const struct qcom_ubwc_cfg_data *mdss;
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 421138bc3cb779c45fcfd5319056f0d31c862452..ba5a46c5c1b501d22c6b28dd82ac761c26d08541 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -17,8 +17,9 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "msm_drv.h"
-#include "msm_mdss.h"
 #include "dpu_kms.h"
 #include "dpu_hw_sspp.h"
 #include "dpu_hw_util.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2e296f79cba1437470eeb30900a650f6f4e334b6..cae85812fe273ba12ef9215e1881f59986bbf969 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -40,7 +40,7 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
 int dpu_rm_init(struct drm_device *dev,
 		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
-		const struct msm_mdss_data *mdss_data,
+		const struct qcom_ubwc_cfg_data *mdss_data,
 		void __iomem *mmio)
 {
 	int rc, i;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index aa62966056d489d9c94c61f24051a2f3e7b7ed89..ccd64404f12d3ca3956c8e6df7d1ffddd4f20642 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -69,7 +69,7 @@ struct msm_display_topology {
 int dpu_rm_init(struct drm_device *dev,
 		struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
-		const struct msm_mdss_data *mdss_data,
+		const struct qcom_ubwc_cfg_data *mdss_data,
 		void __iomem *mmio);
 
 int dpu_rm_reserve(struct dpu_rm *rm,
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2c9531217eca7ac2308c6d1fa78287363ca652f9..41b4d3708a77523c27cdd8b17e5ffa44bc8ca0b4 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -16,14 +16,17 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include "msm_mdss.h"
+#include <linux/soc/qcom/ubwc.h>
+
 #include "msm_kms.h"
 
 #include <generated/mdss.xml.h>
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
-#define DEFAULT_REG_BW	153600 /* Used in mdss fbdev driver */
+struct msm_mdss_data {
+	u32 reg_bus_bw;
+};
 
 struct msm_mdss {
 	struct device *dev;
@@ -36,7 +39,8 @@ struct msm_mdss {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
 	} irq_controller;
-	const struct msm_mdss_data *mdss_data;
+	const struct qcom_ubwc_cfg_data *mdss_data;
+	u32 reg_bus_bw;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
 	struct icc_path *reg_bus_path;
@@ -165,7 +169,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
@@ -180,7 +184,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
@@ -198,7 +202,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
@@ -222,69 +226,6 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
-#define MDSS_HW_MAJ_MIN		\
-	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
-
-#define MDSS_HW_MSM8996		0x1007
-#define MDSS_HW_MSM8937		0x100e
-#define MDSS_HW_MSM8953		0x1010
-#define MDSS_HW_MSM8998		0x3000
-#define MDSS_HW_SDM660		0x3002
-#define MDSS_HW_SDM630		0x3003
-
-/*
- * MDP5 platforms use generic qcom,mdp5 compat string, so we have to generate this data
- */
-static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
-{
-	struct msm_mdss_data *data;
-	u32 hw_rev;
-
-	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return NULL;
-
-	hw_rev = readl_relaxed(mdss->mmio + REG_MDSS_HW_VERSION);
-	hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
-
-	if (hw_rev == MDSS_HW_MSM8996 ||
-	    hw_rev == MDSS_HW_MSM8937 ||
-	    hw_rev == MDSS_HW_MSM8953 ||
-	    hw_rev == MDSS_HW_MSM8998 ||
-	    hw_rev == MDSS_HW_SDM660 ||
-	    hw_rev == MDSS_HW_SDM630) {
-		data->ubwc_dec_version = UBWC_1_0;
-		data->ubwc_enc_version = UBWC_1_0;
-	}
-
-	if (hw_rev == MDSS_HW_MSM8996 ||
-	    hw_rev == MDSS_HW_MSM8998)
-		data->highest_bank_bit = 15;
-	else
-		data->highest_bank_bit = 14;
-
-	return data;
-}
-
-const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
-{
-	struct msm_mdss *mdss;
-
-	if (!dev)
-		return ERR_PTR(-EINVAL);
-
-	mdss = dev_get_drvdata(dev);
-
-	/*
-	 * We could not do it at the probe time, since hw revision register was
-	 * not readable. Fill data structure now for the MDP5 platforms.
-	 */
-	if (!mdss->mdss_data && mdss->is_mdp5)
-		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
-
-	return mdss->mdss_data;
-}
-
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret, i;
@@ -297,12 +238,8 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
-	if (msm_mdss->mdss_data && msm_mdss->mdss_data->reg_bus_bw)
-		icc_set_bw(msm_mdss->reg_bus_path, 0,
-			   msm_mdss->mdss_data->reg_bus_bw);
-	else
-		icc_set_bw(msm_mdss->reg_bus_path, 0,
-			   DEFAULT_REG_BW);
+	icc_set_bw(msm_mdss->reg_bus_path, 0,
+		   msm_mdss->reg_bus_bw);
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -438,6 +375,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 
 static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 {
+	const struct msm_mdss_data *mdss_data;
 	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
@@ -450,7 +388,15 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
 
-	msm_mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+	msm_mdss->mdss_data = qcom_ubwc_config_get_data();
+	if (IS_ERR(msm_mdss->mdss_data))
+		return ERR_CAST(msm_mdss->mdss_data);
+
+	mdss_data = of_device_get_match_data(&pdev->dev);
+	if (!mdss_data)
+		return ERR_PTR(-EINVAL);
+
+	msm_mdss->reg_bus_bw = mdss_data->reg_bus_bw;
 
 	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
 	if (IS_ERR(msm_mdss->mmio))
@@ -569,205 +515,48 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
-static const struct msm_mdss_data msm8998_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 15,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data qcm2290_data = {
-	/* no UBWC */
-	.highest_bank_bit = 15,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sa8775p_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 4,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 13,
-	.macrotile_mode = true,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 13,
-	.macrotile_mode = 1,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sc7180_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 14,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 14,
-	.macrotile_mode = true,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sc8180x_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sc8280xp_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sdm670_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 14,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sdm845_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 15,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm6350_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 14,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm7150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 14,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm8150_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 15,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm6115_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 7,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 14,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm6125_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 1,
-	.highest_bank_bit = 14,
-};
-
-static const struct msm_mdss_data sm6150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 14,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm8250_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm8350_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sm8550_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
+static const struct msm_mdss_data data_57k = {
 	.reg_bus_bw = 57000,
 };
 
-static const struct msm_mdss_data x1e80100_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-	/* TODO: Add reg_bus_bw with real value */
+static const struct msm_mdss_data data_74k = {
+	.reg_bus_bw = 74000,
+};
+
+static const struct msm_mdss_data data_76k8 = {
+	.reg_bus_bw = 76800,
+};
+
+static const struct msm_mdss_data data_153k6 = {
+	.reg_bus_bw = 153600,
 };
 
 static const struct of_device_id mdss_dt_match[] = {
-	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
-	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
-	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
-	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
-	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
-	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
-	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
-	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
-	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
-	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
-	{ .compatible = "qcom,sm6125-mdss", .data = &sm6125_data },
-	{ .compatible = "qcom,sm6150-mdss", .data = &sm6150_data },
-	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
-	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
-	{ .compatible = "qcom,sm7150-mdss", .data = &sm7150_data },
-	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
-	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
-	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
-	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
-	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
-	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
+	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sdm845-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sc7180-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sc7280-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sc8180x-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sc8280xp-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6115-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6125-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6350-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm6375-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm7150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm8150-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm8250-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,sm8350-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sm8450-mdss", .data = &data_74k },
+	{ .compatible = "qcom,sm8550-mdss", .data = &data_57k },
+	{ .compatible = "qcom,sm8650-mdss", .data = &data_57k },
+	/* TODO: x1e8: Add reg_bus_bw with real value */
+	{ .compatible = "qcom,x1e80100-mdss", .data = &data_153k6 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
deleted file mode 100644
index 14dc53704314558841ee1fe08d93309fd2233812..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2018, The Linux Foundation
- */
-
-#ifndef __MSM_MDSS_H__
-#define __MSM_MDSS_H__
-
-struct msm_mdss_data {
-	u32 ubwc_enc_version;
-	/* can be read from register 0x58 */
-	u32 ubwc_dec_version;
-	u32 ubwc_swizzle;
-	u32 highest_bank_bit;
-	bool ubwc_bank_spread;
-	bool macrotile_mode;
-	u32 reg_bus_bw;
-};
-
-#define UBWC_1_0 0x10000000
-#define UBWC_2_0 0x20000000
-#define UBWC_3_0 0x30000000
-#define UBWC_4_0 0x40000000
-#define UBWC_4_3 0x40030000
-
-const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
-
-#endif /* __MSM_MDSS_H__ */

-- 
2.49.0

