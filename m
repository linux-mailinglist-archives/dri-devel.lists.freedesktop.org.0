Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAB53A037
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBCA10E99E;
	Wed,  1 Jun 2022 09:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB910E97D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id l30so1734696lfj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K6Ae9vGYAWngrRXmarItqL5ftbFrETC6GaMuHnW6nDA=;
 b=P/dDGZYdHJUDuPcGz30S/uRScIrmdesCYQaSKxIEwbG+BE+3EwIOy34nIQNf4JS31f
 xdGuHDNq/vM15KMRlw1lMWGC7ZxWy/M+QVAezBonIxqewYeY0mFdyEffmH/4Z6EAhXgE
 QEZsnnAJRi9s7wB+pJanX8SEviQ8EW6eVIhm2QOmf0n+se0HN5X0A5nozw0p9/NhVOo2
 efIC7fM9lvOiQ6gO34imJp8i8uRsBuUI96zG1R26rbxR4rWrR1GDooRQUFFdTkmKyGtL
 dVHDEp24vVxWPjTI87CZlL5Pjj4DdgC+yHi0G+HNclSiN80XsoXX/n6xVchGzaovqx86
 JAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6Ae9vGYAWngrRXmarItqL5ftbFrETC6GaMuHnW6nDA=;
 b=KkBMrUMYAidh+L6rpfDBFbApvKZj8pePMsRmqY5oehFhrue88VTYI97XgekMmaMR4k
 u2sAMmJzdfsjDazIe0GIa+xmvIwc8Qj2X6CA1VVzgxoThL+fp/bxxZjtu5yNt9cVsJPN
 0PKlXtdzsqCElUUm6PZA8cplSec9AqwF6fLaQ1i3e/HUob5CIdsmLwbpTtmzwbbiaDmx
 h2es9ruC1A3k3auGAt0xGYZTkj4QkXkrTMY9Whhgq9Cr09QqFEbBk0EoqeOmbjhh8v5b
 jiqnZZ/ewOaTom66jtxnRpIGyIbI/+LNM3p0wCb72saDYaG5CCviJ1uFJzJOH4oirO4c
 BZQA==
X-Gm-Message-State: AOAM531d9GwSO3Z1/D5mQptGNdn/h7MxwfQDYr9zTdXAnZBRLZTT8A/N
 n+bABHPDdtdCNF5jbWM7qwvN1ZgCix8=
X-Google-Smtp-Source: ABdhPJwaOMFoGuQxHQcN56c3pCHyDaroU6lT8+yNTKkl9HryEuIXfdqPAxpW1ExZ4szP7oCbHEGhHw==
X-Received: by 2002:a19:501d:0:b0:479:46c:2917 with SMTP id
 e29-20020a19501d000000b00479046c2917mr1299679lfb.160.1654075396111; 
 Wed, 01 Jun 2022 02:23:16 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:15 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] drm/gma500: Make cdv lvds use ddc adapter from
 drm_connector
Date: Wed,  1 Jun 2022 11:23:06 +0200
Message-Id: <20220601092311.22648-4-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
References: <20220601092311.22648-1-patrik.r.jakobsson@gmail.com>
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
Cc: tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're moving all uses of ddc_bus to drm_connector where they belong.
Also, add missing call to destroy ddc bus when destroying the connector
and cleanup the error handling in cdv_intel_lvds_init().

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 67 ++++++++++++-------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index d76c3ecc951c..846ce1546030 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -317,18 +317,12 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
-/**
- * cdv_intel_lvds_destroy - unregister and free LVDS structures
- * @connector: connector to free
- *
- * Unregister the DDC bus for this connector then free the driver private
- * structure.
- */
 static void cdv_intel_lvds_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
+	gma_i2c_destroy(to_gma_i2c_chan(connector->ddc));
 	gma_i2c_destroy(gma_encoder->i2c_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
@@ -487,8 +481,10 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	struct drm_display_mode *scan;
 	struct drm_crtc *crtc;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct gma_i2c_chan *ddc_bus;
 	u32 lvds;
 	int pipe;
+	int ret;
 	u8 pin;
 
 	if (!dev_priv->lvds_enabled_in_vbt)
@@ -508,11 +504,11 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	gma_connector = kzalloc(sizeof(struct gma_connector),
 				      GFP_KERNEL);
 	if (!gma_connector)
-		goto failed_connector;
+		goto err_free_encoder;
 
 	lvds_priv = kzalloc(sizeof(struct cdv_intel_lvds_priv), GFP_KERNEL);
 	if (!lvds_priv)
-		goto failed_lvds_priv;
+		goto err_free_connector;
 
 	gma_encoder->dev_priv = lvds_priv;
 
@@ -521,12 +517,24 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	gma_connector->restore = cdv_intel_lvds_restore;
 	encoder = &gma_encoder->base;
 
+	/* Set up the DDC bus. */
+	ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
+	if (!ddc_bus) {
+		dev_printk(KERN_ERR, dev->dev,
+			   "DDC bus registration " "failed.\n");
+		goto err_free_lvds_priv;
+	}
 
-	drm_connector_init(dev, connector,
-			   &cdv_intel_lvds_connector_funcs,
-			   DRM_MODE_CONNECTOR_LVDS);
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &cdv_intel_lvds_connector_funcs,
+					  DRM_MODE_CONNECTOR_LVDS,
+					  &ddc_bus->base);
+	if (ret)
+		goto err_destroy_ddc;
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
+	if (ret)
+		goto err_connector_cleanup;
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
@@ -554,7 +562,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	if (!gma_encoder->i2c_bus) {
 		dev_printk(KERN_ERR,
 			dev->dev, "I2C bus registration failed.\n");
-		goto failed_blc_i2c;
+		goto err_encoder_cleanup;
 	}
 	gma_encoder->i2c_bus->slave_addr = 0x2C;
 	dev_priv->lvds_i2c_bus = gma_encoder->i2c_bus;
@@ -569,21 +577,13 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	 *    if closed, act like it's not there for now
 	 */
 
-	/* Set up the DDC bus. */
-	gma_encoder->ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
-	if (!gma_encoder->ddc_bus) {
-		dev_printk(KERN_ERR, dev->dev,
-			   "DDC bus registration " "failed.\n");
-		goto failed_ddc;
-	}
-
 	/*
 	 * Attempt to get the fixed panel mode from DDC.  Assume that the
 	 * preferred mode is the right one.
 	 */
 	mutex_lock(&dev->mode_config.mutex);
-	psb_intel_ddc_get_modes(connector,
-				&gma_encoder->ddc_bus->base);
+	psb_intel_ddc_get_modes(connector, &ddc_bus->base);
+
 	list_for_each_entry(scan, &connector->probed_modes, head) {
 		if (scan->type & DRM_MODE_TYPE_PREFERRED) {
 			mode_dev->panel_fixed_mode =
@@ -625,7 +625,7 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	if (!mode_dev->panel_fixed_mode) {
 		DRM_DEBUG
 			("Found no modes on the lvds, ignoring the LVDS\n");
-		goto failed_find;
+		goto err_unlock;
 	}
 
 	/* setup PWM */
@@ -645,20 +645,19 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 	mutex_unlock(&dev->mode_config.mutex);
 	return;
 
-failed_find:
+err_unlock:
 	mutex_unlock(&dev->mode_config.mutex);
-	pr_err("Failed find\n");
-	gma_i2c_destroy(gma_encoder->ddc_bus);
-failed_ddc:
-	pr_err("Failed DDC\n");
 	gma_i2c_destroy(gma_encoder->i2c_bus);
-failed_blc_i2c:
-	pr_err("Failed BLC\n");
+err_encoder_cleanup:
 	drm_encoder_cleanup(encoder);
+err_connector_cleanup:
 	drm_connector_cleanup(connector);
+err_destroy_ddc:
+	gma_i2c_destroy(ddc_bus);
+err_free_lvds_priv:
 	kfree(lvds_priv);
-failed_lvds_priv:
+err_free_connector:
 	kfree(gma_connector);
-failed_connector:
+err_free_encoder:
 	kfree(gma_encoder);
 }
-- 
2.36.1

