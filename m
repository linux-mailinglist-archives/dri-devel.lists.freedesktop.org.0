Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439878B012B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 07:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853B1137E0;
	Wed, 24 Apr 2024 05:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="IVstQW2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 24 Apr 2024 05:41:56 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10F1137DE
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713937316; x=1745473316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EuVGUu/ifmIFckfnMtfHp7EGBijO45to8Ufj/cJOH70=;
 b=IVstQW2OdvyDqhKAlZGiQosqKhWo8tol8FboY4JQTqFe2neUnFUKnpyW
 XoH31vNwGmZmIUVRdIsRFyYjoIlccmDCWqOJaKZtEK9Dhgy/OqzaX1+p5
 +HzNcj3VyZRWw7IHjxNREN1F0eSYF7QwIgun4ET5KF9pwf56dudpQU9rh
 0ahpJUEQVaeMN3DuG+njbV/EPfyTLUKXGbach2fJ9Jc89kISfTTvUfCpQ
 uVCrf2MEAq4uQ/UOJsa3OamiADiI4FOYXdQMOGbHJyeW7iKDTa9yajXAD
 f5BJB7kZAjviTNIgAaY/BreG2nsLoKA6XaGVDdfLnNtwSWeMkBwg+cXGV w==;
X-CSE-ConnectionGUID: PbptyM/7SruTa7hfwyXEEg==
X-CSE-MsgGUID: qBctvGaGTSOztcO63x8E1w==
X-IronPort-AV: E=Sophos;i="6.07,225,1708412400"; d="scan'208";a="22373246"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Apr 2024 22:34:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 22:34:30 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 22:34:22 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Dharma.B@microchip.com>, <Varshini.Rajendran@microchip.com>,
 <Balakrishnan.S@microchip.com>, <Charan.Pedumuru@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH RESEND v9 1/8] drm: atmel-hlcdc: add driver ops to
 differentiate HLCDC and XLCDC IP
Date: Wed, 24 Apr 2024 11:03:44 +0530
Message-ID: <20240424053351.589830-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424053351.589830-1-manikandan.m@microchip.com>
References: <20240424053351.589830-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add LCD IP specific ops in driver data to differentiate
HLCDC and XLCDC code within the atmel-hlcdc driver files.
XLCDC in SAM9X7 has different sets of registers and additional
configuration bits when compared to previous HLCDC IP. Read/write
operation on the controller register and functionality is now
separated using the LCD IP specific ops.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   5 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |  83 ++++++---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 167 +++++++++++-------
 3 files changed, 172 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 84c54e8622d1..b09df821cbc0 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -58,6 +58,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_at91sam9n12 = {
 	.conflicting_output_formats = true,
 	.nlayers = ARRAY_SIZE(atmel_hlcdc_at91sam9n12_layers),
 	.layers = atmel_hlcdc_at91sam9n12_layers,
+	.ops = &atmel_hlcdc_ops,
 };
 
 static const struct atmel_hlcdc_layer_desc atmel_hlcdc_at91sam9x5_layers[] = {
@@ -151,6 +152,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_at91sam9x5 = {
 	.conflicting_output_formats = true,
 	.nlayers = ARRAY_SIZE(atmel_hlcdc_at91sam9x5_layers),
 	.layers = atmel_hlcdc_at91sam9x5_layers,
+	.ops = &atmel_hlcdc_ops,
 };
 
 static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sama5d3_layers[] = {
@@ -269,6 +271,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sama5d3 = {
 	.conflicting_output_formats = true,
 	.nlayers = ARRAY_SIZE(atmel_hlcdc_sama5d3_layers),
 	.layers = atmel_hlcdc_sama5d3_layers,
+	.ops = &atmel_hlcdc_ops,
 };
 
 static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sama5d4_layers[] = {
@@ -364,6 +367,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sama5d4 = {
 	.max_hpw = 0x3ff,
 	.nlayers = ARRAY_SIZE(atmel_hlcdc_sama5d4_layers),
 	.layers = atmel_hlcdc_sama5d4_layers,
+	.ops = &atmel_hlcdc_ops,
 };
 
 static const struct atmel_hlcdc_layer_desc atmel_hlcdc_sam9x60_layers[] = {
@@ -460,6 +464,7 @@ static const struct atmel_hlcdc_dc_desc atmel_hlcdc_dc_sam9x60 = {
 	.fixed_clksrc = true,
 	.nlayers = ARRAY_SIZE(atmel_hlcdc_sam9x60_layers),
 	.layers = atmel_hlcdc_sam9x60_layers,
+	.ops = &atmel_hlcdc_ops,
 };
 
 static const struct of_device_id atmel_hlcdc_of_match[] = {
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index 5b5c774e0edf..d0ecf0f58cce 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -288,6 +288,63 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
 	return container_of(layer, struct atmel_hlcdc_plane, layer);
 }
 
+/**
+ * struct atmel_hlcdc_dc - Atmel HLCDC Display Controller.
+ * @desc: HLCDC Display Controller description
+ * @dscrpool: DMA coherent pool used to allocate DMA descriptors
+ * @hlcdc: pointer to the atmel_hlcdc structure provided by the MFD device
+ * @crtc: CRTC provided by the display controller
+ * @layers: active HLCDC layers
+ * @suspend: used to store the HLCDC state when entering suspend
+ * @suspend.imr: used to read/write LCDC Interrupt Mask Register
+ * @suspend.state: Atomic commit structure
+ */
+struct atmel_hlcdc_dc {
+	const struct atmel_hlcdc_dc_desc *desc;
+	struct dma_pool *dscrpool;
+	struct atmel_hlcdc *hlcdc;
+	struct drm_crtc *crtc;
+	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
+	struct {
+		u32 imr;
+		struct drm_atomic_state *state;
+	} suspend;
+};
+
+struct atmel_hlcdc_plane_state;
+
+/**
+ * struct atmel_lcdc_dc_ops - describes atmel_lcdc ops group
+ * to differentiate HLCDC and XLCDC IP code support
+ * @plane_setup_scaler: update the vertical and horizontal scaling factors
+ * @update_lcdc_buffers: update the each LCDC layers DMA registers
+ * @lcdc_atomic_disable: disable LCDC interrupts and layers
+ * @lcdc_update_general_settings: update each LCDC layers general
+ * configuration register
+ * @lcdc_atomic_update: enable the LCDC layers and interrupts
+ * @lcdc_csc_init: update the color space conversion co-efficient of
+ * High-end overlay register
+ * @lcdc_irq_dbg: to raise alert incase of interrupt overrun in any LCDC layer
+ */
+struct atmel_lcdc_dc_ops {
+	void (*plane_setup_scaler)(struct atmel_hlcdc_plane *plane,
+				   struct atmel_hlcdc_plane_state *state);
+	void (*lcdc_update_buffers)(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_plane_state *state,
+				    u32 sr, int i);
+	void (*lcdc_atomic_disable)(struct atmel_hlcdc_plane *plane);
+	void (*lcdc_update_general_settings)(struct atmel_hlcdc_plane *plane,
+					     struct atmel_hlcdc_plane_state *state);
+	void (*lcdc_atomic_update)(struct atmel_hlcdc_plane *plane,
+				   struct atmel_hlcdc_dc *dc);
+	void (*lcdc_csc_init)(struct atmel_hlcdc_plane *plane,
+			      const struct atmel_hlcdc_layer_desc *desc);
+	void (*lcdc_irq_dbg)(struct atmel_hlcdc_plane *plane,
+			     const struct atmel_hlcdc_layer_desc *desc);
+};
+
+extern const struct atmel_lcdc_dc_ops atmel_hlcdc_ops;
+
 /**
  * Atmel HLCDC Display Controller description structure.
  *
@@ -306,6 +363,7 @@ atmel_hlcdc_layer_to_plane(struct atmel_hlcdc_layer *layer)
  * @fixed_clksrc: true if clock source is fixed
  * @layers: a layer description table describing available layers
  * @nlayers: layer description table size
+ * @ops: atmel lcdc dc ops
  */
 struct atmel_hlcdc_dc_desc {
 	int min_width;
@@ -319,30 +377,7 @@ struct atmel_hlcdc_dc_desc {
 	bool fixed_clksrc;
 	const struct atmel_hlcdc_layer_desc *layers;
 	int nlayers;
-};
-
-/**
- * Atmel HLCDC Display Controller.
- *
- * @desc: HLCDC Display Controller description
- * @dscrpool: DMA coherent pool used to allocate DMA descriptors
- * @hlcdc: pointer to the atmel_hlcdc structure provided by the MFD device
- * @fbdev: framebuffer device attached to the Display Controller
- * @crtc: CRTC provided by the display controller
- * @planes: instantiated planes
- * @layers: active HLCDC layers
- * @suspend: used to store the HLCDC state when entering suspend
- */
-struct atmel_hlcdc_dc {
-	const struct atmel_hlcdc_dc_desc *desc;
-	struct dma_pool *dscrpool;
-	struct atmel_hlcdc *hlcdc;
-	struct drm_crtc *crtc;
-	struct atmel_hlcdc_layer *layers[ATMEL_HLCDC_MAX_LAYERS];
-	struct {
-		u32 imr;
-		struct drm_atomic_state *state;
-	} suspend;
+	const struct atmel_lcdc_dc_ops *ops;
 };
 
 extern struct atmel_hlcdc_formats atmel_hlcdc_plane_rgb_formats;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index daa508504f47..9db66df8b0e4 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -282,8 +282,9 @@ atmel_hlcdc_plane_scaler_set_phicoeff(struct atmel_hlcdc_plane *plane,
 					    coeff_tab[i]);
 }
 
-static void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
-					   struct atmel_hlcdc_plane_state *state)
+static
+void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_plane_state *state)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
 	u32 xfactor, yfactor;
@@ -335,6 +336,7 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
 				      struct atmel_hlcdc_plane_state *state)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 
 	if (desc->layout.size)
 		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.size,
@@ -352,12 +354,12 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
 					ATMEL_HLCDC_LAYER_POS(state->crtc_x,
 							      state->crtc_y));
 
-	atmel_hlcdc_plane_setup_scaler(plane, state);
+	dc->desc->ops->plane_setup_scaler(plane, state);
 }
 
-static void
-atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
-					struct atmel_hlcdc_plane_state *state)
+static
+void atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
+					       struct atmel_hlcdc_plane_state *state)
 {
 	unsigned int cfg = ATMEL_HLCDC_LAYER_DMA_BLEN_INCR16 | state->ahb_id;
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
@@ -437,10 +439,33 @@ static void atmel_hlcdc_plane_update_clut(struct atmel_hlcdc_plane *plane,
 	}
 }
 
+static void atmel_hlcdc_update_buffers(struct atmel_hlcdc_plane *plane,
+				       struct atmel_hlcdc_plane_state *state,
+				       u32 sr, int i)
+{
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
+				    state->dscrs[i]->self);
+
+	if (sr & ATMEL_HLCDC_LAYER_EN)
+		return;
+
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
+				    state->dscrs[i]->addr);
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
+				    state->dscrs[i]->ctrl);
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
+				    state->dscrs[i]->self);
+}
+
 static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
-					struct atmel_hlcdc_plane_state *state)
+					     struct atmel_hlcdc_plane_state *state)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 	struct drm_framebuffer *fb = state->base.fb;
 	u32 sr;
 	int i;
@@ -452,21 +477,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 
 		state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
 
-		atmel_hlcdc_layer_write_reg(&plane->layer,
-					    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
-					    state->dscrs[i]->self);
-
-		if (!(sr & ATMEL_HLCDC_LAYER_EN)) {
-			atmel_hlcdc_layer_write_reg(&plane->layer,
-					ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
-					state->dscrs[i]->addr);
-			atmel_hlcdc_layer_write_reg(&plane->layer,
-					ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
-					state->dscrs[i]->ctrl);
-			atmel_hlcdc_layer_write_reg(&plane->layer,
-					ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
-					state->dscrs[i]->self);
-		}
+		dc->desc->ops->lcdc_update_buffers(plane, state, sr, i);
 
 		if (desc->layout.xstride[i])
 			atmel_hlcdc_layer_write_cfg(&plane->layer,
@@ -712,11 +723,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	return 0;
 }
 
-static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
-					     struct drm_atomic_state *state)
+static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
 {
-	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
-
 	/* Disable interrupts */
 	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
 				    0xffffffff);
@@ -731,6 +739,34 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
 }
 
+static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
+					     struct drm_atomic_state *state)
+{
+	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
+
+	dc->desc->ops->lcdc_atomic_disable(plane);
+}
+
+static void atmel_hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
+				      struct atmel_hlcdc_dc *dc)
+{
+	u32 sr;
+
+	/* Enable the overrun interrupts. */
+	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
+				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
+				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
+				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
+
+	/* Apply the new config at the next SOF event. */
+	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
+	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
+				    ATMEL_HLCDC_LAYER_UPDATE |
+				    (sr & ATMEL_HLCDC_LAYER_EN ?
+				    ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
+}
+
 static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 					    struct drm_atomic_state *state)
 {
@@ -739,7 +775,7 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 	struct atmel_hlcdc_plane_state *hstate =
 			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
-	u32 sr;
+	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
 
 	if (!new_s->crtc || !new_s->fb)
 		return;
@@ -750,29 +786,39 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 	}
 
 	atmel_hlcdc_plane_update_pos_and_size(plane, hstate);
-	atmel_hlcdc_plane_update_general_settings(plane, hstate);
+	dc->desc->ops->lcdc_update_general_settings(plane, hstate);
 	atmel_hlcdc_plane_update_format(plane, hstate);
 	atmel_hlcdc_plane_update_clut(plane, hstate);
 	atmel_hlcdc_plane_update_buffers(plane, hstate);
 	atmel_hlcdc_plane_update_disc_area(plane, hstate);
 
-	/* Enable the overrun interrupts. */
-	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
-				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
-				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
-				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
+	dc->desc->ops->lcdc_atomic_update(plane, dc);
+}
 
-	/* Apply the new config at the next SOF event. */
-	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
-	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
-			ATMEL_HLCDC_LAYER_UPDATE |
-			(sr & ATMEL_HLCDC_LAYER_EN ?
-			 ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
+static void atmel_hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
+				 const struct atmel_hlcdc_layer_desc *desc)
+{
+	/*
+	 * TODO: declare a "yuv-to-rgb-conv-factors" property to let
+	 * userspace modify these factors (using a BLOB property ?).
+	 */
+	static const u32 hlcdc_csc_coeffs[] = {
+		0x4c900091,
+		0x7a5f5090,
+		0x40040890
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(hlcdc_csc_coeffs); i++) {
+		atmel_hlcdc_layer_write_cfg(&plane->layer,
+					    desc->layout.csc + i,
+					    hlcdc_csc_coeffs[i]);
+	}
 }
 
 static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 
 	if (desc->type == ATMEL_HLCDC_OVERLAY_LAYER ||
 	    desc->type == ATMEL_HLCDC_CURSOR_LAYER) {
@@ -796,31 +842,16 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
 			return ret;
 	}
 
-	if (desc->layout.csc) {
-		/*
-		 * TODO: decare a "yuv-to-rgb-conv-factors" property to let
-		 * userspace modify these factors (using a BLOB property ?).
-		 */
-		atmel_hlcdc_layer_write_cfg(&plane->layer,
-					    desc->layout.csc,
-					    0x4c900091);
-		atmel_hlcdc_layer_write_cfg(&plane->layer,
-					    desc->layout.csc + 1,
-					    0x7a5f5090);
-		atmel_hlcdc_layer_write_cfg(&plane->layer,
-					    desc->layout.csc + 2,
-					    0x40040890);
-	}
+	if (desc->layout.csc)
+		dc->desc->ops->lcdc_csc_init(plane, desc);
 
 	return 0;
 }
 
-void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
+static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
+				const struct atmel_hlcdc_layer_desc *desc)
 {
-	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
-	u32 isr;
-
-	isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
+	u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
 
 	/*
 	 * There's not much we can do in case of overrun except informing
@@ -834,6 +865,24 @@ void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
 			desc->name);
 }
 
+void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
+{
+	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
+
+	dc->desc->ops->lcdc_irq_dbg(plane, desc);
+}
+
+const struct atmel_lcdc_dc_ops atmel_hlcdc_ops = {
+	.plane_setup_scaler = atmel_hlcdc_plane_setup_scaler,
+	.lcdc_update_buffers = atmel_hlcdc_update_buffers,
+	.lcdc_atomic_disable = atmel_hlcdc_atomic_disable,
+	.lcdc_update_general_settings = atmel_hlcdc_plane_update_general_settings,
+	.lcdc_atomic_update = atmel_hlcdc_atomic_update,
+	.lcdc_csc_init = atmel_hlcdc_csc_init,
+	.lcdc_irq_dbg = atmel_hlcdc_irq_dbg,
+};
+
 static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs = {
 	.atomic_check = atmel_hlcdc_plane_atomic_check,
 	.atomic_update = atmel_hlcdc_plane_atomic_update,
-- 
2.25.1

