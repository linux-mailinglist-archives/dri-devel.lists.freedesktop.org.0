Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BCAE83D9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 15:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0531E10E718;
	Wed, 25 Jun 2025 13:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PI3V8/wZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0319010E713;
 Wed, 25 Jun 2025 13:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 027BD4B153;
 Wed, 25 Jun 2025 13:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26FFC4CEEA;
 Wed, 25 Jun 2025 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750857032;
 bh=4rfc0hzad1XXSZ+PRmF5xBVXCwNOCKR+tydVyq9LxR0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PI3V8/wZtsJf0EA3gO8jENF0ddn3Sj8/K+pmMD0uHfyU8F+LnKAL1e0gt1R1PPsAO
 +qEtbrvxGDF3EZKg+Hg4n8TEQh+lMf2j+ea9WD507e6jScK0zwcfOMH1mGItM2OnoS
 6uaxl1rDJQplolSiXZ6sWgSPkF/uVzW6Pk1hIm0oZ3xWandVQSRT9xKqHHvRATMbQ6
 bQ4MW8pRs/Ue5D2VlMNIt0gd+I32Jkhf07d3RvsMrRBYTk6KCPTavJpwjxls4SOvfM
 pmUi2QExZ+owvvnMd3KW3JSJpLoq6A1FJtXb2CEsN7DA25oOGfEovjsL845XoejsCF
 4+YpDIFPdLSYg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 25 Jun 2025 15:10:11 +0200
Subject: [PATCH v5 03/14] drm/msm: Use the central UBWC config database
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-topic-ubwc_central-v5-3-e256d18219e2@oss.qualcomm.com>
References: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
In-Reply-To: <20250625-topic-ubwc_central-v5-0-e256d18219e2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750857014; l=22665;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hpRHCKsHwApH8Qb6bl0zoHsIj72FPFlp+XpZ2Fb+v9Y=;
 b=xd6v/7c+LUt30AY1HsHsorFG+Y0Q7puVI7mmrmxs2HXhmsyRw3tUGf9fryL6zOpUH+QG+WQpx
 PzR8+FtQKBlDCTdTORG65ASvMLD+u1qsFq4oXMPjLy0DY4Nj9BK8Xf5
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 drivers/gpu/drm/msm/msm_mdss.c              | 338 +++++-----------------------
 drivers/gpu/drm/msm/msm_mdss.h              |  29 ---
 10 files changed, 73 insertions(+), 321 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 7f127e2ae44292f8f5c7ff6a9251c3d7ec8c9f58..aa317677b6a8960406635fda058a6b7d76256a51 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -30,6 +30,7 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
+	select QCOM_UBWC_CONFIG
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 7dfd0e0a779535e1f6b003f48188bc90d29d6853..6f1fc790ad6d815ed8a2c9936a40d6e6a0b413a0 100644
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
index ed90e78d178a497ae7e2dc12b09a37c8a3f79621..bdac5c04bf7901b864d5999fb395aa5c90de82f5 100644
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
@@ -325,7 +325,7 @@ struct dpu_kms;
 struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
 				     const struct dpu_sspp_cfg *cfg,
 				     void __iomem *addr,
-				     const struct msm_mdss_data *mdss_data,
+				     const struct qcom_ubwc_cfg_data *mdss_data,
 				     const struct dpu_mdss_version *mdss_rev);
 
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index df9d6a509bcd453978bc2491795a6ef87cc95638..226da68d9a9b26f798b8e6795f2994e971b80505 100644
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
index a2219c4f55a45db894ff18c1fd0a810c1a3cf811..25382120cb1a4f2b68b0c6573371f75fb8d489ea 100644
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
index 597c8e64985316763d7ced763c4c6fdb5da9fb90..1f5fe7811e016909282087176a42a2349b21c9c4 100644
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
 
@@ -224,7 +228,7 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
@@ -240,69 +244,6 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
 	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
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
@@ -315,12 +256,8 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
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
@@ -459,6 +396,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 
 static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
 {
+	const struct msm_mdss_data *mdss_data;
 	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
@@ -471,7 +409,15 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
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
@@ -590,217 +536,49 @@ static void mdss_remove(struct platform_device *pdev)
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
 
-static const struct msm_mdss_data sm8750_data = {
-	.ubwc_enc_version = UBWC_5_0,
-	.ubwc_dec_version = UBWC_5_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 16,
-	.macrotile_mode = true,
-	.reg_bus_bw = 57000,
+static const struct msm_mdss_data data_74k = {
+	.reg_bus_bw = 74000,
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
-	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
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
+	{ .compatible = "qcom,sm8750-mdss", .data = &data_57k },
+	/* TODO: x1e8: Add reg_bus_bw with real value */
+	{ .compatible = "qcom,x1e80100-mdss", .data = &data_153k6 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
deleted file mode 100644
index dd0160c6ba1a297cea5b87cd8b03895b2aa08213..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ /dev/null
@@ -1,29 +0,0 @@
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
-#define UBWC_5_0 0x50000000
-
-const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
-
-#endif /* __MSM_MDSS_H__ */

-- 
2.50.0

