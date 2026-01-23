Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAGeKReec2lqxgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570737837D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 17:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6D310EB32;
	Fri, 23 Jan 2026 16:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="x+1gMrKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EE610EB2C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:13:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 648994E42222;
 Fri, 23 Jan 2026 16:13:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 380C36070A;
 Fri, 23 Jan 2026 16:13:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A375119A87D8; Fri, 23 Jan 2026 17:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769184781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=O24tFBrT15VptdJnWdlRlNZ2J39m4pHYDYjGkzjXizs=;
 b=x+1gMrKSkreHFfPyidHIkAUPVdrrBvJX8qeNq9Ansjy/3ie4sF2Kqtbi8k7nofWU6VEOct
 Dt6tmDkTT/kDBb37kmBTM1TzkDVehxUkWnHH4TLp0O3LZ4yV6P9+oZO+qDUG/0zVSMdNXr
 w7BCk8ot+K/Kp9+Wyev+YPZ97urj2SZMpZUPXurHh6Eo30w7dXkCNrsPdRFt3Y+6L7SS+T
 7x6OwWZRsaYKO72n+8l9g+kSF2a/Hs14oEszSlhH4woeF4nBKzLb9E8t8QqcAdVIllVqEf
 daGzZulUzDVtJ9O9dbea4WPnrAdpzeXHOetJR9L0Ox1BWyW9zKzkHtmHOu7ziQ==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Fri, 23 Jan 2026 17:12:26 +0100
Subject: [PATCH v5 08/25] drm/tilcdc: Remove tilcdc_panel_info structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-feature_tilcdc-v5-8-5a44d2aa3f6f@bootlin.com>
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-47773
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jyri.sarha@iki.fi,m:tomi.valkeinen@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux@armlinux.org.uk,m:brgl@bgdev.pl,m:tony@atomide.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:msp@baylibre.com,m:praneeth@ti.com,m:luca.ceresoli@bootlin.com,m:louis.chauvet@bootlin.com,m:thomas.petazzoni@bootlin.com,m:miguel.gazquez@bootlin.com,m:herve.codina@bootlin.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-omap@vger.kernel.org,m:kory.maincent@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[iki.fi,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,armlinux.org.uk,bgdev.pl,atomide.com,intel.com,linaro.org,kwiboo.se];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,ti.com:url]
X-Rspamd-Queue-Id: 570737837D
X-Rspamd-Action: no action

Remove the tilcdc_panel_info structure and its associated helper
function as the structure contains only redundant or unused parameters.

Most panel configuration parameters in tilcdc_panel_info are either:
- Already represented by existing DRM mode flags (invert_pxl_clk,
  sync_edge via DRM_BUS_FLAG_*), or
- Set to identical values across all instances (panel_info_default),
  making them effectively constants

The removed fifo_th field is already handled by priv->fifo_th when set.
Other removed fields (tft_alt_mode, raster_order) were always set to 0
in the only instance (panel_info_default) and thus had no effect.

This simplifies the code by eliminating unnecessary abstraction while
preserving all functional behavior.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c     | 28 +++------------------
 drivers/gpu/drm/tilcdc/tilcdc_drv.h      | 42 --------------------------------
 drivers/gpu/drm/tilcdc/tilcdc_external.c | 14 -----------
 3 files changed, 3 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 252e5adaeb6e2..5b8aba0765f9b 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -31,7 +31,6 @@ struct tilcdc_crtc {
 	struct drm_crtc base;
 
 	struct drm_plane primary;
-	const struct tilcdc_panel_info *info;
 	struct drm_pending_vblank_event *event;
 	struct mutex enable_lock;
 	bool enabled;
@@ -272,14 +271,10 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
 	struct tilcdc_drm_private *priv = dev->dev_private;
-	const struct tilcdc_panel_info *info = tilcdc_crtc->info;
 	uint32_t reg, hbp, hfp, hsw, vbp, vfp, vsw;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	struct drm_framebuffer *fb = crtc->primary->state->fb;
 
-	if (WARN_ON(!info))
-		return;
-
 	if (WARN_ON(!fb))
 		return;
 
@@ -287,12 +282,11 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	reg = tilcdc_read(dev, LCDC_DMA_CTRL_REG) & ~0x00000770;
 	/* Use 16 bit DMA burst size by default */
 	reg |= LCDC_DMA_BURST_SIZE(LCDC_DMA_BURST_16);
+
 	if (priv->fifo_th) {
 		int fifo_th_val = ilog2(priv->fifo_th) - 3;
 
 		reg |= (fifo_th_val << 8);
-	} else {
-		reg |= (info->fifo_th << 8);
 	}
 	tilcdc_write(dev, LCDC_DMA_CTRL_REG, reg);
 
@@ -360,8 +354,6 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 		  LCDC_V2_TFT_24BPP_MODE | LCDC_V2_TFT_24BPP_UNPACK |
 		  0x000ff000 /* Palette Loading Delay bits */);
 	reg |= LCDC_TFT_MODE; /* no monochrome/passive support */
-	if (info->tft_alt_mode)
-		reg |= LCDC_TFT_ALT_ENABLE;
 	if (priv->rev == 2) {
 		switch (fb->format->format) {
 		case DRM_FORMAT_BGR565:
@@ -384,15 +376,13 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	reg |= 128 << 12;
 	tilcdc_write(dev, LCDC_RASTER_CTRL_REG, reg);
 
-	if (info->invert_pxl_clk ||
-	    mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
+	if (mode->flags == DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_PIXEL_CLOCK);
 
 	tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_CTRL);
-	if (info->sync_edge ||
-	    mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
+	if (mode->flags == DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE)
 		tilcdc_set(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_SYNC_EDGE);
@@ -407,11 +397,6 @@ static void tilcdc_crtc_set_mode(struct drm_crtc *crtc)
 	else
 		tilcdc_clear(dev, LCDC_RASTER_TIMING_2_REG, LCDC_INVERT_VSYNC);
 
-	if (info->raster_order)
-		tilcdc_set(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ORDER);
-	else
-		tilcdc_clear(dev, LCDC_RASTER_CTRL_REG, LCDC_RASTER_ORDER);
-
 	tilcdc_crtc_set_clk(crtc);
 
 	tilcdc_crtc_load_palette(crtc);
@@ -838,13 +823,6 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
 	.atomic_flush	= tilcdc_crtc_atomic_flush,
 };
 
-void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
-		const struct tilcdc_panel_info *info)
-{
-	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);
-	tilcdc_crtc->info = info;
-}
-
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.h b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
index c23b593dc61f6..181b9d7a515b6 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.h
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.h
@@ -114,53 +114,11 @@ void tilcdc_module_init(struct tilcdc_module *mod, const char *name,
 		const struct tilcdc_module_ops *funcs);
 void tilcdc_module_cleanup(struct tilcdc_module *mod);
 
-/* Panel config that needs to be set in the crtc, but is not coming from
- * the mode timings.  The display module is expected to call
- * tilcdc_crtc_set_panel_info() to set this during modeset.
- */
-struct tilcdc_panel_info {
-
-	/* AC Bias Pin Frequency */
-	uint32_t ac_bias;
-
-	/* AC Bias Pin Transitions per Interrupt */
-	uint32_t ac_bias_intrpt;
-
-	/* DMA burst size */
-	uint32_t dma_burst_sz;
-
-	/* Bits per pixel */
-	uint32_t bpp;
-
-	/* FIFO DMA Request Delay */
-	uint32_t fdd;
-
-	/* TFT Alternative Signal Mapping (Only for active) */
-	bool tft_alt_mode;
-
-	/* Invert pixel clock */
-	bool invert_pxl_clk;
-
-	/* Horizontal and Vertical Sync Edge: 0=rising 1=falling */
-	uint32_t sync_edge;
-
-	/* Horizontal and Vertical Sync: Control: 0=ignore */
-	uint32_t sync_ctrl;
-
-	/* Raster Data Order Select: 1=Most-to-least 0=Least-to-most */
-	uint32_t raster_order;
-
-	/* DMA FIFO threshold */
-	uint32_t fifo_th;
-};
-
 #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
 
 int tilcdc_crtc_create(struct drm_device *dev);
 irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc);
 void tilcdc_crtc_update_clk(struct drm_crtc *crtc);
-void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
-		const struct tilcdc_panel_info *info);
 void tilcdc_crtc_shutdown(struct drm_crtc *crtc);
 void tilcdc_crtc_destroy(struct drm_crtc *crtc);
 int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 2970c41d9c3eb..81c90c2754c6c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -14,18 +14,6 @@
 #include "tilcdc_drv.h"
 #include "tilcdc_external.h"
 
-static const struct tilcdc_panel_info panel_info_default = {
-		.ac_bias                = 255,
-		.ac_bias_intrpt         = 0,
-		.dma_burst_sz           = 16,
-		.bpp                    = 16,
-		.fdd                    = 0x80,
-		.tft_alt_mode           = 0,
-		.sync_edge              = 0,
-		.sync_ctrl              = 1,
-		.raster_order           = 0,
-};
-
 static
 struct drm_connector *tilcdc_encoder_find_connector(struct drm_device *ddev,
 						    struct drm_encoder *encoder)
@@ -55,8 +43,6 @@ int tilcdc_attach_bridge(struct drm_device *ddev, struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
-	tilcdc_crtc_set_panel_info(priv->crtc, &panel_info_default);
-
 	priv->external_connector =
 		tilcdc_encoder_find_connector(ddev, priv->external_encoder);
 	if (!priv->external_connector)

-- 
2.43.0

