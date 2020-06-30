Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E820FEEE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 23:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E386E417;
	Tue, 30 Jun 2020 21:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2A66E317;
 Tue, 30 Jun 2020 21:28:39 +0000 (UTC)
IronPort-SDR: /ckc0Y4K472D6YSqLZRv/+L15gDE0P7eN8le7nUQLw+UeSQ3NcbitUqBLpMHXOAPoaNfUq+3Xi
 pWWQK2zhA4AA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146386950"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="146386950"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 14:28:39 -0700
IronPort-SDR: DwZGDWbDA2kLnHGwzBXAqMD5XErLJLxMbCXcR/q7Y8BN8O18wHP8jGUWE1mJeiE8uqOPlPuWQN
 6G8hsfcJ/wRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481066644"
Received: from hdwiyono-mobl.amr.corp.intel.com (HELO
 achrisan-DESK2.amr.corp.intel.com) ([10.254.176.225])
 by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2020 14:28:38 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 bob.j.paauwe@intel.com, edmund.j.dea@intel.com
Subject: [PATCH 11/59] drm/kmb: Use correct mmio offset from data book
Date: Tue, 30 Jun 2020 14:27:23 -0700
Message-Id: <1593552491-23698-12-git-send-email-anitha.chrisanthus@intel.com>
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

Also added separate macros for lcd and mipi register accesses that
use the corrected mmio offset. mmio oofset will be read from the device
tree in the future.

Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Reviewed-by: Bob Paauwe <bob.j.paauwe@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c  | 49 ++++++++++++++++++-----------------------
 drivers/gpu/drm/kmb/kmb_drv.c   | 18 ++++++---------
 drivers/gpu/drm/kmb/kmb_drv.h   | 47 ++++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/kmb/kmb_dsi.c   | 41 +++++++++++++++-------------------
 drivers/gpu/drm/kmb/kmb_plane.c | 34 ++++++++++++++--------------
 drivers/gpu/drm/kmb/kmb_regs.h  |  6 ++++-
 6 files changed, 113 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 6f16410..8e127ae 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -52,25 +52,21 @@ static void kmb_crtc_cleanup(struct drm_crtc *crtc)
 
 static int kmb_crtc_enable_vblank(struct drm_crtc *crtc)
 {
-	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
-
 	/*clear interrupt */
-	kmb_write(lcd, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+	kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_VERT_COMP);
 	/*set which interval to generate vertical interrupt */
-	kmb_write(lcd, LCD_VSTATUS_COMPARE, LCD_VSTATUS_COMPARE_VSYNC);
+	kmb_write_lcd(LCD_VSTATUS_COMPARE, LCD_VSTATUS_COMPARE_VSYNC);
 	/* enable vertical interrupt */
-	kmb_write(lcd, LCD_INT_ENABLE, LCD_INT_VERT_COMP);
+	kmb_write_lcd(LCD_INT_ENABLE, LCD_INT_VERT_COMP);
 	return 0;
 }
 
 static void kmb_crtc_disable_vblank(struct drm_crtc *crtc)
 {
-	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
-
 	/*clear interrupt */
-	kmb_write(lcd, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+	kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_VERT_COMP);
 	/* disable vertical interrupt */
-	kmb_write(lcd, LCD_INT_ENABLE, 0);
+	kmb_write_lcd(LCD_INT_ENABLE, 0);
 
 /* TBD
  *  set the BIT2 (VERTICAL_COMPARE_INTERRUPT) of the LCD_INT_ENABLE register
@@ -92,7 +88,6 @@ static const struct drm_crtc_funcs kmb_crtc_funcs = {
 
 static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 {
-	struct kmb_drm_private *lcd = crtc_to_kmb_priv(crtc);
 	struct drm_display_mode *m = &crtc->state->adjusted_mode;
 	struct videomode vm;
 	int vsync_start_offset;
@@ -109,30 +104,30 @@ static void kmb_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	vsync_start_offset = m->crtc_vsync_start - m->crtc_hsync_start;
 	vsync_end_offset = m->crtc_vsync_end - m->crtc_hsync_end;
 
-	kmb_write(lcd, LCD_V_ACTIVEHEIGHT, m->crtc_vdisplay - 1);
-	kmb_write(lcd, LCD_V_BACKPORCH, vm.vback_porch - 1);
-	kmb_write(lcd, LCD_V_FRONTPORCH, vm.vfront_porch - 1);
-	kmb_write(lcd, LCD_VSYNC_WIDTH, vm.vsync_len - 1);
-	kmb_write(lcd, LCD_H_ACTIVEWIDTH, m->crtc_hdisplay - 1);
-	kmb_write(lcd, LCD_H_BACKPORCH, vm.hback_porch - 1);
-	kmb_write(lcd, LCD_H_FRONTPORCH, vm.hfront_porch - 1);
-	kmb_write(lcd, LCD_HSYNC_WIDTH, vm.hsync_len - 1);
+	kmb_write_lcd(LCD_V_ACTIVEHEIGHT, m->crtc_vdisplay - 1);
+	kmb_write_lcd(LCD_V_BACKPORCH, vm.vback_porch - 1);
+	kmb_write_lcd(LCD_V_FRONTPORCH, vm.vfront_porch - 1);
+	kmb_write_lcd(LCD_VSYNC_WIDTH, vm.vsync_len - 1);
+	kmb_write_lcd(LCD_H_ACTIVEWIDTH, m->crtc_hdisplay - 1);
+	kmb_write_lcd(LCD_H_BACKPORCH, vm.hback_porch - 1);
+	kmb_write_lcd(LCD_H_FRONTPORCH, vm.hfront_porch - 1);
+	kmb_write_lcd(LCD_HSYNC_WIDTH, vm.hsync_len - 1);
 
 	if (m->flags == DRM_MODE_FLAG_INTERLACE) {
-		kmb_write(lcd, LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
-		kmb_write(lcd, LCD_V_BACKPORCH_EVEN, vm.vback_porch - 1);
-		kmb_write(lcd, LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
-		kmb_write(lcd, LCD_V_ACTIVEHEIGHT_EVEN, m->crtc_vdisplay - 1);
-		kmb_write(lcd, LCD_VSYNC_START_EVEN, vsync_start_offset);
-		kmb_write(lcd, LCD_VSYNC_END_EVEN, vsync_end_offset);
+		kmb_write_lcd(LCD_VSYNC_WIDTH_EVEN, vm.vsync_len - 1);
+		kmb_write_lcd(LCD_V_BACKPORCH_EVEN, vm.vback_porch - 1);
+		kmb_write_lcd(LCD_V_FRONTPORCH_EVEN, vm.vfront_porch - 1);
+		kmb_write_lcd(LCD_V_ACTIVEHEIGHT_EVEN,	m->crtc_vdisplay - 1);
+		kmb_write_lcd(LCD_VSYNC_START_EVEN, vsync_start_offset);
+		kmb_write_lcd(LCD_VSYNC_END_EVEN, vsync_end_offset);
 	}
 	/* enable VL1 layer as default */
 	ctrl = LCD_CTRL_ENABLE | LCD_CTRL_VL1_ENABLE;
 	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-	    | LCD_CTRL_OUTPUT_ENABLED;
-	kmb_write(lcd, LCD_CONTROL, ctrl);
+		| LCD_CTRL_OUTPUT_ENABLED;
+	kmb_write_lcd(LCD_CONTROL, ctrl);
 
-	kmb_write(lcd, LCD_TIMING_GEN_TRIG, ENABLE);
+	kmb_write_lcd(LCD_TIMING_GEN_TRIG, ENABLE);
 
 	/* TBD */
 	/* set clocks here */
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 24e7c2b..0b99309 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -44,7 +44,6 @@
 #include <drm/drm_of.h>
 #include <drm/drm_irq.h>
 #include "kmb_drv.h"
-#include "kmb_regs.h"
 #include "kmb_crtc.h"
 #include "kmb_plane.h"
 #include "kmb_dsi.h"
@@ -120,21 +119,20 @@ static void kmb_setup_mode_config(struct drm_device *drm)
 static irqreturn_t kmb_irq(int irq, void *arg)
 {
 	struct drm_device *dev = (struct drm_device *)arg;
-	struct kmb_drm_private *lcd = dev->dev_private;
 	unsigned long status, val;
 
-	status = kmb_read(lcd, LCD_INT_STATUS);
+	status = kmb_read_lcd(LCD_INT_STATUS);
 	if (status & LCD_INT_EOF) {
 		/*To DO - handle EOF interrupt? */
-		kmb_write(lcd, LCD_INT_CLEAR, LCD_INT_EOF);
+		kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_EOF);
 	}
 	if (status & LCD_INT_LINE_CMP) {
 		/* clear line compare interrupt */
-		kmb_write(lcd, LCD_INT_CLEAR, LCD_INT_LINE_CMP);
+		kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_LINE_CMP);
 	}
 	if (status & LCD_INT_VERT_COMP) {
 		/* read VSTATUS */
-		val = kmb_read(lcd, LCD_VSTATUS);
+		val = kmb_read_lcd(LCD_VSTATUS);
 		val = (val & LCD_VSTATUS_VERTICAL_STATUS_MASK);
 		switch (val) {
 		case LCD_VSTATUS_COMPARE_VSYNC:
@@ -142,7 +140,7 @@ static irqreturn_t kmb_irq(int irq, void *arg)
 		case LCD_VSTATUS_COMPARE_ACTIVE:
 		case LCD_VSTATUS_COMPARE_FRONT_PORCH:
 			/* clear vertical compare interrupt */
-			kmb_write(lcd, LCD_INT_CLEAR, LCD_INT_VERT_COMP);
+			kmb_write_lcd(LCD_INT_CLEAR, LCD_INT_VERT_COMP);
 			drm_handle_vblank(dev, 0);
 			break;
 		}
@@ -153,10 +151,8 @@ static irqreturn_t kmb_irq(int irq, void *arg)
 
 static void kmb_irq_reset(struct drm_device *drm)
 {
-	struct kmb_drm_private *lcd = drm->dev_private;
-
-	kmb_write(lcd, LCD_INT_CLEAR, 0xFFFF);
-	kmb_write(lcd, LCD_INT_ENABLE, 0);
+	kmb_write_lcd(LCD_INT_CLEAR, 0xFFFF);
+	kmb_write_lcd(LCD_INT_ENABLE, 0);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index 46be8cb..a431785 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -26,8 +26,10 @@
 #ifndef __KMB_DRV_H__
 #define __KMB_DRV_H__
 
-#define KMB_MAX_WIDTH			16384	/*max width in pixels */
-#define KMB_MAX_HEIGHT			16384	/*max height in pixels */
+#include "kmb_regs.h"
+
+#define KMB_MAX_WIDTH			16384 /*max width in pixels */
+#define KMB_MAX_HEIGHT			16384 /*max height in pixels */
 
 struct kmb_drm_private {
 	struct drm_device drm;
@@ -50,7 +52,12 @@ static inline struct kmb_drm_private *to_kmb(const struct drm_device *dev)
 struct blt_layer_config {
 	unsigned char layer_format;
 };
-
+/*
+ * commenting this out to use hardcoded address for registers
+ * TODO we may need this later if we decide to get the address from
+ * the device tree
+ */
+#ifdef KMB_WRITE
 static inline void kmb_write(struct kmb_drm_private *lcd,
 			     unsigned int reg, u32 value)
 {
@@ -75,6 +82,40 @@ static inline void kmb_write_bits(struct kmb_drm_private *lcd,
 	reg_val |= (value << offset);
 	writel(reg_val, lcd->mmio + reg);
 }
+#endif
+
+static inline void kmb_write_lcd(unsigned int reg, u32 value)
+{
+	writel(value, (LCD_BASE_ADDR + reg));
+}
+
+static inline void kmb_write_mipi(unsigned int reg, u32 value)
+{
+	writel(value, (MIPI_BASE_ADDR + reg));
+}
+
+static inline u32 kmb_read_lcd(unsigned int reg)
+{
+	return readl(LCD_BASE_ADDR + reg);
+}
+
+static inline u32 kmb_read_mipi(unsigned int reg)
+{
+	return readl(MIPI_BASE_ADDR + reg);
+}
+
+static inline void kmb_write_bits_mipi(unsigned int reg, u32 offset,
+		u32 num_bits, u32 value)
+{
+	u32 reg_val = kmb_read_mipi(reg);
+	u32 mask = (1 << num_bits) - 1;
+
+	value &= mask;
+	mask <<= offset;
+	reg_val &= (~mask);
+	reg_val |= (value << offset);
+	kmb_write_mipi(reg, reg_val);
+}
 
 int kmb_setup_crtc(struct drm_device *dev);
 void kmb_set_scanout(struct kmb_drm_private *lcd);
diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 1435ed8..109c83b 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -343,8 +343,8 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_priv,
 	cfg |= ((ph_cfg->data_mode & MIPI_TX_SECT_DM_MASK)
 		<< MIPI_TX_SECT_DM_SHIFT);	/* bits [24:25] */
 	cfg |= MIPI_TX_SECT_DMA_PACKED;
-	kmb_write(dev_priv,
-		  (MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id, section)), cfg);
+	kmb_write_mipi((MIPI_TXm_HS_FGn_SECTo_PH(ctrl_no, frame_id,
+					section)), cfg);
 
 	/*unpacked bytes */
 	/*there are 4 frame generators and each fg has 4 sections
@@ -353,15 +353,13 @@ static u32 mipi_tx_fg_section_cfg_regs(struct kmb_drm_private *dev_priv,
 	 *REG_UNPACKED_BYTES0: [15:0]-BYTES0, [31:16]-BYTES1
 	 *REG_UNPACKED_BYTES1: [15:0]-BYTES2, [31:16]-BYTES3
 	 */
-	reg_adr =
-	    MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no,
-						 frame_id) + (section / 2) * 4;
-	kmb_write_bits(dev_priv, reg_adr, (section % 2) * 16, 16,
-		       unpacked_bytes);
+	reg_adr = MIPI_TXm_HS_FGn_SECT_UNPACKED_BYTES0(ctrl_no, frame_id)
+	+ (section/2)*4;
+	kmb_write_bits_mipi(reg_adr, (section % 2)*16, 16, unpacked_bytes);
 
 	/* line config */
 	reg_adr = MIPI_TXm_HS_FGn_SECTo_LINE_CFG(ctrl_no, frame_id, section);
-	kmb_write(dev_priv, reg_adr, height_lines);
+	kmb_write_mipi(reg_adr, height_lines);
 	return 0;
 }
 
@@ -437,7 +435,7 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 
 	/*frame generator number of lines */
 	reg_adr = MIPI_TXm_HS_FGn_NUM_LINES(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr, fg_cfg->v_active);
+	kmb_write_mipi(reg_adr, fg_cfg->v_active);
 
 	/*vsync width */
 	/*
@@ -447,34 +445,31 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 	 */
 	offset = (frame_gen % 2) * 16;
 	reg_adr = MIPI_TXm_HS_VSYNC_WIDTHn(ctrl_no, frame_gen);
-	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->vsync_width);
+	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->vsync_width);
 
 	/*v backporch - same register config like vsync width */
 	reg_adr = MIPI_TXm_HS_V_BACKPORCHESn(ctrl_no, frame_gen);
-	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->v_backporch);
+	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_backporch);
 
 	/*v frontporch - same register config like vsync width */
 	reg_adr = MIPI_TXm_HS_V_FRONTPORCHESn(ctrl_no, frame_gen);
-	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->v_frontporch);
+	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_frontporch);
 
 	/*v active - same register config like vsync width */
 	reg_adr = MIPI_TXm_HS_V_ACTIVEn(ctrl_no, frame_gen);
-	kmb_write_bits(dev_priv, reg_adr, offset, 16, fg_cfg->v_active);
+	kmb_write_bits_mipi(reg_adr, offset, 16, fg_cfg->v_active);
 
 	/*hsyc width */
 	reg_adr = MIPI_TXm_HS_HSYNC_WIDTHn(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr,
-		  (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
+	kmb_write_mipi(reg_adr, (fg_cfg->hsync_width * ppl_llp_ratio) / 1000);
 
 	/*h backporch */
 	reg_adr = MIPI_TXm_HS_H_BACKPORCHn(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr,
-		  (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
+	kmb_write_mipi(reg_adr, (fg_cfg->h_backporch * ppl_llp_ratio) / 1000);
 
 	/*h frontporch */
 	reg_adr = MIPI_TXm_HS_H_FRONTPORCHn(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr,
-		  (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
+	kmb_write_mipi(reg_adr, (fg_cfg->h_frontporch * ppl_llp_ratio) / 1000);
 
 	/*h active */
 	reg_adr = MIPI_TXm_HS_H_ACTIVEn(ctrl_no, frame_gen);
@@ -482,19 +477,19 @@ static void mipi_tx_fg_cfg_regs(struct kmb_drm_private *dev_priv,
 	val = (fg_cfg->h_active * sysclk * 1000) /
 	    ((fg_cfg->lane_rate_mbps / 8) * fg_cfg->active_lanes);
 	val /= 1000;
-	kmb_write(dev_priv, reg_adr, val);
+	kmb_write_mipi(reg_adr, val);
 
 	/* llp hsync width */
 	reg_adr = MIPI_TXm_HS_LLP_HSYNC_WIDTHn(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp / 8));
+	kmb_write_mipi(reg_adr, fg_cfg->hsync_width * (fg_cfg->bpp / 8));
 
 	/* llp h backporch */
 	reg_adr = MIPI_TXm_HS_LLP_H_BACKPORCHn(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
+	kmb_write_mipi(reg_adr, fg_cfg->h_backporch * (fg_cfg->bpp / 8));
 
 	/* llp h frontporch */
 	reg_adr = MIPI_TXm_HS_LLP_H_FRONTPORCHn(ctrl_no, frame_gen);
-	kmb_write(dev_priv, reg_adr, fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
+	kmb_write_mipi(reg_adr, fg_cfg->h_frontporch * (fg_cfg->bpp / 8));
 }
 
 static void mipi_tx_fg_cfg(struct kmb_drm_private *dev_priv, u8 frame_gen,
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index f609283..66d6c9f 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -242,16 +242,16 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	crtc_x = plane->state->crtc_x;
 	crtc_y = plane->state->crtc_y;
 
-	kmb_write(lcd, LCD_LAYERn_WIDTH(plane_id), src_w - 1);
-	kmb_write(lcd, LCD_LAYERn_HEIGHT(plane_id), src_h - 1);
-	kmb_write(lcd, LCD_LAYERn_COL_START(plane_id), crtc_x);
-	kmb_write(lcd, LCD_LAYERn_ROW_START(plane_id), crtc_y);
+	kmb_write_lcd(LCD_LAYERn_WIDTH(plane_id), src_w-1);
+	kmb_write_lcd(LCD_LAYERn_HEIGHT(plane_id), src_h-1);
+	kmb_write_lcd(LCD_LAYERn_COL_START(plane_id), crtc_x);
+	kmb_write_lcd(LCD_LAYERn_ROW_START(plane_id), crtc_y);
 
 	val = set_pixel_format(fb->format->format);
 	val |= set_bits_per_pixel(fb->format);
 	/*CHECKME Leon drvr sets it to 50 try this for now */
 	val |= LCD_LAYER_FIFO_50;
-	kmb_write(lcd, LCD_LAYERn_CFG(plane_id), val);
+	kmb_write_lcd(LCD_LAYERn_CFG(plane_id), val);
 
 	switch (plane_id) {
 	case LAYER_0:
@@ -270,8 +270,8 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 
 	ctrl |= LCD_CTRL_ENABLE;
 	ctrl |= LCD_CTRL_PROGRESSIVE | LCD_CTRL_TIM_GEN_ENABLE
-	    | LCD_CTRL_OUTPUT_ENABLED;
-	kmb_write(lcd, LCD_CONTROL, ctrl);
+		| LCD_CTRL_OUTPUT_ENABLED;
+	kmb_write_lcd(LCD_CONTROL, ctrl);
 
 	/*TBD check visible? */
 
@@ -280,24 +280,24 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	    | LCD_DMA_LAYER_CONT_UPDATE | LCD_DMA_LAYER_AXI_BURST_1;
 
 	/* disable DMA first */
-	kmb_write(lcd, LCD_LAYERn_DMA_CFG(plane_id), ~LCD_DMA_LAYER_ENABLE);
+	kmb_write_lcd(LCD_LAYERn_DMA_CFG(plane_id), ~LCD_DMA_LAYER_ENABLE);
 
 	addr = drm_fb_cma_get_gem_addr(fb, plane->state, plane_id);
-	kmb_write(lcd, LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
-	kmb_write(lcd, LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
+	kmb_write_lcd(LCD_LAYERn_DMA_START_ADDR(plane_id), addr);
+	kmb_write_lcd(LCD_LAYERn_DMA_START_SHADOW(plane_id), addr);
 
 	width = fb->width;
 	height = fb->height;
 	dma_len = width * height * fb->format->cpp[plane_id];
-	kmb_write(lcd, LCD_LAYERn_DMA_LEN(plane_id), dma_len);
+	kmb_write_lcd(LCD_LAYERn_DMA_LEN(plane_id), dma_len);
 
-	kmb_write(lcd, LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
-		  fb->pitches[plane_id]);
-	kmb_write(lcd, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
-		  (width * fb->format->cpp[plane_id]));
+	kmb_write_lcd(LCD_LAYERn_DMA_LINE_VSTRIDE(plane_id),
+			fb->pitches[plane_id]);
+	kmb_write_lcd(LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
+			(width*fb->format->cpp[plane_id]));
 
 	/* enable DMA */
-	kmb_write(lcd, LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
+	kmb_write_lcd(LCD_LAYERn_DMA_CFG(plane_id), dma_cfg);
 
 	/* FIXME no doc on how to set output format - may need to change
 	 * this later
@@ -310,7 +310,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	out_format |= LCD_OUTF_MIPI_RGB_MODE;
 	/* pixel format from LCD_LAYER_CFG */
 	out_format |= ((val >> 9) & 0x1F);
-	kmb_write(lcd, LCD_OUT_FORMAT_CFG, out_format);
+	kmb_write_lcd(LCD_OUT_FORMAT_CFG, out_format);
 }
 
 static const struct drm_plane_helper_funcs kmb_plane_helper_funcs = {
diff --git a/drivers/gpu/drm/kmb/kmb_regs.h b/drivers/gpu/drm/kmb/kmb_regs.h
index 8715c7b..d1f8174 100644
--- a/drivers/gpu/drm/kmb/kmb_regs.h
+++ b/drivers/gpu/drm/kmb/kmb_regs.h
@@ -27,6 +27,11 @@
 #define __KMB_REGS_H__
 
 #define ENABLE					 1
+/*from Data Book section 12.5.8.1 page 4322 */
+#define MIPI_BASE_ADDR                          (void *)(0x20900000)
+/*from Data Book section 12.11.6.1 page 4972 */
+#define LCD_BASE_ADDR                           (void *)(0x20930000)
+
 /***************************************************************************
  *		   LCD controller control register defines
  ***************************************************************************/
@@ -388,7 +393,6 @@
 /***************************************************************************
  *		   MIPI controller control register defines
  ***********************************************i****************************/
-#define MIPI_BASE_ADDR				(0x20900000)
 #define MIPI0_HS_BASE_ADDR			(MIPI_BASE_ADDR + 0x400)
 #define MIPI_CTRL_HS_BASE_ADDR			(0x400)
 #define MIPI_TX0_HS_FG0_SECT0_PH		(0x40)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
