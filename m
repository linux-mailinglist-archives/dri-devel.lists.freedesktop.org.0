Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD353A03A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F87D10E97D;
	Wed,  1 Jun 2022 09:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7C10E97D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:21 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id l13so1694269lfp.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7A+mZsxmo75QXf97kG0BxS3odf33y0CUhZnMAM+Das=;
 b=jQK7mRTDxT3YiRRW1PtL6CjuMeo6BBHqqjAnlUyrp5PFu1M9VtizsmHJMeGfk3BV5B
 wsP5S9dLVsndNchYdSXESqUcWdP7ONxlM1t57b2nrALP8OJHJ3PgguE2tKSMe8bLM8Nw
 7BM3A1+inDvD3y2t8b5TnufzBs4xVixU+QQ28DUpwIYtwyVK+KBU0Pnof9QOwI0/8jE5
 A2iJ1EaDPybN6wdRvhHZ95majy711yxCi19YT35U0vRbOXL17jeOmRl3h5WgV+gLOPyR
 Q4VrYzhWRKgZapR+CQQsSy1Ad76InrXGmiqUPQFMWDXdf7EO1HbMjj2VpMQCBC44BRm3
 aiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7A+mZsxmo75QXf97kG0BxS3odf33y0CUhZnMAM+Das=;
 b=x+PHZ3DWWXbNf4SGhoDMckuSAIwl+HjeEdmctz/+G0KWHvm0oiF2Q1jspowem2ooJE
 1HcDO3hLxnaLQI3JSpl5EqQqLYwjYOa+6LWUIRctUc+w1YbjCdHIQtZN7v6ieZrsvPCU
 rZcKhR052dTnkOBzhbNNL35lHTyBqW2tF5FBpDDkTZCtX+gLLWVQgJ3OWQZtYOJ3FpW5
 aXpsf5eWNKnlQY9LksOKWmBNY5eJzPQcZR9JSylRwqvno15xiIXhwQ4fM6zaU1qNJyc2
 Tyfgwr/XGrnYf/HEs2yVLJQdhGGjxjJxuMtgTFRPZ9AW99ImcHseIzUZznLLbScXXNYj
 L7cA==
X-Gm-Message-State: AOAM531K/ijYY1kAtNZZA6pBk5AJ6vtQJTXyOD9c/ioYi01sXnO18+Uc
 8WX9I75u3fYaxxrV9iaV0ZPxmb8nDi0=
X-Google-Smtp-Source: ABdhPJyLKEu98+ERBg6qS3bJIjF6hQRJ9xtwYfrAY/O3HlgooCju+fKTA2czkVQUDxgojxhh3BLp9Q==
X-Received: by 2002:a05:6512:1191:b0:473:c7c3:f6ff with SMTP id
 g17-20020a056512119100b00473c7c3f6ffmr44938534lfr.39.1654075399342; 
 Wed, 01 Jun 2022 02:23:19 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:18 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/gma500: Make cdv crt use ddc adapter from
 drm_connector
Date: Wed,  1 Jun 2022 11:23:09 +0200
Message-Id: <20220601092311.22648-7-patrik.r.jakobsson@gmail.com>
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
Also cleanup the error handling in cdv_intel_crt_init().

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c | 47 +++++++++++++++-----------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index be0d6a4591bf..7ff1e5141150 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -192,18 +192,16 @@ static enum drm_connector_status cdv_intel_crt_detect(
 static void cdv_intel_crt_destroy(struct drm_connector *connector)
 {
 	struct gma_connector *gma_connector = to_gma_connector(connector);
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
+	struct gma_i2c_chan *ddc_bus = to_gma_i2c_chan(connector->ddc);
 
-	gma_i2c_destroy(gma_encoder->ddc_bus);
+	gma_i2c_destroy(ddc_bus);
 	drm_connector_cleanup(connector);
 	kfree(gma_connector);
 }
 
 static int cdv_intel_crt_get_modes(struct drm_connector *connector)
 {
-	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
-	return psb_intel_ddc_get_modes(connector,
-				       &gma_encoder->ddc_bus->base);
+	return psb_intel_ddc_get_modes(connector, connector->ddc);
 }
 
 static int cdv_intel_crt_set_property(struct drm_connector *connector,
@@ -245,8 +243,10 @@ void cdv_intel_crt_init(struct drm_device *dev,
 
 	struct gma_connector *gma_connector;
 	struct gma_encoder *gma_encoder;
+	struct gma_i2c_chan *ddc_bus;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
+	int ret;
 
 	gma_encoder = kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
 	if (!gma_encoder)
@@ -254,25 +254,31 @@ void cdv_intel_crt_init(struct drm_device *dev,
 
 	gma_connector = kzalloc(sizeof(struct gma_connector), GFP_KERNEL);
 	if (!gma_connector)
-		goto failed_connector;
+		goto err_free_encoder;
+
+	/* Set up the DDC bus. */
+	ddc_bus = gma_i2c_create(dev, GPIOA, "CRTDDC_A");
+	if (!ddc_bus) {
+		dev_printk(KERN_ERR, dev->dev, "DDC bus registration failed.\n");
+		goto err_free_connector;
+	}
 
 	connector = &gma_connector->base;
 	connector->polled = DRM_CONNECTOR_POLL_HPD;
-	drm_connector_init(dev, connector,
-		&cdv_intel_crt_connector_funcs, DRM_MODE_CONNECTOR_VGA);
+	ret = drm_connector_init_with_ddc(dev, connector,
+					  &cdv_intel_crt_connector_funcs,
+					  DRM_MODE_CONNECTOR_VGA,
+					  &ddc_bus->base);
+	if (ret)
+		goto err_ddc_destroy;
 
 	encoder = &gma_encoder->base;
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
+	if (ret)
+		goto err_connector_cleanup;
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 
-	/* Set up the DDC bus. */
-	gma_encoder->ddc_bus = gma_i2c_create(dev, GPIOA, "CRTDDC_A");
-	if (!gma_encoder->ddc_bus) {
-		dev_printk(KERN_ERR, dev->dev, "DDC bus registration failed.\n");
-		goto failed_ddc;
-	}
-
 	gma_encoder->type = INTEL_OUTPUT_ANALOG;
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
@@ -282,11 +288,14 @@ void cdv_intel_crt_init(struct drm_device *dev,
 					&cdv_intel_crt_connector_helper_funcs);
 
 	return;
-failed_ddc:
-	drm_encoder_cleanup(&gma_encoder->base);
+
+err_connector_cleanup:
 	drm_connector_cleanup(&gma_connector->base);
+err_ddc_destroy:
+	gma_i2c_destroy(ddc_bus);
+err_free_connector:
 	kfree(gma_connector);
-failed_connector:
+err_free_encoder:
 	kfree(gma_encoder);
 	return;
 }
-- 
2.36.1

