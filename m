Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A53249C1D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD0D6E248;
	Wed, 19 Aug 2020 11:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44AC6E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC453208B3;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=7u+8/O1VvGIf9aQ3zciG1snF7OpcfJtHdOZPCc+CIlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vs6NblygDCvvuBJ5mW7PHnCyNk9QzolsZOVgaEWdfldAWEnAMtGwUn9IcD2f/CQWS
 Io8mnx3zERk6Wn2bQJZUQA05AFSx6hLEBnRBe1xrl7+Oir8vWUTwhQ4WuSJ1+or05X
 0DzS/yc+Kpy+ylDY/RbwVuV7g1UGNTR2nF6pQNVs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00EuaJ-MN; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 09/49] staging: hikey9xx/gpu: Solve SR test reset problem for
 hikey970.
Date: Wed, 19 Aug 2020 13:45:37 +0200
Message-Id: <e958553cf877ff9c7d57abba9f27ff5403b5efeb.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiubin Zhang <zhangxiubin1@huawei.com>

Add HDMI/DSS power on&off in the SR flow.

Signed-off-by: Xiubin Zhang <zhangxiubin1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/Makefile         |  1 -
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     | 10 +--
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   |  9 ++-
 drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h  |  4 +-
 .../hikey9xx/gpu/kirin_drm_dpe_utils.c        | 80 ++++++++++++++-----
 .../hikey9xx/gpu/kirin_drm_dpe_utils.h        |  4 +
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  | 34 +++-----
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    |  3 -
 8 files changed, 85 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/Makefile b/drivers/staging/hikey9xx/gpu/Makefile
index 5d7cf738a7d6..a5e008365a57 100644
--- a/drivers/staging/hikey9xx/gpu/Makefile
+++ b/drivers/staging/hikey9xx/gpu/Makefile
@@ -1,6 +1,5 @@
 EXTRA_CFLAGS += \
 		-Iinclude/drm
-
 kirin-drm-y := kirin_fbdev.o \
 		kirin_fb.o \
 		kirin_drm_drv.o \
diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index 2ba94fa15d0f..4fef154cd701 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -2046,11 +2046,8 @@ static int dsi_suspend(struct platform_device *pdev, pm_message_t state)
 	struct dsi_data *ddata = dev_get_drvdata(dev);
 	struct dw_dsi *dsi = &ddata->dsi;
 
-	DRM_INFO("+. pdev->name is %s, pm_message is %d \n", pdev->name, state.event);
-
 	dsi_encoder_disable(&dsi->encoder);
-
-	DRM_INFO("-. \n");
+	drm_bridge_post_disable(dsi->encoder.bridge);
 
 	return 0;
 }
@@ -2061,12 +2058,9 @@ static int dsi_resume(struct platform_device *pdev)
 	struct dsi_data *ddata = dev_get_drvdata(dev);
 	struct dw_dsi *dsi = &ddata->dsi;
 
-	DRM_INFO("+. pdev->name is %s \n", pdev->name);
-
+	drm_bridge_pre_enable(dsi->encoder.bridge);
 	dsi_encoder_enable(&dsi->encoder);
 
-	DRM_INFO("-. \n");
-
 	return 0;
 }
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 5c2ddcf01b26..59e43722de56 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -43,6 +43,7 @@
 /* vcc name */
 #define REGULATOR_PDP_NAME	"regulator_dsssubsys"
 #define REGULATOR_MMBUF	"regulator_mmbuf"
+#define REGULATOR_MEDIA_NAME  "regulator_media_subsys"
 
 /*******************************************************************************
 **
@@ -220,8 +221,8 @@ typedef struct drm_dss_layer {
 
 /*dss clk power off */
 #define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF   	(277000000UL)
-#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF    	(277000000UL)
-#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF 	(238000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF    	(238000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF 	(208000000UL)
 #define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF 	(238000000UL)
 
 #define DEFAULT_PCLK_DSS_RATE	(114000000UL)
@@ -4085,8 +4086,8 @@ struct dss_hw_ctx {
 	struct dss_clk_rate *dss_clk;
 
 	struct regulator *dpe_regulator;
-	struct regulator_bulk_data *mmbuf_regulator;
-	struct regulator_bulk_data *media_subsys_regulator;
+	struct regulator *mmbuf_regulator;
+	struct regulator *mediacrg_regulator;
 
 	bool power_on;
 	int irq;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
index cdf2f1d22e5e..282ba9b55e43 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
@@ -3073,8 +3073,8 @@ struct dss_hw_ctx {
 	struct dss_clk_rate *dss_clk;
 
 	struct regulator *dpe_regulator;
-	struct regulator_bulk_data *mmbuf_regulator;
-	struct regulator_bulk_data *media_subsys_regulator;
+	struct regulator *mmbuf_regulator;
+	struct regulator *mediacrg_regulator;
 
 	bool power_on;
 	int irq;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
index d891ee17f48d..887c5d609ab6 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
@@ -1009,7 +1009,7 @@ int dpe_regulator_enable(struct dss_hw_ctx *ctx)
 		return -EINVAL;
 	}
 
-	ret = regulator_enable(ctx->dpe_regulator);
+	//ret = regulator_enable(ctx->dpe_regulator);
 	if (ret) {
 		DRM_ERROR(" dpe regulator_enable failed, error=%d!\n", ret);
 		return -EINVAL;
@@ -1024,31 +1024,57 @@ int dpe_regulator_disable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
 
-	DRM_INFO("+. \n");
 	if (NULL == ctx) {
 		DRM_ERROR("NULL ptr.\n");
 		return -EINVAL;
 	}
 
 	#if defined (CONFIG_HISI_FB_970)
-		dpe_set_clk_rate_on_pll0(ctx);
+		dpe_set_pixel_clk_rate_on_pll0(ctx);
+		dpe_set_common_clk_rate_on_pll0(ctx);
 	#endif
 
-	ret = regulator_disable(ctx->dpe_regulator);
+	//ret = regulator_disable(ctx->dpe_regulator);
 	if (ret != 0) {
 		DRM_ERROR("dpe regulator_disable failed, error=%d!\n", ret);
 		return -EINVAL;
 	}
 
-	if (ctx->g_dss_version_tag != FB_ACCEL_KIRIN970) {
-		ret = regulator_bulk_disable(1, ctx->mmbuf_regulator);
-		if (ret != 0) {
-			DRM_ERROR("mmbuf regulator_disable failed, error=%d!\n", ret);
-			return -EINVAL;
-		}
+	return ret;
+}
+
+int mediacrg_regulator_enable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+
+	if (NULL == ctx) {
+		DRM_ERROR("NULL ptr.\n");
+		return -EINVAL;
+	}
+
+	//ret = regulator_enable(ctx->mediacrg_regulator);
+	if (ret) {
+		DRM_ERROR("mediacrg regulator_enable failed, error=%d!\n", ret);
+	}
+
+	return ret;
+}
+
+int mediacrg_regulator_disable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+
+	if (NULL == ctx) {
+		DRM_ERROR("NULL ptr.\n");
+		return -EINVAL;
+	}
+
+	//ret = regulator_disable(ctx->mediacrg_regulator);
+	if (ret != 0) {
+		DRM_ERROR("mediacrg regulator_disable failed, error=%d!\n", ret);
+		return -EINVAL;
 	}
 
-	DRM_INFO("-. \n");
 	return ret;
 }
 
@@ -1098,7 +1124,29 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 	return ret;
 }
 
-int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
+int dpe_set_pixel_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
+{
+	int ret;
+	uint64_t clk_rate;
+
+	DRM_INFO("+. \n");
+	if (NULL == ctx) {
+		DRM_ERROR("NULL Pointer!\n");
+		return -EINVAL;
+	}
+
+	clk_rate = DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF;
+	ret = clk_set_rate(ctx->dss_pxl0_clk, clk_rate);
+	if (ret < 0) {
+		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
+		return -EINVAL;
+	}
+	DRM_INFO("dss_pxl0_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
+
+	return ret;
+}
+
+int dpe_set_common_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 {
 	int ret;
 	uint64_t clk_rate;
@@ -1125,13 +1173,5 @@ int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
 	}
 	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
 
-	clk_rate = DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF;
-	ret = clk_set_rate(ctx->dss_pxl0_clk, clk_rate);
-	if (ret < 0) {
-		DRM_ERROR("dss_pxl0_clk clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
-		return -EINVAL;
-	}
-	DRM_INFO("dss_pxl0_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
-
 	return ret;
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
index f27e01cb43f8..b0bcc5d7a0c1 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
@@ -50,6 +50,8 @@ int dpe_inner_clk_enable(struct dss_hw_ctx *ctx);
 int dpe_inner_clk_disable(struct dss_hw_ctx *ctx);
 int dpe_regulator_enable(struct dss_hw_ctx *ctx);
 int dpe_regulator_disable(struct dss_hw_ctx *ctx);
+int mediacrg_regulator_enable(struct dss_hw_ctx *ctx);
+int mediacrg_regulator_disable(struct dss_hw_ctx *ctx);
 int dpe_set_clk_rate(struct dss_hw_ctx *ctx);
 
 int dpe_irq_enable(struct dss_crtc *acrtc);
@@ -59,6 +61,8 @@ int dpe_init(struct dss_crtc *acrtc);
 int dpe_deinit(struct dss_crtc *acrtc);
 void dpe_check_itf_status(struct dss_crtc *acrtc);
 int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx);
+int dpe_set_common_clk_rate_on_pll0(struct dss_hw_ctx *ctx);
+int dpe_set_pixel_clk_rate_on_pll0(struct dss_hw_ctx *ctx);
 
 void hisifb_dss_on(struct dss_hw_ctx *ctx);
 void hisi_dss_mctl_on(struct dss_hw_ctx *ctx);
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index b13efd9b9735..11d847e2da3d 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -51,7 +51,6 @@
 #define DTS_COMP_DSS_NAME "hisilicon,hi3660-dpe"
 #endif
 
-#define PPLL7_USED_IN_DRV
 #define DSS_DEBUG	0
 
 static const struct dss_format dss_formats[] = {
@@ -101,7 +100,6 @@ u32 dss_get_format(u32 pixel_format)
 	return HISI_FB_PIXEL_FORMAT_UNSUPPORT;
 }
 
-#ifdef PPLL7_USED_IN_DRV
 /*******************************************************************************
 **
 */
@@ -247,7 +245,6 @@ int hdmi_pxl_ppll7_init(struct dss_hw_ctx *ctx, uint64_t pixel_clock)
 	}
 	return ret;
 }
-#endif
 
 /*******************************************************************************
  **
@@ -273,18 +270,8 @@ static void dss_ldi_set_mode(struct dss_crtc *acrtc)
 		else
 			clk_Hz = mode->clock * 1000UL;
 
-#ifdef PPLL7_USED_IN_DRV
+		DRM_INFO("HDMI real need clock = %llu \n", clk_Hz);
 		hdmi_pxl_ppll7_init(ctx, clk_Hz);
-#else
-		/*
-		 * Success should be guaranteed in mode_valid call back,
-		 * so failure shouldn't happen here
-		 */
-		ret = clk_set_rate(ctx->dss_pxl0_clk, clk_Hz);
-		if (ret) {
-			DRM_ERROR("failed to set pixel clk %llu Hz (%d)\n", clk_Hz, ret);
-		}
-#endif
 		adj_mode->clock = clk_Hz / 1000;
 	} else {
 		if (mode->clock == 148500)
@@ -320,6 +307,7 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	int ret = 0;
 
 #if defined (CONFIG_HISI_FB_970)
+	mediacrg_regulator_enable(ctx);
 	dpe_common_clk_enable(ctx);
 	dpe_inner_clk_enable(ctx);
 	#ifndef DSS_POWER_UP_ON_UEFI
@@ -384,14 +372,16 @@ static void dss_power_down(struct dss_crtc *acrtc)
 	dss_inner_clk_pdp_disable(ctx);
 
 	if (ctx->g_dss_version_tag & FB_ACCEL_KIRIN970 ) {
+		dpe_regulator_disable(ctx);
 		dpe_inner_clk_disable(ctx);
 		dpe_common_clk_disable(ctx);
-		dpe_regulator_disable(ctx);
+		mediacrg_regulator_disable(ctx);
 	} else {
 		dpe_regulator_disable(ctx);
 		dpe_inner_clk_disable(ctx);
 		dpe_common_clk_disable(ctx);
 	}
+
 	ctx->power_on = false;
 }
 
@@ -789,7 +779,13 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 #if defined (CONFIG_HISI_FB_970)
 	ctx->dpe_regulator = devm_regulator_get(dev, REGULATOR_PDP_NAME);
 	if (!ctx->dpe_regulator) {
-		DRM_ERROR("failed to get regulator resource! ret=%d.\n", ret);
+		DRM_ERROR("failed to get dpe_regulator resource! ret=%d.\n", ret);
+		return -ENXIO;
+	}
+
+	ctx->mediacrg_regulator = devm_regulator_get(dev, REGULATOR_MEDIA_NAME);
+	if (!ctx->mediacrg_regulator) {
+		DRM_ERROR("failed to get mediacrg_regulator resource! ret=%d.\n", ret);
 		return -ENXIO;
 	}
 #endif
@@ -946,11 +942,8 @@ static int  dss_drm_suspend(struct platform_device *pdev, pm_message_t state)
 	struct dss_data *dss = platform_get_drvdata(pdev);
 	struct drm_crtc *crtc = &dss->acrtc.base;
 
-	DRM_INFO("+. platform_device name is %s \n", pdev->name);
 	dss_crtc_disable(crtc);
 
-	DRM_INFO("-. \n");
-
 	return 0;
 }
 
@@ -959,12 +952,9 @@ static int  dss_drm_resume(struct platform_device *pdev)
 	struct dss_data *dss = platform_get_drvdata(pdev);
 	struct drm_crtc *crtc = &dss->acrtc.base;
 
-	DRM_INFO("+. platform_device name is %s \n", pdev->name);
-
 	dss_crtc_mode_set_nofb(crtc);
 	dss_crtc_enable(crtc);
 
-	DRM_INFO("-. \n");
 	return 0;
 }
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index b1081cac5c1c..a1f58c5f7239 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -28,9 +28,6 @@
 #include "kirin_drm_dpe_utils.h"
 #include "kirin_drm_drv.h"
 
-
-#define DSS_CHN_MAX_DEFINE (DSS_COPYBIT_MAX)
-
 static int mid_array[DSS_CHN_MAX_DEFINE] = {0xb, 0xa, 0x9, 0x8, 0x7, 0x6, 0x5, 0x4, 0x2, 0x1, 0x3, 0x0};
 
 #if defined (CONFIG_HISI_FB_970)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
