Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272EBEC46E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95310ECED;
	Sat, 18 Oct 2025 02:02:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1S1NU44p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CA510ECEE
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id AAFFD1A14AB;
 Sat, 18 Oct 2025 02:02:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7B3FB60701;
 Sat, 18 Oct 2025 02:02:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE74B102F236C; 
 Sat, 18 Oct 2025 04:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ta6irOMcEcp1YBicQLuCCFuYYSODKhAhGoGBn99PT74=;
 b=1S1NU44pxqunPlUcrTsYORW3h+j1VEvyDMgSt4q+J8xlMskItpb/iHfdEz9m+D/H7sdb/o
 euKh/SpNhdmaE5cyNEuKObrLvgKQjrk3vBxD566Uyqmil0gSLVDzlVJA0g+SiHApiR8k68
 lf3KEpAls/WqAXHYmiIYVajK3tBCpoAoxRQs3Cszqbwr0csrIpjN0iujyvgqrRKyb4L/5v
 Dvsbc25NgAs4Wbs5yMFgVGTtRw9mae2AK8xNTdmu+I990rLKF1g44p9ug0deVXKwbpBFpG
 Np0Y83ksd218r1PPKmaTYb4jSZwoedrpwxR0GMlqKNgwd+o+BA7qi9tGeZxAPA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:21 +0200
Subject: [PATCH 21/22] drm/vkms: Allow to hot-add connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251018-vkms-all-config-v1-21-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6113;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=n/TUWMmpq4dd0zrl97U7Cy/fzIJ7zW/B559BiiwA9cc=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT/Dx6boJfYf+1K3S1vAkYUMR23xQgAzYfsV
 fLBlYs8QuaJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/wAKCRAgrS7GWxAs
 4nYlD/9JnMB0cqhbJMmUVgQ94B2IpRyWVixk8/yWS1mZwWE37KRpkmqzDUBgaNLDhfJBpq2q/BL
 dSW9WaiIFRROFNeVAqeWrStkyPw2thaB/SE/3DYxmP37asUOUOD0k38vGUqNT+SpLkx4L5f9oyw
 r6fB4mVVxMChtrMtaSZLca+rB0u5zDdoQwx8bhTBZGE57RlhQsSgF6wLLTog2NN92eGEuBVDDRy
 uNbviAd+hcq+wQr7m8UI8kBgfvJA16PnxWm7muELnP3dAhtetIoyRqmz4wmADfc0EZP7RfjazW0
 LuUJP/7cG77AXHaiuwxhbyj1iEg3b/vu3vvc85OrC0O6l8En9XLmqKy6+nyjzFL/LdwR0oWBq8g
 xLNRYdzy0SfCRkMmUN+keMPrLvCc6K+Ri4YdDnhA3CWNaMXLSauzznQC1++zVyCJPaa5yYhKzqc
 fB/zBpKupor6554e/zX60O/3n2zcUlVMTvlkh6QF7LI0nWWAkIWBKt34m5qkDO83eh7aNvc0B1j
 REnpgL/UAqy08HiEhVPswYWYKztkQJgp9hmKEGe3gzMaefbL890rqJ0irl4ev4M2SMmob32VGz5
 ++82Ob8N4bF6m+3ULLy+RrxnFhbBwWHsD+D7JJuDCw2PymiSxHTJMEBiDObAlGP4UKEaEEMDBul
 llwDNrQrg1FmOQg==
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

In order to allow creating dynamic connector, add the required
infrastructure in vkms_connector.

Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
[Louis Chauvet: use drm_atomic_helper_connector_reset instead of
drm_mode_config_reset because connector is not yet registered]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 69 ++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_connector.h | 33 +++++++++++++++++
 drivers/gpu/drm/vkms/vkms_output.c    | 11 +++++-
 3 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 339d747e729e..77a544728721 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0+
-
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
@@ -144,9 +143,77 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 	return connector;
 }
 
+static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = drm_connector_cleanup,
+	.detect = vkms_connector_detect,
+};
+
 void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 
 	drm_kms_helper_hotplug_event(dev);
 }
+
+struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
+					      struct vkms_config_connector *connector_cfg)
+{
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_connector *connector;
+	int ret;
+	unsigned long idx = 0;
+
+	connector = kzalloc(sizeof(*connector), GFP_KERNEL);
+	if (IS_ERR(connector))
+		return connector;
+	ret = drm_connector_dynamic_init(&vkmsdev->drm,
+					 &connector->base,
+					 &vkms_dynamic_connector_funcs,
+					 connector_cfg->type,
+					 NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, encoder_cfg) {
+		ret = drm_connector_attach_encoder(&connector->base,
+						   encoder_cfg->encoder);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	drm_atomic_helper_connector_reset(&connector->base);
+
+	ret = drm_connector_dynamic_register(&connector->base);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return connector;
+}
+
+void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
+			       struct vkms_connector *connector)
+{
+	drm_connector_unregister(&connector->base);
+	drm_mode_config_reset(&vkmsdev->drm);
+	drm_connector_put(&connector->base);
+}
+
+int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
+				      struct vkms_connector *connector,
+				      struct drm_encoder *encoder)
+{
+	int ret;
+
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(&vkmsdev->drm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index a124c5403697..224950c13a93 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -7,6 +7,7 @@
 
 #define drm_connector_to_vkms_connector(target) \
 	container_of(target, struct vkms_connector, base)
+struct vkms_config_connector;
 
 /**
  * struct vkms_connector - VKMS custom type wrapping around the DRM connector
@@ -33,4 +34,36 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
  */
 void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
 
+/**
+ * vkms_connector_hot_add() - Create a connector after the device is created
+ * @vkmsdev: Device to hot-add the connector to
+ * @connector_cfg: Connector's configuration
+ *
+ * Returns:
+ * The connector or an error on failure.
+ */
+struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
+					      struct vkms_config_connector *connector_cfg);
+
+/**
+ * vkms_connector_hot_remove() - Remove a connector after a device is created
+ * @connector: The connector to hot-remove
+ */
+void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
+			       struct vkms_connector *connector);
+
+/**
+ * vkms_connector_hot_attach_encoder() - Attach a connector to a encoder after
+ * the device is created.
+ * @vkmsdev: Device containing the connector and the encoder
+ * @connector: Connector to attach to @encoder
+ * @encoder: Target encoder
+ *
+ * Returns:
+ * 0 on success or an error on failure.
+ */
+int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
+				      struct vkms_connector *connector,
+				      struct drm_encoder *encoder);
+
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 217f054d9598..aba2f9ab243d 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -92,7 +92,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+	vkms_config_for_each_connector_static(vkmsdev->config, connector_cfg) {
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
@@ -116,5 +116,14 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_mode_config_reset(dev);
 
+	vkms_config_for_each_connector_dynamic(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->enabled) {
+			connector_cfg->connector = vkms_connector_hot_add(vkmsdev, connector_cfg);
+
+			if (IS_ERR(connector_cfg->connector))
+				return PTR_ERR(connector_cfg->connector);
+		}
+	}
+
 	return 0;
 }

-- 
2.51.0

