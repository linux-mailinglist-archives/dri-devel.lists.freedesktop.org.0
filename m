Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129917677B9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6702110E795;
	Fri, 28 Jul 2023 21:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4740310E6BB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 21:33:32 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe1344b707so4457955e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690580010; x=1691184810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xI2gFf5IMmE9gmBXwnnKFQD0+it6twgnBHzxT0t82Zg=;
 b=CT9lFYG6HNn3CLKjlCepcsn8r8pyGc2LfFydpzn73pRPhsvCOoo+yp1TSWR23Bd/+C
 clOYO1q8D2BNFo5Jt/fMFP7SZTfeC1jtHEJRrbVG/ZfaDGBE2RK6sNWrFEbrJcbmDXGr
 UmZLipNmszolXWwEGGEpBxQuPipBVafczc1vqu9AUZK1tj1Lpd5T0oD+WJ5RY9qiJOuh
 BK+PBNsoFPcSkZbk48sHkKZumN2yUF9Ndm17YvWCXA0lt5GAbP/2mOtckwT83dxU53jj
 I/mR2Nigc88g+yrp1hiIMMexaw4vB67pFnrH7OjmiUNG8/Ww1qmAMI4aYjbwBOAc2Zmc
 +CVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690580010; x=1691184810;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xI2gFf5IMmE9gmBXwnnKFQD0+it6twgnBHzxT0t82Zg=;
 b=FkkSwLR2Ke2hJqhSkl2YQCog4bZN092/QS00v/PaYmZHtfsFZ6zI7LMwqr/TQhjv51
 oZi1awI5QGdpyL/Ybg6O/gpsC+9R7Xv/wSHY/830EjfXeojUEaYC3/OSrE0edozMtx9A
 Rotxffrfvb1V9J621Qq5/21tbpcCkM/7M5YtlPAYg8Aw2DbGMCgNoxy7uXYT7mQVjpRx
 T7eE0c7gYgEna8UHd+7BR9z/T9inLaGmipqW60dryn5lZjm2GhZ575RUm9LT85git+CB
 XB+3WL4TjMCLAvWx8MQArCl2tLA3JPRrlD6A+821O+ZApcu4vj0UaJhuIlzyi7jgNPdS
 mPJA==
X-Gm-Message-State: ABy/qLbknXpvg+cod0UhN5Ow/knBNB2dGo9hk3Hr55hr+BNFhKoXPYYJ
 SCa1LpoJLoeGKFMfMmMLwrGEew==
X-Google-Smtp-Source: APBJJlGg3+Y4Cg7SPqgz64yYfXcyw3W8+8CYxrq0ZjW67IwpAxcQ/l3rPu8d7MfJzZNyo5McDBgZ5g==
X-Received: by 2002:a05:6512:3a8f:b0:4fe:ae7:d906 with SMTP id
 q15-20020a0565123a8f00b004fe0ae7d906mr3029305lfu.65.1690580010546; 
 Fri, 28 Jul 2023 14:33:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 14:33:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 5/7] drm/msm/dpu: use MDSS data for programming SSPP
Date: Sat, 29 Jul 2023 00:33:18 +0300
Message-Id: <20230728213320.97309-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using data from MDSS driver to program the SSPP fetch and UBWC
configuration. As a side-effect, this also swithes the DPU driver from
DPU_HW_UBWC_VER_xx values to the UBWC_x_y enum, which reflects
the hardware register values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 ++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
 6 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b364cf75bb3f..f2192de93713 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -8,6 +8,8 @@
 #include "dpu_hw_sspp.h"
 #include "dpu_kms.h"
 
+#include "msm_mdss.h"
+
 #include <drm/drm_file.h>
 
 #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
@@ -270,26 +272,26 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
 		DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
 			DPU_FETCH_CONFIG_RESET_VALUE |
 			ctx->ubwc->highest_bank_bit << 18);
-		switch (ctx->ubwc->ubwc_version) {
-		case DPU_HW_UBWC_VER_10:
+		switch (ctx->ubwc->ubwc_enc_version) {
+		case UBWC_1_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
 					BIT(8) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
-		case DPU_HW_UBWC_VER_20:
+		case UBWC_2_0:
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					fast_clear | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
-		case DPU_HW_UBWC_VER_30:
+		case UBWC_3_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					BIT(30) | (ctx->ubwc->ubwc_swizzle) |
 					(ctx->ubwc->highest_bank_bit << 4));
 			break;
-		case DPU_HW_UBWC_VER_40:
+		case UBWC_4_0:
 			DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
 					DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
 			break;
@@ -670,11 +672,11 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 #endif
 
 struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc)
+		void __iomem *addr, const struct msm_mdss_data *mdss_data)
 {
 	struct dpu_hw_sspp *hw_pipe;
 
-	if (!addr || !ubwc)
+	if (!addr)
 		return ERR_PTR(-EINVAL);
 
 	hw_pipe = kzalloc(sizeof(*hw_pipe), GFP_KERNEL);
@@ -685,7 +687,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
 	hw_pipe->hw.log_mask = DPU_DBG_MASK_SSPP;
 
 	/* Assign ops */
-	hw_pipe->ubwc = ubwc;
+	hw_pipe->ubwc = mdss_data;
 	hw_pipe->idx = cfg->id;
 	hw_pipe->cap = cfg;
 	_setup_layer_ops(hw_pipe, hw_pipe->cap->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 085f34bc6b88..cbf4f95ff0fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -317,7 +317,7 @@ struct dpu_hw_sspp_ops {
 struct dpu_hw_sspp {
 	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
-	const struct dpu_ubwc_cfg *ubwc;
+	const struct msm_mdss_data *ubwc;
 
 	/* Pipe */
 	enum dpu_sspp idx;
@@ -333,10 +333,10 @@ struct dpu_kms;
  * Should be called once before accessing every pipe.
  * @cfg:  Pipe catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
- * @ubwc: UBWC configuration data
+ * @mdss_data: UBWC / MDSS configuration data
  */
 struct dpu_hw_sspp *dpu_hw_sspp_init(const struct dpu_sspp_cfg *cfg,
-		void __iomem *addr, const struct dpu_ubwc_cfg *ubwc);
+		void __iomem *addr, const struct msm_mdss_data *mdss_data);
 
 /**
  * dpu_hw_sspp_destroy(): Destroys SSPP driver context
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index c1d06e19b237..2da9eef687af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -22,6 +22,7 @@
 
 #include "msm_drv.h"
 #include "msm_mmu.h"
+#include "msm_mdss.h"
 #include "msm_gem.h"
 #include "disp/msm_disp_snapshot.h"
 
@@ -1124,7 +1125,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		goto power_error;
 	}
 
-	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
+	dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
+	if (IS_ERR(dpu_kms->mdss)) {
+		rc = PTR_ERR(dpu_kms->mdss);
+		DPU_ERROR("failed to get MDSS data: %d\n", rc);
+		goto power_error;
+	}
+
+	if (!dpu_kms->mdss) {
+		rc = -EINVAL;
+		DPU_ERROR("NULL MDSS data\n");
+		goto power_error;
+	}
+
+	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
 		goto power_error;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index f3bdd4f11108..b6f53ca6e962 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -67,6 +67,7 @@ struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
 	const struct dpu_mdss_cfg *catalog;
+	const struct msm_mdss_data *mdss;
 
 	/* io/register spaces: */
 	void __iomem *mmio, *vbif[VBIF_MAX];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 4a53e2c931d6..f9215643c71a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -101,6 +101,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 
 int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
+		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio)
 {
 	int rc, i;
@@ -230,7 +231,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_sspp *hw;
 		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
 
-		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
+		hw = dpu_hw_sspp_init(sspp, mmio, mdss_data);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed sspp object creation: err %d\n", rc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index d62c2edb2460..2b551566cbf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -40,11 +40,13 @@ struct dpu_rm {
  *	for all HW blocks.
  * @rm: DPU Resource Manager handle
  * @cat: Pointer to hardware catalog
+ * @mdss_data: Pointer to MDSS / UBWC configuration
  * @mmio: mapped register io address of MDP
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_mdss_cfg *cat,
+		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio);
 
 /**
-- 
2.39.2

