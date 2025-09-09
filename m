Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2153B50250
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E00010E7B1;
	Tue,  9 Sep 2025 16:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="rdqmnS7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C07C10E7B1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:18:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A71BA4E40C66;
 Tue,  9 Sep 2025 16:18:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 72DF960630;
 Tue,  9 Sep 2025 16:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA275102F27F8; 
 Tue,  9 Sep 2025 18:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757434706; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Ys3cwv1q/vaqIuV1zOe0DkcLI3jUR/aug2QH1aJtJKI=;
 b=rdqmnS7tcHc/iiKh56h5UBN5ooODXhU99uUEqa/64oj+ag8FsaEy9YbzWFZ0qfGanM+39A
 jo8bSWNXkSBKxcCIwlPo2CpOLv4aZ+O5iGAhcfVPaYkiA5Lj1nfo24GL7ac0hlXCDoi71q
 62e7pQCWFLHci5nZ492UfzFoLF+3L/XnJy9RsKjcFmbm0xSirJdz4l2j780sPOcdcnVpYo
 RvHxBFBZkM2z3SbWPjPcKDTYA7C2d6CUv/70v3AcfTyx/EK1WztvmX/2Mtp4mF8SHBb1e5
 RYx3dnsYMRc4eAAt5iUeqEknqNAiVKrGPLKjLGIKEVII/NXzzvIlhWAQBzlNdw==
From: Miguel Gazquez <miguel.gazquez@bootlin.com>
Date: Tue, 09 Sep 2025 18:16:43 +0200
Subject: [PATCH] drm/bridge: ite-it66121: Add drm_connector support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-it66121-fix-v1-1-bc79ca83df17@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOpSwGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNT3cwSMzNDI0PdtMwKXcOkFGMLCwtzU8skQyWgjoKiVKAw2LTo2Np
 aAGnDepBdAAAA
X-Change-ID: 20250905-it66121-fix-1bd3888759b1
To: Phong LE <ple@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com, 
 kory.maincent@bootlin.com, romain.gantois@bootlin.com, praneeth@ti.com, 
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757434689; l=6173;
 i=miguel.gazquez@bootlin.com; s=20250708; h=from:subject:message-id;
 bh=PV8/nmVFoCumkNKDwkobEeOEHRBTMDs0bykCBqjjGEw=;
 b=ob4J5tDwx+F8UA8smW8RDNag+Pn6O++GeK8os53ouzbjmLd08+Odl5ORHTxyNMYQhfC9pXJN1
 XXhUUXDekwyDad7l8uomulNxQ1SQ5pQC68hsIcRI/I0T5BfpBui7mFz
X-Developer-Key: i=miguel.gazquez@bootlin.com; a=ed25519;
 pk=k/2KI9jkmayaF0ghZ8QYUH9Wm/kFHDhl8QoZ0RHbr4w=
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Add support for DRM connector and make the driver support the older
format of attaching connectors onto the encoder->bridge->connector
chain.
This makes the driver compatible with display controller that only
supports the old format.

[Miguel Gazquez: Rebased + made driver work with or without
DRM_BRIDGE_ATTACH_NO_CONNECTOR]

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Miguel Gazquez <miguel.gazquez@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 121 ++++++++++++++++++++++++++++++++---
 1 file changed, 112 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index aa7b1dcc5d70e5d15199e071e4cd96e08b4bda1b..cd1d926fed8560fb5f8e1ab585b9bf72a70ee8e3 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -284,6 +284,10 @@
 
 #define IT66121_AFE_CLK_HIGH			80000 /* Khz */
 
+#define IT66121_MAX_CLOCK_12BIT 74250  /* Khz */
+#define IT66121_MAX_CLOCK_24BIT 148500 /* Khz */
+#define IT66121_MIN_CLOCK 25000        /* Khz */
+
 enum chip_id {
 	ID_IT6610,
 	ID_IT66121,
@@ -299,6 +303,7 @@ struct it66121_ctx {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
+	struct drm_connector conn;
 	struct device *dev;
 	struct gpio_desc *gpio_reset;
 	struct i2c_client *client;
@@ -315,6 +320,11 @@ struct it66121_ctx {
 	const struct it66121_chip_info *info;
 };
 
+static inline struct it66121_ctx *connector_to_it66121(struct drm_connector *con)
+{
+	return container_of(con, struct it66121_ctx, conn);
+}
+
 static const struct regmap_range_cfg it66121_regmap_banks[] = {
 	{
 		.name = "it66121",
@@ -585,19 +595,112 @@ static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
 	return val & IT66121_SYS_STATUS_HPDETECT;
 }
 
+static enum drm_mode_status it66121_mode_valid(struct drm_connector *connector,
+					       const struct drm_display_mode *mode)
+{
+	struct it66121_ctx *ctx = connector_to_it66121(connector);
+	unsigned long max_clock;
+
+	max_clock = (ctx->bus_width == 12) ? IT66121_MAX_CLOCK_12BIT : IT66121_MAX_CLOCK_24BIT;
+
+	if (mode->clock > max_clock)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+
+	return MODE_OK;
+}
+
+static const struct drm_edid *it66121_get_edid(struct it66121_ctx *ctx,
+					       struct drm_connector *connector)
+{
+	const struct drm_edid *drm_edid;
+
+	mutex_lock(&ctx->lock);
+	drm_edid = drm_edid_read_custom(connector, it66121_get_edid_block, ctx);
+	mutex_unlock(&ctx->lock);
+
+	return drm_edid;
+}
+
+static int it66121_get_modes(struct drm_connector *connector)
+{
+	struct it66121_ctx *ctx = connector_to_it66121(connector);
+	const struct drm_edid *drm_edid;
+	int num = 0;
+
+	drm_edid = it66121_get_edid(ctx, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (drm_edid) {
+		num = drm_edid_connector_add_modes(connector);
+		drm_edid_free(drm_edid);
+	}
+
+	return num;
+}
+
+static const struct drm_connector_helper_funcs it66121_connector_helper_funcs = {
+	.get_modes = it66121_get_modes,
+	.mode_valid = it66121_mode_valid,
+};
+
+static enum drm_connector_status
+it66121_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct it66121_ctx *ctx = connector_to_it66121(connector);
+
+	return it66121_is_hpd_detect(ctx) ? connector_status_connected
+					  : connector_status_disconnected;
+}
+
+static const struct drm_connector_funcs it66121_connector_funcs = {
+	.detect = it66121_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
 static int it66121_bridge_attach(struct drm_bridge *bridge,
 				 struct drm_encoder *encoder,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
+	u32 bus_format;
 	int ret;
 
-	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
-		return -EINVAL;
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		ret = drm_bridge_attach(encoder, ctx->next_bridge, bridge, flags);
+		if (ret)
+			return ret;
+	} else {
+		if (ctx->bus_width == 12) {
+			bus_format = MEDIA_BUS_FMT_RGB888_2X12_LE;
+		} else if (ctx->bus_width == 24) {
+			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		} else {
+			dev_err(ctx->dev, "Invalid bus width\n");
+			return -EINVAL;
+		}
 
-	ret = drm_bridge_attach(encoder, ctx->next_bridge, bridge, flags);
-	if (ret)
-		return ret;
+		drm_connector_helper_add(&ctx->conn,
+					 &it66121_connector_helper_funcs);
+
+		ret = drm_connector_init(bridge->dev, &ctx->conn,
+					 &it66121_connector_funcs,
+					 DRM_MODE_CONNECTOR_HDMIA);
+		if (ret)
+			return ret;
+
+		ret = drm_display_info_set_bus_formats(&ctx->conn.display_info,
+						       &bus_format, 1);
+		if (ret)
+			return ret;
+
+		drm_connector_attach_encoder(&ctx->conn, bridge->encoder);
+	}
 
 	if (ctx->info->id == ID_IT66121) {
 		ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
@@ -830,14 +933,14 @@ static enum drm_mode_status it66121_bridge_mode_valid(struct drm_bridge *bridge,
 						      const struct drm_display_mode *mode)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
-	unsigned long max_clock;
+	unsigned long max_clock_khz;
 
-	max_clock = (ctx->bus_width == 12) ? 74250 : 148500;
+	max_clock_khz = (ctx->bus_width == 12) ? IT66121_MAX_CLOCK_12BIT : IT66121_MAX_CLOCK_24BIT;
 
-	if (mode->clock > max_clock)
+	if (mode->clock > max_clock_khz)
 		return MODE_CLOCK_HIGH;
 
-	if (mode->clock < 25000)
+	if (mode->clock < IT66121_MIN_CLOCK)
 		return MODE_CLOCK_LOW;
 
 	return MODE_OK;

---
base-commit: 9e05c8dc4e8bb14bdb86eccff1d07169cfd69df8
change-id: 20250905-it66121-fix-1bd3888759b1

Best regards,
-- 
Miguel Gazquez <miguel.gazquez@bootlin.com>

