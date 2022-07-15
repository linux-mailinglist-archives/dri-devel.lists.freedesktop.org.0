Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB7C575E6F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 11:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE3B11BCFD;
	Fri, 15 Jul 2022 09:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036F111BCFD
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 09:25:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r127-20020a1c4485000000b003a2fb7c1274so371495wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 02:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0y+RYDzrC7BoLfR/XRnKx9SMXds+VC3HVCJ6LoOl6Y=;
 b=Qm4XwUJUENq9vRCXlo8fO9Wyue/h3z9hatK/IzT/eH3jIY3TKZ1vnLFbkov9QREoi7
 G6hnyQrVVoHZubaFLmKyPFDNQSv8f1RmnlxOpXkr4m/oNTl4xDl2fcDeD3pK993cNfHs
 3L65CD7oY/WWo3PbltE/ToUCx6fYPa+KxExKAyUSeo4thChgS+T5o8aP1S7Tp18upCyg
 jJLwSfL7RqkLFhQD3n1Q4CzqTsS4bMohLzM+ICrb8DhEfyhJaAUqpqjLQf48UeTIWYd5
 MTp35PfJ7jagsSCZQxraqTALda8PIc7b4c1s7Ke/TV96dJpLe3FfUykgfbANECZCYt41
 yLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0y+RYDzrC7BoLfR/XRnKx9SMXds+VC3HVCJ6LoOl6Y=;
 b=ereMv5ztfJEaAMVxLE1mpo2yC8XeXsUQrE1ksyVkicqU2xGcHrEF3iR98YIj9FQno0
 o/+Dc1D/PmceLTQMznr08QKOvJw/0KAx881kSdw4OBSYqAOAvpqCoT70pmkRLKT3wiR/
 XTKXeFVWouplMOIXAL83FnCbJipP4jvujOC2mYfQ8FFbWDOEaO8pEI8c5f0Eo+8MPAue
 CQ0+YXvoWpLO3bhPNVaoeJhB4RRgQR/S21udlkclbR9J8+ySIH/ikyvBb2pvSoTT+3+T
 6GApRQcJrMhkCVKFIbKegNY+xsfNprPQwfEYqfNC840J1rGuWLmCCdiqZNUogQS26+QS
 4uIQ==
X-Gm-Message-State: AJIora/Zyh9zJMzM7VCxcoxTB0y89+xAlRpOKAyKlMetAwYiTA8H7gTj
 3Zkt7zBirOCZSfb3xEY+SXo=
X-Google-Smtp-Source: AGRyM1tes+4w88G0BzlLtB6RS28Z4FOHt4PbZRq3K7Ra0+XzDP21YSiVSPzBnt6xJw9no1S+g0LhSA==
X-Received: by 2002:a05:600c:4e07:b0:3a1:8548:4dd7 with SMTP id
 b7-20020a05600c4e0700b003a185484dd7mr19742072wmq.170.1657877106323; 
 Fri, 15 Jul 2022 02:25:06 -0700 (PDT)
Received: from fedora.. ([2a01:e0a:1d2:1f90:be95:f3a2:4d99:a3b3])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1c2104000000b00397402ae674sm8233102wmh.11.2022.07.15.02.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 02:25:05 -0700 (PDT)
From: Matthieu CHARETTE <matthieu.charette@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, andrealmeid@igalia.com
Subject: [PATCH] drm: Fix EDID firmware load on resume
Date: Fri, 15 Jul 2022 11:22:53 +0200
Message-Id: <20220715092253.17529-1-matthieu.charette@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <N512FR.B1R49X9JM9FW2@gmail.com>
References: <N512FR.B1R49X9JM9FW2@gmail.com>
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
Cc: Matthieu CHARETTE <matthieu.charette@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loading an EDID using drm.edid_firmware parameter makes resume to fail
after firmware cache is being cleaned. This is because edid_load() use a
temporary device to request the firmware. This cause the EDID firmware
not to be cached from suspend. And, requesting the EDID firmware return
an error during resume.
So the request_firmware() call should use a permanent device for each
connector. Also, we should cache the EDID even if no monitor is
connected, in case it's plugged while suspended.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2061
Signed-off-by: Matthieu CHARETTE <matthieu.charette@gmail.com>
---
 drivers/gpu/drm/drm_connector.c |  9 ++++
 drivers/gpu/drm/drm_edid_load.c | 81 ++++++++++++++++++++++++++++-----
 include/drm/drm_connector.h     | 12 +++++
 include/drm/drm_edid.h          |  3 ++
 4 files changed, 94 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..e8819ebf1c4b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -31,6 +31,7 @@
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
 
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 
 #include "drm_crtc_internal.h"
@@ -289,6 +290,9 @@ int drm_connector_init(struct drm_device *dev,
 
 	drm_connector_get_cmdline_mode(connector);
 
+	connector->edid_load_pdev = NULL;
+	drm_cache_edid_firmware(connector);
+
 	/* We should add connectors at the end to avoid upsetting the connector
 	 * index too much.
 	 */
@@ -473,6 +477,11 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->tile_group = NULL;
 	}
 
+	if (connector->edid_load_pdev) {
+		platform_device_unregister(connector->edid_load_pdev);
+		connector->edid_load_pdev = NULL;
+	}
+
 	list_for_each_entry_safe(mode, t, &connector->probed_modes, head)
 		drm_mode_remove(connector, mode);
 
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 37d8ba3ddb46..5a82be9917ec 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -167,6 +167,19 @@ static int edid_size(const u8 *edid, int data_size)
 	return (edid[0x7e] + 1) * EDID_LENGTH;
 }
 
+static struct platform_device *edid_pdev(const char *connector_name)
+{
+	struct platform_device *pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
+
+	if (IS_ERR(pdev)) {
+		DRM_ERROR("Failed to register EDID firmware platform device "
+			"for connector \"%s\"\n", connector_name);
+		return ERR_CAST(pdev);
+	}
+
+	return pdev;
+}
+
 static void *edid_load(struct drm_connector *connector, const char *name,
 			const char *connector_name)
 {
@@ -182,18 +195,17 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 		fwdata = generic_edid[builtin];
 		fwsize = sizeof(generic_edid[builtin]);
 	} else {
-		struct platform_device *pdev;
+		struct platform_device *pdev = connector->edid_load_pdev;
 		int err;
 
-		pdev = platform_device_register_simple(connector_name, -1, NULL, 0);
-		if (IS_ERR(pdev)) {
-			DRM_ERROR("Failed to register EDID firmware platform device "
-				  "for connector \"%s\"\n", connector_name);
-			return ERR_CAST(pdev);
+		if (WARN_ON(!pdev)) {
+			pdev = edid_pdev(connector_name);
+			if (IS_ERR(pdev))
+				return ERR_CAST(pdev);
+			connector->edid_load_pdev = pdev;
 		}
 
 		err = request_firmware(&fw, name, &pdev->dev);
-		platform_device_unregister(pdev);
 		if (err) {
 			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
 				  name, err);
@@ -263,11 +275,9 @@ static void *edid_load(struct drm_connector *connector, const char *name,
 	return edid;
 }
 
-struct edid *drm_load_edid_firmware(struct drm_connector *connector)
+static char *edid_name(const char *connector_name)
 {
-	const char *connector_name = connector->name;
 	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
-	struct edid *edid;
 
 	if (edid_firmware[0] == '\0')
 		return ERR_PTR(-ENOENT);
@@ -310,8 +320,57 @@ struct edid *drm_load_edid_firmware(struct drm_connector *connector)
 	if (*last == '\n')
 		*last = '\0';
 
-	edid = edid_load(connector, edidname, connector_name);
+	edidname = kstrdup(edidname, GFP_KERNEL);
+	if (!edidname) {
+		kfree(fwstr);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	kfree(fwstr);
+	return edidname;
+}
+
+void drm_cache_edid_firmware(struct drm_connector *connector)
+{
+	const char *connector_name = connector->name;
+	const char *edidname = edid_name(connector_name);
+	struct platform_device *pdev;
+	int err;
+
+	if (IS_ERR(edidname))
+		return;
+
+	if (match_string(generic_edid_name, GENERIC_EDIDS, edidname) >= 0) {
+		kfree(edidname);
+		return;
+	}
+
+	pdev = edid_pdev(connector_name);
+	if (IS_ERR(pdev)) {
+		kfree(edidname);
+		return;
+	}
+	connector->edid_load_pdev = pdev;
+
+	err = firmware_request_cache(&pdev->dev, edidname);
+	if (err)
+		DRM_ERROR("Requesting EDID firmware cache \"%s\" failed (err=%d)\n",
+			edidname, err);
+
+	kfree(edidname);
+}
+
+struct edid *drm_load_edid_firmware(struct drm_connector *connector)
+{
+	const char *connector_name = connector->name;
+	const char *edidname = edid_name(connector_name);
+	struct edid *edid;
+
+	if (IS_ERR(edidname))
+		return ERR_CAST(edidname);
+
+	edid = edid_load(connector, edidname, connector_name);
+	kfree(edidname);
 
 	return edid;
 }
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 3ac4bf87f257..47c84741517e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1573,6 +1573,18 @@ struct drm_connector {
 	 */
 	struct i2c_adapter *ddc;
 
+	/**
+	 * @edid_load_pdev: Platform device for loading EDID via firmware.
+	 *
+	 * The platform device is registered in drm_connector_init() in case a
+	 * custom EDID firmware is used with `edid_firmware` parameter. Otherwise,
+	 * it is set to NULL.
+	 *
+	 * Platform device is unregistered in drm_connector_cleanup() if it
+	 * is not NULL.
+	 */
+	struct platform_device *edid_load_pdev;
+
 	/**
 	 * @null_edid_counter: track sinks that give us all zeros for the EDID.
 	 * Needed to workaround some HW bugs where we get all 0s
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b2756753370b..b54cea3f1107 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -378,10 +378,13 @@ int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
+void drm_cache_edid_firmware(struct drm_connector *connector);
 struct edid *drm_load_edid_firmware(struct drm_connector *connector);
 int __drm_set_edid_firmware_path(const char *path);
 int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
 #else
+static inline void
+drm_cache_edid_firmware(struct drm_connector *connector);
 static inline struct edid *
 drm_load_edid_firmware(struct drm_connector *connector)
 {
-- 
2.36.1

