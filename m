Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A64E3F52
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6D10E5B6;
	Tue, 22 Mar 2022 13:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D7210E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m26-20020a05600c3b1a00b0038c8b999f58so2459439wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T4rJHBPoBGvLAFEQkIjKar+4DiOStCBIxZjHiillBs0=;
 b=YqbQIQIw5uyz/ys0z0/UuzKhux7urIpCyDQacAthraAw7LN5hmo9UvFWs81tb2kXY6
 R9jn6MfORBy4VxnB21wDMuA1xOsiccAm8mzjzsKbzyI/q+6idGfo/SwGOcF8qFbCZiPS
 6zZjqsVY7XlpBEpgNZWyDcl7wfDEPfzQYPwVy7HNbb+EAXKDNY3QwtAexCDacdV1D9pQ
 +dDnuPODhprwhGR3efO0+3pglWDtZVXz49mMAOrRCm5cs8NSNFf4O57Xqu3jDCDU9trb
 J4Ewx4ufnJdMbxUe9dFzsJsgvhPhnSGfp3Y30GONwfoUCKZsg87Nw9XuGa/6M77jSSii
 qv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T4rJHBPoBGvLAFEQkIjKar+4DiOStCBIxZjHiillBs0=;
 b=Tty3e+PDfg6rluAo+SXIdHTG3MaqImsXGkq6aIa4v3Z7JDEdsAF3Cc8BjAXY81Z4Sk
 doS7TBNor2AMpQUIJDeyn+HenOWMWa65TWgMBFJnXkEh/T7UPpKCukjwqzHjTzEQgMqJ
 UTv49RykDHWY8jJiY/G7Fl+eLe8+N5z+p6IEYLuKidvd0tUvihCkW6C7gzjKn+I+0Rq/
 8RkLaYg8R5JIkT2Q48nClli4VTiO46fu15TXVStsky95b4ZDfK9PN1wYKiIEAdzvL8zk
 ZWEK/xQodKxM3a/11ieButBTcmM76ziEnyqEd+UIVIFC6pfmay8HIwTPQfkCX0gZF22Z
 ERTA==
X-Gm-Message-State: AOAM5318Fa5tof+hmzHbokaqqFjWrEiHxv6UsQz8pNuiUkTQWKkUWR5T
 dnRFB8GZYROkDORON0qKmbnS5DtiWTM=
X-Google-Smtp-Source: ABdhPJz8KdpDOaMXaJ022a3c+njWY5qCY0UTK2SFF2kLjhR+52LO9jBrPcH0BTP8f4JDIvreakxyBQ==
X-Received: by 2002:a05:6000:384:b0:203:ed51:8ab3 with SMTP id
 u4-20020a056000038400b00203ed518ab3mr19869370wrf.211.1647955068017; 
 Tue, 22 Mar 2022 06:17:48 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:47 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/gma500: gma500 don't register non-hotpluggable
 connectors
Date: Tue, 22 Mar 2022 14:17:39 +0100
Message-Id: <20220322131742.11566-4-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
References: <20220322131742.11566-1-patrik.r.jakobsson@gmail.com>
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

According to docs we should only register connectors that are
hotpluggable. No connectors in gma500 are hotpluggable.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_crt.c  | 3 ---
 drivers/gpu/drm/gma500/cdv_intel_dp.c   | 3 ---
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c | 2 --
 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 2 --
 drivers/gpu/drm/gma500/oaktrail_hdmi.c  | 1 -
 drivers/gpu/drm/gma500/oaktrail_lvds.c  | 1 -
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 2 --
 drivers/gpu/drm/gma500/psb_intel_sdvo.c | 2 --
 8 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_crt.c b/drivers/gpu/drm/gma500/cdv_intel_crt.c
index 4a9bb4994a26..1ae0fbbda0eb 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_crt.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_crt.c
@@ -194,7 +194,6 @@ static void cdv_intel_crt_destroy(struct drm_connector *connector)
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 	psb_intel_i2c_destroy(gma_encoder->ddc_bus);
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -281,8 +280,6 @@ void cdv_intel_crt_init(struct drm_device *dev,
 	drm_connector_helper_add(connector,
 					&cdv_intel_crt_connector_helper_funcs);
 
-	drm_connector_register(connector);
-
 	return;
 failed_ddc:
 	drm_encoder_cleanup(&gma_encoder->base);
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index f562e91337c7..3fba9d4e785d 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1866,7 +1866,6 @@ cdv_intel_dp_destroy(struct drm_connector *connector)
 		intel_dp->panel_fixed_mode = NULL;
 	}
 	i2c_del_adapter(&intel_dp->adapter);
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -1990,8 +1989,6 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
-	drm_connector_register(connector);
-
 	/* Set up the DDC bus. */
 	switch (output_reg) {
 		case DP_B:
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index e525689f84f0..e0d4c49b3c92 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -245,7 +245,6 @@ static void cdv_hdmi_destroy(struct drm_connector *connector)
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -352,7 +351,6 @@ void cdv_hdmi_init(struct drm_device *dev,
 
 	hdmi_priv->hdmi_i2c_adapter = &(gma_encoder->i2c_bus->adapter);
 	hdmi_priv->dev = dev;
-	drm_connector_register(connector);
 	return;
 
 failed_ddc:
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 9e1cdb11023c..851a3cc4653e 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -329,7 +329,6 @@ static void cdv_intel_lvds_destroy(struct drm_connector *connector)
 	struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 	psb_intel_i2c_destroy(gma_encoder->i2c_bus);
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -647,7 +646,6 @@ void cdv_intel_lvds_init(struct drm_device *dev,
 
 out:
 	mutex_unlock(&dev->mode_config.mutex);
-	drm_connector_register(connector);
 	return;
 
 failed_find:
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index 6eef60a5ac27..b5946a1cdcd5 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -654,7 +654,6 @@ void oaktrail_hdmi_init(struct drm_device *dev,
 	connector->display_info.subpixel_order = SubPixelHorizontalRGB;
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
-	drm_connector_register(connector);
 	dev_info(dev->dev, "HDMI initialised.\n");
 
 	return;
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 04852dbc7fb3..aed5de8f8245 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -401,7 +401,6 @@ void oaktrail_lvds_init(struct drm_device *dev,
 out:
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_connector_register(connector);
 	return;
 
 failed_find:
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index ac97e0d3c7dd..ec8f0b504ccc 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -525,7 +525,6 @@ void psb_intel_lvds_destroy(struct drm_connector *connector)
 	struct psb_intel_lvds_priv *lvds_priv = gma_encoder->dev_priv;
 
 	psb_intel_i2c_destroy(lvds_priv->ddc_bus);
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -782,7 +781,6 @@ void psb_intel_lvds_init(struct drm_device *dev,
 	 */
 out:
 	mutex_unlock(&dev->mode_config.mutex);
-	drm_connector_register(connector);
 	return;
 
 failed_find:
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index 042c4392e676..5b72a759a182 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -1542,7 +1542,6 @@ static int psb_intel_sdvo_get_modes(struct drm_connector *connector)
 
 static void psb_intel_sdvo_destroy(struct drm_connector *connector)
 {
-	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
 	kfree(connector);
 }
@@ -1932,7 +1931,6 @@ psb_intel_sdvo_connector_init(struct psb_intel_sdvo_connector *connector,
 	connector->base.restore = psb_intel_sdvo_restore;
 
 	gma_connector_attach_encoder(&connector->base, &encoder->base);
-	drm_connector_register(&connector->base.base);
 }
 
 static void
-- 
2.35.1

