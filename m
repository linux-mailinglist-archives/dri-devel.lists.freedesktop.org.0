Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD2C20FF34
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75146E51D;
	Tue, 30 Jun 2020 21:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708B16E33C;
 Tue, 30 Jun 2020 21:28:55 +0000 (UTC)
IronPort-SDR: CGFFhE01bjPWJAKBqJr1Fb1hdhvDrSNYuqddCjuDkFBw25M6Tx60ucqLP8/U6kBsJM8xzbT7BQ
 a7NJE2vcW5lg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133846949"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="133846949"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:55 -0700
IronPort-SDR: CEc80Y0yvFMiBf14whaWNctn1F+Vtfs2UkTxChujjK4dOM5fCgoDAozJLAc4hbM+YEm3AgsWqS
 3d4ewuT5rbcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066842"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:54 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 51/59] drm/kmb: Write to LCD_LAYERn_CFG only once
Date: Tue, 30 Jun 2020 14:28:03 -0700
Message-Id: <1593552491-23698-52-git-send-email-anitha.chrisanthus@intel.com>
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
index 8aa48b5..ebf29b2 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -118,7 +118,6 @@ static const u32 csc_coef_lcd[] = {
 };
 
 /*plane initialization status */
-static int plane_init_status[KMB_MAX_PLANES] = { 0, 0, 0, 0 };
 
 static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 {
@@ -321,7 +320,6 @@ static void config_csc(struct kmb_drm_private *dev_p, int plane_id)
 	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF1(plane_id), csc_coef_lcd[9]);
 	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF2(plane_id), csc_coef_lcd[10]);
 	kmb_write_lcd(dev_p, LCD_LAYERn_CSC_OFF3(plane_id), csc_coef_lcd[11]);
-	kmb_set_bitmask_lcd(dev_p, LCD_LAYERn_CFG(plane_id), LCD_LAYER_CSC_EN);
 }
 #endif
 
@@ -410,19 +408,27 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
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
@@ -435,36 +441,28 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
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
@@ -474,9 +472,6 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
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
