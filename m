Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD220FEC5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C2E6E2E6;
	Tue, 30 Jun 2020 21:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F4889D1D;
 Tue, 30 Jun 2020 21:28:35 +0000 (UTC)
IronPort-SDR: uXXtvYhfglL2ICH8kyR7HSmXdosdZpM9o8o2dV2lnWBx/x0AVLZqKgGBETNTrOi5s5DpKdrSZW
 +YR1BOFiLsgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146386935"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="146386935"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:34 -0700
IronPort-SDR: ONNkR4AiNLoEAx6hvWc8vDMzoOF67ODHrffUso2jY94DS66SZLnkgJJMjarJHSSDpyGSX43AG+
 LQGz8vgneZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066604"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:34 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 02/59] drm/kmb: Added id to kmb_plane
Date: Tue, 30 Jun 2020 14:27:14 -0700
Message-Id: <1593552491-23698-3-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1593552491-23698-1-git-send-email-anitha.chrisanthus@intel.com>
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
Cc: daniel.vetter@intel.com, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to keep track of the id of the plane as there are 4 planes in
Kmb and when update() is called, we need to know which plane need to be
updated so that the corresponding plane's registers can be programmed.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  | 13 ++++---
 drivers/gpu/drm/kmb/kmb_crtc.h  |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.h   |  2 +-
 drivers/gpu/drm/kmb/kmb_plane.c | 80 +++++++++++++++++++++++++++--------------
 drivers/gpu/drm/kmb/kmb_plane.h | 28 +++++++++------
 5 files changed, 79 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index ab1fff8..6f16410 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -126,9 +126,8 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		kmb_write(lcd, LCD_VSYNC_START_EVEN, vsync_start_offset);
 		kmb_write(lcd, LCD_VSYNC_END_EVEN, vsync_end_offset);
 	}
-	/* enable all 4 layers */
-	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE
-	    | LCD_CTRL_VL2_ENABLE | LCD_CTRL_GL1_ENABLE | LCD_CTRL_GL2_ENABLE;
+	/* enable VL1 layer as default */
+	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE;
 	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
 	    | LCD_CTRL_OUTPUT_ENABLED;
 	kmb_write(lcd, LCD_CONTROL, ctrl);
@@ -196,17 +195,17 @@ static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs = {
 int kmb_setup_crtc(struct drm_device *drm)
 {
 	struct kmb_drm_private *lcd = drm->dev_private;
-	struct drm_plane *primary;
+	struct kmb_plane *primary;
 	int ret;
 
 	primary = kmb_plane_init(drm);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	ret = drm_crtc_init_with_planes(drm, &lcd->crtc, primary, NULL,
-					&kmb_crtc_funcs, NULL);
+	ret = drm_crtc_init_with_planes(drm, &lcd->crtc, &primary->base_plane,
+					NULL, &kmb_crtc_funcs, NULL);
 	if (ret) {
-		kmb_plane_destroy(primary);
+		kmb_plane_destroy(&primary->base_plane);
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/kmb/kmb_crtc.h b/drivers/gpu/drm/kmb/kmb_crtc.h
index 0952733..5fe8890 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.h
+++ b/drivers/gpu/drm/kmb/kmb_crtc.h
@@ -55,5 +55,5 @@ struct kmb_crtc_state {
 #define to_kmb_crtc_state(x) container_of(x, struct kmb_crtc_state, crtc_base)
 #define to_kmb_crtc(x) container_of(x, struct kmb_crtc, crtc_base)
 extern void kmb_plane_destroy(struct drm_plane *plane);
-extern struct drm_plane *kmb_plane_init(struct drm_device *drm);
+extern struct kmb_plane *kmb_plane_init(struct drm_device *drm);
 #endif /* __KMB_CRTC_H__ */
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 05e9791..637e9a2 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -36,7 +36,7 @@ struct kmb_drm_private {
 	struct clk *clk;
 	struct drm_fbdev_cma *fbdev;
 	struct drm_crtc crtc;
-	struct drm_plane *plane;
+	struct kmb_plane *plane;
 	struct drm_atomic_state *state;
 };
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9ab3873..b9d8d38 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -61,46 +61,69 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	dma_addr_t addr;
 	unsigned int width;
 	unsigned int height;
-	unsigned int i;
 	unsigned int dma_len;
-	struct kmb_plane_state *kmb_state = to_kmb_plane_state(plane->state);
+	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	unsigned int dma_cfg;
+	unsigned int ctrl = 0;
+	unsigned char plane_id = kmb_plane->id;
 
 	if (!fb)
 		return;
 
 	lcd = plane->dev->dev_private;
 
+	switch (plane_id) {
+	case LAYER_0:
+		ctrl = LCD_CTRL_VL1_ENABLE;
+		break;
+	case LAYER_1:
+		ctrl = LCD_CTRL_VL2_ENABLE;
+		break;
+	case LAYER_2:
+		ctrl = LCD_CTRL_GL1_ENABLE;
+		break;
+	case LAYER_3:
+		ctrl = LCD_CTRL_GL2_ENABLE;
+		break;
+	}
+
+	ctrl |= LCD_CTRL_ENABLE;
+	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
+	    | LCD_CTRL_OUTPUT_ENABLED;
+	kmb_write(lcd, LCD_CONTROL, ctrl);
+
 	/* TBD */
 	/*set LCD_LAYERn_WIDTH, LCD_LAYERn_HEIGHT, LCD_LAYERn_COL_START,
 	 * LCD_LAYERn_ROW_START, LCD_LAYERn_CFG
 	 * CFG should set the pixel format, FIFO level and BPP
 	 */
 
+	/*TBD check visible? */
+
 	/* we may have to set LCD_DMA_VSTRIDE_ENABLE in the future */
 	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_AUTO_UPDATE
 	    | LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_1;
 
-	for (i = 0; i < kmb_state->no_planes; i++) {
-		/* disable DMA first */
-		kmb_write(lcd, LCD_LAYERn_DMA_CFG(i), ~LCD_DMA_LAYER_ENABLE);
+	/* disable DMA first */
+	kmb_write(lcd, LCD_LAYERn_DMA_CFG(plane_id), ~LCD_DMA_LAYER_ENABLE);
 
-		addr = drm_fb_cma_get_gem_addr(fb, plane->state, i);
-		kmb_write(lcd, LCD_LAYERn_DMA_START_ADDR(i), addr);
-		kmb_write(lcd, LCD_LAYERn_DMA_START_SHADOW(i), addr);
+	addr = drm_fb_cma_get_gem_addr(fb, plane->state, plane_id);
+	kmb_write(lcd, LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
+	kmb_write(lcd, LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
 
-		width = fb->width;
-		height = fb->height;
-		dma_len = width * height * fb->format->cpp[i];
-		kmb_write(lcd, LCD_LAYERn_DMA_LEN(i), dma_len);
+	width = fb->width;
+	height = fb->height;
+	dma_len = width * height * fb->format->cpp[plane_id];
+	kmb_write(lcd, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
 
-		kmb_write(lcd, LCD_LAYERn_DMA_LINE_VSTRIDE(i), fb->pitches[0]);
-		kmb_write(lcd, LCD_LAYERn_DMA_LINE_WIDTH(i),
-			  (width * fb->format->cpp[i]));
+	kmb_write(lcd, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
+		  fb->pitches[plane_id]);
+	kmb_write(lcd, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
+		  (width * fb->format->cpp[plane_id]));
+
+	/* enable DMA */
+	kmb_write(lcd, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
 
-		/* enable DMA */
-		kmb_write(lcd, LCD_LAYERn_DMA_CFG(i), dma_cfg);
-	}
 }
 
 static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
@@ -110,7 +133,9 @@ static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
 
 void kmb_plane_destroy(struct drm_plane *plane)
 {
+	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	drm_plane_cleanup(plane);
+	kfree(kmb_plane);
 }
 
 static void kmb_destroy_plane_state(struct drm_plane *plane,
@@ -205,11 +230,11 @@ static const u32 kmb_formats_v[] = {
 	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
 };
 
-struct drm_plane *kmb_plane_init(struct drm_device *drm)
+struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 {
 	struct kmb_drm_private *lcd = drm->dev_private;
-	struct drm_plane *plane = NULL;
-	struct drm_plane *primary = NULL;
+	struct kmb_plane *plane = NULL;
+	struct kmb_plane *primary = NULL;
 	int i = 0;
 	int ret;
 	enum drm_plane_type plane_type;
@@ -233,18 +258,21 @@ struct drm_plane *kmb_plane_init(struct drm_device *drm)
 			num_plane_formats = ARRAY_SIZE(kmb_formats_g);
 		}
 
-		ret = drm_universal_plane_init(drm, plane, 0xFF,
-				       &kmb_plane_funcs, plane_formats,
-				       num_plane_formats,
-				       NULL, plane_type, "plane %d", i);
+		ret =
+		    drm_universal_plane_init(drm, &plane->base_plane,
+					     POSSIBLE_CRTCS, &kmb_plane_funcs,
+					     plane_formats, num_plane_formats,
+					     NULL, plane_type, "plane %d", i);
 		if (ret < 0)
 			goto cleanup;
 
-		drm_plane_helper_add(plane, &kmb_plane_helper_funcs);
+		drm_plane_helper_add(&plane->base_plane,
+				     &kmb_plane_helper_funcs);
 		if (plane_type == DRM_PLANE_TYPE_PRIMARY) {
 			primary = plane;
 			lcd->plane = plane;
 		}
+		plane->id = i;
 	}
 
 cleanup:
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index 84c7113..45bcec1 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -28,25 +28,31 @@
 
 #include "kmb_drv.h"
 
-#define KMB_MAX_PLANES	4
+enum layer_id {
+	LAYER_0,
+	LAYER_1,
+	LAYER_2,
+	LAYER_3,
+	KMB_MAX_PLANES,
+};
+
+struct kmb_plane {
+	struct drm_plane base_plane;
+	struct kmb_drm_private kmb_dev;
+	unsigned char id;
+};
 
-/* this struct may be needed in the future
- *struct kmb_plane {
- *	struct drm_plane base_plane;
- *	struct kmb_drm_private kmb_dev;
- *};
- */
 struct kmb_plane_state {
 	struct drm_plane_state base_plane_state;
 	unsigned char no_planes;
 };
 
-/* may be needed in the future
- *#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
- */
+#define POSSIBLE_CRTCS 1
+#define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
+
 #define to_kmb_plane_state(x) \
 		container_of(x, struct kmb_plane_state, base_plane_state)
 
-struct drm_plane *kmb_plane_init(struct drm_device *drm);
+struct kmb_plane *kmb_plane_init(struct drm_device *drm);
 void kmb_plane_destroy(struct drm_plane *plane);
 #endif /* __KMB_PLANE_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
