Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC30BA17C66
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7B10E56E;
	Tue, 21 Jan 2025 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lFRaJ9Om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30810E56A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CB5C4001C;
 Tue, 21 Jan 2025 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=du+BQI+l9q7ygbfpvfGPCKoCBhL48XqdxVvlgJEXA80=;
 b=lFRaJ9OmVqgzWR+TKy7yM+pSo8kANhNUvGxkuNojaaHdAJcD3+lAUXGIXwnLRlx25yTIf1
 9NJrXxeUT53c7olDlIL26XGLaEj9ly10nRM+l4tSkwte5nICzygUxuKKUqVXALv2XHE8rB
 niN7wMyBfY4YT8/+E/VsrRf1/bgukAIW0Br7qTSiz9wgYX9Rq7puAFVABP5o+PPHWoTNwa
 YVsd79mPhpcLMCtxRZ29KOS0E4KmIbJhbz0VMCkYp3YWkhaLNZDNxTYgvInt4xFAsSOjDL
 JFN7oiBTf2V8qPbqCGXcdosKMYrNF7dEmVZl8UyxfrgByF25qlLTRU4g+kaPLg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:35 +0100
Subject: [PATCH v3 11/16] drm/vkms: Introduce config for connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-11-cac00a3c3544@bootlin.com>
References: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
In-Reply-To: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10467;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Ec8VCg8FajLht2MC2ecamJeS/m6TZJ/YugMNGs3Cd4w=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30j0jvVviskv8VOH+Q307axMxuYyabot0AB2
 YyijR7PMryJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499IwAKCRAgrS7GWxAs
 4jPrEACm/H9Cqh6QXJPrs6l8M7k0PerzMmLj+TfGxRTMBnmlhI6ES3clRvQRT4AJATsPiPtu8x4
 fqkBSL0dBwG2tK72RsbowKE5pHbqGzu15BpHWg05P1lYOGL0ZUmbsyXDHL/qaWT1bo3lqm1+My8
 BaS1i2+htuyXII5/Y2nRHQ6OkxT1Rp4yO3dBDlWHjpogJbJECW9nF/4MN6ZrFwSs7XrKjCcJAuq
 UHmyi/gESce31sfHkqvoab2dP2Q07wc9N+GcCF3FJuzBT28dIBcCQNT6mDFgC1uEuZDlQ4/YKm/
 VWxnm9LkIgqsfrOPqmQf8eU7m+MC+0NNBXLg7X+RN1Jv5bGCoZzelWiqCbthFi8LPazN++Yk+JI
 jcpXv+KNva8jAHnEoNmf9T9QESq8GoTBJnt2wilBok3gXaq4wJ40lGBCkREE7gwlm39n/MEjFYH
 WXrB+ytfTyojJDSwp8SlLQtufNDvpCzyBMyXp4DUP8niKMvp5du12H+OZH1hpB/nNJUQWhQT12H
 dFlYpl9xuqbzEbgUqSi8kNtkG4YiMg2dXLa2+/Ce7AkzHQJzTaLWRtE1D9KBUqGNiWnFtzY17Rz
 yZSBQ22d/ZBTeJc3KNbtuKtOIMsKgIZ6MtuwTT+lWMBMvgwN0ZSRA67FA+fEeTT2tBV/CTrvLK1
 0CqLIGUWsgvqhng==
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

The current vkms driver only allows the usage of one connector,
possibly with a writeback connector. This new configuration structure aims
to make the configuration more flexible.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 62 +++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_config.h | 18 +++++++++--
 drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
 drivers/gpu/drm/vkms/vkms_output.c | 37 ++++++++++++-----------
 4 files changed, 98 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index b610d37b675efaea7ca717f08e525beaf18d8d9e..f1f02c66755f9660b48dfa5cb786afa1e6ae553b 100644
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
@@ -123,6 +131,23 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
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
@@ -220,6 +245,15 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
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
@@ -240,6 +274,17 @@ void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
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
@@ -249,7 +294,7 @@ void vkms_config_destroy(struct vkms_config *config)
 	struct vkms_config_plane *vkms_config_plane, *tmp_plane;
 	struct vkms_config_encoder *vkms_config_encoder, *tmp_encoder;
 	struct vkms_config_crtc *vkms_config_crtc, *tmp_crtc;
-
+	struct vkms_config_connector *vkms_config_connector, *tmp_connector;
 	list_for_each_entry_safe(vkms_config_plane, tmp_plane, &config->planes, link) {
 		vkms_config_delete_plane(vkms_config_plane, config);
 	}
@@ -259,6 +304,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(vkms_config_crtc, tmp_crtc, &config->crtcs, link) {
 		vkms_config_delete_crtc(vkms_config_crtc, config);
 	}
+	list_for_each_entry_safe(vkms_config_connector, tmp_connector, &config->connectors, link) {
+		vkms_config_delete_connector(vkms_config_connector);
+	}
 
 	kfree(config);
 }
@@ -308,6 +356,18 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkm
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
index efe984113fb664ff38a68b3be90063c366bb2892..584d015d6b8f420d82b2cfe38c991e93ad8288f3 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -23,6 +23,7 @@ struct vkms_config {
 	struct list_head planes;
 	struct list_head crtcs;
 	struct list_head encoders;
+	struct list_head connectors;
 };
 
 /**
@@ -95,6 +96,15 @@ struct vkms_config_plane {
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
@@ -125,6 +135,8 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
  */
 struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config);
 
+struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *vkms_config);
+
 /**
  * vkms_config_create_crtc() - Create a crtc configuration
  *
@@ -145,7 +157,9 @@ int __must_check vkms_config_plane_attach_crtc(struct vkms_config_plane *vkms_co
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
@@ -182,7 +196,7 @@ void vkms_config_delete_crtc(struct vkms_config_crtc *vkms_config_crtc,
  */
 void vkms_config_delete_encoder(struct vkms_config_encoder *vkms_config_encoder,
 				struct vkms_config *vkms_config);
-
+void vkms_config_delete_connector(struct vkms_config_connector *vkms_config_conector);
 /**
  * vkms_config_alloc_default() - Allocate the configuration for the default device
  * @enable_writeback: Enable the writeback connector for this configuration
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 4440549c3084a341d03ec66119ba7998012bd662..95fde2fbd711fe52a3a3b5a55778f5bc2029beb7 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -183,7 +183,7 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = drm_vblank_init(&vkms_device->drm, list_count_nodes(&config->crtcs));
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_devres;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index fd641fa750f20b1a95994acc2778a74942125fd9..146ce254a027c662ae275dd2ec0024a46fa8119d 100644
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
 			config_encoder->encoder->possible_crtcs |= drm_crtc_mask(&config_crtc->output->crtc);
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
2.47.1

