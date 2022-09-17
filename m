Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4B5BB8A2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 16:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9E010E39C;
	Sat, 17 Sep 2022 14:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2D010E39C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663423437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ks55Iopok18QX9/fWEyFw5i727en7wSry8SZwYkWxNc=;
 b=IsceUVfNHY5ImhdccdLaFsSN8caYOJ7CTMw7GMqnxzjBJOehQG3fk6q0p009TzAjRYcq12
 bE8wdqutpL6O4qNmG4F6/uY6R+2ugwwdr1s75N8FV5RaWe2UbqsFjPcggn0DEBz8XvjI05
 s1zb77qyA1Yd1V8rbc8kshepbbRUVHU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-7LyXFOSqPG6xJciuOxkfQw-1; Sat, 17 Sep 2022 10:03:55 -0400
X-MC-Unique: 7LyXFOSqPG6xJciuOxkfQw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F75811728;
 Sat, 17 Sep 2022 14:03:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A761340C6EC2;
 Sat, 17 Sep 2022 14:03:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 1/5] drm/gma500: Refactor backlight support
Date: Sat, 17 Sep 2022 16:03:48 +0200
Message-Id: <20220917140352.526507-2-hdegoede@redhat.com>
In-Reply-To: <20220917140352.526507-1-hdegoede@redhat.com>
References: <20220917140352.526507-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor backlight support so that the gma_backlight_enable() /
gma_backlight_disable() / gma_backlight_set() functions used by
the Opregion handle will also work if no backlight_device gets
registered.

This is a preparation patch for not registering the gma500's own backlight
device when acpi_video should be used, since registering 2 backlight
devices for a single display really is undesirable.

Since the acpi-video interface often uses the OpRegion we need to keep
the OpRegion functional even when dev_priv->backlight_device is NULL.

As a result of this refactor the actual backlight_device_register()
call is moved to the shared backlight.c code and all #ifdefs related to
CONFIG_BACKLIGHT_CLASS_DEVICE are now also limited to backlight.c .

No functional changes intended.

This has been tested on a Packard Bell Dot SC (Intel Atom N2600, cedarview)
and a Sony Vaio vpc-x11s1e (Intel N540, poulsbo) laptop.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/backlight.c       | 94 +++++++++++++++---------
 drivers/gpu/drm/gma500/cdv_device.c      | 50 +++----------
 drivers/gpu/drm/gma500/oaktrail_device.c | 65 ++--------------
 drivers/gpu/drm/gma500/opregion.c        |  6 +-
 drivers/gpu/drm/gma500/psb_device.c      | 73 +-----------------
 drivers/gpu/drm/gma500/psb_drv.c         | 13 +---
 drivers/gpu/drm/gma500/psb_drv.h         | 13 ++--
 7 files changed, 87 insertions(+), 227 deletions(-)

diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index 46b9c0f13d6d..20c793de7775 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -13,69 +13,95 @@
 #include "intel_bios.h"
 #include "power.h"
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-static void do_gma_backlight_set(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	backlight_update_status(dev_priv->backlight_device);
-}
-#endif
-
 void gma_backlight_enable(struct drm_device *dev)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
 	dev_priv->backlight_enabled = true;
-	if (dev_priv->backlight_device) {
-		dev_priv->backlight_device->props.brightness = dev_priv->backlight_level;
-		do_gma_backlight_set(dev);
-	}
-#endif	
+	dev_priv->ops->backlight_set(dev, dev_priv->backlight_level);
 }
 
 void gma_backlight_disable(struct drm_device *dev)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
 	dev_priv->backlight_enabled = false;
-	if (dev_priv->backlight_device) {
-		dev_priv->backlight_device->props.brightness = 0;
-		do_gma_backlight_set(dev);
-	}
-#endif
+	dev_priv->ops->backlight_set(dev, 0);
 }
 
 void gma_backlight_set(struct drm_device *dev, int v)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
 	dev_priv->backlight_level = v;
-	if (dev_priv->backlight_device && dev_priv->backlight_enabled) {
-		dev_priv->backlight_device->props.brightness = v;
-		do_gma_backlight_set(dev);
-	}
-#endif
+	if (dev_priv->backlight_enabled)
+		dev_priv->ops->backlight_set(dev, v);
 }
 
+static int gma_backlight_get_brightness(struct backlight_device *bd)
+{
+	struct drm_device *dev = bl_get_data(bd);
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+
+	if (dev_priv->ops->backlight_get)
+		return dev_priv->ops->backlight_get(dev);
+
+	return dev_priv->backlight_level;
+}
+
+static int gma_backlight_update_status(struct backlight_device *bd)
+{
+	struct drm_device *dev = bl_get_data(bd);
+	int level = bd->props.brightness;
+
+	/* Percentage 1-100% being valid */
+	if (level < 1)
+		level = 1;
+
+	gma_backlight_set(dev, level);
+	return 0;
+}
+
+static const struct backlight_ops gma_backlight_ops = {
+	.get_brightness = gma_backlight_get_brightness,
+	.update_status  = gma_backlight_update_status,
+};
+
 int gma_backlight_init(struct drm_device *dev)
 {
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct backlight_properties props = {};
+	int ret;
+
 	dev_priv->backlight_enabled = true;
-	return dev_priv->ops->backlight_init(dev);
-#else
-	return 0;
+	dev_priv->backlight_level = 100;
+
+	ret = dev_priv->ops->backlight_init(dev);
+	if (ret)
+		return ret;
+
+#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+	props.brightness = dev_priv->backlight_level;
+	props.max_brightness = PSB_MAX_BRIGHTNESS;
+	props.type = BACKLIGHT_PLATFORM;
+
+	dev_priv->backlight_device =
+		backlight_device_register(dev_priv->ops->backlight_name,
+					  dev->dev, dev,
+					  &gma_backlight_ops, &props);
+	if (IS_ERR(dev_priv->backlight_device))
+		return PTR_ERR(dev_priv->backlight_device);
 #endif
+
+	return 0;
 }
 
 void gma_backlight_exit(struct drm_device *dev)
 {
 #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	if (dev_priv->backlight_device) {
-		dev_priv->backlight_device->props.brightness = 0;
-		backlight_update_status(dev_priv->backlight_device);
+
+	if (dev_priv->backlight_device)
 		backlight_device_unregister(dev_priv->backlight_device);
-	}
 #endif
 }
diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index ce96234f3df2..3065596257e9 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -5,7 +5,6 @@
  *
  **************************************************************************/
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 
 #include <drm/drm.h>
@@ -62,14 +61,10 @@ static int cdv_output_init(struct drm_device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-
 /*
  *	Cedartrail Backlght Interfaces
  */
 
-static struct backlight_device *cdv_backlight_device;
-
 static int cdv_backlight_combination_mode(struct drm_device *dev)
 {
 	return REG_READ(BLC_PWM_CTL2) & PWM_LEGACY_MODE;
@@ -92,9 +87,8 @@ static u32 cdv_get_max_backlight(struct drm_device *dev)
 	return max;
 }
 
-static int cdv_get_brightness(struct backlight_device *bd)
+static int cdv_get_brightness(struct drm_device *dev)
 {
-	struct drm_device *dev = bl_get_data(bd);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	u32 val = REG_READ(BLC_PWM_CTL) & BACKLIGHT_DUTY_CYCLE_MASK;
 
@@ -106,20 +100,13 @@ static int cdv_get_brightness(struct backlight_device *bd)
 		val *= lbpc;
 	}
 	return (val * 100)/cdv_get_max_backlight(dev);
-
 }
 
-static int cdv_set_brightness(struct backlight_device *bd)
+static void cdv_set_brightness(struct drm_device *dev, int level)
 {
-	struct drm_device *dev = bl_get_data(bd);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	int level = bd->props.brightness;
 	u32 blc_pwm_ctl;
 
-	/* Percentage 1-100% being valid */
-	if (level < 1)
-		level = 1;
-
 	level *= cdv_get_max_backlight(dev);
 	level /= 100;
 
@@ -136,38 +123,18 @@ static int cdv_set_brightness(struct backlight_device *bd)
 	blc_pwm_ctl = REG_READ(BLC_PWM_CTL) & ~BACKLIGHT_DUTY_CYCLE_MASK;
 	REG_WRITE(BLC_PWM_CTL, (blc_pwm_ctl |
 				(level << BACKLIGHT_DUTY_CYCLE_SHIFT)));
-	return 0;
 }
 
-static const struct backlight_ops cdv_ops = {
-	.get_brightness = cdv_get_brightness,
-	.update_status  = cdv_set_brightness,
-};
-
 static int cdv_backlight_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = 100;
-	props.type = BACKLIGHT_PLATFORM;
-
-	cdv_backlight_device = backlight_device_register("psb-bl",
-					NULL, (void *)dev, &cdv_ops, &props);
-	if (IS_ERR(cdv_backlight_device))
-		return PTR_ERR(cdv_backlight_device);
-
-	cdv_backlight_device->props.brightness =
-			cdv_get_brightness(cdv_backlight_device);
-	backlight_update_status(cdv_backlight_device);
-	dev_priv->backlight_device = cdv_backlight_device;
-	dev_priv->backlight_enabled = true;
+
+	dev_priv->backlight_level = cdv_get_brightness(dev);
+	cdv_set_brightness(dev, dev_priv->backlight_level);
+
 	return 0;
 }
 
-#endif
-
 /*
  *	Provide the Cedarview specific chip logic and low level methods
  *	for power management
@@ -613,9 +580,10 @@ const struct psb_ops cdv_chip_ops = {
 	.hotplug = cdv_hotplug_event,
 	.hotplug_enable = cdv_hotplug_enable,
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	.backlight_init = cdv_backlight_init,
-#endif
+	.backlight_get = cdv_get_brightness,
+	.backlight_set = cdv_set_brightness,
+	.backlight_name = "psb-bl",
 
 	.init_pm = cdv_init_pm,
 	.save_regs = cdv_save_display_registers,
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index f90e628cb482..2531959d3d77 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -5,7 +5,6 @@
  *
  **************************************************************************/
 
-#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/module.h>
@@ -37,29 +36,18 @@ static int oaktrail_output_init(struct drm_device *dev)
  *	Provide the low level interfaces for the Moorestown backlight
  */
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-
 #define MRST_BLC_MAX_PWM_REG_FREQ	    0xFFFF
 #define BLC_PWM_PRECISION_FACTOR 100	/* 10000000 */
 #define BLC_PWM_FREQ_CALC_CONSTANT 32
 #define MHz 1000000
 #define BLC_ADJUSTMENT_MAX 100
 
-static struct backlight_device *oaktrail_backlight_device;
-static int oaktrail_brightness;
-
-static int oaktrail_set_brightness(struct backlight_device *bd)
+static void oaktrail_set_brightness(struct drm_device *dev, int level)
 {
-	struct drm_device *dev = bl_get_data(oaktrail_backlight_device);
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	int level = bd->props.brightness;
 	u32 blc_pwm_ctl;
 	u32 max_pwm_blc;
 
-	/* Percentage 1-100% being valid */
-	if (level < 1)
-		level = 1;
-
 	if (gma_power_begin(dev, 0)) {
 		/* Calculate and set the brightness value */
 		max_pwm_blc = REG_READ(BLC_PWM_CTL) >> 16;
@@ -82,19 +70,9 @@ static int oaktrail_set_brightness(struct backlight_device *bd)
 		REG_WRITE(BLC_PWM_CTL, (max_pwm_blc << 16) | blc_pwm_ctl);
 		gma_power_end(dev);
 	}
-	oaktrail_brightness = level;
-	return 0;
-}
-
-static int oaktrail_get_brightness(struct backlight_device *bd)
-{
-	/* return locally cached var instead of HW read (due to DPST etc.) */
-	/* FIXME: ideally return actual value in case firmware fiddled with
-	   it */
-	return oaktrail_brightness;
 }
 
-static int device_backlight_init(struct drm_device *dev)
+static int oaktrail_backlight_init(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	unsigned long core_clock;
@@ -123,44 +101,11 @@ static int device_backlight_init(struct drm_device *dev)
 		REG_WRITE(BLC_PWM_CTL, value | (value << 16));
 		gma_power_end(dev);
 	}
-	return 0;
-}
-
-static const struct backlight_ops oaktrail_ops = {
-	.get_brightness = oaktrail_get_brightness,
-	.update_status  = oaktrail_set_brightness,
-};
 
-static int oaktrail_backlight_init(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	int ret;
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = 100;
-	props.type = BACKLIGHT_PLATFORM;
-
-	oaktrail_backlight_device = backlight_device_register("oaktrail-bl",
-				NULL, (void *)dev, &oaktrail_ops, &props);
-
-	if (IS_ERR(oaktrail_backlight_device))
-		return PTR_ERR(oaktrail_backlight_device);
-
-	ret = device_backlight_init(dev);
-	if (ret < 0) {
-		backlight_device_unregister(oaktrail_backlight_device);
-		return ret;
-	}
-	oaktrail_backlight_device->props.brightness = 100;
-	oaktrail_backlight_device->props.max_brightness = 100;
-	backlight_update_status(oaktrail_backlight_device);
-	dev_priv->backlight_device = oaktrail_backlight_device;
+	oaktrail_set_brightness(dev, PSB_MAX_BRIGHTNESS);
 	return 0;
 }
 
-#endif
-
 /*
  *	Provide the Moorestown specific chip logic and low level methods
  *	for power management
@@ -545,9 +490,9 @@ const struct psb_ops oaktrail_chip_ops = {
 
 	.output_init = oaktrail_output_init,
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	.backlight_init = oaktrail_backlight_init,
-#endif
+	.backlight_set = oaktrail_set_brightness,
+	.backlight_name = "oaktrail-bl",
 
 	.save_regs = oaktrail_save_display_registers,
 	.restore_regs = oaktrail_restore_display_registers,
diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
index dc494df71a48..0c271072af63 100644
--- a/drivers/gpu/drm/gma500/opregion.c
+++ b/drivers/gpu/drm/gma500/opregion.c
@@ -150,21 +150,17 @@ static u32 asle_set_backlight(struct drm_device *dev, u32 bclp)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct opregion_asle *asle = dev_priv->opregion.asle;
-	struct backlight_device *bd = dev_priv->backlight_device;
 
 	DRM_DEBUG_DRIVER("asle set backlight %x\n", bclp);
 
 	if (!(bclp & ASLE_BCLP_VALID))
 		return ASLE_BACKLIGHT_FAILED;
 
-	if (bd == NULL)
-		return ASLE_BACKLIGHT_FAILED;
-
 	bclp &= ASLE_BCLP_MSK;
 	if (bclp > 255)
 		return ASLE_BACKLIGHT_FAILED;
 
-	gma_backlight_set(dev, bclp * bd->props.max_brightness / 255);
+	gma_backlight_set(dev, bclp * PSB_MAX_BRIGHTNESS / 255);
 
 	asle->cblv = (bclp * 0x64) / 0xff | ASLE_CBLV_VALID;
 
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 71534f4ca834..3c294c38bdb4 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -5,8 +5,6 @@
  *
  **************************************************************************/
 
-#include <linux/backlight.h>
-
 #include <drm/drm.h>
 
 #include "gma_device.h"
@@ -24,8 +22,6 @@ static int psb_output_init(struct drm_device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-
 /*
  *	Poulsbo Backlight Interfaces
  */
@@ -41,18 +37,6 @@ static int psb_output_init(struct drm_device *dev)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 
-static int psb_brightness;
-static struct backlight_device *psb_backlight_device;
-
-static int psb_get_brightness(struct backlight_device *bd)
-{
-	/* return locally cached var instead of HW read (due to DPST etc.) */
-	/* FIXME: ideally return actual value in case firmware fiddled with
-	   it */
-	return psb_brightness;
-}
-
-
 static int psb_backlight_setup(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
@@ -86,62 +70,13 @@ static int psb_backlight_setup(struct drm_device *dev)
 		REG_WRITE(BLC_PWM_CTL,
 			(value << PSB_BACKLIGHT_PWM_CTL_SHIFT) | (value));
 	}
-	return 0;
-}
-
-static int psb_set_brightness(struct backlight_device *bd)
-{
-	struct drm_device *dev = bl_get_data(psb_backlight_device);
-	int level = bd->props.brightness;
-
-	/* Percentage 1-100% being valid */
-	if (level < 1)
-		level = 1;
-
-	psb_intel_lvds_set_brightness(dev, level);
-	psb_brightness = level;
-	return 0;
-}
-
-static const struct backlight_ops psb_ops = {
-	.get_brightness = psb_get_brightness,
-	.update_status  = psb_set_brightness,
-};
-
-static int psb_backlight_init(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	int ret;
-	struct backlight_properties props;
-
-	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness = 100;
-	props.type = BACKLIGHT_PLATFORM;
-
-	psb_backlight_device = backlight_device_register("psb-bl",
-					NULL, (void *)dev, &psb_ops, &props);
-	if (IS_ERR(psb_backlight_device))
-		return PTR_ERR(psb_backlight_device);
-
-	ret = psb_backlight_setup(dev);
-	if (ret < 0) {
-		backlight_device_unregister(psb_backlight_device);
-		psb_backlight_device = NULL;
-		return ret;
-	}
-	psb_backlight_device->props.brightness = 100;
-	psb_backlight_device->props.max_brightness = 100;
-	backlight_update_status(psb_backlight_device);
-	dev_priv->backlight_device = psb_backlight_device;
 
+	psb_intel_lvds_set_brightness(dev, PSB_MAX_BRIGHTNESS);
 	/* This must occur after the backlight is properly initialised */
 	psb_lid_timer_init(dev_priv);
-
 	return 0;
 }
 
-#endif
-
 /*
  *	Provide the Poulsbo specific chip logic and low level methods
  *	for power management
@@ -345,9 +280,9 @@ const struct psb_ops psb_chip_ops = {
 
 	.output_init = psb_output_init,
 
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-	.backlight_init = psb_backlight_init,
-#endif
+	.backlight_init = psb_backlight_setup,
+	.backlight_set = psb_intel_lvds_set_brightness,
+	.backlight_name = "psb-bl",
 
 	.init_pm = psb_init_pm,
 	.save_regs = psb_save_display_registers,
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 9168bc620628..d3dc16193a29 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -169,8 +169,7 @@ static void psb_driver_unload(struct drm_device *dev)
 
 	/* TODO: Kill vblank etc here */
 
-	if (dev_priv->backlight_device)
-		gma_backlight_exit(dev);
+	gma_backlight_exit(dev);
 	psb_modeset_cleanup(dev);
 
 	gma_irq_uninstall(dev);
@@ -415,16 +414,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	return ret;
 }
 
-static inline void get_brightness(struct backlight_device *bd)
-{
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
-	if (bd) {
-		bd->props.brightness = bd->ops->get_brightness(bd);
-		backlight_update_status(bd);
-	}
-#endif
-}
-
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct drm_psb_private *dev_priv;
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 049701ce8a5f..ae544b69fc47 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -172,6 +172,8 @@
 #define PSB_WATCHDOG_DELAY (HZ * 2)
 #define PSB_LID_DELAY (HZ / 10)
 
+#define PSB_MAX_BRIGHTNESS		100
+
 #define PSB_PWR_STATE_ON		1
 #define PSB_PWR_STATE_OFF		2
 
@@ -522,10 +524,6 @@ struct drm_psb_private {
 
 	struct drm_fb_helper *fb_helper;
 
-	/* Panel brightness */
-	int brightness;
-	int brightness_adjusted;
-
 	bool dsr_enable;
 	u32 dsr_fb_update;
 	bool dpi_panel_on[3];
@@ -594,10 +592,13 @@ struct psb_ops {
 	void (*disable_sr)(struct drm_device *dev);
 
 	void (*lvds_bl_power)(struct drm_device *dev, bool on);
-#ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
+
 	/* Backlight */
 	int (*backlight_init)(struct drm_device *dev);
-#endif
+	void (*backlight_set)(struct drm_device *dev, int level);
+	int (*backlight_get)(struct drm_device *dev);
+	const char *backlight_name;
+
 	int i2c_bus;		/* I2C bus identifier for Moorestown */
 };
 
-- 
2.37.3

