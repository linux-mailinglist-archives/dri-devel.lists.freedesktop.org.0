Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A25821FF4F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE076E9FA;
	Tue, 14 Jul 2020 20:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715876E974;
 Tue, 14 Jul 2020 20:58:42 +0000 (UTC)
IronPort-SDR: oYKoLeWxnQiBc+uk9sxVbDklGreWQ1GzOeASoUZDLZANfQ52xsqjmgA8Uypa3rTs5reUfpOTey
 NpLU6oIKJUxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444607"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444607"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:42 -0700
IronPort-SDR: 7PNNJCc+G5SimD4y4C09owgXJuDT1JGXJTUv5lk7jt0BMlp1fJmlpRPUFdJjB+3gzH+GjwTHF9
 gurBxk2vxnZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504254"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:41 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 44/59] drm/kmb: Mipi settings from input timings
Date: Tue, 14 Jul 2020 13:57:30 -0700
Message-Id: <1594760265-11618-45-git-send-email-anitha.chrisanthus@intel.com>
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

Removed hardcoded timings, set timings based on the current mode's
input timings. Also calculate and set the lane rate based on the
timings.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c |  9 +++-
 drivers/gpu/drm/kmb/kmb_dsi.c  | 93 +++++++++++++++++++++++-------------------
 drivers/gpu/drm/kmb/kmb_dsi.h  |  2 +-
 3 files changed, 61 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index a6a0444..1987185e 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -84,7 +84,14 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct kmb_drm_private *dev_p = to_kmb(dev);
 #endif
 	/* initialize mipi */
-	kmb_dsi_hw_init(dev);
+	kmb_dsi_hw_init(dev, m);
+	DRM_INFO("vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d hsync_len=%d\n",
+			m->crtc_vsync_start - m->crtc_vdisplay,
+			m->crtc_vtotal - m->crtc_vsync_end,
+			m->crtc_vsync_end - m->crtc_vsync_start,
+			m->crtc_hsync_start - m->crtc_hdisplay,
+			m->crtc_htotal - m->crtc_hsync_end,
+			m->crtc_hsync_end - m->crtc_hsync_start);
 #ifdef LCD_TEST
 //	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
 	vm.vfront_porch = 2;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index e01c4f9..e9499cf 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -27,19 +27,12 @@ static int hw_initialized;
 //#define MIPI_TX_TEST_PATTERN_GENERATION
 //#define MIPI_DMA
 //#define RTL_TEST
-//#define IMG_WIDTH_PX      640
-//#define IMG_HEIGHT_LINES  10
-
-#define LCD_BYTESPP       1
 
 /*MIPI TX CFG*/
-//#define MIPI_TX_LANE_DATA_RATE_MBPS 1782
-//#define MIPI_TX_LANE_DATA_RATE_MBPS 800
 #define MIPI_TX_LANE_DATA_RATE_MBPS 891
-//#define MIPI_TX_LANE_DATA_RATE_MBPS 80
 #define MIPI_TX_REF_CLK_KHZ         24000
-//#define MIPI_TX_REF_CLK_KHZ         23809
 #define MIPI_TX_CFG_CLK_KHZ         24000
+#define MIPI_TX_BPP		    24
 
 /*DPHY Tx test codes*/
 #define TEST_CODE_FSM_CONTROL				0x03
@@ -78,23 +71,12 @@ static struct mipi_dsi_host *dsi_host;
 static struct mipi_dsi_device *dsi_device;
 
 /*
- * These are added here only temporarily for testing,
- * these will eventually go to the device tree sections,
- * and can be used as a refernce later for device tree additions
+ * Default setting is 1080p, 4 lanes.
  */
-#define RES_1920x1080
-#ifdef RES_1920x1080
 #define IMG_HEIGHT_LINES  1080
 #define IMG_WIDTH_PX      1920
 #define MIPI_TX_ACTIVE_LANES 4
-#endif
 
-//#define RES_1280x720
-#ifdef RES_1280x720
-#define IMG_HEIGHT_LINES  720
-#define IMG_WIDTH_PX      1280
-#define MIPI_TX_ACTIVE_LANES 2
-#endif
 struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
 	.width_pixels = IMG_WIDTH_PX,
 	.height_lines = IMG_HEIGHT_LINES,
@@ -104,7 +86,6 @@ struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
 	.dma_packed = 0
 };
 
-#ifdef RES_1920x1080
 struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
 	.sections[0] = &mipi_tx_frame0_sect_cfg,
 	.sections[1] = NULL,
@@ -117,22 +98,6 @@ struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
 	.h_backporch = 148,
 	.h_frontporch = 88
 };
-#endif
-
-#ifdef RES_1280x720
-struct mipi_tx_frame_cfg mipitx_frame0_cfg = {
-	.sections[0] = &mipi_tx_frame0_sect_cfg,
-	.sections[1] = NULL,
-	.sections[2] = NULL,
-	.sections[3] = NULL,
-	.vsync_width = 5,
-	.v_backporch = 20,
-	.v_frontporch = 5,
-	.hsync_width = 40,
-	.h_backporch = 220,
-	.h_frontporch = 110,
-};
-#endif
 
 struct mipi_tx_dsi_cfg mipitx_dsi_cfg = {
 	.hfp_blank_en = 0,
@@ -1720,10 +1685,58 @@ int kmb_kernel_read(struct file *file, loff_t offset,
 	return ret;
 }
 
-int kmb_dsi_hw_init(struct drm_device *dev)
+int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode *mode)
 {
 	struct kmb_drm_private *dev_p = to_kmb(dev);
+	u64 data_rate;
+
+	mipi_tx_init_cfg.active_lanes = MIPI_TX_ACTIVE_LANES;
+	if (mode != NULL) {
+		mipi_tx_frame0_sect_cfg.width_pixels = mode->crtc_hdisplay;
+		mipi_tx_frame0_sect_cfg.height_lines = mode->crtc_vdisplay;
+		mipitx_frame0_cfg.vsync_width =
+			mode->crtc_vsync_end - mode->crtc_vsync_start;
+		mipitx_frame0_cfg.v_backporch =
+			mode->crtc_vtotal - mode->crtc_vsync_end;
+		mipitx_frame0_cfg.v_frontporch =
+			mode->crtc_vsync_start - mode->crtc_vdisplay;
+		mipitx_frame0_cfg.hsync_width =
+			mode->crtc_hsync_end - mode->crtc_hsync_start;
+		mipitx_frame0_cfg.h_backporch =
+			mode->crtc_htotal - mode->crtc_hsync_end;
+		mipitx_frame0_cfg.h_frontporch =
+			mode->crtc_hsync_start - mode->crtc_hdisplay;
+		/*lane rate = (vtotal*htotal*fps*bpp)/4 / 1000000
+		 * to convert to Mbps
+		 */
+		DRM_INFO("htotal = %d vtotal=%d refresh=%d\n",
+				mode->crtc_htotal, mode->crtc_vtotal,
+				drm_mode_vrefresh(mode));
+		data_rate =
+			((((u32)mode->crtc_vtotal * (u32)mode->crtc_htotal)
+			* (u32)(drm_mode_vrefresh(mode))
+			* MIPI_TX_BPP)/mipi_tx_init_cfg.active_lanes) / 1000000;
+		DRM_INFO("data_rate = %llu active_lanes=%d\n",
+				data_rate, mipi_tx_init_cfg.active_lanes);
+
+		/*when late rate < 800 - modeset fails with 4 lanes -
+		 * so switch to 2 lanes
+		 */
+		if (data_rate < 800) {
+			mipi_tx_init_cfg.active_lanes = 2;
+			mipi_tx_init_cfg.lane_rate_mbps = data_rate * 2;
+		} else {
+			mipi_tx_init_cfg.lane_rate_mbps = data_rate;
+		}
+		DRM_INFO("lane rate=%d\n", mipi_tx_init_cfg.lane_rate_mbps);
+		DRM_INFO("vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d hsync_len=%d lane-rate=%d\n",
+		mipitx_frame0_cfg.v_frontporch, mipitx_frame0_cfg.v_backporch,
+		mipitx_frame0_cfg.vsync_width,
+		mipitx_frame0_cfg.h_frontporch, mipitx_frame0_cfg.h_backporch,
+		mipitx_frame0_cfg.hsync_width,
+		mipi_tx_init_cfg.lane_rate_mbps);
 
+	}
 	if (hw_initialized)
 		return 0;
 	kmb_write_mipi(dev_p, DPHY_ENABLE, 0);
@@ -1806,15 +1819,13 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 		drm_encoder_cleanup(encoder);
 		return ret;
 	}
-#endif
 
-#ifndef FCCTEST
 	DRM_INFO("%s : %d Bridge attached : SUCCESS\n", __func__, __LINE__);
 #endif
 
 #ifdef FCCTEST
 #ifndef LCD_TEST
-	kmb_dsi_hw_init(dev);
+	kmb_dsi_hw_init(dev, NULL);
 #endif
 #endif
 	return 0;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 912e06d..7857576 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -321,7 +321,7 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
 void kmb_plane_destroy(struct drm_plane *plane);
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
 void kmb_dsi_host_unregister(void);
-int kmb_dsi_hw_init(struct drm_device *dev);
+int kmb_dsi_hw_init(struct drm_device *dev, struct drm_display_mode *mode);
 
 #define to_kmb_connector(x) container_of(x, struct kmb_connector, base)
 #define to_kmb_host(x) container_of(x, struct kmb_dsi_host, base)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
