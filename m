Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D4F4E3F51
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 14:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD75210E58F;
	Tue, 22 Mar 2022 13:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C008210E5B3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:17:48 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 m26-20020a05600c3b1a00b0038c8b999f58so2459342wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ES/w9hA5Q9T1WVbvmvEIWQNFxZSKsDDWYnekP128lQ=;
 b=kz67KZAyufc1WMZcByXecNAaqSMxixIJZvrCHEdtKHBjAwSB9Xg//60JnV5uo4R13F
 HtTsd1clmObseegkGNWEcHeGExV2NL/DjtWkt8dwEkONi//Ju7u5amJVOY4n45FAdNkA
 cbDTX0QEdk6rtXXPuUGo0q7B8ZdBO04Vc+Sb90R9Uw7BbhGyBcYTpqtrblq33GGukS2/
 a/RXHKGzlIBe/F8VUzGsd0J0deQoKndGWTY5QNgj8b49jaMll44OW6a+U+UWCxHXmALI
 0vtx0K0gJZFhdovtjKs8tJlG6xja1NU1RTQJ8VQQkptXVjfwekwchTB9t+gh7ygbBC7+
 eNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2ES/w9hA5Q9T1WVbvmvEIWQNFxZSKsDDWYnekP128lQ=;
 b=JPsl4BL9cxIf3RTuGV1OGfzPe7BfbDhBdN6maYF01aRD8mO4K45KqypTFR51x/7hBz
 SB8FEPvFcDHHGjUHnSmewaFC17BmratV6ZD/CeJctR/x2wDKk3erEpvtdbdDUuhPXmt1
 lnMk4r0An4zAAqGpT463NoOeCrKzpoOb3mw7fOsBnwyA/CO9tmZMrnXIB+vZ6MnhIuGU
 QXKKawGHJV9w04Y+gaNwP3nw2m5hNuEtIFofPwgabH5A0kWcgkn4LZcAmQgdE9iZsBE8
 wpBb9gxUjFRIFxck5k1qBqaIxGgdgW9UvHKf4uq4jKB3gMLm3Wpq1i5BfxS9M65r6A3y
 4fbQ==
X-Gm-Message-State: AOAM532yBkuQNfnNFJZzAsX4513Q4sfd+GmwtAuaJNGP1sFKPixZjwNf
 PDkopx+BSYkhqa6s+ees4i65E1cey7s=
X-Google-Smtp-Source: ABdhPJwP96rUsyYI6aN08WMpdC8AvouBjXy3C41SOP6Oa2sy7NGD9bJyHmr2jhZdyjyQH0yAKwLxoQ==
X-Received: by 2002:a7b:c925:0:b0:38c:82d7:868d with SMTP id
 h5-20020a7bc925000000b0038c82d7868dmr3698848wml.100.1647955066765; 
 Tue, 22 Mar 2022 06:17:46 -0700 (PDT)
Received: from workstation.suse.de (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm17978437wry.112.2022.03.22.06.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 06:17:46 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/gma500: Make use of the drm connector iterator
Date: Tue, 22 Mar 2022 14:17:38 +0100
Message-Id: <20220322131742.11566-3-patrik.r.jakobsson@gmail.com>
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

This makes sure we're using proper locking when iterating the list of
connectors.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_device.c        | 10 ++++++--
 drivers/gpu/drm/gma500/cdv_intel_display.c |  9 +++++--
 drivers/gpu/drm/gma500/framebuffer.c       |  6 +++--
 drivers/gpu/drm/gma500/gma_display.c       | 16 ++++++++-----
 drivers/gpu/drm/gma500/oaktrail_crtc.c     | 17 ++++++++-----
 drivers/gpu/drm/gma500/oaktrail_lvds.c     | 15 ++++++------
 drivers/gpu/drm/gma500/psb_device.c        | 28 +++++++++++++++-------
 drivers/gpu/drm/gma500/psb_drv.c           | 10 ++++----
 drivers/gpu/drm/gma500/psb_intel_display.c | 15 ++++++++----
 9 files changed, 84 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index f854f58bcbb3..dd32b484dd82 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -262,6 +262,7 @@ static int cdv_save_display_registers(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct psb_save_area *regs = &dev_priv->regs;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 
 	dev_dbg(dev->dev, "Saving GPU registers.\n");
@@ -298,8 +299,10 @@ static int cdv_save_display_registers(struct drm_device *dev)
 	regs->cdv.saveIER = REG_READ(PSB_INT_ENABLE_R);
 	regs->cdv.saveIMR = REG_READ(PSB_INT_MASK_R);
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter)
 		connector->funcs->dpms(connector, DRM_MODE_DPMS_OFF);
+	drm_connector_list_iter_end(&conn_iter);
 
 	return 0;
 }
@@ -317,6 +320,7 @@ static int cdv_restore_display_registers(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct psb_save_area *regs = &dev_priv->regs;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	u32 temp;
 
@@ -373,8 +377,10 @@ static int cdv_restore_display_registers(struct drm_device *dev)
 
 	drm_mode_config_reset(dev);
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head)
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter)
 		connector->funcs->dpms(connector, DRM_MODE_DPMS_ON);
+	drm_connector_list_iter_end(&conn_iter);
 
 	/* Resume the modeset for every activated CRTC */
 	drm_helper_resume_force_mode(dev);
diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 94ebc48a4349..0c3ddcdc29dc 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -584,13 +584,14 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 	bool ok;
 	bool is_lvds = false;
 	bool is_dp = false;
-	struct drm_mode_config *mode_config = &dev->mode_config;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	const struct gma_limit_t *limit;
 	u32 ddi_select = 0;
 	bool is_edp = false;
 
-	list_for_each_entry(connector, &mode_config->connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct gma_encoder *gma_encoder =
 					gma_attached_encoder(connector);
 
@@ -613,10 +614,14 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 			is_edp = true;
 			break;
 		default:
+			drm_connector_list_iter_end(&conn_iter);
 			DRM_ERROR("invalid output type.\n");
 			return 0;
 		}
+
+		break;
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	if (dev_priv->dplla_96mhz)
 		/* low-end sku, 96/100 mhz */
diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 2b99c996fdc2..0ac6ea5fd3a1 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -451,6 +451,7 @@ static const struct drm_mode_config_funcs psb_mode_funcs = {
 static void psb_setup_outputs(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 
 	drm_mode_create_scaling_mode_property(dev);
@@ -461,8 +462,8 @@ static void psb_setup_outputs(struct drm_device *dev)
 							"backlight", 0, 100);
 	dev_priv->ops->output_init(dev);
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list,
-			    head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 		struct drm_encoder *encoder = &gma_encoder->base;
 		int crtc_mask = 0, clone_mask = 0;
@@ -505,6 +506,7 @@ static void psb_setup_outputs(struct drm_device *dev)
 		encoder->possible_clones =
 		    gma_connector_clones(dev, clone_mask);
 	}
+	drm_connector_list_iter_end(&conn_iter);
 }
 
 void psb_modeset_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index 1d7964c339f4..e8157464d9eb 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -27,17 +27,21 @@
 bool gma_pipe_has_type(struct drm_crtc *crtc, int type)
 {
 	struct drm_device *dev = crtc->dev;
-	struct drm_mode_config *mode_config = &dev->mode_config;
-	struct drm_connector *l_entry;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
 
-	list_for_each_entry(l_entry, &mode_config->connector_list, head) {
-		if (l_entry->encoder && l_entry->encoder->crtc == crtc) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->encoder && connector->encoder->crtc == crtc) {
 			struct gma_encoder *gma_encoder =
-						gma_attached_encoder(l_entry);
-			if (gma_encoder->type == type)
+						gma_attached_encoder(connector);
+			if (gma_encoder->type == type) {
+				drm_connector_list_iter_end(&conn_iter);
 				return true;
+			}
 		}
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	return false;
 }
diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 36c7c2686c90..873c17cf8fb4 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -372,9 +372,9 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 	bool ok, is_sdvo = false;
 	bool is_lvds = false;
 	bool is_mipi = false;
-	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct gma_encoder *gma_encoder = NULL;
 	uint64_t scalingType = DRM_MODE_SCALE_FULLSCREEN;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	int i;
 	int need_aux = gma_pipe_has_type(crtc, INTEL_OUTPUT_SDVO) ? 1 : 0;
@@ -392,7 +392,8 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 		adjusted_mode,
 		sizeof(struct drm_display_mode));
 
-	list_for_each_entry(connector, &mode_config->connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (!connector->encoder || connector->encoder->crtc != crtc)
 			continue;
 
@@ -409,8 +410,16 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 			is_mipi = true;
 			break;
 		}
+
+		break;
 	}
 
+	if (gma_encoder)
+		drm_object_property_get_value(&connector->base,
+			dev->mode_config.scaling_mode_property, &scalingType);
+
+	drm_connector_list_iter_end(&conn_iter);
+
 	/* Disable the VGA plane that we never use */
 	for (i = 0; i <= need_aux; i++)
 		REG_WRITE_WITH_AUX(VGACNTRL, VGA_DISP_DISABLE, i);
@@ -424,10 +433,6 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 					     (mode->crtc_vdisplay - 1), i);
 	}
 
-	if (gma_encoder)
-		drm_object_property_get_value(&connector->base,
-			dev->mode_config.scaling_mode_property, &scalingType);
-
 	if (scalingType == DRM_MODE_SCALE_NO_SCALE) {
 		/* Moorestown doesn't have register support for centering so
 		 * we need to mess with the h/vblank and h/vsync start and
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 28b995ef2844..04852dbc7fb3 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -85,7 +85,7 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 	struct drm_device *dev = encoder->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct psb_intel_mode_device *mode_dev = &dev_priv->mode_dev;
-	struct drm_mode_config *mode_config = &dev->mode_config;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector = NULL;
 	struct drm_crtc *crtc = encoder->crtc;
 	u32 lvds_port;
@@ -112,21 +112,22 @@ static void oaktrail_lvds_mode_set(struct drm_encoder *encoder,
 	REG_WRITE(LVDS, lvds_port);
 
 	/* Find the connector we're trying to set up */
-	list_for_each_entry(connector, &mode_config->connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		if (connector->encoder && connector->encoder->crtc == crtc)
 			break;
 	}
 
-	if (list_entry_is_head(connector, &mode_config->connector_list, head)) {
+	if (!connector) {
+		drm_connector_list_iter_end(&conn_iter);
 		DRM_ERROR("Couldn't find connector when setting mode");
 		gma_power_end(dev);
 		return;
 	}
 
-	drm_object_property_get_value(
-		&connector->base,
-		dev->mode_config.scaling_mode_property,
-		&v);
+	drm_object_property_get_value( &connector->base,
+		dev->mode_config.scaling_mode_property, &v);
+	drm_connector_list_iter_end(&conn_iter);
 
 	if (v == DRM_MODE_SCALE_NO_SCALE)
 		REG_WRITE(PFIT_CONTROL, 0);
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index 59f325165667..71534f4ca834 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -168,8 +168,10 @@ static void psb_init_pm(struct drm_device *dev)
 static int psb_save_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct gma_connector *gma_connector;
 	struct drm_crtc *crtc;
-	struct gma_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
 
 	/* Display arbitration control + watermarks */
@@ -189,9 +191,13 @@ static int psb_save_display_registers(struct drm_device *dev)
 			dev_priv->ops->save_crtc(crtc);
 	}
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, base.head)
-		if (connector->save)
-			connector->save(&connector->base);
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		gma_connector = to_gma_connector(connector);
+		if (gma_connector->save)
+			gma_connector->save(connector);
+	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	drm_modeset_unlock_all(dev);
 	return 0;
@@ -206,8 +212,10 @@ static int psb_save_display_registers(struct drm_device *dev)
 static int psb_restore_display_registers(struct drm_device *dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
+	struct gma_connector *gma_connector;
 	struct drm_crtc *crtc;
-	struct gma_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
 	struct psb_state *regs = &dev_priv->regs.psb;
 
 	/* Display arbitration + watermarks */
@@ -228,9 +236,13 @@ static int psb_restore_display_registers(struct drm_device *dev)
 		if (drm_helper_crtc_in_use(crtc))
 			dev_priv->ops->restore_crtc(crtc);
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list, base.head)
-		if (connector->restore)
-			connector->restore(&connector->base);
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		gma_connector = to_gma_connector(connector);
+		if (gma_connector->restore)
+			gma_connector->restore(connector);
+	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	drm_modeset_unlock_all(dev);
 	return 0;
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index b231fddb8817..bb0e3288e35b 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -236,10 +236,11 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	unsigned long resource_start, resource_len;
 	unsigned long irqflags;
-	int ret = -ENOMEM;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	struct gma_encoder *gma_encoder;
 	struct psb_gtt *pg;
+	int ret = -ENOMEM;
 
 	/* initializing driver private data */
 
@@ -390,9 +391,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	psb_fbdev_init(dev);
 	drm_kms_helper_poll_init(dev);
 
-	/* Only add backlight support if we have LVDS output */
-	list_for_each_entry(connector, &dev->mode_config.connector_list,
-			    head) {
+	/* Only add backlight support if we have LVDS or MIPI output */
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		gma_encoder = gma_attached_encoder(connector);
 
 		switch (gma_encoder->type) {
@@ -402,6 +403,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 			break;
 		}
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index a99859b5b13a..fb8234f4d128 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -106,7 +106,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 	u32 dpll = 0, fp = 0, dspcntr, pipeconf;
 	bool ok, is_sdvo = false;
 	bool is_lvds = false, is_tv = false;
-	struct drm_mode_config *mode_config = &dev->mode_config;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	const struct gma_limit_t *limit;
 
@@ -116,7 +116,8 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 		return 0;
 	}
 
-	list_for_each_entry(connector, &mode_config->connector_list, head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 
 		if (!connector->encoder
@@ -135,6 +136,7 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 			break;
 		}
 	}
+	drm_connector_list_iter_end(&conn_iter);
 
 	refclk = 96000;
 
@@ -534,16 +536,19 @@ struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev, int pipe)
 
 int gma_connector_clones(struct drm_device *dev, int type_mask)
 {
-	int index_mask = 0;
+	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
+	int index_mask = 0;
 	int entry = 0;
 
-	list_for_each_entry(connector, &dev->mode_config.connector_list,
-			    head) {
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
 		struct gma_encoder *gma_encoder = gma_attached_encoder(connector);
 		if (type_mask & (1 << gma_encoder->type))
 			index_mask |= (1 << entry);
 		entry++;
 	}
+	drm_connector_list_iter_end(&conn_iter);
+
 	return index_mask;
 }
-- 
2.35.1

