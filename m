Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA25521FF69
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B596EA08;
	Tue, 14 Jul 2020 20:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695F36E974;
 Tue, 14 Jul 2020 20:58:45 +0000 (UTC)
IronPort-SDR: G9opQPF59jIs1iIDID3ab7mh834NuiXgZzQGes2cNTAP2wuFOBU65Q4uHr/WNgzgbej3DUIzOQ
 omLDh+OFXCEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444617"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:45 -0700
IronPort-SDR: K8rUdguCUXiSdO4RQzJCm/dsaBt9wOXWYaOioBgiOc8PPlEEzokfBhxaX40dAdBK1UZ0+Q0LsD
 E6UQ+l977SBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504279"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:44 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 49/59] drm/kmb: Disable ping pong mode
Date: Tue, 14 Jul 2020 13:57:35 -0700
Message-Id: <1594760265-11618-50-git-send-email-anitha.chrisanthus@intel.com>
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

Disable ping pong mode otherwise video corruption results,
use continuous mode and also fetch the dma
addresses before disabling dma. For now, only initialize the dma and
planes once and for next plane updates only update the addresses for
dma.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 301 ++++++++++++++++++++--------------------
 drivers/gpu/drm/kmb/kmb_plane.h |   8 ++
 2 files changed, 159 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 5fd1837..a1d616a 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -83,11 +83,12 @@ static const u32 kmb_formats_v[] = {
 #define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_ERR)
 
 const uint32_t layer_irqs[] = {
-				LCD_INT_VL0,
-				LCD_INT_VL1,
-				LCD_INT_GL0,
-				LCD_INT_GL1
-			      };
+	LCD_INT_VL0,
+	LCD_INT_VL1,
+	LCD_INT_GL0,
+	LCD_INT_GL1
+};
+
 /*Conversion (yuv->rgb) matrix from myriadx */
 static const u32 csc_coef_lcd[] = {
 	1024, 0, 1436,
@@ -96,7 +97,6 @@ static const u32 csc_coef_lcd[] = {
 	-179, 125, -226
 };
 
-
 static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 {
 	int i;
@@ -114,7 +114,6 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 	struct drm_framebuffer *fb;
 	int ret;
 
-
 	fb = state->fb;
 
 	if (!fb || !state->crtc)
@@ -130,7 +129,7 @@ static int kmb_plane_atomic_check(struct drm_plane *plane,
 }
 
 static void kmb_plane_atomic_disable(struct drm_plane *plane,
-				struct drm_plane_state *state)
+				     struct drm_plane_state *state)
 {
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
 	int ctrl = 0;
@@ -156,14 +155,13 @@ static void kmb_plane_atomic_disable(struct drm_plane *plane,
 	}
 
 	kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
-			LCD_DMA_LAYER_ENABLE);
+			    LCD_DMA_LAYER_ENABLE);
 	kmb_clr_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
 	DRM_INFO("%s : %d lcd_ctrl = 0x%x lcd_int_enable=0x%x\n",
-			__func__, __LINE__, kmb_read_lcd(dev_p, LCD_CONTROL),
-			kmb_read_lcd(dev_p, LCD_INT_ENABLE));
+		 __func__, __LINE__, kmb_read_lcd(dev_p, LCD_CONTROL),
+		 kmb_read_lcd(dev_p, LCD_INT_ENABLE));
 }
 
-
 unsigned int set_pixel_format(u32 format)
 {
 	unsigned int val = 0;
@@ -198,8 +196,8 @@ unsigned int set_pixel_format(u32 format)
 		val = LCD_LAYER_FORMAT_NV12 | LCD_LAYER_PLANAR_STORAGE
 		    | LCD_LAYER_CRCB_ORDER;
 		break;
-	/* packed formats */
-	/* looks hw requires B & G to be swapped when RGB */
+		/* packed formats */
+		/* looks hw requires B & G to be swapped when RGB */
 	case DRM_FORMAT_RGB332:
 		val = LCD_LAYER_FORMAT_RGB332 | LCD_LAYER_BGR_ORDER;
 		break;
@@ -263,7 +261,7 @@ unsigned int set_bits_per_pixel(const struct drm_format_info *format)
 		return val;
 	}
 
-	bpp += 8*format->cpp[0];
+	bpp += 8 * format->cpp[0];
 
 	switch (bpp) {
 	case 8:
@@ -310,7 +308,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 #ifdef LCD_TEST
 	struct drm_framebuffer *fb;
 	struct kmb_drm_private *dev_p;
-	dma_addr_t addr;
 	unsigned int width;
 	unsigned int height;
 	unsigned int dma_len;
@@ -320,6 +317,9 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	unsigned int src_w, src_h, crtc_x, crtc_y;
 	unsigned char plane_id;
 	int num_planes;
+	/*plane initialization status */
+	static int plane_init_status[KMB_MAX_PLANES] = { 0, 0, 0, 0 };
+	static dma_addr_t addr[MAX_SUB_PLANES] = { 0, 0, 0 };
 
 	if (!plane || !plane->state || !state)
 		return;
@@ -339,146 +339,145 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	crtc_x = plane->state->crtc_x;
 	crtc_y = plane->state->crtc_y;
 
-	DRM_INFO("src_w=%d src_h=%d\n", src_w, src_h);
-	kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w-1);
-	kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h-1);
-	kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
-	kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
-
-	val = set_pixel_format(fb->format->format);
-	val |= set_bits_per_pixel(fb->format);
-	/*CHECKME Leon drvr sets it to 100 try this for now */
-	val |= LCD_LAYER_FIFO_100;
-	kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
-
-	/*re-initialize interrupts */
-	kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE, layer_irqs[plane_id]);
-	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, layer_irqs[plane_id]);
-	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE, layer_irqs[plane_id]);
-
-	/*TBD check visible? */
-/*
-	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_AUTO_UPDATE
-		  | LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_1
-		  | LCD_DMA_LAYER_VSTRIDE_EN;
-*/
-	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN
-		| LCD_DMA_LAYER_AXI_BURST_16 |
-		LCD_DMA_LAYER_CONT_PING_PONG_UPDATE;
-
-	/* disable DMA first */
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
-			~LCD_DMA_LAYER_ENABLE);
-	kmb_write_lcd(dev_p, LCD_FIFO_FLUSH + plane_id*0x400, 1);
-
-	/* pinpong mode is enabled - at the end of DMA transfer, start new
-	 * transfer alternatively using main and shadow register settings.
-	 * So update both main and shadow registers
-	 */
-	addr = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
-	dev_p->fb_addr = addr;
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
-
-	width = fb->width;
-	height = fb->height;
-	dma_len = width * height * fb->format->cpp[0];
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
-
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
-			fb->pitches[0]);
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
-			(width*fb->format->cpp[0]));
-
-	/*program Cb/Cr for planar formats*/
-	if (num_planes > 1) {
-		if (fb->format->format == DRM_FORMAT_YUV420 ||
-				fb->format->format == DRM_FORMAT_YVU420)
-			width /= 2;
-		addr = drm_fb_cma_get_gem_addr(fb, plane->state, LAYER_1);
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_CB_ADR(plane_id),
-				addr);
-		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_CB_SHADOW(plane_id),
-				addr);
-		kmb_write_lcd(dev_p,
-				LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
-				fb->pitches[LAYER_1]);
-		kmb_write_lcd(dev_p,
-				LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
-				(width*fb->format->cpp[0]));
-		if (num_planes == 3) {
-			addr = drm_fb_cma_get_gem_addr(fb, plane->state,
-					LAYER_2);
+	DRM_INFO
+	    ("%s : %d src_w=%d src_h=%d, fb->format->format=0x%x fb->flags=0x%x",
+	     __func__, __LINE__, src_w, src_h, fb->format->format, fb->flags);
+	if (plane_init_status[plane_id] != INITIALIZED) {
+		kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
+		kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
+		kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
+		kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
+
+		val = set_pixel_format(fb->format->format);
+		val |= set_bits_per_pixel(fb->format);
+		/*CHECKME Leon drvr sets it to 100 try this for now */
+		val |= LCD_LAYER_FIFO_100;
+		kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
+
+		/*re-initialize interrupts */
+		kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
+				    layer_irqs[plane_id]);
+		kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, layer_irqs[plane_id]);
+
+		dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
+		    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
+
+		width = fb->width;
+		height = fb->height;
+		dma_len = (width * height * fb->format->cpp[0]);
+		DRM_INFO("%s : %d dma_len=%d ", __func__, __LINE__, dma_len);
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id),
+			      dma_len);
+
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
+			      fb->pitches[0]);
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
+			      (width * fb->format->cpp[0]));
+
+		/*program Cb/Cr for planar formats */
+		if (num_planes > 1) {
+			if (fb->format->format == DRM_FORMAT_YUV420 ||
+			    fb->format->format == DRM_FORMAT_YVU420)
+				width /= 2;
 			kmb_write_lcd(dev_p,
-				LCD_LAYERn_DMA_START_CR_ADR(plane_id),
-				addr);
+				      LCD_LAYERn_DMA_CB_LINE_VSTRIDE(plane_id),
+				      fb->pitches[LAYER_1]);
 			kmb_write_lcd(dev_p,
-				LCD_LAYERn_DMA_START_CR_SHADOW(plane_id),
-				addr);
-			kmb_write_lcd(dev_p,
-				LCD_LAYERn_DMA_CR_LINE_VSTRIDE(plane_id),
-				fb->pitches[LAYER_2]);
-			kmb_write_lcd(dev_p,
-				LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
-				(width*fb->format->cpp[0]));
+				      LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
+				      (width * fb->format->cpp[0]));
+			if (num_planes == 3) {
+				kmb_write_lcd(dev_p,
+					      LCD_LAYERn_DMA_CR_LINE_VSTRIDE
+					      (plane_id), fb->pitches[LAYER_2]);
+				kmb_write_lcd(dev_p,
+					      LCD_LAYERn_DMA_CR_LINE_WIDTH
+					      (plane_id),
+					      (width * fb->format->cpp[0]));
+			}
 		}
-	}
 
-	/* enable DMA */
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
-	DRM_INFO("%s : %d dma_cfg=0x%x LCD_DMA_CFG=0x%x\n", __func__,
-			__LINE__, dma_cfg,
-			kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
+		/* enable DMA */
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
+		DRM_INFO("%s : %d dma_cfg=0x%x LCD_DMA_CFG=0x%x\n",
+			 __func__, __LINE__, dma_cfg,
+			 kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
+
+		switch (plane_id) {
+		case LAYER_0:
+			ctrl = LCD_CTRL_VL1_ENABLE;
+			break;
+		case LAYER_1:
+			ctrl = LCD_CTRL_VL2_ENABLE;
+			break;
+		case LAYER_2:
+			ctrl = LCD_CTRL_GL1_ENABLE;
+			break;
+		case LAYER_3:
+			ctrl = LCD_CTRL_GL2_ENABLE;
+			break;
+		}
 
-	switch (plane_id) {
-	case LAYER_0:
-		ctrl = LCD_CTRL_VL1_ENABLE;
-		break;
-	case LAYER_1:
-		ctrl = LCD_CTRL_VL2_ENABLE;
-		break;
-	case LAYER_2:
-		ctrl = LCD_CTRL_GL1_ENABLE;
-		break;
-	case LAYER_3:
-		ctrl = LCD_CTRL_GL2_ENABLE;
-		break;
-	}
+		ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
+		    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
 
-//	ctrl |= LCD_CTRL_ENABLE;
-	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-		| LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
+		/*LCD is connected to MIPI on kmb
+		 * Therefore this bit is required for DSI Tx
+		 */
+		ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
 
-//	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-//		| LCD_CTRL_ONE_SHOT | LCD_CTRL_OUTPUT_ENABLED;
-	/*LCD is connected to MIPI on kmb
-	 * Therefore this bit is required for DSI Tx
-	 */
-	ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
+		kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
 
-	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
+		/* FIXME no doc on how to set output format,these values are
+		 * taken from the Myriadx tests
+		 */
+		out_format |= LCD_OUTF_FORMAT_RGB888;
 
-	/* FIXME no doc on how to set output format,these values are taken
-	 * from the Myriadx tests
-	 */
-	out_format |= LCD_OUTF_FORMAT_RGB888;
-//	out_format |= LCD_OUTF_BGR_ORDER;
+		if (val & LCD_LAYER_PLANAR_STORAGE) {
+			/*enable CSC if input is planar and output is RGB */
+			config_csc(dev_p, plane_id);
+		}
 
-	if (val & LCD_LAYER_PLANAR_STORAGE) {
-		/*enable CSC if input is planar and output is RGB */
-		config_csc(dev_p, plane_id);
+		/*set background color to white */
+		//      kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0xffffff);
+		/*leave RGB order,conversion mode and clip mode to default */
+		/* do not interleave RGB channels for mipi Tx compatibility */
+		out_format |= LCD_OUTF_MIPI_RGB_MODE;
+		kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
+
+		kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE,
+				    layer_irqs[plane_id]);
+		plane_init_status[plane_id] = INITIALIZED;
 	}
 
-	/*set background color to white*/
-//	kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0xffffff);
-	/*leave RGB order,conversion mode and clip mode to default*/
-	/* do not interleave RGB channels for mipi Tx compatibility */
-	out_format |= LCD_OUTF_MIPI_RGB_MODE;
-//	out_format |= LCD_OUTF_SYNC_MODE ;
-	kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
+	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
+	dev_p->fb_addr = (dma_addr_t) addr;
+	if (num_planes > 1) {
+		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, plane->state,
+							U_PLANE);
+		if (num_planes == 3)
+			addr[V_PLANE] =
+			    drm_fb_cma_get_gem_addr(fb, plane->state, V_PLANE);
+	}
+	/* disable DMA first */
+	kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
+			    LCD_DMA_LAYER_ENABLE);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id),
+		      addr[Y_PLANE] + fb->offsets[0]);
+	if (num_planes > 1) {
+		kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_CB_ADR(plane_id),
+			      addr[U_PLANE]);
+		if (num_planes == 3)
+			kmb_write_lcd(dev_p,
+				      LCD_LAYERn_DMA_START_CR_ADR(plane_id),
+				      addr[V_PLANE]);
+	}
+	/* Enable DMA */
+	kmb_set_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
+			    LCD_DMA_LAYER_ENABLE);
+	DRM_INFO("%s : %d flipping.....\n", __func__, __LINE__);
+	return;
 
-//	kmb_write_lcd(dev_p, LCD_CONTROL, LCD_CTRL_ENABLE);
 #endif
 }
 
@@ -491,6 +490,7 @@ static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
 void kmb_plane_destroy(struct drm_plane *plane)
 {
 	struct kmb_plane *kmb_plane = to_kmb_plane(plane);
+
 	drm_plane_cleanup(plane);
 	kfree(kmb_plane);
 }
@@ -569,7 +569,7 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 		}
 
 		plane_type = (i == 0) ? DRM_PLANE_TYPE_PRIMARY :
-			DRM_PLANE_TYPE_OVERLAY;
+		    DRM_PLANE_TYPE_OVERLAY;
 		if (i < 2) {
 			plane_formats = kmb_formats_v;
 			num_plane_formats = ARRAY_SIZE(kmb_formats_v);
@@ -579,13 +579,14 @@ struct kmb_plane *kmb_plane_init(struct drm_device *drm)
 		}
 
 		ret = drm_universal_plane_init(drm, &plane->base_plane,
-				POSSIBLE_CRTCS,
-				&kmb_plane_funcs, plane_formats,
-					num_plane_formats,
-					NULL, plane_type, "plane %d", i);
+					       POSSIBLE_CRTCS,
+					       &kmb_plane_funcs, plane_formats,
+					       num_plane_formats,
+					       NULL, plane_type, "plane %d", i);
 		if (ret < 0) {
-			DRM_ERROR("drm_universal_plane_init -failed with ret=%d"
-					, ret);
+			DRM_ERROR
+			    ("drm_universal_plane_init -failed with ret=%d",
+			     ret);
 			goto cleanup;
 		}
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index 38b32a2..b1ac9db 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -16,6 +16,13 @@ enum layer_id {
 	KMB_MAX_PLANES,
 };
 
+enum sub_plane_id {
+	Y_PLANE,
+	U_PLANE,
+	V_PLANE,
+	MAX_SUB_PLANES,
+};
+
 struct kmb_plane {
 	struct drm_plane base_plane;
 	struct kmb_drm_private kmb_dev;
@@ -28,6 +35,7 @@ struct kmb_plane_state {
 };
 
 #define POSSIBLE_CRTCS 1
+#define INITIALIZED 1
 #define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
 
 #define to_kmb_plane_state(x) \
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
