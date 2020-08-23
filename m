Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFE324ECDF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734256E4CA;
	Sun, 23 Aug 2020 10:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25FE6E4AB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:15 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w14so6447595ljj.4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SeavNPqMhd//AZspSqHUZ2uIci8zHkbPfvSoePP/znU=;
 b=AjJn5fry1opA/W5E+lmdNIhz98sYqL2pg0LPGbGJngd1JitTZO13rMIM8/O66CtDXl
 y2D/IA7ONsMy1vAcmToY4dib/tK1OMKBN8byZov/21E3t6IEUFe8d7etKrI+p5xjX4jZ
 ES0K21Jp5yIMNUXWfJcTRpKo733+LylcUyn+G7Ms7EK/Ey5Sj9T2AQUr+RjbNVTVN48t
 SneqyO+ekmLxSaDu3yJl1uEClM6SaswGNGHLHjRhTfQoWlcpGaDsk9k9oXW5lpeI3T7s
 pTprtV8sJynjbOvf1mCJJHROwnaU5NSAxE6LOtpe6waXYPd63pp8c3WD01+5HH9R90ly
 qXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SeavNPqMhd//AZspSqHUZ2uIci8zHkbPfvSoePP/znU=;
 b=pwJ+SbxiDb+rmO4eGUlM962GJmNQ7oEYlsYiPyANIxeYWMn4vqd726voqxpzKsXJRw
 Zm1z889aH0YoKr/4H7fzyPbWdDXMMpB5+9XP6EHlLC0ElZWn9pQ7dMFge51BJFfTVIGn
 60btZKvxwlEIC60vgRsenrBD2Nk+GTYYRCYCq9m7I90xObqzU9yYRF11feQe0n2VH4Fv
 tztwI1RuJKz1qhLHUneAIUMPAVyyQxpnQVTB32WAgcXeMCtcr19XGiDyj5Av/EnyJb05
 Nei+ToGWz27fKx6r3D7VQy40bxfwv6MioCJWcmSk2SuN4LD2dQyYdCmpwTjvCPr/sFjU
 Rczw==
X-Gm-Message-State: AOAM5310re8P3tBteIjhfz+nrOSbc885qleiVfOB/MtHrYU8l6KNDxN7
 7O+HzNIAP5hV3ZwBCP/l8dGmiDmNCvWTSg==
X-Google-Smtp-Source: ABdhPJwvnzz7YpxMjNtIU9haWDR4w5plrB5KN3aiLRIEJZuSXZw71a+4TnwpKuN6oO3X/OLjjCIgCA==
X-Received: by 2002:a2e:b5b3:: with SMTP id f19mr423662ljn.210.1598179573992; 
 Sun, 23 Aug 2020 03:46:13 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 17/24] drm/panel: sony-acx565akm: Backlight update
Date: Sun, 23 Aug 2020 12:45:25 +0200
Message-Id: <20200823104532.1024798-18-sam@ravnborg.org>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Use backlight_get_brightness() helper
- Use backlight_is_blank() helper
- Use macro for initialization
- Drop direct access to backlight properties
- Use the devm_ variant for registering backlight device, and drop
  all explicit unregistering of the backlight device.
- Register backligt after drm_panel_init

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 47 +++++++-------------
 1 file changed, 15 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 5c4b6f6e5c2d..65da0160f2b8 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -298,13 +298,7 @@ static void acx565akm_set_brightness(struct acx565akm_panel *lcd, int level)
 static int acx565akm_bl_update_status_locked(struct backlight_device *dev)
 {
 	struct acx565akm_panel *lcd = dev_get_drvdata(&dev->dev);
-	int level;
-
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-	    dev->props.power == FB_BLANK_UNBLANK)
-		level = dev->props.brightness;
-	else
-		level = 0;
+	int level = backlight_get_brightness(dev);
 
 	acx565akm_set_brightness(lcd, level);
 
@@ -330,8 +324,7 @@ static int acx565akm_bl_get_intensity(struct backlight_device *dev)
 
 	mutex_lock(&lcd->mutex);
 
-	if (dev->props.fb_blank == FB_BLANK_UNBLANK &&
-	    dev->props.power == FB_BLANK_UNBLANK)
+	if (backlight_is_blank(dev))
 		intensity = acx565akm_get_actual_brightness(lcd);
 	else
 		intensity = 0;
@@ -348,40 +341,32 @@ static const struct backlight_ops acx565akm_bl_ops = {
 
 static int acx565akm_backlight_init(struct acx565akm_panel *lcd)
 {
-	struct backlight_properties props = {
-		.fb_blank = FB_BLANK_UNBLANK,
-		.power = FB_BLANK_UNBLANK,
-		.type = BACKLIGHT_RAW,
-	};
+	DECLARE_BACKLIGHT_INIT_RAW(props, 0, 255);
+	struct backlight_device *bd;
 	int ret;
 
-	lcd->backlight = backlight_device_register(lcd->name, &lcd->spi->dev,
-						   lcd, &acx565akm_bl_ops,
-						   &props);
-	if (IS_ERR(lcd->backlight)) {
-		ret = PTR_ERR(lcd->backlight);
-		lcd->backlight = NULL;
+	bd = devm_backlight_device_register(&lcd->spi->dev, lcd->name,
+					    &lcd->spi->dev, lcd,
+					    &acx565akm_bl_ops, &props);
+	if (IS_ERR(bd)) {
+		ret = PTR_ERR(bd);
 		return ret;
 	}
 
+	lcd->backlight = bd;
 	if (lcd->has_cabc) {
-		ret = sysfs_create_group(&lcd->backlight->dev.kobj,
+		ret = sysfs_create_group(&bd->dev.kobj,
 					 &acx565akm_cabc_attr_group);
 		if (ret < 0) {
 			dev_err(&lcd->spi->dev,
 				"%s failed to create sysfs files\n", __func__);
-			backlight_device_unregister(lcd->backlight);
 			return ret;
 		}
 
 		lcd->cabc_mode = acx565akm_get_hw_cabc_mode(lcd);
 	}
 
-	lcd->backlight->props.max_brightness = 255;
-	lcd->backlight->props.brightness = acx565akm_get_actual_brightness(lcd);
-
-	acx565akm_bl_update_status_locked(lcd->backlight);
-
+	backlight_update_brightness(bd, acx565akm_get_actual_brightness(lcd));
 	return 0;
 }
 
@@ -390,8 +375,6 @@ static void acx565akm_backlight_cleanup(struct acx565akm_panel *lcd)
 	if (lcd->has_cabc)
 		sysfs_remove_group(&lcd->backlight->dev.kobj,
 				   &acx565akm_cabc_attr_group);
-
-	backlight_device_unregister(lcd->backlight);
 }
 
 /* -----------------------------------------------------------------------------
@@ -642,15 +625,15 @@ static int acx565akm_probe(struct spi_device *spi)
 		return ret;
 	}
 
+	drm_panel_init(&lcd->panel, &lcd->spi->dev, &acx565akm_funcs,
+		       DRM_MODE_CONNECTOR_DPI);
+
 	if (lcd->has_bc) {
 		ret = acx565akm_backlight_init(lcd);
 		if (ret < 0)
 			return ret;
 	}
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &acx565akm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	ret = drm_panel_add(&lcd->panel);
 	if (ret < 0) {
 		if (lcd->has_bc)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
