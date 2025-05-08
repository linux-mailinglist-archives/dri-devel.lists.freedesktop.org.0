Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782AAB0238
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 20:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372B910E946;
	Thu,  8 May 2025 18:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ss7pA5Z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0396C10E946;
 Thu,  8 May 2025 18:13:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 245905C63D7;
 Thu,  8 May 2025 18:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1361BC4CEEB;
 Thu,  8 May 2025 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746728016;
 bh=jEXyk4/CG4/uqqwjT04hGoBvLebRc7FJW1glFscjkII=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ss7pA5Z+UOJJ+WBR3F7JKUJlppXhDBGUwPcdhoA3cj9YSKzVbuRPkKamELkiyy8Oo
 SL8HlQZci4AlN9mnh5ctpkwBBctnyLyhoOZ3atEyHa51CmIfe4bcPcxorTlUMB/65n
 XNCTfHIOydw1cix//C2Eg7nZrECjtsOkRmz6QD5oW3nP33oIcLVipEUI4O4YHS2zfm
 nK7ZrrXRmznGhoEFVlvCrYYrhkmw01IWPU3SToMzTANJp5Bxl6gRe6/ehGk6fRwBmA
 EMNYN4MMlcJ3g28yXWBBgT2Wj2i3NX+xu//T2uCOvagcC4Yql6Y5jI6PnBRezZDRl4
 chjaNy+rN+QtQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:34 +0200
Subject: [PATCH RFT 02/14] drm/msm: Use the central UBWC config database
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-2-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=19651;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=sG42gm8yIn4lXx9vfCvzcqHISpqechon007a1c6Ps84=;
 b=eCu0P8svi/eSy7qYjmLwA4mkOzf+nbCXQdna/eUmcWM3mWheQW68QYieKLCcEVWMNj9XiyLf8
 iDjJ57SqKxUAH9ur/IwhEnxVK4SmweRKepPmfB9nyPNqi3z6clQU32x
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
 drivers/gpu/drm/msm/msm_mdss.c              | 302 ++++------------------------
 drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
 10 files changed, 49 insertions(+), 308 deletions(-)

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
index 709979fcfab6062c0f316f7655823e888638bfea..a0c4b47470deca4b469868c7fdcc2f962723efcb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -16,7 +16,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include "msm_mdss.h"
+#include <linux/soc/qcom/ubwc.h>
+
 #include "msm_kms.h"
 
 #include <generated/mdss.xml.h>
@@ -36,7 +37,7 @@ struct msm_mdss {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
 	} irq_controller;
-	const struct msm_mdss_data *mdss_data;
+	const struct qcom_ubwc_cfg_data *mdss_data;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
 	struct icc_path *reg_bus_path;
@@ -165,7 +166,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
@@ -180,7 +181,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
@@ -198,7 +199,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 
 static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
-	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
@@ -222,69 +223,6 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
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
-		data->highest_bank_bit = 2;
-	else
-		data->highest_bank_bit = 1;
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
@@ -297,9 +235,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
-	if (msm_mdss->mdss_data && msm_mdss->mdss_data->reg_bus_bw)
+	if (msm_mdss->mdss_data && msm_mdss->mdss_data->mdss_reg_bus_bw)
 		icc_set_bw(msm_mdss->reg_bus_path, 0,
-			   msm_mdss->mdss_data->reg_bus_bw);
+			   msm_mdss->mdss_data->mdss_reg_bus_bw);
 	else
 		icc_set_bw(msm_mdss->reg_bus_path, 0,
 			   DEFAULT_REG_BW);
@@ -450,7 +388,9 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
 
-	msm_mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+	msm_mdss->mdss_data = qcom_ubwc_config_get_data();
+	if (IS_ERR(msm_mdss->mdss_data))
+		return ERR_CAST(msm_mdss->mdss_data);
 
 	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
 	if (IS_ERR(msm_mdss->mmio))
@@ -569,205 +509,31 @@ static void mdss_remove(struct platform_device *pdev)
 	msm_mdss_destroy(mdss);
 }
 
-static const struct msm_mdss_data msm8998_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_1_0,
-	.highest_bank_bit = 2,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data qcm2290_data = {
-	/* no UBWC */
-	.highest_bank_bit = 0x2,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sa8775p_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 4,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0,
-	.macrotile_mode = true,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sar2130p_data = {
-	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0,
-	.macrotile_mode = 1,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sc7180_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0x1,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sc7280_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 1,
-	.macrotile_mode = true,
-	.reg_bus_bw = 74000,
-};
-
-static const struct msm_mdss_data sc8180x_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 3,
-	.macrotile_mode = true,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sc8280xp_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 3,
-	.macrotile_mode = true,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sdm670_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sdm845_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 2,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm6350_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 1,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm7150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm8150_data = {
-	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_dec_version = UBWC_3_0,
-	.highest_bank_bit = 2,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm6115_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_swizzle = 7,
-	.ubwc_bank_spread = true,
-	.highest_bank_bit = 0x1,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm6125_data = {
-	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_dec_version = UBWC_3_0,
-	.ubwc_swizzle = 1,
-	.highest_bank_bit = 1,
-};
-
-static const struct msm_mdss_data sm6150_data = {
-	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_dec_version = UBWC_2_0,
-	.highest_bank_bit = 1,
-	.reg_bus_bw = 76800,
-};
-
-static const struct msm_mdss_data sm8250_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_0,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
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
-	.highest_bank_bit = 3,
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
-	.highest_bank_bit = 3,
-	.macrotile_mode = true,
-	.reg_bus_bw = 57000,
-};
-
-static const struct msm_mdss_data x1e80100_data = {
-	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_dec_version = UBWC_4_3,
-	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
-	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-	.highest_bank_bit = 3,
-	.macrotile_mode = true,
-	/* TODO: Add reg_bus_bw with real value */
-};
-
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
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
+	{ .compatible = "qcom,msm8998-mdss" },
+	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sa8775p-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
+	{ .compatible = "qcom,sdm670-mdss" },
+	{ .compatible = "qcom,sdm845-mdss" },
+	{ .compatible = "qcom,sc7180-mdss" },
+	{ .compatible = "qcom,sc7280-mdss" },
+	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sc8280xp-mdss" },
+	{ .compatible = "qcom,sm6115-mdss" },
+	{ .compatible = "qcom,sm6125-mdss" },
+	{ .compatible = "qcom,sm6150-mdss" },
+	{ .compatible = "qcom,sm6350-mdss" },
+	{ .compatible = "qcom,sm6375-mdss" },
+	{ .compatible = "qcom,sm7150-mdss" },
+	{ .compatible = "qcom,sm8150-mdss" },
+	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
+	{ .compatible = "qcom,sm8650-mdss" },
+	{ .compatible = "qcom,x1e80100-mdss"},
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

