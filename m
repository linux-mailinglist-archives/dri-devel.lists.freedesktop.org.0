Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B2998E4A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 19:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6096E10E97E;
	Thu, 10 Oct 2024 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YiNwHkJ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F5910E97E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 17:27:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27EA120002;
 Thu, 10 Oct 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728581224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cjW1iqTnZt7Tql22SF2gqUtFnIpZXxwf+7g9zNxGy38=;
 b=YiNwHkJ7tRq5iBMzl0N7JPkJfzUna1pFa89s4mQrxVQH7TzwpVafBwMd3ltOJXx+z+Ds5k
 b76FfcflT5FzN1MhuZVEXnQm05BhDbxKSNRRFRDfqW25dC46oAxT//xTiD79TGZ1tKHT2n
 7xKBpCgZgZuQyxEB3j5KeII39B6Mxflb/7ljiSGilSla7gXbQtZ1bPcnvoL8s+hneAhA+Y
 kIohXC6HnW4JcspwFeQsS8SL8xk//+ucfQYSoaPjqskjLjPhgGujPqhHplJMVsz0SRIEGR
 7HIwknQOrpvJomO/nVbSJvwZOFQ3kIobHqwXo9SpP++bQeIlzeQ9Di/4hqa+tw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 10 Oct 2024 19:27:00 +0200
Subject: [PATCH v2] drm/vkms: Remove index parameter from init_vkms_output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vkms-remove-index-v2-1-6b8d6cfd5a15@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGQOCGcC/32OwQ6CMAyGX4X0bHUMYtST72E4wFak0W26zQVDe
 HcnxKu3fm2+v/8EgTxTgFMxgafEgZ3NIDcFqKG1V0LWmUEKWYuj2GO6mYCejEv5ZDWNWLV7ErW
 qDiQkZO/hqedxybw0K3t6vnJ0XJfQtYFQOWM4ngrtDRoOavcb0NIY4WsOHKLz76VcKhf1T49UY
 omV6knrg1Kd7M+dc/HOdptfQTPP8wcmb4oc7gAAAA==
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7390;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=C3nvDo4V6bCHXXVshrM6mSReoIZPTcAhgOpDmwGhhxc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnCA5m/wReDMSQxhI98iajU4eQYt445jMbcPvw3
 NTzr1pzKaWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZwgOZgAKCRAgrS7GWxAs
 4rpDEADAsofiRONRJ7NVdbBpbx5L/WRTUZxrhUkT7wsVM6IwXeKKjLFMM7aT2JwtO7uQDRuhYeq
 msJC0xa9/7UnTj/yAYnND1H14uQMP38+BPx84sbtjgl3fFE8AaSjrgBQa8lyckzd9klrQ+qyCqH
 HJVP6JGmBbIuxp9CiVRcuJ7LOEjBpJaQIlxJHiZfmwq/lOO+4L8r+bYsIfhnvBpmt1ibTK8QGNv
 afuSKs7HNcW1U3/Me6EgqHfJvtKLm3QN7Y7dDkbLjkWmtWaf5u2LzuHoVuNXwep9CJ1AWoMBErG
 paTkxMdQ4/ELc72qPkMkdgjlYt+cmrZZwdw1Er+Z1pbRwnnoHQJBEY8cI7x16KSiGcWSVHGZyT+
 7ou7MiELsjBvQ/qDDega/4F5a8WnIVwLkpqT+JIGGgRBFh76ZRwXTOof85eVzvn6xVhQFNat3VG
 B9JRQpY0o6SodExKQNm3/vTce4HN6Mxu051gxGczA6OkvUG/kodxWGtmzbVhuKcukWZLKRHWEMn
 P8jvn7mRClup6ibxkHOyOSYiCewG0jQonkczY1rAVMmrKB/xjO+ydOS+H05L8HXNIfAvJipSdSk
 4GpxptQ2kCbUqIcJhoi3eZM99jI7Ftk4//EV3H2mqKsngG30lgu8oNelfgBk/7Q04o1zcgwp+it
 IQI9zC6EjAlTzCw==
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

VKMS currently supports only one CRTC, so it make no sense to have this
index configurable. To avoid issues, replace this hardcoded index by
drm_crtc_mask when applicable.

There is no need to manually set a crtc mask on primary and cursor plane
as it is automatically set by drmm_crtc_alloc_with_planes.

In addition, this will remove the use of an uninitialized structure in
vkms_add_overlay_plane. This currently works by chance because two things:
- vkms_plane_init always set a possible_crtcs value, so the problematic
  branch is never used;
- drm_crtc_mask on an kzalloc'd drm_crtc returns BIT(0), and the VKMS CRTC
  always have this id.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- Applied comments from José
- Link to v1: https://lore.kernel.org/r/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com
---
 drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++----
 drivers/gpu/drm/vkms/vkms_output.c | 54 ++++++++++++++------------------------
 drivers/gpu/drm/vkms/vkms_plane.c  |  4 +--
 4 files changed, 24 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 2d1e95cb66e5..0f6805b9fe7b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -174,7 +174,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	return vkms_output_init(vkmsdev);
 }
 
 static int vkms_create(struct vkms_config *config)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 672fe191e239..036101ee4ea1 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -212,21 +212,17 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
  * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
  *
  * @vkmsdev: VKMS device to initialize
- * @index: CRTC which can be attached to the planes. The caller must ensure that
- *	   @index is positive and less or equals to 31.
  */
-int vkms_output_init(struct vkms_device *vkmsdev, int index);
+int vkms_output_init(struct vkms_device *vkmsdev);
 
 /**
  * vkms_plane_init() - Initialize a plane
  *
  * @vkmsdev: VKMS device containing the plane
  * @type: type of plane to initialize
- * @index: CRTC which can be attached to the plane. The caller must ensure that
- *	   @index is positive and less or equals to 31.
  */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index);
+				   enum drm_plane_type type);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 0a5a185aa0b0..5128aa3b2eb6 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,29 +32,14 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
-static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
-				  struct drm_crtc *crtc)
-{
-	struct vkms_plane *overlay;
-
-	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
-	if (IS_ERR(overlay))
-		return PTR_ERR(overlay);
-
-	if (!overlay->base.possible_crtcs)
-		overlay->base.possible_crtcs = drm_crtc_mask(crtc);
-
-	return 0;
-}
-
-int vkms_output_init(struct vkms_device *vkmsdev, int index)
+int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
-	struct vkms_plane *primary, *cursor = NULL;
+	struct vkms_plane *primary, *overlay, *cursor = NULL;
 	int ret;
 	int writeback;
 	unsigned int n;
@@ -65,34 +50,37 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
 	 * composition.
 	 */
-	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
+	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	if (vkmsdev->config->overlay) {
-		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-			if (ret)
-				return ret;
-		}
-	}
-
 	if (vkmsdev->config->cursor) {
-		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
+		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR);
 		if (IS_ERR(cursor))
 			return PTR_ERR(cursor);
 	}
 
-	/* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */
 	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
 	if (ret)
 		return ret;
 
+	if (vkmsdev->config->overlay) {
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
+			if (IS_ERR(overlay)) {
+				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
+				ret = PTR_ERR(overlay);
+				goto err_crtc;
+			}
+			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+		}
+	}
+
 	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
-		goto err_connector;
+		goto err_crtc;
 	}
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
@@ -103,11 +91,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
 	}
-	/*
-	 * This is a hardcoded value to select crtc for the encoder.
-	 * BIT(0) here designate the first registered CRTC, the one allocated in [1]
-	 */
-	encoder->possible_crtcs = BIT(0);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
@@ -131,7 +115,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 err_encoder:
 	drm_connector_cleanup(connector);
 
-err_connector:
+err_crtc:
 	drm_crtc_cleanup(crtc);
 
 	return ret;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e5c625ab8e3e..ad137c9a75f5 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -198,12 +198,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
 };
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index)
+				   enum drm_plane_type type)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
 
-	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
+	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
 					   vkms_formats, ARRAY_SIZE(vkms_formats),
 					   NULL, type, NULL);

---
base-commit: 33c255312660653cf54f8019896b5dca28e3c580
change-id: 20240906-vkms-remove-index-3a6e04c38e02

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

