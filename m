Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA2C1B45B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5509810E7CC;
	Wed, 29 Oct 2025 14:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lzyL6J/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D9B891AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D524C1A174D;
 Wed, 29 Oct 2025 14:37:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB19B606E8;
 Wed, 29 Oct 2025 14:37:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81C54117F813D; Wed, 29 Oct 2025 15:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=z9Dd9IU6DX4wrDs84ZKPS92OQlwhgVAYGOu5dRcVDJU=;
 b=lzyL6J/rpydJo98TsRXgfxoYR3Core4zBppBXy5dQGgCtpAFLdNX2bMZIeytP9LxjFtcpq
 6YZSi0ZesEQ2CqSwHX44MzYRO6sywsAkhyBuFoAzL+NsOGuupn9Oacl8aMmn7VH1sHivCa
 HVJoHlyQ67om0Ysl/VbwtLN7AxHVM8Ek+foeJkun8HwZ5WvPmJbgH3vmgdWBpqpQkmeLn+
 BIfzrdEi8RwOSFpsI5FCn/PBcjQp5ozgKYqyK8rXdGC0T6U6zBzNBhgGoU2wJpHsANfGA4
 gwlFN21CwGCnoHn05oGF2tL9oAELHB4Umd825KHYf1LMcrNVRSwL15VzTd9GrA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:37:08 +0100
Subject: [PATCH RESEND v2 31/32] drm/vkms: Allow to hot-add connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251029-vkms-all-config-v2-31-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5808;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xrzdaraOFExxLukUGdDstkMZ2KqagA/b+HcZMmpJXPU=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ+QghrFilKMCZFYcpyamJr0m3kZTyYOOqm3
 1Bi8wtvk5SJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfgAKCRAgrS7GWxAs
 4rwcEADX8ko2qVQYN222//f88abW8+XGCX9zshE0H6hcocPra9HuorrVImCWM8cxentS8x0Ur8X
 RAAWJYgZZxxWqE8gaimxVIRND/IZIP8jD4nf5BjZPSZfWmXByoW1hFtzWDT03ROH8c2aR602rcn
 nF3BXWANtLLIck3zzyZjCWQVZUdtNCXNFHNtHE8zL14FWanByKMPol63laQzS26d94umOV9Dt/q
 4HKEgQaiTs+gpv3+32SRsbr7ujk+gHrAQpoOd9uoKKj/Dz4T7AFdQMPrjfdBltZIqyJVrEasXGo
 mT4nd2SqY5f6mDt6kcqnDiLpFOkW5JZEmdTVTLr6QwLvTxC1QsdqxhTCbEPeEJD4DvDIHpiaDSF
 EBwHxqtfTazIlmvFZ0smpXwWRa1Gk6ywt/T70q5Zk24qeuceVa0BJdXcJL5NYAgP8ZXk5gD2hoy
 BBeVLo9BPnNmOLQWyB5nVQ8X/nyyp+dsuKpmgNmdeb49yrK0shQVTWx01Ec4isVArELC2DZxqa6
 AUnzhxQ59ID4BEzAKxIM3jsJnjpgUvDX8s3XKUvU/0n6uA+55LYybkRF1UsaQzZTLXHubntgFlc
 Gv2HK61aNBCgvMqjhQvmZf3wlKAHYn/yIn+EZzy5hYaezrqYE/D88M1oWbDdP82ed5Cx1uwe1VB
 iqxsZGBwdzAduUw==
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
 drivers/gpu/drm/vkms/vkms_connector.c | 81 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h | 32 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_output.c    |  9 ++++
 3 files changed, 122 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 2c5f04af8784..bd0e368d5598 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -161,9 +161,90 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
 	return connector;
 }
 
+static void vkms_connector_dynamic_destroy(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct vkms_connector *vkms_connector;
+
+	drm_connector_cleanup(connector);
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+	drmm_kfree(dev, vkms_connector);
+}
+
+static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = vkms_connector_dynamic_destroy,
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
+	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
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
+	vkms_connector_init(vkmsdev, connector, connector_cfg);
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
index 85f9082c710e..f53e3f85c684 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -34,4 +34,36 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
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
index 44f8f53c9194..56c9c0b56151 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
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

