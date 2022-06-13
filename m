Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7354853E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609B510E780;
	Mon, 13 Jun 2022 12:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B2610E76B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:57 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 20so8599561lfz.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SCrm91gLJk0MFOsre/PgWeLSvVA34lRaSk1noLyxJm0=;
 b=fxUi9RqztJx5avSbi4cZ0nZslBWIiA42d7jaxvcWWlYYC/PwSAnsJTuQfvKcxOAll2
 XPP+ca5l598CTrp02iaLWFkEPm2h5a2FoJdGY9XUGgThOEpqz83FpHUBIvInSRiC15uI
 NwKVPAmGy7M+hc1bOInfjmh4sCVxZvLLUZu6MT5vLf3ltRQo88A9pKf3E9Ya4wK5pK7+
 XHAgDGBTB/7NiFzGuqm1x9GoD0vxAaIwIAIA1sY//iZHZvO67FXhRdGXqDTNCIYkVsdP
 vvZW7gdYgDeOjRznI10J6dcH86HmY0UkeEKr+BY/wyBsKNdBHNEY+09nVvMX7Bg3nrjN
 2I/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SCrm91gLJk0MFOsre/PgWeLSvVA34lRaSk1noLyxJm0=;
 b=2vrq3+pw+gDmSobmdIih2+zrf/a6vGmKrlDnVSPYJXQbxcCq/uzqJuZD6ssiRUGBtF
 jMDfwSoWkGxH1M/WaB1S0+mewj6sULbwKCsUxmZLArO42kaVEYyFEiy6FPAggyGBduqG
 dp61MD3TpK76wucE6k9nQwS9BiZFhlcpIhwCF+Xj4pzDXUIDeEG68HD+I29U5k4QGd9Y
 RqtrNOWH72Oix9RyUlLinQ+QkzSuxVgpJjYoG1fY7jRgb593V1q5nfjbGBGnZVAvgfyN
 7EGHgQjuogoO3pY01U4ULmxR6fKrUXRnQntZJAFb703GClAdwv9lpiUzNriGYqXoxqsa
 qJ4A==
X-Gm-Message-State: AOAM532yReb19bS55D8m3WkGFOgV1r0IpLmfqWveu/30XuE/hx6ovATE
 wpTndiiEQTwIQK/fgY3KDZtHPgVaDmA=
X-Google-Smtp-Source: ABdhPJwNpPCSd/roZYxvSdJ4y3lCVhm5ONlDL87G8Wb2TW4lG/7YM3DImKjOE4lq6OQATvIqLedlrg==
X-Received: by 2002:a05:6512:3fa6:b0:47d:c87e:f8f8 with SMTP id
 x38-20020a0565123fa600b0047dc87ef8f8mr5449314lfa.159.1655123694814; 
 Mon, 13 Jun 2022 05:34:54 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:54 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/19] drm/gma500: Unify *_intel_lvds_mode_set()
Date: Mon, 13 Jun 2022 14:34:29 +0200
Message-Id: <20220613123436.15185-13-patrik.r.jakobsson@gmail.com>
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

These functions mostly do the same thing so unify them. CDV include the
pipe select bit in the pfit control register but we can do this on PSB
as well since LVDS is always on the same pipe there. Oaktrail lvds
modeset sequence is slightly different so is not unified here.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 38 +------------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 35 +++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  3 ++
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 35 +----------------------
 4 files changed, 40 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 77a5d167c508..ddfb976b6059 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,42 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static void cdv_intel_lvds_mode_set(struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct gma_crtc *gma_crtc = to_gma_crtc(encoder->crtc);
-	u32 pfit_control;
-
-	/*
-	 * The LVDS pin pair will already have been turned on in the
-	 * cdv_intel_crtc_mode_set since it has a large impact on the DPLL
-	 * settings.
-	 */
-
-	/*
-	 * Enable automatic panel scaling so that non-native modes fill the
-	 * screen.  Should be enabled before the pipe is enabled, according to
-	 * register description and PRM.
-	 */
-	if (mode->hdisplay != adjusted_mode->hdisplay ||
-	    mode->vdisplay != adjusted_mode->vdisplay)
-		pfit_control = (PFIT_ENABLE | VERT_AUTO_SCALE |
-				HORIZ_AUTO_SCALE | VERT_INTERP_BILINEAR |
-				HORIZ_INTERP_BILINEAR);
-	else
-		pfit_control = 0;
-
-	pfit_control |= gma_crtc->pipe << PFIT_PIPE_SHIFT;
-
-	if (dev_priv->lvds_dither)
-		pfit_control |= PANEL_8TO6_DITHER_ENABLE;
-
-	REG_WRITE(PFIT_CONTROL, pfit_control);
-}
-
 /*
  * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
  */
@@ -177,7 +141,7 @@ static const struct drm_encoder_helper_funcs
 	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = gma_lvds_prepare,
-	.mode_set = cdv_intel_lvds_mode_set,
+	.mode_set = gma_lvds_mode_set,
 	.commit = gma_lvds_commit,
 };
 
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 6364d3aef064..215bf8f7d41f 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -299,3 +299,38 @@ void gma_lvds_commit(struct drm_encoder *encoder)
 	gma_lvds_set_power(dev, true);
 }
 
+void gma_lvds_mode_set(struct drm_encoder *encoder,
+		       struct drm_display_mode *mode,
+		       struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev = encoder->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct gma_crtc *gma_crtc = to_gma_crtc(encoder->crtc);
+	u32 pfit_control;
+
+	/*
+	 * The LVDS pin pair will already have been turned on in the
+	 * *_crtc_mode_set since it has a large impact on the DPLL * settings.
+	 */
+
+	/*
+	 * Enable automatic panel scaling so that non-native modes fill the
+	 * screen.  Should be enabled before the pipe is enabled, according to
+	 * register description and PRM.
+	 */
+	if (mode->hdisplay != adjusted_mode->hdisplay ||
+	    mode->vdisplay != adjusted_mode->vdisplay)
+		pfit_control = (PFIT_ENABLE | VERT_AUTO_SCALE |
+				HORIZ_AUTO_SCALE | VERT_INTERP_BILINEAR |
+				HORIZ_INTERP_BILINEAR);
+	else
+		pfit_control = 0;
+
+	pfit_control |= gma_crtc->pipe << PFIT_PIPE_SHIFT;
+
+	if (dev_priv->lvds_dither)
+		pfit_control |= PANEL_8TO6_DITHER_ENABLE;
+
+	REG_WRITE(PFIT_CONTROL, pfit_control);
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index c2c8fe5b5aac..ebba869a25b7 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -34,5 +34,8 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
+void gma_lvds_mode_set(struct drm_encoder *encoder,
+		       struct drm_display_mode *mode,
+		       struct drm_display_mode *adjusted_mode);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index fbb72be6e017..553f6cb5f322 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,39 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-static void psb_intel_lvds_mode_set(struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	u32 pfit_control;
-
-	/*
-	 * The LVDS pin pair will already have been turned on in the
-	 * psb_intel_crtc_mode_set since it has a large impact on the DPLL
-	 * settings.
-	 */
-
-	/*
-	 * Enable automatic panel scaling so that non-native modes fill the
-	 * screen.  Should be enabled before the pipe is enabled, according to
-	 * register description and PRM.
-	 */
-	if (mode->hdisplay != adjusted_mode->hdisplay ||
-	    mode->vdisplay != adjusted_mode->vdisplay)
-		pfit_control = (PFIT_ENABLE | VERT_AUTO_SCALE |
-				HORIZ_AUTO_SCALE | VERT_INTERP_BILINEAR |
-				HORIZ_INTERP_BILINEAR);
-	else
-		pfit_control = 0;
-
-	if (dev_priv->lvds_dither)
-		pfit_control |= PANEL_8TO6_DITHER_ENABLE;
-
-	REG_WRITE(PFIT_CONTROL, pfit_control);
-}
-
 /*
  * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
  */
@@ -273,7 +240,7 @@ static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
 	.dpms = gma_lvds_encoder_dpms,
 	.mode_fixup = gma_lvds_mode_fixup,
 	.prepare = gma_lvds_prepare,
-	.mode_set = psb_intel_lvds_mode_set,
+	.mode_set = gma_lvds_mode_set,
 	.commit = gma_lvds_commit,
 };
 
-- 
2.36.1

