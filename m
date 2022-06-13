Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D45548530
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998F810E762;
	Mon, 13 Jun 2022 12:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4967B10E75C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:35:03 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e4so6044776ljl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X932hBcrpAC64COzY/oY5XI3TXUVTSwpHB0vw4+QUQs=;
 b=Gz5z+ihuPKPTybuR84dXCuYJ+fdD61YEtySfax/HYhrYQLZ47BsBvMnag4UYn+7HV/
 mZYw7GKgF0lcIVuDD15hlilckp9gLjO5qLMITCERR2EiTUvxHt6ihfFbiSxpiz+01MAo
 H1eRpBQfhlYVdPU7hsdUakl2RaRk9HCZXCBR6kFg5cAfXvutGb7K/dAT+dyPjp+7cIsB
 SGoL5BkC0UQatRA9HO5t7YAhKHqa4IARurhB74xSQaz9aQ79Riw61JD2OXIy8yDt9xb6
 XvUOs/uHsR3hIWxY9j8KR2El27MCD3qIVjt7yTfBQiZkGkOFqiOdNQlsgog3QZVX6Bn4
 FPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X932hBcrpAC64COzY/oY5XI3TXUVTSwpHB0vw4+QUQs=;
 b=t+RZXBm6D/blWlN4Z7EHkDmk+THT17wq1B9MiG4v883ZLrUgg5aq+ih7wZ9Ic2b9pY
 /AlnPUG9w64XTvWob786XqB9O3rO+s9/E9RmXse4TM2pQkpAazJUpxevfe+7RojPxQ4g
 h/ruXbQe0aOWwbOLH+0R+Ii4XeTXXMn8vQOHS9Bk2RUl/3sTEBr8jh/lCOSxqn3GGwsV
 smsfebFMHjLJE+09NGItQdhVwSmOpdAf4nI1QkTZekMDXx9gdf+mL4zAfqNbtQhEkmwo
 zmN1zn2Ig1qvjo/EKNW1/Typ1bzFCpaGvHos9IgKYCbpJRXfZRwYSBm9+WFLDyHL6yY+
 wKFg==
X-Gm-Message-State: AOAM5311BM9mugol1Iz2MZcNlnI7CdDiKDnWVrfOvBGzukRNAlxZNsBb
 9z1hsTgq3b7WxGAAPXJTF3vjEPyfhmM=
X-Google-Smtp-Source: ABdhPJyNRgblPnbKDOgT2NBZdSXVum8FWaPLfSqgwzZFJ2fA2d95W716qOfBpJooz6W9fIZKyI7OdA==
X-Received: by 2002:a2e:9893:0:b0:255:951f:9694 with SMTP id
 b19-20020a2e9893000000b00255951f9694mr21619704ljj.283.1655123702378; 
 Mon, 13 Jun 2022 05:35:02 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:35:01 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/19] drm/gma500: Unify *_intel_lvds_set_property()
Date: Mon, 13 Jun 2022 14:34:35 +0200
Message-Id: <20220613123436.15185-19-patrik.r.jakobsson@gmail.com>
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

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 63 +---------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 64 ++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  2 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 70 +------------------------
 4 files changed, 68 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index c492f1b3c8ea..ccb489d6795b 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,71 +39,10 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static int cdv_intel_lvds_set_property(struct drm_connector *connector,
-				       struct drm_property *property,
-				       uint64_t value)
-{
-	struct drm_encoder *encoder = connector->encoder;
-
-	if (!strcmp(property->name, "scaling mode") && encoder) {
-		struct gma_crtc *crtc = to_gma_crtc(encoder->crtc);
-		uint64_t curValue;
-
-		if (!crtc)
-			return -1;
-
-		switch (value) {
-		case DRM_MODE_SCALE_FULLSCREEN:
-			break;
-		case DRM_MODE_SCALE_NO_SCALE:
-			break;
-		case DRM_MODE_SCALE_ASPECT:
-			break;
-		default:
-			return -1;
-		}
-
-		if (drm_object_property_get_value(&connector->base,
-						     property,
-						     &curValue))
-			return -1;
-
-		if (curValue == value)
-			return 0;
-
-		if (drm_object_property_set_value(&connector->base,
-							property,
-							value))
-			return -1;
-
-		if (crtc->saved_mode.hdisplay != 0 &&
-		    crtc->saved_mode.vdisplay != 0) {
-			if (!drm_crtc_helper_set_mode(encoder->crtc,
-						      &crtc->saved_mode,
-						      encoder->crtc->x,
-						      encoder->crtc->y,
-						      encoder->crtc->primary->fb))
-				return -1;
-		}
-	} else if (!strcmp(property->name, "backlight") && encoder) {
-		if (drm_object_property_set_value(&connector->base,
-							property,
-							value))
-			return -1;
-		else
-                        gma_backlight_set(encoder->dev, value);
-	} else if (!strcmp(property->name, "DPMS") && encoder) {
-		const struct drm_encoder_helper_funcs *helpers =
-					encoder->helper_private;
-		helpers->dpms(encoder, value);
-	}
-	return 0;
-}
-
 static const struct drm_connector_funcs cdv_intel_lvds_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.set_property = cdv_intel_lvds_set_property,
+	.set_property = gma_lvds_set_property,
 	.destroy = gma_lvds_destroy,
 };
 
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 9238cad5fac8..e4278d26f811 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -389,3 +389,67 @@ void gma_lvds_destroy(struct drm_connector *connector)
 	kfree(gma_connector);
 }
 
+int gma_lvds_set_property(struct drm_connector *connector,
+			  struct drm_property *property,
+			  uint64_t value)
+{
+	struct drm_encoder *encoder = connector->encoder;
+
+	if (!encoder)
+		return -1;
+
+	if (!strcmp(property->name, "scaling mode") && encoder) {
+		struct gma_crtc *crtc = to_gma_crtc(encoder->crtc);
+		uint64_t curValue;
+
+		if (!crtc)
+			return -1;
+
+		switch (value) {
+		case DRM_MODE_SCALE_FULLSCREEN:
+			break;
+		case DRM_MODE_SCALE_NO_SCALE:
+			break;
+		case DRM_MODE_SCALE_ASPECT:
+			break;
+		default:
+			return -1;
+		}
+
+		if (drm_object_property_get_value(&connector->base,
+						     property,
+						     &curValue))
+			return -1;
+
+		if (curValue == value)
+			return 0;
+
+		if (drm_object_property_set_value(&connector->base,
+							property,
+							value))
+			return -1;
+
+		if (crtc->saved_mode.hdisplay != 0 &&
+		    crtc->saved_mode.vdisplay != 0) {
+			if (!drm_crtc_helper_set_mode(encoder->crtc,
+						      &crtc->saved_mode,
+						      encoder->crtc->x,
+						      encoder->crtc->y,
+						      encoder->crtc->primary->fb))
+				return -1;
+		}
+	} else if (!strcmp(property->name, "backlight") && encoder) {
+		if (drm_object_property_set_value(&connector->base,
+							property,
+							value))
+			return -1;
+		else
+                        gma_backlight_set(encoder->dev, value);
+	} else if (!strcmp(property->name, "DPMS") && encoder) {
+		const struct drm_encoder_helper_funcs *helpers =
+					encoder->helper_private;
+		helpers->dpms(encoder, value);
+	}
+	return 0;
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 835305c900d8..ea261a60e9ff 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -31,6 +31,8 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
 void gma_lvds_destroy(struct drm_connector *connector);
+int gma_lvds_set_property(struct drm_connector *connector,
+			  struct drm_property *property, uint64_t value);
 
 extern const struct drm_encoder_helper_funcs gma_lvds_helper_funcs;
 extern const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 76742925b760..df2e770c660a 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,78 +132,10 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-int psb_intel_lvds_set_property(struct drm_connector *connector,
-				       struct drm_property *property,
-				       uint64_t value)
-{
-	struct drm_encoder *encoder = connector->encoder;
-
-	if (!encoder)
-		return -1;
-
-	if (!strcmp(property->name, "scaling mode")) {
-		struct gma_crtc *crtc = to_gma_crtc(encoder->crtc);
-		uint64_t curval;
-
-		if (!crtc)
-			goto set_prop_error;
-
-		switch (value) {
-		case DRM_MODE_SCALE_FULLSCREEN:
-			break;
-		case DRM_MODE_SCALE_NO_SCALE:
-			break;
-		case DRM_MODE_SCALE_ASPECT:
-			break;
-		default:
-			goto set_prop_error;
-		}
-
-		if (drm_object_property_get_value(&connector->base,
-						     property,
-						     &curval))
-			goto set_prop_error;
-
-		if (curval == value)
-			goto set_prop_done;
-
-		if (drm_object_property_set_value(&connector->base,
-							property,
-							value))
-			goto set_prop_error;
-
-		if (crtc->saved_mode.hdisplay != 0 &&
-		    crtc->saved_mode.vdisplay != 0) {
-			if (!drm_crtc_helper_set_mode(encoder->crtc,
-						      &crtc->saved_mode,
-						      encoder->crtc->x,
-						      encoder->crtc->y,
-						      encoder->crtc->primary->fb))
-				goto set_prop_error;
-		}
-	} else if (!strcmp(property->name, "backlight")) {
-		if (drm_object_property_set_value(&connector->base,
-							property,
-							value))
-			goto set_prop_error;
-		else
-                        gma_backlight_set(encoder->dev, value);
-	} else if (!strcmp(property->name, "DPMS")) {
-		const struct drm_encoder_helper_funcs *hfuncs
-						= encoder->helper_private;
-		hfuncs->dpms(encoder, value);
-	}
-
-set_prop_done:
-	return 0;
-set_prop_error:
-	return -1;
-}
-
 const struct drm_connector_funcs psb_intel_lvds_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.set_property = psb_intel_lvds_set_property,
+	.set_property = gma_lvds_set_property,
 	.destroy = gma_lvds_destroy,
 };
 
-- 
2.36.1

