Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D678069A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C5110E495;
	Fri, 18 Aug 2023 07:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D4310E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 07:51:43 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bdc19b782aso4843655ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 00:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692345103; x=1692949903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abKrDzA4KlWdhSmEtZVAnsZR4Ek4Tgku0r5p0wKMZAw=;
 b=bMPEgTsB9NpdHdM7AVIM+SNj3Brln2L/dLPu9WT8LdGMhbPReatFqjvB+lmPJRzbN5
 DqjfGnkPb4/aozse5bZazNRn00+QnLc/DP4VWiDVRgNpcpgOwJX9hxt6Ck8TQjzaj5py
 RFOvYJ36lhnRl5zuhiwlmxeJoBWGyJSqkwOEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692345103; x=1692949903;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=abKrDzA4KlWdhSmEtZVAnsZR4Ek4Tgku0r5p0wKMZAw=;
 b=IstyxWeXZrbL4ODuHTXLJX/ajtrT1oT3u1N3X8lyNHyAepI2GPX4kzSQZtt/Rj9VGd
 2Ik41T7QbHxkPCNSua1699Lt2GphCepY7DfZBK7FDotMs+E1aGV6UDjE6tRcDSOQEqk3
 VeV6VvOsn59R6TGgPGk7b6UEu6ZngwC6d2vpV7tsZ7IGz7zswOMhmvaFu0bhAi9Mbz9P
 AnptotrqaZLzKW7J0LCFddgQuqBWaMjrVBnkxgmPvpITzeQDWTXMP9PzN2SC7hs3jJGE
 YKDWAe3HrmfEB1OUSCPWs5WqYWpbmBvbq6NqcT7QWugn8otDslPZD9IZ0kCOQEW122bx
 E0ZQ==
X-Gm-Message-State: AOJu0YwJ5s1zevgylUdvgxvlRg3u8EjmInUpMppx4cuOMH7qzM6ClAmb
 ZlTkpdgCzGU2JH/STBdLTnND2g==
X-Google-Smtp-Source: AGHT+IH77nHgklrbLj7CJ3yxY86OG/aPYuDJnKqRPfZ6aLf2zabRTphQ+IaXPR6yaFjvr37yy5KkLA==
X-Received: by 2002:a17:902:c945:b0:1bb:91f2:bb3e with SMTP id
 i5-20020a170902c94500b001bb91f2bb3emr2156751pla.49.1692345102804; 
 Fri, 18 Aug 2023 00:51:42 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 jj19-20020a170903049300b001ba066c589dsm1051834plb.137.2023.08.18.00.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 00:51:42 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	jshargo@chromium.org
Subject: [PATCH v3 5/7] drm/vkms: Support enabling ConfigFS devices
Date: Fri, 18 Aug 2023 07:43:10 +0000
Message-ID: <20230818075057.3426088-6-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230818075057.3426088-1-brpol@chromium.org>
References: <20230818075057.3426088-1-brpol@chromium.org>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jim Shargo <jshargo@chromium.org>

VKMS now supports creating and using virtual devices!

In addition to the enabling logic, this commit also prevents users from
adding new objects once a card is registered.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
Signed-off-by: Brandon Pollack <brpol@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_configfs.c |  37 +++--
 drivers/gpu/drm/vkms/vkms_crtc.c     |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.c      |   1 +
 drivers/gpu/drm/vkms/vkms_drv.h      |   2 +-
 drivers/gpu/drm/vkms/vkms_output.c   | 208 ++++++++++++++++++++++-----
 5 files changed, 204 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 72723427a1ac..d9c48ab3d760 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -509,29 +509,40 @@ static ssize_t device_enabled_store(struct config_item *item, const char *buf,
 {
 	struct vkms_configfs *configfs = item_to_configfs(item);
 	struct vkms_device *device;
-	int value, ret;
+	int enabled, ret;
 
-	ret = kstrtoint(buf, 0, &value);
+	ret = kstrtoint(buf, 0, &enabled);
 	if (ret)
 		return ret;
 
-	if (value != 1)
-		return -EINVAL;
-
-	mutex_lock(&configfs->lock);
-
-	if (configfs->vkms_device) {
+	if (enabled == 0) {
+		mutex_lock(&configfs->lock);
+		if (configfs->vkms_device) {
+			vkms_remove_device(configfs->vkms_device);
+			configfs->vkms_device = NULL;
+		}
 		mutex_unlock(&configfs->lock);
+
 		return len;
 	}
 
-	device = vkms_add_device(configfs);
-	mutex_unlock(&configfs->lock);
+	if (enabled == 1) {
+		mutex_lock(&configfs->lock);
+		if (!configfs->vkms_device) {
+			device = vkms_add_device(configfs);
+			if (IS_ERR(device)) {
+				mutex_unlock(&configfs->lock);
+				return -PTR_ERR(device);
+			}
+
+			configfs->vkms_device = device;
+		}
+		mutex_unlock(&configfs->lock);
 
-	if (IS_ERR(device))
-		return -PTR_ERR(device);
+		return len;
+	}
 
-	return len;
+	return -EINVAL;
 }
 
 CONFIGFS_ATTR(device_, enabled);
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index f10a5ec8111d..a9ed02eea1e4 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -280,7 +280,7 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 
 struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
-				 struct drm_plane *cursor)
+				 struct drm_plane *cursor, const char *name)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_crtc *vkms_crtc;
@@ -292,7 +292,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 	vkms_crtc = &vkmsdev->output.crtcs[vkmsdev->output.num_crtcs++];
 
 	ret = drmm_crtc_init_with_planes(dev, &vkms_crtc->base, primary, cursor,
-					 &vkms_crtc_funcs, NULL);
+					 &vkms_crtc_funcs, name);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
 		goto out_error;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 819e880a8cf7..6e7f20681890 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -275,6 +275,7 @@ struct vkms_device *vkms_add_device(struct vkms_configfs *configfs)
 			dev, &vkms_platform_driver.driver))) {
 		pdev = to_platform_device(dev);
 		max_id = max(max_id, pdev->id);
+		put_device(dev);
 	}
 
 	pdev = platform_device_register_data(NULL, DRIVER_NAME, max_id + 1,
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8cdd7949f661..9f1465b06055 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -250,7 +250,7 @@ void vkms_remove_device(struct vkms_device *vkms_device);
 /* CRTC */
 struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
-				 struct drm_plane *cursor);
+				 struct drm_plane *cursor, const char *name);
 
 int vkms_output_init(struct vkms_device *vkmsdev);
 int vkms_output_init_default(struct vkms_device *vkmsdev);
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index dc69959c5e1d..512f147d41b8 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -2,8 +2,10 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -82,7 +84,6 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
 
 int vkms_output_init_default(struct vkms_device *vkmsdev)
 {
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
@@ -100,27 +101,23 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
 			struct vkms_plane *overlay = vkms_plane_init(
 				vkmsdev, DRM_PLANE_TYPE_OVERLAY);
-			if (IS_ERR(overlay)) {
-				ret = PTR_ERR(overlay);
-				goto err_planes;
-			}
+			if (IS_ERR(overlay))
+				return PTR_ERR(overlay);
 		}
 	}
 
 	if (vkmsdev->config.cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
-		if (IS_ERR(cursor)) {
-			ret = PTR_ERR(cursor);
-			goto err_planes;
-		}
+		if (IS_ERR(cursor))
+			return PTR_ERR(cursor);
 	}
 
 	vkms_crtc = vkms_crtc_init(vkmsdev, &primary->base,
-				   cursor ? &cursor->base : NULL);
+				   cursor ? &cursor->base : NULL,
+				   "crtc-default");
 	if (IS_ERR(vkms_crtc)) {
 		DRM_ERROR("Failed to init crtc\n");
-		ret = PTR_ERR(vkms_crtc);
-		goto err_planes;
+		return PTR_ERR(vkms_crtc);
 	}
 
 	for (int i = 0; i < vkmsdev->output.num_planes; i++) {
@@ -131,22 +128,20 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 	connector = vkms_connector_init(vkmsdev);
 	if (IS_ERR(connector)) {
 		DRM_ERROR("Failed to init connector\n");
-		ret = PTR_ERR(connector);
-		goto err_connector;
+		return PTR_ERR(connector);
 	}
 
 	encoder = vkms_encoder_init(vkmsdev);
 	if (IS_ERR(encoder)) {
 		DRM_ERROR("Failed to init encoder\n");
-		ret = PTR_ERR(encoder);
-		goto err_encoder;
+		return PTR_ERR(encoder);
 	}
 	encoder->possible_crtcs |= drm_crtc_mask(&vkms_crtc->base);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
+		return ret;
 	}
 
 	if (vkmsdev->config.writeback) {
@@ -158,26 +153,175 @@ int vkms_output_init_default(struct vkms_device *vkmsdev)
 	drm_mode_config_reset(dev);
 
 	return 0;
+}
+
+static bool is_object_linked(struct vkms_config_links *links, unsigned long idx)
+{
+	return links->linked_object_bitmap & (1 << idx);
+}
+
+int vkms_output_init(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_configfs *configfs = vkmsdev->configfs;
+	struct vkms_output *output = &vkmsdev->output;
+	struct plane_map {
+		struct vkms_config_plane *config_plane;
+		struct vkms_plane *plane;
+	} plane_map[VKMS_MAX_PLANES] = { 0 };
+	struct encoder_map {
+		struct vkms_config_encoder *config_encoder;
+		struct drm_encoder *encoder;
+	} encoder_map[VKMS_MAX_OUTPUT_OBJECTS] = { 0 };
+	struct config_item *item;
+	int map_idx = 0;
+
+	list_for_each_entry(item, &configfs->planes_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_plane *config_plane =
+			item_to_config_plane(item);
+		struct vkms_plane *plane =
+			vkms_plane_init(vkmsdev, config_plane->type);
+
+		if (IS_ERR(plane)) {
+			DRM_ERROR("Unable to init plane from config: %s",
+				  item->ci_name);
+			return PTR_ERR(plane);
+		}
 
-err_attach:
-	drm_encoder_cleanup(encoder);
+		plane_map[map_idx].config_plane = config_plane;
+		plane_map[map_idx].plane = plane;
+		map_idx += 1;
+	}
 
-err_encoder:
-	drm_connector_cleanup(connector);
+	map_idx = 0;
+	list_for_each_entry(item, &configfs->encoders_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_encoder *config_encoder =
+			item_to_config_encoder(item);
+		struct drm_encoder *encoder = vkms_encoder_init(vkmsdev);
+
+		if (IS_ERR(encoder)) {
+			DRM_ERROR("Failed to init config encoder: %s",
+				  item->ci_name);
+			return PTR_ERR(encoder);
+		}
+		encoder_map[map_idx].config_encoder = config_encoder;
+		encoder_map[map_idx].encoder = encoder;
+		map_idx += 1;
+	}
 
-err_connector:
-	drm_crtc_cleanup(&vkms_crtc->base);
+	list_for_each_entry(item, &configfs->connectors_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_connector *config_connector =
+			item_to_config_connector(item);
+		struct drm_connector *connector = vkms_connector_init(vkmsdev);
 
-err_planes:
-	for (int i = 0; i < output->num_planes; i++)
-		drm_plane_cleanup(&output->planes[i].base);
+		if (IS_ERR(connector)) {
+			DRM_ERROR("Failed to init connector from config: %s",
+				  item->ci_name);
+			return PTR_ERR(connector);
+		}
 
-	memset(output, 0, sizeof(*output));
+		for (int j = 0; j < output->num_encoders; j++) {
+			struct encoder_map *encoder = &encoder_map[j];
 
-	return ret;
-}
+			if (is_object_linked(
+				    &config_connector->possible_encoders,
+				    encoder->config_encoder
+					    ->encoder_config_idx)) {
+				drm_connector_attach_encoder(connector,
+							     encoder->encoder);
+			}
+		}
+	}
 
-int vkms_output_init(struct vkms_device *vkmsdev)
-{
-	return -EOPNOTSUPP;
+	list_for_each_entry(item, &configfs->crtcs_group.cg_children,
+			    ci_entry) {
+		struct vkms_config_crtc *config_crtc =
+			item_to_config_crtc(item);
+		struct vkms_crtc *vkms_crtc;
+		struct drm_plane *primary = NULL, *cursor = NULL;
+
+		for (int j = 0; j < output->num_planes; j++) {
+			struct plane_map *plane_entry = &plane_map[j];
+			struct drm_plane *plane = &plane_entry->plane->base;
+
+			if (!is_object_linked(
+				    &plane_entry->config_plane->possible_crtcs,
+				    config_crtc->crtc_config_idx)) {
+				continue;
+			}
+
+			if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
+				if (primary) {
+					DRM_WARN(
+						"Too many primary planes found for crtc %s.",
+						item->ci_name);
+					return -EINVAL;
+				}
+				primary = plane;
+			} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
+				if (cursor) {
+					DRM_WARN(
+						"Too many cursor planes found for crtc %s.",
+						item->ci_name);
+					return -EINVAL;
+				}
+				cursor = plane;
+			}
+		}
+
+		if (!primary) {
+			DRM_WARN("No primary plane configured for crtc %s",
+				 item->ci_name);
+			return -EINVAL;
+		}
+
+		vkms_crtc =
+			vkms_crtc_init(vkmsdev, primary, cursor, item->ci_name);
+		if (IS_ERR(vkms_crtc)) {
+			DRM_WARN("Unable to init crtc from config: %s",
+				 item->ci_name);
+			return PTR_ERR(vkms_crtc);
+		}
+
+		for (int j = 0; j < output->num_planes; j++) {
+			struct plane_map *plane_entry = &plane_map[j];
+
+			if (!plane_entry->plane)
+				break;
+
+			if (is_object_linked(
+				    &plane_entry->config_plane->possible_crtcs,
+				    config_crtc->crtc_config_idx)) {
+				plane_entry->plane->base.possible_crtcs |=
+					drm_crtc_mask(&vkms_crtc->base);
+			}
+		}
+
+		for (int j = 0; j < output->num_encoders; j++) {
+			struct encoder_map *encoder_entry = &encoder_map[j];
+
+			if (is_object_linked(&encoder_entry->config_encoder
+						      ->possible_crtcs,
+					     config_crtc->crtc_config_idx)) {
+				encoder_entry->encoder->possible_crtcs |=
+					drm_crtc_mask(&vkms_crtc->base);
+			}
+		}
+
+		if (vkmsdev->config.writeback) {
+			int ret = vkms_enable_writeback_connector(vkmsdev,
+								  vkms_crtc);
+			if (ret)
+				DRM_WARN(
+					"Failed to init writeback connector for config crtc: %s. Error code %d",
+					item->ci_name, ret);
+		}
+	}
+
+	drm_mode_config_reset(dev);
+
+	return 0;
 }
-- 
2.42.0.rc1.204.g551eb34607-goog

