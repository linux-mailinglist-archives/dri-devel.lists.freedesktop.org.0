Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E368B012E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 07:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15241137E3;
	Wed, 24 Apr 2024 05:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="vgYO69Nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C041137E4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 05:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1713937328; x=1745473328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d9TLHibRXOIPNlLMIRW3O1VfTWnWF+68425LI9qumRo=;
 b=vgYO69Nn7i1KvLLoy2EzJ2fTuVnR6DBhHZm0n26XxQV+HBu/tbPmDv3O
 zpRf8gilOOHAvndc7Jdzj4+pwXNNWVTbO4fYYhotIq7xDipX7VPSfVuWW
 g+47tO+TzF7dAVy8mpoNdgSjVx0PdsyqMm5Lcj0IV0CBSp6ulv1I3N7/j
 a7GPyXM6OoD3pMVouikMa2eWne9zUUyaZ4G+jgQ1Wj32C9bReGDozNRam
 d75AuSk1MxQyS2vwFTJyykIY2I2QFO+TtqIlwEnocHSPzTOMKZocD+nrt
 YmQSRYn5zg/082kWMjewx0ML2N2ejLOzoH//sMPo8R0SkMMSCgzxAJwZJ w==;
X-CSE-ConnectionGUID: 6JJygsdYTDWyA/4eXt1e9g==
X-CSE-MsgGUID: 8Kqmgd9aSkyZryd1+UpFqA==
X-IronPort-AV: E=Sophos;i="6.07,225,1708412400"; d="scan'208";a="22977448"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Apr 2024 22:35:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 22:34:59 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 22:34:50 -0700
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
 Muralidharan" <manikandan.m@microchip.com>, Durai Manickam KR
 <durai.manickamkr@microchip.com>
Subject: [PATCH RESEND v9 4/8] drm: atmel_hlcdc: Add support for XLCDC using
 IP specific driver ops
Date: Wed, 24 Apr 2024 11:03:47 +0530
Message-ID: <20240424053351.589830-5-manikandan.m@microchip.com>
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

Add XLCDC specific driver ops and is_xlcdc flag to separate the
functionality and to access the controller registers.
HEO scaling, window resampling, Alpha blending, YUV-to-RGB
conversion in XLCDC is derived and handled using additional
configuration bits and registers. Writing one to the Enable fields
of each layer in LCD_ATTRE is required to reflect the values set
in Configuration, FBA, Enable registers of each layer.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Co-developed-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
Signed-off-by: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
Co-developed-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c    |  37 +++-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h  |   3 +
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   | 182 +++++++++++++++++-
 3 files changed, 217 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index b229692a27ca..98a98b5fca85 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -164,11 +164,13 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 	state = drm_crtc_state_to_atmel_hlcdc_crtc_state(c->state);
 	cfg = state->output_mode << 8;
 
-	if (adj->flags & DRM_MODE_FLAG_NVSYNC)
-		cfg |= ATMEL_HLCDC_VSPOL;
+	if (!crtc->dc->desc->is_xlcdc) {
+		if (adj->flags & DRM_MODE_FLAG_NVSYNC)
+			cfg |= ATMEL_HLCDC_VSPOL;
 
-	if (adj->flags & DRM_MODE_FLAG_NHSYNC)
-		cfg |= ATMEL_HLCDC_HSPOL;
+		if (adj->flags & DRM_MODE_FLAG_NHSYNC)
+			cfg |= ATMEL_HLCDC_HSPOL;
+	}
 
 	regmap_update_bits(regmap, ATMEL_HLCDC_CFG(5),
 			   ATMEL_HLCDC_HSPOL | ATMEL_HLCDC_VSPOL |
@@ -202,6 +204,20 @@ static void atmel_hlcdc_crtc_atomic_disable(struct drm_crtc *c,
 
 	pm_runtime_get_sync(dev->dev);
 
+	if (crtc->dc->desc->is_xlcdc) {
+		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_CM);
+		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					     !(status & ATMEL_XLCDC_CM),
+					     10, 1000))
+			dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
+
+		regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_XLCDC_SD);
+		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					     status & ATMEL_XLCDC_SD,
+					     10, 1000))
+			dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
+	}
+
 	regmap_write(regmap, ATMEL_HLCDC_DIS, ATMEL_HLCDC_DISP);
 	if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
 				     !(status & ATMEL_HLCDC_DISP),
@@ -261,6 +277,19 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
 				     10, 1000))
 		dev_warn(dev->dev, "Atmel LCDC status register DISPSTS timeout\n");
 
+	if (crtc->dc->desc->is_xlcdc) {
+		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_CM);
+		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					     status & ATMEL_XLCDC_CM,
+					     10, 1000))
+			dev_warn(dev->dev, "Atmel LCDC status register CMSTS timeout\n");
+
+		regmap_write(regmap, ATMEL_HLCDC_EN, ATMEL_XLCDC_SD);
+		if (regmap_read_poll_timeout(regmap, ATMEL_HLCDC_SR, status,
+					     !(status & ATMEL_XLCDC_SD),
+					     10, 1000))
+			dev_warn(dev->dev, "Atmel LCDC status register SDSTS timeout\n");
+	}
 
 	pm_runtime_put_sync(dev->dev);
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
index c32e5c8809d7..1153d402f810 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h
@@ -386,6 +386,7 @@ struct atmel_lcdc_dc_ops {
 };
 
 extern const struct atmel_lcdc_dc_ops atmel_hlcdc_ops;
+extern const struct atmel_lcdc_dc_ops atmel_xlcdc_ops;
 
 /**
  * Atmel HLCDC Display Controller description structure.
@@ -403,6 +404,7 @@ extern const struct atmel_lcdc_dc_ops atmel_hlcdc_ops;
  * @conflicting_output_formats: true if RGBXXX output formats conflict with
  *				each other.
  * @fixed_clksrc: true if clock source is fixed
+ * @is_xlcdc: true if XLCDC IP is supported
  * @layers: a layer description table describing available layers
  * @nlayers: layer description table size
  * @ops: atmel lcdc dc ops
@@ -417,6 +419,7 @@ struct atmel_hlcdc_dc_desc {
 	int max_hpw;
 	bool conflicting_output_formats;
 	bool fixed_clksrc;
+	bool is_xlcdc;
 	const struct atmel_hlcdc_layer_desc *layers;
 	int nlayers;
 	const struct atmel_lcdc_dc_ops *ops;
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 9db66df8b0e4..f60367dc6d9d 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -331,6 +331,55 @@ void atmel_hlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
 								     yfactor));
 }
 
+static
+void atmel_xlcdc_plane_setup_scaler(struct atmel_hlcdc_plane *plane,
+				    struct atmel_hlcdc_plane_state *state)
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
+	xfactor = (u32)(((1 << 20) * state->src_w) / state->crtc_w);
+
+	/* yfactor = round[(2^20 * YMEMSIZE)/YSIZE)] */
+	yfactor = (u32)(((1 << 20) * state->src_h) / state->crtc_h);
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
+	/*
+	 * With YCbCr 4:2:2 and YCbYcr 4:2:0 window resampling, configuration
+	 * register LCDC_HEOCFG25.VXSCFACT and LCDC_HEOCFG27.HXSCFACT is half
+	 * the value of yfactor and xfactor.
+	 */
+	if (state->base.fb->format->format == DRM_FORMAT_YUV420) {
+		yfactor /= 2;
+		xfactor /= 2;
+	}
+
+	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 2,
+				    yfactor);
+	atmel_hlcdc_layer_write_cfg(&plane->layer, desc->layout.scaler_config + 4,
+				    xfactor);
+}
+
 static void
 atmel_hlcdc_plane_update_pos_and_size(struct atmel_hlcdc_plane *plane,
 				      struct atmel_hlcdc_plane_state *state)
@@ -395,6 +444,40 @@ void atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
 				    cfg);
 }
 
+static
+void atmel_xlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
+					       struct atmel_hlcdc_plane_state *state)
+{
+	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
+	const struct drm_format_info *format = state->base.fb->format;
+	unsigned int cfg;
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
@@ -461,6 +544,15 @@ static void atmel_hlcdc_update_buffers(struct atmel_hlcdc_plane *plane,
 				    state->dscrs[i]->self);
 }
 
+static void atmel_xlcdc_update_buffers(struct atmel_hlcdc_plane *plane,
+				       struct atmel_hlcdc_plane_state *state,
+				       u32 sr, int i)
+{
+	atmel_hlcdc_layer_write_reg(&plane->layer,
+				    ATMEL_XLCDC_LAYER_PLANE_ADDR(i),
+				    state->dscrs[i]->addr);
+}
+
 static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 					     struct atmel_hlcdc_plane_state *state)
 {
@@ -470,7 +562,8 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 	u32 sr;
 	int i;
 
-	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
+	if (!dc->desc->is_xlcdc)
+		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
 
 	for (i = 0; i < state->nplanes; i++) {
 		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
@@ -739,6 +832,20 @@ static void atmel_hlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
 	atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_ISR);
 }
 
+static void atmel_xlcdc_atomic_disable(struct atmel_hlcdc_plane *plane)
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
 static void atmel_hlcdc_plane_atomic_disable(struct drm_plane *p,
 					     struct drm_atomic_state *state)
 {
@@ -767,6 +874,28 @@ static void atmel_hlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
 				    ATMEL_HLCDC_LAYER_A2Q : ATMEL_HLCDC_LAYER_EN));
 }
 
+static void atmel_xlcdc_atomic_update(struct atmel_hlcdc_plane *plane,
+				      struct atmel_hlcdc_dc *dc)
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
@@ -815,6 +944,30 @@ static void atmel_hlcdc_csc_init(struct atmel_hlcdc_plane *plane,
 	}
 }
 
+static void atmel_xlcdc_csc_init(struct atmel_hlcdc_plane *plane,
+				 const struct atmel_hlcdc_layer_desc *desc)
+{
+	/*
+	 * yuv-to-rgb-conv-factors are now defined from LCDC_HEOCFG16 to
+	 * LCDC_HEOCFG21 registers in SAM9X7.
+	 */
+	static const u32 xlcdc_csc_coeffs[] = {
+		0x00000488,
+		0x00000648,
+		0x1EA00480,
+		0x00001D28,
+		0x08100480,
+		0x00000000,
+		0x00000007
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(xlcdc_csc_coeffs); i++) {
+		atmel_hlcdc_layer_write_cfg(&plane->layer,
+					    desc->layout.csc + i,
+					    xlcdc_csc_coeffs[i]);
+	}
+}
+
 static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
@@ -865,6 +1018,23 @@ static void atmel_hlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
 			desc->name);
 }
 
+static void atmel_xlcdc_irq_dbg(struct atmel_hlcdc_plane *plane,
+				const struct atmel_hlcdc_layer_desc *desc)
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
 void atmel_hlcdc_plane_irq(struct atmel_hlcdc_plane *plane)
 {
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
@@ -883,6 +1053,16 @@ const struct atmel_lcdc_dc_ops atmel_hlcdc_ops = {
 	.lcdc_irq_dbg = atmel_hlcdc_irq_dbg,
 };
 
+const struct atmel_lcdc_dc_ops atmel_xlcdc_ops = {
+	.plane_setup_scaler = atmel_xlcdc_plane_setup_scaler,
+	.lcdc_update_buffers = atmel_xlcdc_update_buffers,
+	.lcdc_atomic_disable = atmel_xlcdc_atomic_disable,
+	.lcdc_update_general_settings = atmel_xlcdc_plane_update_general_settings,
+	.lcdc_atomic_update = atmel_xlcdc_atomic_update,
+	.lcdc_csc_init = atmel_xlcdc_csc_init,
+	.lcdc_irq_dbg = atmel_xlcdc_irq_dbg,
+};
+
 static const struct drm_plane_helper_funcs atmel_hlcdc_layer_plane_helper_funcs = {
 	.atomic_check = atmel_hlcdc_plane_atomic_check,
 	.atomic_update = atmel_hlcdc_plane_atomic_update,
-- 
2.25.1

