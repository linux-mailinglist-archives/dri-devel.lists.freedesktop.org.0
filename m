Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33A235677
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 13:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57DD6E0FE;
	Sun,  2 Aug 2020 11:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7276E0FE
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 11:07:33 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q7so36743918ljm.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqxvCt1rOGIFQUkck0vmFvnXIHbaio+eX45vsaOvh/A=;
 b=k8gz6ZkJZgnN0o263g+WRon91K2JnYLku48dG7VchwoNsWv2wbeyo4VU7z0wN9QG8w
 3NcqMHc3KJJ8iikngdNsEG9wMgd2vU+MVLdm/3T/hqDfv1B7mk1bZkhX5rDx229wpwt9
 VSsYlZedcqF/Q2BUOVo8JWOuo6JoWs9tQskYp6RPIGIs0rRwqpP/e1j4wFFH4uoT7sga
 2fCOhBR/vG5wPbDCyezGgyN3mMrAwkNrecJStX3bQYNqPI8lGUi/79a/TZdaF3F+N3Mq
 /WrIES1RRaw4rDD68ntVbN2M9/ECy3M40z46aikO5wO8e2QHegWk+cSj330lsrj79rNA
 jkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FqxvCt1rOGIFQUkck0vmFvnXIHbaio+eX45vsaOvh/A=;
 b=N7nQYfP2zluuqz2NkBINmwgYiOoDNx+ostNERPnmtmKb6b5mbJsO+kutAIHaATYYlm
 RRnkbXx1me8mFWBBQQV/L40344gDKzqCvEu9S6ojLxJesoAJtPUtRAWgRxlh0NuH0yqP
 MRrwsaMO1nOOIuHb/F4+oJTJXt9kEBPUND/xmBaEhmYaHnfpB15u3jt3fhNsL/yeDK/S
 ecmnEYBgaBpAgMMz9kHeLOuVNQXEC3YAnv0G6wn9pLX5NsVwpna0bCDuqv4WTfoPO2DV
 L9jfzSp7E3dS5nl/XJPJTBLDkrJgwKmTmkIFQLNanMRO723ny1lmQ0pTs1QAxz4jYxfb
 nrkw==
X-Gm-Message-State: AOAM5302GhMXpFa/z2LeUuMkltkm3zVlcK6HwzDNQUu4r9lC3k9rYLCx
 VfKyJY8+50ETvo0WS1aoE6Gx3GAkO/E=
X-Google-Smtp-Source: ABdhPJytNAsELnub4Rc5jK8zot96H4TGw6wAUYFxaQP5kz9SnSWQjdsFLBrGTJn+ah454yIJLSdNYQ==
X-Received: by 2002:a2e:545c:: with SMTP id y28mr5220801ljd.448.1596366452009; 
 Sun, 02 Aug 2020 04:07:32 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:b9d6:7e3c:5453:a61c])
 by smtp.gmail.com with ESMTPSA id l3sm3045520lji.115.2020.08.02.04.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 04:07:31 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 15/22] drm/panel: sony-acx565akm: Backlight update
Date: Sun,  2 Aug 2020 13:06:29 +0200
Message-Id: <20200802110636.1018743-16-sam@ravnborg.org>
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

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 44 +++++++-------------
 1 file changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 5c4b6f6e5c2d..3fc572d1de13 100644
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
@@ -348,39 +341,34 @@ static const struct backlight_ops acx565akm_bl_ops = {
 
 static int acx565akm_backlight_init(struct acx565akm_panel *lcd)
 {
-	struct backlight_properties props = {
-		.fb_blank = FB_BLANK_UNBLANK,
-		.power = FB_BLANK_UNBLANK,
-		.type = BACKLIGHT_RAW,
-	};
 	int ret;
-
-	lcd->backlight = backlight_device_register(lcd->name, &lcd->spi->dev,
-						   lcd, &acx565akm_bl_ops,
-						   &props);
-	if (IS_ERR(lcd->backlight)) {
-		ret = PTR_ERR(lcd->backlight);
-		lcd->backlight = NULL;
+	struct backlight_device *bd;
+	DECLARE_BACKLIGHT_INIT_RAW(props, 0, 255);
+
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
+	backlight_set_brightness(bd, acx565akm_get_actual_brightness(lcd));
+	backlight_set_power_on(bd);
+	backlight_update_status(bd);
 
 	return 0;
 }
@@ -390,8 +378,6 @@ static void acx565akm_backlight_cleanup(struct acx565akm_panel *lcd)
 	if (lcd->has_cabc)
 		sysfs_remove_group(&lcd->backlight->dev.kobj,
 				   &acx565akm_cabc_attr_group);
-
-	backlight_device_unregister(lcd->backlight);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
