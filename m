Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD0548539
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA9110E76D;
	Mon, 13 Jun 2022 12:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADD410E762
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:35:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id y32so8612838lfa.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bP5AsGmP9M86M1+ichu1OQiFmxnyp6NNzkk4H3UFckE=;
 b=gCortfoSKfyDaxFacd3kKMWYVDxaUzpaL079w4PctA3vi23PR+e+cbxcTUUw2AmMyT
 KOYQTae2kLiAK0jpUF1hGW3l5tgZNhYs124woXs/JSq7yWZfVhWv2Ca4BuBZCAwLl85h
 6Ptn5LSz3vlN3Tp2l0hLe034GEWf0zpmbOzr9SRx7tWn2tIEJv9uL5uEkk2h7nIDbK1V
 4GZksKrACycOl5Nv069ZJwFDu7Ku6AbnMO32LfEtqhNG5aEzWjxkL8cQVu5QSJyREpyx
 IrIRJIxveD9pbvxQ0IS94p9WYSOgtGQ8Lm2ADKH4En6uQ4ZO9vXtCQ6i6H5DqmUZDFwB
 i1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bP5AsGmP9M86M1+ichu1OQiFmxnyp6NNzkk4H3UFckE=;
 b=T91P6tRR/9fNp+XGONCRoxEJuo77Kzbz1CIOJedUgrZM7WE/JFrNsQCkgC6smPPx/P
 eYd9vJ9mbJRL3ICV1ijJNUnTbpstoOOCqI02c+6Ofv3kzHMe1PpGmx8skSyyqtlXXK87
 l/S+PcsYulTLwrJKtD9e6xMgn0Jyg5HfccaMKdr6YHQ8NrEtIuzxq7SzfjzPHRCl/NX6
 NfMyjQWjt0Yj66v8bf7NG8HyHj92xeqILoLZ53zFIdhkGX8D9Z6efWeveWOmLaZLvlrV
 I2MgK/odQDYbGdP1QbiktN6H3q5A5Jmq5/Ckc3OLDsdxvkOWmm88C8qIgaFI3AATehBJ
 nTxA==
X-Gm-Message-State: AOAM533jUXOFtT3riloab0930w4bk3mUrrBYf+/xRGJ9Qan2TbTWa+il
 D27MoMaP3X2E2quu8dMLCnMvclFf1n0=
X-Google-Smtp-Source: ABdhPJyBu0LYe0etQZIRrMhlWjfFCJd1fzcTEqn4fSAvZpfZRuK96kpdi8/NJU/A5bGzv6lgJPq9cQ==
X-Received: by 2002:a05:6512:2814:b0:47d:cbbe:33f8 with SMTP id
 cf20-20020a056512281400b0047dcbbe33f8mr4851534lfb.601.1655123701200; 
 Mon, 13 Jun 2022 05:35:01 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 j12-20020a056512344c00b004791232dd6fsm973261lfr.257.2022.06.13.05.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:35:00 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 17/19] drm/gma500: Unify *_intel_lvds_destroy()
Date: Mon, 13 Jun 2022 14:34:34 +0200
Message-Id: <20220613123436.15185-18-patrik.r.jakobsson@gmail.com>
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
Only destroy i2c adapters that have actually been created.
gma_i2c_destroy() is now also called for PSB.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 14 +-------------
 drivers/gpu/drm/gma500/gma_lvds.c       | 15 +++++++++++++++
 drivers/gpu/drm/gma500/gma_lvds.h       |  1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 13 +------------
 4 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 2ba635513401..c492f1b3c8ea 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -39,17 +39,6 @@
 #define PSB_BACKLIGHT_PWM_CTL_SHIFT	(16)
 #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
 
-static void cdv_intel_lvds_destroy(struct drm_connector *connector)
-{
-	struct gma_connector *gma_connector = to_gma_connector(connector);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-
-	gma_i2c_destroy(to_gma_i2c_chan(connector->ddc));
-	gma_i2c_destroy(gma_encoder->i2c_bus);
-	drm_connector_cleanup(connector);
-	kfree(gma_connector);
-}
-
 static int cdv_intel_lvds_set_property(struct drm_connector *connector,
 				       struct drm_property *property,
 				       uint64_t value)
@@ -115,7 +104,7 @@ static const struct drm_connector_funcs cdv_intel_lvds_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.set_property = cdv_intel_lvds_set_property,
-	.destroy = cdv_intel_lvds_destroy,
+	.destroy = gma_lvds_destroy,
 };
 
 /*
@@ -261,7 +250,6 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 
 	/**
 	 * Set up I2C bus
-	 * FIXME: distroy i2c_bus when exit
 	 */
 	gma_encoder->i2c_bus = gma_i2c_create(dev, GPIOB, "LVDSBLC_B");
 	if (!gma_encoder->i2c_bus) {
diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500/gma_lvds.c
index 3b48999105d1..9238cad5fac8 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.c
+++ b/drivers/gpu/drm/gma500/gma_lvds.c
@@ -374,3 +374,18 @@ const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs = {
 	.best_encoder = gma_best_encoder,
 };
 
+void gma_lvds_destroy(struct drm_connector *connector)
+{
+	struct gma_connector *gma_connector = to_gma_connector(connector);
+	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
+
+	if (connector->ddc)
+		gma_i2c_destroy(to_gma_i2c_chan(connector->ddc));
+
+	if (gma_encoder->i2c_bus)
+		gma_i2c_destroy(gma_encoder->i2c_bus);
+
+	drm_connector_cleanup(connector);
+	kfree(gma_connector);
+}
+
diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500/gma_lvds.h
index dcba810dc470..835305c900d8 100644
--- a/drivers/gpu/drm/gma500/gma_lvds.h
+++ b/drivers/gpu/drm/gma500/gma_lvds.h
@@ -30,6 +30,7 @@ bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
 			 struct drm_display_mode *adjusted_mode);
 void gma_lvds_prepare(struct drm_encoder *encoder);
 void gma_lvds_commit(struct drm_encoder *encoder);
+void gma_lvds_destroy(struct drm_connector *connector);
 
 extern const struct drm_encoder_helper_funcs gma_lvds_helper_funcs;
 extern const struct drm_connector_helper_funcs gma_lvds_connector_helper_funcs;
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index ea5f2f078a7f..76742925b760 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -132,16 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_device *dev, int level)
 		psb_lvds_pwm_set_brightness(dev, level);
 }
 
-void psb_intel_lvds_destroy(struct drm_connector *connector)
-{
-	struct gma_connector *gma_connector = to_gma_connector(connector);
-	struct gma_i2c_chan *ddc_bus = to_gma_i2c_chan(connector->ddc);
-
-	gma_i2c_destroy(ddc_bus);
-	drm_connector_cleanup(connector);
-	kfree(gma_connector);
-}
-
 int psb_intel_lvds_set_property(struct drm_connector *connector,
 				       struct drm_property *property,
 				       uint64_t value)
@@ -214,7 +204,7 @@ const struct drm_connector_funcs psb_intel_lvds_connector_funcs = {
 	.dpms = drm_helper_connector_dpms,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.set_property = psb_intel_lvds_set_property,
-	.destroy = psb_intel_lvds_destroy,
+	.destroy = gma_lvds_destroy,
 };
 
 /**
@@ -304,7 +294,6 @@ void psb_intel_lvds_init(struct drm_device *dev,
 
 	/*
 	 * Set up I2C bus
-	 * FIXME: distroy i2c_bus when exit
 	 */
 	gma_encoder->i2c_bus = gma_i2c_create(dev, GPIOB, "LVDSBLC_B");
 	if (!gma_encoder->i2c_bus) {
-- 
2.36.1

