Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60265AD493
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C8C10E3B5;
	Mon,  5 Sep 2022 14:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E51010E3B3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 14:16:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A4CE33ABE;
 Mon,  5 Sep 2022 14:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662387410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3IimVBw0OOLlwsM97YK3HfsF2lOEJj6VkPi6wnKobc=;
 b=phCXct9rT7aCAzA9h7XfNDdAHSIWoAy8/PGOolnFq1lYSoQdvQLiylOWUe9duP5G3pfw1f
 wxbfCo9j3zG6sS97XoZ7qS6yG41ao+P3LmtVPdj8xUBIhG/rHJETQQKfDKQsV0MhQys0/o
 9X3iPc6p8ZvhGH+RFQnNslnm5uIHK1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662387410;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3IimVBw0OOLlwsM97YK3HfsF2lOEJj6VkPi6wnKobc=;
 b=ZVBDLfE1WAwyzXbvV9tqkAecIHnI0grJ5Vt6cS1J0xqqyCPX1SccfALL9R2KdKtfqYUnrP
 pTNFeSJTRYll8aBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C80F13B2A;
 Mon,  5 Sep 2022 14:16:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8PMtAtIEFmMoNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 14:16:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH v3 1/4] drm/probe-helper: Add
 drm_connector_helper_get_modes_fixed()
Date: Mon,  5 Sep 2022 16:16:45 +0200
Message-Id: <20220905141648.22013-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905141648.22013-1-tzimmermann@suse.de>
References: <20220905141648.22013-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm_connector_helper_get_modes_fixed(), which duplicates a single
display mode for a connector. Convert drivers.

v2:
	* rename 'static' and 'hw' to 'fixed' everywhere
	* fix typo 'there' to 'their' (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c     | 20 +--------------
 drivers/gpu/drm/drm_probe_helper.c | 40 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/repaper.c     | 16 +-----------
 drivers/gpu/drm/tiny/simpledrm.c   | 18 +-------------
 include/drm/drm_probe_helper.h     |  3 +++
 5 files changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 84abc3920b57..de2a5be67415 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -415,26 +415,8 @@ EXPORT_SYMBOL(mipi_dbi_pipe_disable);
 static int mipi_dbi_connector_get_modes(struct drm_connector *connector)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
-	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &dbidev->mode);
-	if (!mode) {
-		DRM_ERROR("Failed to duplicate mode\n");
-		return 0;
-	}
-
-	if (mode->name[0] == '\0')
-		drm_mode_set_name(mode);
-
-	mode->type |= DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
-
-	if (mode->width_mm) {
-		connector->display_info.width_mm = mode->width_mm;
-		connector->display_info.height_mm = mode->height_mm;
-	}
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &dbidev->mode);
 }
 
 static const struct drm_connector_helper_funcs mipi_dbi_connector_hfuncs = {
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bb427c5a4f1f..818150a1b3b0 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1050,6 +1050,46 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
 
+/**
+ * drm_connector_helper_get_modes_fixed - Duplicates a display mode for a connector
+ * @connector: the connector
+ * @fixed_mode: the display hardware's mode
+ *
+ * This function duplicates a display modes for a connector. Drivers for hardware
+ * that only supports a single fixed mode can use this function in their connector's
+ * get_modes helper.
+ *
+ * Returns:
+ * The number of created modes.
+ */
+int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
+					 const struct drm_display_mode *fixed_mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(dev, fixed_mode);
+	if (!mode) {
+		drm_err(dev, "Failed to duplicate mode " DRM_MODE_FMT "\n",
+			DRM_MODE_ARG(fixed_mode));
+		return 0;
+	}
+
+	if (mode->name[0] == '\0')
+		drm_mode_set_name(mode);
+
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	if (mode->width_mm)
+		connector->display_info.width_mm = mode->width_mm;
+	if (mode->height_mm)
+		connector->display_info.height_mm = mode->height_mm;
+
+	return 1;
+}
+EXPORT_SYMBOL(drm_connector_helper_get_modes_fixed);
+
 /**
  * drm_connector_helper_get_modes - Read EDID and update connector.
  * @connector: The connector
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c4c1be3ac0b8..01fbd00411fc 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -839,22 +839,8 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
 static int repaper_connector_get_modes(struct drm_connector *connector)
 {
 	struct repaper_epd *epd = drm_to_epd(connector->dev);
-	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, epd->mode);
-	if (!mode) {
-		DRM_ERROR("Failed to duplicate mode\n");
-		return 0;
-	}
-
-	drm_mode_set_name(mode);
-	mode->type |= DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
-
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, epd->mode);
 }
 
 static const struct drm_connector_helper_funcs repaper_connector_hfuncs = {
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index a81f91814595..c79576844ec0 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -620,24 +620,8 @@ static const struct drm_encoder_funcs simpledrm_encoder_funcs = {
 static int simpledrm_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct simpledrm_device *sdev = simpledrm_device_of_dev(connector->dev);
-	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, &sdev->mode);
-	if (!mode)
-		return 0;
-
-	if (mode->name[0] == '\0')
-		drm_mode_set_name(mode);
-
-	mode->type |= DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
-
-	if (mode->width_mm)
-		connector->display_info.width_mm = mode->width_mm;
-	if (mode->height_mm)
-		connector->display_info.height_mm = mode->height_mm;
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &sdev->mode);
 }
 
 static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 8075e02aa865..d261838a7790 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -7,6 +7,7 @@
 
 struct drm_connector;
 struct drm_device;
+struct drm_display_mode;
 struct drm_modeset_acquire_ctx;
 
 int drm_helper_probe_single_connector_modes(struct drm_connector
@@ -27,6 +28,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev);
 bool drm_kms_helper_is_poll_worker(void);
 
 int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
+int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
+					 const struct drm_display_mode *fixed_mode);
 int drm_connector_helper_get_modes(struct drm_connector *connector);
 
 #endif
-- 
2.37.2

