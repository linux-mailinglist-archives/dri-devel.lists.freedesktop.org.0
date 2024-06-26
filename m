Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFA918489
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752DB89561;
	Wed, 26 Jun 2024 14:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E285D89561
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:40:41 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sMTp9-0007iB-Ic; Wed, 26 Jun 2024 16:40:39 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 26 Jun 2024 16:40:38 +0200
Subject: =?utf-8?q?=5BPATCH_1/2=5D_drm/panel=3A_ilitek-ili9881c=3A_Explic?=
 =?utf-8?q?itly_set_address_mode=2C_allow_180=C2=B0_rotation?=
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240626-drm-panel-ili9881c-rotation-v1-1-e0ff54173e32@pengutronix.de>
References: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
In-Reply-To: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

We can use horizontal and vertical flipping via the MIPI DCS address
mode to rotate the display by 180° using the device tree "rotation"
property. Since the tl050hdv35 panel has been defined as rotated,
we have to invert the bits there.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 084c37fa7348..b4565ff1a0de 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -42,6 +42,7 @@ struct ili9881c_desc {
 	const size_t init_length;
 	const struct drm_display_mode *mode;
 	const unsigned long mode_flags;
+	u8 default_address_mode;
 };
 
 struct ili9881c {
@@ -53,6 +54,7 @@ struct ili9881c {
 	struct gpio_desc	*reset;
 
 	enum drm_panel_orientation	orientation;
+	u8 address_mode;
 };
 
 #define ILI9881C_SWITCH_PAGE_INSTR(_page)	\
@@ -815,8 +817,6 @@ static const struct ili9881c_instr tl050hdv35_init[] = {
 	ILI9881C_COMMAND_INSTR(0xd1, 0x4b),
 	ILI9881C_COMMAND_INSTR(0xd2, 0x60),
 	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
-	ILI9881C_SWITCH_PAGE_INSTR(0),
-	ILI9881C_COMMAND_INSTR(0x36, 0x03),
 };
 
 static const struct ili9881c_instr w552946ab_init[] = {
@@ -1299,6 +1299,14 @@ static int ili9881c_prepare(struct drm_panel *panel)
 	if (ret)
 		return ret;
 
+	if (ctx->address_mode) {
+		ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_ADDRESS_MODE,
+					 &ctx->address_mode,
+					 sizeof(ctx->address_mode));
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = mipi_dsi_dcs_set_tear_on(ctx->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret)
 		return ret;
@@ -1521,6 +1529,12 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
+	ctx->address_mode = ctx->desc->default_address_mode;
+	if (ctx->orientation == DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP) {
+		ctx->address_mode ^= 0x03;
+		ctx->orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	}
+
 	ctx->panel.prepare_prev_first = true;
 
 	ret = drm_panel_of_backlight(&ctx->panel);
@@ -1572,6 +1586,7 @@ static const struct ili9881c_desc tl050hdv35_desc = {
 	.mode = &tl050hdv35_default_mode,
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
+	.default_address_mode = 0x03,
 };
 
 static const struct ili9881c_desc w552946aba_desc = {

-- 
2.39.2

