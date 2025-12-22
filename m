Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE2CD5801
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272210E60F;
	Mon, 22 Dec 2025 10:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ih/ozC0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF07710E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9B2A94E41D35;
 Mon, 22 Dec 2025 10:12:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7181F606C1;
 Mon, 22 Dec 2025 10:12:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4C1910AB01A3; Mon, 22 Dec 2025 11:12:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Kk3DFisA2S1uhDJWNKTPqbuCuU55HoSJ+RHftyHOqPw=;
 b=ih/ozC0HjamslOYxzGQgSFQg0oKZqLCosGsGHEAIvNXAQ6zW8auhCZKSTOlm6hSPHDJ64P
 oWwrLu23y0kgJPTOxVQIHHMZNrYZWiCh5r5+diTRETIL5+DQSK0hXJnPcRUkSNMTZfyTyo
 ET3bakxJe8pIOfetiNnXKQkid2vrhctkrw0bRN9gWNViJPMu7WdQjtnrtR0TsqiTI0A9l6
 Pmn531btJbgKXLj8+nGWVB8XJLkf4XlseCrayz/eXgDMVlI/WAXGHc2UTHYSTtp+cqd1bV
 4pdOWbqTV16VKYwUwiuNSd0tk0dpYl1vJHAQKLSRIDrJ/ZZxDRd3JdhQNj8uBg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:24 +0100
Subject: [PATCH v3 22/33] drm/vkms: Introduce config for connector type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-22-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6761;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=EOBH4iD1ljiTsBNfMWOz/Ca2Fgpv0a45jibbXua09dU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlCfvOyJFGBsvAiWCrcdMcu+ZgmEQgUFnRke
 qx/Q6KD86yJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIUlQ//ZcrG/XN/6vwbUN7GpeykDsvVCr8z9RM
 F3io9/QwAXbKCDd6Aq3ThBlWgrncNXAmXi5ml+6XL6qQi12G1qNf1D3kD7KXffvromwyhzatUhD
 Gy+FkVIv7G1wxmW1Cdonvbbmy8f6PLtXa5YmAqHFb3QLCJ22bMl7ezXmg82eBWBalY9ecghdQwZ
 5zS204OT/ou5TsUtMokUH+fzbSAFQSuJbi6S2MLSaqlj8JFZzWXCp4p7S1oyFDXxX6x9AiF26kh
 iitrwoZEiKwaa266vl9itysLhqqX+SDDaxrr+mLVmUH9yHfD73O1nfLUc5DWG8+uQqEY4DGzgBp
 KVMZ1Lme8D3F2yaqC+H2wX+T6+oly0GSNUYHHKxSL9BrnRLx/5YvddDK5VrmKehqqDwo1vb0Nts
 Ze03HNIeTPoS5J2wjXISdsfP0odabaCdfXXuHfzL+jlUwW5jwLEmbKNOyQnO2Eu0BYP+KV/EPq7
 PtM6oSKzirbZcmCpwGxqa4MzDyLnUmzzLV29IYHISCmRqa4V7AjlD9gVxi92cwuUs3RkMSfc0qq
 Cf+R0tqKf2IAVzX9MfWvXkgUsB8nONFvqPbMzSLySRq/RPgw0o3I8Fs3HE875XJwcq4lVUXq0N7
 egxmM/JmdZ7xaCWwTVGSKNOtkbkp/gjWNxistO6xNlKGgSgyf+eE=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to emulate connector-specific behavior, add connector type
configuration.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.c            |  3 +++
 drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  5 +++--
 drivers/gpu/drm/vkms/vkms_connector.h         |  4 +++-
 drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
 6 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 4a5899b8ccfd..1900cc79db2b 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -137,6 +137,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -211,6 +212,10 @@ static void vkms_config_test_default_config(struct kunit *test)
 
 	/* Connectors */
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
+	vkms_config_for_each_connector(config, connector_cfg) {
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
+				DRM_MODE_CONNECTOR_VIRTUAL);
+	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 415556952b6f..59ce55efb167 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -589,6 +589,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "connector:\n");
 		seq_printf(m, "\tstatus=%s\n",
 			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
 	}
 
 	return 0;
@@ -905,6 +907,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
+	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 9217097c0296..4a4058b407e7 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -129,6 +129,7 @@ struct vkms_config_encoder {
  * struct vkms_config_connector
  *
  * @link: Link to the others connector in vkms_config
+ * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
@@ -141,6 +142,7 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	int type;
 	enum drm_connector_status status;
 	struct xarray possible_encoders;
 
@@ -343,6 +345,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
 }
 
 /**
+ * vkms_config_connector_get_type() - Return the connector type
+ * @connector_cfg: Connector to get the type from
+ */
+static inline int
+vkms_config_connector_get_type(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->type;
+}
+
+/**
+ * vkms_config_connector_set_type() - Set the connector type
+ * @connector_cfg: Connector to set the type to
+ * @type: New connector type
+ */
+static inline void
+vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
+			       int type)
+{
+	connector_cfg->type = type;
+}
+
+/*
  * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
  * @plane_cfg: Plane to get the default rotation from
  *
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b0a6b212d3f4..5a87dc2d4c63 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -68,7 +68,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
@@ -79,7 +80,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 		return ERR_PTR(-ENOMEM);
 
 	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+				  vkms_config_connector_get_type(connector_cfg), NULL);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index ed312f4eff3a..33253d29b1cc 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -4,6 +4,7 @@
 #define _VKMS_CONNECTOR_H_
 
 #include "vkms_drv.h"
+#include "vkms_config.h"
 
 #define drm_connector_to_vkms_connector(target) \
 	container_of(target, struct vkms_connector, base)
@@ -24,7 +25,8 @@ struct vkms_connector {
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 86ce07a617f5..1288c8551bc8 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.51.2

