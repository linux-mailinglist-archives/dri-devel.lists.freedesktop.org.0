Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2154852B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E7D10E75D;
	Mon, 13 Jun 2022 12:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBC010E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:44 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y15so6068713ljc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A536hY9YQsFyBovKDZMrUH1rXszN8Ez6MfyfQ8rxnxE=;
 b=iIRQ3BH4RLLFUab7GVtiI+FiPzfIrjnSIOfQOFzcx2w8yBo93ZX/G9C+FBs9iPhZTN
 7Jy/HHa6bOM6AYb9OM2v47Ybo4dRXoOx415KHSq73ySBSmUPajzWo8PNzUeSsv7xX1qa
 dAdhjaqxK/JkXYRsK6aH9CH8bVS8P0FgS7oJtQfFxKKlnYVUYHQJrkO3quGWg6PMmY/r
 iZuzshqOfWm/BgsZaonbpA2aue12HpgTSJcVb73vz+FC1jkIZiUGVCCZZlnJ0pwhEE0m
 DwBPkmtq1k8mExbBKzuUFmqMdBv/qCBvL8yVwGXJboTAogEojSZS9y1w3rfukbzq1tdR
 hnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A536hY9YQsFyBovKDZMrUH1rXszN8Ez6MfyfQ8rxnxE=;
 b=QbUN2obHP98gRiJFNObLZPWrHMwdM7pJSHme5i+SopMZR3YDz05nMEo4HOnE+xhF1O
 WRKBrAZCJUXnQmUfT1PBf+pO4ZNMO6YbE19ZkcwMK0MJl8arqtq+p1qW/sL3dUHuKzax
 kkacDRm5gTAE4DvOqGL66Iyeix2JOVqZJHztKq56lD0xWgg0I8adJ8VgZSA+10RzXa1W
 cR0/XZMP9QTbYbYfnHBjrhnpWpKT0RlPfnWHR0GP0jj7g+YYI1F71sS/LEZbUMbco6Nx
 ao8urYPpevowUTtnM6iEEF4MNW5R0aEJ7YFxOCvmcZTmWn6/yc+g2ME14/ziSYPiwqIr
 G+DQ==
X-Gm-Message-State: AOAM53177zkeJHBiES81c2YFYqiEHbBKIJuD0MmF8fUTADtsx64sSt1s
 W4Gt/Jejfv4JJ/IkdIHVAPwezqQwkBA=
X-Google-Smtp-Source: ABdhPJwHdwHdgYIMr/LjyyZiOh0wlgb7LZhZ7pdo6X8FnVo/3w0Zc/FiP82arGjiOl8bk6j0gXl0JA==
X-Received: by 2002:a2e:8919:0:b0:255:5b60:e8b7 with SMTP id
 d25-20020a2e8919000000b002555b60e8b7mr36327100lji.294.1655123682591; 
 Mon, 13 Jun 2022 05:34:42 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:42 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/19] drm/gma500: Unify *_lvds_set_power()
Date: Mon, 13 Jun 2022 14:34:20 +0200
Message-Id: <20220613123436.15185-4-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These functions mostly do the same thing so unify them into one.
Oaktrail doesn't power on/off the backlight so don't touch that. Ignore
runtime-pm stuff since runtime-pm is broken anyways.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 41 +++------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 37 ++++++++++++++++++-
 drivers/gpu/drm/gma500/gma_lvds.h       |  2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 47 +++----------------------
 drivers/gpu/drm/gma500/psb_drv.h        |  1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 43 +++-------------------
 6 files changed, 49 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 615570de82b0..7bf883bb8104 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -53,46 +53,13 @@ struct cdv_intel_lvds_priv {
 	uint32_t saveBLC_PWM_CTL;
 };
 
-/*
- * Sets the power state for the panel.
- */
-static void cdv_intel_lvds_set_power(struct drm_device *dev,
-				     struct drm_encoder *encoder, bool on)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 pp_status;
-
-	if (!gma_power_begin(dev, true))
-		return;
-
-	if (on) {
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
-			  POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while ((pp_status & PP_ON) == 0);
-
-		gma_lvds_set_backlight(dev,
-				dev_priv->mode_dev.backlight_duty_cycle);
-	} else {
-		gma_lvds_set_backlight(dev, 0);
-
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
-			  ~POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while (pp_status & PP_ON);
-	}
-	gma_power_end(dev);
-}
-
 static void cdv_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct drm_device *dev = encoder->dev;
 	if (mode == DRM_MODE_DPMS_ON)
-		cdv_intel_lvds_set_power(dev, encoder, true);
+		gma_lvds_set_power(dev, true);
 	else
-		cdv_intel_lvds_set_power(dev, encoder, false);
+		gma_lvds_set_power(dev, false);
 	/* XXX: We never power down the LVDS pairs. */
 }
 
@@ -191,7 +158,7 @@ static void cdv_intel_lvds_prepare(struct drm_encoder *encoder)
 	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
 					  BACKLIGHT_DUTY_CYCLE_MASK);
 
-	cdv_intel_lvds_set_power(dev, encoder, false);
+	gma_lvds_set_power(dev, false);
 
 	gma_power_end(dev);
 }
@@ -206,7 +173,7 @@ static void cdv_intel_lvds_commit(struct drm_encoder *encoder)
 		mode_dev->backlight_duty_cycle =
 		    gma_lvds_get_max_backlight(dev);
 
-	cdv_intel_lvds_set_power(dev, encoder, true);
+	gma_lvds_set_power(dev, true);
 }
 
 static void cdv_intel_lvds_mode_set(struct drm_encoder *encoder,
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 5b041fab82ba..11efbb14b55c 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -36,7 +36,7 @@ u32 gma_lvds_get_max_backlight(struct drm_device *dev)
  *
  * level: backlight level, from 0 to gma_lvds_get_max_backlight().
  */
-void gma_lvds_set_backlight(struct drm_device *dev, int level)
+static void gma_lvds_set_backlight(struct drm_device *dev, int level)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 blc_pwm_ctl;
@@ -58,3 +58,38 @@ void gma_lvds_set_backlight(struct drm_device *dev, int level)
 	}
 }
 
+/*
+ * Sets the power state for the panel.
+ */
+void gma_lvds_set_power(struct drm_device *dev, bool on)
+{
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	u32 pp_status;
+
+	if (!gma_power_begin(dev, true))
+		return;
+
+	if (on) {
+		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
+			  POWER_TARGET_ON);
+		do {
+			pp_status = REG_READ(PP_STATUS);
+		} while ((pp_status & PP_ON) == 0);
+
+		if (!IS_MRST(dev)) {
+			gma_lvds_set_backlight(dev,
+				dev_priv->mode_dev.backlight_duty_cycle);
+		}
+	} else {
+		if (!IS_MRST(dev))
+			gma_lvds_set_backlight(dev, 0);
+
+		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
+			  ~POWER_TARGET_ON);
+		do {
+			pp_status = REG_READ(PP_STATUS);
+		} while (pp_status & PP_ON);
+	}
+	gma_power_end(dev);
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index f26cc69b6caa..477d3b5005f7 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -8,6 +8,6 @@
 #define _GMA_LVDS_H
 
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
-void gma_lvds_set_backlight(struct drm_device *dev, int level);
+void gma_lvds_set_power(struct drm_device *dev, bool on);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 4913baca7ae2..9634807e4d8c 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -30,51 +30,14 @@
 #define MRST_BLC_MAX_PWM_REG_FREQ	    0xFFFF
 #define BRIGHTNESS_MAX_LEVEL 100
 
-/*
- * Sets the power state for the panel.
- */
-static void oaktrail_lvds_set_power(struct drm_device *dev,
-				struct gma_encoder *gma_encoder,
-				bool on)
-{
-	u32 pp_status;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-
-	if (!gma_power_begin(dev, true))
-		return;
-
-	if (on) {
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
-			  POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while ((pp_status & (PP_ON | PP_READY)) == PP_READY);
-		dev_priv->is_lvds_on = true;
-		if (dev_priv->ops->lvds_bl_power)
-			dev_priv->ops->lvds_bl_power(dev, true);
-	} else {
-		if (dev_priv->ops->lvds_bl_power)
-			dev_priv->ops->lvds_bl_power(dev, false);
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
-			  ~POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while (pp_status & PP_ON);
-		dev_priv->is_lvds_on = false;
-		pm_request_idle(dev->dev);
-	}
-	gma_power_end(dev);
-}
-
 static void oaktrail_lvds_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 
 	if (mode == DRM_MODE_DPMS_ON)
-		oaktrail_lvds_set_power(dev, gma_encoder, true);
+		gma_lvds_set_power(dev, true);
 	else
-		oaktrail_lvds_set_power(dev, gma_encoder, false);
+		gma_lvds_set_power(dev, false);
 
 	/* XXX: We never power down the LVDS pairs. */
 }
@@ -158,7 +121,6 @@ static void oaktrail_lvds_prepare(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
 	if (!gma_power_begin(dev, true))
@@ -167,7 +129,7 @@ static void oaktrail_lvds_prepare(struct drm_encoder *encoder)
 	mode_dev->saveBLC_PWM_CTL = REG_READ(BLC_PWM_CTL);
 	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
 					  BACKLIGHT_DUTY_CYCLE_MASK);
-	oaktrail_lvds_set_power(dev, gma_encoder, false);
+	gma_lvds_set_power(dev, false);
 	gma_power_end(dev);
 }
 
@@ -175,12 +137,11 @@ static void oaktrail_lvds_commit(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
 
 	if (mode_dev->backlight_duty_cycle == 0)
 		mode_dev->backlight_duty_cycle = gma_lvds_get_max_backlight(dev);
-	oaktrail_lvds_set_power(dev, gma_encoder, true);
+	gma_lvds_set_power(dev, true);
 }
 
 static const struct drm_encoder_helper_funcs oaktrail_lvds_helper_funcs = {
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 0ea3d23575f3..2789ae9efe3c 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -601,7 +601,6 @@ struct psb_ops {
 	void (*update_wm)(struct drm_device *dev, struct drm_crtc *crtc);
 	void (*disable_sr)(struct drm_device *dev);
 
-	void (*lvds_bl_power)(struct drm_device *dev, bool on);
 #ifdef CONFIG_BACKLIGHT_CLASS_DEVICE
 	/* Backlight */
 	int (*backlight_init)(struct drm_device *dev);
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index a304f840b127..06f1bd2250dd 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -148,49 +148,14 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-/*
- * Sets the power state for the panel.
- */
-static void psb_intel_lvds_set_power(struct drm_device *dev, bool on)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	u32 pp_status;
-
-	if (!gma_power_begin(dev, true)) {
-	        dev_err(dev->dev, "set power, chip off!\n");
-		return;
-        }
-
-	if (on) {
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) |
-			  POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while ((pp_status & PP_ON) == 0);
-
-		gma_lvds_set_backlight(dev, mode_dev->backlight_duty_cycle);
-	} else {
-		gma_lvds_set_backlight(dev, 0);
-
-		REG_WRITE(PP_CONTROL, REG_READ(PP_CONTROL) &
-			  ~POWER_TARGET_ON);
-		do {
-			pp_status = REG_READ(PP_STATUS);
-		} while (pp_status & PP_ON);
-	}
-
-	gma_power_end(dev);
-}
-
 static void psb_intel_lvds_encoder_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct drm_device *dev = encoder->dev;
 
 	if (mode == DRM_MODE_DPMS_ON)
-		psb_intel_lvds_set_power(dev, true);
+		gma_lvds_set_power(dev, true);
 	else
-		psb_intel_lvds_set_power(dev, false);
+		gma_lvds_set_power(dev, false);
 
 	/* XXX: We never power down the LVDS pairs. */
 }
@@ -378,7 +343,7 @@ static void psb_intel_lvds_prepare(struct drm_encoder *encoder)
 	mode_dev->backlight_duty_cycle = (mode_dev->saveBLC_PWM_CTL &
 					  BACKLIGHT_DUTY_CYCLE_MASK);
 
-	psb_intel_lvds_set_power(dev, false);
+	gma_lvds_set_power(dev, false);
 
 	gma_power_end(dev);
 }
@@ -393,7 +358,7 @@ static void psb_intel_lvds_commit(struct drm_encoder *encoder)
 		mode_dev->backlight_duty_cycle =
 		    gma_lvds_get_max_backlight(dev);
 
-	psb_intel_lvds_set_power(dev, true);
+	gma_lvds_set_power(dev, true);
 }
 
 static void psb_intel_lvds_mode_set(struct drm_encoder *encoder,
-- 
2.36.1

