Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F4324ECCC
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 12:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8696E4A6;
	Sun, 23 Aug 2020 10:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7056E49D
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 10:46:02 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id 185so6438957ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RhXpyMpua1abC/EmcPtseWLc5JJ/Kr/jXHKsQ/EiTsw=;
 b=UwpEL07nr13d2+pvsclRiiXC9i3AJjBzMLmZEJiUH8BZqDXABtg8B0CSaguN5pPsUf
 GnnXsa2UUHPFJQFDS3VOgyAAv74VTifivzYMVfuwOOPDWUfrlYmbuiBInbPzuqTZ9eHp
 qBVoMKDUWnJqiPt2OMlYAmeVSE2PDjL89rqhnp6sN0+Gikz0E2GrhIxD3tPUtl6rR0aq
 2YHi8XtZE48qGgT53BRoAhqoWoyhytGOsfkIHZZdUjsfcOu16rJia5HlZ07wvMZc2soA
 0DF+tAagLIWJjz8y5YyFtF/RrV2jeDVupir6jgDymmc5DkcT3KvwSXCWx2vKfkdk+kX0
 U0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RhXpyMpua1abC/EmcPtseWLc5JJ/Kr/jXHKsQ/EiTsw=;
 b=jK+a4Y/IGXDbP6EUE9JT/R3Be7QN5QGQ6x+qqASVkl2KQJjCs1QGYt4xEeOQioY9Qe
 e0z1JViDp9kU/NrI3mE6NzY8ed48/pDJwwyTaSqjPgpjRKX9Q0LkRXNiMAKgKD3vG7/d
 r2PxDQkdjDIf/URdMGbyedcdpz8r+vFyWWgC+GruSAr3/BxctyTttZsrYS860nRoq2+4
 UwWWBH289qHBH90lLUBBQfHlbMR3nA3qAM58rf/3O3qagjHt4EEu4d/HQoZv6868MOtM
 TNPeKx1T5BAnAuS9P8+E0e251yxzLfY4Y69ioOgPj1xdFHX4nDZBPGhHLntPsaftZRK4
 Z5YQ==
X-Gm-Message-State: AOAM531+6RP8+/m6xCO2kB3893eZsMdK4i/YYRZLPg5xlwJ498R42odk
 J3HxCRIDe6e7BKo4VFAxNNSLOmzilGb1Pw==
X-Google-Smtp-Source: ABdhPJx16AY5Em8toE9G9yE1IwdVxH5ePlmJ0/REnrakGFUE3NhfsppPcG5c6EWGuawJh+qylE95/w==
X-Received: by 2002:a2e:9010:: with SMTP id h16mr462772ljg.316.1598179560931; 
 Sun, 23 Aug 2020 03:46:00 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:2509:20d7:e461:9c16])
 by smtp.gmail.com with ESMTPSA id
 h13sm1516301lji.134.2020.08.23.03.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 03:46:00 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v2 07/24] drm/gma500: Backlight update
Date: Sun, 23 Aug 2020 12:45:15 +0200
Message-Id: <20200823104532.1024798-8-sam@ravnborg.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The backlight support is updated to utilise newly added macros and
functions thus simplifying the code.

- Introduced backlight_set_brightness() that can be called with a
  NULL backlight_device
- backlight_update_status() can be called with a NULL backlight_device.
  Benefit from this by removing helper that otherwise was iffed'ed out
- Use DECLARE_BACKLIGHT_INIT_PLATFORM() when creating backlight devices
- Replace direct access to backlight_properties with get/set methods

No functional changes, but a nice reduction in complexity and code.

v2:
  - Use backlight_update_brightness() (Daniel)
  -

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/backlight.c       | 34 +++++-------------------
 drivers/gpu/drm/gma500/cdv_device.c      | 24 +++++++----------
 drivers/gpu/drm/gma500/mdfld_device.c    |  9 ++-----
 drivers/gpu/drm/gma500/oaktrail_device.c | 10 ++-----
 drivers/gpu/drm/gma500/opregion.c        |  2 +-
 drivers/gpu/drm/gma500/psb_device.c      | 10 ++-----
 drivers/gpu/drm/gma500/psb_drv.c         |  7 +----
 7 files changed, 24 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index 35600d070cb5..40b96d1277be 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -13,48 +13,27 @@
 #include "intel_bios.h"
 #include "power.h"
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-static void do_gma_backlight_set(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = dev->dev_private;
-	backlight_update_status(dev_priv->backlight_device);
-}
-#endif
-
 void gma_backlight_enable(struct drm_device *dev)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	dev_priv->backlight_enabled = true;
-	if (dev_priv->backlight_device) {
-		dev_priv->backlight_device->props.brightness = dev_priv->backlight_level;
-		do_gma_backlight_set(dev);
-	}
-#endif	
+	backlight_update_brightness(dev_priv->backlight_device,
+				    dev_priv->backlight_level);
 }
 
 void gma_backlight_disable(struct drm_device *dev)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	dev_priv->backlight_enabled = false;
-	if (dev_priv->backlight_device) {
-		dev_priv->backlight_device->props.brightness = 0;
-		do_gma_backlight_set(dev);
-	}
-#endif	
+	backlight_update_brightness(dev_priv->backlight_device, 0);
 }
 
 void gma_backlight_set(struct drm_device *dev, int v)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	dev_priv->backlight_level = v;
-	if (dev_priv->backlight_device && dev_priv->backlight_enabled) {
-		dev_priv->backlight_device->props.brightness = v;
-		do_gma_backlight_set(dev);
-	}
-#endif	
+	if (dev_priv->backlight_enabled)
+		backlight_update_brightness(dev_priv->backlight_device, v);
 }
 
 int gma_backlight_init(struct drm_device *dev)
@@ -73,8 +52,7 @@ void gma_backlight_exit(struct drm_device *dev)
 #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	if (dev_priv->backlight_device) {
-		dev_priv->backlight_device->props.brightness = 0;
-		backlight_update_status(dev_priv->backlight_device);
+		backlight_update_brightness(dev_priv->backlight_device, 0);
 		backlight_device_unregister(dev_priv->backlight_device);
 	}
 #endif
diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 4d216a0205f2..52ec1b427bf8 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -111,7 +111,7 @@ static int cdv_get_brightness(struct backlight_device *bd)
 static int cdv_set_brightness(struct backlight_device *bd)
 {
 	struct drm_device *dev = bl_get_data(bd);
-	int level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 	u32 blc_pwm_ctl;
 
 	/* Percentage 1-100% being valid */
@@ -145,21 +145,17 @@ static const struct backlight_ops cdv_ops = {
 static int cdv_backlight_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = dev->dev_private;
-	struct backlight_properties props;
+	DECLARE_BACKLIGHT_INIT_PLATFORM(props, 0, 100);
+	struct backlight_device *bl;
 
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = 100;
-	props.type = BACKLIGHT_PLATFORM;
+	bl = backlight_device_register("psb-bl",
+				       NULL, (void *)dev, &cdv_ops, &props);
+	if (IS_ERR(bl))
+		return PTR_ERR(bl);
 
-	cdv_backlight_device = backlight_device_register("psb-bl",
-					NULL, (void *)dev, &cdv_ops, &props);
-	if (IS_ERR(cdv_backlight_device))
-		return PTR_ERR(cdv_backlight_device);
-
-	cdv_backlight_device->props.brightness =
-			cdv_get_brightness(cdv_backlight_device);
-	backlight_update_status(cdv_backlight_device);
-	dev_priv->backlight_device = cdv_backlight_device;
+	cdv_backlight_device = bl;
+	backlight_update_brightness(bl, cdv_get_brightness(bl));
+	dev_priv->backlight_device = bl;
 	dev_priv->backlight_enabled = true;
 	return 0;
 }
diff --git a/drivers/gpu/drm/gma500/mdfld_device.c b/drivers/gpu/drm/gma500/mdfld_device.c
index b718efccdcf2..674e6e619d9a 100644
--- a/drivers/gpu/drm/gma500/mdfld_device.c
+++ b/drivers/gpu/drm/gma500/mdfld_device.c
@@ -42,7 +42,7 @@ int mdfld_set_brightness(struct backlight_device *bd)
 	struct drm_device *dev =
 		(struct drm_device *)bl_get_data(mdfld_backlight_device);
 	struct drm_psb_private *dev_priv = dev->dev_private;
-	int level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 
 	DRM_DEBUG_DRIVER("backlight level set to %d\n", level);
 
@@ -113,12 +113,9 @@ static int device_backlight_init(struct drm_device *dev)
 
 static int mdfld_backlight_init(struct drm_device *dev)
 {
-	struct backlight_properties props;
+	DECLARE_BACKLIGHT_INIT_PLATFORM(props, BRIGHTNESS_MAX_LEVEL, BRIGHTNESS_MAX_LEVEL);
 	int ret = 0;
 
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = BRIGHTNESS_MAX_LEVEL;
-	props.type = BACKLIGHT_PLATFORM;
 	mdfld_backlight_device = backlight_device_register("mdfld-bl",
 				NULL, (void *)dev, &mdfld_ops, &props);
 
@@ -129,8 +126,6 @@ static int mdfld_backlight_init(struct drm_device *dev)
 	if (ret)
 		return ret;
 
-	mdfld_backlight_device->props.brightness = BRIGHTNESS_MAX_LEVEL;
-	mdfld_backlight_device->props.max_brightness = BRIGHTNESS_MAX_LEVEL;
 	backlight_update_status(mdfld_backlight_device);
 	return 0;
 }
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index ade7e2416a66..52c0f1a35d3f 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -55,7 +55,7 @@ static int oaktrail_set_brightness(struct backlight_device *bd)
 {
 	struct drm_device *dev = bl_get_data(oaktrail_backlight_device);
 	struct drm_psb_private *dev_priv = dev->dev_private;
-	int level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 	u32 blc_pwm_ctl;
 	u32 max_pwm_blc;
 
@@ -136,13 +136,9 @@ static const struct backlight_ops oaktrail_ops = {
 
 static int oaktrail_backlight_init(struct drm_device *dev)
 {
+	DECLARE_BACKLIGHT_INIT_PLATFORM(props, 100, 100);
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	int ret;
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = 100;
-	props.type = BACKLIGHT_PLATFORM;
 
 	oaktrail_backlight_device = backlight_device_register("oaktrail-bl",
 				NULL, (void *)dev, &oaktrail_ops, &props);
@@ -155,8 +151,6 @@ static int oaktrail_backlight_init(struct drm_device *dev)
 		backlight_device_unregister(oaktrail_backlight_device);
 		return ret;
 	}
-	oaktrail_backlight_device->props.brightness = 100;
-	oaktrail_backlight_device->props.max_brightness = 100;
 	backlight_update_status(oaktrail_backlight_device);
 	dev_priv->backlight_device = oaktrail_backlight_device;
 	return 0;
diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
index eab6d889bde9..68587cdf6206 100644
--- a/drivers/gpu/drm/gma500/opregion.c
+++ b/drivers/gpu/drm/gma500/opregion.c
@@ -163,7 +163,7 @@ static u32 asle_set_backlight(struct drm_device *dev, u32 bclp)
 	if (bclp > 255)
 		return ASLE_BACKLIGHT_FAILED;
 
-	gma_backlight_set(dev, bclp * bd->props.max_brightness / 255);
+	gma_backlight_set(dev, bclp * backlight_get_max_brightness(bd) / 255);
 
 	asle->cblv = (bclp * 0x64) / 0xff | ASLE_CBLV_VALID;
 
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index ece994c4c21a..857681b860c4 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -92,7 +92,7 @@ static int psb_backlight_setup(struct drm_device *dev)
 static int psb_set_brightness(struct backlight_device *bd)
 {
 	struct drm_device *dev = bl_get_data(psb_backlight_device);
-	int level = bd->props.brightness;
+	int level = backlight_get_brightness(bd);
 
 	/* Percentage 1-100% being valid */
 	if (level < 1)
@@ -110,13 +110,9 @@ static const struct backlight_ops psb_ops = {
 
 static int psb_backlight_init(struct drm_device *dev)
 {
+	DECLARE_BACKLIGHT_INIT_PLATFORM(props, 100, 100);
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	int ret;
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = 100;
-	props.type = BACKLIGHT_PLATFORM;
 
 	psb_backlight_device = backlight_device_register("psb-bl",
 					NULL, (void *)dev, &psb_ops, &props);
@@ -129,8 +125,6 @@ static int psb_backlight_init(struct drm_device *dev)
 		psb_backlight_device = NULL;
 		return ret;
 	}
-	psb_backlight_device->props.brightness = 100;
-	psb_backlight_device->props.max_brightness = 100;
 	backlight_update_status(psb_backlight_device);
 	dev_priv->backlight_device = psb_backlight_device;
 
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2411eb9827b8..f13d9861e571 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -398,12 +398,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 
 static inline void get_brightness(struct backlight_device *bd)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-	if (bd) {
-		bd->props.brightness = bd->ops->get_brightness(bd);
-		backlight_update_status(bd);
-	}
-#endif
+	backlight_update_brightness(bd, backlight_get_actual_brightness(bd));
 }
 
 static long psb_unlocked_ioctl(struct file *filp, unsigned int cmd,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
