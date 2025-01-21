Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FEA17C6C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9952810E579;
	Tue, 21 Jan 2025 10:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="S9ABhWYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEEB10E569
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4561D40014;
 Tue, 21 Jan 2025 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrhjQpaQ55YrHpQkyvKf+ibT04fOK5Z827Lbs+9fVjk=;
 b=S9ABhWYNNUjp7F9oeqrd/YJrfO/rtyc6CuqVrMVdKx2g8U3MpI+5tKprgJTrVYt8jLxNyE
 iHALQhz/cW1TPSf/cjAHMlooUEU/Hpdg3HJUIq4Mw2SwRl/yTRA4FwsqfKcbz48nMCVEkP
 3+URsT+dPQrWET3zPGzrYcgNferAwfiAHhCOi4opp5Yqny4YreJwcTIAA7SvX+RKUdM9+r
 7O0NY4S8V1u4o9OFtO09fGRGQzxyF2Q3PHYJE06tuhsnmbV3YFUg9KbvrjDRZCikD4n3Mp
 mw1RL4tOsQ9XOm4XCUAwxBOnLLAnMi0Lt81E0iXFTX4+F/PXeJuTWq6hWB5qVg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:55:37 +0100
Subject: [PATCH v3 13/16] drm/vkms: Introduce config for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-13-cac00a3c3544@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7086;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=h96AJuJMB79BMqsqKf6GU0WV5220NzQmB3PmvQBpvsc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30kOUinOxpvtaAABqCz3/FHRvtsIgSbPkAvC
 XdwK5gpmmyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499JAAKCRAgrS7GWxAs
 4r0iEACGNeA9KNoTBMse1hScH39dgs4KjB385HbFPLPE/oTo/lX3qZVrxKzDxc4X85MSNPkWu5s
 pzL1Mdx0aB0draukmE/uzqE+Se8AaDspTHASTvE5E1KKpUsTJIJqF6aqa3+gzSwlj0EQWBwEu4x
 j6YWZXO60EYFvBgMISkx0Jcms7B8pKlvw44JkVttEWICqzTbB9eiT27JplJa6xpUaQvm0zUVqP4
 YQfDrakP21khB27Ts9NW+egwRD2fSfKxM/wITqa7zhMb+/pvMuwvPnm8Krn/WXgRchS9c85ZNvT
 pXweFoKQ4jqhKIO5CmdK5WoJQ/+wlDY13DmB7XQFDdts6yfm4chVzmaY6sBHxDYDhK3nhsYMVsm
 R2Qn5k/1wFPkHqIiki0NcZhX5TnK185plQlPc3j7enhO8hlpC7r+BsRMutGoCdPB3FPo3UGSCM1
 0TMkdItCeEO/kuItNndDD4O9650kLAWc83Vv1ixbmaqPbHOGFpPlpAHuEcovpIkGhoBBazQfTol
 9103QeDSatoAXIPb8Brj0zzgzClo29A8ry6WxnIq52lSr3ea+VO5KsShRTZOPrlGon9Gu77zdCl
 stBYoSWrR1QdwpZ+YPR8iBs1LFn7qPDv/7dBjORdQHGaCu3R9IleGSffRiehUWDT6VKwglrabOQ
 3J3ImF8e9Ob6RCg==
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

VKMS driver supports all the pixel formats for planes, but for testing it
can be useful to only advertise few of them. This new configuration
interface will allow configuring the pixel format per planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 75 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 19 ++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c  | 13 ++-----
 3 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index d2006d7b47f9cf21487659cc3eacb6272d1904b0..57e211e48a90d3a4d7f8677c40a2b35d44b847e5 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -6,6 +6,14 @@
 #include "vkms_config.h"
 #include "vkms_drv.h"
 
+static const u32 vkms_supported_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_RGB565,
+};
+
 struct vkms_config *vkms_config_create(void)
 {
 	struct vkms_config *config;
@@ -120,6 +128,13 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *vkms_conf
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
@@ -186,6 +201,65 @@ struct vkms_config_encoder *vkms_config_create_encoder(struct vkms_config *vkms_
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
@@ -206,6 +280,7 @@ void vkms_config_delete_plane(struct vkms_config_plane *vkms_config_plane,
 		}
 	}
 
+	kfree(vkms_config_plane->supported_formats);
 	kfree(vkms_config_plane->name);
 	kfree(vkms_config_plane);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 18b8978b7b7b58c45fcf11f7130883013e34d8ed..72bfaadd4322f9e1607a6b9425fb8aaf8bd9d5f6 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -90,6 +90,8 @@ struct vkms_config_plane {
 	enum drm_plane_type type;
 	unsigned int default_rotation;
 	unsigned int supported_rotations;
+	u32 *supported_formats;
+	unsigned int supported_formats_count;
 
 	struct xarray possible_crtcs;
 	/* Internal usage */
@@ -136,6 +138,23 @@ bool vkms_config_is_valid(struct vkms_config *vkms_config);
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
index c23ac8687dedaa956cfd6622321f1026521ff13f..e7ad161fd3d3f2d0bdaf63a4df86d6a2e91230c1 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -13,14 +13,6 @@
 #include "vkms_formats.h"
 #include "vkms_config.h"
 
-static const u32 vkms_formats[] = {
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
-};
-
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -195,8 +187,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
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
2.47.1

