Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2E21FF18
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 22:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094606E9B5;
	Tue, 14 Jul 2020 20:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FDE6E9B2;
 Tue, 14 Jul 2020 20:58:28 +0000 (UTC)
IronPort-SDR: aVuWzVed8dAJsDYwy9GaXK65ZEKk9SalFyN7n0Ca6MGp0h1MuzoYjvG2qxJoz1lVZjpkSpuk2w
 VlvCJJlvrwDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="150444565"
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="150444565"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 13:58:28 -0700
IronPort-SDR: OTWQuzAJto+fubtddzQz/ToOz0drg2nks6//2ZZ/KG8i0I32QmEGN8n+zgIi4O/iYdNcDQE/bf
 sEtbL4AaL6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,352,1589266800"; d="scan'208";a="316504129"
Received: from ahanamuk-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.251.155.61])
 by orsmga008.jf.intel.com with ESMTP; 14 Jul 2020 13:58:27 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH v2 19/59] drm/kmb: Added ioremap/iounmap for register access
Date: Tue, 14 Jul 2020 13:57:05 -0700
Message-Id: <1594760265-11618-20-git-send-email-anitha.chrisanthus@intel.com>
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

Register physical addresses are remapped and the register mmio
addresses for lcd,mipi and msscam are saved in drm_private.
All register reads/writes are updated to get the mmio offset
from this structure. We are using hardcoded values for register
physical addresses and this will be modified to read from device
tree in the future.

v2: minor code review changes
v3: upclassed dev_private

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  |  59 +++---
 drivers/gpu/drm/kmb/kmb_drv.c   | 104 ++++++++---
 drivers/gpu/drm/kmb/kmb_drv.h   |  64 ++++---
 drivers/gpu/drm/kmb/kmb_dsi.c   | 401 +++++++++++++++++++++-------------------
 drivers/gpu/drm/kmb/kmb_plane.c |  35 ++--
 drivers/gpu/drm/kmb/kmb_regs.h  | 106 ++++++-----
 6 files changed, 441 insertions(+), 328 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 984f21a..5c1e858 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -31,21 +31,28 @@ static void kmb_crtc_cleanup(struct drm_crtc *crtc)
 
 static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	struct kmb_drm_private *dev_p = to_kmb(dev);
+
 	/*clear interrupt */
-	kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+	kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
 	/*set which interval to generate vertical interrupt */
-	kmb_write_lcd(LCD_VSTATUS_COMPARE, LCD_VSTATUS_COMPARE_VSYNC);
+	kmb_write_lcd(dev_p, LCD_VSTATUS_COMPARE,
+			LCD_VSTATUS_COMPARE_VSYNC);
 	/* enable vertical interrupt */
-	kmb_write_lcd(LCD_INT_ENABLE, LCD_INT_VERT_COMP);
+	kmb_write_lcd(dev_p, LCD_INT_ENABLE, LCD_INT_VERT_COMP);
 	return 0;
 }
 
 static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	struct kmb_drm_private *dev_p = to_kmb(dev);
+
 	/*clear interrupt */
-	kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+	kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
 	/* disable vertical interrupt */
-	kmb_write_lcd(LCD_INT_ENABLE, 0);
+	kmb_write_lcd(dev_p, LCD_INT_ENABLE, 0);
 
 /* TBD
  *  set the BIT2 (VERTICAL_COMPARE_INTERRUPT) of the LCD_INT_ENABLE register
@@ -68,10 +75,12 @@ static const struct drm_crtc_funcs kmb_crtc_funcs = {
 static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
 	struct drm_display_mode *m = &crtc->state->adjusted_mode;
+	struct drm_device *dev = crtc->dev;
 	struct videomode vm;
 	int vsync_start_offset;
 	int vsync_end_offset;
 	unsigned int ctrl = 0;
+	struct kmb_drm_private *dev_p = to_kmb(dev);
 
 	vm.vfront_porch = m->crtc_vsync_start - m->crtc_vdisplay;
 	vm.vback_porch = m->crtc_vtotal - m->crtc_vsync_end;
@@ -83,30 +92,38 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	vsync_start_offset = m->crtc_vsync_start - m->crtc_hsync_start;
 	vsync_end_offset = m->crtc_vsync_end - m->crtc_hsync_end;
 
-	kmb_write_lcd(LCD_V_ACTIVEHEIGHT, m->crtc_vdisplay - 1);
-	kmb_write_lcd(LCD_V_BACKPORCH, vm.vback_porch - 1);
-	kmb_write_lcd(LCD_V_FRONTPORCH, vm.vfront_porch - 1);
-	kmb_write_lcd(LCD_VSYNC_WIDTH, vm.vsync_len - 1);
-	kmb_write_lcd(LCD_H_ACTIVEWIDTH, m->crtc_hdisplay - 1);
-	kmb_write_lcd(LCD_H_BACKPORCH, vm.hback_porch - 1);
-	kmb_write_lcd(LCD_H_FRONTPORCH, vm.hfront_porch - 1);
-	kmb_write_lcd(LCD_HSYNC_WIDTH, vm.hsync_len - 1);
+	kmb_write_lcd(dev_p, LCD_V_ACTIVEHEIGHT,
+			m->crtc_vdisplay - 1);
+	kmb_write_lcd(dev_p, LCD_V_BACKPORCH, vm.vback_porch - 1);
+	kmb_write_lcd(dev_p, LCD_V_FRONTPORCH, vm.vfront_porch - 1);
+	kmb_write_lcd(dev_p, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
+	kmb_write_lcd(dev_p, LCD_H_ACTIVEWIDTH,
+			m->crtc_hdisplay - 1);
+	kmb_write_lcd(dev_p, LCD_H_BACKPORCH, vm.hback_porch - 1);
+	kmb_write_lcd(dev_p, LCD_H_FRONTPORCH, vm.hfront_porch - 1);
+	kmb_write_lcd(dev_p, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
 
 	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
-		kmb_write_lcd(LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
-		kmb_write_lcd(LCD_V_BACKPORCH_EVEN, vm.vback_porch - 1);
-		kmb_write_lcd(LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
-		kmb_write_lcd(LCD_V_ACTIVEHEIGHT_EVEN,	m->crtc_vdisplay - 1);
-		kmb_write_lcd(LCD_VSYNC_START_EVEN, vsync_start_offset);
-		kmb_write_lcd(LCD_VSYNC_END_EVEN, vsync_end_offset);
+		kmb_write_lcd(dev_p,
+				LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
+		kmb_write_lcd(dev_p,
+				LCD_V_BACKPORCH_EVEN, vm.vback_porch - 1);
+		kmb_write_lcd(dev_p,
+				LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
+		kmb_write_lcd(dev_p,
+				LCD_V_ACTIVEHEIGHT_EVEN, m->crtc_vdisplay - 1);
+		kmb_write_lcd(dev_p, LCD_VSYNC_START_EVEN,
+				vsync_start_offset);
+		kmb_write_lcd(dev_p, LCD_VSYNC_END_EVEN,
+				vsync_end_offset);
 	}
 	/* enable VL1 layer as default */
 	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE;
 	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
 		| LCD_CTRL_OUTPUT_ENABLED;
-	kmb_write_lcd(LCD_CONTROL, ctrl);
+	kmb_write_lcd(dev_p, LCD_CONTROL, ctrl);
 
-	kmb_write_lcd(LCD_TIMING_GEN_TRIG, ENABLE);
+	kmb_write_lcd(dev_p, LCD_TIMING_GEN_TRIG, ENABLE);
 
 	/* TBD */
 	/* set clocks here */
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 19f78ba..5192040 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -31,34 +31,68 @@
 
 static int kmb_load(struct drm_device *drm, unsigned long flags)
 {
-	struct kmb_drm_private *lcd = to_kmb(drm);
+	struct kmb_drm_private *dev_p = to_kmb(drm);
 	struct platform_device *pdev = to_platform_device(drm->dev);
-	struct resource *res;
-	/*u32 version; */
+	/*struct resource *res;*/
+	/*u32 version;*/
 	int ret;
 
 	/* TBD - not sure if clock_get needs to be called here */
 	/*
-	 *  lcd->clk = devm_clk_get(drm->dev, "pxlclk");
-	 * if (IS_ERR(lcd->clk))
-	 *  return PTR_ERR(lcd->clk);
+	 *dev_p->clk = devm_clk_get(drm->dev, "pxlclk");
+	 *if (IS_ERR(dev_p->clk))
+	 *	return PTR_ERR(dev_p->clk);
 	 */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lcd->mmio = devm_ioremap_resource(drm->dev, res);
-	if (IS_ERR(lcd->mmio)) {
-		DRM_ERROR("failed to map control registers area\n");
-		ret = PTR_ERR(lcd->mmio);
-		lcd->mmio = NULL;
-		return ret;
+	/*
+	 * TBD call this in the future when device tree is ready,
+	 * use hardcoded value for now
+	 */
+	/*res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	 *dev_p->lcd_mmio = devm_ioremap_resource(drm->dev, res);
+	 *
+	 *if (IS_ERR(dev_p->lcd_mmio)) {
+	 *	DRM_ERROR("failed to map control registers area\n");
+	 *	ret = PTR_ERR(dev_p->lcd_mmio);
+	 *	dev_p->lcd_mmio = NULL;
+	 *	return ret;
+	 *}
+	 */
+	 /* LCD mmio */
+	if (!request_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE, "kmb-lcd")) {
+		DRM_ERROR("failed to reserve LCD registers\n");
+		return -ENOMEM;
+	}
+	dev_p->lcd_mmio = ioremap_cache(LCD_BASE_ADDR, LCD_MMIO_SIZE);
+	if (!dev_p->lcd_mmio) {
+		DRM_ERROR("failed to map LCD registers\n");
+		return -ENOMEM;
+	}
+
+	/* Mipi mmio */
+	if (!request_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE, "kmb-mipi")) {
+		DRM_ERROR("failed to reserve MIPI registers\n");
+		iounmap(dev_p->lcd_mmio);
+		return -ENOMEM;
+	}
+	dev_p->mipi_mmio = ioremap_cache(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
+	if (!dev_p->mipi_mmio) {
+		DRM_ERROR("failed to map MIPI registers\n");
+		iounmap(dev_p->lcd_mmio);
+		return -ENOMEM;
 	}
-	/*TBD read and check for correct product version here */
+
+	/*this is only for MIPI_TX_MSS_LCD_MIPI_CFG register */
+	dev_p->msscam_mmio = ioremap_cache(MSS_CAM_BASE_ADDR,
+			MSS_CAM_MMIO_SIZE);
+
+/*TBD read and check for correct product version here */
 
 	/* Get the optional framebuffer memory resource */
 	ret = of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	spin_lock_init(&lcd->irq_lock);
+	spin_lock_init(&dev_p->irq_lock);
 	ret = kmb_setup_crtc(drm);
 	if (ret < 0) {
 		DRM_ERROR("failed to create crtc\n");
@@ -75,7 +109,7 @@ static int kmb_load(struct drm_device *drm, unsigned long flags)
 	return 0;
 
 irq_fail:
-	drm_crtc_cleanup(&lcd->crtc);
+	drm_crtc_cleanup(&dev_p->crtc);
 setup_fail:
 	of_reserved_mem_device_release(drm->dev);
 
@@ -102,19 +136,21 @@ static irqreturn_t kmb_irq(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
 	unsigned long status, val;
+	struct kmb_drm_private *dev_p = to_kmb(dev);
 
-	status = kmb_read_lcd(LCD_INT_STATUS);
+	status = kmb_read_lcd(dev_p, LCD_INT_STATUS);
 	if (status & LCD_INT_EOF) {
 		/*To DO - handle EOF interrupt? */
-		kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_EOF);
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR, LCD_INT_EOF);
 	}
 	if (status & LCD_INT_LINE_CMP) {
 		/* clear line compare interrupt */
-		kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_LINE_CMP);
+		kmb_write_lcd(dev_p, LCD_INT_CLEAR,
+				LCD_INT_LINE_CMP);
 	}
 	if (status & LCD_INT_VERT_COMP) {
 		/* read VSTATUS */
-		val = kmb_read_lcd(LCD_VSTATUS);
+		val = kmb_read_lcd(dev_p, LCD_VSTATUS);
 		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
 		switch (val) {
 		case LCD_VSTATUS_COMPARE_VSYNC:
@@ -122,7 +158,8 @@ static irqreturn_t kmb_irq(int irq, void *arg)
 		case LCD_VSTATUS_COMPARE_ACTIVE:
 		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
 			/* clear vertical compare interrupt */
-			kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+			kmb_write_lcd(dev_p, LCD_INT_CLEAR,
+					LCD_INT_VERT_COMP);
 			drm_handle_vblank(dev, 0);
 			break;
 		}
@@ -133,8 +170,8 @@ static irqreturn_t kmb_irq(int irq, void *arg)
 
 static void kmb_irq_reset(struct drm_device *drm)
 {
-	kmb_write_lcd(LCD_INT_CLEAR, 0xFFFF);
-	kmb_write_lcd(LCD_INT_ENABLE, 0);
+	kmb_write_lcd(drm->dev_private, LCD_INT_CLEAR, 0xFFFF);
+	kmb_write_lcd(drm->dev_private, LCD_INT_ENABLE, 0);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
@@ -244,19 +281,34 @@ static int kmb_drm_bind(struct device *dev)
 static void kmb_drm_unbind(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct kmb_drm_private *lcd = to_kmb(drm);
+	struct kmb_drm_private *dev_p = to_kmb(drm);
 
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	component_unbind_all(dev, drm);
-	of_node_put(lcd->crtc.port);
-	lcd->crtc.port = NULL;
+	of_node_put(dev_p->crtc.port);
+	dev_p->crtc.port = NULL;
 	pm_runtime_get_sync(drm->dev);
 	drm_irq_uninstall(drm);
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
+
+	if (dev_p->lcd_mmio) {
+		iounmap(dev_p->lcd_mmio);
+		release_mem_region(LCD_BASE_ADDR, LCD_MMIO_SIZE);
+	}
+
+	if (dev_p->mipi_mmio) {
+		iounmap(dev_p->mipi_mmio);
+		release_mem_region(MIPI_BASE_ADDR, MIPI_MMIO_SIZE);
+	}
+
+	if (dev_p->msscam_mmio)
+		iounmap(dev_p->msscam_mmio);
+
 	of_reserved_mem_device_release(drm->dev);
 	drm_mode_config_cleanup(drm);
+
 	drm_dev_put(drm);
 	drm->dev_private = NULL;
 	dev_set_drvdata(dev, NULL);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 14bdfc8..a56d548 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -13,7 +13,9 @@
 
 struct kmb_drm_private {
 	struct drm_device		drm;
-	void __iomem			*mmio;
+	void __iomem			*lcd_mmio;
+	void __iomem			*mipi_mmio;
+	void __iomem			*msscam_mmio;
 	unsigned char			n_layers;
 	struct clk			*clk;
 	struct drm_fbdev_cma		*fbdev;
@@ -65,65 +67,77 @@ static inline void kmb_write_bits(struct kmb_drm_private *lcd,
 }
 #endif
 
-static inline void kmb_write_lcd(unsigned int reg, u32 value)
+static inline void kmb_write_lcd(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 value)
 {
-	writel(value, (LCD_BASE_ADDR + reg));
+	writel(value, (dev_p->lcd_mmio + reg));
 }
 
-static inline void kmb_write_mipi(unsigned int reg, u32 value)
+static inline void kmb_write_mipi(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 value)
 {
-	writel(value, (MIPI_BASE_ADDR + reg));
+	writel(value, (dev_p->mipi_mmio + reg));
 }
 
-static inline u32 kmb_read_lcd(unsigned int reg)
+static inline void kmb_write_msscam(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 value)
 {
-	return readl(LCD_BASE_ADDR + reg);
+	writel(value, (dev_p->msscam_mmio + reg));
 }
 
-static inline u32 kmb_read_mipi(unsigned int reg)
+static inline u32 kmb_read_lcd(struct kmb_drm_private *dev_p, unsigned int reg)
 {
-	return readl(MIPI_BASE_ADDR + reg);
+	return readl(dev_p->lcd_mmio + reg);
 }
 
-static inline void kmb_write_bits_mipi(unsigned int reg, u32 offset,
-				       u32 num_bits, u32 value)
+static inline u32 kmb_read_mipi(struct kmb_drm_private *dev_p, unsigned int reg)
 {
-	u32 reg_val = kmb_read_mipi(reg);
+	return readl(dev_p->mipi_mmio + reg);
+}
+
+static inline void kmb_write_bits_mipi(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 offset, u32 num_bits, u32 value)
+{
+	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
 	u32 mask = (1 << num_bits) - 1;
 
 	value &= mask;
 	mask <<= offset;
 	reg_val &= (~mask);
 	reg_val |= (value << offset);
-	kmb_write_mipi(reg, reg_val);
+	kmb_write_mipi(dev_p->mipi_mmio, reg, reg_val);
 }
 
-static inline void kmb_set_bit_mipi(unsigned int reg, u32 offset)
+static inline void kmb_set_bit_mipi(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 offset)
 {
-	u32 reg_val = kmb_read_mipi(reg);
+	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
 
-	kmb_write_mipi(reg, reg_val | (1 << offset));
+	kmb_write_mipi(dev_p->mipi_mmio, reg, reg_val | (1 << offset));
 }
 
-static inline void kmb_clr_bit_mipi(unsigned int reg, u32 offset)
+static inline void kmb_clr_bit_mipi(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 offset)
 {
-	u32 reg_val = kmb_read_mipi(reg);
+	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
 
-	kmb_write_mipi(reg, reg_val & (~(1 << offset)));
+	kmb_write_mipi(dev_p->mipi_mmio, reg, reg_val & (~(1 << offset)));
 }
 
-static inline void kmb_set_bitmask_mipi(unsigned int reg, u32 mask)
+static inline void kmb_set_bitmask_mipi(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 mask)
 {
-	u32 reg_val = kmb_read_mipi(reg);
+	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
 
-	kmb_write_mipi(reg, (reg_val | mask));
+	kmb_write_mipi(dev_p->mipi_mmio, reg, (reg_val | mask));
 }
 
-static inline void kmb_clr_bitmask_mipi(unsigned int reg, u32 mask)
+static inline void kmb_clr_bitmask_mipi(struct kmb_drm_private *dev_p,
+		unsigned int reg, u32 mask)
 {
-	u32 reg_val = kmb_read_mipi(reg);
+	u32 reg_val = kmb_read_mipi(dev_p->mipi_mmio, reg);
 
-	kmb_write_mipi(reg, (reg_val & (~mask)));
+	kmb_write_mipi(dev_p->mipi_mmio, reg, (reg_val & (~mask)));
 }
 int kmb_setup_crtc(struct drm_device *dev);
 void kmb_set_scanout(struct kmb_drm_private *lcd);
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 47456b2..94c9adc 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -408,10 +408,10 @@ static u32 compute_unpacked_bytes(u32 wc, u8 bits_per_pclk)
 	return ((wc * 8) / bits_per_pclk) * 4;
 }
 
-static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_priv,
-				       u8 frame_id, u8 section,
-				       u32 height_lines, u32 unpacked_bytes,
-				       struct mipi_tx_frame_sect_phcfg *ph_cfg)
+static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_p,
+		u8 frame_id,
+		u8 section, u32 height_lines,
+		u32 unpacked_bytes, struct mipi_tx_frame_sect_phcfg *ph_cfg)
 {
 	u32 cfg = 0;
 	u32 ctrl_no = MIPI_CTRL6;
@@ -430,8 +430,8 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_priv,
 	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
 		<< MIPI_TX_SECT_DM_SHIFT);	/* bits [24:25] */
 	cfg |= MIPI_TX_SECT_DMA_PACKED;
-	kmb_write_mipi((MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
-						 section)), cfg);
+	kmb_write_mipi(dev_p, (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
+					section)), cfg);
 
 	/*unpacked bytes */
 	/*there are 4 frame generators and each fg has 4 sections
@@ -441,20 +441,20 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_priv,
 	 *REG_UNPACKED_BYTES1: [15:0]-BYTES2, [31:16]-BYTES3
 	 */
 	reg_adr = MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no, frame_id)
-	    + (section / 2) * 4;
-	kmb_write_bits_mipi(reg_adr, (section % 2) * 16, 16, unpacked_bytes);
+	+ (section/2)*4;
+	kmb_write_bits_mipi(dev_p, reg_adr, (section % 2)*16, 16,
+		unpacked_bytes);
 
 	/* line config */
 	reg_adr = MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id, section);
-	kmb_write_mipi(reg_adr, height_lines);
+	kmb_write_mipi(dev_p, reg_adr, height_lines);
 	return 0;
 }
 
-static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_priv,
-				  u8 frame_id,
-				  u8 section,
-				  struct mipi_tx_frame_section_cfg *frame_scfg,
-				  u32 *bits_per_pclk, u32 *wc)
+static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_p, u8 frame_id,
+		u8 section,
+		struct mipi_tx_frame_section_cfg *frame_scfg,
+		u32 *bits_per_pclk, u32 *wc)
 {
 	u32 ret = 0;
 	u32 unpacked_bytes;
@@ -487,18 +487,17 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_drm_private *dev_priv,
 	ph_cfg.data_type = frame_scfg->data_type;
 	ph_cfg.vchannel = frame_id;
 
-	mipi_tx_fg_section_cfg_regs(dev_priv, frame_id, section,
-				    frame_scfg->height_lines, unpacked_bytes,
-				    &ph_cfg);
+	mipi_tx_fg_section_cfg_regs(dev_p, frame_id, section,
+			frame_scfg->height_lines,
+			unpacked_bytes, &ph_cfg);
 
 	/*caller needs bits_per_clk for additional caluclations */
 	*bits_per_pclk = data_type_parameters.bits_per_pclk;
 	return 0;
 }
 
-static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
-				u8 frame_gen,
-				struct mipi_tx_frame_timing_cfg *fg_cfg)
+static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_p,
+		u8 frame_gen, struct mipi_tx_frame_timing_cfg *fg_cfg)
 {
 	u32 sysclk;
 	/*float ppl_llp_ratio; */
@@ -522,7 +521,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 
 	/*frame generator number of lines */
 	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, fg_cfg->v_active);
+	kmb_write_mipi(dev_p, reg_adr, fg_cfg->v_active);
 
 	/*vsync width */
 	/*
@@ -530,33 +529,36 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 	 *REG_VSYNC_WIDTH0: [15:0]-VSA for channel0, [31:16]-VSA for channel1
 	 *REG_VSYNC_WIDTH1: [15:0]-VSA for channel2, [31:16]-VSA for channel3
 	 */
-	offset = (frame_gen % 2) * 16;
-	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen / 2);
-	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->vsync_width);
+	offset = (frame_gen % 2)*16;
+	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen/2);
+	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->vsync_width);
 
-	/*v backporch - same register config like vsync width */
-	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen / 2);
-	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_backporch);
+	/*v backporch - same register config like vsync width*/
+	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen/2);
+	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->v_backporch);
 
-	/*v frontporch - same register config like vsync width */
-	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen / 2);
-	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_frontporch);
+	/*v frontporch - same register config like vsync width*/
+	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen/2);
+	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->v_frontporch);
 
-	/*v active - same register config like vsync width */
-	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen / 2);
-	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_active);
+	/*v active - same register config like vsync width*/
+	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen/2);
+	kmb_write_bits_mipi(dev_p, reg_adr, offset, 16, fg_cfg->v_active);
 
 	/*hsyc width */
 	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
+	kmb_write_mipi(dev_p, reg_adr,
+			(fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
 
 	/*h backporch */
 	reg_adr = MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
+	kmb_write_mipi(dev_p, reg_adr,
+			(fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
 
 	/*h frontporch */
 	reg_adr = MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
+	kmb_write_mipi(dev_p, reg_adr,
+			(fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
 
 	/*h active */
 	reg_adr = MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);
@@ -564,24 +566,25 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 	val = (fg_cfg->h_active * sysclk * 1000) /
 	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
 	val /= 1000;
-	kmb_write_mipi(reg_adr, val);
+	kmb_write_mipi(dev_p, reg_adr, val);
 
 	/* llp hsync width */
 	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp / 8));
+	kmb_write_mipi(dev_p, reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp / 8));
 
 	/* llp h backporch */
 	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
+	kmb_write_mipi(dev_p, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
 
 	/* llp h frontporch */
 	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
-	kmb_write_mipi(reg_adr, fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
+	kmb_write_mipi(dev_p, reg_adr,
+			fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
 }
 
-static void mipi_tx_fg_cfg(struct kmb_drm_private *dev_priv, u8 frame_gen,
-			   u8 active_lanes, u32 bpp, u32 wc,
-			   u32 lane_rate_mbps, struct mipi_tx_frame_cfg *fg_cfg)
+static void mipi_tx_fg_cfg(struct kmb_drm_private *dev_p, u8 frame_gen,
+		u8 active_lanes, u32 bpp, u32 wc,
+		u32 lane_rate_mbps, struct mipi_tx_frame_cfg *fg_cfg)
 {
 	u32 i, fg_num_lines = 0;
 	struct mipi_tx_frame_timing_cfg fg_t_cfg;
@@ -607,20 +610,21 @@ static void mipi_tx_fg_cfg(struct kmb_drm_private *dev_priv, u8 frame_gen,
 	fg_t_cfg.active_lanes = active_lanes;
 
 	/*apply frame generator timing setting */
-	mipi_tx_fg_cfg_regs(dev_priv, frame_gen, &fg_t_cfg);
+	mipi_tx_fg_cfg_regs(dev_p, frame_gen, &fg_t_cfg);
 }
 
-static void mipi_tx_multichannel_fifo_cfg(u8 active_lanes, u8 vchannel_id)
+static void mipi_tx_multichannel_fifo_cfg(struct kmb_drm_private *dev_p,
+		u8 active_lanes, u8 vchannel_id)
 {
 	u32 fifo_size, fifo_rthreshold;
 	u32 ctrl_no = MIPI_CTRL6;
 
-	/*clear all mc fifo channel sizes and thresholds */
-	kmb_write_mipi(MIPI_TX_HS_MC_FIFO_CTRL_EN, 0);
-	kmb_write_mipi(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0, 0);
-	kmb_write_mipi(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1, 0);
-	kmb_write_mipi(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0, 0);
-	kmb_write_mipi(MIPI_TX_HS_MC_FIFO_RTHRESHOLD1, 0);
+	/*clear all mc fifo channel sizes and thresholds*/
+	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_CTRL_EN, 0);
+	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0, 0);
+	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1, 0);
+	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_RTHRESHOLD0, 0);
+	kmb_write_mipi(dev_p, MIPI_TX_HS_MC_FIFO_RTHRESHOLD1, 0);
 
 	fifo_size = (active_lanes > MIPI_D_LANES_PER_DPHY) ?
 	    MIPI_CTRL_4LANE_MAX_MC_FIFO_LOC : MIPI_CTRL_2LANE_MAX_MC_FIFO_LOC;
@@ -629,17 +633,19 @@ static void mipi_tx_multichannel_fifo_cfg(u8 active_lanes, u8 vchannel_id)
 	 *REG_MC_FIFO_CHAN_ALLOC0: [8:0]-channel0, [24:16]-channel1
 	 *REG_MC_FIFO_CHAN_ALLOC1: [8:0]-2, [24:16]-channel3
 	 */
-	SET_MC_FIFO_CHAN_ALLOC(ctrl_no, vchannel_id, fifo_size);
+	SET_MC_FIFO_CHAN_ALLOC(dev_p, ctrl_no, vchannel_id, fifo_size);
 
 	/*set threshold to half the fifo size, actual size=size*16 */
 	fifo_rthreshold = ((fifo_size + 1) * 8) & BIT_MASK_16;
-	SET_MC_FIFO_RTHRESHOLD(ctrl_no, vchannel_id, fifo_rthreshold);
+	SET_MC_FIFO_RTHRESHOLD(dev_p, ctrl_no, vchannel_id, fifo_rthreshold);
 
 	/*enable the MC FIFO channel corresponding to the Virtual Channel */
-	kmb_set_bit_mipi(MIPI_TXm_HS_MC_FIFO_CTRL_EN(ctrl_no), vchannel_id);
+	kmb_set_bit_mipi(dev_p, MIPI_TXm_HS_MC_FIFO_CTRL_EN(ctrl_no),
+			vchannel_id);
 }
 
-static void mipi_tx_ctrl_cfg(u8 fg_id, struct mipi_ctrl_cfg *ctrl_cfg)
+static void mipi_tx_ctrl_cfg(struct kmb_drm_private *dev_p, u8 fg_id,
+		struct mipi_ctrl_cfg *ctrl_cfg)
 {
 	u32 sync_cfg = 0, ctrl = 0, fg_en;
 	u32 ctrl_no = MIPI_CTRL6;
@@ -684,12 +690,12 @@ static void mipi_tx_ctrl_cfg(u8 fg_id, struct mipi_ctrl_cfg *ctrl_cfg)
 	/*67 ns stop time */
 	ctrl |= HSEXIT_CNT(0x43);
 
-	kmb_write_mipi(MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);
-	kmb_write_mipi(MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
+	kmb_write_mipi(dev_p, MIPI_TXm_HS_SYNC_CFG(ctrl_no), sync_cfg);
+	kmb_write_mipi(dev_p, MIPI_TXm_HS_CTRL(ctrl_no), ctrl);
 }
 
-static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_priv,
-			      struct mipi_ctrl_cfg *ctrl_cfg)
+static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_p,
+		struct mipi_ctrl_cfg *ctrl_cfg)
 {
 	u32 ret;
 	u8 active_vchannels = 0;
@@ -719,40 +725,41 @@ static u32 mipi_tx_init_cntrl(struct kmb_drm_private *dev_priv,
 			    == NULL)
 				continue;
 
-			ret = mipi_tx_fg_section_cfg(dev_priv, frame_id, sect,
-						     ctrl_cfg->tx_ctrl_cfg.frames[frame_id]->sections[sect],
-						     &bits_per_pclk,
-						     &word_count);
+			ret = mipi_tx_fg_section_cfg(dev_p, frame_id, sect,
+					ctrl_cfg->tx_ctrl_cfg.frames[frame_id]->sections[sect],
+					&bits_per_pclk, &word_count);
 			if (ret)
 				return ret;
 
 		}
 
 		/* set frame specific parameters */
-		mipi_tx_fg_cfg(dev_priv, frame_id, ctrl_cfg->active_lanes,
-			       bits_per_pclk,
-			       word_count, ctrl_cfg->lane_rate_mbps,
-			       ctrl_cfg->tx_ctrl_cfg.frames[frame_id]);
+		mipi_tx_fg_cfg(dev_p, frame_id, ctrl_cfg->active_lanes,
+				bits_per_pclk,
+				word_count, ctrl_cfg->lane_rate_mbps,
+				ctrl_cfg->tx_ctrl_cfg.frames[frame_id]);
 
 		active_vchannels++;
 
 		/*connect lcd to mipi */
-		writel(1, MSS_CAM_BASE_ADDR + MIPI_TX_MSS_LCD_MIPI_CFG);
+		kmb_write_msscam(dev_p, MSS_CAM_BASE_ADDR +
+				MIPI_TX_MSS_LCD_MIPI_CFG, 1);
 
 		break;
 	}
 
 	if (active_vchannels == 0)
 		return -EINVAL;
-	/*Multi-Channel FIFO Configuration */
-	mipi_tx_multichannel_fifo_cfg(ctrl_cfg->active_lanes, frame_id);
+	/*Multi-Channel FIFO Configuration*/
+	mipi_tx_multichannel_fifo_cfg(dev_p, ctrl_cfg->active_lanes, frame_id);
 
 	/*Frame Generator Enable */
-	mipi_tx_ctrl_cfg(frame_id, ctrl_cfg);
+	mipi_tx_ctrl_cfg(dev_p, frame_id, ctrl_cfg);
 	return ret;
 }
 
-static void test_mode_send(u32 dphy_no, u32 test_code, u32 test_data)
+static void test_mode_send(struct kmb_drm_private *dev_p, u32 dphy_no,
+		u32 test_code, u32 test_data)
 {
 	/*send the test code first */
 	/*  Steps for code:
@@ -762,11 +769,11 @@ static void test_mode_send(u32 dphy_no, u32 test_code, u32 test_data)
 	 * - set testclk LOW
 	 * - set testen LOW
 	 */
-	SET_DPHY_TEST_CTRL1_CLK(dphy_no);
-	SET_TEST_DIN0_3(dphy_no, test_code);
-	SET_DPHY_TEST_CTRL1_EN(dphy_no);
-	CLR_DPHY_TEST_CTRL1_CLK(dphy_no);
-	CLR_DPHY_TEST_CTRL1_EN(dphy_no);
+	SET_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
+	SET_TEST_DIN0_3(dev_p, dphy_no, test_code);
+	SET_DPHY_TEST_CTRL1_EN(dev_p, dphy_no);
+	CLR_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
+	CLR_DPHY_TEST_CTRL1_EN(dev_p, dphy_no);
 
 	/*send the test data next */
 	/*  Steps for data:
@@ -775,38 +782,43 @@ static void test_mode_send(u32 dphy_no, u32 test_code, u32 test_data)
 	 * - set testdin with data
 	 * - set testclk HIGH
 	 */
-	CLR_DPHY_TEST_CTRL1_EN(dphy_no);
-	CLR_DPHY_TEST_CTRL1_CLK(dphy_no);
-	SET_TEST_DIN0_3(dphy_no, test_data);
-	SET_DPHY_TEST_CTRL1_CLK(dphy_no);
+	CLR_DPHY_TEST_CTRL1_EN(dev_p, dphy_no);
+	CLR_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
+	SET_TEST_DIN0_3(dev_p, dphy_no, test_data);
+	SET_DPHY_TEST_CTRL1_CLK(dev_p, dphy_no);
 }
 
-static inline void set_test_mode_src_osc_freq_target_low_bits(u32 dphy_no,
-							      u32 freq)
+static inline void
+	set_test_mode_src_osc_freq_target_low_bits(struct kmb_drm_private
+			*dev_p,	u32 dphy_no, u32 freq)
 {
 	/*typical rise/fall time=166,
 	 * refer Table 1207 databook,sr_osc_freq_target[7:0
 	 */
-	test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, (freq & 0x7f));
+	test_mode_send(dev_p, dphy_no,
+			TEST_CODE_SLEW_RATE_DDL_CYCLES, (freq & 0x7f));
 }
 
-static inline void set_test_mode_slew_rate_calib_en(u32 dphy_no)
+static inline void
+	set_test_mode_slew_rate_calib_en(struct kmb_drm_private *dev_p,
+			u32 dphy_no)
 {
 	/*do not bypass slew rate calibration algorithm */
-	/*bits[1:0}=srcal_en_ovr_en, srcal_en_ovr, bit[6]=sr_range */
-	test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_OVERRIDE_CTRL,
-		       (0x03 | (1 << 6)));
+	/*bits[1:0}=srcal_en_ovr_en, srcal_en_ovr, bit[6]=sr_range*/
+	test_mode_send(dev_p, dphy_no, TEST_CODE_SLEW_RATE_OVERRIDE_CTRL,
+		(0x03 | (1 << 6)));
 }
 
-static inline void set_test_mode_src_osc_freq_target_hi_bits(u32 dphy_no,
-							     u32 freq)
+static inline void
+	set_test_mode_src_osc_freq_target_hi_bits(struct kmb_drm_private *dev_p,
+		u32 dphy_no, u32 freq)
 {
 	u32 data;
 	/*typical rise/fall time=166, refer Table 1207 databook,
 	 * sr_osc_freq_target[11:7
 	 */
-	data = ((freq >> 6) & 0x1f) | (1 << 7);	/*flag this as high nibble */
-	test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
+	data = ((freq >> 6) & 0x1f) | (1 << 7); /*flag this as high nibble */
+	test_mode_send(dev_p, dphy_no, TEST_CODE_SLEW_RATE_DDL_CYCLES, data);
 }
 
 struct vco_params {
@@ -841,7 +853,8 @@ static void mipi_tx_get_vco_params(struct vco_params *vco)
 	WARN_ONCE(1, "Invalid vco freq = %u for PLL setup\n", vco->freq);
 }
 
-static void mipi_tx_pll_setup(u32 dphy_no, u32 ref_clk_mhz, u32 target_freq_mhz)
+static void mipi_tx_pll_setup(struct kmb_drm_private *dev_p, u32 dphy_no,
+		u32 ref_clk_mhz, u32 target_freq_mhz)
 {
 	/* pll_ref_clk: - valid range: 2~64 MHz; Typically 24 MHz
 	 * Fvco: - valid range: 320~1250 MHz (Gen3 D-PHY)
@@ -903,64 +916,66 @@ static void mipi_tx_pll_setup(u32 dphy_no, u32 ref_clk_mhz, u32 target_freq_mhz)
 	 *PLL_VCO_Control[5:0] = pll_vco_cntrl_ovr,
 	 * PLL_VCO_Control[6]   = pll_vco_cntrl_ovr_en
 	 */
-	test_mode_send(dphy_no, TEST_CODE_PLL_VCO_CTRL, (vco_p.range
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_VCO_CTRL, (vco_p.range
 			| (1 << 6)));
 
 	/*Program m, n pll parameters */
 
 	/*PLL_Input_Divider_Ratio[3:0] = pll_n_ovr */
-	test_mode_send(dphy_no, TEST_CODE_PLL_INPUT_DIVIDER, (best_n & 0x0f));
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_INPUT_DIVIDER,
+			(best_n & 0x0f));
 
 	/* m - low nibble PLL_Loop_Divider_Ratio[4:0] = pll_m_ovr[4:0] */
-	test_mode_send(dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
 			(best_m & 0x1f));
 
 	/*m -high nibble PLL_Loop_Divider_Ratio[4:0] = pll_m_ovr[9:5] */
-	test_mode_send(dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_FEEDBACK_DIVIDER,
 			((best_m >> 5) & 0x1f) | PLL_FEEDBACK_DIVIDER_HIGH);
 
 	/*enable overwrite of n,m parameters :pll_n_ovr_en, pll_m_ovr_en*/
-	test_mode_send(dphy_no, TEST_CODE_PLL_OUTPUT_CLK_SEL,
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_OUTPUT_CLK_SEL,
 			(PLL_N_OVR_EN | PLL_M_OVR_EN));
 
 	/*Program Charge-Pump parameters */
 
 	/*pll_prop_cntrl-fixed values for prop_cntrl from DPHY doc */
 	t_freq = target_freq_mhz * vco_p.divider;
-	test_mode_send(dphy_no, TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL,
+	test_mode_send(dev_p, dphy_no,
+			TEST_CODE_PLL_PROPORTIONAL_CHARGE_PUMP_CTRL,
 			((t_freq > 1150) ? 0x0C : 0x0B));
 
 	/*pll_int_cntrl-fixed value for int_cntrl from DPHY doc */
-	test_mode_send(dphy_no, TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL,
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_INTEGRAL_CHARGE_PUMP_CTRL,
 			0x00);
 
 	/*pll_gmp_cntrl-fixed value for gmp_cntrl from DPHY doci */
-	test_mode_send(dphy_no, TEST_CODE_PLL_GMP_CTRL, 0x10);
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_GMP_CTRL, 0x10);
 
 	/*pll_cpbias_cntrl-fixed value for cpbias_cntrl from DPHY doc */
-	test_mode_send(dphy_no, TEST_CODE_PLL_CHARGE_PUMP_BIAS, 0x10);
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_CHARGE_PUMP_BIAS, 0x10);
 
 	/*PLL Lock Configuration */
 
 	/*pll_th1 -Lock Detector Phase error threshold,
 	 * document gives fixed value
 	 */
-	test_mode_send(dphy_no, TEST_CODE_PLL_PHASE_ERR_CTRL, 0x02);
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_PHASE_ERR_CTRL, 0x02);
 
 	/*pll_th2 - Lock Filter length, document gives fixed value */
-	test_mode_send(dphy_no, TEST_CODE_PLL_LOCK_FILTER, 0x60);
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_LOCK_FILTER, 0x60);
 
 	/*pll_th3- PLL Unlocking filter, document gives fixed value */
-	test_mode_send(dphy_no, TEST_CODE_PLL_UNLOCK_FILTER, 0x03);
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_UNLOCK_FILTER, 0x03);
 
 	/*pll_lock_sel-PLL Lock Detector Selection, document gives
 	 * fixed value
 	 */
-	test_mode_send(dphy_no, TEST_CODE_PLL_LOCK_DETECTOR, 0x02);
+	test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_LOCK_DETECTOR, 0x02);
 }
 
-static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
-		enum dphy_mode mode)
+static void dphy_init_sequence(struct kmb_drm_private *dev_p,
+		struct mipi_ctrl_cfg *cfg, u32 dphy_no, enum dphy_mode mode)
 {
 	u32 test_code = 0;
 	u32 test_data = 0, val;
@@ -968,17 +983,16 @@ static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
 
 	/*Set D-PHY in shutdown mode */
 	/*assert RSTZ signal */
-	CLR_DPHY_INIT_CTRL0(dphy_no, RESETZ);
-	/* assert SHUTDOWNZ signal */
-	CLR_DPHY_INIT_CTRL0(dphy_no, SHUTDOWNZ);
-
+	CLR_DPHY_INIT_CTRL0(dev_p, dphy_no, RESETZ);
+	/* assert SHUTDOWNZ signal*/
+	CLR_DPHY_INIT_CTRL0(dev_p, dphy_no, SHUTDOWNZ);
 	/*Init D-PHY_n */
 	/*Pulse testclear signal to make sure the d-phy configuration starts
 	 * from a clean base
 	 */
-	SET_DPHY_TEST_CTRL0(dphy_no);
-	/*TODO may need to add 15ns delay here */
-	CLR_DPHY_TEST_CTRL0(dphy_no);
+	SET_DPHY_TEST_CTRL0(dev_p, dphy_no);
+	/*TODO may need to add 15ns delay here*/
+	CLR_DPHY_TEST_CTRL0(dev_p, dphy_no);
 
 	/*Set mastermacro bit - Master or slave mode */
 	test_code = TEST_CODE_MULTIPLE_PHY_CTRL;
@@ -989,18 +1003,18 @@ static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
 		test_data = 0x00;
 
 	/*send the test code and data */
-	test_mode_send(dphy_no, test_code, test_data);
+	test_mode_send(dev_p, dphy_no, test_code, test_data);
 
 	/*Set the lane data rate */
 	for (i = 0; i < MIPI_DPHY_DEFAULT_BIT_RATES; i++) {
 		if (mipi_hs_freq_range[i].default_bit_rate_mbps <
 		    cfg->lane_rate_mbps)
 			continue;
-		/* send the test code and data */
-		/*bit[6:0] = hsfreqrange_ovr bit[7] = hsfreqrange_ovr_en */
-		test_mode_send(dphy_no, TEST_CODE_HS_FREQ_RANGE_CFG,
-			       (mipi_hs_freq_range[i].hsfreqrange_code
-				& 0x7f) | (1 << 7));
+		/* send the test code and data*/
+		/*bit[6:0] = hsfreqrange_ovr bit[7] = hsfreqrange_ovr_en*/
+		test_mode_send(dev_p, dphy_no, TEST_CODE_HS_FREQ_RANGE_CFG,
+				(mipi_hs_freq_range[i].hsfreqrange_code
+				 & 0x7f) | (1 << 7));
 		break;
 	}
 	/*
@@ -1009,30 +1023,32 @@ static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
 	 */
 	if (cfg->lane_rate_mbps > 1500) {
 		/*bypass slew rate calibration algorithm */
-		/*bits[1:0} srcal_en_ovr_en, srcal_en_ovr */
-		test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_OVERRIDE_CTRL,
-			       0x02);
+		/*bits[1:0} srcal_en_ovr_en, srcal_en_ovr*/
+		test_mode_send(dev_p, dphy_no,
+			TEST_CODE_SLEW_RATE_OVERRIDE_CTRL, 0x02);
 
-		/* disable slew rate calibration */
-		test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL,
-			       0x00);
+		/* disable slew rate calibration*/
+		test_mode_send(dev_p, dphy_no,
+			TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL, 0x00);
 	} else if (cfg->lane_rate_mbps > 1000) {
 		/*BitRate: > 1 Gbps && <= 1.5 Gbps: - slew rate control ON
 		 * typical rise/fall times: 166 ps
 		 */
 
 		/*do not bypass slew rate calibration algorithm */
-		set_test_mode_slew_rate_calib_en(dphy_no);
+		set_test_mode_slew_rate_calib_en(dev_p, dphy_no);
 
-		/* enable slew rate calibration */
-		test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL,
-			       0x01);
+		/* enable slew rate calibration*/
+		test_mode_send(dev_p, dphy_no,
+			TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL, 0x01);
 
 		/*set sr_osc_freq_target[6:0] */
-		/*typical rise/fall time=166, refer Table 1207 databook */
-		set_test_mode_src_osc_freq_target_low_bits(dphy_no, 0x72f);
+		/*typical rise/fall time=166, refer Table 1207 databook*/
+		set_test_mode_src_osc_freq_target_low_bits(dev_p,
+			dphy_no, 0x72f);
 		/*set sr_osc_freq_target[11:7] */
-		set_test_mode_src_osc_freq_target_hi_bits(dphy_no, 0x72f);
+		set_test_mode_src_osc_freq_target_hi_bits(dev_p, dphy_no,
+				0x72f);
 	} else {
 		/*lane_rate_mbps <= 1000 Mbps */
 		/*BitRate:  <= 1 Gbps:
@@ -1040,42 +1056,45 @@ static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
 		 * - typical rise/fall times: 225 ps
 		 */
 		/*do not bypass slew rate calibration algorithm */
-		set_test_mode_slew_rate_calib_en(dphy_no);
-		/* enable slew rate calibration */
-		test_mode_send(dphy_no, TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL,
-			       0x01);
-
-		/*typical rise/fall time=255, refer Table 1207 databook */
-		set_test_mode_src_osc_freq_target_low_bits(dphy_no, 0x523);
+		set_test_mode_slew_rate_calib_en(dev_p, dphy_no);
+		/* enable slew rate calibration*/
+		test_mode_send(dev_p, dphy_no,
+			TEST_CODE_SLEW_RATE_DDL_LOOP_CTRL, 0x01);
+
+		/*typical rise/fall time=255, refer Table 1207 databook*/
+		set_test_mode_src_osc_freq_target_low_bits(dev_p,
+			dphy_no, 0x523);
 		/*set sr_osc_freq_target[11:7] */
-		set_test_mode_src_osc_freq_target_hi_bits(dphy_no, 0x523);
+		set_test_mode_src_osc_freq_target_hi_bits(dev_p, dphy_no,
+				0x523);
 	}
 
 	/*Set cfgclkfreqrange */
-	val = (((cfg->cfg_clk_khz / 1000) - 17) * 4) & 0x3f;
-	SET_DPHY_FREQ_CTRL0_3(dphy_no, val);
+	val = (((cfg->cfg_clk_khz/1000) - 17) * 4) & 0x3f;
+	SET_DPHY_FREQ_CTRL0_3(dev_p, dphy_no, val);
 
 	/*Enable config clk for the corresponding d-phy */
-	kmb_set_bit_mipi(DPHY_CFG_CLK_EN, dphy_no);
+	kmb_set_bit_mipi(dev_p, DPHY_CFG_CLK_EN, dphy_no);
 
 	/* PLL setup */
 	if (mode == MIPI_DPHY_MASTER) {
 		/*Set PLL regulator in bypass */
-		test_mode_send(dphy_no, TEST_CODE_PLL_ANALOG_PROG, 0x01);
+		test_mode_send(dev_p, dphy_no, TEST_CODE_PLL_ANALOG_PROG, 0x01);
 
 		/* PLL Parameters Setup */
-		mipi_tx_pll_setup(dphy_no, cfg->ref_clk_khz/1000,
+		mipi_tx_pll_setup(dev_p, dphy_no, cfg->ref_clk_khz/1000,
 				cfg->lane_rate_mbps/2);
 
 		/*Set clksel */
-		kmb_write_bits_mipi(DPHY_INIT_CTRL1, PLL_CLKSEL_0, 2, 0x01);
+		kmb_write_bits_mipi(dev_p, DPHY_INIT_CTRL1, PLL_CLKSEL_0, 2,
+			0x01);
 
 		/*Set pll_shadow_control */
-		kmb_set_bit_mipi(DPHY_INIT_CTRL1, PLL_SHADOW_CTRL);
+		kmb_set_bit_mipi(dev_p, DPHY_INIT_CTRL1, PLL_SHADOW_CTRL);
 	}
 
 	/*Send NORMAL OPERATION test code */
-	test_mode_send(dphy_no, 0x00, 0x00);
+	test_mode_send(dev_p, dphy_no, 0x00, 0x00);
 
 	/* Configure BASEDIR for data lanes
 	 * NOTE: basedir only applies to LANE_0 of each D-PHY.
@@ -1084,61 +1103,64 @@ static void dphy_init_sequence(struct mipi_ctrl_cfg *cfg, u32 dphy_no,
 	 * bits[5:0]  - BaseDir: 1 = Rx
 	 * bits[9:6] - BaseDir: 0 = Tx
 	 */
-	kmb_clr_bit_mipi(DPHY_INIT_CTRL2, dphy_no);
+	kmb_clr_bit_mipi(dev_p, DPHY_INIT_CTRL2, dphy_no);
 
 	/* Enable CLOCK LANE - */
 	/*clock lane should be enabled regardless of the direction set for
 	 * the D-PHY (Rx/Tx)
 	 */
-	kmb_clr_bit_mipi(DPHY_INIT_CTRL2, 12 + dphy_no);
+	kmb_clr_bit_mipi(dev_p, DPHY_INIT_CTRL2, 12 + dphy_no);
 
 	/* enable DATA LANES */
-	kmb_write_bits_mipi(DPHY_ENABLE, dphy_no * 2, 2,
+	kmb_write_bits_mipi(dev_p, DPHY_ENABLE, dphy_no * 2, 2,
 			((1 << cfg->active_lanes) - 1));
 
 	/*Take D-PHY out of shutdown mode */
 	/* deassert SHUTDOWNZ signal*/
-	SET_DPHY_INIT_CTRL0(dphy_no, SHUTDOWNZ);
+	SET_DPHY_INIT_CTRL0(dev_p, dphy_no, SHUTDOWNZ);
 	/*deassert RSTZ signal */
-	SET_DPHY_INIT_CTRL0(dphy_no, RESETZ);
+	SET_DPHY_INIT_CTRL0(dev_p, dphy_no, RESETZ);
 }
 
-static void dphy_wait_fsm(u32 dphy_no, enum dphy_tx_fsm fsm_state)
+static void dphy_wait_fsm(struct kmb_drm_private *dev_p, u32 dphy_no,
+		enum dphy_tx_fsm fsm_state)
 {
 	enum dphy_tx_fsm val = DPHY_TX_POWERDWN;
 
 	do {
-		test_mode_send(dphy_no, TEST_CODE_FSM_CONTROL, 0x80);
+		test_mode_send(dev_p, dphy_no, TEST_CODE_FSM_CONTROL, 0x80);
 		/*TODO-need to add a time out and return failure */
-		val = GET_TEST_DOUT0_3(dphy_no);
+		val = GET_TEST_DOUT0_3(dev_p, dphy_no);
 	} while (val != fsm_state);
 
 }
 
-static u32 wait_init_done(u32 dphy_no, u32 active_lanes)
+static u32 wait_init_done(struct kmb_drm_private *dev_p, u32 dphy_no,
+		u32 active_lanes)
 {
 	u32 stopstatedata = 0;
 	u32 data_lanes = (1 << active_lanes) - 1;
 
 	do {
-		stopstatedata = GET_STOPSTATE_DATA(dphy_no);
+		stopstatedata = GET_STOPSTATE_DATA(dev_p, dphy_no);
 		/*TODO-need to add a time out and return failure */
 	} while (stopstatedata != data_lanes);
 
 	return 0;
 }
 
-static u32 wait_pll_lock(u32 dphy_no)
+static u32 wait_pll_lock(struct kmb_drm_private *dev_p, u32 dphy_no)
 {
 	do {
 		;
 		/*TODO-need to add a time out and return failure */
-	} while (!GET_PLL_LOCK(dphy_no));
+	} while (!GET_PLL_LOCK(dev_p, dphy_no));
 
 	return 0;
 }
 
-static u32 mipi_tx_init_dphy(struct mipi_ctrl_cfg *cfg)
+static u32 mipi_tx_init_dphy(struct kmb_drm_private *dev_p,
+		struct mipi_ctrl_cfg *cfg)
 {
 	u32 dphy_no = MIPI_DPHY6;
 
@@ -1160,28 +1182,28 @@ static u32 mipi_tx_init_dphy(struct mipi_ctrl_cfg *cfg)
 		 *f. poll for PHY1 stopstate
 		 */
 		/*PHY #N+1 ('slave') */
-		dphy_init_sequence(cfg, dphy_no + 1, MIPI_DPHY_SLAVE);
+		dphy_init_sequence(dev_p, cfg, dphy_no + 1, MIPI_DPHY_SLAVE);
 
-		dphy_wait_fsm(dphy_no + 1, DPHY_TX_LOCK);
+		dphy_wait_fsm(dev_p, dphy_no + 1, DPHY_TX_LOCK);
 
 		/*PHY #N master*/
-		dphy_init_sequence(cfg, dphy_no, MIPI_DPHY_MASTER);
+		dphy_init_sequence(dev_p, cfg, dphy_no, MIPI_DPHY_MASTER);
 		/* wait for DPHY init to complete */
-		wait_init_done(dphy_no, MIPI_DPHY_D_LANES);
-		wait_init_done(dphy_no + 1,
+		wait_init_done(dev_p, dphy_no, MIPI_DPHY_D_LANES);
+		wait_init_done(dev_p, dphy_no + 1,
 				cfg->active_lanes - MIPI_DPHY_D_LANES);
-		wait_pll_lock(dphy_no);
-		wait_pll_lock(dphy_no + 1);
+		wait_pll_lock(dev_p, dphy_no);
+		wait_pll_lock(dev_p, dphy_no + 1);
 	} else {	/* Single DPHY */
-		dphy_init_sequence(cfg, dphy_no, MIPI_DPHY_MASTER);
-		wait_init_done(dphy_no, cfg->active_lanes);
-		wait_pll_lock(dphy_no);
+		dphy_init_sequence(dev_p, cfg, dphy_no, MIPI_DPHY_MASTER);
+		wait_init_done(dev_p, dphy_no, cfg->active_lanes);
+		wait_pll_lock(dev_p, dphy_no);
 	}
 	return 0;
 }
 
-static void mipi_tx_init_irqs(union mipi_irq_cfg *cfg,
-	struct kmb_drm_private *dev_priv,
+static void mipi_tx_init_irqs(struct kmb_drm_private *dev_p,
+	union mipi_irq_cfg *cfg,
 	struct	mipi_tx_ctrl_cfg *tx_ctrl_cfg)
 {
 	unsigned long irqflags;
@@ -1189,32 +1211,33 @@ static void mipi_tx_init_irqs(union mipi_irq_cfg *cfg,
 
 	/* clear all interrupts first */
 	/*local interrupts */
-	SET_MIPI_TX_HS_IRQ_CLEAR(MIPI_CTRL6, MIPI_TX_HS_IRQ_ALL);
+	SET_MIPI_TX_HS_IRQ_CLEAR(dev_p, MIPI_CTRL6, MIPI_TX_HS_IRQ_ALL);
 	/*global interrupts */
-	SET_MIPI_CTRL_IRQ_CLEAR0(MIPI_CTRL6, MIPI_HS_IRQ);
-	SET_MIPI_CTRL_IRQ_CLEAR0(MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
-	SET_MIPI_CTRL_IRQ_CLEAR1(MIPI_CTRL6, MIPI_HS_RX_EVENT_IRQ);
+	SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6, MIPI_HS_IRQ);
+	SET_MIPI_CTRL_IRQ_CLEAR0(dev_p, MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
+	SET_MIPI_CTRL_IRQ_CLEAR1(dev_p, MIPI_CTRL6, MIPI_HS_RX_EVENT_IRQ);
 
 	/*enable interrupts */
-	spin_lock_irqsave(&dev_priv->irq_lock, irqflags);
+	spin_lock_irqsave(&dev_p->irq_lock, irqflags);
 	for (vc = 0; vc < MIPI_CTRL_VIRTUAL_CHANNELS; vc++) {
 		if (tx_ctrl_cfg->frames[vc] == NULL)
 			continue;
 		/*enable FRAME_DONE interrupt if VC is configured */
-		SET_HS_IRQ_ENABLE(MIPI_CTRL6,
+		SET_HS_IRQ_ENABLE(dev_p, MIPI_CTRL6,
 				MIPI_TX_HS_IRQ_FRAME_DONE_0 << vc);
 		break; /*only one vc for LCD interface */
 	}
 
 	/*enable user enabled interrupts */
 	if (cfg->irq_cfg.dphy_error)
-		SET_MIPI_CTRL_IRQ_ENABLE0(MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
+		SET_MIPI_CTRL_IRQ_ENABLE0(dev_p, MIPI_CTRL6, MIPI_DHY_ERR_IRQ);
 	if (cfg->irq_cfg.line_compare)
-		SET_HS_IRQ_ENABLE(MIPI_CTRL6, MIPI_TX_HS_IRQ_LINE_COMPARE);
+		SET_HS_IRQ_ENABLE(dev_p, MIPI_CTRL6,
+				MIPI_TX_HS_IRQ_LINE_COMPARE);
 	if (cfg->irq_cfg.ctrl_error)
-		SET_HS_IRQ_ENABLE(MIPI_CTRL6, MIPI_TX_HS_IRQ_ERROR);
+		SET_HS_IRQ_ENABLE(dev_p, MIPI_CTRL6, MIPI_TX_HS_IRQ_ERROR);
 
-	spin_unlock_irqrestore(&dev_priv->irq_lock, irqflags);
+	spin_unlock_irqrestore(&dev_p->irq_lock, irqflags);
 }
 
 void kmb_dsi_init(struct drm_device *dev)
@@ -1224,7 +1247,7 @@ void kmb_dsi_init(struct drm_device *dev)
 	struct kmb_connector *kmb_connector;
 	struct drm_connector *connector;
 	struct kmb_dsi_host *host;
-	struct kmb_drm_private *dev_priv = dev->dev_private;
+	struct kmb_drm_private *dev_p = dev->dev_private;
 
 	kmb_dsi = kzalloc(sizeof(*kmb_dsi), GFP_KERNEL);
 	if (!kmb_dsi)
@@ -1258,11 +1281,11 @@ void kmb_dsi_init(struct drm_device *dev)
 	drm_connector_attach_encoder(connector, encoder);
 
 	/* initialize mipi controller */
-	mipi_tx_init_cntrl(dev_priv, &mipi_tx_init_cfg);
+	mipi_tx_init_cntrl(dev_p, &mipi_tx_init_cfg);
 
 	/*d-phy initialization */
-	mipi_tx_init_dphy(&mipi_tx_init_cfg);
+	mipi_tx_init_dphy(dev_p, &mipi_tx_init_cfg);
 
 	/* irq initialization */
-	mipi_tx_init_irqs(&int_cfg, dev_priv, &mipi_tx_init_cfg.tx_ctrl_cfg);
+	mipi_tx_init_irqs(dev_p, &int_cfg, &mipi_tx_init_cfg.tx_ctrl_cfg);
 }
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 420f169..946349a 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -201,7 +201,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = plane->state->fb;
-	struct kmb_drm_private *lcd;
+	struct kmb_drm_private *dev_p;
 	dma_addr_t addr;
 	unsigned int width;
 	unsigned int height;
@@ -215,23 +215,23 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	if (!fb)
 		return;
 
-	lcd = to_kmb(plane->dev);
+	dev_p = to_kmb(plane->dev);
 
 	src_w = plane->state->src_w >> 16;
 	src_h = plane->state->src_h >> 16;
 	crtc_x = plane->state->crtc_x;
 	crtc_y = plane->state->crtc_y;
 
-	kmb_write_lcd(LCD_LAYERn_WIDTH(plane_id), src_w-1);
-	kmb_write_lcd(LCD_LAYERn_HEIGHT(plane_id), src_h-1);
-	kmb_write_lcd(LCD_LAYERn_COL_START(plane_id), crtc_x);
-	kmb_write_lcd(LCD_LAYERn_ROW_START(plane_id), crtc_y);
+	kmb_write_lcd(dev_p, LCD_LAYERn_WIDTH(plane_id), src_w-1);
+	kmb_write_lcd(dev_p, LCD_LAYERn_HEIGHT(plane_id), src_h-1);
+	kmb_write_lcd(dev_p, LCD_LAYERn_COL_START(plane_id), crtc_x);
+	kmb_write_lcd(dev_p, LCD_LAYERn_ROW_START(plane_id), crtc_y);
 
 	val = set_pixel_format(fb->format->format);
 	val |= set_bits_per_pixel(fb->format);
 	/*CHECKME Leon drvr sets it to 50 try this for now */
 	val |= LCD_LAYER_FIFO_50;
-	kmb_write_lcd(LCD_LAYERn_CFG(plane_id), val);
+	kmb_write_lcd(dev_p, LCD_LAYERn_CFG(plane_id), val);
 
 	switch (plane_id) {
 	case LAYER_0:
@@ -251,7 +251,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	ctrl |= LCD_CTRL_ENABLE;
 	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
 		| LCD_CTRL_OUTPUT_ENABLED;
-	kmb_write_lcd(LCD_CONTROL, ctrl);
+	kmb_write_lcd(dev_p, LCD_CONTROL, ctrl);
 
 	/*TBD check visible? */
 
@@ -260,24 +260,25 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	    | LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_1;
 
 	/* disable DMA first */
-	kmb_write_lcd(LCD_LAYERn_DMA_CFG(plane_id), ~LCD_DMA_LAYER_ENABLE);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id),
+			~LCD_DMA_LAYER_ENABLE);
 
 	addr = drm_fb_cma_get_gem_addr(fb, plane->state, plane_id);
-	kmb_write_lcd(LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
-	kmb_write_lcd(LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
 
 	width = fb->width;
 	height = fb->height;
 	dma_len = width * height * fb->format->cpp[plane_id];
-	kmb_write_lcd(LCD_LAYERn_DMA_LEN(plane_id), dma_len);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
 
-	kmb_write_lcd(LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
-			fb->pitches[plane_id]);
-	kmb_write_lcd(LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
+		fb->pitches[plane_id]);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
 			(width*fb->format->cpp[plane_id]));
 
 	/* enable DMA */
-	kmb_write_lcd(LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
+	kmb_write_lcd(dev_p, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
 
 	/* FIXME no doc on how to set output format - may need to change
 	 * this later
@@ -290,7 +291,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	out_format |= LCD_OUTF_MIPI_RGB_MODE;
 	/* pixel format from LCD_LAYER_CFG */
 	out_format |= ((val >> 9) & 0x1F);
-	kmb_write_lcd(LCD_OUT_FORMAT_CFG, out_format);
+	kmb_write_lcd(dev_p, LCD_OUT_FORMAT_CFG, out_format);
 }
 
 static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 5d08ee4..294bae0 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -9,10 +9,13 @@
 #define ENABLE					 1
 #define DISABLE					 0
 /*from Data Book section 12.5.8.1 page 4322 */
-#define MIPI_BASE_ADDR                          (void *)(0x20900000)
+#define MIPI_BASE_ADDR                          (0x20900000)
 /*from Data Book section 12.11.6.1 page 4972 */
-#define LCD_BASE_ADDR                           (void *)(0x20930000)
+#define LCD_BASE_ADDR                           (0x20930000)
 #define MSS_CAM_BASE_ADDR			(MIPI_BASE_ADDR + 0x10000)
+#define LCD_MMIO_SIZE				(0x10000)
+#define MIPI_MMIO_SIZE				(0x10000)
+#define MSS_CAM_MMIO_SIZE			(0x10000)
 
 /***************************************************************************
  *		   LCD controller control register defines
@@ -487,18 +490,19 @@
 #define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0		(0x198)
 #define MIPI_TX_HS_MC_FIFO_CHAN_ALLOC1		(0x19c)
 #define   MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(M, N)	\
-				(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 + HS_OFFSET(M) \
-				+ (0x4*N))
-#define   SET_MC_FIFO_CHAN_ALLOC(ctrl, vc, sz)	\
-		kmb_write_bits_mipi(MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
-					vc/2), (vc % 2)*16, 16, sz)
+			(MIPI_TX_HS_MC_FIFO_CHAN_ALLOC0 + HS_OFFSET(M) \
+			+ (0x4*N))
+#define   SET_MC_FIFO_CHAN_ALLOC(dev, ctrl, vc, sz)	\
+		kmb_write_bits_mipi(dev, \
+				MIPI_TXm_HS_MC_FIFO_CHAN_ALLOCn(ctrl, \
+				vc/2), (vc % 2)*16, 16, sz)
 #define MIPI_TX_HS_MC_FIFO_RTHRESHOLD0		(0x1a0)
 #define MIPI_TX_HS_MC_FIFO_RTHRESHOLD1		(0x1a4)
 #define   MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(M, N)	\
 				(MIPI_TX_HS_MC_FIFO_RTHRESHOLD0 + HS_OFFSET(M) \
 				+ (0x4*N))
-#define   SET_MC_FIFO_RTHRESHOLD(ctrl, vc, th)	\
-	kmb_write_bits_mipi(MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
+#define   SET_MC_FIFO_RTHRESHOLD(dev, ctrl, vc, th)	\
+	kmb_write_bits_mipi(dev, MIPI_TXm_HS_MC_FIFO_RTHRESHOLDn(ctrl, vc/2), \
 			(vc % 2)*16, 16, th)
 
 /* MIPI IRQ */
@@ -509,15 +513,15 @@
 #define MIPI_CTRL_IRQ_STATUS1				(0x04)
 #define   MIPI_HS_RX_EVENT_IRQ				0
 #define MIPI_CTRL_IRQ_ENABLE0				(0x08)
-#define   SET_MIPI_CTRL_IRQ_ENABLE0(M, N)		\
-			kmb_set_bit_mipi(MIPI_CTRL_IRQ_ENABLE0,	M+N)
+#define   SET_MIPI_CTRL_IRQ_ENABLE0(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_ENABLE0, M+N)
 #define MIPI_CTRL_IRQ_ENABLE1				(0x0c)
 #define MIPI_CTRL_IRQ_CLEAR0				(0x010)
-#define   SET_MIPI_CTRL_IRQ_CLEAR0(M, N)		\
-			kmb_set_bit_mipi(MIPI_CTRL_IRQ_CLEAR0, M+N)
+#define   SET_MIPI_CTRL_IRQ_CLEAR0(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR0, M+N)
 #define MIPI_CTRL_IRQ_CLEAR1				(0x014)
-#define   SET_MIPI_CTRL_IRQ_CLEAR1(M, N)		\
-			kmb_set_bit_mipi(MIPI_CTRL_IRQ_CLEAR1, M+N)
+#define   SET_MIPI_CTRL_IRQ_CLEAR1(dev, M, N)		\
+		kmb_set_bit_mipi(dev, MIPI_CTRL_IRQ_CLEAR1, M+N)
 #define MIPI_TX_HS_IRQ_STATUS				(0x01c)
 #define   MIPI_TX_HS_IRQ_STATUSm(M)			\
 			(MIPI_TX_HS_IRQ_STATUS + HS_OFFSET(M))
@@ -574,12 +578,14 @@
 				MIPI_TX_HS_IRQ_ERROR)
 
 #define MIPI_TX_HS_IRQ_ENABLE				(0x020)
-#define   SET_HS_IRQ_ENABLE(M, val)			\
-			kmb_set_bitmask_mipi(MIPI_TX_HS_IRQ_ENABLE \
+#define   SET_HS_IRQ_ENABLE(dev, M, val)			\
+			kmb_set_bitmask_mipi(dev, \
+			MIPI_TX_HS_IRQ_ENABLE \
 			+ HS_OFFSET(M), val)
 #define MIPI_TX_HS_IRQ_CLEAR				(0x024)
-#define   SET_MIPI_TX_HS_IRQ_CLEAR(M, val)		\
-			kmb_set_bitmask_mipi(MIPI_TX_HS_IRQ_CLEAR \
+#define   SET_MIPI_TX_HS_IRQ_CLEAR(dev, M, val)		\
+			kmb_set_bitmask_mipi(dev, \
+			MIPI_TX_HS_IRQ_CLEAR \
 			+ HS_OFFSET(M), val)
 
 /* D-PHY regs */
@@ -591,47 +597,47 @@
 #define   PLL_CLKSEL_0				18
 #define   PLL_SHADOW_CTRL			16
 #define DPHY_INIT_CTRL2				(0x10c)
-#define   SET_DPHY_INIT_CTRL0(dphy, offset)	\
-					kmb_set_bit_mipi(DPHY_INIT_CTRL0, \
-					(dphy+offset))
-#define   CLR_DPHY_INIT_CTRL0(dphy, offset)	\
-					kmb_clr_bit_mipi(DPHY_INIT_CTRL0, \
-					(dphy+offset))
+#define   SET_DPHY_INIT_CTRL0(dev, dphy, offset)	\
+			kmb_set_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))
+#define   CLR_DPHY_INIT_CTRL0(dev, dphy, offset)	\
+			kmb_clr_bit_mipi(dev, DPHY_INIT_CTRL0, (dphy+offset))
 #define DPHY_INIT_CTRL2				(0x10c)
 #define DPHY_FREQ_CTRL0_3			(0x11c)
-#define   SET_DPHY_FREQ_CTRL0_3(dphy, val)	\
-					kmb_write_bits_mipi(DPHY_FREQ_CTRL0_3 \
-					+ ((dphy/4)*4), (dphy % 4) * 8, \
-					6, val)
+#define   SET_DPHY_FREQ_CTRL0_3(dev, dphy, val)	\
+			kmb_write_bits_mipi(dev, DPHY_FREQ_CTRL0_3 \
+			+ ((dphy/4)*4), (dphy % 4) * 8, 6, val)
 
 #define MIPI_DPHY_STAT0_3			(0x134)
-#define	  GET_STOPSTATE_DATA(dphy)	\
-					(((kmb_read_mipi(MIPI_DPHY_STAT0_3 + \
-					(dphy/4)*4)) \
+#define	  GET_STOPSTATE_DATA(dev, dphy)		\
+			(((kmb_read_mipi(dev, MIPI_DPHY_STAT0_3 + (dphy/4)*4)) \
 					>> (((dphy % 4)*8)+4)) & 0x03)
 #define DPHY_TEST_CTRL0				(0x154)
-#define   SET_DPHY_TEST_CTRL0(dphy)	kmb_set_bit_mipi(DPHY_TEST_CTRL0, \
-					(dphy))
-#define   CLR_DPHY_TEST_CTRL0(dphy)	kmb_clr_bit_mipi(DPHY_TEST_CTRL0, \
-					(dphy))
+#define   SET_DPHY_TEST_CTRL0(dev, dphy)		\
+			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL0, (dphy))
+#define   CLR_DPHY_TEST_CTRL0(dev, dphy)		\
+			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL0, \
+						(dphy))
 #define DPHY_TEST_CTRL1				(0x158)
-#define   SET_DPHY_TEST_CTRL1_CLK(dphy)	kmb_set_bit_mipi(DPHY_TEST_CTRL1, \
-					(dphy))
-#define   CLR_DPHY_TEST_CTRL1_CLK(dphy)	kmb_clr_bit_mipi(DPHY_TEST_CTRL1, \
-					(dphy))
-#define   SET_DPHY_TEST_CTRL1_EN(dphy)	kmb_set_bit_mipi(DPHY_TEST_CTRL1, \
-					(dphy+12))
-#define   CLR_DPHY_TEST_CTRL1_EN(dphy)	kmb_clr_bit_mipi(DPHY_TEST_CTRL1, \
-					(dphy+12))
+#define   SET_DPHY_TEST_CTRL1_CLK(dev, dphy)	\
+			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy))
+#define   CLR_DPHY_TEST_CTRL1_CLK(dev, dphy)	\
+			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy))
+#define   SET_DPHY_TEST_CTRL1_EN(dev, dphy)	\
+			kmb_set_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))
+#define   CLR_DPHY_TEST_CTRL1_EN(dev, dphy)	\
+			kmb_clr_bit_mipi(dev, DPHY_TEST_CTRL1, (dphy+12))
 #define DPHY_TEST_DIN0_3			(0x15c)
-#define   SET_TEST_DIN0_3(dphy, val)	kmb_write_mipi(DPHY_TEST_DIN0_3 + \
-					4, ((val) << (((dphy)%4)*8)))
+#define   SET_TEST_DIN0_3(dev, dphy, val)		\
+			kmb_write_mipi(dev, DPHY_TEST_DIN0_3 + \
+			4, ((val) << (((dphy)%4)*8)))
 #define DPHY_TEST_DOUT0_3			(0x168)
-#define   GET_TEST_DOUT0_3(dphy)	(kmb_read_mipi(DPHY_TEST_DOUT0_3 + 4) \
-					>> (((dphy)%4)*8) & 0xff)
+#define   GET_TEST_DOUT0_3(dev, dphy)		\
+			(kmb_read_mipi(dev, DPHY_TEST_DOUT0_3 + 4) \
+			>> (((dphy)%4)*8) & 0xff)
 #define DPHY_PLL_LOCK				(0x188)
-#define   GET_PLL_LOCK(dphy)		(kmb_read_mipi(DPHY_PLL_LOCK) \
-					& (1 << (dphy - MIPI_DPHY6)))
+#define   GET_PLL_LOCK(dev, dphy)		\
+			(kmb_read_mipi(dev, DPHY_PLL_LOCK) \
+			& (1 << (dphy - MIPI_DPHY6)))
 #define DPHY_CFG_CLK_EN				(0x18c)
 
 #define MIPI_TX_MSS_LCD_MIPI_CFG		(0x04)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
