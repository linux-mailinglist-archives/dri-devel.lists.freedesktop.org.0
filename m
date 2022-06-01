Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27153A03C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7380B10E9AE;
	Wed,  1 Jun 2022 09:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9915D10E97E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:23:22 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u26so1016377lfd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DaxXNPexqLOJcjaXRNMEpEJGoHmbQc8dtYSnL+X+RE=;
 b=gasSJ3d3Qot2jqMMmBnEYmgNDMamzpcbNftw1XKPWE/OzL2QemmU6+0EUjE4Qi6OSl
 2mCJqEs8fbjaDugMRwDLUWrI7Xmp7FTsNKQntnYTlTW//Lrbn7pr8ljeXbXPuCJJ3WnV
 2nrdllnb6tbpm3GJ2+aPn+4Fhsh+odki2hsZNGUO/p4e5fPFPr4n+2NhyLnsTQNeM6BL
 U5VGT2ABcH54p8MID2NMu3TsbvWUZ4znc/qOLJaaB9Ir58j2Y3YIGzteM1BF8lCjfTH5
 7zdBLQMfE+W71ahavkjrZ9fFUTz3fFDUKGfCSuCAqdmmQZHkLDWwpc4binzQ8OmH7LL9
 9kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DaxXNPexqLOJcjaXRNMEpEJGoHmbQc8dtYSnL+X+RE=;
 b=HJT+vWN4E1vekEquRCuonAwp6IGkwawbxhTUxa4vUaycJKI7FvzMtBTem/SPB5a53Q
 bWBA1OrseA/WE/8Z3LjnG6/eLrFqLEf8ORowJ8X4wGEWkfwCboDqHhSTxXEBH1AzHdUb
 VNbaph3tC2JqskLu3z3WwhmYz1g9cD0KzLMF30rkfM0xjbUehQx0ZRUkNL7XxQy//BZ6
 rbEl/j5P3kOzel5A4byPp2GhWme30917x0nhVo5fjKhsj2RT3nYm3Lqf/J5RBkXZDDXY
 pRBOHDdQiNB+j+KcmzbSebJENrscO1jbe1UiruwHrQiH9GTRn8qBRdUdrf+qUjLrQrjM
 ZYbQ==
X-Gm-Message-State: AOAM533R79ud79ynItFPaOYwcbkxr3s2+1L0+UQbpH4EDmOZsRCLb2k+
 PDlWdt0iRPgfJkbAFQqqTIMYaz6Jdm4=
X-Google-Smtp-Source: ABdhPJxg2ZgoZkGaf4Dh5YcC1Z/s6XB6ncBRflEHronE0L+N+dqToF9YhEEW6xPsbwmdtAlSELaEag==
X-Received: by 2002:a19:650f:0:b0:478:fe97:f761 with SMTP id
 z15-20020a19650f000000b00478fe97f761mr3044575lfb.673.1654075400547; 
 Wed, 01 Jun 2022 02:23:20 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 z14-20020a056512308e00b00478f60ca3a4sm257065lfd.56.2022.06.01.02.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 02:23:20 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/gma500: Make oaktrail lvds use ddc adapter from
 drm_connector
Date: Wed,  1 Jun 2022 11:23:10 +0200
Message-Id: <20220601092311.22648-8-patrik.r.jakobsson@gmail.com>
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
The initialization of the gma_i2c_chan for Oaktrail is a bit backwards
so it required improvements. Also cleanup the error handling in
oaktrail_lvds_init(). Since this is the last user of
gma_encoder->ddc_bus we can remove it.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/oaktrail_lvds.c     | 50 +++++++++++++---------
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 14 +++---
 drivers/gpu/drm/gma500/psb_intel_drv.h     |  3 +-
 3 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 8609f6249c4c..9c9ebf8e29c4 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -293,12 +293,14 @@ void oaktrail_lvds_init(struct drm_device *dev,
 {
 	struct gma_encoder *gma_encoder;
 	struct gma_connector *gma_connector;
+	struct gma_i2c_chan *ddc_bus;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct edid *edid;
 	struct i2c_adapter *i2c_adap;
 	struct drm_display_mode *scan;	/* *modes, *bios_mode; */
+	int ret;
 
 	gma_encoder = kzalloc(sizeof(struct gma_encoder), GFP_KERNEL);
 	if (!gma_encoder)
@@ -306,16 +308,20 @@ void oaktrail_lvds_init(struct drm_device *dev,
 
 	gma_connector = kzalloc(sizeof(struct gma_connector), GFP_KERNEL);
 	if (!gma_connector)
-		goto failed_connector;
+		goto err_free_encoder;
 
 	connector = &gma_connector->base;
 	encoder = &gma_encoder->base;
 	dev_priv->is_lvds_on = true;
-	drm_connector_init(dev, connector,
-			   &psb_intel_lvds_connector_funcs,
-			   DRM_MODE_CONNECTOR_LVDS);
+	ret = drm_connector_init(dev, connector,
+				 &psb_intel_lvds_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret)
+		goto err_free_connector;
 
-	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_LVDS);
+	if (ret)
+		goto err_connector_cleanup;
 
 	gma_connector_attach_encoder(gma_connector, gma_encoder);
 	gma_encoder->type = INTEL_OUTPUT_LVDS;
@@ -353,16 +359,26 @@ void oaktrail_lvds_init(struct drm_device *dev,
 
 	edid = NULL;
 	mutex_lock(&dev->mode_config.mutex);
+
 	i2c_adap = i2c_get_adapter(dev_priv->ops->i2c_bus);
 	if (i2c_adap)
 		edid = drm_get_edid(connector, i2c_adap);
+
 	if (edid == NULL && dev_priv->lpc_gpio_base) {
-		oaktrail_lvds_i2c_init(encoder);
-		if (gma_encoder->ddc_bus != NULL) {
-			i2c_adap = &gma_encoder->ddc_bus->base;
+		ddc_bus = oaktrail_lvds_i2c_init(dev);
+		if (!IS_ERR(ddc_bus)) {
+			i2c_adap = &ddc_bus->base;
 			edid = drm_get_edid(connector, i2c_adap);
 		}
 	}
+
+	/*
+	 * Due to the logic in probing for i2c buses above we do not know the
+	 * i2c_adap until now. Hence we cannot use drm_connector_init_with_ddc()
+	 * but must instead set connector->ddc manually here.
+	 */
+	connector->ddc = i2c_adap;
+
 	/*
 	 * Attempt to get the fixed panel mode from DDC.  Assume that the
 	 * preferred mode is the right one.
@@ -395,7 +411,7 @@ void oaktrail_lvds_init(struct drm_device *dev,
 	/* If we still don't have a mode after all that, give up. */
 	if (!mode_dev->panel_fixed_mode) {
 		dev_err(dev->dev, "Found no modes on the lvds, ignoring the LVDS\n");
-		goto failed_find;
+		goto err_unlock;
 	}
 
 out:
@@ -403,21 +419,15 @@ void oaktrail_lvds_init(struct drm_device *dev,
 
 	return;
 
-failed_find:
+err_unlock:
 	mutex_unlock(&dev->mode_config.mutex);
-
-	dev_dbg(dev->dev, "No LVDS modes found, disabling.\n");
-	if (gma_encoder->ddc_bus) {
-		gma_i2c_destroy(gma_encoder->ddc_bus);
-		gma_encoder->ddc_bus = NULL;
-	}
-
-/* failed_ddc: */
-
+	gma_i2c_destroy(to_gma_i2c_chan(connector->ddc));
 	drm_encoder_cleanup(encoder);
+err_connector_cleanup:
 	drm_connector_cleanup(connector);
+err_free_connector:
 	kfree(gma_connector);
-failed_connector:
+err_free_encoder:
 	kfree(gma_encoder);
 }
 
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
index ee163fb972d9..06b5b2d70d48 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
@@ -129,16 +129,15 @@ static void set_data(void *data, int state_high)
 	}
 }
 
-void oaktrail_lvds_i2c_init(struct drm_encoder *encoder)
+struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev)
 {
-	struct drm_device *dev = encoder->dev;
-	struct gma_encoder *gma_encoder = to_gma_encoder(encoder);
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_i2c_chan *chan;
+	int ret;
 
 	chan = kzalloc(sizeof(struct gma_i2c_chan), GFP_KERNEL);
 	if (!chan)
-		return;
+		return ERR_PTR(-ENOMEM);
 
 	chan->drm_dev = dev;
 	chan->reg = dev_priv->lpc_gpio_base;
@@ -160,10 +159,11 @@ void oaktrail_lvds_i2c_init(struct drm_encoder *encoder)
 	set_clock(chan, 1);
 	udelay(50);
 
-	if (i2c_bit_add_bus(&chan->base)) {
+	ret = i2c_bit_add_bus(&chan->base);
+	if (ret < 0) {
 		kfree(chan);
-		return;
+		return ERR_PTR(ret);
 	}
 
-	gma_encoder->ddc_bus = chan;
+	return chan;
 }
diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 1c28288f36a0..8ccba116821b 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -105,7 +105,6 @@ struct gma_encoder {
 	/* FIXME: Either make SDVO and LVDS store it's i2c here or give CDV it's
 	   own set of output privates */
 	struct gma_i2c_chan *i2c_bus;
-	struct gma_i2c_chan *ddc_bus;
 };
 
 struct gma_connector {
@@ -200,7 +199,7 @@ extern void oaktrail_lvds_init(struct drm_device *dev,
 extern void oaktrail_wait_for_INTR_PKT_SENT(struct drm_device *dev);
 extern void oaktrail_dsi_init(struct drm_device *dev,
 			   struct psb_intel_mode_device *mode_dev);
-extern void oaktrail_lvds_i2c_init(struct drm_encoder *encoder);
+struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev);
 extern void mid_dsi_init(struct drm_device *dev,
 		    struct psb_intel_mode_device *mode_dev, int dsi_num);
 
-- 
2.36.1

