Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970C548525
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F67F10E5B1;
	Mon, 13 Jun 2022 12:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47CA10E522
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:41 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id g2so6020741ljk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iyv5ZvifsqAe/gdbT3W8e1VxPY2dWsn2sLzsBfR2yq8=;
 b=h7kvaqO/dwRbsWsx6EyKGqEF2WaOG3B3G9gjnaBVNP6qCcuR6Vkuo9WdxcJOSVodWq
 RQ7vNQzw0mzB5hxD994PbQzqNK6tXlGdymmVz2im1kZAtIn6BTGAz/EwvSM61EbINZ6P
 3o/akAF8sQcnwsZ4Z2csguHt7vVByaO5ETBJEMtha9cNdWqo6guEtMfJSNP0VyqtdBXs
 cabmnczqIqJzVw/tmSZ3MHx4x8pttky6BSOdodGVwKMb7mG+SOtdZi5Hwed6pGu7Ixrh
 wRsOavWp98z570KrRb4dVg6cqMLGvG+g8GSmZKs9GNfDQVumbZlgGzN1MmJgU8hnsTQv
 Y8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iyv5ZvifsqAe/gdbT3W8e1VxPY2dWsn2sLzsBfR2yq8=;
 b=UiCJdyNyN/vq7yUeIOCx9GW5IeHtaUxK258iiZMRV09nmFt7IA7UOgAuSmwQiXtNZO
 Nxqhdv9Axp4jf1vhbWDC/Ylyu2qdsQd7Y8jKt9bZKz+jQuH/dPZSGG6/PVaC/JxsMTiF
 IZ5jfHuy3HHuHGAPHUyBvEahQM3ioWkUEfAQInNpByNhURWaIMhvcLruiK+La5//6rbx
 Vy/QPfFIp2EMtB2FY0sZcCLWgaoTZLo/zSBQ1BE/1STVIBzkIz+b0X+wDKF07mRBGcrd
 NIkcEB2QO1XsQneG153NJMJ+3VlELn2f9bV1fJAPUKF3F57moKgyddtNy00RQxkejXV+
 mC3w==
X-Gm-Message-State: AOAM533ov5Xvl9dgnIzB6SkZHvHJC0SmsS8EdkbO+xLAUFNRoCC7ohTP
 vvJ+AuYkna5wIXHQ17HPx8ADGVSGrVA=
X-Google-Smtp-Source: ABdhPJzBtsyStIvJqidVjZu1l4cJGohIUdjUgmeeYOJBUJ2ediXT3CBERUDkI3RA2o/6jfKSb2S5Qw==
X-Received: by 2002:a2e:8805:0:b0:255:6e73:9a67 with SMTP id
 x5-20020a2e8805000000b002556e739a67mr31696637ljh.426.1655123679803; 
 Mon, 13 Jun 2022 05:34:39 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:39 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/19] drm/gma500: Unify *_lvds_get_max_backlight()
Date: Mon, 13 Jun 2022 14:34:18 +0200
Message-Id: <20220613123436.15185-2-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions mostly do the same thing so unify them into one. All
unified lvds code will live in gma_lvds.c.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/Makefile         |  1 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 27 +++----------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 34 +++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       | 12 +++++++++
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 23 ++--------------
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 36 ++++---------------------
 6 files changed, 57 insertions(+), 76 deletions(-)
 create mode 100644 drivers/gpu/drm/gma500/gma_lvds.c
 create mode 100644 drivers/gpu/drm/gma500/gma_lvds.h

diff --git a/drivers/gpu/drm/gma500/Makefile b/drivers/gpu/drm/gma500/Makefile
index 63012bf2485a..6c707b5d29dc 100644
--- a/drivers/gpu/drm/gma500/Makefile
+++ b/drivers/gpu/drm/gma500/Makefile
@@ -15,6 +15,7 @@ gma500_gfx-y += \
 	  gem.o \
 	  gma_device.o \
 	  gma_display.o \
+	  gma_lvds.o \
 	  gtt.o \
 	  intel_bios.o \
 	  intel_gmbus.o \
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index be6efcaaa3b3..0c7c4a539e50 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -20,6 +20,7 @@
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
+#include "gma_lvds.h"
 
 /*
  * LVDS I2C backlight control macros
@@ -52,32 +53,10 @@ struct cdv_intel_lvds_priv {
 	uint32_t saveBLC_PWM_CTL;
 };
 
-/*
- * Returns the maximum level of the backlight duty cycle field.
- */
-static u32 cdv_intel_lvds_get_max_backlight(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 retval;
-
-	if (gma_power_begin(dev, false)) {
-		retval = ((REG_READ(BLC_PWM_CTL) &
-			  BACKLIGHT_MODULATION_FREQ_MASK) >>
-			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
-
-		gma_power_end(dev);
-	} else
-		retval = ((dev_priv->regs.saveBLC_PWM_CTL &
-			  BACKLIGHT_MODULATION_FREQ_MASK) >>
-			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
-
-	return retval;
-}
-
 /*
  * Sets the backlight level.
  *
- * level backlight level, from 0 to cdv_intel_lvds_get_max_backlight().
+ * level backlight level, from 0 to gma_lvds_get_max_backlight().
  */
 static void cdv_intel_lvds_set_backlight(struct drm_device *dev, int level)
 {
@@ -250,7 +229,7 @@ static void cdv_intel_lvds_commit(struct drm_encoder *encoder)
 
 	if (mode_dev->backlight_duty_cycle == 0)
 		mode_dev->backlight_duty_cycle =
-		    cdv_intel_lvds_get_max_backlight(dev);
+		    gma_lvds_get_max_backlight(dev);
 
 	cdv_intel_lvds_set_power(dev, encoder, true);
 }
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
new file mode 100644
index 000000000000..0b646c7c7432
--- /dev/null
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright © 2006-2011 Intel Corporation
+ */
+
+#include "psb_drv.h"
+#include "psb_intel_drv.h"
+#include "power.h"
+#include "psb_intel_reg.h"
+
+/*
+ * Returns the maximum level of the backlight duty cycle field.
+ */
+u32 gma_lvds_get_max_backlight(struct drm_device *dev)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	u32 retval;
+
+	if (gma_power_begin(dev, false)) {
+		retval = ((REG_READ(BLC_PWM_CTL) &
+			  BACKLIGHT_MODULATION_FREQ_MASK) >>
+			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
+
+		gma_power_end(dev);
+	} else
+		retval = ((dev_priv->regs.saveBLC_PWM_CTL &
+			  BACKLIGHT_MODULATION_FREQ_MASK) >>
+			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
+
+	return retval;
+}
+
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
new file mode 100644
index 000000000000..2a9ce8ee3fa7
--- /dev/null
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Copyright © 2006-2011 Intel Corporation
+ */
+
+#ifndef _GMA_LVDS_H
+#define _GMA_LVDS_H
+
+u32 gma_lvds_get_max_backlight(struct drm_device *dev);
+
+#endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 9c9ebf8e29c4..4913baca7ae2 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -20,6 +20,7 @@
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
+#include "gma_lvds.h"
 
 /* The max/min PWM frequency in BPCR[31:17] - */
 /* The smallest number is 1 (not 0) that can fit in the
@@ -170,25 +171,6 @@ static void oaktrail_lvds_prepare(struct drm_encoder *encoder)
 	gma_power_end(dev);
 }
 
-static u32 oaktrail_lvds_get_max_backlight(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 ret;
-
-	if (gma_power_begin(dev, false)) {
-		ret = ((REG_READ(BLC_PWM_CTL) &
-			  BACKLIGHT_MODULATION_FREQ_MASK) >>
-			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
-
-		gma_power_end(dev);
-	} else
-		ret = ((dev_priv->regs.saveBLC_PWM_CTL &
-			  BACKLIGHT_MODULATION_FREQ_MASK) >>
-			  BACKLIGHT_MODULATION_FREQ_SHIFT) * 2;
-
-	return ret;
-}
-
 static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
@@ -197,8 +179,7 @@ static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
 	if (mode_dev->backlight_duty_cycle == 0)
-		mode_dev->backlight_duty_cycle =
-					oaktrail_lvds_get_max_backlight(dev);
+		mode_dev->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
 	oaktrail_lvds_set_power(dev, gma_encoder, true);
 }
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 7ee6c8ce103b..371c202a15ce 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -18,6 +18,7 @@
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
+#include "gma_lvds.h"
 
 /*
  * LVDS I2C backlight control macros
@@ -52,32 +53,6 @@ struct psb_intel_lvds_priv {
 	struct gma_i2c_chan *i2c_bus;
 };
 
-
-/*
- * Returns the maximum level of the backlight duty cycle field.
- */
-static u32 psb_intel_lvds_get_max_backlight(struct drm_device *dev)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 ret;
-
-	if (gma_power_begin(dev, false)) {
-		ret = REG_READ(BLC_PWM_CTL);
-		gma_power_end(dev);
-	} else /* Powered off, use the saved value */
-		ret = dev_priv->regs.saveBLC_PWM_CTL;
-
-	/* Top 15bits hold the frequency mask */
-	ret = (ret &  BACKLIGHT_MODULATION_FREQ_MASK) >>
-					BACKLIGHT_MODULATION_FREQ_SHIFT;
-
-        ret *= 2;	/* Return a 16bit range as needed for setting */
-        if (ret == 0)
-                dev_err(dev->dev, "BL bug: Reg %08x save %08X\n",
-                        REG_READ(BLC_PWM_CTL), dev_priv->regs.saveBLC_PWM_CTL);
-	return ret;
-}
-
 /*
  * Set LVDS backlight level by I2C command
  *
@@ -131,7 +106,7 @@ static int psb_lvds_pwm_set_brightness(struct drm_device *dev, int level)
 	u32 max_pwm_blc;
 	u32 blc_pwm_duty_cycle;
 
-	max_pwm_blc = psb_intel_lvds_get_max_backlight(dev);
+	max_pwm_blc = gma_lvds_get_max_backlight(dev);
 
 	/*BLC_PWM_CTL Should be initiated while backlight device init*/
 	BUG_ON(max_pwm_blc == 0);
@@ -176,7 +151,7 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 /*
  * Sets the backlight level.
  *
- * level: backlight level, from 0 to psb_intel_lvds_get_max_backlight().
+ * level: backlight level, from 0 to gma_lvds_get_max_backlight().
  */
 static void psb_intel_lvds_set_backlight(struct drm_device *dev, int level)
 {
@@ -275,8 +250,7 @@ static void psb_intel_lvds_save(struct drm_connector *connector)
 	 * just make it full brightness
 	 */
 	if (dev_priv->backlight_duty_cycle == 0)
-		dev_priv->backlight_duty_cycle =
-		psb_intel_lvds_get_max_backlight(dev);
+		dev_priv->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
 
 	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
 			lvds_priv->savePP_ON,
@@ -445,7 +419,7 @@ static void psb_intel_lvds_commit(struct drm_encoder *encoder)
 
 	if (mode_dev->backlight_duty_cycle == 0)
 		mode_dev->backlight_duty_cycle =
-		    psb_intel_lvds_get_max_backlight(dev);
+		    gma_lvds_get_max_backlight(dev);
 
 	psb_intel_lvds_set_power(dev, true);
 }
-- 
2.36.1

