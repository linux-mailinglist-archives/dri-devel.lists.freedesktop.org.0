Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9121FF51
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797BA6E9EB;
	Tue, 14 Jul 2020 20:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D8A6E9A0;
 Tue, 14 Jul 2020 20:58:40 +0000 (UTC)
IronPort-SDR: 7tRGVQiFNlU8HYMdYmebJhHO+03Wa4kStICnKe+huPtjllQMADRLavaXJhQrMThUoELSngjkYj
 coksgga1Q8mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444603"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:40 -0700
IronPort-SDR: gT212vAOyKEFzd/VoQjXZkagnejYAbevCMGspp8zsHSGWSdF+E9WfSQtwNn1QMWXYvSl8SfBJz
 +UgeStCQjeBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504237"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:40 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 41/59] drm/kmb: Changes for LCD to Mipi
Date: Tue, 14 Jul 2020 13:57:27 -0700
Message-Id: <1594760265-11618-42-git-send-email-anitha.chrisanthus@intel.com>
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

Also free dsi resources on driver unload. System clock frequency change
for llp ratio calculation.

v2: upclassed dev_private

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  |  25 ++++----
 drivers/gpu/drm/kmb/kmb_drv.c   |   6 +-
 drivers/gpu/drm/kmb/kmb_drv.h   |   1 +
 drivers/gpu/drm/kmb/kmb_dsi.c   | 135 +++++++++++-----------------------------
 drivers/gpu/drm/kmb/kmb_dsi.h   |   2 +-
 drivers/gpu/drm/kmb/kmb_plane.c |  24 +++----
 drivers/gpu/drm/kmb/kmb_regs.h  |   2 +
 7 files changed, 70 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index f77e6f5..cbf998f 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -90,11 +90,14 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	vm.vfront_porch = 0;
 //	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
 	vm.vback_porch = 0;
-	vm.vsync_len = m->crtc_vsync_end - m->crtc_vsync_start;
+//	vm.vsync_len = m->crtc_vsync_end - m->crtc_vsync_start;
+	vm.vsync_len = 1;
 	//vm.hfront_porch = m->crtc_hsync_start - m->crtc_hdisplay;
 	vm.hfront_porch = 0;
-	vm.hback_porch = m->crtc_htotal - m->crtc_hsync_end;
-	vm.hsync_len = m->crtc_hsync_end - m->crtc_hsync_start;
+	vm.hback_porch = 0;
+	//vm.hback_porch = m->crtc_htotal - m->crtc_hsync_end;
+	vm.hsync_len = 1;
+//	vm.hsync_len = m->crtc_hsync_end - m->crtc_hsync_start;
 
 	vsync_start_offset = m->crtc_vsync_start - m->crtc_hsync_start;
 	vsync_end_offset = m->crtc_vsync_end - m->crtc_hsync_end;
@@ -106,13 +109,13 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 			vm.hback_porch, vm.hfront_porch, vm.hsync_len);
 	kmb_write_lcd(dev_p, LCD_V_ACTIVEHEIGHT,
 			m->crtc_vdisplay - 1);
-	kmb_write_lcd(dev_p, LCD_V_BACKPORCH, vm.vback_porch - 1);
-	kmb_write_lcd(dev_p, LCD_V_FRONTPORCH, vm.vfront_porch - 1);
+	kmb_write_lcd(dev_p, LCD_V_BACKPORCH, vm.vback_porch);
+	kmb_write_lcd(dev_p, LCD_V_FRONTPORCH, vm.vfront_porch);
 	kmb_write_lcd(dev_p, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
 	kmb_write_lcd(dev_p, LCD_H_ACTIVEWIDTH,
 			m->crtc_hdisplay - 1);
-	kmb_write_lcd(dev_p, LCD_H_BACKPORCH, vm.hback_porch - 1);
-	kmb_write_lcd(dev_p, LCD_H_FRONTPORCH, vm.hfront_porch - 1);
+	kmb_write_lcd(dev_p, LCD_H_BACKPORCH, vm.hback_porch);
+	kmb_write_lcd(dev_p, LCD_H_FRONTPORCH, vm.hfront_porch);
 	kmb_write_lcd(dev_p, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
 	/*this is hardcoded as 0 in the Myriadx code */
 	kmb_write_lcd(dev_p, LCD_VSYNC_START, 0);
@@ -122,11 +125,11 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		kmb_write_lcd(dev_p,
 				LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
 		kmb_write_lcd(dev_p,
-				LCD_V_BACKPORCH_EVEN, vm.vback_porch - 1);
+				LCD_V_BACKPORCH_EVEN, vm.vback_porch);
 		kmb_write_lcd(dev_p,
-				LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
-		kmb_write_lcd(dev_p,
-				LCD_V_ACTIVEHEIGHT_EVEN, m->crtc_vdisplay - 1);
+				LCD_V_FRONTPORCH_EVEN, vm.vfront_porch);
+		kmb_write_lcd(dev_p, LCD_V_ACTIVEHEIGHT_EVEN,
+			m->crtc_vdisplay - 1);
 		/*this is hardcoded as 10 in the Myriadx code*/
 		kmb_write_lcd(dev_p, LCD_VSYNC_START_EVEN, 10);
 		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN, 10);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 8bd3011..039dd21 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -216,7 +216,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 #endif
 	/* Set MIPI clock to 24 Mhz*/
 	DRM_INFO("Get clk_mipi before set = %ld\n", clk_get_rate(clk_mipi));
-//#define MIPI_CLK
+#define MIPI_CLK
 #ifdef MIPI_CLK
 	ret = clk_set_rate(clk_mipi, KMB_MIPI_DEFAULT_CLK);
 	DRM_INFO("Get clk_mipi after set = %ld\n", clk_get_rate(clk_mipi));
@@ -497,7 +497,7 @@ static void kmb_drm_unload(struct device *dev)
 	dev_set_drvdata(dev, NULL);
 
 	/* Unregister DSI host */
-	dsi_host_unregister();
+	kmb_dsi_host_unregister();
 }
 
 static int kmb_probe(struct platform_device *pdev)
@@ -573,7 +573,7 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 	drm_dev_put(drm);
-	dsi_host_unregister();
+	kmb_dsi_host_unregister();
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 89d7845..aa77631 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -15,6 +15,7 @@
 #define KMB_LCD_DEFAULT_CLK		250000000
 #define KMB_MIPI_DEFAULT_CLK		24000000
 #define KMB_MIPI_DEFAULT_CFG_CLK	24000000
+#define KMB_SYS_CLK_MHZ			500
 
 struct kmb_drm_private {
 	struct drm_device		drm;
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index c23719c..a9f2d78 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -80,6 +80,7 @@ static struct mipi_dsi_device *dsi_device;
  * these will eventually go to the device tree sections,
  * and can be used as a refernce later for device tree additions
  */
+//#define RES_1920x1080
 #ifdef RES_1920x1080
 #define IMG_HEIGHT_LINES  1080
 #define IMG_WIDTH_PX      1920
@@ -262,10 +263,18 @@ static int kmb_dsi_get_modes(struct drm_connector *connector)
 	return num_modes;
 }
 
+void kmb_dsi_host_unregister(void)
+{
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	mipi_dsi_host_unregister(dsi_host);
+	kfree(dsi_host);
+}
+
 static void kmb_dsi_connector_destroy(struct drm_connector *connector)
 {
 	struct kmb_connector *kmb_connector = to_kmb_connector(connector);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	drm_connector_cleanup(connector);
 	kfree(kmb_connector);
 }
@@ -274,8 +283,19 @@ static void kmb_dsi_encoder_destroy(struct drm_encoder *encoder)
 {
 	struct kmb_dsi *kmb_dsi = to_kmb_dsi(encoder);
 
+	DRM_INFO("%s : %d\n", __func__, __LINE__);
+	if (!kmb_dsi)
+		return;
+
+	kfree(kmb_dsi->dsi_host);
+
 	drm_encoder_cleanup(encoder);
+
+	kmb_dsi_connector_destroy(&kmb_dsi->attached_connector->base);
+
 	kfree(kmb_dsi);
+	if (!dsi_device)
+		kfree(dsi_device);
 }
 
 static const struct drm_encoder_funcs kmb_dsi_funcs = {
@@ -385,13 +405,8 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev)
 	return bridge;
 }
 
-void dsi_host_unregister(void)
-{
-	mipi_dsi_host_unregister(dsi_host);
-}
-
 u32 mipi_get_datatype_params(u32 data_type, u32 data_mode,
-			     struct mipi_data_type_params *params)
+		struct mipi_data_type_params *params)
 {
 	struct mipi_data_type_params data_type_parameters;
 
@@ -608,8 +623,10 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
 
 	/*Get system clock for blanking period cnfigurations */
 	/*TODO need to get system clock from clock driver */
-	/* Assume 700 Mhz system clock for now */
-	sysclk = 500;
+	/* 500 Mhz system clock minus 50 - to account for the difference in
+	 * mipi clock speed in RTL tests
+	 */
+	sysclk = KMB_SYS_CLK_MHZ - 50;
 
 	/*ppl-pixel packing layer, llp-low level protocol
 	 * frame genartor timing parameters are clocked on the system clock
@@ -875,9 +892,6 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
 
 		active_vchannels++;
 
-		/*connect lcd to mipi */
-		kmb_write_msscam(dev_p, MSS_LCD_MIPI_CFG, 1);
-
 		/*stop iterating as only one virtual channel shall be used for
 		 * LCD connection
 		 */
@@ -1662,56 +1676,17 @@ void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p)
 
 }
 
-void dma_transfer(struct kmb_drm_private *dev_p, int mipi_number,
-		  u64 dma_start_address, int data_length)
+void connect_lcd_to_mipi(struct kmb_drm_private *dev_p)
 {
-	u64 dma_cfg_adr_offset;
-	u64 dma_start_adr_offset;
-	u64 dma_length_adr_offset;
-	u32 reg_wr_data;
-	int axi_burst_length;
-	int mipi_fifo_flush;
-	int dma_pipelined_axi_en;
-	int dma_en;
-	int dma_autorestart_mode_0;
-	int tx_rx;
-
-	DRM_INFO("%s: starting a new DMA transfer for mipi %d ", __func__,
-		 mipi_number);
-
-	if (mipi_number < 6)
-		tx_rx = 0;
-	else
-		tx_rx = 1;
-
-	dma_cfg_adr_offset =
-		MIPI_TX_HS_DMA_CFG + HS_OFFSET(mipi_number);
-	dma_start_adr_offset =
-		MIPI_TX_HS_DMA_START_ADR_CHAN0 + HS_OFFSET(mipi_number);
-	dma_length_adr_offset =
-		MIPI_TX_HS_DMA_LEN_CHAN0 + HS_OFFSET(mipi_number);
-
-	reg_wr_data = 0;
-	reg_wr_data = dma_start_address;
-	kmb_write_mipi(dev_p, dma_start_adr_offset, reg_wr_data);
-
-	reg_wr_data = 0;
-	reg_wr_data = data_length;
-	kmb_write_mipi(dev_p, dma_length_adr_offset, reg_wr_data);
-
-	axi_burst_length = 16;
-	mipi_fifo_flush = 0;
-	dma_pipelined_axi_en = 1;
-	dma_en = 1;
-	dma_autorestart_mode_0 = 0;
-
-	reg_wr_data = 0;
-	reg_wr_data =
-	    ((axi_burst_length & 0x1ffff) << 0 | (mipi_fifo_flush & 0xf) << 9 |
-	     (dma_pipelined_axi_en & 0x1) << 13 | (dma_en & 0xf) << 16 |
-	     (dma_autorestart_mode_0 & 0x3) << 24);
-
-	kmb_write_mipi(dev_p, dma_cfg_adr_offset, reg_wr_data);
+#ifdef LCD_TEST
+	/*connect lcd to mipi */
+	/*DISABLE MIPI->CIF CONNECTION*/
+	kmb_write_msscam(dev_p, MSS_MIPI_CIF_CFG, 0);
+	/*ENABLE LCD->MIPI CONNECTION */
+	kmb_write_msscam(dev_p, MSS_LCD_MIPI_CFG, 1);
+	/*DISABLE LCD->CIF LOOPBACK */
+	kmb_write_msscam(dev_p, MSS_LOOPBACK_CFG, 0);
+#endif
 }
 
 /**
@@ -1753,46 +1728,12 @@ int kmb_dsi_hw_init(struct drm_device *dev)
 	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
 	/*d-phy initialization */
 	mipi_tx_init_dphy(dev_p, &mipi_tx_init_cfg);
+	connect_lcd_to_mipi(dev_p);
 #ifdef MIPI_TX_TEST_PATTERN_GENERATION
 	mipi_tx_hs_tp_gen(dev_p, 0, MIPI_TX_HS_TP_V_STRIPES, 0x15, 0xff,
 			0xff00, MIPI_CTRL6);
 	DRM_INFO("%s : %d IRQ_STATUS = 0x%x\n", __func__, __LINE__,
 			GET_MIPI_TX_HS_IRQ_STATUS(dev_p, MIPI_CTRL6));
-#elseif MIPI_DMA
-	  dma_data_length = image_height * image_width * unpacked_bytes;
-	file = filp_open(IMAGE_PATH, O_RDWR, 0);
-	if (IS_ERR(file)) {
-		DRM_ERROR("filp_open failed\n");
-		return -EBADF;
-	}
-
-	file_buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!file_buf) {
-		DRM_ERROR("file_buf alloc failed\n");
-		return -ENOMEM;
-	}
-
-	i_size = i_size_read(file_inode(file));
-	while (offset < i_size) {
-
-		file_buf_len = kmb_kernel_read(file, offset,
-					       file_buf, PAGE_SIZE);
-		if (file_buf_len < 0) {
-			rc = file_buf_len;
-			break;
-		}
-		if (file_buf_len == 0)
-			break;
-		offset += file_buf_len;
-		count++;
-		dma_tx_start_address = file_buf;
-		dma_transfer(dev_p, MIPI_CTRL6, dma_tx_start_address,
-			     PAGE_SIZE);
-
-	}
-	DRM_INFO("count = %d\n", count);
-	kfree(file_buf);
-	filp_close(file, NULL);
 #endif //MIPI_TX_TEST_PATTERN_GENERATION
 
 	hw_initialized = true;
@@ -1829,12 +1770,11 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 	host = kmb_dsi_host_init(dev, kmb_dsi);
 	if (!host) {
 		DRM_ERROR("Faile to allocate host\n");
-//              drm_encoder_cleanup(encoder);
 		kfree(kmb_dsi);
 		kfree(kmb_connector);
 		return -ENOMEM;
 	}
-
+	kmb_dsi->dsi_host = host;
 	connector = &kmb_connector->base;
 	encoder = &kmb_dsi->base;
 	encoder->possible_crtcs = 1;
@@ -1849,7 +1789,6 @@ int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge)
 	DRM_INFO("%s : %d connector = %s encoder = %s\n", __func__,
 		 __LINE__, connector->name, encoder->name);
 
-	DRM_INFO("%s : %d\n", __func__, __LINE__);
 	ret = drm_connector_attach_encoder(connector, encoder);
 
 	/* Link drm_bridge to encoder */
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.h b/drivers/gpu/drm/kmb/kmb_dsi.h
index 035ad80..1ece5c7 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.h
+++ b/drivers/gpu/drm/kmb/kmb_dsi.h
@@ -319,7 +319,7 @@ struct drm_bridge *kmb_dsi_host_bridge_init(struct device *dev);
 int kmb_dsi_init(struct drm_device *dev, struct drm_bridge *bridge);
 void kmb_plane_destroy(struct drm_plane *plane);
 void mipi_tx_handle_irqs(struct kmb_drm_private *dev_p);
-void dsi_host_unregister(void);
+void kmb_dsi_host_unregister(void);
 int kmb_dsi_hw_init(struct drm_device *dev);
 
 #define to_kmb_connector(x) container_of(x, struct kmb_connector, base)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index c57f06f..fce8dca 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -270,6 +270,8 @@ unsigned int set_bits_per_pixel(const struct drm_format_info *format)
 		val = LCD_LAYER_32BPP;
 		break;
 	}
+	DRM_INFO("%s : %d bpp=0x%x\n", __func__, __LINE__, bpp);
+	val = LCD_LAYER_24BPP;
 	return val;
 }
 
@@ -350,9 +352,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		  | LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_1
 		  | LCD_DMA_LAYER_VSTRIDE_EN;
 */
-	dma_cfg = LCD_DMA_LAYER_ENABLE
-		  | LCD_DMA_LAYER_AXI_BURST_1
-		  | LCD_DMA_LAYER_VSTRIDE_EN;
+	dma_cfg = LCD_DMA_LAYER_ENABLE | LCD_DMA_LAYER_VSTRIDE_EN
+		  | LCD_DMA_LAYER_AXI_BURST_16 | LCD_DMA_LAYER_CONT_UPDATE;
 
 	/* disable DMA first */
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
@@ -368,14 +369,13 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	width = fb->width;
 	height = fb->height;
-	dma_len = width * height * fb->format->cpp[0];
+	dma_len = width * height * 1;
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN_SHADOW(plane_id), dma_len);
 
-	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
-			fb->pitches[0]);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id), width);
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
-			(width*fb->format->cpp[0]));
+			(width));
 
 	/*program Cb/Cr for planar formats*/
 	if (num_planes > 1) {
@@ -430,11 +430,11 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	}
 
 //	ctrl |= LCD_CTRL_ENABLE;
-//	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-//		| LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
-
 	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-		| LCD_CTRL_ONE_SHOT | LCD_CTRL_OUTPUT_ENABLED;
+		| LCD_CTRL_CONTINUOUS | LCD_CTRL_OUTPUT_ENABLED;
+
+//	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
+//		| LCD_CTRL_ONE_SHOT | LCD_CTRL_OUTPUT_ENABLED;
 	/*LCD is connected to MIPI on kmb
 	 * Therefore this bit is required for DSI Tx
 	 */
@@ -453,7 +453,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	/*set background color to white*/
-	kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0xffffff);
+//	kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0xffffff);
 	/*leave RGB order,conversion mode and clip mode to default*/
 	/* do not interleave RGB channels for mipi Tx compatibility */
 	out_format |= LCD_OUTF_MIPI_RGB_MODE;
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index c83740bb..ca7e4be 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -714,8 +714,10 @@
 			& (1 << (dphy - MIPI_DPHY6)))
 #define DPHY_CFG_CLK_EN				(0x18c)
 
+#define MSS_MIPI_CIF_CFG		(0x00)
 #define MSS_LCD_MIPI_CFG		(0x04)
 #define MSS_CAM_CLK_CTRL		(0x10)
+#define MSS_LOOPBACK_CFG		(0x0C)
 #define   LCD				(1<<1)
 #define   MIPI_COMMON			(1<<2)
 #define   MIPI_TX0			(1<<9)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
