Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CE4249C0D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C005389C19;
	Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC276E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 278CB2075E;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837581;
 bh=zqNspMux401BCdm+pH7vmh4yZc0oA2hxinQ5YNZNPGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UPn3TXjWYhmWE7KZaa/M5ggJjamyqh6koKVtwDL3upfa5dNsaquLtvtWIk1wul73h
 sd1JRUAylh+fA6MH1LMkVtCPUo0/HcakPLHXaT9YFq8l/c/so9qNdB1sxidL7k0/uS
 PgXfhLcv4uPGDjEN/GbPraxEDtKzztDNe5eRASBk=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00Eua0-59; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 02/49] staging: hikey9xx/gpu: port it to work with Kernel v4.9
Date: Wed, 19 Aug 2020 13:45:30 +0200
Message-Id: <e89c20fc6f7ad8ae07e77d406e859043f75db962.1597833138.git.mchehab+huawei@kernel.org>
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

From: John Stultz <john.stultz@linaro.org>

Update the driver to work with v4.9 kernels

Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/dw_drm_dsi.c     |  4 +-
 drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h  |  1 +
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.c  |  3 +-
 drivers/staging/hikey9xx/gpu/kirin_drm_drv.h  |  1 +
 drivers/staging/hikey9xx/gpu/kirin_drm_dss.c  | 46 ++++++++-----------
 .../hikey9xx/gpu/kirin_drm_overlay_utils.c    |  7 ++-
 6 files changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
index 1d1d4f49609c..9871b375416b 100644
--- a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
@@ -1079,7 +1079,7 @@ static int dw_drm_encoder_init(struct device *dev,
 
 	encoder->possible_crtcs = crtc_mask;
 	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
-			       DRM_MODE_ENCODER_DSI);
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;
@@ -1104,7 +1104,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->client[id].lanes = mdsi->lanes;
 	dsi->client[id].format = mdsi->format;
 	dsi->client[id].mode_flags = mdsi->mode_flags;
-	dsi->client[id].phy_clock = mdsi->phy_clock;
+	dsi->client[id].phy_clock = 0;
 
 	DRM_INFO("host attach, client name=[%s], id=%d\n", mdsi->name, id);
 
diff --git a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
index 61af8ef81878..9fad9ef942bd 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
@@ -18,6 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/wait.h>
 #include <linux/bug.h>
+#include <linux/iommu.h>
 
 #include <linux/ion.h>
 #include <linux/hisi/hisi_ion.h>
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
index edb690062f64..ffa0cd792bf1 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
@@ -200,9 +200,8 @@ static int kirin_drm_connectors_register(struct drm_device *dev)
 
 static struct drm_driver kirin_drm_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
-				  DRIVER_ATOMIC | DRIVER_HAVE_IRQ | DRIVER_RENDER,
+				  DRIVER_ATOMIC | DRIVER_RENDER,
 	.fops				= &kirin_drm_fops,
-	.set_busid			= drm_platform_set_busid,
 
 	.gem_free_object	= drm_gem_cma_free_object,
 	.gem_vm_ops		= &drm_gem_cma_vm_ops,
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
index b361f5f69932..2f842ad36ae9 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
@@ -12,6 +12,7 @@
 #define __KIRIN_DRM_DRV_H__
 
 #include <drm/drmP.h>
+#include <linux/iommu.h>
 #include <linux/ion.h>
 #include <linux/hisi/hisi_ion.h>
 #include <linux/hisi/hisi-iommu.h>
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
index 2a92372d0c81..c47d860f4697 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
@@ -213,6 +213,7 @@ static void dss_disable_vblank(struct drm_device *dev, unsigned int pipe)
 static irqreturn_t dss_irq_handler(int irq, void *data)
 {
 	struct dss_crtc *acrtc = data;
+	struct drm_crtc *crtc = &acrtc->base;
 	struct dss_hw_ctx *ctx = acrtc->ctx;
 	void __iomem *dss_base = ctx->base;
 
@@ -241,8 +242,10 @@ static irqreturn_t dss_irq_handler(int irq, void *data)
 		wake_up_interruptible_all(&ctx->vactive0_start_wq);
 	}
 
-	if (isr_s2 & BIT_VSYNC)
+	if (isr_s2 & BIT_VSYNC) {
 		ctx->vsync_timestamp = ktime_get();
+		drm_crtc_handle_vblank(crtc);
+	}
 
 	if (isr_s2 & BIT_LDI_UNFLOW) {
 		mask = inp32(dss_base + DSS_LDI0_OFFSET + LDI_CPU_ITF_INT_MSK);
@@ -271,6 +274,7 @@ static void dss_crtc_enable(struct drm_crtc *crtc)
 	}
 
 	acrtc->enable = true;
+	drm_crtc_vblank_on(crtc);
 }
 
 static void dss_crtc_disable(struct drm_crtc *crtc)
@@ -282,13 +286,7 @@ static void dss_crtc_disable(struct drm_crtc *crtc)
 
 	/*dss_power_down(acrtc);*/
 	acrtc->enable = false;
-}
-
-static int dss_crtc_atomic_check(struct drm_crtc *crtc,
-				 struct drm_crtc_state *state)
-{
-	/* do nothing */
-	return 0;
+	drm_crtc_vblank_off(crtc);
 }
 
 static void dss_crtc_mode_set_nofb(struct drm_crtc *crtc)
@@ -315,13 +313,24 @@ static void dss_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_crtc_state *old_state)
 
 {
+	struct drm_pending_vblank_event *event = crtc->state->event;
+
+	if (event) {
+		crtc->state->event = NULL;
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
 
 }
 
 static const struct drm_crtc_helper_funcs dss_crtc_helper_funcs = {
 	.enable		= dss_crtc_enable,
 	.disable	= dss_crtc_disable,
-	.atomic_check	= dss_crtc_atomic_check,
 	.mode_set_nofb	= dss_crtc_mode_set_nofb,
 	.atomic_begin	= dss_crtc_atomic_begin,
 	.atomic_flush	= dss_crtc_atomic_flush,
@@ -357,7 +366,7 @@ static int dss_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	crtc->port = port;
 
 	ret = drm_crtc_init_with_planes(dev, crtc, plane, NULL,
-					&dss_crtc_funcs);
+					&dss_crtc_funcs, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init crtc.\n");
 		return ret;
@@ -369,19 +378,6 @@ static int dss_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	return 0;
 }
 
-static int dss_plane_prepare_fb(struct drm_plane *plane,
-				const struct drm_plane_state *new_state)
-{
-	/* do nothing */
-	return 0;
-}
-
-static void dss_plane_cleanup_fb(struct drm_plane *plane,
-				 const struct drm_plane_state *old_state)
-{
-	/* do nothing */
-}
-
 static int dss_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_plane_state *state)
 {
@@ -441,8 +437,6 @@ static void dss_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs dss_plane_helper_funcs = {
-	.prepare_fb = dss_plane_prepare_fb,
-	.cleanup_fb = dss_plane_cleanup_fb,
 	.atomic_check = dss_plane_atomic_check,
 	.atomic_update = dss_plane_atomic_update,
 	.atomic_disable = dss_plane_atomic_disable,
@@ -471,7 +465,7 @@ static int dss_plane_init(struct drm_device *dev, struct dss_plane *aplane,
 		return ret;
 
 	ret = drm_universal_plane_init(dev, &aplane->base, 1, &dss_plane_funcs,
-				       fmts, fmts_cnt, type);
+				       fmts, fmts_cnt, type, NULL);
 	if (ret) {
 		DRM_ERROR("fail to init plane, ch=%d\n", aplane->ch);
 		return ret;
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
index 98ab748b8d8e..095335eba16d 100644
--- a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
+++ b/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
@@ -1117,7 +1117,7 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	dss_rect_ltrb_t rect;
 	u32 bpp;
 	u32 stride;
-	u32 display_addr;
+	u32 display_addr = 0;
 	u32 hal_fmt;
 	int chn_idx = DSS_RCHN_D2;
 
@@ -1138,7 +1138,10 @@ void hisi_fb_pan_display(struct drm_plane *plane)
 	bpp = fb->bits_per_pixel / 8;
 	stride = fb->pitches[0];
 
-	display_addr = (u32)fbdev->smem_start + src_y * stride;
+	if (fbdev)
+		display_addr = (u32)fbdev->smem_start + src_y * stride;
+	else
+		printk("JDB: fbdev is null?\n");
 
 	rect.left = 0;
 	rect.right = src_w - 1;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
