Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC74DD04D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD37910E108;
	Thu, 17 Mar 2022 21:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4CA10E108
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 21:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1647553198; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=+PAP+GhYo3HO8tT+tENS/f0LEEIMDzkCK+VMfUOaQVY=;
 b=xJ8hzdoSgRCHsSj4RV9JmZnxM1oGXELpVbHNxheDGjWOpkxlcGzR7cQcRO9VTa/ffue7gc
 F20uv3rjtd4OI3zv6At9sw3JI+S7mi09sUJdhGf+Y4aaeIiqYFQ3E+gq2FP/qPLrwj0a+g
 /CTSnreUy79EdwQL2AL2EXljGFLm8jw=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/panel: ld9040: Register a backlight device
Date: Thu, 17 Mar 2022 21:39:52 +0000
Message-Id: <20220317213952.228638-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>,
 od@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register a backlight device to be able to switch between all the gamma
levels.

While this works, and improves the situation, on my device (Galaxy S2
I9100) the screen does not yet look as good as how it did under Android,
independently of the gamma setting. The blacks are washed and look grey,
while they did look perfectly black on Android thanks to the AMOLED
technology.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c | 40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-ld9040.c b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
index c4b388850a13..0dd21a809309 100644
--- a/drivers/gpu/drm/panel/panel-samsung-ld9040.c
+++ b/drivers/gpu/drm/panel/panel-samsung-ld9040.c
@@ -8,6 +8,7 @@
  * Andrzej Hajda <a.hajda@samsung.com>
 */
 
+#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -310,8 +311,40 @@ static int ld9040_parse_dt(struct ld9040 *ctx)
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
@@ -353,6 +386,13 @@ static int ld9040_probe(struct spi_device *spi)
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
2.35.1

