Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9E21FF6F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39976EA0E;
	Tue, 14 Jul 2020 20:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C556E9AC;
 Tue, 14 Jul 2020 20:58:45 +0000 (UTC)
IronPort-SDR: uqXoEQ4ep2WV7QKoVoIpd788iGv7iCf11gybK912bFvMCc0BupY0Ufve8gsqf5wPY2izqOoeV6
 PV4phuBaTlFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444619"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:45 -0700
IronPort-SDR: A4KOZ0fLceyNYgUWvRvwLzck7igwIPEhioJ//3PljE1KGOthhGxYwR1Unq+6ODFPGv/+8ErrV8
 0rMPq5NTAVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504283"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:45 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 50/59] drm/kmb: Do the layer initializations only once
Date: Tue, 14 Jul 2020 13:57:36 -0700
Message-Id: <1594760265-11618-51-git-send-email-anitha.chrisanthus@intel.com>
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

The issue was video starts fine, but towards the end, the color disappers.
Do the layer initializations only once, but update the DMA registers
for every frame. Also changed DRM_INFO to DRM_DEBUG.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 150 ++++++++++++++++++----------------------
 1 file changed, 66 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index a1d616a..6be0997 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -97,6 +97,9 @@ static const u32 csc_coef_lcd[] = {
 	-179, 125, -226
 };
 
+/*plane initialization status */
+static int plane_init_status[KMB_MAX_PLANES] = { 0, 0, 0, 0 };
+
 static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 {
 	int i;
@@ -157,9 +160,9 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 	kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
 			    LCD_DMA_LAYER_ENABLE);
 	kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
-	DRM_INFO("%s : %d lcd_ctrl = 0x%x lcd_int_enable=0x%x\n",
-		 __func__, __LINE__, kmb_read_lcd(dev_p, LCD_CONTROL),
-		 kmb_read_lcd(dev_p, LCD_INT_ENABLE));
+	DRM_DEBUG("%s : %d lcd_ctrl = 0x%x lcd_int_enable=0x%x\n",
+		  __func__, __LINE__, kmb_read_lcd(dev_p, LCD_CONTROL),
+		  kmb_read_lcd(dev_p, LCD_INT_ENABLE));
 }
 
 unsigned int set_pixel_format(u32 format)
@@ -317,8 +320,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned int src_w, src_h, crtc_x, crtc_y;
 	unsigned char plane_id;
 	int num_planes;
-	/*plane initialization status */
-	static int plane_init_status[KMB_MAX_PLANES] = { 0, 0, 0, 0 };
 	static dma_addr_t addr[MAX_SUB_PLANES] = { 0, 0, 0 };
 
 	if (!plane || !plane->state || !state)
@@ -339,9 +340,56 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	crtc_x = plane->state->crtc_x;
 	crtc_y = plane->state->crtc_y;
 
-	DRM_INFO
+	DRM_DEBUG
 	    ("%s : %d src_w=%d src_h=%d, fb->format->format=0x%x fb->flags=0x%x",
 	     __func__, __LINE__, src_w, src_h, fb->format->format, fb->flags);
+
+	width = fb->width;
+	height = fb->height;
+	dma_len = (width * height * fb->format->cpp[0]);
+	DRM_DEBUG("%s : %d dma_len=%d ", __func__, __LINE__, dma_len);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
+
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
+		      fb->pitches[0]);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
+		      (width * fb->format->cpp[0]));
+
+	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
+	dev_p->fb_addr = (dma_addr_t) addr;
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id),
+		      addr[Y_PLANE] + fb->offsets[0]);
+	/*program Cb/Cr for planar formats */
+	if (num_planes > 1) {
+		if (fb->format->format == DRM_FORMAT_YUV420 ||
+		    fb->format->format == DRM_FORMAT_YVU420)
+			width /= 2;
+		kmb_write_lcd(dev_p,
+			      LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
+			      fb->pitches[LAYER_1]);
+		kmb_write_lcd(dev_p,
+			      LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
+			      (width * fb->format->cpp[0]));
+		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
+							U_PLANE);
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_CB_ADR(plane_id),
+			      addr[U_PLANE]);
+		if (num_planes == 3) {
+			kmb_write_lcd(dev_p,
+				      LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
+				      fb->pitches[LAYER_2]);
+			kmb_write_lcd(dev_p,
+				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
+				      (width * fb->format->cpp[0]));
+			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
+								plane->state,
+								V_PLANE);
+			kmb_write_lcd(dev_p,
+				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
+				      addr[V_PLANE]);
+		}
+	}
 	if (plane_init_status[plane_id] != INITIALIZED) {
 		kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
 		kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
@@ -354,55 +402,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		val |= LCD_LAYER_FIFO_100;
 		kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
 
-		/*re-initialize interrupts */
-		kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
-				    layer_irqs[plane_id]);
-		kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, layer_irqs[plane_id]);
-
-		dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
-		    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
-
-		width = fb->width;
-		height = fb->height;
-		dma_len = (width * height * fb->format->cpp[0]);
-		DRM_INFO("%s : %d dma_len=%d ", __func__, __LINE__, dma_len);
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
-			      dma_len);
-
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
-			      fb->pitches[0]);
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
-			      (width * fb->format->cpp[0]));
-
-		/*program Cb/Cr for planar formats */
-		if (num_planes > 1) {
-			if (fb->format->format == DRM_FORMAT_YUV420 ||
-			    fb->format->format == DRM_FORMAT_YVU420)
-				width /= 2;
-			kmb_write_lcd(dev_p,
-				      LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
-				      fb->pitches[LAYER_1]);
-			kmb_write_lcd(dev_p,
-				      LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
-				      (width * fb->format->cpp[0]));
-			if (num_planes == 3) {
-				kmb_write_lcd(dev_p,
-					      LCD_LAYERn_DMA_CR_LINE_VSTRIDE
-					      (plane_id), fb->pitches[LAYER_2]);
-				kmb_write_lcd(dev_p,
-					      LCD_LAYERn_DMA_CR_LINE_WIDTH
-					      (plane_id),
-					      (width * fb->format->cpp[0]));
-			}
-		}
-
-		/* enable DMA */
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
-		DRM_INFO("%s : %d dma_cfg=0x%x LCD_DMA_CFG=0x%x\n",
-			 __func__, __LINE__, dma_cfg,
-			 kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
-
 		switch (plane_id) {
 		case LAYER_0:
 			ctrl = LCD_CTRL_VL1_ENABLE;
@@ -444,38 +443,18 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		/* do not interleave RGB channels for mipi Tx compatibility */
 		out_format |= LCD_OUTF_MIPI_RGB_MODE;
 		kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
-
-		kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE,
-				    layer_irqs[plane_id]);
 		plane_init_status[plane_id] = INITIALIZED;
 	}
 
-	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
-	dev_p->fb_addr = (dma_addr_t) addr;
-	if (num_planes > 1) {
-		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
-							U_PLANE);
-		if (num_planes == 3)
-			addr[V_PLANE] =
-			    drm_fb_cma_get_gem_addr(fb, plane->state, V_PLANE);
-	}
-	/* disable DMA first */
-	kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
-			    LCD_DMA_LAYER_ENABLE);
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id),
-		      addr[Y_PLANE] + fb->offsets[0]);
-	if (num_planes > 1) {
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_CB_ADR(plane_id),
-			      addr[U_PLANE]);
-		if (num_planes == 3)
-			kmb_write_lcd(dev_p,
-				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
-				      addr[V_PLANE]);
-	}
-	/* Enable DMA */
-	kmb_set_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
-			    LCD_DMA_LAYER_ENABLE);
-	DRM_INFO("%s : %d flipping.....\n", __func__, __LINE__);
+	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
+	    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
+
+	/* enable DMA */
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
+	DRM_DEBUG("%s : %d dma_cfg=0x%x LCD_DMA_CFG=0x%x\n",
+		  __func__, __LINE__, dma_cfg,
+		  kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
+
 	return;
 
 #endif
@@ -589,6 +568,9 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 			     ret);
 			goto cleanup;
 		}
+		DRM_DEBUG("%s : %d plane=%px\n i=%d type=%d",
+			  __func__, __LINE__, &plane->base_plane,
+			  i, plane_type);
 
 		drm_plane_helper_add(&plane->base_plane,
 				     &kmb_plane_helper_funcs);
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
