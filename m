Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6B21FF4A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA566E9DC;
	Tue, 14 Jul 2020 20:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754BB6E9BF;
 Tue, 14 Jul 2020 20:58:36 +0000 (UTC)
IronPort-SDR: 6fZppgd2yXnUoS5NIWqsZKTiUAwhk3soKzBpZtBWbNLci8N9VSeXACn3niApBVq3KA8j2xqppq
 zMz9VJtaUPsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="128589635"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="128589635"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:18 -0700
IronPort-SDR: hpQAH07UDbrR9eABxNzfVOG5rjOGmnDGKIvTRvpZ8fwfEVJh0XUVJEr+RmHaQCfctCjQQxYxOo
 /tq0SiZ6Zg9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504059"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:18 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 02/59] drm/kmb: Added id to kmb_plane
Date: Tue, 14 Jul 2020 13:56:48 -0700
Message-Id: <1594760265-11618-3-git-send-email-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
References: <1594760265-11618-1-git-send-email-anitha.chrisanthus@intel.com>
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

v2: moved extern to .h, upclassed dev_private,
    minor changes from code review.

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
index 1a00015..63821ed 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -105,9 +105,8 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
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
@@ -175,17 +174,17 @@ static const struct drm_crtc_helper_funcs kmb_crtc_helper_funcs = {
 int kmb_setup_crtc(struct drm_device *drm)
 {
 	struct kmb_drm_private *lcd = to_kmb(drm);
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
index d7cc441..6c3efdd 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.h
+++ b/drivers/gpu/drm/kmb/kmb_crtc.h
@@ -35,5 +35,5 @@ struct kmb_crtc_state {
 #define to_kmb_crtc_state(x) container_of(x, struct kmb_crtc_state, crtc_base)
 #define to_kmb_crtc(x) container_of(x, struct kmb_crtc, crtc_base)
 extern void kmb_plane_destroy(struct drm_plane *plane);
-extern struct drm_plane *kmb_plane_init(struct drm_device *drm);
+extern struct kmb_plane *kmb_plane_init(struct drm_device *drm);
 #endif /* __KMB_CRTC_H__ */
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 90e1c86..23299a5 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -16,7 +16,7 @@ struct kmb_drm_private {
 	struct clk *clk;
 	struct drm_fbdev_cma *fbdev;
 	struct drm_crtc crtc;
-	struct drm_plane *plane;
+	struct kmb_plane *plane;
 	struct drm_atomic_state *state;
 };
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9d4c8dc..7077a4c 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -41,46 +41,69 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
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
 
 	lcd = to_kmb(plane->dev);
 
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
@@ -90,7 +113,9 @@ static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
 
 void kmb_plane_destroy(struct drm_plane *plane)
 {
+	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	drm_plane_cleanup(plane);
+	kfree(kmb_plane);
 }
 
 static void kmb_destroy_plane_state(struct drm_plane *plane,
@@ -185,11 +210,11 @@ static const u32 kmb_formats_v[] = {
 	DRM_FORMAT_NV12, DRM_FORMAT_NV21,
 };
 
-struct drm_plane *kmb_plane_init(struct drm_device *drm)
+struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 {
 	struct kmb_drm_private *lcd = to_kmb(drm);
-	struct drm_plane *plane = NULL;
-	struct drm_plane *primary = NULL;
+	struct kmb_plane *plane = NULL;
+	struct kmb_plane *primary = NULL;
 	int i = 0;
 	int ret;
 	enum drm_plane_type plane_type;
@@ -213,18 +238,21 @@ struct drm_plane *kmb_plane_init(struct drm_device *drm)
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
index 46cdcaa..38b32a2 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -8,25 +8,31 @@
 
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
