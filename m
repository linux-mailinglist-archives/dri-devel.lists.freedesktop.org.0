Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 971C9548528
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFA410E74F;
	Mon, 13 Jun 2022 12:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF0610E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:45 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id e4so6044776ljl.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/NsnDAreuXQ5Iu2HGVJ9pVIrEvXlPFZYRu4M8bK+lE=;
 b=ETKxjP4YzsCukzs5vgmGMix80Q6vD/6nKukveV1iM/H+o66nTNwtCvKwEquoPlXUp4
 BoG+vGz5hMNUoeTCms7yZLgxheRcbdlVl8CjDSSEQR9HokX2hVqNHgYi1pKWe98WfLFy
 jvxeoLdnFy6SRrHXfLpRQeoIioMFJLLl5p4eO2MiMcdvGWj07nm6A7ZzUKz+hhBdCZ7D
 INldoQD4CeqvtIEPgpnWy3hDq/KEwmVyhhFv0UPpIA+Z+JYj2/CVWHvGW5DRKydMRFy9
 N3FJxDQC4rw3/VgtdqnCi/zyTTNwPUoO7IkmCO89WUlJ6NUuIDOWCdLKAtL7qf6jeaFl
 x19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/NsnDAreuXQ5Iu2HGVJ9pVIrEvXlPFZYRu4M8bK+lE=;
 b=PADVcfcdmKOSIxhrgtaozBDuFeKQNtZRVHxGo6TkLg1tL1AZFXYDLzWADVB3bHLyqZ
 jhZ82DX+GNxWFzTB1j9MxD+MtF0fhfaKqMXYu+zaL/ZmEskGw/LJPj5q9oDf16qhuaPO
 xrW6Kt8I9Op/eV7iI1fMasHjuJ8SciqtHQL4WDpC5lVuqcIHGlgv1I9AjTAE1gOBggC7
 NGwJDcLX1mh/gQbWp3JE33PaLoRWqirrYfDDCQG5HtoXsqsQL8weiMH9v8fz7YSoZRN6
 3UwPhtvdDzSIa9RP3JTdKkbrsup50R+nrEJct0OKgJA0tNjXYWVz41+bHedg+B4AiBzJ
 bB8w==
X-Gm-Message-State: AOAM533wB3OZ06QyvultI+i+CqhS59Dz5gduyjLN1QyHFq/zxP1SpyON
 RsNeOjmaHNGU3CewdzEdno0gIdJibgY=
X-Google-Smtp-Source: ABdhPJwSb5LgVwthoAeAM3BO2EgqoZcTkzlHls9Y9M6+ZTeHFdO96r1i/nHCpylopJp/tkAShoWOxg==
X-Received: by 2002:a2e:968c:0:b0:258:fd7b:43ae with SMTP id
 q12-20020a2e968c000000b00258fd7b43aemr4563774lji.35.1655123683594; 
 Mon, 13 Jun 2022 05:34:43 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:43 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/19] drm/gma500: Unify *_lvds_mode_valid()
Date: Mon, 13 Jun 2022 14:34:21 +0200
Message-Id: <20220613123436.15185-5-patrik.r.jakobsson@gmail.com>
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

These functions mostly do the same thing so unify them into one. Skip
the INTEL_OUTPUT_MIPI2 code since we don't have that output type.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 27 +---------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 25 +++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  2 ++
 drivers/gpu/drm/gma500/psb_intel_drv.h  |  2 --
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 30 +------------------------
 5 files changed, 29 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 7bf883bb8104..968d627e23d1 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -71,31 +71,6 @@ static void cdv_intel_lvds_restore(struct drm_connector *connector)
 {
 }
 
-static enum drm_mode_status cdv_intel_lvds_mode_valid(struct drm_connector *connector,
-			      struct drm_display_mode *mode)
-{
-	struct drm_device *dev = connector->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct drm_display_mode *fixed_mode =
-					dev_priv->mode_dev.panel_fixed_mode;
-
-	/* just in case */
-	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
-		return MODE_NO_DBLESCAN;
-
-	/* just in case */
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		return MODE_NO_INTERLACE;
-
-	if (fixed_mode) {
-		if (mode->hdisplay > fixed_mode->hdisplay)
-			return MODE_PANEL;
-		if (mode->vdisplay > fixed_mode->vdisplay)
-			return MODE_PANEL;
-	}
-	return MODE_OK;
-}
-
 static bool cdv_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				  const struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
@@ -321,7 +296,7 @@ static const struct drm_encoder_helper_funcs
 static const struct drm_connector_helper_funcs
 				cdv_intel_lvds_connector_helper_funcs = {
 	.get_modes = cdv_intel_lvds_get_modes,
-	.mode_valid = cdv_intel_lvds_mode_valid,
+	.mode_valid = gma_lvds_mode_valid,
 	.best_encoder = gma_best_encoder,
 };
 
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 11efbb14b55c..c36815493366 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -93,3 +93,28 @@ void gma_lvds_set_power(struct drm_device *dev, bool on)
 	gma_power_end(dev);
 }
 
+enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
+					 struct drm_display_mode *mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct drm_display_mode *fixed_mode =
+					dev_priv->mode_dev.panel_fixed_mode;
+
+	/* just in case */
+	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
+		return MODE_NO_DBLESCAN;
+
+	/* just in case */
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_NO_INTERLACE;
+
+	if (fixed_mode) {
+		if (mode->hdisplay > fixed_mode->hdisplay)
+			return MODE_PANEL;
+		if (mode->vdisplay > fixed_mode->vdisplay)
+			return MODE_PANEL;
+	}
+	return MODE_OK;
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 477d3b5005f7..6b4d8a024da1 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -9,5 +9,7 @@
 
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
 void gma_lvds_set_power(struct drm_device *dev, bool on);
+enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
+					 struct drm_display_mode *mode);
 
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 8ccba116821b..db824aa6b589 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -228,8 +228,6 @@ extern int intelfb_remove(struct drm_device *dev,
 extern bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				      const struct drm_display_mode *mode,
 				      struct drm_display_mode *adjusted_mode);
-extern enum drm_mode_status psb_intel_lvds_mode_valid(struct drm_connector *connector,
-				     struct drm_display_mode *mode);
 extern int psb_intel_lvds_set_property(struct drm_connector *connector,
 					struct drm_property *property,
 					uint64_t value);
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 06f1bd2250dd..c88697a805e0 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -239,34 +239,6 @@ static void psb_intel_lvds_restore(struct drm_connector *connector)
 	}
 }
 
-enum drm_mode_status psb_intel_lvds_mode_valid(struct drm_connector *connector,
-				 struct drm_display_mode *mode)
-{
-	struct drm_psb_private *dev_priv = to_drm_psb_private(connector->dev);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct drm_display_mode *fixed_mode =
-					dev_priv->mode_dev.panel_fixed_mode;
-
-	if (gma_encoder->type == INTEL_OUTPUT_MIPI2)
-		fixed_mode = dev_priv->mode_dev.panel_fixed_mode2;
-
-	/* just in case */
-	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
-		return MODE_NO_DBLESCAN;
-
-	/* just in case */
-	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		return MODE_NO_INTERLACE;
-
-	if (fixed_mode) {
-		if (mode->hdisplay > fixed_mode->hdisplay)
-			return MODE_PANEL;
-		if (mode->vdisplay > fixed_mode->vdisplay)
-			return MODE_PANEL;
-	}
-	return MODE_OK;
-}
-
 bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
 				  const struct drm_display_mode *mode,
 				  struct drm_display_mode *adjusted_mode)
@@ -509,7 +481,7 @@ static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_funcs = {
 const struct drm_connector_helper_funcs
 				psb_intel_lvds_connector_helper_funcs = {
 	.get_modes = psb_intel_lvds_get_modes,
-	.mode_valid = psb_intel_lvds_mode_valid,
+	.mode_valid = gma_lvds_mode_valid,
 	.best_encoder = gma_best_encoder,
 };
 
-- 
2.36.1

