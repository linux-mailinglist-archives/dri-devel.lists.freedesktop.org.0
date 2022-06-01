Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9D53A038
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B3510E95F;
	Wed,  1 Jun 2022 09:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F67B10E99E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j10so1692569lfe.12
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mOVAfwhDy0bXBwhe29HSXkSaSCvHiTQB2/CH6MOKHnk=;
 b=Vnubb0EPwv3Ve2NKl8I7i1GlUj9davSgicMOLcQEXQoC0tFuRyCTu0uEQJrauRJJAC
 ci3vs8HjY8ixd9AoU2lbzplUmOPVmoEpiQBZEgUga7ZzQ9Q49w0ACYVYeXPQGm4sDyjx
 83LOxFnvfgvgYnLotREwQoM6ES6rHU9WXgLDNdFeCscPrFzwSceUXwg4W4ryJDnAWYFK
 8okQw0MnMdszpbuhyqjBQ9iuc8nkqQIECNf0zkP9ynvhlBV61y31PGknqTImx7qHvgFx
 cw9q8jRQg9EQ3iqbG5bp6qt52Faen8/PqFhrzOQLjj52gBO9gx8XjHlxOCHM4NydyxBY
 fc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mOVAfwhDy0bXBwhe29HSXkSaSCvHiTQB2/CH6MOKHnk=;
 b=fK/JkoPuX6Uv9iaF9JJzlUq+d8bZY/M5kR2UuSnELJJCLo8opdvcAfvGNptfavndf0
 p0i6u/Kh6OGPEtG5LPoS7oqKv5BlhKBz28Gg5bBBS9c1WVi6/ftQyu1R7y/JLk4DIfEI
 G0yyuY2yoOq21Hy9TjvkNbS5XnQm56Bk8RIZGJy2aSMpGN3Dja2chN/h9F1ZJ6n6Aapd
 0FrjSnaWwW7EKqUZs8sAmkbedUTJCDJcwkkcLLypzF3YnCCv9PBQv0Q6btfd47YvxQ92
 lh8HIthl7yBhQWwAizx9HnFh7/1OMc5KytXOmbMaxVncsmQfEeGbqN6wkHMmP4ZUUbZ8
 qLvg==
X-Gm-Message-State: AOAM532syNjjxzS7bX4BtM580v97ihPL3spCWKpcy2FNuRvzAm80QY+5
 0pVGtjOihmTRh7L9Y92z655j+dVin2Y=
X-Google-Smtp-Source: ABdhPJw1m4/f+o3LNqTOIpdXtGOZwMOh7Q51NRuQb5qh9u5gyMsAGBl1FISTHeRHawXuOaXyn//Gzg==
X-Received: by 2002:a05:6512:33cb:b0:477:aa55:5f3e with SMTP id
 d11-20020a05651233cb00b00477aa555f3emr48309849lfg.488.1654075397066; 
 Wed, 01 Jun 2022 02:23:17 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:16 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/gma500: Make cdv hdmi use ddc adapter from
 drm_connector
Date: Wed,  1 Jun 2022 11:23:07 +0200
Message-Id: <20220601092311.22648-5-patrik.r.jakobsson@gmail.com>
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

We're moving all uses of ddc_bus from gma_encoder to drm_connector where
they belong. Also, cleanup the error handling in cdv_hdmi_init()
and remove unused i2c pointer in mid_intel_hdmi_priv.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 98 ++++++++++++-------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index bd6791522160..29ef45f14169 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -53,7 +53,6 @@ struct mid_intel_hdmi_priv {
 	bool has_hdmi_audio;
 	/* Should set this when detect hotplug */
 	bool hdmi_device_connected;
-	struct i2c_adapter *hdmi_i2c_adapter;	/* for control functions */
 	struct drm_device *dev;
 };
 
@@ -130,7 +129,7 @@ static enum drm_connector_status cdv_hdmi_detect(
 	struct edid *edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
-	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->base);
+	edid = drm_get_edid(connector, connector->ddc);
 
 	hdmi_priv->has_hdmi_sink = false;
 	hdmi_priv->has_hdmi_audio = false;
@@ -208,11 +207,10 @@ static int cdv_hdmi_set_property(struct drm_connector *connector,
  */
 static int cdv_hdmi_get_modes(struct drm_connector *connector)
 {
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 	struct edid *edid = NULL;
 	int ret = 0;
 
-	edid = drm_get_edid(connector, &gma_encoder->i2c_bus->base);
+	edid = drm_get_edid(connector, connector->ddc);
 	if (edid) {
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
@@ -243,9 +241,9 @@ static enum drm_mode_status cdv_hdmi_mode_valid(struct drm_connector *connector,
 static void cdv_hdmi_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
+	struct gma_i2c_chan *ddc_bus = to_gma_i2c_chan(connector->ddc);
 
-	gma_i2c_destroy(gma_encoder->i2c_bus);
+	gma_i2c_destroy(ddc_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
@@ -278,37 +276,60 @@ void cdv_hdmi_init(struct drm_device *dev,
 	struct gma_encoder *gma_encoder;
 	struct gma_connector *gma_connector;
 	struct drm_connector *connector;
-	struct drm_encoder *encoder;
 	struct mid_intel_hdmi_priv *hdmi_priv;
-	int ddc_bus;
+	struct gma_i2c_chan *ddc_bus;
+	int ddc_reg;
+	int ret;
 
 	gma_encoder = kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
-
 	if (!gma_encoder)
 		return;
 
-	gma_connector = kzalloc(sizeof(struct gma_connector),
-				      GFP_KERNEL);
-
+	gma_connector = kzalloc(sizeof(struct gma_connector), GFP_KERNEL);
 	if (!gma_connector)
-		goto err_connector;
+		goto err_free_encoder;
 
 	hdmi_priv = kzalloc(sizeof(struct mid_intel_hdmi_priv), GFP_KERNEL);
-
 	if (!hdmi_priv)
-		goto err_priv;
+		goto err_free_connector;
 
 	connector = &gma_connector->base;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
 	gma_connector->save = cdv_hdmi_save;
 	gma_connector->restore = cdv_hdmi_restore;
 
-	encoder = &gma_encoder->base;
-	drm_connector_init(dev, connector,
-			   &cdv_hdmi_connector_funcs,
-			   DRM_MODE_CONNECTOR_DVID);
+	switch (reg) {
+	case SDVOB:
+		ddc_reg = GPIOE;
+		gma_encoder->ddi_select = DDI0_SELECT;
+		break;
+	case SDVOC:
+		ddc_reg = GPIOD;
+		gma_encoder->ddi_select = DDI1_SELECT;
+		break;
+	default:
+		DRM_ERROR("unknown reg 0x%x for HDMI\n", reg);
+		goto err_free_hdmi_priv;
+	}
+
+	ddc_bus = gma_i2c_create(dev, ddc_reg,
+				 (reg == SDVOB) ? "HDMIB" : "HDMIC");
+	if (!ddc_bus) {
+		dev_err(dev->dev, "No ddc adapter available!\n");
+		goto err_free_hdmi_priv;
+	}
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &cdv_hdmi_connector_funcs,
+					  DRM_MODE_CONNECTOR_DVID,
+					  &ddc_bus->base);
+	if (ret)
+		goto err_ddc_destroy;
+
+	ret = drm_simple_encoder_init(dev, &gma_encoder->base,
+				      DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		goto err_connector_cleanup;
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_HDMI;
@@ -316,7 +337,7 @@ void cdv_hdmi_init(struct drm_device *dev,
 	hdmi_priv->has_hdmi_sink = false;
 	gma_encoder->dev_priv = hdmi_priv;
 
-	drm_encoder_helper_add(encoder, &cdv_hdmi_helper_funcs);
+	drm_encoder_helper_add(&gma_encoder->base, &cdv_hdmi_helper_funcs);
 	drm_connector_helper_add(connector,
 				 &cdv_hdmi_connector_helper_funcs);
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
@@ -327,38 +348,17 @@ void cdv_hdmi_init(struct drm_device *dev,
 				      dev->mode_config.scaling_mode_property,
 				      DRM_MODE_SCALE_FULLSCREEN);
 
-	switch (reg) {
-	case SDVOB:
-		ddc_bus = GPIOE;
-		gma_encoder->ddi_select = DDI0_SELECT;
-		break;
-	case SDVOC:
-		ddc_bus = GPIOD;
-		gma_encoder->ddi_select = DDI1_SELECT;
-		break;
-	default:
-		DRM_ERROR("unknown reg 0x%x for HDMI\n", reg);
-		goto failed_ddc;
-		break;
-	}
-
-	gma_encoder->i2c_bus = gma_i2c_create(dev, ddc_bus,
-					(reg == SDVOB) ? "HDMIB" : "HDMIC");
-
-	if (!gma_encoder->i2c_bus) {
-		dev_err(dev->dev, "No ddc adapter available!\n");
-		goto failed_ddc;
-	}
-
-	hdmi_priv->hdmi_i2c_adapter = &gma_encoder->i2c_bus->base;
 	hdmi_priv->dev = dev;
 	return;
 
-failed_ddc:
-	drm_encoder_cleanup(encoder);
+err_connector_cleanup:
 	drm_connector_cleanup(connector);
-err_priv:
+err_ddc_destroy:
+	gma_i2c_destroy(ddc_bus);
+err_free_hdmi_priv:
+	kfree(hdmi_priv);
+err_free_connector:
 	kfree(gma_connector);
-err_connector:
+err_free_encoder:
 	kfree(gma_encoder);
 }
-- 
2.36.1

