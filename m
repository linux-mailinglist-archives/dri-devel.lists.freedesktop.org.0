Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE56BEC44C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB03710ECE5;
	Sat, 18 Oct 2025 02:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hJUME3HW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA4510E2FD
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B1E0B1A14AA;
 Sat, 18 Oct 2025 02:02:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 87FAD60701;
 Sat, 18 Oct 2025 02:02:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2E5CA102F2374; 
 Sat, 18 Oct 2025 04:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752934; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uW/SzXAmiByxQbYpC030fldcG+6jHM28dCuK/8g5jw8=;
 b=hJUME3HW+gzWIB0I+xaK0Yot1xHfZTgVMwgFFOSOae87kewLEVR/bWuGW1pfdMV15QTYGC
 9rpfAiQI9eQ4KPk00FPdNUU+S57bRYAl7MYraj5Wj9Ha8Y2r2F7eSAg13ylJZAG/lV+xcN
 LPH8yN7bxeOTgJKHbnc2iTxENJ0kkOUzIrNppaFzALwyNjQJ1+dA9Ss2LV0LmGWGKYZoEP
 G7JrhtC42K3n7lpSmwWV7Nb9TWLaM5PkaAXXU/GwdX501/BkcyKoXVVFwaC0Mnr0E7e5bE
 fMoPjXzUioe2ChM+OjXG4Ce8UFGkgJPQtmlwb+6T53MKaVQAfH5RCTRXwjkWJg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:12 +0200
Subject: [PATCH 12/22] drm/vkms: Introduce config for plane zpos property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-12-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9374;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=3inMoYuFvz6b6Vnx0vhN2esmm+Crj3NEKedA0WYqm5w=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT+e12Zu5eJQ6udRU0TtXxMauWwL/TMmlBZZ
 c6+/TmWvN6JAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/gAKCRAgrS7GWxAs
 4hyjD/9TQjgvg1PyBqwrDwqrYiie/CNlH1FQ1KfPDPOMh6dTAKbDDoKeOVajjRww+RAi24dNkvy
 0zBVbwXdnitlwN4k12kC0u+XRzADhilaASDqIu3a2BsfweZtztiTaeIq7CiFYLs4LwID304V497
 gd7Vqn//bxllfLrrREDaM79SSUpsVO6QULlXzbyWvzoOfCXPZVukTLnfmw96LVhON1lJfeP4g1n
 8bB+7aIMfuQKMs3eHBAKVDLc4HZFdZkadG2JIswL2Igq6eJ35kEwBu6+7Z3CWT1Gnh60cbt8Bkh
 c3PqlyzkTLKx2qQu0akDJCx+9jkSPvRSdNHHe423Z0PDF9DgfesKRA9dZIQDARmCd4HegMzMvaO
 zTCnac/cEA7DNUtl6woh9wWVQPVXdIcBt7dn421qpp7Qww8ZpsfvUnJQ2LNvuBNdb0HMl40tY5G
 wzAlq4FNN5r6mVR5VfQki/kpb/mcKE3d0iXXp52iizw7IA2kFuImxOyZI7Cate/0VyaZqBUMBii
 W7Z2Bvg8MpbvNyDZcQZq5VBXG1HUDS0Qyb6Ygn5BdDJrUCblS+U+1ZLtD/5cou9hWM1ZZo8PEfl
 YXvmjYyZDQwid8gxLJIq/YVdYc24ZRj4Ij+k7crE5+0gizdxG15DYOfKMRW9xhLZQWG7iQCTqG1
 ATPQJgPREa9qaZg==
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

VKMS can render plane in any order. Introduce the appropriate
configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |   3 +
 drivers/gpu/drm/vkms/vkms_config.c            |  21 ++++
 drivers/gpu/drm/vkms/vkms_config.h            | 142 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c             |  11 ++
 4 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index d75a6252e4d2..f2b38b436252 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -172,6 +172,9 @@ static void vkms_config_test_default_config(struct kunit *test)
 			n_possible_crtcs++;
 		}
 		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
+		KUNIT_EXPECT_EQ(test, vkms_config_plane_get_zpos_enabled(plane_cfg), false);
+		// No need to test the other zpos configurations as they are discarded if
+		// the zpos property is not created.
 	}
 
 	/* Encoders */
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 0b975a0d47aa..5da34a3e8114 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -86,6 +86,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(plane_cfg))
 		goto err_alloc;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_PRIMARY);
+	vkms_config_plane_set_zpos_enabled(plane_cfg, false);
 
 	crtc_cfg = vkms_config_create_crtc(config);
 	if (IS_ERR(crtc_cfg))
@@ -103,6 +104,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 
 			vkms_config_plane_set_type(plane_cfg,
 						   DRM_PLANE_TYPE_OVERLAY);
+			vkms_config_plane_set_zpos_enabled(plane_cfg, false);
 
 			if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
 				goto err_alloc;
@@ -115,6 +117,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 			goto err_alloc;
 
 		vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_CURSOR);
+		vkms_config_plane_set_zpos_enabled(plane_cfg, false);
 
 		if (vkms_config_plane_attach_crtc(plane_cfg, crtc_cfg))
 			goto err_alloc;
@@ -206,6 +209,24 @@ static bool valid_plane_properties(const struct vkms_config *config)
 			drm_info(dev, "Configured default color range is not supported by the plane\n");
 			return false;
 		}
+		if (vkms_config_plane_get_zpos_initial(plane_cfg) >
+		    vkms_config_plane_get_zpos_max(plane_cfg)) {
+			drm_info(dev, "Configured initial zpos value bigger than zpos max\n");
+			return false;
+		}
+
+		if (vkms_config_plane_get_zpos_max(plane_cfg) <
+		    vkms_config_plane_get_zpos_min(plane_cfg)) {
+			drm_info(dev, "Configured zpos max value smaller than zpos min\n");
+			return false;
+		}
+
+		if (vkms_config_plane_get_zpos_initial(plane_cfg) <
+		    vkms_config_plane_get_zpos_min(plane_cfg)) {
+			drm_info(dev, "Configured initial zpos value smaller than zpos min\n");
+			return false;
+		}
+
 	}
 	return true;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 0b7067508e5f..267e45f5a617 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -49,6 +49,11 @@ struct vkms_config {
  * @supported_color_encoding: Color encoding that this plane will support
  * @default_color_range: Default color range that should be used by this plane
  * @supported_color_range: Color range that this plane will support
+ * @zpos_enable: Enable or disable the zpos property
+ * @zpos_mutable: Make the zpos property mutable or not (ignored if @zpos_enable is false)
+ * @zpos_initial: Initial value for zpos property (ignored if @zpos_enable is false)
+ * @zpos_min: Minimal value for zpos property (ignored if @zpos_enable is false)
+ * @zpos_max: Maximal value for zpos property (ignored if @zpos_enable is false)
  */
 struct vkms_config_plane {
 	struct list_head link;
@@ -65,6 +70,11 @@ struct vkms_config_plane {
 	u32 *supported_formats;
 	unsigned int supported_formats_count;
 	struct xarray possible_crtcs;
+	bool zpos_enabled;
+	bool zpos_mutable;
+	unsigned int zpos_initial;
+	unsigned int zpos_min;
+	unsigned int zpos_max;
 
 	/* Internal usage */
 	struct vkms_plane *plane;
@@ -477,6 +487,138 @@ vkms_config_plane_get_name(struct vkms_config_plane *plane_cfg)
 	return plane_cfg->name;
 }
 
+/**
+ * vkms_config_plane_set_zpos_enabled() - Enable or disable zpos property for a plane
+ * @plane_cfg: Plane configuration to modify
+ * @zpos_enabled: Whether to enable the zpos property
+ */
+static inline
+void vkms_config_plane_set_zpos_enabled(struct vkms_config_plane *plane_cfg,
+					bool zpos_enabled)
+{
+	plane_cfg->zpos_enabled = zpos_enabled;
+}
+
+/**
+ * vkms_config_plane_set_zpos_mutable() - Set whether zpos property is mutable
+ * @plane_cfg: Plane configuration to modify
+ * @zpos_mutable: Whether the zpos property should be mutable
+ */
+static inline
+void vkms_config_plane_set_zpos_mutable(struct vkms_config_plane *plane_cfg,
+					bool zpos_mutable)
+{
+	plane_cfg->zpos_mutable = zpos_mutable;
+}
+
+/**
+ * vkms_config_plane_set_zpos_initial() - Set the initial zpos value
+ * @plane_cfg: Plane configuration to modify
+ * @zpos_initial: Initial zpos value
+ */
+static inline
+void vkms_config_plane_set_zpos_initial(struct vkms_config_plane *plane_cfg,
+					unsigned int zpos_initial)
+{
+	plane_cfg->zpos_initial = zpos_initial;
+}
+
+/**
+ * vkms_config_plane_set_zpos_min() - Set the minimum zpos value
+ * @plane_cfg: Plane configuration to modify
+ * @zpos_min: Minimum zpos value
+ */
+static inline
+void vkms_config_plane_set_zpos_min(struct vkms_config_plane *plane_cfg,
+				    unsigned int zpos_min)
+{
+	plane_cfg->zpos_min = zpos_min;
+}
+
+/**
+ * vkms_config_plane_set_zpos_max() - Set the maximum zpos value
+ * @plane_cfg: Plane configuration to modify
+ * @zpos_max: Maximum zpos value
+ *
+ * Sets the maximum allowed value for the zpos property. This setting is
+ * ignored if zpos is disabled.
+ */
+static inline
+void vkms_config_plane_set_zpos_max(struct vkms_config_plane *plane_cfg,
+				    unsigned int zpos_max)
+{
+	plane_cfg->zpos_max = zpos_max;
+}
+
+/**
+ * vkms_config_plane_get_zpos_enabled() - Check if zpos property is enabled
+ * @plane_cfg: Plane configuration to check
+ *
+ * Returns:
+ * True if the zpos property is enabled for this plane, false otherwise.
+ */
+static inline
+bool vkms_config_plane_get_zpos_enabled(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->zpos_enabled;
+}
+
+/**
+ * vkms_config_plane_get_zpos_mutable() - Check if zpos property is mutable
+ * @plane_cfg: Plane configuration to check
+ *
+ * Returns:
+ * True if the zpos property is mutable for this plane, false otherwise.
+ * Returns false if zpos is disabled.
+ */
+static inline
+bool vkms_config_plane_get_zpos_mutable(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->zpos_mutable;
+}
+
+/**
+ * vkms_config_plane_get_zpos_initial() - Get the initial zpos value
+ * @plane_cfg: Plane configuration to check
+ *
+ * Returns:
+ * The initial zpos value for this plane. The return value is undefined if
+ * zpos is disabled.
+ */
+static inline
+unsigned int vkms_config_plane_get_zpos_initial(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->zpos_initial;
+}
+
+/**
+ * vkms_config_plane_get_zpos_min() - Get the minimum zpos value
+ * @plane_cfg: Plane configuration to check
+ *
+ * Returns:
+ * The minimum allowed zpos value for this plane. The return value is undefined
+ * if zpos is disabled.
+ */
+static inline
+unsigned int vkms_config_plane_get_zpos_min(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->zpos_min;
+}
+
+/**
+ * vkms_config_plane_get_zpos_max() - Get the maximum zpos value
+ * @plane_cfg: Plane configuration to check
+ *
+ * Returns:
+ * The maximum allowed zpos value for this plane. The return value is undefined
+ * if zpos is disabled.
+ */
+static inline
+unsigned int vkms_config_plane_get_zpos_max(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->zpos_max;
+}
+
 /**
  * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
  * @plane_cfg: Plane to attach
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0414865915d8..51f6372a6f72 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -209,5 +209,16 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  vkms_config_plane_get_default_color_encoding(config),
 					  vkms_config_plane_get_default_color_range(config));
 
+	if (vkms_config_plane_get_zpos_enabled(config)) {
+		if (vkms_config_plane_get_zpos_mutable(config))
+			drm_plane_create_zpos_property(&plane->base,
+						       vkms_config_plane_get_zpos_initial(config),
+						       vkms_config_plane_get_zpos_min(config),
+						       vkms_config_plane_get_zpos_max(config));
+		else
+			drm_plane_create_zpos_immutable_property(&plane->base,
+								 vkms_config_plane_get_zpos_initial(config));
+	}
+
 	return plane;
 }

-- 
2.51.0

