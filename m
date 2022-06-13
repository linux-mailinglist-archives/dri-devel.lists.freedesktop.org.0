Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6160D54853A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D67610E76C;
	Mon, 13 Jun 2022 12:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0F610E75C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id c4so8579085lfj.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0JCZnkpg9zCbffeVCB8cOxmJ6vhfU5iJyBCibQBNqMc=;
 b=TLNnSNnkgWHixno1VA1aROhjtiN8EjPdGp4hZsky3C60iyfSyFQX0bC1kZFV3R7CpW
 OUHQi6DB/ipwsEhwQmWexOL8TFFCOpuH/Tp9zA1TaLP3wATKibSK/Lo853+Q1kclTM67
 fRSvhDibEvt3OPCmCQpGKqZcAehZTkice1ocrdoLTuYMEIazUQFPxjjCw/BOLyY8jjpo
 iZPYD0k+vAOAaZWSN7VAZqfP0L/iV60El9vd5GdjCLnj06nao9AS0wbvrhyZFrltNa7a
 njXxCniQDK0jn0l56rGCfawwkF/R8WWNU7wXy9fKDvoo82qy4c2YzGYBRHfx3l+VBQXR
 aJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0JCZnkpg9zCbffeVCB8cOxmJ6vhfU5iJyBCibQBNqMc=;
 b=UqYcgNW7+ahsOxRnQ5jTZZcfxZ5dHGqMG2+LV+CwviqRt6yLYPCjAqfvTOQcfM8alH
 UaHG0A5BDdWXFZViVrE9sKvl0d4t2yZP4jQ5UUxv4xLd+twn4PUmmlr1uEHvWtI+BC93
 lFid5AucbAK+WOgHDmGQnteUXXQaicM/vXZLo3GnCFxqJHOp0c3mGgKKzNmSXp/pQuI7
 APfbzoCjdotVHk8aUsX2awJLm2weYjZNv1iU36vwMQrFFpg0Ryn7h/B1fPBxNcO/Gd1j
 ywUW8gf9sU19ec2EhAZ8FN3Iw4h8Ql1t92qC2k/VvEM4fAnO12it58Z7Sz60Y33Lfb4a
 kQQg==
X-Gm-Message-State: AOAM532HEWtWESVXZm3WxL15srW9J5/4FHMxkAVZfwPBRfwHNwpOvz7h
 YEMMod1mFg2kgZOgF8EQWmMZSDUzcls=
X-Google-Smtp-Source: ABdhPJzaIG/oOaTvK4xKg8/7FF5ECDVCQ1P5QdTgcA7v1sX6PRA7e6AQY/YZo+PqmkOVeLwRz8EY3w==
X-Received: by 2002:a19:ca13:0:b0:478:f667:11fd with SMTP id
 a19-20020a19ca13000000b00478f66711fdmr35530578lfg.174.1655123697576; 
 Mon, 13 Jun 2022 05:34:57 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:56 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/19] drm/gma500: Unify *_intel_lvds_get_modes()
Date: Mon, 13 Jun 2022 14:34:31 +0200
Message-Id: <20220613123436.15185-15-patrik.r.jakobsson@gmail.com>
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

These functions mostly do the same thing so unify them. Oaktrail already
uses the PSB connector helpers so it is already handled.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 27 +-----------------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 26 +++++++++++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 28 +------------------------
 4 files changed, 29 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 80ccc00c47e5..a6f94572baaf 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,31 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-/*
- * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
- */
-static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	int ret;
-
-	ret = psb_intel_ddc_get_modes(connector, connector->ddc);
-
-	if (ret)
-		return ret;
-
-	if (mode_dev->panel_fixed_mode != NULL) {
-		struct drm_display_mode *mode =
-		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
-		drm_mode_probed_add(connector, mode);
-		return 1;
-	}
-
-	return 0;
-}
-
 static void cdv_intel_lvds_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
@@ -138,7 +113,7 @@ static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 
 static const struct drm_connector_helper_funcs
 				cdv_intel_lvds_connector_helper_funcs = {
-	.get_modes = cdv_intel_lvds_get_modes,
+	.get_modes = gma_lvds_get_modes,
 	.mode_valid = gma_lvds_mode_valid,
 	.best_encoder = gma_best_encoder,
 };
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index bf9fa5ebdbd3..49c11b5337cb 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -342,3 +342,29 @@ const struct drm_encoder_helper_funcs gma_lvds_helper_funcs = {
 	.commit = gma_lvds_commit,
 };
 
+/*
+ * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
+ */
+int gma_lvds_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
+	int ret = 0;
+
+	if (!IS_MRST(dev))
+		ret = psb_intel_ddc_get_modes(connector, connector->ddc);
+
+	if (ret)
+		return ret;
+
+	if (mode_dev->panel_fixed_mode != NULL) {
+		struct drm_display_mode *mode =
+		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
+		drm_mode_probed_add(connector, mode);
+		return 1;
+	}
+
+	return 0;
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 3c47bea859ad..70c416d8b7a7 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -34,6 +34,7 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
+int gma_lvds_get_modes(struct drm_connector *connector);
 
 extern const struct drm_encoder_helper_funcs gma_lvds_helper_funcs;
 
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 29a9b4ea5803..4ef0150c6a03 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,32 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-/*
- * Return the list of DDC modes if available, or the BIOS fixed mode otherwise.
- */
-static int psb_intel_lvds_get_modes(struct drm_connector *connector)
-{
-	struct drm_device *dev = connector->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	int ret = 0;
-
-	if (!IS_MRST(dev))
-		ret = psb_intel_ddc_get_modes(connector, connector->ddc);
-
-	if (ret)
-		return ret;
-
-	if (mode_dev->panel_fixed_mode != NULL) {
-		struct drm_display_mode *mode =
-		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
-		drm_mode_probed_add(connector, mode);
-		return 1;
-	}
-
-	return 0;
-}
-
 void psb_intel_lvds_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
@@ -238,7 +212,7 @@ int psb_intel_lvds_set_property(struct drm_connector *connector,
 
 const struct drm_connector_helper_funcs
 				psb_intel_lvds_connector_helper_funcs = {
-	.get_modes = psb_intel_lvds_get_modes,
+	.get_modes = gma_lvds_get_modes,
 	.mode_valid = gma_lvds_mode_valid,
 	.best_encoder = gma_best_encoder,
 };
-- 
2.36.1

