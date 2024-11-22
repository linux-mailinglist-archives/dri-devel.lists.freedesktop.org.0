Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268989D62EB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C88110EC25;
	Fri, 22 Nov 2024 17:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="b/V3VaIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A94410EC29
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8B961C0007;
 Fri, 22 Nov 2024 17:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2Cs9qpfJO1PfS7zmjOUPi9+YIlOxOIeMEzIvqex6gU=;
 b=b/V3VaImSrJW0pVNGfJvr1BBRMhOoKGfRv0SteNv7sXK8USjvpZPIEX6da04JrIzRmSspz
 w8IY34Jhu3dQvp58m6OtqoFN+2/MNdZqGBu98/l7j+Z9kdUhPcZoByoN9OysmhMI0XodSj
 cpoerOitoRROSwgXqsB9SpSoBWEyPhdS5YSCKXVjfBOkjKjaMyoeJ2UCnOWzDJdekNSLix
 PPAOhuO5STfZakUc92c+95Pc+crnLsQh1CV1ilYwSsdcqEvxfdOcAuVRCLYt4yxKs7Qphf
 zrFFYxokogjTC4KVhFq0OXuyRuL0O8+OLO6cgZKM/OcO8YMVVAJLoJLCwthQ4g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:17 +0100
Subject: [PATCH RFC v2 13/18] drm/vkms: Introduce config for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-13-81540742535a@bootlin.com>
References: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
In-Reply-To: <20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10282;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+nK9sQyp8wTHyJ2qDPlxWn+0DFyKKAaVT/iiUejAtIw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1QUz0QhjkbR+jfIuCOLKCTz/NI2DdOH8esR
 oh+OJ3n9s+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9UAAKCRAgrS7GWxAs
 4sAGD/9qf1WZZmL8ct9G7d1QNLYFLfLqTgafs3fpzh0KnYRZbwJGdzj9qvQT1zk2YYe/ZIf0gt0
 9fU9j3uP1S3p+gr7Kxd+5Wq2bo6cLSAeIRjQ7+BXS32h6wVXMYtizXwFjBToB/J9DQVaHxuowY7
 GU/kIRng0WcnBUjpmfK/zPnNyFbj3Hgiy1FKaSKPdoq+YPIqYoqnvgcOU+OC8ktUpz3/RyhvZ7a
 pPbytjzCD8HAKulNoVLEvZfNE6PzpXPtSoJ/yxcG+bpj4K05lntV/aP2gZAlewLivKT2b6zct15
 zfFZX+y8h2mIt55DmDA9shnqexaRFaMjtZOT+MavjatsgQ3BLgjqmwlTU/I2WquiSaexM0k9VXX
 8sg5sbHt81a8Xd/L6/tw1LzNPuWp0GiccbHtKONK2tlzO33Iw7YpBnZpz6bL+/HH835/vIZto8J
 UOu6ERqyNInCUo4l1DQASa9jibBRUmOSOwdJrVyEI/DAIZ616nJYMHzXbTYupAhnAtVDNrQQyRj
 xz03Pp6dYdCWYC5BmA/MDbZBknv6b557hnDjy93QLS0nI/Uc4htHX9NH1H9ECRGzDefR2rL5cUt
 7NBSgZiU/HaNcNeeiHTFxTSIduFknyg8VpAkGsf5n7BuxQaMMH+ELkwg5KWNkeznqZ7kEV0Xidz
 BldfMz2Pxnyd3fg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 62 +++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h | 18 +++++++++--
 drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
 drivers/gpu/drm/vkms/vkms_output.c | 37 ++++++++++++-----------
 4 files changed, 98 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 3252f657ce515c0193a8c0e709bfe861feba0aca..998bdc50405116507e9cefd72a7b472c4c17e36d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -17,6 +17,7 @@ struct vkms_config *vkms_config_create(void)
 	INIT_LIST_HEAD(&config->planes);
 	INIT_LIST_HEAD(&config->crtcs);
 	INIT_LIST_HEAD(&config->encoders);
+	INIT_LIST_HEAD(&config->connectors);
 
 	return config;
 }
@@ -28,6 +29,7 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	struct vkms_config_plane *plane;
 	struct vkms_config_encoder *encoder;
 	struct vkms_config_crtc *crtc;
+	struct vkms_config_connector *connector;
 	struct vkms_config *vkms_config = vkms_config_create();
 
 	if (IS_ERR(vkms_config))
@@ -53,6 +55,12 @@ struct vkms_config *vkms_config_alloc_default(bool enable_writeback, bool enable
 	if (vkms_config_encoder_attach_crtc(encoder, crtc))
 		goto err_alloc;
 
+	connector = vkms_config_create_connector(vkms_config);
+	if (!connector)
+		goto err_alloc;
+	if (vkms_config_connector_attach_encoder(connector, encoder))
+		goto err_alloc;
+
 	plane = vkms_config_create_plane(vkms_config);
 	if (!plane)
 		goto err_alloc;
@@ -130,6 +138,23 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
 
+struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *vkms_config)
+{
+	if (!vkms_config)
+		return NULL;
+
+	struct vkms_config_connector *vkms_config_connector =
+		kzalloc(sizeof(*vkms_config_connector), GFP_KERNEL);
+
+	if (!vkms_config_connector)
+		return NULL;
+
+	list_add(&vkms_config_connector->link, &vkms_config->connectors);
+	xa_init_flags(&vkms_config_connector->possible_encoders, XA_FLAGS_ALLOC);
+
+	return vkms_config_connector;
+}
+
 struct vkms_config_crtc *vkms_config_create_crtc(struct vkms_config *vkms_config)
 {
 	if (!vkms_config)
@@ -227,6 +252,15 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
 	kfree(vkms_config_crtc);
 }
 
+void vkms_config_delete_connector(struct vkms_config_connector *vkms_config_conector)
+{
+	if (!vkms_config_conector)
+		return;
+	list_del(&vkms_config_conector->link);
+
+	kfree(vkms_config_conector);
+}
+
 void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 				struct vkms_config *vkms_config)
 {
@@ -247,6 +281,17 @@ void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 		}
 	}
 
+	struct vkms_config_connector *connector_config;
+
+	list_for_each_entry(connector_config, &vkms_config->connectors, link) {
+		unsigned long idx = 0;
+
+		xa_for_each(&connector_config->possible_encoders, idx, encoder) {
+			if (encoder == vkms_config_encoder)
+				xa_erase(&connector_config->possible_encoders, idx);
+		}
+	}
+
 	kfree(vkms_config_encoder->name);
 	kfree(vkms_config_encoder);
 }
@@ -256,7 +301,7 @@ void vkms_config_destroy(struct vkms_config *config)
 	struct vkms_config_plane *vkms_config_plane, *tmp_plane;
 	struct vkms_config_encoder *vkms_config_encoder, *tmp_encoder;
 	struct vkms_config_crtc *vkms_config_crtc, *tmp_crtc;
-
+	struct vkms_config_connector *vkms_config_connector, *tmp_connector;
 	list_for_each_entry_safe(vkms_config_plane, tmp_plane, &config->planes, link) {
 		vkms_config_delete_plane(vkms_config_plane, config);
 	}
@@ -266,6 +311,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(vkms_config_crtc, tmp_crtc, &config->crtcs, link) {
 		vkms_config_delete_crtc(vkms_config_crtc, config);
 	}
+	list_for_each_entry_safe(vkms_config_connector, tmp_connector, &config->connectors, link) {
+		vkms_config_delete_connector(vkms_config_connector);
+	}
 
 	kfree(config);
 }
@@ -315,6 +363,18 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkm
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_encoder_attach_crtc);
 
+int __must_check
+vkms_config_connector_attach_encoder(struct vkms_config_connector *vkms_config_connector,
+				     struct vkms_config_encoder *vkms_config_encoder)
+{
+	u32 encoder_idx;
+	int ret;
+
+	ret = xa_alloc(&vkms_config_connector->possible_encoders, &encoder_idx, vkms_config_encoder,
+		       xa_limit_32b, GFP_KERNEL);
+	return ret;
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_plane *config_plane;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 4a4c16dea7855cf36060986ef247be698974fafc..d64024e6682d217f7d9265f436ff2e6135860260 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -23,6 +23,7 @@ struct vkms_config {
 	struct list_head planes;
 	struct list_head crtcs;
 	struct list_head encoders;
+	struct list_head connectors;
 };
 
 /**
@@ -103,6 +104,15 @@ struct vkms_config_plane {
 	struct vkms_plane *plane;
 };
 
+struct vkms_config_connector {
+	struct list_head link;
+
+	struct xarray possible_encoders;
+
+	/* Internal usage */
+	struct drm_connector *connector;
+};
+
 /**
  * vkms_config_register_debugfs() - Register the debugfs file to display current configuration
  */
@@ -133,6 +143,8 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
  */
 struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config);
 
+struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *vkms_config);
+
 /**
  * vkms_config_create_crtc() - Create a crtc configuration
  *
@@ -153,7 +165,9 @@ int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *vkms_co
 					       struct vkms_config_crtc *vkms_config_crtc);
 int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkms_config_encoder,
 						 struct vkms_config_crtc *vkms_config_crtc);
-
+int __must_check
+vkms_config_connector_attach_encoder(struct vkms_config_connector *vkms_config_connector,
+				     struct vkms_config_encoder *vkms_config_encoder);
 /**
  * vkms_config_delete_plane() - Remove a plane configuration and frees its memory
  *
@@ -190,7 +204,7 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
  */
 void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 				struct vkms_config *vkms_config);
-
+void vkms_config_delete_connector(struct vkms_config_connector *vkms_config_conector);
 /**
  * vkms_config_alloc_default() - Allocate the configuration for the default device
  * @enable_writeback: Enable the writeback connector for this configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 61ae2986568093ab0df7174a0a4678a75f9aad0c..eb6fd570b4549639f6818ff63fb334f2a461b23d 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -185,7 +185,7 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = drm_vblank_init(&vkms_device->drm, list_count_nodes(&config->crtcs));
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_devres;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 6277ad72fdd476d1eff52ad037389bdb1a254f5e..90c0fa8eba53bef4ca80c374b40d69b0de155144 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -35,7 +35,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_config_plane *config_plane;
 	struct vkms_config_crtc *config_crtc;
-	struct drm_connector *connector;
+	struct vkms_config_connector *config_connector;
 	unsigned long idx;
 	int ret;
 
@@ -71,21 +71,6 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
-	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
-	if (!connector) {
-		DRM_ERROR("Failed to allocate connector\n");
-		return -ENOMEM;
-	}
-
-	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init connector\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
-
 	list_for_each_entry(config_encoder, &vkmsdev->config->encoders, link) {
 		config_encoder->encoder = drmm_kzalloc(dev, sizeof(*config_encoder->encoder),
 						       GFP_KERNEL);
@@ -97,14 +82,32 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			DRM_ERROR("Failed to init encoder\n");
 			return ret;
 		}
+
 		xa_for_each(&config_encoder->possible_crtcs, idx, config_crtc) {
 			config_encoder->encoder->possible_crtcs |= drm_crtc_mask(&config_crtc->crtc->base);
 		}
 		if (IS_ERR(config_encoder->encoder))
 			return PTR_ERR(config_encoder->encoder);
-		ret = drm_connector_attach_encoder(connector, config_encoder->encoder);
+	}
+
+	list_for_each_entry(config_connector, &vkmsdev->config->connectors, link) {
+		config_connector->connector = drmm_kzalloc(&vkmsdev->drm,
+							   sizeof(*config_connector->connector),
+							   GFP_KERNEL);
+		if (!config_connector->connector)
+			return -ENOMEM;
+		ret = drmm_connector_init(&vkmsdev->drm, config_connector->connector,
+					  &vkms_connector_funcs, DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 		if (ret)
 			return ret;
+		drm_connector_helper_add(config_connector->connector, &vkms_conn_helper_funcs);
+
+		xa_for_each(&config_connector->possible_encoders, idx, config_encoder) {
+			ret = drm_connector_attach_encoder(config_connector->connector,
+							   config_encoder->encoder);
+			if (ret)
+				return ret;
+		}
 	}
 
 	drm_mode_config_reset(dev);

-- 
2.47.0

