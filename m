Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362924ECCD
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798E96E4A2;
	Sun, 23 Aug 2020 10:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE6C6E4A5
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:11 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x64so2036307lff.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNRC5wV4KEWH+GXJnLufA1liOvhhBAmH9Vb7hJtP3Rg=;
 b=bIPZnx3VD/Qu8tDO1+EXUJK3IdIlWnwB0FcaIVgRCl2fVF7IEOSvxAalhX6Kih8DsJ
 df4lM9VPbSuLlV+XKeMe2y0TdWEcRsGZIeV2VjpiemaAPGI4hcWWLIBnBB9Z4XqAWPM9
 3cBIHLV3g0FKlXblDRLC1cJErBRX7XmQErmiFZETQ/RgJdOaMp3/O0y3TFQH9OSi8FVh
 pzEK71FSrshWdSwPjPfoicJaemH7CsY4s3hfzTzKx5ok2lz6KNwe79ihtNhGszIKBCwb
 8oONJecasVoTtjwQtEdcMXLD9MZ2n0FgnDLGfJhlSl/RTbRjfdM1fQyque3f/Kn9yFLi
 g29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QNRC5wV4KEWH+GXJnLufA1liOvhhBAmH9Vb7hJtP3Rg=;
 b=PIZFvPj6ctlBHYbUcGBHYxJbzXnpPgZnEBTFIP1uO7vAclOI/q2N5I5M9+OR56BIEC
 WbODMtVxZxHER95mI1wD9Ky5WVwzVa7l8Sj+MruW0b0Y5r/w1K2MpcCg3bhLz9job40+
 gWuPkgVjExW0fPaH4EQhZpCZJ5392+7RO8DB3PVHo97/P+Tdog9iihYeUnZalJHEHMI9
 2GhOf4ZgjnA+cDAFernLQU8P1fh0u+y5volkhFXIuDNscbuEpXBGygBhv6Hl/NYpmoxy
 qWFBjE9hFUd3fCieY/SZs35XAuet09EJex1nplf0+E3drsj7VBh5xWGg928oDqSogWbn
 7qSw==
X-Gm-Message-State: AOAM530ngW8iSuJxVAhz+Gf5oViY+0Xn5G3eWjyQcbjqGWYJ4ycWfH2C
 FwjIRxeft/MdqbS2SM5bzNItDaGMg4Rp2g==
X-Google-Smtp-Source: ABdhPJwsWeG06kJGmNk7jZMS+CSLJKp7zfCcKxCepS2nrFfsAZ1dBjcBtmnozowmzrh+Ut0VqoKLJw==
X-Received: by 2002:a19:8392:: with SMTP id f140mr406745lfd.45.1598179569975; 
 Sun, 23 Aug 2020 03:46:09 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:09 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 14/24] drm/panel: samsung-s6e63j0x03: Backlight update
Date: Sun, 23 Aug 2020 12:45:22 +0200
Message-Id: <20200823104532.1024798-15-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200823104532.1024798-1-sam@ravnborg.org>
References: <20200823104532.1024798-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use backlight support from drm_panel.
  This shifts this driver away from manually handling of power state.
- Add helper function for registering backlight, like other samsung
  panel drivers do.
- Use devm_ for backlight register thus benefit from automatic
  unregistering. Drop all explicit unregistering.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  | 53 +++++++++----------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index a3570e0a90a8..0b38fc5d7326 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -36,7 +36,6 @@
 struct s6e63j0x03 {
 	struct device *dev;
 	struct drm_panel panel;
-	struct backlight_device *bl_dev;
 
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
@@ -184,7 +183,6 @@ static unsigned int s6e63j0x03_get_brightness_index(unsigned int brightness)
 static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
 					unsigned int brightness)
 {
-	struct backlight_device *bl_dev = ctx->bl_dev;
 	unsigned int index = s6e63j0x03_get_brightness_index(brightness);
 	int ret;
 
@@ -200,15 +198,13 @@ static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
 	if (ret < 0)
 		return ret;
 
-	bl_dev->props.brightness = brightness;
-
 	return 0;
 }
 
 static int s6e63j0x03_set_brightness(struct backlight_device *bl_dev)
 {
 	struct s6e63j0x03 *ctx = bl_get_data(bl_dev);
-	unsigned int brightness = bl_dev->props.brightness;
+	unsigned int brightness = backlight_get_brightness(bl_dev);
 
 	return s6e63j0x03_update_gamma(ctx, brightness);
 }
@@ -227,8 +223,6 @@ static int s6e63j0x03_disable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
-
 	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
 	if (ret < 0)
 		return ret;
@@ -247,8 +241,6 @@ static int s6e63j0x03_unprepare(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
-
 	return 0;
 }
 
@@ -334,8 +326,6 @@ static int s6e63j0x03_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		goto err;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 
 err:
@@ -395,8 +385,6 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
-
 	return 0;
 }
 
@@ -432,6 +420,25 @@ static const struct drm_panel_funcs s6e63j0x03_funcs = {
 	.get_modes = s6e63j0x03_get_modes,
 };
 
+static int s6e63j0x03_backlight_register(struct s6e63j0x03 *ctx)
+{
+	DECLARE_BACKLIGHT_INIT_RAW(props, DEFAULT_BRIGHTNESS, MAX_BRIGHTNESS);
+	struct device *dev = ctx->dev;
+	struct backlight_device *bd;
+	int ret = 0;
+
+	bd = devm_backlight_device_register(dev, "panel", dev, ctx,
+					    &s6e63j0x03_bl_ops, &props);
+	if (IS_ERR(bd)) {
+		ret = PTR_ERR(bd);
+		dev_err(dev, "error registering backlight device (%d)\n", ret);
+		return ret;
+	}
+
+	ctx->panel.backlight = bd;
+	return ret;
+}
+
 static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -469,20 +476,13 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 	drm_panel_init(&ctx->panel, dev, &s6e63j0x03_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-	ctx->bl_dev = backlight_device_register("s6e63j0x03", dev, ctx,
-						&s6e63j0x03_bl_ops, NULL);
-	if (IS_ERR(ctx->bl_dev)) {
-		dev_err(dev, "failed to register backlight device\n");
-		return PTR_ERR(ctx->bl_dev);
-	}
-
-	ctx->bl_dev->props.max_brightness = MAX_BRIGHTNESS;
-	ctx->bl_dev->props.brightness = DEFAULT_BRIGHTNESS;
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
+	ret = s6e63j0x03_backlight_register(ctx);
+	if (ret)
+		return ret;
 
 	ret = drm_panel_add(&ctx->panel);
 	if (ret < 0)
-		goto unregister_backlight;
+		return ret;
 
 	ret = mipi_dsi_attach(dsi);
 	if (ret < 0)
@@ -493,9 +493,6 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 remove_panel:
 	drm_panel_remove(&ctx->panel);
 
-unregister_backlight:
-	backlight_device_unregister(ctx->bl_dev);
-
 	return ret;
 }
 
@@ -506,8 +503,6 @@ static int s6e63j0x03_remove(struct mipi_dsi_device *dsi)
 	mipi_dsi_detach(dsi);
 	drm_panel_remove(&ctx->panel);
 
-	backlight_device_unregister(ctx->bl_dev);
-
 	return 0;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
