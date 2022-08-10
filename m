Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB1C58EB33
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 13:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5952CB2EF7;
	Wed, 10 Aug 2022 11:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BA0B161B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 11:20:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4AD2A1F922;
 Wed, 10 Aug 2022 11:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660130455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLJDxP8fqX4idqm5itIOGXwggAEolT9Ve+A22UR6VGc=;
 b=HjnwdhHZPzvYiCNcbo+bmJjqAFV34rey0l4LNxf+X8FBIYZc3TZF3i58kJ69yxFs4RD3rx
 w5lmrYIFBshO8B/exlGXVSll2ZR6lxj4My+xyhk4ygJMze0ZoTw+sMdm2N7QZPKCAI6xNN
 GRn+p6PEHNN2kjpAFxxh6aDKPjSbNEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660130455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dLJDxP8fqX4idqm5itIOGXwggAEolT9Ve+A22UR6VGc=;
 b=JrH+StZh4CNlzQnXob4U9y15kO1gvREqsIV07Alq6sg/IOtGZljXKghRalXxsTsi50zmWn
 Ko+lPm9igryTO4Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C39913ABC;
 Wed, 10 Aug 2022 11:20:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eDEnApeU82KAVQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Aug 2022 11:20:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, sam@ravnborg.org, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 emma@anholt.net, kamlesh.gurudasani@gmail.com, david@lechnology.com
Subject: [PATCH 1/4] drm/probe-helper: Add
 drm_connector_helper_get_modes_static()
Date: Wed, 10 Aug 2022 13:20:50 +0200
Message-Id: <20220810112053.19547-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810112053.19547-1-tzimmermann@suse.de>
References: <20220810112053.19547-1-tzimmermann@suse.de>
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

Add drm_connector_helper_get_modes_static(), which duplicates a single
display mode for a connector. Convert drivers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_mipi_dbi.c     | 20 +--------------
 drivers/gpu/drm/drm_probe_helper.c | 40 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/tiny/repaper.c     | 16 +-----------
 drivers/gpu/drm/tiny/simpledrm.c   | 18 +-------------
 include/drm/drm_probe_helper.h     |  3 +++
 5 files changed, 46 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 84abc3920b57..b67ec9a5cda9 100644
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
+	return drm_connector_helper_get_modes_static(connector, &dbidev->mode);
 }
 
 static const struct drm_connector_helper_funcs mipi_dbi_connector_hfuncs = {
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index bb427c5a4f1f..809187377e4e 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1050,6 +1050,46 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes_from_ddc);
 
+/**
+ * drm_connector_helper_get_modes_static - Duplicates a display mode for a connector
+ * @connector: the connector
+ * @hw_mode: the display hardware's mode
+ *
+ * This function duplicates a display modes for a connector. Drivers for hardware
+ * that only supports a single mode can use this function in there connector's
+ * get_modes helper.
+ *
+ * Returns:
+ * The number of created modes.
+ */
+int drm_connector_helper_get_modes_static(struct drm_connector *connector,
+					  const struct drm_display_mode *hw_mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(dev, hw_mode);
+	if (!mode) {
+		drm_err(dev, "Failed to duplicate mode " DRM_MODE_FMT "\n",
+			DRM_MODE_ARG(hw_mode));
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
+EXPORT_SYMBOL(drm_connector_helper_get_modes_static);
+
 /**
  * drm_connector_helper_get_modes - Read EDID and update connector.
  * @connector: The connector
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c4c1be3ac0b8..855968fd46af 100644
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
+	return drm_connector_helper_get_modes_static(connector, epd->mode);
 }
 
 static const struct drm_connector_helper_funcs repaper_connector_hfuncs = {
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index a81f91814595..2d5b56c4a77d 100644
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
+	return drm_connector_helper_get_modes_static(connector, &sdev->mode);
 }
 
 static const struct drm_connector_helper_funcs simpledrm_connector_helper_funcs = {
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 8075e02aa865..5a883ee9fc32 100644
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
+int drm_connector_helper_get_modes_static(struct drm_connector *connector,
+					  const struct drm_display_mode *hw_mode);
 int drm_connector_helper_get_modes(struct drm_connector *connector);
 
 #endif
-- 
2.37.1

