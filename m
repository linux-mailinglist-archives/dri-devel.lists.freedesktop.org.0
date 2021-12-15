Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A84764CC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE3310FADB;
	Wed, 15 Dec 2021 21:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543AE10FADB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:47:45 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFHGe5Z009721;
 Wed, 15 Dec 2021 22:47:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=AeSey6slxSkNuNtvNVxQJC0kbdjpw+ypvzgm8JzDZgI=;
 b=2rS0jZDTS1MZwmSHRmtF13NDWx2Nb3LyGtPvjYo2qzwNFTica8LxyK7SkDCsA7+rOcK4
 e2WXufIqFQINQxxXiW98hfhYkjOUWeXxWfi1daDmRJrTIZfp1mYGWxroiJmlqMNKRBc5
 9OZkfywTf+uJT3O9jG2ubBV95gyNScKdL2HNrWth5ztwQ7CAm+NrL5lwBATkkCFqVq9F
 nT9F0/82QkVn3MGjRfAZBqH4oK45t74+49fipDwsiVU34/y+EDJXJbJmwpbDH9/j2Vib
 d8p0u3yS2TbnLBO4uW6++qBowc2+msYNUTqKUpWlD9zJJbz4bEjryv8ZgbbALdRqe712 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cyasncwpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 22:47:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AFDA9100034;
 Wed, 15 Dec 2021 22:47:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A8CF820A74F;
 Wed, 15 Dec 2021 22:47:40 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 22:47:40
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] drm/stm: ltdc: switch to regmap
Date: Wed, 15 Dec 2021 22:47:38 +0100
Message-ID: <20211215214738.19946-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the legacy register access by regmap API.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 138 ++++++++++++++++++-------------------
 drivers/gpu/drm/stm/ltdc.h |   1 +
 2 files changed, 68 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index c0619f372630..8dad3d00aa5c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -18,6 +18,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include <drm/drm_atomic.h>
@@ -343,31 +344,14 @@ static const u64 ltdc_format_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
-static inline u32 reg_read(void __iomem *base, u32 reg)
-{
-	return readl_relaxed(base + reg);
-}
-
-static inline void reg_write(void __iomem *base, u32 reg, u32 val)
-{
-	writel_relaxed(val, base + reg);
-}
-
-static inline void reg_set(void __iomem *base, u32 reg, u32 mask)
-{
-	reg_write(base, reg, reg_read(base, reg) | mask);
-}
-
-static inline void reg_clear(void __iomem *base, u32 reg, u32 mask)
-{
-	reg_write(base, reg, reg_read(base, reg) & ~mask);
-}
-
-static inline void reg_update_bits(void __iomem *base, u32 reg, u32 mask,
-				   u32 val)
-{
-	reg_write(base, reg, (reg_read(base, reg) & ~mask) | val);
-}
+static const struct regmap_config stm32_ltdc_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = sizeof(u32),
+	.max_register = 0x400,
+	.use_relaxed_mmio = true,
+	.cache_type = REGCACHE_NONE,
+};
 
 static inline struct ltdc_device *crtc_to_ltdc(struct drm_crtc *crtc)
 {
@@ -494,9 +478,13 @@ static irqreturn_t ltdc_irq(int irq, void *arg)
 	struct drm_device *ddev = arg;
 	struct ltdc_device *ldev = ddev->dev_private;
 
-	/* Read & Clear the interrupt status */
-	ldev->irq_status = reg_read(ldev->regs, LTDC_ISR);
-	reg_write(ldev->regs, LTDC_ICR, ldev->irq_status);
+	/*
+	 *  Read & Clear the interrupt status
+	 *  In order to write / read registers in this critical section
+	 *  very quickly, the regmap functions are not used.
+	 */
+	ldev->irq_status = readl_relaxed(ldev->regs + LTDC_ISR);
+	writel_relaxed(ldev->irq_status, ldev->regs + LTDC_ICR);
 
 	return IRQ_WAKE_THREAD;
 }
@@ -520,7 +508,7 @@ static void ltdc_crtc_update_clut(struct drm_crtc *crtc)
 	for (i = 0; i < CLUT_SIZE; i++, lut++) {
 		val = ((lut->red << 8) & 0xff0000) | (lut->green & 0xff00) |
 			(lut->blue >> 8) | (i << 24);
-		reg_write(ldev->regs, LTDC_L1CLUTWR, val);
+		regmap_write(ldev->regmap, LTDC_L1CLUTWR, val);
 	}
 }
 
@@ -535,13 +523,13 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 	pm_runtime_get_sync(ddev->dev);
 
 	/* Sets the background color value */
-	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
+	regmap_write(ldev->regmap, LTDC_BCCR, BCCR_BCBLACK);
 
 	/* Enable IRQ */
-	reg_set(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
+	regmap_set_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
 
 	/* Commit shadow registers = update planes at next vblank */
-	reg_set(ldev->regs, LTDC_SRCR, SRCR_VBR);
+	regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_VBR);
 
 	drm_crtc_vblank_on(crtc);
 }
@@ -557,10 +545,10 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *crtc,
 	drm_crtc_vblank_off(crtc);
 
 	/* disable IRQ */
-	reg_clear(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
+	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
 
 	/* immediately commit disable of layers before switching off LTDC */
-	reg_set(ldev->regs, LTDC_SRCR, SRCR_IMR);
+	regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_IMR);
 
 	pm_runtime_put_sync(ddev->dev);
 }
@@ -708,26 +696,26 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		val |= GCR_PCPOL;
 
-	reg_update_bits(ldev->regs, LTDC_GCR,
-			GCR_HSPOL | GCR_VSPOL | GCR_DEPOL | GCR_PCPOL, val);
+	regmap_update_bits(ldev->regmap, LTDC_GCR,
+			   GCR_HSPOL | GCR_VSPOL | GCR_DEPOL | GCR_PCPOL, val);
 
 	/* Set Synchronization size */
 	val = (hsync << 16) | vsync;
-	reg_update_bits(ldev->regs, LTDC_SSCR, SSCR_VSH | SSCR_HSW, val);
+	regmap_update_bits(ldev->regmap, LTDC_SSCR, SSCR_VSH | SSCR_HSW, val);
 
 	/* Set Accumulated Back porch */
 	val = (accum_hbp << 16) | accum_vbp;
-	reg_update_bits(ldev->regs, LTDC_BPCR, BPCR_AVBP | BPCR_AHBP, val);
+	regmap_update_bits(ldev->regmap, LTDC_BPCR, BPCR_AVBP | BPCR_AHBP, val);
 
 	/* Set Accumulated Active Width */
 	val = (accum_act_w << 16) | accum_act_h;
-	reg_update_bits(ldev->regs, LTDC_AWCR, AWCR_AAW | AWCR_AAH, val);
+	regmap_update_bits(ldev->regmap, LTDC_AWCR, AWCR_AAW | AWCR_AAH, val);
 
 	/* Set total width & height */
 	val = (total_width << 16) | total_height;
-	reg_update_bits(ldev->regs, LTDC_TWCR, TWCR_TOTALH | TWCR_TOTALW, val);
+	regmap_update_bits(ldev->regmap, LTDC_TWCR, TWCR_TOTALH | TWCR_TOTALW, val);
 
-	reg_write(ldev->regs, LTDC_LIPCR, (accum_act_h + 1));
+	regmap_write(ldev->regmap, LTDC_LIPCR, (accum_act_h + 1));
 }
 
 static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -742,7 +730,7 @@ static void ltdc_crtc_atomic_flush(struct drm_crtc *crtc,
 	ltdc_crtc_update_clut(crtc);
 
 	/* Commit shadow registers = update planes at next vblank */
-	reg_set(ldev->regs, LTDC_SRCR, SRCR_VBR);
+	regmap_set_bits(ldev->regmap, LTDC_SRCR, SRCR_VBR);
 
 	if (event) {
 		crtc->state->event = NULL;
@@ -784,10 +772,14 @@ static bool ltdc_crtc_get_scanout_position(struct drm_crtc *crtc,
 	 * simplify the code and only test if line > vactive_end
 	 */
 	if (pm_runtime_active(ddev->dev)) {
-		line = reg_read(ldev->regs, LTDC_CPSR) & CPSR_CYPOS;
-		vactive_start = reg_read(ldev->regs, LTDC_BPCR) & BPCR_AVBP;
-		vactive_end = reg_read(ldev->regs, LTDC_AWCR) & AWCR_AAH;
-		vtotal = reg_read(ldev->regs, LTDC_TWCR) & TWCR_TOTALH;
+		regmap_read(ldev->regmap, LTDC_CPSR, &line);
+		line &= CPSR_CYPOS;
+		regmap_read(ldev->regmap, LTDC_BPCR, &vactive_start);
+		vactive_start &= BPCR_AVBP;
+		regmap_read(ldev->regmap, LTDC_AWCR, &vactive_end);
+		vactive_end &= AWCR_AAH;
+		regmap_read(ldev->regmap, LTDC_TWCR, &vtotal);
+		vtotal &= TWCR_TOTALH;
 
 		if (line > vactive_end)
 			*vpos = line - vtotal - vactive_start;
@@ -823,7 +815,7 @@ static int ltdc_crtc_enable_vblank(struct drm_crtc *crtc)
 	DRM_DEBUG_DRIVER("\n");
 
 	if (state->enable)
-		reg_set(ldev->regs, LTDC_IER, IER_LIE);
+		regmap_set_bits(ldev->regmap, LTDC_IER, IER_LIE);
 	else
 		return -EPERM;
 
@@ -835,7 +827,7 @@ static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
 
 	DRM_DEBUG_DRIVER("\n");
-	reg_clear(ldev->regs, LTDC_IER, IER_LIE);
+	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE);
 }
 
 static const struct drm_crtc_funcs ltdc_crtc_funcs = {
@@ -913,19 +905,20 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			 newstate->crtc_w, newstate->crtc_h,
 			 newstate->crtc_x, newstate->crtc_y);
 
-	bpcr = reg_read(ldev->regs, LTDC_BPCR);
+	regmap_read(ldev->regmap, LTDC_BPCR, &bpcr);
+
 	ahbp = (bpcr & BPCR_AHBP) >> 16;
 	avbp = bpcr & BPCR_AVBP;
 
 	/* Configures the horizontal start and stop position */
 	val = ((x1 + 1 + ahbp) << 16) + (x0 + 1 + ahbp);
-	reg_update_bits(ldev->regs, LTDC_L1WHPCR + lofs,
-			LXWHPCR_WHSTPOS | LXWHPCR_WHSPPOS, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1WHPCR + lofs,
+			  LXWHPCR_WHSTPOS | LXWHPCR_WHSPPOS, val);
 
 	/* Configures the vertical start and stop position */
 	val = ((y1 + 1 + avbp) << 16) + (y0 + 1 + avbp);
-	reg_update_bits(ldev->regs, LTDC_L1WVPCR + lofs,
-			LXWVPCR_WVSTPOS | LXWVPCR_WVSPPOS, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1WVPCR + lofs,
+			  LXWVPCR_WVSTPOS | LXWVPCR_WVSPPOS, val);
 
 	/* Specifies the pixel format */
 	pf = to_ltdc_pixelformat(fb->format->format);
@@ -938,19 +931,18 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			  (char *)&fb->format->format);
 		val = 0;	/* set by default ARGB 32 bits */
 	}
-	reg_update_bits(ldev->regs, LTDC_L1PFCR + lofs, LXPFCR_PF, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1PFCR + lofs, LXPFCR_PF, val);
 
 	/* Configures the color frame buffer pitch in bytes & line length */
 	pitch_in_bytes = fb->pitches[0];
 	line_length = fb->format->cpp[0] *
 		      (x1 - x0 + 1) + (ldev->caps.bus_width >> 3) - 1;
 	val = ((pitch_in_bytes << 16) | line_length);
-	reg_update_bits(ldev->regs, LTDC_L1CFBLR + lofs,
-			LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1CFBLR + lofs, LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
 
 	/* Specifies the constant alpha value */
 	val = newstate->alpha >> 8;
-	reg_update_bits(ldev->regs, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
 
 	/* Specifies the blending factors */
 	val = BF1_PAXCA | BF2_1PAXCA;
@@ -962,24 +954,22 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	    plane->type != DRM_PLANE_TYPE_PRIMARY)
 		val = BF1_PAXCA | BF2_1PAXCA;
 
-	reg_update_bits(ldev->regs, LTDC_L1BFCR + lofs,
-			LXBFCR_BF2 | LXBFCR_BF1, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1BFCR + lofs, LXBFCR_BF2 | LXBFCR_BF1, val);
 
 	/* Configures the frame buffer line number */
 	val = y1 - y0 + 1;
-	reg_update_bits(ldev->regs, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, val);
 
 	/* Sets the FB address */
 	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
 
 	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
-	reg_write(ldev->regs, LTDC_L1CFBAR + lofs, paddr);
+	regmap_write(ldev->regmap, LTDC_L1CFBAR + lofs, paddr);
 
 	/* Enable layer and CLUT if needed */
 	val = fb->format->format == DRM_FORMAT_C8 ? LXCR_CLUTEN : 0;
 	val |= LXCR_LEN;
-	reg_update_bits(ldev->regs, LTDC_L1CR + lofs,
-			LXCR_LEN | LXCR_CLUTEN, val);
+	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN, val);
 
 	ldev->plane_fpsi[plane->index].counter++;
 
@@ -1004,7 +994,7 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
 	u32 lofs = plane->index * LAY_OFS;
 
 	/* disable layer */
-	reg_clear(ldev->regs, LTDC_L1CR + lofs, LXCR_LEN);
+	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN, 0);
 
 	DRM_DEBUG_DRIVER("CRTC:%d plane:%d\n",
 			 oldstate->crtc->base.id, plane->base.id);
@@ -1172,7 +1162,7 @@ static void ltdc_encoder_disable(struct drm_encoder *encoder)
 	DRM_DEBUG_DRIVER("\n");
 
 	/* Disable LTDC */
-	reg_clear(ldev->regs, LTDC_GCR, GCR_LTDCEN);
+	regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_LTDCEN);
 
 	/* Set to sleep state the pinctrl whatever type of encoder */
 	pinctrl_pm_select_sleep_state(ddev->dev);
@@ -1186,7 +1176,7 @@ static void ltdc_encoder_enable(struct drm_encoder *encoder)
 	DRM_DEBUG_DRIVER("\n");
 
 	/* Enable LTDC */
-	reg_set(ldev->regs, LTDC_GCR, GCR_LTDCEN);
+	regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_LTDCEN);
 }
 
 static void ltdc_encoder_mode_set(struct drm_encoder *encoder,
@@ -1249,15 +1239,15 @@ static int ltdc_get_caps(struct drm_device *ddev)
 	 * at least 1 layer must be managed & the number of layers
 	 * must not exceed LTDC_MAX_LAYER
 	 */
-	lcr = reg_read(ldev->regs, LTDC_LCR);
+	regmap_read(ldev->regmap, LTDC_LCR, &lcr);
 
 	ldev->caps.nb_layers = clamp((int)lcr, 1, LTDC_MAX_LAYER);
 
 	/* set data bus width */
-	gc2r = reg_read(ldev->regs, LTDC_GC2R);
+	regmap_read(ldev->regmap, LTDC_GC2R, &gc2r);
 	bus_width_log2 = (gc2r & GC2R_BW) >> 4;
 	ldev->caps.bus_width = 8 << bus_width_log2;
-	ldev->caps.hw_version = reg_read(ldev->regs, LTDC_IDR);
+	regmap_read(ldev->regmap, LTDC_IDR, &ldev->caps.hw_version);
 
 	switch (ldev->caps.hw_version) {
 	case HWVER_10200:
@@ -1410,9 +1400,15 @@ int ltdc_load(struct drm_device *ddev)
 		goto err;
 	}
 
+	ldev->regmap = devm_regmap_init_mmio(&pdev->dev, ldev->regs, &stm32_ltdc_regmap_cfg);
+	if (IS_ERR(ldev->regmap)) {
+		DRM_ERROR("Unable to regmap ltdc registers\n");
+		ret = PTR_ERR(ldev->regmap);
+		goto err;
+	}
+
 	/* Disable interrupts */
-	reg_clear(ldev->regs, LTDC_IER,
-		  IER_LIE | IER_RRIE | IER_FUIE | IER_TERRIE);
+	regmap_clear_bits(ldev->regmap, LTDC_IER, IER_LIE | IER_RRIE | IER_FUIE | IER_TERRIE);
 
 	ret = ltdc_get_caps(ddev);
 	if (ret) {
diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
index 55a125f89af6..20b3dcc7817b 100644
--- a/drivers/gpu/drm/stm/ltdc.h
+++ b/drivers/gpu/drm/stm/ltdc.h
@@ -32,6 +32,7 @@ struct fps_info {
 
 struct ltdc_device {
 	void __iomem *regs;
+	struct regmap *regmap;
 	struct clk *pixel_clk;	/* lcd pixel clock */
 	struct mutex err_lock;	/* protecting error_status */
 	struct ltdc_caps caps;
-- 
2.17.1

