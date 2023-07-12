Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F253274FD33
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2313410E486;
	Wed, 12 Jul 2023 02:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9C510E486
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 02:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1689129703; x=1720665703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aM8H3NFfZaRea+gp2clHQrV2rHQzMSjdWgM8ZHhOp5w=;
 b=SWSF6EfexeKiperl+e+9HkDUWkWyOrwtfincPBqgllZaknL4MWVPDKAn
 3lot9arDILDD6nqEKcHTKgXC54DguzNk+bFeiR6kfcZip3Iv12dysvTvB
 t+0mmQwovnw5yGyf8rPW6lOlbzplT0PjMfOQBFxA/nWdukcRTjGAFIg7U
 YZG+6QAINaMOESO3HJeI96I38rxbqPR9gPd2WNUjDFroZ7cerin6XUIud
 SFMMMepkXLyCDywilMexXzTmdwsk2RwgGSP5dwFvjHb7aj1ce72bfIiHA
 4W0xokiK6ogli5w1YG0CUv7P5qI69iWicCeT/6pucpOgryjxKrFeUpDKL A==;
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; d="scan'208";a="160935649"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jul 2023 19:41:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Jul 2023 19:41:35 -0700
Received: from che-lt-i67131.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 11 Jul 2023 19:41:27 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <lee@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 6/9] drm: atmel_hlcdc: Add support for XLCDC in atmel LCD
 driver
Date: Wed, 12 Jul 2023 08:10:14 +0530
Message-ID: <20230712024017.218921-7-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712024017.218921-1-manikandan.m@microchip.com>
References: <20230712024017.218921-1-manikandan.m@microchip.com>
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
Cc: Balakrishnan.S@microchip.com, Nayabbasha.Sayed@microchip.com,
 Balamanikandan.Gunasundar@microchip.com,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Varshini.Rajendran@microchip.com, Dharma.B@microchip.com,
 Durai Manickam KR <durai.manickamkr@microchip.com>,
 Hari.PrasathGE@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- XLCDC in SAM9X7 has different sets of registers and additional
configuration bits when compared to previous HLCDC IP. Read/write
operation on the controller registers is now separated using the
XLCDC status flag.
	- HEO scaling, window resampling, Alpha blending, YUV-to-RGB
conversion in XLCDC is derived and handled using additional
configuration bits and registers.
	- Writing one to the Enable fields of each layer in LCD_ATTRE
is required to reflect the values set in Configuration, FBA, Enable
registers of each layer

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Co-developed-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
Signed-off-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
Co-developed-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  32 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 337 +++++++++++++++---
 2 files changed, 312 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 58184cd6ab0b..27f86cea8bff 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -139,10 +139,10 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
 	cfg = state->output_mode << 8;
 
-	if (adj->flags & DRM_MODE_FLAG_NVSYNC)
+	if (!crtc->dc->desc->is_xlcdc && (adj->flags & DRM_MODE_FLAG_NVSYNC))
 		cfg |= ATMEL_HLCDC_VSPOL;
 
-	if (adj->flags & DRM_MODE_FLAG_NHSYNC)
+	if (!crtc->dc->desc->is_xlcdc && (adj->flags & DRM_MODE_FLAG_NHSYNC))
 		cfg |= ATMEL_HLCDC_HSPOL;
 
 	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(5),
@@ -177,6 +177,20 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 
 	pm_runtime_get_sync(dev->dev);
 
+	if (crtc->dc->desc->is_xlcdc) {
+		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_CM);
+		if (!regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					      !(status & ATMEL_XLCDC_CM), 10,
+					      0))
+			cpu_relax();
+
+		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
+		if (!regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					      status & ATMEL_XLCDC_SD, 10,
+					      0))
+			cpu_relax();
+	}
+
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
 	while (!regmap_read(regmap, ATMEL_HLCDC_SR, &status) &&
 	       (status & ATMEL_HLCDC_DISP))
@@ -231,6 +245,20 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 	       !(status & ATMEL_HLCDC_DISP))
 		cpu_relax();
 
+	if (crtc->dc->desc->is_xlcdc) {
+		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
+		if (!regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					      status & ATMEL_XLCDC_CM, 10,
+					      0))
+			cpu_relax();
+
+		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
+		if (!regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					      !(status & ATMEL_XLCDC_SD), 10,
+					      0))
+			cpu_relax();
+	}
+
 	pm_runtime_put_sync(dev->dev);
 
 }
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index daa508504f47..81f103b1a51f 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -330,11 +330,59 @@ static void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
 								     yfactor));
 }
 
+static void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
+					   struct atmel_hlcdc_plane_state *state)
+{
+	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	u32 xfactor, yfactor;
+
+	if (!desc->layout.scaler_config)
+		return;
+
+	if (state->crtc_w == state->src_w && state->crtc_h == state->src_h) {
+		atmel_hlcdc_layer_write_cfg(&plane->layer,
+					    desc->layout.scaler_config, 0);
+		return;
+	}
+
+	/* xfactor = round[(2^20 * XMEMSIZE)/XSIZE)] */
+	xfactor = (1048576 * state->src_w) / state->crtc_w;
+
+	/* yfactor = round[(2^20 * YMEMSIZE)/YSIZE)] */
+	yfactor = (1048576 * state->src_h) / state->crtc_h;
+
+	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config,
+				    ATMEL_XLCDC_LAYER_VSCALER_LUMA_ENABLE |
+				    ATMEL_XLCDC_LAYER_VSCALER_CHROMA_ENABLE |
+				    ATMEL_XLCDC_LAYER_HSCALER_LUMA_ENABLE |
+				    ATMEL_XLCDC_LAYER_HSCALER_CHROMA_ENABLE);
+
+	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 1,
+				    yfactor);
+	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 3,
+				    xfactor);
+
+	/* As per YCbCr window resampling configuration */
+	if (state->base.fb->format->format == DRM_FORMAT_YUV420) {
+		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
+					    yfactor / 2);
+		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 4,
+					    xfactor / 2);
+	} else {
+		/* As per ARGB window resampling configuration */
+		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
+					    yfactor);
+		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 4,
+					    xfactor);
+	}
+}
+
 static void
 atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
 				      struct atmel_hlcdc_plane_state *state)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 
 	if (desc->layout.size)
 		atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.size,
@@ -352,7 +400,10 @@ atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
 					ATMEL_HLCDC_LAYER_POS(state->crtc_x,
 							      state->crtc_y));
 
-	atmel_hlcdc_plane_setup_scaler(plane, state);
+	if (dc->desc->is_xlcdc)
+		atmel_xlcdc_plane_setup_scaler(plane, state);
+	else
+		atmel_hlcdc_plane_setup_scaler(plane, state);
 }
 
 static void
@@ -393,6 +444,40 @@ atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
 				    cfg);
 }
 
+static void
+atmel_xlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
+					  struct atmel_hlcdc_plane_state *state)
+{
+	unsigned int cfg;
+	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	const struct drm_format_info *format = state->base.fb->format;
+
+	atmel_hlcdc_layer_write_cfg(&plane->layer, ATMEL_XLCDC_LAYER_DMA_CFG,
+				    ATMEL_HLCDC_LAYER_DMA_BLEN_INCR16 | state->ahb_id);
+
+	cfg = ATMEL_XLCDC_LAYER_DMA | ATMEL_XLCDC_LAYER_REP;
+
+	if (plane->base.type != DRM_PLANE_TYPE_PRIMARY) {
+		/*
+		 * Alpha Blending bits specific to SAM9X7 SoC
+		 */
+		cfg |= ATMEL_XLCDC_LAYER_SFACTC_A0_MULT_AS |
+		       ATMEL_XLCDC_LAYER_SFACTA_ONE |
+		       ATMEL_XLCDC_LAYER_DFACTC_M_A0_MULT_AS |
+		       ATMEL_XLCDC_LAYER_DFACTA_ONE;
+		if (format->has_alpha)
+			cfg |= ATMEL_XLCDC_LAYER_A0(0xff);
+		else
+			cfg |= ATMEL_XLCDC_LAYER_A0(state->base.alpha);
+	}
+
+	if (state->disc_h && state->disc_w)
+		cfg |= ATMEL_XLCDC_LAYER_DISCEN;
+
+	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.general_config,
+				    cfg);
+}
+
 static void atmel_hlcdc_plane_update_format(struct atmel_hlcdc_plane *plane,
 					struct atmel_hlcdc_plane_state *state)
 {
@@ -437,36 +522,55 @@ static void atmel_hlcdc_plane_update_clut(struct atmel_hlcdc_plane *plane,
 	}
 }
 
+static void update_hlcdc_buffers(struct atmel_hlcdc_plane *plane,
+				 struct atmel_hlcdc_plane_state *state, u32 sr, int i)
+{
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
+				    state->dscrs[i]->self);
+
+	if (!(sr & ATMEL_HLCDC_LAYER_EN)) {
+		atmel_hlcdc_layer_write_reg(&plane->layer,
+					    ATMEL_HLCDC_LAYER_PLANE_ADDR(i),
+					    state->dscrs[i]->addr);
+		atmel_hlcdc_layer_write_reg(&plane->layer,
+					    ATMEL_HLCDC_LAYER_PLANE_CTRL(i),
+					    state->dscrs[i]->ctrl);
+		atmel_hlcdc_layer_write_reg(&plane->layer,
+					    ATMEL_HLCDC_LAYER_PLANE_NEXT(i),
+					    state->dscrs[i]->self);
+	}
+}
+
+static void update_xlcdc_buffers(struct atmel_hlcdc_plane *plane,
+				 struct atmel_hlcdc_plane_state *state, int i)
+{
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_XLCDC_LAYER_PLANE_ADDR(i),
+				    state->dscrs[i]->addr);
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
 
-	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
+	if (!dc->desc->is_xlcdc)
+		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
 
 	for (i = 0; i < state->nplanes; i++) {
 		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
 
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
+		if (dc->desc->is_xlcdc)
+			update_xlcdc_buffers(plane, state, i);
+		else
+			update_hlcdc_buffers(plane, state, sr, i);
 
 		if (desc->layout.xstride[i])
 			atmel_hlcdc_layer_write_cfg(&plane->layer,
@@ -712,11 +816,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
 	return 0;
 }
 
-static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
-					     struct drm_atomic_state *state)
+static void hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
 {
-	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
-
 	/* Disable interrupts */
 	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IDR,
 				    0xffffffff);
@@ -731,6 +832,72 @@ static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
 }
 
+static void xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
+{
+	/* Disable interrupts */
+	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IDR,
+				    0xffffffff);
+
+	/* Disable the layer */
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_XLCDC_LAYER_ENR, 0);
+
+	/* Clear all pending interrupts */
+	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
+}
+
+static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
+					     struct drm_atomic_state *state)
+{
+	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
+
+	if (dc->desc->is_xlcdc)
+		xlcdc_atomic_disable(plane);
+	else
+		hlcdc_atomic_disable(plane);
+}
+
+static void hlcdc_atomic_update(struct atmel_hlcdc_plane *plane)
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
+static void xlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
+				struct atmel_hlcdc_dc *dc)
+{
+	/* Enable the overrun interrupts. */
+	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_IER,
+				    ATMEL_XLCDC_LAYER_OVR_IRQ(0) |
+				    ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
+				    ATMEL_XLCDC_LAYER_OVR_IRQ(2));
+
+	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_XLCDC_LAYER_ENR,
+				    ATMEL_XLCDC_LAYER_EN);
+
+	/*
+	 * Updating XLCDC_xxxCFGx, XLCDC_xxxFBA and XLCDC_xxxEN,
+	 * (where xxx indicates each layer) requires writing one to the
+	 * Update Attribute field for each layer in LCDC_ATTRE register for SAM9X7.
+	 */
+	regmap_write(dc->hlcdc->regmap, ATMEL_XLCDC_ATTRE, ATMEL_XLCDC_BASE_UPDATE |
+		     ATMEL_XLCDC_OVR1_UPDATE | ATMEL_XLCDC_OVR3_UPDATE |
+		     ATMEL_XLCDC_HEO_UPDATE);
+}
+
 static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 					    struct drm_atomic_state *state)
 {
@@ -739,7 +906,7 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 	struct atmel_hlcdc_plane *plane = drm_plane_to_atmel_hlcdc_plane(p);
 	struct atmel_hlcdc_plane_state *hstate =
 			drm_plane_state_to_atmel_hlcdc_plane_state(new_s);
-	u32 sr;
+	struct atmel_hlcdc_dc *dc = p->dev->dev_private;
 
 	if (!new_s->crtc || !new_s->fb)
 		return;
@@ -750,29 +917,73 @@ static void atmel_hlcdc_plane_atomic_update(struct drm_plane *p,
 	}
 
 	atmel_hlcdc_plane_update_pos_and_size(plane, hstate);
-	atmel_hlcdc_plane_update_general_settings(plane, hstate);
+	if (dc->desc->is_xlcdc)
+		atmel_xlcdc_plane_update_general_settings(plane, hstate);
+	else
+		atmel_hlcdc_plane_update_general_settings(plane, hstate);
 	atmel_hlcdc_plane_update_format(plane, hstate);
 	atmel_hlcdc_plane_update_clut(plane, hstate);
 	atmel_hlcdc_plane_update_buffers(plane, hstate);
 	atmel_hlcdc_plane_update_disc_area(plane, hstate);
 
-	/* Enable the overrun interrupts. */
-	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_IER,
-				    ATMEL_HLCDC_LAYER_OVR_IRQ(0) |
-				    ATMEL_HLCDC_LAYER_OVR_IRQ(1) |
-				    ATMEL_HLCDC_LAYER_OVR_IRQ(2));
+	if (dc->desc->is_xlcdc)
+		xlcdc_atomic_update(plane, dc);
+	else
+		hlcdc_atomic_update(plane);
+}
 
-	/* Apply the new config at the next SOF event. */
-	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
-	atmel_hlcdc_layer_write_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHER,
-			ATMEL_HLCDC_LAYER_UPDATE |
-			(sr & ATMEL_HLCDC_LAYER_EN ?
-			 ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
+static void hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
+			   const struct atmel_hlcdc_layer_desc *desc)
+{
+	/*
+	 * TODO: declare a "yuv-to-rgb-conv-factors" property to let
+	 * userspace modify these factors (using a BLOB property ?).
+	 */
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc,
+				    0x4c900091);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 1,
+				    0x7a5f5090);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 2,
+				    0x40040890);
+}
+
+static void xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
+			   const struct atmel_hlcdc_layer_desc *desc)
+{
+	/*
+	 * yuv-to-rgb-conv-factors are now defined from LCDC_HEOCFG16 to
+	 * LCDC_HEOCFG21 registers in SAM9X7.
+	 */
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc,
+				    0x00000488);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 1,
+				    0x00000648);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 2,
+				    0x1EA00480);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 3,
+				    0x00001D28);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 4,
+				    0x08100480);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 5,
+				    0x00000000);
+	atmel_hlcdc_layer_write_cfg(&plane->layer,
+				    desc->layout.csc + 6,
+				    0x00000007);
 }
 
 static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 
 	if (desc->type == ATMEL_HLCDC_OVERLAY_LAYER ||
 	    desc->type == ATMEL_HLCDC_CURSOR_LAYER) {
@@ -796,31 +1007,19 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
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
+	if (dc->desc->is_xlcdc && desc->layout.csc)
+		xlcdc_csc_init(plane, desc);
+	else
+		if (desc->layout.csc)
+			hlcdc_csc_init(plane, desc);
 
 	return 0;
 }
 
-void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
+void hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
+		   const struct atmel_hlcdc_layer_desc *desc)
 {
-	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
-	u32 isr;
-
-	isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
+	u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
 
 	/*
 	 * There's not much we can do in case of overrun except informing
@@ -834,6 +1033,34 @@ void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
 			desc->name);
 }
 
+void xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
+		   const struct atmel_hlcdc_layer_desc *desc)
+{
+	u32 isr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_XLCDC_LAYER_ISR);
+
+	/*
+	 * There's not much we can do in case of overrun except informing
+	 * the user. However, we are in interrupt context here, hence the
+	 * use of dev_dbg().
+	 */
+	if (isr &
+	    (ATMEL_XLCDC_LAYER_OVR_IRQ(0) | ATMEL_XLCDC_LAYER_OVR_IRQ(1) |
+	     ATMEL_XLCDC_LAYER_OVR_IRQ(2)))
+		dev_dbg(plane->base.dev->dev, "overrun on plane %s\n",
+			desc->name);
+}
+
+void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
+{
+	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
+
+	if (dc->desc->is_xlcdc)
+		xlcdc_irq_dbg(plane, desc);
+	else
+		hlcdc_irq_dbg(plane, desc);
+}
+
 static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs = {
 	.atomic_check = atmel_hlcdc_plane_atomic_check,
 	.atomic_update = atmel_hlcdc_plane_atomic_update,
-- 
2.25.1

