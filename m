Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6A253A039
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6290F10E9A2;
	Wed,  1 Jun 2022 09:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C82D10E9A6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:20 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id s6so1686185lfo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u14NcMCzMoxfVhtmSzN6klKYjRycl/r6BX5iYHIUlFc=;
 b=Q2IEGTlptMPaBrU12QprQKD2yNB3NUkQi3S2Yj7AOy3QIj0gsCU8vnPE1wwD1IxPeK
 GhzMcJ2lISeF673HQy3mmnOqwqAGlVbw1rPOl2i0p9hhTbGhnUy1EPAaIxfyID+C9rfd
 IXxBTAjasRzS6Nm1qQzzdgiw2qOmM4E1WqPREFYqf9FAKE342N0X08Q6TsEfjYa82qep
 U8QEKOjheIM6HkDGjzUJvaLXKqvXHI7nn7gtL9nqiYRFAo86Xruj1C3YusJTtXHAnVlk
 3QHhxYwJhc7cW3Y2y2Hxu7lPY2FZZGzh43ur9ey06cdWsTcWYBNVjPPXYitwJyWrDU0Q
 yWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u14NcMCzMoxfVhtmSzN6klKYjRycl/r6BX5iYHIUlFc=;
 b=ONxU0B/mEacwiGz1CD8+qrHwMsSO3VMOtLxXfp11pmCi4kC2TW80/kiiDd1BiN8kZE
 9Ccq+4Vh74bQ6l7nFQ2VAJA7/cz1vae6x2hDYKsvqt4+/oWsS5ZBgB/Qb1oBe8j7z4ui
 fupSGkYxqVKj6XE+Lc6p3E/YQSeK1NCjCnu29GY0v2R6cihic91NBpZs8WAYGgOPZndU
 P9IZR2LEOQavABWhFvdj9JJ1BWFE1nv82djTerEzawJvOI9vkMohLphy3A3CM9CiUH/2
 XGmu80CMKLCiwDdaM6VjmpkP1ztzth4u7jc4n+poUWQXZEy8iCXrIZ4hHtfmX9N3oSTT
 w99g==
X-Gm-Message-State: AOAM5321ngsO9rtNLp2fbZHylSu3Ta7qO+OKmVnhqnuoYYBosbTnOvZ8
 q53+C9Cjz8QbFIcbbpl6daFkiW/8vO0=
X-Google-Smtp-Source: ABdhPJzVnh17iz72q2OpSI54WYbj17mqk6lIamVRwUZn5sNnQcRKRrPCcfdbM1hXJRevELwbWu4g6Q==
X-Received: by 2002:a05:6512:b1e:b0:44a:9b62:3201 with SMTP id
 w30-20020a0565120b1e00b0044a9b623201mr48794032lfu.42.1654075398012; 
 Wed, 01 Jun 2022 02:23:18 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:17 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/gma500: Make psb lvds use ddc adapter from
 drm_connector
Date: Wed,  1 Jun 2022 11:23:08 +0200
Message-Id: <20220601092311.22648-6-patrik.r.jakobsson@gmail.com>
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
Also cleanup the error handling in psb_intel_lvds_init() and remove
unused ddc_bus in psb_intel_lvds_priv.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 72 +++++++++++++------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index c28fabdcfd73..1121bb155c5e 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -50,7 +50,6 @@ struct psb_intel_lvds_priv {
 	uint32_t saveBLC_PWM_CTL;
 
 	struct gma_i2c_chan *i2c_bus;
-	struct gma_i2c_chan *ddc_bus;
 };
 
 
@@ -512,20 +511,12 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
-/**
- * psb_intel_lvds_destroy - unregister and free LVDS structures
- * @connector: connector to free
- *
- * Unregister the DDC bus for this connector then free the driver private
- * structure.
- */
 void psb_intel_lvds_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	struct psb_intel_lvds_priv *lvds_priv = gma_encoder->dev_priv;
+	struct gma_i2c_chan *ddc_bus = to_gma_i2c_chan(connector->ddc);
 
-	gma_i2c_destroy(lvds_priv->ddc_bus);
+	gma_i2c_destroy(ddc_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
@@ -639,25 +630,28 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	struct drm_display_mode *scan;	/* *modes, *bios_mode; */
 	struct drm_crtc *crtc;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct gma_i2c_chan *ddc_bus;
 	u32 lvds;
 	int pipe;
+	int ret;
 
 	gma_encoder = kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
 	if (!gma_encoder) {
 		dev_err(dev->dev, "gma_encoder allocation error\n");
 		return;
 	}
+	encoder = &gma_encoder->base;
 
 	gma_connector = kzalloc(sizeof(struct gma_connector), GFP_KERNEL);
 	if (!gma_connector) {
 		dev_err(dev->dev, "gma_connector allocation error\n");
-		goto failed_encoder;
+		goto err_free_encoder;
 	}
 
 	lvds_priv = kzalloc(sizeof(struct psb_intel_lvds_priv), GFP_KERNEL);
 	if (!lvds_priv) {
 		dev_err(dev->dev, "LVDS private allocation error\n");
-		goto failed_connector;
+		goto err_free_connector;
 	}
 
 	gma_encoder->dev_priv = lvds_priv;
@@ -666,12 +660,24 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	gma_connector->save = psb_intel_lvds_save;
 	gma_connector->restore = psb_intel_lvds_restore;
 
-	encoder = &gma_encoder->base;
-	drm_connector_init(dev, connector,
-			   &psb_intel_lvds_connector_funcs,
-			   DRM_MODE_CONNECTOR_LVDS);
+	/* Set up the DDC bus. */
+	ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
+	if (!ddc_bus) {
+		dev_printk(KERN_ERR, dev->dev,
+			   "DDC bus registration " "failed.\n");
+		goto err_free_lvds_priv;
+	}
+
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &psb_intel_lvds_connector_funcs,
+					  DRM_MODE_CONNECTOR_LVDS,
+					  &ddc_bus->base);
+	if (ret)
+		goto err_ddc_destroy;
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
+	if (ret)
+		goto err_connector_cleanup;
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
@@ -699,7 +705,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	if (!lvds_priv->i2c_bus) {
 		dev_printk(KERN_ERR,
 			dev->dev, "I2C bus registration failed.\n");
-		goto failed_blc_i2c;
+		goto err_encoder_cleanup;
 	}
 	lvds_priv->i2c_bus->slave_addr = 0x2C;
 	dev_priv->lvds_i2c_bus =  lvds_priv->i2c_bus;
@@ -714,20 +720,13 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	 *    if closed, act like it's not there for now
 	 */
 
-	/* Set up the DDC bus. */
-	lvds_priv->ddc_bus = gma_i2c_create(dev, GPIOC, "LVDSDDC_C");
-	if (!lvds_priv->ddc_bus) {
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
-	psb_intel_ddc_get_modes(connector, &lvds_priv->ddc_bus->base);
+	psb_intel_ddc_get_modes(connector, &ddc_bus->base);
+
 	list_for_each_entry(scan, &connector->probed_modes, head) {
 		if (scan->type & DRM_MODE_TYPE_PREFERRED) {
 			mode_dev->panel_fixed_mode =
@@ -773,7 +772,7 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	/* If we still don't have a mode after all that, give up. */
 	if (!mode_dev->panel_fixed_mode) {
 		dev_err(dev->dev, "Found no modes on the lvds, ignoring the LVDS\n");
-		goto failed_find;
+		goto err_unlock;
 	}
 
 	/*
@@ -784,17 +783,20 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	mutex_unlock(&dev->mode_config.mutex);
 	return;
 
-failed_find:
+err_unlock:
 	mutex_unlock(&dev->mode_config.mutex);
-	gma_i2c_destroy(lvds_priv->ddc_bus);
-failed_ddc:
 	gma_i2c_destroy(lvds_priv->i2c_bus);
-failed_blc_i2c:
+err_encoder_cleanup:
 	drm_encoder_cleanup(encoder);
+err_connector_cleanup:
 	drm_connector_cleanup(connector);
-failed_connector:
+err_ddc_destroy:
+	gma_i2c_destroy(ddc_bus);
+err_free_lvds_priv:
+	kfree(lvds_priv);
+err_free_connector:
 	kfree(gma_connector);
-failed_encoder:
+err_free_encoder:
 	kfree(gma_encoder);
 }
 
-- 
2.36.1

