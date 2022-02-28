Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EAC4C6034
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9720010E21C;
	Mon, 28 Feb 2022 00:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA74B10E21C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:46 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 20D1783A78;
 Mon, 28 Feb 2022 01:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009205;
 bh=IGUxpSgDL0C6Q5hep5Aonqof20YU8Tc1I1E14rMwkPg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Aobot1BH+BqAbz/DPHfaoY2ssu2yfQTNNfPU8xYER/9vHXgvD2R7OUF+07TzGFN60
 1DcIZklgpwHemeyhLxjYPbQp5fjgYeDpwTHmjrDYfFyivgAjprdTX7YBE1PsG2m8Oo
 +qHIFUnXjUbgTXa1H5V38Y2/6KKCD1P7a+nAS4wcUUVhVNzwew/6tdASLWy/hccnp8
 8NVUjIh3VIRLL2jo08Ea9WSRjGYAsno3qxNjzxt0vitZB8nwRNK0ksToCTtLMs/GlI
 lD5STJP/8jDwGEIlZpJoxJhF7xUTZxbM9R8oqXYjhbwzvL31JDuq0pvO93F5aewI1Z
 vDSmlS5b3FETA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm: mxsfb: Add support for i.MX8MP LCDIF variant
Date: Mon, 28 Feb 2022 01:46:05 +0100
Message-Id: <20220228004605.367040-9-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for i.MX8MP LCDIF variant. This is called LCDIFv3 and is
completely different from the LCDIFv3 found in i.MX23 in that it has
a completely scrambled register layout compared to all previous LCDIF
variants. The new LCDIFv3 also supports 36bit address space.

However, except for the complete bit reshuffling, this is still LCDIF
and it still works like one, the boilerplate code is also the same,
hence it is part of this driver. This is probably still a bit better
than a separate driver with a lot of duplicated code.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c  |  34 ++++-
 drivers/gpu/drm/mxsfb/mxsfb_drv.h  |   1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 219 +++++++++++++++++++++++++++--
 drivers/gpu/drm/mxsfb/mxsfb_regs.h | 136 ++++++++++++++++++
 4 files changed, 374 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 11298df50917c..7fd7fd1496f7d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -40,6 +40,8 @@ enum mxsfb_devtype {
 	 * i.MX family number as the version.
 	 */
 	MXSFB_V6,
+	/* Starting at i.MX8MP the register layout is scrambled. */
+	MXSFB_V8,
 };
 
 static const struct mxsfb_devdata mxsfb_devdata[] = {
@@ -51,6 +53,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.hs_wdth_shift	= 24,
 		.has_overlay	= false,
 		.has_ctrl2	= false,
+		.has_regsv8	= false,
 	},
 	[MXSFB_V4] = {
 		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
@@ -60,6 +63,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.hs_wdth_shift	= 18,
 		.has_overlay	= false,
 		.has_ctrl2	= true,
+		.has_regsv8	= false,
 	},
 	[MXSFB_V6] = {
 		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
@@ -69,6 +73,13 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.hs_wdth_shift	= 18,
 		.has_overlay	= true,
 		.has_ctrl2	= true,
+		.has_regsv8	= false,
+	},
+	[MXSFB_V8] = {
+		/* Old register layout details do not apply here. */
+		.has_overlay	= false,
+		.has_ctrl2	= false,
+		.has_regsv8	= true,
 	},
 };
 
@@ -156,6 +167,22 @@ static irqreturn_t mxsfb_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t mxsfb_v8_irq_handler(int irq, void *data)
+{
+	struct drm_device *drm = data;
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+	u32 reg;
+
+	reg = readl(mxsfb->base + LCDC_V8_INT_STATUS_D0);
+
+	if (reg & INT_STATUS_D0_VS_BLANK)
+		drm_crtc_handle_vblank(&mxsfb->crtc);
+
+	writel(INT_STATUS_D0_VS_BLANK, mxsfb->base + LCDC_V8_INT_STATUS_D0);
+
+	return IRQ_HANDLED;
+}
+
 static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
@@ -191,7 +218,8 @@ static int mxsfb_load(struct drm_device *drm,
 
 	platform_set_drvdata(pdev, drm);
 
-	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(drm->dev,
+				DMA_BIT_MASK(devdata->has_regsv8 ? 36 : 32));
 	if (ret)
 		return ret;
 
@@ -234,7 +262,8 @@ static int mxsfb_load(struct drm_device *drm,
 		return ret;
 	mxsfb->irq = ret;
 
-	ret = request_irq(mxsfb->irq, mxsfb_irq_handler, 0,
+	ret = request_irq(mxsfb->irq, devdata->has_regsv8 ?
+			  mxsfb_v8_irq_handler : mxsfb_irq_handler, 0,
 			  drm->driver->name, drm);
 	if (ret < 0) {
 		dev_err(drm->dev, "Failed to install IRQ handler\n");
@@ -286,6 +315,7 @@ static const struct of_device_id mxsfb_dt_ids[] = {
 	{ .compatible = "fsl,imx23-lcdif", .data = &mxsfb_devdata[MXSFB_V3], },
 	{ .compatible = "fsl,imx28-lcdif", .data = &mxsfb_devdata[MXSFB_V4], },
 	{ .compatible = "fsl,imx6sx-lcdif", .data = &mxsfb_devdata[MXSFB_V6], },
+	{ .compatible = "fsl,imx8mp-lcdif", .data = &mxsfb_devdata[MXSFB_V8], },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mxsfb_dt_ids);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index ddb5b0417a82c..74c5e6013ca43 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -23,6 +23,7 @@ struct mxsfb_devdata {
 	unsigned int	hs_wdth_shift;
 	bool		has_overlay;
 	bool		has_ctrl2;
+	bool		has_regsv8;
 };
 
 struct mxsfb_drm_private {
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 4baa3db1f3d10..52df73982ccc1 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -74,6 +74,26 @@ mxsfb_update_buffer(struct mxsfb_drm_private *mxsfb, struct drm_plane *plane,
 	writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
 }
 
+static void
+mxsfb_v8_update_buffer(struct mxsfb_drm_private *mxsfb, struct drm_plane *plane)
+{
+	dma_addr_t paddr;
+	u32 reg;
+
+	paddr = mxsfb_get_fb_paddr(plane);
+	if (!paddr)
+		return;
+
+	writel(lower_32_bits(paddr),
+	       mxsfb->base + LCDC_V8_CTRLDESCL_LOW0_4);
+	writel(CTRLDESCL_HIGH0_4_ADDR_HIGH(upper_32_bits(paddr)),
+	       mxsfb->base + LCDC_V8_CTRLDESCL_HIGH0_4);
+
+	reg = readl(mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+	reg |= CTRLDESCL0_5_SHADOW_LOAD_EN;
+	writel(reg, mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+}
+
 /*
  * Setup the MXSFB registers for decoding the pixels out of the framebuffer and
  * outputting them on the bus.
@@ -127,6 +147,57 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
 	writel(ctrl, mxsfb->base + LCDC_CTRL);
 }
 
+static void mxsfb_v8_set_formats(struct mxsfb_drm_private *mxsfb,
+				 const u32 bus_format)
+{
+	struct drm_device *drm = mxsfb->drm;
+	const u32 format = mxsfb->crtc.primary->state->fb->format->format;
+
+	switch (bus_format) {
+	case MEDIA_BUS_FMT_RGB565_1X16:
+		writel(DISP_PARA_LINE_PATTERN_RGB565,
+		       mxsfb->base + LCDC_V8_DISP_PARA);
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+		writel(DISP_PARA_LINE_PATTERN_RGB888,
+		       mxsfb->base + LCDC_V8_DISP_PARA);
+		break;
+	default:
+		dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_format);
+		break;
+	}
+
+	switch (format) {
+	case DRM_FORMAT_RGB565:
+		writel(CTRLDESCL0_5_BPP_16_RGB565,
+		       mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_RGB888:
+		writel(CTRLDESCL0_5_BPP_24_RGB888,
+		       mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XRGB1555:
+		writel(CTRLDESCL0_5_BPP_16_ARGB1555,
+		       mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XRGB4444:
+		writel(CTRLDESCL0_5_BPP_16_ARGB4444,
+		       mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XBGR8888:
+		writel(CTRLDESCL0_5_BPP_32_ABGR8888,
+		       mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	case DRM_FORMAT_XRGB8888:
+		writel(CTRLDESCL0_5_BPP_32_ARGB8888,
+		       mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+		break;
+	default:
+		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
+		break;
+	}
+}
+
 static void mxsfb_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
 {
 	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
@@ -178,6 +249,47 @@ static void mxsfb_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
 
 }
 
+static void mxsfb_v8_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
+{
+	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
+	u32 ctrl;
+
+	if (m->flags & DRM_MODE_FLAG_PHSYNC)
+		ctrl |= CTRL_INV_HS;
+	if (m->flags & DRM_MODE_FLAG_PVSYNC)
+		ctrl |= CTRL_INV_VS;
+	/* Make sure Data Enable is high active by default */
+	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
+		ctrl |= CTRL_INV_DE;
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+		ctrl |= CTRL_INV_PXCK;
+
+	writel(ctrl, mxsfb->base + LCDC_CTRL);
+
+	writel(DISP_SIZE_DELTA_Y(m->crtc_vdisplay) |
+	       DISP_SIZE_DELTA_X(m->crtc_hdisplay),
+	       mxsfb->base + LCDC_V8_DISP_SIZE);
+
+	writel(HSYN_PARA_BP_H(m->htotal - m->hsync_end) |
+	       HSYN_PARA_FP_H(m->hsync_start - m->hdisplay),
+	       mxsfb->base + LCDC_V8_HSYN_PARA);
+
+	writel(VSYN_PARA_BP_V(m->vtotal - m->vsync_end) |
+	       VSYN_PARA_FP_V(m->vsync_start - m->vdisplay),
+	       mxsfb->base + LCDC_V8_VSYN_PARA);
+
+	writel(VSYN_HSYN_WIDTH_PW_V(m->vsync_end - m->vsync_start) |
+	       VSYN_HSYN_WIDTH_PW_H(m->hsync_end - m->hsync_start),
+	       mxsfb->base + LCDC_V8_VSYN_HSYN_WIDTH);
+
+	writel(CTRLDESCL0_1_HEIGHT(m->crtc_vdisplay) |
+	       CTRLDESCL0_1_WIDTH(m->crtc_hdisplay),
+	       mxsfb->base + LCDC_V8_CTRLDESCL0_1);
+
+	writel(CTRLDESCL0_3_PITCH(mxsfb->crtc.primary->state->fb->pitches[0]),
+	       mxsfb->base + LCDC_V8_CTRLDESCL0_3);
+}
+
 static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
@@ -230,6 +342,19 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
 }
 
+static void mxsfb_v8_enable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	u32 reg;
+
+	reg = readl(mxsfb->base + LCDC_V8_DISP_PARA);
+	reg |= DISP_PARA_DISP_ON;
+	writel(reg, mxsfb->base + LCDC_V8_DISP_PARA);
+
+	reg = readl(mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+	reg |= CTRLDESCL0_5_EN;
+	writel(reg, mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+}
+
 static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
@@ -248,6 +373,19 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
 }
 
+static void mxsfb_v8_disable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	u32 reg;
+
+	reg = readl(mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+	reg &= ~CTRLDESCL0_5_EN;
+	writel(reg, mxsfb->base + LCDC_V8_CTRLDESCL0_5);
+
+	reg = readl(mxsfb->base + LCDC_V8_DISP_PARA);
+	reg &= ~DISP_PARA_DISP_ON;
+	writel(reg, mxsfb->base + LCDC_V8_DISP_PARA);
+}
+
 /*
  * Clear the bit and poll it cleared.  This is usually called with
  * a reset address and mask being either SFTRST(bit 31) or CLKGATE
@@ -297,6 +435,26 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 	return 0;
 }
 
+static int mxsfb_v8_reset_block(struct mxsfb_drm_private *mxsfb)
+{
+	u32 reg;
+	int ret;
+
+	writel(CTRL_SW_RESET, mxsfb->base + LCDC_CTRL + REG_SET);
+
+	ret = readl_poll_timeout(mxsfb->base + LCDC_CTRL, reg,
+				 (reg & CTRL_SW_RESET), 0,
+				 RESET_TIMEOUT);
+	if (ret)
+		return ret;
+
+	writel(CTRL_SW_RESET, mxsfb->base + LCDC_CTRL + REG_CLR);
+
+	return readl_poll_timeout(mxsfb->base + LCDC_CTRL, reg,
+				  !(reg & CTRL_SW_RESET), 0,
+				  RESET_TIMEOUT);
+}
+
 static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 				     const u32 bus_format)
 {
@@ -315,14 +473,25 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 			     bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
-	/* Mandatory eLCDIF reset as per the Reference Manual */
-	err = mxsfb_reset_block(mxsfb);
-	if (err)
-		return;
+	if (mxsfb->devdata->has_regsv8) {
+		/* Mandatory eLCDIF reset as per the Reference Manual */
+		err = mxsfb_v8_reset_block(mxsfb);
+		if (err)
+			return;
+
+		mxsfb_v8_set_formats(mxsfb, bus_format);
 
-	mxsfb_set_formats(mxsfb, bus_format);
+		mxsfb_v8_set_mode(mxsfb, bus_flags);
+	} else {
+		/* Mandatory eLCDIF reset as per the Reference Manual */
+		err = mxsfb_reset_block(mxsfb);
+		if (err)
+			return;
 
-	mxsfb_set_mode(mxsfb, bus_flags);
+		mxsfb_set_formats(mxsfb, bus_format);
+
+		mxsfb_set_mode(mxsfb, bus_flags);
+	}
 }
 
 static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
@@ -402,9 +571,15 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	mxsfb_update_buffer(mxsfb, crtc->primary, true);
+	if (mxsfb->devdata->has_regsv8) {
+		mxsfb_v8_update_buffer(mxsfb, crtc->primary);
 
-	mxsfb_enable_controller(mxsfb);
+		mxsfb_v8_enable_controller(mxsfb);
+	} else {
+		mxsfb_update_buffer(mxsfb, crtc->primary, true);
+
+		mxsfb_enable_controller(mxsfb);
+	}
 
 	drm_crtc_vblank_on(crtc);
 }
@@ -418,7 +593,10 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	drm_crtc_vblank_off(crtc);
 
-	mxsfb_disable_controller(mxsfb);
+	if (mxsfb->devdata->has_regsv8)
+		mxsfb_v8_disable_controller(mxsfb);
+	else
+		mxsfb_disable_controller(mxsfb);
 
 	spin_lock_irq(&drm->event_lock);
 	event = crtc->state->event;
@@ -436,8 +614,13 @@ static int mxsfb_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 
 	/* Clear and enable VBLANK IRQ */
-	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_SET);
+	if (mxsfb->devdata->has_regsv8) {
+		writel(INT_STATUS_D0_VS_BLANK, mxsfb->base + LCDC_V8_INT_STATUS_D0);
+		writel(INT_ENABLE_D0_VS_BLANK_EN, mxsfb->base + LCDC_V8_INT_ENABLE_D0);
+	} else {
+		writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+		writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_SET);
+	}
 
 	return 0;
 }
@@ -447,8 +630,13 @@ static void mxsfb_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
 
 	/* Disable and clear VBLANK IRQ */
-	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+	if (mxsfb->devdata->has_regsv8) {
+		writel(0, mxsfb->base + LCDC_V8_INT_ENABLE_D0);
+		writel(INT_STATUS_D0_VS_BLANK, mxsfb->base + LCDC_V8_INT_STATUS_D0);
+	} else {
+		writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+		writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
+	}
 }
 
 static const struct drm_crtc_helper_funcs mxsfb_crtc_helper_funcs = {
@@ -503,7 +691,10 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 
-	mxsfb_update_buffer(mxsfb, plane, false);
+	if (mxsfb->devdata->has_regsv8)
+		mxsfb_v8_update_buffer(mxsfb, plane);
+	else
+		mxsfb_update_buffer(mxsfb, plane, false);
 }
 
 static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 694fea13e893e..43e08088a8a03 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -34,6 +34,30 @@
 #define LCDC_AS_CLRKEYLOW		0x240
 #define LCDC_AS_CLRKEYHIGH		0x250
 
+/* V8 register set */
+#define LCDC_V8_DISP_PARA		0x10
+#define LCDC_V8_DISP_SIZE		0x14
+#define LCDC_V8_HSYN_PARA		0x18
+#define LCDC_V8_VSYN_PARA		0x1c
+#define LCDC_V8_VSYN_HSYN_WIDTH		0x20
+#define LCDC_V8_INT_STATUS_D0		0x24
+#define LCDC_V8_INT_ENABLE_D0		0x28
+#define LCDC_V8_INT_STATUS_D1		0x30
+#define LCDC_V8_INT_ENABLE_D1		0x34
+#define LCDC_V8_CTRLDESCL0_1		0x200
+#define LCDC_V8_CTRLDESCL0_3		0x208
+#define LCDC_V8_CTRLDESCL_LOW0_4	0x20c
+#define LCDC_V8_CTRLDESCL_HIGH0_4	0x210
+#define LCDC_V8_CTRLDESCL0_5		0x214
+#define LCDC_V8_CSC0_CTRL		0x21c
+#define LCDC_V8_CSC0_COEF0		0x220
+#define LCDC_V8_CSC0_COEF1		0x224
+#define LCDC_V8_CSC0_COEF2		0x228
+#define LCDC_V8_CSC0_COEF3		0x22c
+#define LCDC_V8_CSC0_COEF4		0x230
+#define LCDC_V8_CSC0_COEF5		0x234
+#define LCDC_V8_PANIC0_THRES		0x238
+
 #define CTRL_SFTRST			BIT(31)
 #define CTRL_CLKGATE			BIT(30)
 #define CTRL_BYPASS_COUNT		BIT(19)
@@ -121,6 +145,118 @@
 #define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
 #define AS_CTRL_AS_ENABLE		BIT(0)
 
+/* V8 register set */
+#define CTRL_SW_RESET			BIT(31)
+#define CTRL_FETCH_START_OPTION_FPV	0
+#define CTRL_FETCH_START_OPTION_PWV	BIT(8)
+#define CTRL_FETCH_START_OPTION_BPV	BIT(9)
+#define CTRL_FETCH_START_OPTION_RESV	GENMASK(9, 8)
+#define CTRL_FETCH_START_OPTION_MASK	GENMASK(9, 8)
+#define CTRL_NEG				BIT(4)
+#define CTRL_INV_PXCK			BIT(3)
+#define CTRL_INV_DE			BIT(2)
+#define CTRL_INV_VS			BIT(1)
+#define CTRL_INV_HS			BIT(0)
+
+#define DISP_PARA_DISP_ON		BIT(31)
+#define DISP_PARA_SWAP_EN		BIT(30)
+#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
+#define DISP_PARA_LINE_PATTERN_RGB888	0
+#define DISP_PARA_LINE_PATTERN_MASK	GENMASK(29, 26)
+#define DISP_PARA_DISP_MODE_MASK	GENMASK(25, 24)
+#define DISP_PARA_BGND_R_MASK		GENMASK(23, 16)
+#define DISP_PARA_BGND_G_MASK		GENMASK(15, 8)
+#define DISP_PARA_BGND_B_MASK		GENMASK(7, 0)
+
+#define DISP_SIZE_DELTA_Y(n)		(((n) & 0xffff) << 16)
+#define DISP_SIZE_DELTA_Y_MASK		GENMASK(31, 16)
+#define DISP_SIZE_DELTA_X(n)		((n) & 0xffff)
+#define DISP_SIZE_DELTA_X_MASK		GENMASK(15, 0)
+
+#define HSYN_PARA_BP_H(n)		(((n) & 0xffff) << 16)
+#define HSYN_PARA_BP_H_MASK		GENMASK(31, 16)
+#define HSYN_PARA_FP_H(n)		((n) & 0xffff)
+#define HSYN_PARA_FP_H_MASK		GENMASK(15, 0)
+
+#define VSYN_PARA_BP_V(n)		(((n) & 0xffff) << 16)
+#define VSYN_PARA_BP_V_MASK		GENMASK(31, 16)
+#define VSYN_PARA_FP_V(n)		((n) & 0xffff)
+#define VSYN_PARA_FP_V_MASK		GENMASK(15, 0)
+
+#define VSYN_HSYN_WIDTH_PW_V(n)		(((n) & 0xffff) << 16)
+#define VSYN_HSYN_WIDTH_PW_V_MASK	GENMASK(31, 16)
+#define VSYN_HSYN_WIDTH_PW_H(n)		((n) & 0xffff)
+#define VSYN_HSYN_WIDTH_PW_H_MASK	GENMASK(15, 0)
+
+#define INT_STATUS_D0_FIFO_EMPTY	BIT(24)
+#define INT_STATUS_D0_DMA_DONE		BIT(16)
+#define INT_STATUS_D0_DMA_ERR		BIT(8)
+#define INT_STATUS_D0_VS_BLANK		BIT(2)
+#define INT_STATUS_D0_UNDERRUN		BIT(1)
+#define INT_STATUS_D0_VSYNC		BIT(0)
+
+#define INT_ENABLE_D0_FIFO_EMPTY_EN	BIT(24)
+#define INT_ENABLE_D0_DMA_DONE_EN	BIT(16)
+#define INT_ENABLE_D0_DMA_ERR_EN	BIT(8)
+#define INT_ENABLE_D0_VS_BLANK_EN	BIT(2)
+#define INT_ENABLE_D0_UNDERRUN_EN	BIT(1)
+#define INT_ENABLE_D0_VSYNC_EN		BIT(0)
+
+#define INT_STATUS_D1_PLANE_PANIC	BIT(0)
+
+#define INT_ENABLE_D1_PLANE_PANIC_EN	BIT(0)
+
+#define CTRLDESCL0_1_HEIGHT(n)		(((n) & 0xffff) << 16)
+#define CTRLDESCL0_1_HEIGHT_MASK		GENMASK(31, 16)
+#define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
+#define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
+
+#define CTRLDESCL0_3_PITCH(n)		((n) & 0xffff)
+#define CTRLDESCL0_3_PITCH_MASK		GENMASK(15, 0)
+
+#define CTRLDESCL_HIGH0_4_ADDR_HIGH(n)	((n) & 0xf)
+#define CTRLDESCL_HIGH0_4_ADDR_HIGH_MASK	GENMASK(3, 0)
+
+#define CTRLDESCL0_5_EN			BIT(31)
+#define CTRLDESCL0_5_SHADOW_LOAD_EN	BIT(30)
+#define CTRLDESCL0_5_BPP_16_RGB565	BIT(26)
+#define CTRLDESCL0_5_BPP_16_ARGB1555	(BIT(26) | BIT(24))
+#define CTRLDESCL0_5_BPP_16_ARGB4444	(BIT(26) | BIT(25))
+#define CTRLDESCL0_5_BPP_YCbCr422	(BIT(26) | BIT(25) | BIT(24))
+#define CTRLDESCL0_5_BPP_24_RGB888	BIT(27)
+#define CTRLDESCL0_5_BPP_32_ARGB8888	(BIT(27) | BIT(24))
+#define CTRLDESCL0_5_BPP_32_ABGR8888	(BIT(27) | BIT(25))
+#define CTRLDESCL0_5_BPP_MASK		GENMASK(27, 24)
+#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	0
+#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	BIT(14)
+#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	BIT(15)
+#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(BIT(15) | BIT(14))
+#define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
+
+#define CSC0_CTRL_CSC_MODE_MASK		GENMASK(2, 1)
+#define CSC0_CTRL_BYPASS		BIT(0)
+
+#define CSC0_COEF0_A2_MASK		GENMASK(26, 16)
+#define CSC0_COEF0_A1_MASK		GENMASK(10, 0)
+
+#define CSC0_COEF1_B1_MASK		GENMASK(26, 16)
+#define CSC0_COEF1_A3_MASK		GENMASK(10, 0)
+
+#define CSC0_COEF2_B3_MASK		GENMASK(26, 16)
+#define CSC0_COEF2_B2_MASK		GENMASK(10, 0)
+
+#define CSC0_COEF3_C2_MASK		GENMASK(26, 16)
+#define CSC0_COEF3_C1_MASK		GENMASK(10, 0)
+
+#define CSC0_COEF4_D1_MASK		GENMASK(24, 16)
+#define CSC0_COEF4_C3_MASK		GENMASK(10, 0)
+
+#define CSC0_COEF5_D3_MASK		GENMASK(24, 16)
+#define CSC0_COEF5_D2_MASK		GENMASK(8, 0)
+
+#define PANIC0_THRES_LOW_MASK		GENMASK(24, 16)
+#define PANIC0_THRES_HIGH_MASK		GENMASK(8, 0)
+
 #define MXSFB_MIN_XRES			120
 #define MXSFB_MIN_YRES			120
 #define MXSFB_MAX_XRES			0xffff
-- 
2.34.1

