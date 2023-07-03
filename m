Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005674650F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 23:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661CF10E239;
	Mon,  3 Jul 2023 21:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B605410E239
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1688420847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSVu9zN3Z7FGQFi9DqYFaRkee0OgOav2Bk1wOeBtGYc=;
 b=RKg1Gt9zR7825mopAtoJWrfdnCagok+w3KhRM/9TQ6vlc7X2WIX60WCSQvaDK/OzN6JpH2
 3koPY79DI0JglsrJ281eXLYen7CfnzVT+2av3neFJ3WTzRz/XHx+r9jizQaCboZr1DoAHc
 i0AGWAOqJJxR7X25X9t2hoo2hSGHpMs=
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
Date: Mon,  3 Jul 2023 23:47:14 +0200
Message-Id: <20230703214715.623447-3-paul@crapouillou.net>
In-Reply-To: <20230703214715.623447-1-paul@crapouillou.net>
References: <20230703214715.623447-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register a backlight device to be able to switch between all the gamma
levels.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index 7fd9444b42c5..b4f87d6244cb 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -8,6 +8,7 @@
  * Andrzej Hajda <a.hajda@samsung.com>
 */
 
+#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -311,8 +312,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
 	return 0;
 }
 
+static int ld9040_bl_update_status(struct backlight_device *dev)
+{
+	struct ld9040 *ctx = dev_get_drvdata(&dev->dev);
+
+	ctx->brightness = dev->props.brightness;
+	ld9040_brightness_set(ctx);
+
+	return 0;
+}
+
+static int ld9040_bl_get_intensity(struct backlight_device *dev)
+{
+	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
+			dev->props.power == FB_BLANK_UNBLANK)
+		return dev->props.brightness;
+
+	return 0;
+}
+
+static const struct backlight_ops ld9040_bl_ops = {
+	.get_brightness = ld9040_bl_get_intensity,
+	.update_status  = ld9040_bl_update_status,
+};
+
+static const struct backlight_properties ld9040_bl_props = {
+	.type = BACKLIGHT_RAW,
+	.scale = BACKLIGHT_SCALE_NON_LINEAR,
+	.max_brightness = ARRAY_SIZE(ld9040_gammas) - 1,
+	.brightness = ARRAY_SIZE(ld9040_gammas) - 1,
+};
+
 static int ld9040_probe(struct spi_device *spi)
 {
+	struct backlight_device *bldev;
 	struct device *dev = &spi->dev;
 	struct ld9040 *ctx;
 	int ret;
@@ -354,6 +387,13 @@ static int ld9040_probe(struct spi_device *spi)
 	drm_panel_init(&ctx->panel, dev, &ld9040_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
+
+	bldev = devm_backlight_device_register(dev, dev_name(dev), dev,
+					       ctx, &ld9040_bl_ops,
+					       &ld9040_bl_props);
+	if (IS_ERR(bldev))
+		return PTR_ERR(bldev);
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;
-- 
2.40.1

