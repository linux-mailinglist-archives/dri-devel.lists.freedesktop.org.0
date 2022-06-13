Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52C54852E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55BC10E765;
	Mon, 13 Jun 2022 12:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1BE10E75C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:34:50 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s10so5982778ljh.12
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tMby9LBRj3OoFVfpfOF/v48SBQIdpuQZE3MuX9kabgU=;
 b=LnmtaLaRyky4WXSnoAXP7yID0yWsJS5g8yuyXAFbFGxF9ZCCvDNzegZucBK5fBqkfY
 +Y7ABpue5eC4XG2zmde853RUerL1VUoiv6ojPVTe/4oouNqa/qvKD76L8ywDfSwmXTkH
 1pdXOY8sxcBASmcVlDzhhUl47ug/8J6bFegb53Dr/aJip1cKZlanhQr4HeYAopjAps7m
 qDuuli4bZcvWBHPcq/7bZYyPD1kfInowMHYF0G7hAyJYVJGCquiwMbNcoxfRC6VI4d6o
 Ac0l0XWLDeWozkj4R3wSTY0Ko2/y6ceht9Byftd3YRQtJTSw3cSwpu+2Snhyu+grS8fI
 7tjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tMby9LBRj3OoFVfpfOF/v48SBQIdpuQZE3MuX9kabgU=;
 b=CoPhbJDuBaUqOJJgYSeSB4pbXLjJ08Bzq9x52fMlC80rjEFC0MMgzVTEL73LZl1kVS
 ruWzKlJEeMI2bpNi5ccxAEtTkeW4pzqeTAl4/Dz0Vk0+6+2Rj4ww38XwPkFFIk5nABB2
 wC+V+vInqJ9i9tWU65zP7AknYg/6XPZqQU3IxiyJ0mrlOcvPJexRxxTGy5GaLpdR0+zH
 cdGOTVEV3/66dHsdWZ/aqQplg85fvK+AuDoQQExeuOc4f12a5mkvrwpRDj2QTYfJcD+w
 iCz1g4bXjrzb+Lpo1z/16XhynUcTaUcNSf8zzpry7ruLItwamf1pR4UOAKq+wCUWZGMW
 NkGw==
X-Gm-Message-State: AOAM532xZ9Oxg9tXyWTDfLlKMjcyVf2yo09ebT62UH24ON7DxTbFXcsA
 7A8ewwa3L9hCpb0Do162X5Wjofyy40I=
X-Google-Smtp-Source: ABdhPJxn0geumypZMTGOUJkfV49Fj5Ua/bACpirmHUsYTjee8Zhn38f02SwaS63lIcoYpcmkj63H4w==
X-Received: by 2002:a2e:908a:0:b0:255:6799:c8d8 with SMTP id
 l10-20020a2e908a000000b002556799c8d8mr33185603ljg.147.1655123687704; 
 Mon, 13 Jun 2022 05:34:47 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:34:47 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/19] drm/gma500: Unify struct *_intel_lvds_priv
Date: Mon, 13 Jun 2022 14:34:24 +0200
Message-Id: <20220613123436.15185-8-patrik.r.jakobsson@gmail.com>
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

These structs are similar enough to be unified. This will allow unifying
the lvds functions that access the lvds encoder private.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 18 ++----------------
 drivers/gpu/drm/gma500/gma_lvds.c       |  5 +++--
 drivers/gpu/drm/gma500/gma_lvds.h       | 16 ++++++++++++++++
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 24 ++++--------------------
 4 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 777eb7cf7d7f..b0e7b680f02b 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,20 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-struct cdv_intel_lvds_priv {
-	/**
-	 * Saved LVDO output states
-	 */
-	uint32_t savePP_ON;
-	uint32_t savePP_OFF;
-	uint32_t saveLVDS;
-	uint32_t savePP_CONTROL;
-	uint32_t savePP_CYCLE;
-	uint32_t savePFIT_CONTROL;
-	uint32_t savePFIT_PGM_RATIOS;
-	uint32_t saveBLC_PWM_CTL;
-};
-
 static void cdv_intel_lvds_restore(struct drm_connector *connector)
 {
 }
@@ -356,7 +342,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 {
 	struct gma_encoder *gma_encoder;
 	struct gma_connector *gma_connector;
-	struct cdv_intel_lvds_priv *lvds_priv;
+	struct gma_lvds_priv *lvds_priv;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_display_mode *scan;
@@ -387,7 +373,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	if (!gma_connector)
 		goto err_free_encoder;
 
-	lvds_priv = kzalloc(sizeof(struct cdv_intel_lvds_priv), GFP_KERNEL);
+	lvds_priv = kzalloc(sizeof(*lvds_priv), GFP_KERNEL);
 	if (!lvds_priv)
 		goto err_free_connector;
 
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index bd08ed049c5e..7a81f44a40bd 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -8,6 +8,7 @@
 #include "psb_intel_drv.h"
 #include "power.h"
 #include "psb_intel_reg.h"
+#include "gma_lvds.h"
 
 /*
  * Returns the maximum level of the backlight duty cycle field.
@@ -134,8 +135,8 @@ void gma_lvds_save(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct psb_intel_lvds_priv *lvds_priv =
-		(struct psb_intel_lvds_priv *)gma_encoder->dev_priv;
+	struct gma_lvds_priv *lvds_priv =
+		(struct gma_lvds_priv *)gma_encoder->dev_priv;
 
 	lvds_priv->savePP_ON = REG_READ(LVDSPP_ON);
 	lvds_priv->savePP_OFF = REG_READ(LVDSPP_OFF);
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index 52422986be1e..98ad9bc878b7 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -7,6 +7,22 @@
 #ifndef _GMA_LVDS_H
 #define _GMA_LVDS_H
 
+struct gma_lvds_priv {
+	/*
+	 * Saved LVDO output states
+	 */
+	uint32_t savePP_ON;
+	uint32_t savePP_OFF;
+	uint32_t saveLVDS;
+	uint32_t savePP_CONTROL;
+	uint32_t savePP_CYCLE;
+	uint32_t savePFIT_CONTROL;
+	uint32_t savePFIT_PGM_RATIOS;
+	uint32_t saveBLC_PWM_CTL;
+
+	struct gma_i2c_chan *i2c_bus;
+};
+
 u32 gma_lvds_get_max_backlight(struct drm_device *dev);
 void gma_lvds_set_power(struct drm_device *dev, bool on);
 enum drm_mode_status gma_lvds_mode_valid(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index c00b00d70a30..995e7aac53b9 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -37,22 +37,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-struct psb_intel_lvds_priv {
-	/*
-	 * Saved LVDO output states
-	 */
-	uint32_t savePP_ON;
-	uint32_t savePP_OFF;
-	uint32_t saveLVDS;
-	uint32_t savePP_CONTROL;
-	uint32_t savePP_CYCLE;
-	uint32_t savePFIT_CONTROL;
-	uint32_t savePFIT_PGM_RATIOS;
-	uint32_t saveBLC_PWM_CTL;
-
-	struct gma_i2c_chan *i2c_bus;
-};
-
 /*
  * Set LVDS backlight level by I2C command
  *
@@ -153,8 +137,8 @@ static void psb_intel_lvds_restore(struct drm_connector *connector)
 	struct drm_device *dev = connector->dev;
 	u32 pp_status;
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct psb_intel_lvds_priv *lvds_priv =
-		(struct psb_intel_lvds_priv *)gma_encoder->dev_priv;
+	struct gma_lvds_priv *lvds_priv =
+		(struct gma_lvds_priv *)gma_encoder->dev_priv;
 
 	dev_dbg(dev->dev, "(0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)\n",
 			lvds_priv->savePP_ON,
@@ -455,7 +439,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 {
 	struct gma_encoder *gma_encoder;
 	struct gma_connector *gma_connector;
-	struct psb_intel_lvds_priv *lvds_priv;
+	struct gma_lvds_priv *lvds_priv;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_display_mode *scan;	/* *modes, *bios_mode; */
@@ -479,7 +463,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 		goto err_free_encoder;
 	}
 
-	lvds_priv = kzalloc(sizeof(struct psb_intel_lvds_priv), GFP_KERNEL);
+	lvds_priv = kzalloc(sizeof(*lvds_priv), GFP_KERNEL);
 	if (!lvds_priv) {
 		dev_err(dev->dev, "LVDS private allocation error\n");
 		goto err_free_connector;
-- 
2.36.1

