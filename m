Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52071249C5A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B875B6E286;
	Wed, 19 Aug 2020 11:47:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD0EC6E223
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35E2022BEF;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=UsZ1EYtEOsLuGAzZUHwJoGDFJzV1U12FUmDaMjijanI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dl2APyX20G05l8tX92L35U1H4xU8s3O1SHUjh3EHoqAhihR9/q5YEBAK48bkzFJxZ
 torO8Q1H6tFgqXVlegxaClTbZIhoB+RSwI1kkDbuwpOYnevJRP4dTPwlp+pzaN0oTI
 Qy0MRGWnz4eAiJX5+X12qTT8U8U1Si+vOqRJM1TI=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Euag-44; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 18/49] staging: hikey9xx/gpu: port driver to upstream kAPIs
Date: Wed, 19 Aug 2020 13:45:46 +0200
Message-Id: <7c99d6fc401cd8d1c25a63028bc65230551a953b.1597833138.git.mchehab+huawei@kernel.org>
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
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There were several changes at the upstream kAPIs since
Kernel 4.4. Update the driver for it to build with the
upstream Kernel.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/kirin9xx_drm_drv.c   | 28 +++---
 .../staging/hikey9xx/gpu/kirin9xx_drm_dss.c   | 26 +++---
 .../hikey9xx/gpu/kirin9xx_drm_overlay_utils.c |  6 +-
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        | 86 ++++++-------------
 4 files changed, 57 insertions(+), 89 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
index 616fa7ca9c77..49f591da1cf7 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
@@ -46,7 +46,6 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
 		priv->fbdev = NULL;
 
 	drm_kms_helper_poll_fini(dev);
-	drm_vblank_cleanup(dev);
 	dc_ops->cleanup(dev);
 	drm_mode_config_cleanup(dev);
 	devm_kfree(dev->dev, priv);
@@ -80,7 +79,7 @@ static void kirin_fbdev_output_poll_changed(struct drm_device *dev)
 }
 
 static const struct drm_mode_config_funcs kirin_drm_mode_config_funcs = {
-	.fb_create = drm_fb_cma_create,
+	.fb_create = drm_gem_fb_create,
 	.output_poll_changed = kirin_fbdev_output_poll_changed,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
@@ -182,12 +181,14 @@ static int kirin_gem_cma_dumb_create(struct drm_file *file,
 
 static int kirin_drm_connectors_register(struct drm_device *dev)
 {
-	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *failed_connector;
+	struct drm_connector *connector;
 	int ret;
 
 	mutex_lock(&dev->mode_config.mutex);
-	drm_for_each_connector(connector, dev) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		ret = drm_connector_register(connector);
 		if (ret) {
 			failed_connector = connector;
@@ -199,7 +200,8 @@ static int kirin_drm_connectors_register(struct drm_device *dev)
 	return 0;
 
 err:
-	drm_for_each_connector(connector, dev) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (failed_connector == connector)
 			break;
 		drm_connector_unregister(connector);
@@ -210,15 +212,13 @@ static int kirin_drm_connectors_register(struct drm_device *dev)
 }
 
 static struct drm_driver kirin_drm_driver = {
-	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET |
 				  DRIVER_ATOMIC | DRIVER_RENDER,
 	.fops				= &kirin_drm_fops,
 
 	.gem_free_object	= drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
 	.dumb_create		= kirin_gem_cma_dumb_create,
-	.dumb_map_offset	= drm_gem_cma_dumb_map_offset,
-	.dumb_destroy		= drm_gem_dumb_destroy,
 
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
@@ -258,14 +258,10 @@ static int kirin_drm_bind(struct device *dev)
 	struct drm_device *drm_dev;
 	int ret;
 
-	//drm_platform_init(&kirin_drm_driver, to_platform_device(dev));
-
 	drm_dev = drm_dev_alloc(driver, dev);
 	if (!drm_dev)
 		return -ENOMEM;
 
-	drm_dev->platformdev = to_platform_device(dev);
-
 	ret = kirin_drm_kms_init(drm_dev);
 	if (ret)
 		goto err_drm_dev_unref;
@@ -290,14 +286,18 @@ static int kirin_drm_bind(struct device *dev)
 err_kms_cleanup:
 	kirin_drm_kms_cleanup(drm_dev);
 err_drm_dev_unref:
-	drm_dev_unref(drm_dev);
+	drm_dev_put(drm_dev);
 
 	return ret;
 }
 
 static void kirin_drm_unbind(struct device *dev)
 {
-	drm_put_dev(dev_get_drvdata(dev));
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+	drm_dev_unregister(drm_dev);
+	kirin_drm_kms_cleanup(drm_dev);
+	drm_dev_put(drm_dev);
 }
 
 static const struct component_master_ops kirin_drm_ops = {
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
index fd0ccbaebd3f..e7907a0b511c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
@@ -458,7 +458,8 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void dss_crtc_enable(struct drm_crtc *crtc)
+static void dss_crtc_enable(struct drm_crtc *crtc,
+			    struct drm_crtc_state *old_state)
 {
 	struct dss_crtc *acrtc = to_dss_crtc(crtc);
 	struct dss_hw_ctx *ctx = acrtc->ctx;
@@ -477,7 +478,8 @@ static void dss_crtc_enable(struct drm_crtc *crtc)
 	drm_crtc_vblank_on(crtc);
 }
 
-static void dss_crtc_disable(struct drm_crtc *crtc)
+static void dss_crtc_disable(struct drm_crtc *crtc,
+			     struct drm_crtc_state *old_state)
 {
 	struct dss_crtc *acrtc = to_dss_crtc(crtc);
 
@@ -529,8 +531,8 @@ static void dss_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs dss_crtc_helper_funcs = {
-	.enable		= dss_crtc_enable,
-	.disable	= dss_crtc_disable,
+	.atomic_enable	= dss_crtc_enable,
+	.atomic_disable	= dss_crtc_disable,
 	.mode_set_nofb	= dss_crtc_mode_set_nofb,
 	.atomic_begin	= dss_crtc_atomic_begin,
 	.atomic_flush	= dss_crtc_atomic_flush,
@@ -541,7 +543,6 @@ static const struct drm_crtc_funcs dss_crtc_funcs = {
 	.set_config	= drm_atomic_helper_set_config,
 	.page_flip	= drm_atomic_helper_page_flip,
 	.reset		= drm_atomic_helper_crtc_reset,
-	.set_property = drm_atomic_helper_crtc_set_property,
 	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
 };
@@ -597,7 +598,7 @@ static int dss_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc || !fb)
 		return 0;
 
-	fmt = dss_get_format(fb->pixel_format);
+	fmt = dss_get_format(fb->format->format);
 	if (fmt == HISI_FB_PIXEL_FORMAT_UNSUPPORT)
 		return -EINVAL;
 
@@ -645,7 +646,6 @@ static const struct drm_plane_helper_funcs dss_plane_helper_funcs = {
 static struct drm_plane_funcs dss_plane_funcs = {
 	.update_plane	= drm_atomic_helper_update_plane,
 	.disable_plane	= drm_atomic_helper_disable_plane,
-	.set_property = drm_atomic_helper_plane_set_property,
 	.destroy = drm_plane_cleanup,
 	.reset = drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
@@ -665,7 +665,8 @@ static int dss_plane_init(struct drm_device *dev, struct dss_plane *aplane,
 		return ret;
 
 	ret = drm_universal_plane_init(dev, &aplane->base, 1, &dss_plane_funcs,
-				       fmts, fmts_cnt, type, NULL);
+				       fmts, fmts_cnt, NULL,
+				       type, NULL);
 	if (ret) {
 		DRM_ERROR("fail to init plane, ch=%d\n", aplane->ch);
 		return ret;
@@ -859,7 +860,7 @@ static int dss_dts_parse(struct platform_device *pdev, struct dss_hw_ctx *ctx)
 
 static int dss_drm_init(struct drm_device *dev)
 {
-	struct platform_device *pdev = dev->platformdev;
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct dss_data *dss;
 	struct dss_hw_ctx *ctx;
 	struct dss_crtc *acrtc;
@@ -927,7 +928,6 @@ static int dss_drm_init(struct drm_device *dev)
 
 	disable_irq(ctx->irq);
 
-	dev->driver->get_vblank_counter = drm_vblank_no_hw_counter;
 	dev->driver->enable_vblank = dss_enable_vblank;
 	dev->driver->disable_vblank = dss_disable_vblank;
 
@@ -936,7 +936,7 @@ static int dss_drm_init(struct drm_device *dev)
 
 static void dss_drm_cleanup(struct drm_device *dev)
 {
-	struct platform_device *pdev = dev->platformdev;
+	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct dss_data *dss = platform_get_drvdata(pdev);
 	struct drm_crtc *crtc = &dss->acrtc.base;
 
@@ -948,7 +948,7 @@ static int  dss_drm_suspend(struct platform_device *pdev, pm_message_t state)
 	struct dss_data *dss = platform_get_drvdata(pdev);
 	struct drm_crtc *crtc = &dss->acrtc.base;
 
-	dss_crtc_disable(crtc);
+	dss_crtc_disable(crtc, NULL);
 
 	return 0;
 }
@@ -959,7 +959,7 @@ static int  dss_drm_resume(struct platform_device *pdev)
 	struct drm_crtc *crtc = &dss->acrtc.base;
 
 	dss_crtc_mode_set_nofb(crtc);
-	dss_crtc_enable(crtc);
+	dss_crtc_enable(crtc, NULL);
 
 	return 0;
 }
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
index 4e79f630de96..8be5865b615c 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
@@ -1547,7 +1547,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	mode = &acrtc->base.state->mode;
 	adj_mode = &acrtc->base.state->adjusted_mode;
 
-	bpp = fb->bits_per_pixel / 8;
+	bpp = fb->format->cpp[0];
 	stride = fb->pitches[0];
 
 #ifndef CMA_BUFFER_USED
@@ -1566,12 +1566,12 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	hal_fmt = HISI_FB_PIXEL_FORMAT_BGRA_8888;//dss_get_format(fb->pixel_format);
 
 	DRM_DEBUG_DRIVER("channel%d: src:(%d,%d, %dx%d) crtc:(%d,%d, %dx%d), rect(%d,%d,%d,%d),"
-		"fb:%dx%d, pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d, bits_per_pixel=%d.\n",
+		"fb:%dx%d, pixel_format=%d, stride=%d, paddr=0x%x, bpp=%d.\n",
 		chn_idx, src_x, src_y, src_w, src_h,
 		crtc_x, crtc_y, crtc_w, crtc_h,
 		rect.left, rect.top, rect.right, rect.bottom,
 		fb->width, fb->height, hal_fmt,
-		stride, display_addr, bpp, fb->bits_per_pixel);
+		stride, display_addr, bpp);
 
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index 21fddeaa3c66..cfb6bfd1c338 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -31,19 +31,19 @@
 #include <drm/drm_probe_helper.h>
 
 
-#include "dw_dsi_reg.h"
-#if defined (CONFIG_HISI_FB_970)
+#include "kirin9xx_dw_dsi_reg.h"
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 #include "kirin970_dpe_reg.h"
 #else
-#include "kirin_dpe_reg.h"
+#include "kirin960_dpe_reg.h"
 #endif
-#include "kirin_drm_dpe_utils.h"
-#include "kirin_drm_drv.h"
+#include "kirin9xx_drm_dpe_utils.h"
+#include "kirin9xx_drm_drv.h"
 
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 #define DTS_COMP_DSI_NAME "hisilicon,kirin970-dsi"
 #else
-#define DTS_COMP_DSI_NAME "hisilicon,hi3660-dsi"
+#define DTS_COMP_DSI_NAME "hisilicon,kirin960-dsi"
 #endif
 
 #define ROUND(x, y)		((x) / (y) + \
@@ -272,8 +272,9 @@ static const struct dsi_phy_range dphy_range_info[] = {
 
 void dsi_set_output_client(struct drm_device *dev)
 {
-	enum dsi_output_client client;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
+	enum dsi_output_client client;
 	struct drm_encoder *encoder;
 	struct dw_dsi *dsi;
 
@@ -286,7 +287,8 @@ void dsi_set_output_client(struct drm_device *dev)
 	dsi = encoder_to_dsi(encoder);
 
 	/* find HDMI connector */
-	drm_for_each_connector(connector, dev)
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter)
 		if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA)
 			break;
 
@@ -295,17 +297,13 @@ void dsi_set_output_client(struct drm_device *dev)
 	 */
 	client = connector->status == connector_status_connected ?
 		OUT_HDMI : OUT_PANEL;
+
 	if (client != dsi->cur_client) {
-		/* associate bridge and dsi encoder */
-		if (client == OUT_HDMI)
-			encoder->bridge = dsi->bridge;
-		else
-			encoder->bridge = NULL;
-
 		gpiod_set_value_cansleep(dsi->gpio_mux, client);
 		dsi->cur_client = client;
-		/* let the userspace know panel connector status has changed */
-		drm_sysfs_hotplug_event(dev);
+
+		msleep(20);
+
 		DRM_INFO("client change to %s\n", client == OUT_HDMI ?
 				 "HDMI" : "panel");
 	}
@@ -314,7 +312,7 @@ void dsi_set_output_client(struct drm_device *dev)
 }
 EXPORT_SYMBOL(dsi_set_output_client);
 
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 static void get_dsi_dphy_ctrl(struct dw_dsi *dsi,
 							struct mipi_phy_params *phy_ctrl)
 {
@@ -1025,7 +1023,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	dss_rect_t rect;
 	u32 cmp_stopstate_val = 0;
 	u32 lanes;
-#if !defined (CONFIG_HISI_FB_970)
+#if !defined (CONFIG_DRM_HISI_KIRIN970)
 	int i = 0;
 #endif
 
@@ -1042,7 +1040,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 
 	memset(&dsi->phy, 0, sizeof(struct mipi_phy_params));
 
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 	get_dsi_dphy_ctrl(dsi, &dsi->phy);
 #else
 	get_dsi_phy_ctrl(dsi, &dsi->phy);
@@ -1065,7 +1063,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000001);
 	outp32(mipi_dsi_base + MIPIDSI_PHY_TST_CTRL0_OFFSET, 0x00000000);
 
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 	dsi_phy_tst_set(mipi_dsi_base, 0x0042, 0x21);
 	//PLL configuration I
 	dsi_phy_tst_set(mipi_dsi_base, 0x0046, dsi->phy.rg_cp + (dsi->phy.rg_lpf_r << 4));
@@ -1304,7 +1302,7 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET, dsi->phy.data_lane_lp2hs_time, 10, 0);
 	set_reg(mipi_dsi_base + MIPIDSI_PHY_TMR_CFG_OFFSET, dsi->phy.data_lane_hs2lp_time, 10, 16);
 
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 	//16~19bit:pclk_en, pclk_sel, dpipclk_en, dpipclk_sel
 	set_reg(mipi_dsi_base + MIPIDSI_CLKMGR_CFG_OFFSET, 0x5, 4, 16);
 	//0:dphy
@@ -1351,7 +1349,7 @@ static int mipi_dsi_on_sub1(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	dsi_mipi_init(dsi, mipi_dsi_base);
 
 	/* dsi memory init */
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 	outp32(mipi_dsi_base + DSI_MEM_CTRL, 0x02600008);
 #endif
 
@@ -1382,7 +1380,7 @@ static int mipi_dsi_on_sub2(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	/* enable generate High Speed clock, continue clock */
 	set_reg(mipi_dsi_base + MIPIDSI_LPCLK_CTRL_OFFSET, 0x1, 2, 0);
 
-#if defined(CONFIG_HISI_FB_970)
+#if defined(CONFIG_DRM_HISI_KIRIN970)
 	// init: wait DPHY 4 data lane stopstate
 	pctrl_dphytx_stopcnt = (u64)(dsi->ldi.h_back_porch +
 		dsi->ldi.h_front_porch + dsi->ldi.h_pulse_width + dsi->cur_mode.hdisplay + 5) *
@@ -1671,9 +1669,7 @@ static int dsi_bridge_init(struct drm_device *dev, struct dw_dsi *dsi)
 	int ret;
 
 	/* associate the bridge to dsi encoder */
-	bridge->encoder = encoder;
-
-	ret = drm_bridge_attach(dev, bridge);
+	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to attach external bridge\n");
 		return ret;
@@ -1686,7 +1682,7 @@ static int dsi_connector_get_modes(struct drm_connector *connector)
 {
 	struct dw_dsi *dsi = connector_to_dsi(connector);
 
-	return drm_panel_get_modes(dsi->panel);
+	return drm_panel_get_modes(dsi->panel, connector);
 }
 
 static enum drm_mode_status
@@ -1731,7 +1727,6 @@ static void dsi_connector_destroy(struct drm_connector *connector)
 }
 
 static struct drm_connector_funcs dsi_atomic_connector_funcs = {
-	.dpms = drm_atomic_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = dsi_connector_detect,
 	.destroy = dsi_connector_destroy,
@@ -1756,7 +1751,7 @@ static int dsi_connector_init(struct drm_device *dev, struct dw_dsi *dsi)
 	if (ret)
 		return ret;
 
-	ret = drm_mode_connector_attach_encoder(connector, encoder);
+	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
 
@@ -1925,7 +1920,7 @@ static int dsi_parse_dt(struct platform_device *pdev, struct dw_dsi *dsi)
 		return -ENXIO;
 	}
 
-#if defined (CONFIG_HISI_FB_970)
+#if defined (CONFIG_DRM_HISI_KIRIN970)
 	ctx->pctrl_base = of_iomap(np, 2);
 	if (!(ctx->pctrl_base)) {
 		DRM_ERROR ("failed to get dss pctrl_base resource.\n");
@@ -2042,33 +2037,8 @@ static int dsi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int dsi_suspend(struct platform_device *pdev, pm_message_t state)
-{
-	struct device *dev = &pdev->dev;
-	struct dsi_data *ddata = dev_get_drvdata(dev);
-	struct dw_dsi *dsi = &ddata->dsi;
-
-	dsi_encoder_disable(&dsi->encoder);
-	drm_bridge_post_disable(dsi->encoder.bridge);
-
-	return 0;
-}
-
-static int dsi_resume(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct dsi_data *ddata = dev_get_drvdata(dev);
-	struct dw_dsi *dsi = &ddata->dsi;
-
-	drm_bridge_pre_enable(dsi->encoder.bridge);
-	dsi_encoder_enable(&dsi->encoder);
-
-	return 0;
-}
-
 static const struct of_device_id dsi_of_match[] = {
-	{.compatible = "hisilicon,hi3660-dsi"},
-	{.compatible = "hisilicon,kirin970-dsi"},
+	{.compatible = DTS_COMP_DSI_NAME},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dsi_of_match);
@@ -2076,8 +2046,6 @@ MODULE_DEVICE_TABLE(of, dsi_of_match);
 static struct platform_driver dsi_driver = {
 	.probe = dsi_probe,
 	.remove = dsi_remove,
-	.suspend = dsi_suspend,
-	.resume = dsi_resume,
 	.driver = {
 		.name = "dw-dsi",
 		.of_match_table = dsi_of_match,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
