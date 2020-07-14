Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F39421FF75
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 23:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BBD6EA14;
	Tue, 14 Jul 2020 20:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DABD6E9BF;
 Tue, 14 Jul 2020 20:58:50 +0000 (UTC)
IronPort-SDR: qToXgm/j81K4Q1WGfz588ZntzGQljXm/mgE/lRLD5mJDffgzr4xauGZOu9InY3UfWlWJxXNG7k
 HhZyb19MDJdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444630"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444630"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:49 -0700
IronPort-SDR: cQ15Afj61km8WovR6fQf1gc6gFcp5ytKb5kcVYHjsCG2V3lS7Dra+WQYWkbSotyCIgfT1aUQ1/
 75SU/IFbrpoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504325"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:49 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 57/59] drm/kmb: workaround for dma undeflow issue
Date: Tue, 14 Jul 2020 13:57:43 -0700
Message-Id: <1594760265-11618-58-git-send-email-anitha.chrisanthus@intel.com>
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

Initial issue was that display remains shifted after undeflow, this fix is
to recover the dma after underflow so display is clean. Major changes are
reduce LCD_CLK to 200Mhz and some changes in the lcd timing params
run recovery sequence at the EOF after underflow happens
do nothing in plan_update() during recovery
reenable dma at the vsync interrupt after recovery is done

v2: renamed global vars, upclassed dev_private.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  |  27 +++----
 drivers/gpu/drm/kmb/kmb_drv.c   | 154 +++++++++++++++++++++++++++++++---------
 drivers/gpu/drm/kmb/kmb_drv.h   |  33 +++++----
 drivers/gpu/drm/kmb/kmb_plane.c |  12 +++-
 drivers/gpu/drm/kmb/kmb_plane.h |  29 ++++----
 drivers/gpu/drm/kmb/kmb_regs.h  |   5 ++
 6 files changed, 185 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index aceca94..8308a9e1 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -96,25 +96,25 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	vm.vfront_porch = 2;
 //      vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
 	vm.vback_porch = 2;
-//      vm.vsync_len = m->crtc_vsync_end - m->crtc_vsync_start;
-	vm.vsync_len = 1;
+//	vm.vsync_len = m->crtc_vsync_end - m->crtc_vsync_start;
+	vm.vsync_len = 8;
 	//vm.hfront_porch = m->crtc_hsync_start - m->crtc_hdisplay;
 	vm.hfront_porch = 0;
 	vm.hback_porch = 0;
 	//vm.hback_porch = m->crtc_htotal - m->crtc_hsync_end;
-	vm.hsync_len = 7;
-//      vm.hsync_len = m->crtc_hsync_end - m->crtc_hsync_start;
+	vm.hsync_len = 28;
+//	vm.hsync_len = m->crtc_hsync_end - m->crtc_hsync_start;
 
-	vsync_start_offset = m->crtc_vsync_start - m->crtc_hsync_start;
-	vsync_end_offset = m->crtc_vsync_end - m->crtc_hsync_end;
+	vsync_start_offset =  m->crtc_vsync_start -  m->crtc_hsync_start;
+	vsync_end_offset =  m->crtc_vsync_end - m->crtc_hsync_end;
 
-	DRM_DEBUG
-	    ("%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hysnc-l=%d",
-	     __func__, __LINE__, m->crtc_vdisplay, vm.vback_porch,
-	     vm.vfront_porch, vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
-	     vm.hfront_porch, vm.hsync_len);
+	DRM_DEBUG("%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hysnc-l=%d",
+			__func__, __LINE__,
+			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
+			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
+			vm.hfront_porch, vm.hsync_len);
 	kmb_write_lcd(dev_p, LCD_V_ACTIVEHEIGHT,
-		      m->crtc_vdisplay - 1);
+			m->crtc_vdisplay - 1);
 	kmb_write_lcd(dev_p, LCD_V_BACKPORCH, vm.vback_porch);
 	kmb_write_lcd(dev_p, LCD_V_FRONTPORCH, vm.vfront_porch);
 	kmb_write_lcd(dev_p, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
@@ -126,7 +126,8 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	/*this is hardcoded as 0 in the Myriadx code */
 	kmb_write_lcd(dev_p, LCD_VSYNC_START, 0);
 	kmb_write_lcd(dev_p, LCD_VSYNC_END, 0);
-
+	/* back ground color */
+	kmb_write_lcd(dev_p, LCD_BG_COLOUR_LS, 0x4);
 	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
 		kmb_write_lcd(dev_p,
 			      LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index b844c77..559742b8 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -31,10 +31,10 @@
 #include "kmb_regs.h"
 
 //#define DEBUG
-
 /* IRQ handler */
 static irqreturn_t kmb_isr(int irq, void *arg);
 
+int kmb_under_flow = 0, kmb_flush_done = 0, layer_no = 0;
 static struct clk *clk_lcd;
 static struct clk *clk_mipi;
 static struct clk *clk_mipi_ecfg;
@@ -111,6 +111,7 @@ static void __iomem *kmb_map_mmio(struct platform_device *pdev, char *name)
 	return mem;
 }
 
+//#define ICAM_LCD_QOS
 static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
 	struct kmb_drm_private *dev_p = to_kmb(drm);
@@ -118,6 +119,9 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	int irq_lcd;
 	int ret = 0;
 	unsigned long clk;
+#ifdef ICAM_LCD_QOS
+	int val = 0;
+#endif
 
 	/* Map MIPI MMIO registers */
 	dev_p->mipi_mmio = kmb_map_mmio(pdev, "mipi_regs");
@@ -151,6 +155,13 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 		iounmap(dev_p->mipi_mmio);
 		return -ENOMEM;
 	}
+#ifdef ICAM_LCD_QOS
+	dev_p->icamlcd_mmio = ioremap_nocache(ICAM_MMIO, ICAM_MMIO_SIZE);
+	if (IS_ERR(dev_p->icamlcd_mmio)) {
+		DRM_ERROR("failed to map ICAM registers\n");
+		return -ENOMEM;
+	}
+#endif
 #define KMB_CLOCKS
 #ifdef KMB_CLOCKS
 	/* Enable display clocks */
@@ -246,7 +257,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	kmb_set_bitmask_msscam(dev_p, MSS_CAM_CLK_CTRL, 0x1fff);
 	kmb_set_bitmask_msscam(dev_p, MSS_CAM_RSTN_CTRL, 0xffffffff);
 
-#endif //KMB_CLOCKS
+#endif				//KMB_CLOCKS
 
 	/* Register irqs here - section 17.3 in databook
 	 * lists LCD at 79 and 82 for MIPI under MSS CPU -
@@ -309,11 +320,29 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 
 	dev_p->irq_lcd = irq_lcd;
 
+	/* icam tests */
+#ifdef ICAM_LCD_QOS
+	/*generator mode = 0 fixed mode=1 limiter */
+	writel(1, (dev_p->icamlcd_mmio + ICAM_LCD_OFFSET + LCD_QOS_MODE));
+	/* b/w */
+	writel(0x60, (dev_p->icamlcd_mmio + ICAM_LCD_OFFSET + LCD_QOS_BW));
+
+	/* set priority.p1 */
+	val = readl(dev_p->icamlcd_mmio + ICAM_LCD_OFFSET + LCD_QOS_PRORITY);
+	val &= ~(0x700);
+	writel(val | 0x100,
+	       (dev_p->icamlcd_mmio + ICAM_LCD_OFFSET + LCD_QOS_PRORITY));
+
+	DRM_INFO("ICAM mode = 0x%x, priority = 0x%x bandwidth=0x%x",
+		 readl(dev_p->icamlcd_mmio + 0x1080 + LCD_QOS_MODE),
+		 readl(dev_p->icamlcd_mmio + 0x1080 + LCD_QOS_PRORITY),
+		 readl(dev_p->icamlcd_mmio + 0x1080 + LCD_QOS_BW));
+#endif
 	return 0;
 
-irq_fail:
+ irq_fail:
 	drm_crtc_cleanup(&dev_p->crtc);
-setup_fail:
+ setup_fail:
 	of_reserved_mem_device_release(drm->dev);
 
 	return ret;
@@ -346,13 +375,15 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 
 static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 {
-	unsigned long status, val;
-	int plane_id;
+	volatile unsigned long status, val, val1;
+	int plane_id, dma0_state, dma1_state;
 	struct kmb_drm_private *dev_p = to_kmb(dev);
 
 	status = kmb_read_lcd(dev_p, LCD_INT_STATUS);
+
 	if (status & LCD_INT_EOF) {
 		/* TODO - handle EOF interrupt? */
+
 		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF);
 
 		/* When disabling/enabling LCD layers, the change takes effect
@@ -374,6 +405,28 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 				plane_status[plane_id].disable = false;
 			}
 		}
+		if (kmb_under_flow) {
+			/*DMA Recovery after underflow */
+			dma0_state = (layer_no == 0) ?
+			    LCD_VIDEO0_DMA0_STATE : LCD_VIDEO1_DMA0_STATE;
+			dma1_state = (layer_no == 0) ?
+			    LCD_VIDEO0_DMA1_STATE : LCD_VIDEO1_DMA1_STATE;
+
+			do {
+				kmb_write_lcd(dev_p, LCD_FIFO_FLUSH, 1);
+				val = kmb_read_lcd(dev_p, dma0_state)
+				    & LCD_DMA_STATE_ACTIVE;
+				val1 = kmb_read_lcd(dev_p, dma1_state)
+				    & LCD_DMA_STATE_ACTIVE;
+			} while ((val || val1));
+			/*disable dma */
+			kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(layer_no),
+					    LCD_DMA_LAYER_ENABLE);
+			kmb_write_lcd(dev_p, LCD_FIFO_FLUSH, 1);
+			kmb_flush_done = 1;
+			kmb_under_flow = 0;
+		}
+
 	}
 
 	if (status & LCD_INT_LINE_CMP) {
@@ -387,48 +440,86 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
 		switch (val) {
 		case LCD_VSTATUS_COMPARE_VSYNC:
+			/* Clear vertical compare interrupt */
+			kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+			if (kmb_flush_done) {
+				kmb_set_bitmask_lcd(dev_p,
+						    LCD_LAYERn_DMA_CFG
+						    (layer_no),
+						    LCD_DMA_LAYER_ENABLE);
+				kmb_flush_done = 0;
+			}
+			drm_handle_vblank(dev, 0);
+			break;
 		case LCD_VSTATUS_COMPARE_BACKPORCH:
 		case LCD_VSTATUS_COMPARE_ACTIVE:
 		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
-			/* clear vertical compare interrupt */
-			kmb_write_lcd(dev_p, LCD_INT_CLEAR,
-					LCD_INT_VERT_COMP);
-			drm_handle_vblank(dev, 0);
+			kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
 			break;
 		}
 	}
-
 	if (status & LCD_INT_DMA_ERR) {
-		val = (status & LCD_INT_DMA_ERR);
+		val =
+		    (status & LCD_INT_DMA_ERR &
+		     kmb_read_lcd(dev_p, LCD_INT_ENABLE));
 		/* LAYER0 - VL0 */
-		if (val & LAYER0_DMA_FIFO_UNDERFLOW)
-			DRM_INFO("LAYER0:VL0 DMA UNDERFLOW val = 0x%lx", val);
+		if (val & (LAYER0_DMA_FIFO_UNDERFLOW |
+			   LAYER0_DMA_CB_FIFO_UNDERFLOW |
+			   LAYER0_DMA_CR_FIFO_UNDERFLOW)) {
+			kmb_under_flow++;
+			DRM_INFO
+			    ("!LAYER0:VL0 DMA UNDERFLOW val = 0x%lx,under_flow=%d",
+			     val, kmb_under_flow);
+			/*disable underflow inerrupt */
+			kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
+					    LAYER0_DMA_FIFO_UNDERFLOW |
+					    LAYER0_DMA_CB_FIFO_UNDERFLOW |
+					    LAYER0_DMA_CR_FIFO_UNDERFLOW);
+			kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR,
+					    LAYER0_DMA_CB_FIFO_UNDERFLOW |
+					    LAYER0_DMA_FIFO_UNDERFLOW |
+					    LAYER0_DMA_CR_FIFO_UNDERFLOW);
+			/*disable auto restart mode */
+			kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(0),
+				    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
+			layer_no = 0;
+		}
+
 		if (val & LAYER0_DMA_FIFO_OVERFLOW)
 			DRM_INFO("LAYER0:VL0 DMA OVERFLOW val = 0x%lx", val);
 		if (val & LAYER0_DMA_CB_FIFO_OVERFLOW)
 			DRM_INFO("LAYER0:VL0 DMA CB OVERFLOW val = 0x%lx", val);
-		if (val & LAYER0_DMA_CB_FIFO_UNDERFLOW)
-			DRM_INFO("LAYER0:VL0 DMA CB UNDERFLOW val = 0x%lx",
-				 val);
-		if (val & LAYER0_DMA_CR_FIFO_UNDERFLOW)
-			DRM_INFO("LAYER0:VL0 DMA CR UNDERFLOW val = 0x%lx",
-				 val);
 		if (val & LAYER0_DMA_CR_FIFO_OVERFLOW)
 			DRM_INFO("LAYER0:VL0 DMA CR OVERFLOW val = 0x%lx", val);
 
 		/* LAYER1 - VL1 */
-		if (val & LAYER1_DMA_FIFO_UNDERFLOW)
-			DRM_INFO("LAYER1:VL1 DMA UNDERFLOW val = 0x%lx", val);
+		if (val & (LAYER1_DMA_FIFO_UNDERFLOW |
+			   LAYER1_DMA_CB_FIFO_UNDERFLOW |
+			   LAYER1_DMA_CR_FIFO_UNDERFLOW)) {
+			kmb_under_flow++;
+			DRM_INFO
+			    ("!LAYER1:VL1 DMA UNDERFLOW val = 0x%lx, under_flow=%d",
+			     val, kmb_under_flow);
+			/*disable underflow inerrupt */
+			kmb_clr_bitmask_lcd(dev_p, LCD_INT_ENABLE,
+					    LAYER1_DMA_FIFO_UNDERFLOW |
+					    LAYER1_DMA_CB_FIFO_UNDERFLOW |
+					    LAYER1_DMA_CR_FIFO_UNDERFLOW);
+			kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR,
+					    LAYER1_DMA_CB_FIFO_UNDERFLOW |
+					    LAYER1_DMA_FIFO_UNDERFLOW |
+					    LAYER1_DMA_CR_FIFO_UNDERFLOW);
+			/*disable auto restart mode */
+			kmb_clr_bitmask_lcd(dev_p, LCD_LAYERn_DMA_CFG(1),
+				    LCD_DMA_LAYER_CONT_PING_PONG_UPDATE);
+			layer_no = 1;
+		}
+
+		/* LAYER1 - VL1 */
 		if (val & LAYER1_DMA_FIFO_OVERFLOW)
 			DRM_INFO("LAYER1:VL1 DMA OVERFLOW val = 0x%lx", val);
 		if (val & LAYER1_DMA_CB_FIFO_OVERFLOW)
 			DRM_INFO("LAYER1:VL1 DMA CB OVERFLOW val = 0x%lx", val);
-		if (val & LAYER1_DMA_CB_FIFO_UNDERFLOW)
-			DRM_INFO("LAYER1:VL1 DMA CB UNDERFLOW val = 0x%lx",
-				 val);
-		if (val & LAYER1_DMA_CR_FIFO_UNDERFLOW)
-			DRM_INFO("LAYER1:VL1 DMA CR UNDERFLOW val = 0x%lx",
-				 val);
 		if (val & LAYER1_DMA_CR_FIFO_OVERFLOW)
 			DRM_INFO("LAYER1:VL1 DMA CR OVERFLOW val = 0x%lx", val);
 
@@ -443,7 +534,6 @@ static irqreturn_t handle_lcd_irq(struct drm_device *dev)
 			DRM_INFO("LAYER3:GL1 DMA UNDERFLOW val = 0x%lx", val);
 		if (val & LAYER3_DMA_FIFO_UNDERFLOW)
 			DRM_INFO("LAYER3:GL1 DMA OVERFLOW val = 0x%lx", val);
-
 	}
 
 	if (status & LCD_INT_LAYER) {
@@ -630,11 +720,11 @@ static int kmb_probe(struct platform_device *pdev)
 #endif
 	return 0;
 
-err_register:
+ err_register:
 	drm_kms_helper_poll_fini(drm);
-err_vblank:
+ err_vblank:
 	pm_runtime_disable(drm->dev);
-err_free:
+ err_free:
 	drm_mode_config_cleanup(drm);
 	dev_set_drvdata(dev, NULL);
 	drm_dev_put(drm);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 373a059..939f8b4 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -14,28 +14,31 @@
 #define KMB_MAX_HEIGHT			1080 /*max height in pixels */
 #define KMB_MIN_WIDTH                   1920 /*max width in pixels */
 #define KMB_MIN_HEIGHT                  1080 /*max height in pixels */
-#define KMB_LCD_DEFAULT_CLK		250000000
+#define KMB_LCD_DEFAULT_CLK		200000000
 #define KMB_MIPI_DEFAULT_CLK		24000000
 #define KMB_MIPI_DEFAULT_CFG_CLK	24000000
 #define KMB_SYS_CLK_MHZ			500
 
 #define crtc_to_kmb_priv(x)	container_of(x, struct kmb_drm_private, crtc)
 
-
+#define ICAM_MMIO		0x3b100000
+#define ICAM_LCD_OFFSET		0x1080
+#define ICAM_MMIO_SIZE		0x2000
 struct kmb_drm_private {
-	struct drm_device drm;
-	void __iomem *lcd_mmio;
-	void __iomem *mipi_mmio;
-	void __iomem *msscam_mmio;
-	unsigned char n_layers;
-	struct clk *clk;
-	struct drm_crtc crtc;
-	struct kmb_plane *plane;
-	struct drm_atomic_state *state;
-	spinlock_t irq_lock;
-	int irq_lcd;
-	int irq_mipi;
-	dma_addr_t fb_addr;
+	struct drm_device		drm;
+	void __iomem			*lcd_mmio;
+	void __iomem			*mipi_mmio;
+	void __iomem			*msscam_mmio;
+	void __iomem                    *icamlcd_mmio;
+	unsigned char			n_layers;
+	struct clk			*clk;
+	struct drm_crtc			crtc;
+	struct kmb_plane		*plane;
+	struct drm_atomic_state		*state;
+	spinlock_t			irq_lock;
+	int				irq_lcd;
+	int				irq_mipi;
+	dma_addr_t			fb_addr;
 };
 
 static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index a6b5969..de225a8 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -22,7 +22,6 @@
 #include "kmb_regs.h"
 
 struct layer_status plane_status[KMB_MAX_PLANES];
-
 const uint32_t layer_irqs[] = {
 	LCD_INT_VL0,
 	LCD_INT_VL1,
@@ -247,13 +246,17 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	fb = plane->state->fb;
 	if (!fb)
 		return;
-
 	num_planes = fb->format->num_planes;
 	kmb_plane = to_kmb_plane(plane);
 	plane_id = kmb_plane->id;
 
 	dev_p = to_kmb(plane->dev);
 
+	if (kmb_under_flow || kmb_flush_done) {
+		DRM_DEBUG("plane_update:underflow!!!! returning");
+		return;
+	}
+
 	src_w = (plane->state->src_w >> 16);
 	src_h = plane->state->src_h >> 16;
 	crtc_x = plane->state->crtc_x;
@@ -373,6 +376,11 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
 	DRM_DEBUG("dma_cfg=0x%x LCD_DMA_CFG=0x%x\n", dma_cfg,
 		  kmb_read_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id)));
+
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF |
+			LCD_INT_DMA_ERR);
+	kmb_set_bitmask_lcd(dev_p, LCD_INT_ENABLE, LCD_INT_EOF |
+			LCD_INT_DMA_ERR);
 #endif
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
index d8e1ece..48f237f 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.h
+++ b/drivers/gpu/drm/kmb/kmb_plane.h
@@ -8,19 +8,22 @@
 
 #include "kmb_drv.h"
 
-#define LCD_INT_VL0_ERR (LAYER0_DMA_FIFO_UNDERFLOW | \
-			LAYER0_DMA_FIFO_OVERFLOW | \
-			LAYER0_DMA_CB_FIFO_OVERFLOW | \
-			LAYER0_DMA_CB_FIFO_UNDERFLOW | \
-			LAYER0_DMA_CR_FIFO_OVERFLOW | \
-			LAYER0_DMA_CR_FIFO_UNDERFLOW)
-
-#define LCD_INT_VL1_ERR (LAYER1_DMA_FIFO_UNDERFLOW | \
-			LAYER1_DMA_FIFO_OVERFLOW | \
-			LAYER1_DMA_CB_FIFO_OVERFLOW | \
-			LAYER1_DMA_CB_FIFO_UNDERFLOW | \
-			LAYER1_DMA_CR_FIFO_OVERFLOW | \
-			LAYER1_DMA_CR_FIFO_UNDERFLOW)
+extern int kmb_under_flow;
+extern int kmb_flush_done;
+
+#define LCD_INT_VL0_ERR ((LAYER0_DMA_FIFO_UNDERFLOW) | \
+			(LAYER0_DMA_FIFO_OVERFLOW) | \
+			(LAYER0_DMA_CB_FIFO_OVERFLOW) | \
+			(LAYER0_DMA_CB_FIFO_UNDERFLOW) | \
+			(LAYER0_DMA_CR_FIFO_OVERFLOW) | \
+			(LAYER0_DMA_CR_FIFO_UNDERFLOW))
+
+#define LCD_INT_VL1_ERR ((LAYER1_DMA_FIFO_UNDERFLOW) | \
+			(LAYER1_DMA_FIFO_OVERFLOW) | \
+			(LAYER1_DMA_CB_FIFO_OVERFLOW) | \
+			(LAYER1_DMA_CB_FIFO_UNDERFLOW) | \
+			(LAYER1_DMA_CR_FIFO_OVERFLOW) | \
+			(LAYER1_DMA_CR_FIFO_UNDERFLOW))
 
 #define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW | LAYER2_DMA_FIFO_UNDERFLOW)
 #define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW | LAYER3_DMA_FIFO_UNDERFLOW)
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index c5768d5..089e42d 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -382,6 +382,7 @@
 #define LCD_PWM2_HIGH_LOW			(0x4 * 0x81a)
 #define LCD_VIDEO0_DMA0_BYTES			(0x4 * 0xb00)
 #define LCD_VIDEO0_DMA0_STATE			(0x4 * 0xb01)
+#define LCD_DMA_STATE_ACTIVE			  (1 << 3)
 #define LCD_VIDEO0_DMA1_BYTES			(0x4 * 0xb02)
 #define LCD_VIDEO0_DMA1_STATE			(0x4 * 0xb03)
 #define LCD_VIDEO0_DMA2_BYTES			(0x4 * 0xb04)
@@ -730,4 +731,8 @@
 #define MSSCPU_CPR_CLK_EN			(0x0)
 #define MSSCPU_CPR_RST_EN			(0x10)
 #define BIT_MASK_16				(0xffff)
+/*icam lcd qos */
+#define LCD_QOS_PRORITY				(0x8)
+#define LCD_QOS_MODE				(0xC)
+#define LCD_QOS_BW				(0x10)
 #endif /* __KMB_REGS_H__ */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
