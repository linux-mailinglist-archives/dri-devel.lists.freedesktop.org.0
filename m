Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA36235674
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDC26E0FA;
	Sun,  2 Aug 2020 11:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2626E0FF
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v4so27061783ljd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3P/jAKqRFi/Ir6c5+u6w3+agi3IVBTOfTvwrXMS6N/E=;
 b=S4dB1b1CQSaZVLreY6P2SA6orlG1shkQ8FUmD4fq2LF4/5Bej0jnHHGkxftqrwMFKk
 ywMtw4pwvqX9qiW2gzjlydUGf72iVSzmPH3HKZy/i3LSXodGkJVzALqKltu3fhvXMWvx
 Fuefrs2ZICkCvprxzweo8e71kMV7hiniLInpFVqABLGy6tDdHmAAWyVItQ2I5HiaUxkP
 keJrt/mYurZjMG7yIW4w8RyrSDmPVKrxKh89tgQhW3CZh7xl3xLRrOhmXp8pciWN0eaw
 E0YJkvQ69sBKrY96WE5pSQ5nuPKONuhKeFAN3TRe6wmB+ohWpUbojSBYQPE2wOVpuBe+
 uavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3P/jAKqRFi/Ir6c5+u6w3+agi3IVBTOfTvwrXMS6N/E=;
 b=JL9/zURQR4hc01BDPT9lsGZSjtzV31W09d/wJp8oSIy7/Pu/a42WYdvJKtTv7FmRuw
 XRojBnOYGvZExmXCrOA2fGDjUPBOOgEeg8iA8JrW/nOWjutlGAN750sGQ4Y6u18qQqaP
 VJl50uOOggJZd7cT+WzuiYdGE4p/el+EmEdfzklD7Hv7IJoOj+6xtGkG42bxYIE7QZtp
 kMp7oYk6uHNLtS/YS13TWgjxRgVeQesWFxUK/g9IuFW4+Vij1DO+2nM+gPa5tuI6KlgO
 +FJB96PRqhTZk81ydBUk4RcyJfhZLfzNNFt0QEFVZBvEba+mc6Y7LiAN13b5GVfrq4yy
 JIlQ==
X-Gm-Message-State: AOAM531S6zrrtMMAHrRgonxLoa/lJwozwpQBA8DNGJAZXhECO2OoL3vK
 xtZuEzbq2jJrJEug/BibQ4yg2BeDD5k=
X-Google-Smtp-Source: ABdhPJwsvhtQYQ6zvO1gBATUEPK7vxyp8CiKmcDjGv2bsfo26lP5MzSjlCJF5VwcxgaLVnJflY3e1Q==
X-Received: by 2002:a2e:9557:: with SMTP id t23mr5253860ljh.193.1596366447976; 
 Sun, 02 Aug 2020 04:07:27 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:27 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 12/22] drm/panel: samsung-s6e63j0x03: Backlight update
Date: Sun,  2 Aug 2020 13:06:26 +0200
Message-Id: <20200802110636.1018743-13-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200802110636.1018743-1-sam@ravnborg.org>
References: <20200802110636.1018743-1-sam@ravnborg.org>
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
 .../gpu/drm/panel/panel-samsung-s6e63j0x03.c  | 56 +++++++++----------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
index a3570e0a90a8..f8dbb1cf1429 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c
@@ -36,7 +36,6 @@
 struct s6e63j0x03 {
 	struct device *dev;
 	struct drm_panel panel;
-	struct backlight_device *bl_dev;
 
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
@@ -181,10 +180,8 @@ static unsigned int s6e63j0x03_get_brightness_index(unsigned int brightness)
 	return index;
 }
 
-static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
-					unsigned int brightness)
+static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx, int brightness)
 {
-	struct backlight_device *bl_dev = ctx->bl_dev;
 	unsigned int index = s6e63j0x03_get_brightness_index(brightness);
 	int ret;
 
@@ -200,15 +197,13 @@ static int s6e63j0x03_update_gamma(struct s6e63j0x03 *ctx,
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
@@ -227,8 +222,6 @@ static int s6e63j0x03_disable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
-
 	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
 	if (ret < 0)
 		return ret;
@@ -247,8 +240,6 @@ static int s6e63j0x03_unprepare(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_POWERDOWN;
-
 	return 0;
 }
 
@@ -334,8 +325,6 @@ static int s6e63j0x03_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		goto err;
 
-	ctx->bl_dev->props.power = FB_BLANK_NORMAL;
-
 	return 0;
 
 err:
@@ -395,8 +384,6 @@ static int s6e63j0x03_enable(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	ctx->bl_dev->props.power = FB_BLANK_UNBLANK;
-
 	return 0;
 }
 
@@ -432,6 +419,25 @@ static const struct drm_panel_funcs s6e63j0x03_funcs = {
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
+		DRM_DEV_ERROR(dev, "error registering backlight device (%d)\n", ret);
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
@@ -469,20 +475,13 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
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
@@ -493,9 +492,6 @@ static int s6e63j0x03_probe(struct mipi_dsi_device *dsi)
 remove_panel:
 	drm_panel_remove(&ctx->panel);
 
-unregister_backlight:
-	backlight_device_unregister(ctx->bl_dev);
-
 	return ret;
 }
 
@@ -506,8 +502,6 @@ static int s6e63j0x03_remove(struct mipi_dsi_device *dsi)
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
