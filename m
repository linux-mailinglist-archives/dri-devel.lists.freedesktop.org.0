Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 794FA249C26
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBD26E255;
	Wed, 19 Aug 2020 11:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68196E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD41A208C7;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=RZ+zKvVvpuEOtTIumsb9tKixckXpYyef7ICrpik1Nh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tJKtr6mTsBvps0bLzCa15Rsov6Iw4hjKpdGhGjWob4saroXpYb9bThQLxdnYaPMOA
 7Dv9B0xFxsoLRCbd8OXRSnB64cvkR6scR89S6HUPhdo02p7kCBEKh3P+2Z1hzqlue9
 kZ6kCX3P01+xZ7J7UD6rpd2wsjP7/wgd1ebPV0BY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00EuaA-I1; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 06/49] staging: hikey9xx/gpu: Solve SR Cannot Display Problems.
Date: Wed, 19 Aug 2020 13:45:34 +0200
Message-Id: <09bc00bdb109cb13106801602f52ad2d3c4d7fc8.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devel@driverdev.osuosl.org,
 Liwei Cai <cailiwei@hisilicon.com>, Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Liuyao An <anliuyao@huawei.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mauro.chehab@huawei.com,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>, linux-kernel@vger.kernel.org,
 Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiubin Zhang <zhangxiubin1@huawei.com>

Add suspend and resume interface to solve SR Cannot Display Problems.

Signed-off-by: Xiubin Zhang <zhangxiubin1@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     |  32 +++
 drivers/staging/hikey9xx/gpu/hdmi/adv7535.c   |  14 +-
 .../staging/hikey9xx/gpu/kirin970_dpe_reg.h   |  46 ++--
 drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h  |   6 +
 .../hikey9xx/gpu/kirin_drm_dpe_utils.c        | 204 +++++++++++++++++-
 .../hikey9xx/gpu/kirin_drm_dpe_utils.h        |   8 +
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.c  |  32 +++
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.h  |   2 +
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  |  53 ++++-
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    |  61 ++++--
 drivers/staging/hikey9xx/gpu/kirin_fbdev.c    |   3 +-
 11 files changed, 401 insertions(+), 60 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index f1376ed01dce..e69f4a9bca58 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -2063,6 +2063,36 @@ static int dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int dsi_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct device *dev = &pdev->dev;
+	struct dsi_data *ddata = dev_get_drvdata(dev);
+	struct dw_dsi *dsi = &ddata->dsi;
+
+	DRM_INFO("+. pdev->name is %s, pm_message is %d \n", pdev->name, state.event);
+
+	dsi_encoder_disable(&dsi->encoder);
+
+	DRM_INFO("-. \n");
+
+	return 0;
+}
+
+static int dsi_resume(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dsi_data *ddata = dev_get_drvdata(dev);
+	struct dw_dsi *dsi = &ddata->dsi;
+
+	DRM_INFO("+. pdev->name is %s \n", pdev->name);
+
+	dsi_encoder_enable(&dsi->encoder);
+
+	DRM_INFO("-. \n");
+
+	return 0;
+}
+
 static const struct of_device_id dsi_of_match[] = {
 	{.compatible = "hisilicon,hi3660-dsi"},
 	{.compatible = "hisilicon,kirin970-dsi"},
@@ -2073,6 +2103,8 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
 static struct platform_driver dsi_driver = {
 	.probe = dsi_probe,
 	.remove = dsi_remove,
+	.suspend = dsi_suspend,
+	.resume = dsi_resume,
 	.driver = {
 		.name = "dw-dsi",
 		.of_match_table = dsi_of_match,
diff --git a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
index 818b4b65334c..3dd6059ea603 100644
--- a/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
+++ b/drivers/staging/hikey9xx/gpu/hdmi/adv7535.c
@@ -1231,12 +1231,10 @@ static int adv7533_init_regulators(struct adv7511 *adv75xx, struct device *dev)
 	if (IS_ERR(adv75xx->v1p2)) {
 		ret = PTR_ERR(adv75xx->v1p2);
 		dev_err(dev, "failed to get v1p2 regulator %d\n", ret);
-		//return ret;
+		return ret;
 	}
 
 	ret = regulator_set_voltage(adv75xx->vdd, 1800000, 1800000);
-	//ret = regulator_set_voltage(adv75xx->vdd, 1500000, 1500000);
-	//ret = regulator_set_voltage(adv75xx->vdd, 2000000, 2000000);
 	if (ret) {
 		dev_err(dev, "failed to set avdd voltage %d\n", ret);
 		return ret;
@@ -1244,11 +1242,11 @@ static int adv7533_init_regulators(struct adv7511 *adv75xx, struct device *dev)
 
 
 	DRM_INFO(" adv75xx->vdd = %d \n", regulator_get_voltage(adv75xx->vdd));
-	//ret = regulator_set_voltage(adv75xx->v1p2, 1200000, 1200000);
+	/*ret = regulator_set_voltage(adv75xx->v1p2, 1200000, 1200000);
 	if (ret) {
 		dev_err(dev, "failed to set v1p2 voltage %d\n", ret);
-		//return ret;
-	}
+		return ret;
+	}*/
 
 	/* keep the regulators always on */
 	ret = regulator_enable(adv75xx->vdd);
@@ -1257,11 +1255,11 @@ static int adv7533_init_regulators(struct adv7511 *adv75xx, struct device *dev)
 		return ret;
 	}
 
-	//ret = regulator_enable(adv75xx->v1p2);
+	/*ret = regulator_enable(adv75xx->v1p2);
 	if (ret) {
 		dev_err(dev, "failed to enable v1p2 %d\n", ret);
 		//return ret;
-	}
+	}*/
 
 	return 0;
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 6e7e5dc0a20a..867266073bc0 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -108,32 +108,32 @@ enum dss_ovl_idx {
 #define DSS_WCH_MAX  (2)
 
 typedef struct dss_img {
-	uint32_t format;
-	uint32_t width;
-	uint32_t height;
-	uint32_t bpp;		/* bytes per pixel */
-	uint32_t buf_size;
-	uint32_t stride;
-	uint32_t stride_plane1;
-	uint32_t stride_plane2;
+	u32 format;
+	u32 width;
+	u32 height;
+	u32 bpp;		/* bytes per pixel */
+	u32 buf_size;
+	u32 stride;
+	u32 stride_plane1;
+	u32 stride_plane2;
 	uint64_t phy_addr;
 	uint64_t vir_addr;
-	uint32_t offset_plane1;
-	uint32_t offset_plane2;
+	u32 offset_plane1;
+	u32 offset_plane2;
 
 	uint64_t afbc_header_addr;
 	uint64_t afbc_payload_addr;
-	uint32_t afbc_header_stride;
-	uint32_t afbc_payload_stride;
-	uint32_t afbc_scramble_mode;
-	uint32_t mmbuf_base;
-	uint32_t mmbuf_size;
+	u32 afbc_header_stride;
+	u32 afbc_payload_stride;
+	u32 afbc_scramble_mode;
+	u32 mmbuf_base;
+	u32 mmbuf_size;
 
-	uint32_t mmu_enable;
-	uint32_t csc_mode;
-	uint32_t secure_mode;
+	u32 mmu_enable;
+	u32 csc_mode;
+	u32 secure_mode;
 	int32_t shared_fd;
-	uint32_t reserved0;
+	u32 reserved0;
 } dss_img_t;
 
 typedef struct drm_dss_layer {
@@ -141,13 +141,13 @@ typedef struct drm_dss_layer {
 	dss_rect_t src_rect;
 	dss_rect_t src_rect_mask;
 	dss_rect_t dst_rect;
-	uint32_t transform;
+	u32 transform;
 	int32_t blending;
-	uint32_t glb_alpha;
-	uint32_t color;		/* background color or dim color */
+	u32 glb_alpha;
+	u32 color;		/* background color or dim color */
 	int32_t layer_idx;
 	int32_t chn_idx;
-	uint32_t need_cap;
+	u32 need_cap;
 	int32_t acquire_fence;
 } drm_dss_layer_t;
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
index a5152708abb7..cdf2f1d22e5e 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
@@ -193,6 +193,12 @@ typedef struct drm_dss_layer {
 #define DEFAULT_PCLK_PCTRL_RATE	(80000000UL)
 #define DSS_MAX_PXL0_CLK_288M (288000000UL)
 
+/*dss clk power off */
+#define DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF   	(277000000UL)
+#define DEFAULT_DSS_PXL0_CLK_RATE_POWER_OFF    	(277000000UL)
+#define DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF 	(238000000UL)
+#define DEFAULT_DSS_PXL1_CLK_RATE_POWER_OFF 	(238000000UL)
+
 #define MMBUF_SIZE_MAX	(288 * 1024)
 #define HISI_DSS_CMDLIST_MAX	(16)
 #define HISI_DSS_CMDLIST_IDXS_MAX (0xFFFF)
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
index 739b3bd82f02..470e08ed646b 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
@@ -315,6 +315,23 @@ void init_ldi(struct dss_crtc *acrtc)
 	set_reg(ldi_base + LDI_CTRL, 0x0, 1, 0);
 }
 
+void deinit_ldi(struct dss_crtc *acrtc)
+{
+	struct dss_hw_ctx *ctx;
+	char __iomem *ldi_base;
+
+	ctx = acrtc->ctx;
+	if (!ctx) {
+		DRM_ERROR("ctx is NULL!\n");
+		return ;
+	}
+
+	ldi_base = ctx->base + DSS_LDI0_OFFSET;
+
+	/* ldi disable*/
+	set_reg(ldi_base + LDI_CTRL, 0, 1, 0);
+}
+
 void init_dbuf(struct dss_crtc *acrtc)
 {
 	struct dss_hw_ctx *ctx;
@@ -480,7 +497,6 @@ void init_dpp(struct dss_crtc *acrtc)
 	char __iomem *dpp_base;
 	char __iomem *mctl_sys_base;
 
-	DRM_INFO("+. \n");
 	ctx = acrtc->ctx;
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
@@ -524,8 +540,6 @@ void init_dpp(struct dss_crtc *acrtc)
 	set_reg(mctl_base + MCTL_CTL_MUTEX, 0x0, 1, 0);
 	#endif
 #endif
-
-	DRM_INFO("-. \n");
 }
 
 void enable_ldi(struct dss_crtc *acrtc)
@@ -681,6 +695,52 @@ int dpe_init(struct dss_crtc *acrtc)
 	return 0;
 }
 
+int dpe_deinit(struct dss_crtc *acrtc)
+{
+	deinit_ldi(acrtc);
+
+	return 0;
+}
+
+void dpe_check_itf_status(struct dss_crtc *acrtc)
+{
+	struct dss_hw_ctx *ctx;
+	char __iomem *mctl_sys_base = NULL;
+	int tmp = 0;
+	int delay_count = 0;
+	bool is_timeout = true;
+	int itf_idx = 0;
+
+	ctx = acrtc->ctx;
+	if (!ctx) {
+		DRM_ERROR("ctx is NULL!\n");
+		return ;
+	}
+
+	itf_idx = 0;
+	mctl_sys_base =  ctx->base + DSS_MCTRL_SYS_OFFSET;
+
+	while (1) {
+		tmp = inp32(mctl_sys_base + MCTL_MOD17_STATUS + itf_idx * 0x4);
+		if (((tmp & 0x10) == 0x10) || delay_count > 100) {
+			is_timeout = (delay_count > 100) ? true : false;
+			delay_count = 0;
+			break;
+		} else {
+			mdelay(1);
+			++delay_count;
+		}
+	}
+
+	if (is_timeout) {
+		DRM_DEBUG_DRIVER("mctl_itf%d not in idle status,ints=0x%x !\n", itf_idx, tmp);
+	}
+}
+
+void dss_inner_clk_pdp_disable(struct dss_hw_ctx *ctx)
+{
+}
+
 void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx)
 {
 	char __iomem *dss_base;
@@ -938,6 +998,36 @@ int dpe_common_clk_enable(struct dss_hw_ctx *ctx)
 	return 0;
 }
 
+int dpe_common_clk_disable(struct dss_hw_ctx *ctx)
+{
+	struct clk *clk_tmp = NULL;
+
+	if (ctx == NULL) {
+		DRM_ERROR("ctx is NULL point!\n");
+		return -EINVAL;
+	}
+
+	clk_tmp = ctx->dss_pclk_dss_clk;
+	if (clk_tmp) {
+		clk_disable(clk_tmp);
+		clk_unprepare(clk_tmp);
+	}
+
+	clk_tmp = ctx->dss_axi_clk;
+	if (clk_tmp) {
+		clk_disable(clk_tmp);
+		clk_unprepare(clk_tmp);
+	}
+
+	clk_tmp = ctx->dss_mmbuf_clk;
+	if (clk_tmp) {
+		clk_disable(clk_tmp);
+		clk_unprepare(clk_tmp);
+	}
+
+	return 0;
+}
+
 int dpe_inner_clk_enable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
@@ -981,6 +1071,31 @@ int dpe_inner_clk_enable(struct dss_hw_ctx *ctx)
 	return 0;
 }
 
+int dpe_inner_clk_disable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+	struct clk *clk_tmp = NULL;
+
+	if (ctx == NULL) {
+		DRM_ERROR("ctx is NULL point!\n");
+		return -EINVAL;
+	}
+
+	clk_tmp = ctx->dss_pxl0_clk;
+	if (clk_tmp) {
+		clk_disable(clk_tmp);
+		clk_unprepare(clk_tmp);
+	}
+
+	clk_tmp = ctx->dss_pri_clk;
+	if (clk_tmp) {
+		clk_disable(clk_tmp);
+		clk_unprepare(clk_tmp);
+	}
+
+	return 0;
+}
+
 int dpe_regulator_enable(struct dss_hw_ctx *ctx)
 {
 	int ret = 0;
@@ -1002,6 +1117,38 @@ int dpe_regulator_enable(struct dss_hw_ctx *ctx)
 	return ret;
 }
 
+int dpe_regulator_disable(struct dss_hw_ctx *ctx)
+{
+	int ret = 0;
+
+	DRM_INFO("+. \n");
+	if (NULL == ctx) {
+		DRM_ERROR("NULL ptr.\n");
+		return -EINVAL;
+	}
+
+	#if defined (CONFIG_HISI_FB_970)
+		dpe_set_clk_rate_on_pll0(ctx);
+	#endif
+
+	ret = regulator_disable(ctx->dpe_regulator);
+	if (ret != 0) {
+		DRM_ERROR("dpe regulator_disable failed, error=%d!\n", ret);
+		return -EINVAL;
+	}
+
+	if (ctx->g_dss_version_tag != FB_ACCEL_KIRIN970) {
+		ret = regulator_bulk_disable(1, ctx->mmbuf_regulator);
+		if (ret != 0) {
+			DRM_ERROR("mmbuf regulator_disable failed, error=%d!\n", ret);
+			return -EINVAL;
+		}
+	}
+
+	DRM_INFO("-. \n");
+	return ret;
+}
+
 int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 {
 	struct dss_clk_rate *pdss_clk_rate = NULL;
@@ -1009,20 +1156,19 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 	uint64_t dss_mmbuf_rate;
 	int ret = 0;
 
-	DRM_INFO("+. \n");
 	if (NULL == ctx) {
 		DRM_ERROR("NULL Pointer!\n");
 		return -EINVAL;
 	}
 
+#if 0
 	pdss_clk_rate = get_dss_clk_rate(ctx);
 	if (NULL == pdss_clk_rate) {
 		DRM_ERROR("NULL Pointer!\n");
 		return -EINVAL;
 	}
-
-	dss_pri_clk_rate = pdss_clk_rate->dss_pri_clk_rate;
-	ret = clk_set_rate(ctx->dss_pri_clk, dss_pri_clk_rate);
+#endif
+	ret = clk_set_rate(ctx->dss_pri_clk, DEFAULT_DSS_CORE_CLK_RATE_L1);
 	if (ret < 0) {
 		DRM_ERROR("dss_pri_clk clk_set_rate(%llu) failed, error=%d!\n",
 			dss_pri_clk_rate, ret);
@@ -1045,8 +1191,7 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 			pinfo->pxl_clk_rate, (uint64_t)clk_get_rate(ctx->dss_pxl0_clk));
 #endif
 
-	dss_mmbuf_rate = pdss_clk_rate->dss_mmbuf_rate;
-	ret = clk_set_rate(ctx->dss_mmbuf_clk, dss_mmbuf_rate);
+	ret = clk_set_rate(ctx->dss_mmbuf_clk, DEFAULT_DSS_MMBUF_CLK_RATE_L1);
 	if (ret < 0) {
 		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n",
 			dss_mmbuf_rate, ret);
@@ -1058,3 +1203,44 @@ int dpe_set_clk_rate(struct dss_hw_ctx *ctx)
 
 	return ret;
 }
+
+int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx)
+{
+	struct dss_clk_rate *pdss_clk_rate = NULL;
+	uint64_t dss_pri_clk_rate;
+	uint64_t dss_mmbuf_rate;
+	int ret;
+	uint64_t clk_rate;
+
+	DRM_INFO("+. \n");
+	if (NULL == ctx) {
+		DRM_ERROR("NULL Pointer!\n");
+		return -EINVAL;
+	}
+
+	clk_rate = DEFAULT_DSS_MMBUF_CLK_RATE_POWER_OFF;
+	ret = clk_set_rate(ctx->dss_mmbuf_clk, clk_rate);
+	if (ret < 0) {
+		DRM_ERROR("dss_mmbuf clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
+		return -EINVAL;
+	}
+	DRM_INFO("dss_mmbuf_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_mmbuf_clk));
+
+	clk_rate = DEFAULT_DSS_CORE_CLK_RATE_POWER_OFF;
+	ret = clk_set_rate(ctx->dss_pri_clk, clk_rate);
+	if (ret < 0) {
+		DRM_ERROR("dss_pri_clk clk_set_rate(%llu) failed, error=%d!\n", clk_rate, ret);
+		return -EINVAL;
+	}
+	DRM_INFO("dss_pri_clk:[%llu]->[%llu].\n", clk_rate, (uint64_t)clk_get_rate(ctx->dss_pri_clk));
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
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
index 638890615656..d62ea734319b 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
@@ -38,19 +38,27 @@ void enable_ldi(struct dss_crtc *acrtc);
 void disable_ldi(struct dss_crtc *acrtc);
 
 void dss_inner_clk_pdp_enable(struct dss_hw_ctx *ctx);
+void dss_inner_clk_pdp_disable(struct dss_hw_ctx *ctx);
 void dss_inner_clk_common_enable(struct dss_hw_ctx *ctx);
+void dss_inner_clk_common_disable(struct dss_hw_ctx *ctx);
 void dpe_interrupt_clear(struct dss_crtc *acrtc);
 void dpe_interrupt_unmask(struct dss_crtc *acrtc);
 void dpe_interrupt_mask(struct dss_crtc *acrtc);
 int dpe_common_clk_enable(struct dss_hw_ctx *ctx);
+int dpe_common_clk_disable(struct dss_hw_ctx *ctx);
 int dpe_inner_clk_enable(struct dss_hw_ctx *ctx);
+int dpe_inner_clk_disable(struct dss_hw_ctx *ctx);
 int dpe_regulator_enable(struct dss_hw_ctx *ctx);
+int dpe_regulator_disable(struct dss_hw_ctx *ctx);
 int dpe_set_clk_rate(struct dss_hw_ctx *ctx);
 
 int dpe_irq_enable(struct dss_crtc *acrtc);
 int dpe_irq_disable(struct dss_crtc *acrtc);
 
 int dpe_init(struct dss_crtc *acrtc);
+int dpe_deinit(struct dss_crtc *acrtc);
+void dpe_check_itf_status(acrtc);
+int dpe_set_clk_rate_on_pll0(struct dss_hw_ctx *ctx);
 
 void hisifb_dss_on(struct dss_hw_ctx *ctx);
 void hisi_dss_mctl_on(struct dss_hw_ctx *ctx);
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
index 4ae411b29cf4..a92594553b80 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
@@ -372,6 +372,36 @@ static int kirin_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int kirin_drm_platform_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct device *dev = &pdev->dev;
+
+	DRM_INFO("+. pdev->name is %s, m_message is %d \n", pdev->name, state.event);
+	if (!dc_ops) {
+		DRM_ERROR("dc_ops is NULL\n");
+		return -EINVAL;
+	}
+	dc_ops->suspend(pdev, state);
+
+	DRM_INFO("-. \n");
+	return 0;
+}
+
+static int kirin_drm_platform_resume(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	DRM_INFO("+. pdev->name is %s \n", pdev->name);
+	if (!dc_ops) {
+		DRM_ERROR("dc_ops is NULL\n");
+		return -EINVAL;
+	}
+	dc_ops->resume(pdev);
+
+	DRM_INFO("-. \n");
+	return 0;
+}
+
 static const struct of_device_id kirin_drm_dt_ids[] = {
 	{ .compatible = "hisilicon,hi3660-dpe",
 	  .data = &dss_dc_ops,
@@ -386,6 +416,8 @@ MODULE_DEVICE_TABLE(of, kirin_drm_dt_ids);
 static struct platform_driver kirin_drm_platform_driver = {
 	.probe = kirin_drm_platform_probe,
 	.remove = kirin_drm_platform_remove,
+	.suspend = kirin_drm_platform_suspend,
+	.resume = kirin_drm_platform_resume,
 	.driver = {
 		.name = "kirin-drm",
 		.of_match_table = kirin_drm_dt_ids,
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
index 3aee36a40749..697955a8e96c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
@@ -29,6 +29,8 @@
 struct kirin_dc_ops {
 	int (*init)(struct drm_device *dev);
 	void (*cleanup)(struct drm_device *dev);
+	int (*suspend)(struct platform_device *pdev, pm_message_t state);
+	int (*resume)(struct platform_device *pdev);
 };
 
 struct kirin_drm_private {
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index fe9d8f7166df..b5ac4d7ae829 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -43,7 +43,7 @@
 #include "kirin_dpe_reg.h"
 #endif
 
-#define DSS_POWER_UP_ON_UEFI
+//#define DSS_POWER_UP_ON_UEFI
 
 #if defined (CONFIG_HISI_FB_970)
 #define DTS_COMP_DSS_NAME "hisilicon,kirin970-dpe"
@@ -320,7 +320,6 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
 #if defined (CONFIG_HISI_FB_970)
-	//mds_regulator_enable(ctx);
 	dpe_common_clk_enable(ctx);
 	dpe_inner_clk_enable(ctx);
 	#ifndef DSS_POWER_UP_ON_UEFI
@@ -371,17 +370,29 @@ static int dss_power_up(struct dss_crtc *acrtc)
 	return 0;
 }
 
-#if 0
 static void dss_power_down(struct dss_crtc *acrtc)
 {
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 
 	dpe_interrupt_mask(acrtc);
 	dpe_irq_disable(acrtc);
+	dpe_deinit(acrtc);
 
+	//FIXME:
+	dpe_check_itf_status(acrtc);
+	dss_inner_clk_pdp_disable(ctx);
+
+	if (ctx->g_dss_version_tag & FB_ACCEL_KIRIN970 ) {
+		dpe_inner_clk_disable(ctx);
+		dpe_common_clk_disable(ctx);
+		dpe_regulator_disable(ctx);
+	} else {
+		dpe_regulator_disable(ctx);
+		dpe_inner_clk_disable(ctx);
+		dpe_common_clk_disable(ctx);
+	}
 	ctx->power_on = false;
 }
-#endif
 
 static int dss_enable_vblank(struct drm_device *dev, unsigned int pipe)
 {
@@ -478,7 +489,7 @@ static void dss_crtc_disable(struct drm_crtc *crtc)
 	if (!acrtc->enable)
 		return;
 
-	/*dss_power_down(acrtc);*/
+	dss_power_down(acrtc);
 	acrtc->enable = false;
 	drm_crtc_vblank_off(crtc);
 }
@@ -621,6 +632,7 @@ static int dss_plane_atomic_check(struct drm_plane *plane,
 static void dss_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
+	struct drm_atomic_state *atomic_state;
 	hisi_fb_pan_display(plane);
 }
 
@@ -932,7 +944,36 @@ static void dss_drm_cleanup(struct drm_device *dev)
 	drm_crtc_cleanup(crtc);
 }
 
+static int  dss_drm_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct dss_data *dss = platform_get_drvdata(pdev);
+	struct drm_crtc *crtc = &dss->acrtc.base;
+
+	DRM_INFO("+. platform_device name is %s \n", pdev->name);
+	dss_crtc_disable(crtc);
+
+	DRM_INFO("-. \n");
+
+	return 0;
+}
+
+static int  dss_drm_resume(struct platform_device *pdev)
+{
+	struct dss_data *dss = platform_get_drvdata(pdev);
+	struct drm_crtc *crtc = &dss->acrtc.base;
+
+	DRM_INFO("+. platform_device name is %s \n", pdev->name);
+
+	dss_crtc_mode_set_nofb(crtc);
+	dss_crtc_enable(crtc);
+
+	DRM_INFO("-. \n");
+	return 0;
+}
+
 const struct kirin_dc_ops dss_dc_ops = {
 	.init = dss_drm_init,
-	.cleanup = dss_drm_cleanup
+	.cleanup = dss_drm_cleanup,
+	.suspend = dss_drm_suspend,
+	.resume = dss_drm_resume,
 };
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index 3023620342ed..5ec71ec53e23 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -1202,7 +1202,6 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 		return -1;
 	}
 
-	DRM_INFO("+. \n");
 	mctl_sys_base = ctx->base + DSS_MCTRL_SYS_OFFSET;
 	mctl_base = ctx->base +
 		g_dss_module_ovl_base[DSS_OVL0][MODULE_MCTL_BASE];
@@ -1248,8 +1247,6 @@ int hisi_dss_ovl_base_config(struct dss_hw_ctx *ctx, u32 xres, u32 yres)
 	set_reg(mctl_base + MCTL_CTL_MUTEX_OV, 1 << DSS_OVL0, 4, 0);
 	set_reg(mctl_sys_base + MCTL_OV0_FLUSH_EN, 0xd, 4, 0);
 
-	DRM_INFO("-. \n");
-
 	return 0;
 }
 
@@ -1361,15 +1358,12 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 	uint64_t fama_phy_pgd_base;
 	uint32_t fama_ptw_msb;
 
-	DRM_INFO("+. \n");
 	if (!ctx) {
 		DRM_ERROR("ctx is NULL!\n");
 		return;
 	}
 
-	DRM_INFO("ctx->base = 0x%x \n", ctx->base);
 	smmu_base = ctx->base + DSS_SMMU_OFFSET;
-	DRM_INFO("smmu_base = 0x%x \n", smmu_base);
 
 	set_reg(smmu_base + SMMU_SCR, 0x0, 1, 0);  /*global bypass cancel*/
 	set_reg(smmu_base + SMMU_SCR, 0x1, 8, 20); /*ptw_mid*/
@@ -1398,8 +1392,6 @@ void hisi_dss_smmu_on(struct dss_hw_ctx *ctx)
 	phy_pgd_base = (uint32_t)(domain_data->phy_pgd_base);
 	DRM_DEBUG("fama_phy_pgd_base = %llu, phy_pgd_base =0x%x \n", fama_phy_pgd_base, phy_pgd_base);
 	set_reg(smmu_base + SMMU_CB_TTBR0, phy_pgd_base, 32, 0);
-
-	DRM_INFO("-. \n");
 }
 
 void hisifb_dss_on(struct dss_hw_ctx *ctx)
@@ -1452,11 +1444,54 @@ void hisi_dss_unflow_handler(struct dss_hw_ctx *ctx, bool unmask)
 	outp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK, tmp);
 }
 
-static int hisi_dss_wait_for_complete(struct dss_hw_ctx *ctx)
+void hisifb_mctl_sw_clr(struct dss_crtc *acrtc)
+{
+	char __iomem *mctl_base = NULL;
+	struct dss_hw_ctx *ctx = acrtc->ctx;
+	int mctl_idx;
+	int mctl_status;
+	int delay_count = 0;
+	bool is_timeout;
+
+	DRM_INFO("+.\n");
+	if (!ctx) {
+		DRM_ERROR("ctx is NULL!\n");
+		return;
+	}
+
+	mctl_base = ctx->base +
+		g_dss_module_ovl_base[DSS_MCTL0][MODULE_MCTL_BASE];
+
+	if (mctl_base) {
+		set_reg(mctl_base + MCTL_CTL_CLEAR, 0x1, 1, 0);
+	}
+
+	while (1) {
+		mctl_status = inp32(mctl_base + MCTL_CTL_STATUS);
+		if (((mctl_status & 0x10) == 0) || (delay_count > 500)) {
+			is_timeout = (delay_count > 100) ? true : false;
+			delay_count = 0;
+			break;
+		} else {
+			udelay(1);
+			++delay_count;
+		}
+	}
+
+	if (is_timeout) {
+		DRM_ERROR("mctl_status =0x%x !\n", mctl_status);
+	}
+
+	enable_ldi(acrtc);
+	DRM_INFO("-.\n");
+}
+
+static int hisi_dss_wait_for_complete(struct dss_crtc *acrtc)
 {
 	int ret = 0;
 	u32 times = 0;
 	u32 prev_vactive0_end = 0;
+	struct dss_hw_ctx *ctx = acrtc->ctx;
 
 	prev_vactive0_end = ctx->vactive0_end_flag;
 
@@ -1473,6 +1508,8 @@ static int hisi_dss_wait_for_complete(struct dss_hw_ctx *ctx)
 	}
 
 	if (ret <= 0) {
+		disable_ldi(acrtc);
+		hisifb_mctl_sw_clr(acrtc);
 		DRM_ERROR("wait_for vactive0_end_flag timeout! ret=%d.\n", ret);
 
 		ret = -ETIMEDOUT;
@@ -1547,7 +1584,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	rect.bottom = src_h - 1;
 	hal_fmt = HISI_FB_PIXEL_FORMAT_BGRA_8888;//dss_get_format(fb->pixel_format);
 
-	DRM_DEBUG("channel%d: src:(%d,%d, %dx%d) crtc:(%d,%d, %dx%d), rect(%d,%d,%d,%d),"
+	DRM_DEBUG_DRIVER("channel%d: src:(%d,%d, %dx%d) crtc:(%d,%d, %dx%d), rect(%d,%d,%d,%d),"
 		"fb:%dx%d, pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d, bits_per_pixel=%d.\n",
 		chn_idx, src_x, src_y, src_w, src_h,
 		crtc_x, crtc_y, crtc_w, crtc_h,
@@ -1577,7 +1614,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hisi_dss_unflow_handler(ctx, true);
 
 	enable_ldi(acrtc);
-	hisi_dss_wait_for_complete(ctx);
+	hisi_dss_wait_for_complete(acrtc);
 }
 
 void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, drm_dss_layer_t *layer)
@@ -1646,5 +1683,5 @@ void hisi_dss_online_play(struct kirin_fbdev *fbdev, struct drm_plane *plane, dr
 	hisi_dss_unflow_handler(ctx, true);
 
 	enable_ldi(acrtc);
-	hisi_dss_wait_for_complete(ctx);
+	hisi_dss_wait_for_complete(acrtc);
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c b/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
index 496196997f6b..80e3dd713914 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_fbdev.c
@@ -194,8 +194,7 @@ static int kirin_fbdev_mmap(struct fb_info *info, struct vm_area_struct * vma)
 
 		addr += len;
 		if (addr >= vma->vm_end) {
-			DRM_ERROR("addr = 0x%x!, vma->vm_end = 0x%x\n", addr, vma->vm_end);
-
+			DRM_INFO("addr = 0x%x!, vma->vm_end = 0x%x\n", addr, vma->vm_end);
 			return 0;
 		}
 	}
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
