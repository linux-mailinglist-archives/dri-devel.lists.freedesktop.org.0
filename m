Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57321FF3E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D856E9D2;
	Tue, 14 Jul 2020 20:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D836E974;
 Tue, 14 Jul 2020 20:58:41 +0000 (UTC)
IronPort-SDR: tsr5Hn9DAL9GeHZiJljcxIu4XuiNo+syGgNUT1/Na4sJWs3ZebI0Aryu4R35XKBBchYn4ANhYA
 c6XHnhAAuJtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444605"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:41 -0700
IronPort-SDR: /vKyhD9URq8Lqlbqpx2l+KyTaJmwzlHuyhyS8Iba07ZYLkebBGwpT2gfrBt/OmZOuM+716U1q0
 14eO+A9UYRlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504244"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:40 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 42/59] drm/kmb: Update LCD programming to match MIPI
Date: Tue, 14 Jul 2020 13:57:28 -0700
Message-Id: <1594760265-11618-43-git-send-email-anitha.chrisanthus@intel.com>
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

Mipi input expects the memory layout to be unpacked with 8 bits per
pixel in RGB (BRG) order. If the LCD is not configured properly,
corrupted output results, changed dma_unpacked to 0 in mipi FG.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  |  6 +++---
 drivers/gpu/drm/kmb/kmb_drv.h   |  1 +
 drivers/gpu/drm/kmb/kmb_dsi.c   | 27 +++++++++++++++++----------
 drivers/gpu/drm/kmb/kmb_dsi.h   |  1 +
 drivers/gpu/drm/kmb/kmb_plane.c | 37 +++++++++++++++++++++++++++----------
 drivers/gpu/drm/kmb/kmb_regs.h  |  1 +
 6 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index cbf998f..a6a0444 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -87,16 +87,16 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	kmb_dsi_hw_init(dev);
 #ifdef LCD_TEST
 //	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
-	vm.vfront_porch = 0;
+	vm.vfront_porch = 2;
 //	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
-	vm.vback_porch = 0;
+	vm.vback_porch = 2;
 //	vm.vsync_len = m->crtc_vsync_end - m->crtc_vsync_start;
 	vm.vsync_len = 1;
 	//vm.hfront_porch = m->crtc_hsync_start - m->crtc_hdisplay;
 	vm.hfront_porch = 0;
 	vm.hback_porch = 0;
 	//vm.hback_porch = m->crtc_htotal - m->crtc_hsync_end;
-	vm.hsync_len = 1;
+	vm.hsync_len = 7;
 //	vm.hsync_len = m->crtc_hsync_end - m->crtc_hsync_start;
 
 	vsync_start_offset = m->crtc_vsync_start - m->crtc_hsync_start;
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index aa77631..3a1b66c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -30,6 +30,7 @@ struct kmb_drm_private {
 	spinlock_t			irq_lock;
 	int				irq_lcd;
 	int				irq_mipi;
+	dma_addr_t			fb_addr;
 };
 
 static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index a9f2d78..e01c4f9 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -25,6 +25,7 @@
 static int hw_initialized;
 #define IMAGE_PATH "/home/root/1280x720.pnm"
 //#define MIPI_TX_TEST_PATTERN_GENERATION
+//#define MIPI_DMA
 //#define RTL_TEST
 //#define IMG_WIDTH_PX      640
 //#define IMG_HEIGHT_LINES  10
@@ -33,6 +34,7 @@ static int hw_initialized;
 
 /*MIPI TX CFG*/
 //#define MIPI_TX_LANE_DATA_RATE_MBPS 1782
+//#define MIPI_TX_LANE_DATA_RATE_MBPS 800
 #define MIPI_TX_LANE_DATA_RATE_MBPS 891
 //#define MIPI_TX_LANE_DATA_RATE_MBPS 80
 #define MIPI_TX_REF_CLK_KHZ         24000
@@ -80,14 +82,14 @@ static struct mipi_dsi_device *dsi_device;
  * these will eventually go to the device tree sections,
  * and can be used as a refernce later for device tree additions
  */
-//#define RES_1920x1080
+#define RES_1920x1080
 #ifdef RES_1920x1080
 #define IMG_HEIGHT_LINES  1080
 #define IMG_WIDTH_PX      1920
 #define MIPI_TX_ACTIVE_LANES 4
 #endif
 
-#define RES_1280x720
+//#define RES_1280x720
 #ifdef RES_1280x720
 #define IMG_HEIGHT_LINES  720
 #define IMG_WIDTH_PX      1280
@@ -97,9 +99,9 @@ struct mipi_tx_frame_section_cfg mipi_tx_frame0_sect_cfg = {
 	.width_pixels = IMG_WIDTH_PX,
 	.height_lines = IMG_HEIGHT_LINES,
 	.data_type = DSI_LP_DT_PPS_RGB888_24B,
-	//.data_mode = MIPI_DATA_MODE1,
-	.data_mode = MIPI_DATA_MODE0,
-	.dma_packed = 1
+	.data_mode = MIPI_DATA_MODE1,
+//	.data_mode = MIPI_DATA_MODE0,
+	.dma_packed = 0
 };
 
 #ifdef RES_1920x1080
@@ -544,12 +546,15 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
 		<< MIPI_TX_SECT_VC_SHIFT);	/* bits [23:22] */
 	/* data mode */
 	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
-		<< MIPI_TX_SECT_DM_SHIFT);	/* bits [24:25] */
-	cfg |= MIPI_TX_SECT_DMA_PACKED;
-	DRM_INFO("%s : %d ctrl=%d frame_id=%d section=%d cfg=%x\n",
-		 __func__, __LINE__, ctrl_no, frame_id, section, cfg);
+			<< MIPI_TX_SECT_DM_SHIFT); /* bits [24:25]*/
+	if (ph_cfg->dma_packed)
+		cfg |= MIPI_TX_SECT_DMA_PACKED;
+	DRM_INFO("%s : %d ctrl=%d frame_id=%d section=%d cfg=%x packed=%d\n",
+			__func__, __LINE__, ctrl_no, frame_id, section, cfg,
+			ph_cfg->dma_packed);
 	kmb_write_mipi(dev_p, (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
-							section)), cfg);
+					section)), cfg);
+
 	/*unpacked bytes */
 	/*there are 4 frame generators and each fg has 4 sections
 	 *there are 2 registers for unpacked bytes -
@@ -601,6 +606,7 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_p, u8 frame_id,
 	ph_cfg.wc = *wc;
 	ph_cfg.data_mode = frame_scfg->data_mode;
 	ph_cfg.data_type = frame_scfg->data_type;
+	ph_cfg.dma_packed = frame_scfg->dma_packed;
 	ph_cfg.vchannel = frame_id;
 
 	mipi_tx_fg_section_cfg_regs(dev_p, frame_id, section,
@@ -627,6 +633,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 	 * mipi clock speed in RTL tests
 	 */
 	sysclk = KMB_SYS_CLK_MHZ - 50;
+//	sysclk = KMB_SYS_CLK_MHZ;
 
 	/*ppl-pixel packing layer, llp-low level protocol
 	 * frame genartor timing parameters are clocked on the system clock
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 1ece5c7..912e06d 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -262,6 +262,7 @@ struct mipi_tx_frame_sect_phcfg {
 	enum mipi_data_mode data_mode;
 	enum mipi_dsi_data_type data_type;
 	uint8_t vchannel;
+	uint8_t dma_packed;
 };
 
 struct mipi_tx_frame_cfg {
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index fce8dca..f6dfe24 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -96,6 +96,7 @@ static const u32 csc_coef_lcd[] = {
 	-179, 125, -226
 };
 
+
 static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 {
 	int i;
@@ -244,17 +245,21 @@ unsigned int set_pixel_format(u32 format)
 		val = LCD_LAYER_FORMAT_RGBA8888 | LCD_LAYER_BGR_ORDER;
 		break;
 	}
+	DRM_INFO("%s : %d layer format val=%d\n", __func__, __LINE__, val);
 	return val;
 }
 
 unsigned int set_bits_per_pixel(const struct drm_format_info *format)
 {
-	int i;
 	u32 bpp = 0;
 	unsigned int val = 0;
 
-	for (i = 0; i < format->num_planes; i++)
-		bpp += 8 * format->cpp[i];
+	if (format->num_planes > 1) {
+		val = LCD_LAYER_8BPP;
+		return val;
+	}
+
+	bpp += 8*format->cpp[0];
 
 	switch (bpp) {
 	case 8:
@@ -270,8 +275,8 @@ unsigned int set_bits_per_pixel(const struct drm_format_info *format)
 		val = LCD_LAYER_32BPP;
 		break;
 	}
-	DRM_INFO("%s : %d bpp=0x%x\n", __func__, __LINE__, bpp);
-	val = LCD_LAYER_24BPP;
+
+	DRM_INFO("%s : %d bpp=%d val=%d\n", __func__, __LINE__, bpp, val);
 	return val;
 }
 
@@ -325,11 +330,12 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	dev_p = to_kmb(plane->dev);
 
-	src_w = plane->state->src_w >> 16;
+	src_w = (plane->state->src_w >> 16);
 	src_h = plane->state->src_h >> 16;
 	crtc_x = plane->state->crtc_x;
 	crtc_y = plane->state->crtc_y;
 
+	DRM_INFO("src_w=%d src_h=%d\n", src_w, src_h);
 	kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w-1);
 	kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h-1);
 	kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
@@ -339,6 +345,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	val |= set_bits_per_pixel(fb->format);
 	/*CHECKME Leon drvr sets it to 100 try this for now */
 	val |= LCD_LAYER_FIFO_100;
+	val |= LCD_LAYER_BGR_ORDER;
 	kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
 
 	/*re-initialize interrupts */
@@ -353,29 +360,33 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		  | LCD_DMA_LAYER_VSTRIDE_EN;
 */
 	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN
-		  | LCD_DMA_LAYER_AXI_BURST_16 | LCD_DMA_LAYER_CONT_UPDATE;
+		| LCD_DMA_LAYER_AXI_BURST_16 |
+		LCD_DMA_LAYER_CONT_PING_PONG_UPDATE;
 
 	/* disable DMA first */
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
 			~LCD_DMA_LAYER_ENABLE);
+	kmb_write_lcd(dev_p, LCD_FIFO_FLUSH + plane_id*0x400, 1);
 
 	/* pinpong mode is enabled - at the end of DMA transfer, start new
 	 * transfer alternatively using main and shadow register settings.
 	 * So update both main and shadow registers
 	 */
 	addr = drm_fb_cma_get_gem_addr(fb, plane->state, 0);
+	dev_p->fb_addr = addr;
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
 
 	width = fb->width;
 	height = fb->height;
-	dma_len = width * height * 1;
+	dma_len = width * height * fb->format->cpp[0];
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
 
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id), width);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
+			fb->pitches[0]);
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
-			(width));
+			(width*fb->format->cpp[0]));
 
 	/*program Cb/Cr for planar formats*/
 	if (num_planes > 1) {
@@ -413,6 +424,9 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	/* enable DMA */
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
+	DRM_INFO("%s : %d dma_cfg=0x%x LCD_DMA_CFG=0x%x\n", __func__,
+			__LINE__, dma_cfg,
+			kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
 
 	switch (plane_id) {
 	case LAYER_0:
@@ -446,6 +460,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	 * from the Myriadx tests
 	 */
 	out_format |= LCD_OUTF_FORMAT_RGB888;
+//	out_format |= LCD_OUTF_BGR_ORDER;
 
 	if (val & LCD_LAYER_PLANAR_STORAGE) {
 		/*enable CSC if input is planar and output is RGB */
@@ -457,7 +472,9 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	/*leave RGB order,conversion mode and clip mode to default*/
 	/* do not interleave RGB channels for mipi Tx compatibility */
 	out_format |= LCD_OUTF_MIPI_RGB_MODE;
+//	out_format |= LCD_OUTF_SYNC_MODE ;
 	kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
+
 //	kmb_write_lcd(dev_p, LCD_CONTROL, LCD_CTRL_ENABLE);
 #endif
 }
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index ca7e4be..e95891a 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -350,6 +350,7 @@
 #define LCD_OUTF_BGR_ORDER			  (1 << 5)
 #define LCD_OUTF_Y_ORDER			  (1 << 6)
 #define LCD_OUTF_CRCB_ORDER			  (1 << 7)
+#define LCD_OUTF_SYNC_MODE			  (1 << 11)
 #define LCD_OUTF_RGB_CONV_MODE			  (1 << 14)
 #define LCD_OUTF_MIPI_RGB_MODE			  (1 << 18)
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
