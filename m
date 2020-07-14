Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617E21FF78
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5B86E9F3;
	Tue, 14 Jul 2020 20:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F9D6E9BF;
 Tue, 14 Jul 2020 20:58:46 +0000 (UTC)
IronPort-SDR: ZhrRSRVWtJEeejNK4ahiTyVq0CHaZuzVXZ6TBEMyZec5rUcpTS0JBF3FipcxTbAc1XMxVT4k3q
 PKe4kBrBXVMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444622"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444622"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:46 -0700
IronPort-SDR: V0FBWF7KqVV5Bx2bVxgVAL5Sw5LgrBsgocVgd9ZNOSRk61Hxb1JFxw4g5OO/yc+uudCoXV8EwH
 a5ifb+klXeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504292"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:45 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 51/59] drm/kmb: Write to LCD_LAYERn_CFG only once
Date: Tue, 14 Jul 2020 13:57:37 -0700
Message-Id: <1594760265-11618-52-git-send-email-anitha.chrisanthus@intel.com>
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

From: Edmund Dea <edmund.j.dea@intel.com>

Video artifacts appear during playback as horizontal lines that
sporadically appear every few frames. Issue was caused by writing to
LCD_LAYERn_CFG register twice during plane updates. Issue is fixed by
writing to LCD_LAYERn_CFG only once.

Removed plane_init_status so that there are no initialization
dependencies during plane updates.

Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_plane.c | 81 +++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 6be0997..bf93986 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -98,7 +98,6 @@ static const u32 csc_coef_lcd[] = {
 };
 
 /*plane initialization status */
-static int plane_init_status[KMB_MAX_PLANES] = { 0, 0, 0, 0 };
 
 static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 {
@@ -301,7 +300,6 @@ static void config_csc(struct kmb_drm_private *dev_p, int plane_id)
 	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF1(plane_id), csc_coef_lcd[9]);
 	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF2(plane_id), csc_coef_lcd[10]);
 	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);
-	kmb_set_bitmask_lcd(dev_p, LCD_LAYERn_CFG(plane_id), LCD_LAYER_CSC_EN);
 }
 #endif
 
@@ -390,19 +388,27 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 				      addr[V_PLANE]);
 		}
 	}
-	if (plane_init_status[plane_id] != INITIALIZED) {
-		kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
-		kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
-		kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
-		kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
-
-		val = set_pixel_format(fb->format->format);
-		val |= set_bits_per_pixel(fb->format);
-		/*CHECKME Leon drvr sets it to 100 try this for now */
-		val |= LCD_LAYER_FIFO_100;
-		kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
-
-		switch (plane_id) {
+
+	kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w-1);
+	kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h-1);
+	kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
+	kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
+
+	val = set_pixel_format(fb->format->format);
+	val |= set_bits_per_pixel(fb->format);
+	/*CHECKME Leon drvr sets it to 100 try this for now */
+	val |= LCD_LAYER_FIFO_100;
+
+	if (val & LCD_LAYER_PLANAR_STORAGE) {
+		val |= LCD_LAYER_CSC_EN;
+
+		/*enable CSC if input is planar and output is RGB */
+		config_csc(dev_p, plane_id);
+	}
+
+	kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
+
+	switch (plane_id) {
 		case LAYER_0:
 			ctrl = LCD_CTRL_VL1_ENABLE;
 			break;
@@ -415,36 +421,28 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		case LAYER_3:
 			ctrl = LCD_CTRL_GL2_ENABLE;
 			break;
-		}
+	}
 
-		ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-		    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
+	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
+	    | LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
 
-		/*LCD is connected to MIPI on kmb
-		 * Therefore this bit is required for DSI Tx
-		 */
-		ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
+	/*LCD is connected to MIPI on kmb
+	 * Therefore this bit is required for DSI Tx
+	 */
+	ctrl |= LCD_CTRL_VHSYNC_IDLE_LVL;
 
-		kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
+	kmb_set_bitmask_lcd(dev_p, LCD_CONTROL, ctrl);
 
-		/* FIXME no doc on how to set output format,these values are
-		 * taken from the Myriadx tests
-		 */
-		out_format |= LCD_OUTF_FORMAT_RGB888;
+	/* FIXME no doc on how to set output format,these values are
+	 * taken from the Myriadx tests
+	 */
+	out_format |= LCD_OUTF_FORMAT_RGB888;
 
-		if (val & LCD_LAYER_PLANAR_STORAGE) {
-			/*enable CSC if input is planar and output is RGB */
-			config_csc(dev_p, plane_id);
-		}
-
-		/*set background color to white */
-		//      kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0xffffff);
-		/*leave RGB order,conversion mode and clip mode to default */
-		/* do not interleave RGB channels for mipi Tx compatibility */
-		out_format |= LCD_OUTF_MIPI_RGB_MODE;
-		kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
-		plane_init_status[plane_id] = INITIALIZED;
-	}
+	/* Leave RGB order,conversion mode and clip mode to default */
+	/* do not interleave RGB channels for mipi Tx compatibility */
+	out_format |= LCD_OUTF_MIPI_RGB_MODE;
+	//	out_format |= LCD_OUTF_SYNC_MODE;
+	kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
 
 	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN |
 	    LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_16;
@@ -454,9 +452,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	DRM_DEBUG("%s : %d dma_cfg=0x%x LCD_DMA_CFG=0x%x\n",
 		  __func__, __LINE__, dma_cfg,
 		  kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
-
-	return;
-
 #endif
 }
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
