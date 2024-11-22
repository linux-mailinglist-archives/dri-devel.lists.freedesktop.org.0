Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5FC9D62EC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D226110EC3A;
	Fri, 22 Nov 2024 17:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P3ZLUDtp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E46110EC25
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:20:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0C801C0005;
 Fri, 22 Nov 2024 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732296034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+uxkQn+mlEuDnQOdIypl/rm+OT/Ip+5g02ew8ECwUI=;
 b=P3ZLUDtpK71/FMHRiWTSM42HxBZ3/zu+mtEQt5aqbjpJFvRNgQLcsfKGVNa2Btq2XHOlWe
 wSVaFGcUH6c1c79oqV7hOyD1o2H+s0lAt0a/ARvonNvPM809WlJksmoFSSTVnXGRVSXd0y
 FIvXVSc2bEWaMIvZq6Ns8caSybJm6Zv0dmrxEChLlvXL+Av0LnqJtrHU4GKzz8tzMJfBuP
 h23SCPKBQqbsZ1RIkND/Pjk9/2lyKBJo7cb8/L9GSWxO1QD306NFMBAFtQAMduc+bwlPOe
 NPyy6p60P+842XbXnh/DA9W9va0dAJgoOXbF3FvJh5vgeJh4nZ70C/4ctNIm1g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:20:19 +0100
Subject: [PATCH RFC v2 15/18] drm/vkms: Introduce config for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-remove-crtc-index-from-parameter-v2-15-81540742535a@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8212;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=28S5sg0LuchLTdWq16JVNfGAMJbUl085tPc58du+djg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQL1QgbqIU8MYbqIDkdSnOO9PX64/sCQg5uT83
 NPsnFr0Dl2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0C9UAAKCRAgrS7GWxAs
 4ifwD/4t9SBVJW+AeCAlJIB9A9WhWpE+yAnLd/CBgm9s3FtBTmsTu6VWz25dAEBB4akem+CIftj
 FQBrkD3UMHRWYtQd+664fwPe9PEl1poUE74DzWOdJ2HXuYjDc6X+WUjS3VsLYfal5GcZTRIFyug
 vnerHoeggUQCB2BDDvHTWLmNOtWS3nyja7U7TfF+DxC6imEaSrKn0dyQYKDhHUa/qw3YdLTQlYj
 6Sdi/ut9XLF+AGDl3uBTWb0qc+Iv3QnS2wjGJr/DkBNAPvVtR3Cx8zordWBvOZ+gK9hu0zgs9zO
 +JToJEAhtpCnG9GSxj/SGFmkR9nfZbUaiCBImPJ+a8054goEIjjpf4js1Oy4MVZbydu7aOiQIpH
 sJ7aKQ5Ve0rm0LigUUyA6Z1At0uz5VE8W0gfWibK+UZkSf900JCdu+BoRkN7c+9fq2Qr87q/P34
 JEyc/mj/SyFK1fBy+ZwLvSN7GHv65+4BJPkBZuhN39aNv2NlWjozGyrbtGQY7al7gyLlyqCxv2Y
 tQY9S7ZynEcbXrYvy6mt6onDICr03M1qohiOfRqI9odVfQAbHsI0l4YFN744z0u+wD+DIjJxJfj
 u0FE9J7TUa3+OCZ026Rwy6Hy5RWLhdxKu8LmoFUdd9XjhhezpUA+3ptWl3Nx6H3PNoNNJeIH0sa
 x6vo7KlZbVMCNKA==
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
 drivers/gpu/drm/vkms/vkms_config.c | 105 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  19 +++++++
 drivers/gpu/drm/vkms/vkms_plane.c  |  43 ++-------------
 3 files changed, 127 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index c3334d3d808e5fc8cd6d855e9e1395f94f157ffb..4726929c2b54b2e670f9ef53b05ec009ca495e08 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -6,6 +6,44 @@
 #include "vkms_config.h"
 #include "vkms_drv.h"
 
+static const u32 vkms_supported_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV42,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
+	DRM_FORMAT_R1,
+	DRM_FORMAT_R2,
+	DRM_FORMAT_R4,
+	DRM_FORMAT_R8,
+};
+
 struct vkms_config *vkms_config_create(void)
 {
 	struct vkms_config *config;
@@ -120,6 +158,13 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
 	if (!vkms_config_overlay)
 		return NULL;
 
+	vkms_config_overlay->supported_formats = NULL;
+
+	if (vkms_config_plane_add_all_formats(vkms_config_overlay)) {
+		kfree(vkms_config_overlay);
+		return NULL;
+	}
+
 	vkms_config_overlay->type = DRM_PLANE_TYPE_OVERLAY;
 	vkms_config_overlay->supported_rotations = DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK;
 	vkms_config_overlay->default_rotation = DRM_MODE_ROTATE_0;
@@ -193,6 +238,65 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_encoder);
 
+int __must_check vkms_config_plane_add_all_formats(struct vkms_config_plane *vkms_config_plane)
+{
+	u32 *ret = krealloc_array(vkms_config_plane->supported_formats,
+				  ARRAY_SIZE(vkms_supported_plane_formats),
+				  sizeof(uint32_t), GFP_KERNEL);
+	if (!ret)
+		return -ENOMEM;
+	vkms_config_plane->supported_formats = ret;
+
+	memcpy(vkms_config_plane->supported_formats, vkms_supported_plane_formats,
+	       sizeof(vkms_supported_plane_formats));
+	vkms_config_plane->supported_formats_count = ARRAY_SIZE(vkms_supported_plane_formats);
+	return 0;
+}
+
+int __must_check vkms_config_plane_add_format(struct vkms_config_plane *vkms_config_plane,
+					      u32 drm_format)
+{
+	bool found = false;
+
+	for (int i = 0; i < ARRAY_SIZE(vkms_supported_plane_formats); i++) {
+		if (vkms_supported_plane_formats[i] == drm_format)
+			found = true;
+	}
+
+	if (!found)
+		return -EINVAL;
+	for (unsigned int i = 0; i < vkms_config_plane->supported_formats_count; i++) {
+		if (vkms_config_plane->supported_formats[i] == drm_format)
+			return 0;
+	}
+	u32 *new_ptr = krealloc_array(vkms_config_plane->supported_formats,
+				      vkms_config_plane->supported_formats_count + 1,
+				      sizeof(*vkms_config_plane->supported_formats), GFP_KERNEL);
+	if (!new_ptr)
+		return -ENOMEM;
+
+	vkms_config_plane->supported_formats = new_ptr;
+	vkms_config_plane->supported_formats[vkms_config_plane->supported_formats_count] = drm_format;
+	vkms_config_plane->supported_formats_count++;
+
+	return 0;
+}
+
+void vkms_config_plane_remove_all_formats(struct vkms_config_plane *vkms_config_plane)
+{
+	vkms_config_plane->supported_formats_count = 0;
+}
+
+void vkms_config_plane_remove_format(struct vkms_config_plane *vkms_config_plane, u32 drm_format)
+{
+	for (unsigned int i = 0; i < vkms_config_plane->supported_formats_count; i++) {
+		if (vkms_config_plane->supported_formats[i] == drm_format) {
+			vkms_config_plane->supported_formats[i] = vkms_config_plane->supported_formats[vkms_config_plane->supported_formats_count - 1];
+			vkms_config_plane->supported_formats_count--;
+		}
+	}
+}
+
 void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
 			      struct vkms_config *vkms_config)
 {
@@ -213,6 +317,7 @@ void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
 		}
 	}
 
+	kfree(vkms_config_plane->supported_formats);
 	kfree(vkms_config_plane->name);
 	kfree(vkms_config_plane);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index c44bcafc3b34e1997f29631fda42af05e1c0c2ba..5487e0140da0e111c36f9a22d4e783a20c880a1d 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -98,6 +98,8 @@ struct vkms_config_plane {
 	unsigned int supported_color_encoding;
 	enum drm_color_range default_color_range;
 	unsigned int supported_color_range;
+	u32 *supported_formats;
+	unsigned int supported_formats_count;
 
 	struct xarray possible_crtcs;
 	/* Internal usage */
@@ -144,6 +146,23 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
  */
 struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_config);
 
+/** vkms_config_plane_add_format - Add a format to the list of supported format of a plane
+ *
+ * The passed drm_format can already be present in the list. This may fail if the allocation of a
+ * bigger array fails.
+ *
+ * @vkms_config_plane: Plane to add the format to
+ * @drm_format: Format to add to this plane
+ *
+ * Returns: 0 on success, -ENOMEM if array allocation fails, -EINVAL if the format is not supported
+ * by VKMS
+ */
+int __must_check vkms_config_plane_add_format(struct vkms_config_plane *vkms_config_plane,
+					      u32 drm_format);
+int __must_check vkms_config_plane_add_all_formats(struct vkms_config_plane *vkms_config_plane);
+void vkms_config_plane_remove_format(struct vkms_config_plane *vkms_config_plane, u32 drm_format);
+void vkms_config_plane_remove_all_formats(struct vkms_config_plane *vkms_config_plane);
+
 struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *vkms_config);
 
 /**
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 90a5946481e47ab7cff9b9dc4942720b6bbcbe3f..b858c8ba00d97e461d70b5cc274ab4e7a3e1bb78 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -13,44 +13,6 @@
 #include "vkms_formats.h"
 #include "vkms_config.h"
 
-static const u32 vkms_formats[] = {
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_RGBX8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_XBGR16161616,
-	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_ABGR16161616,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_NV42,
-	DRM_FORMAT_YUV420,
-	DRM_FORMAT_YUV422,
-	DRM_FORMAT_YUV444,
-	DRM_FORMAT_YVU420,
-	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YVU444,
-	DRM_FORMAT_P010,
-	DRM_FORMAT_P012,
-	DRM_FORMAT_P016,
-	DRM_FORMAT_R1,
-	DRM_FORMAT_R2,
-	DRM_FORMAT_R4,
-	DRM_FORMAT_R8,
-};
-
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -227,8 +189,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
-					   vkms_formats, ARRAY_SIZE(vkms_formats),
-					   NULL, config->type, config->name);
+					   config->supported_formats,
+					   config->supported_formats_count, NULL, config->type,
+					   config->name);
 	if (IS_ERR(plane))
 		return plane;
 

-- 
2.47.0

