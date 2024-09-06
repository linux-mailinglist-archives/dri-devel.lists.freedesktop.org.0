Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BFA96F939
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 18:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBF810E09F;
	Fri,  6 Sep 2024 16:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hTIU95NO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2A810E09F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 16:23:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 415F4240002;
 Fri,  6 Sep 2024 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725639836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5xYG04gxwyTWmC6jNmQi1lSg/P1OGjLGStsxPJedaiU=;
 b=hTIU95NO1tjemjWNJx5Mt0f4XD41IHZmOCge1TBhJkt7R2JlzKTfNctQQzuNi485UWK9U/
 MBFCHFVNAL1lKhc8oRj1DGeUVe4n3+4AA5nLI6/r9YcS73ucCk8G5D5uSKRuTSmovnLBr2
 cy4dbNG6KBCxMNpVJ+6ahmEcrnDLMCB4bOCVXJf/h6eQOy1j/MaKZ7JuLQfK5rarGACQfb
 Sfo7y4zlZG4+vYaTuM4fgzU2D4DihmkrUld/ldYtvewA76kTt456W2KiWGudcYPr0NH1Ag
 X9+EtxPDDb6aWanrBFF2E51iWUWKmYvWQwvbmTPEWEqPWqnapbVdu6Mq99jsCA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 06 Sep 2024 18:23:52 +0200
Subject: [PATCH] drm/vkms: Remove index parameter from init_vkms_output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJcs22YC/zWMwQrCMBBEfyXs2cWYlqL9FekhJqsukkSzaQmU/
 rvB4m3eDPNWEMpMAqNaIdPCwik2OB0UuKeND0L2jcFo0+uLHnB5BcFMIS1tip4qdnYg3bvuTNp
 A+70z3bn+nNdp50yfuanLXsLNCqFLIXAZlc8BA4s7/gNGqgWmbfsCgXUMRJ0AAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5896;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=u7ktqOejXldCp0Zb7r9OxYhY+WysBVQH0drMQXcHJ84=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm2yyazO7ZItG1WGZ4FXF7v3+Ia6C/ZHMR1RFwU
 FjKqE0H7+WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZtssmgAKCRAgrS7GWxAs
 4rkLEACCTdBVkn2J/n7l4ZVMCbYF7u6l7ayhw8Zbph7/JFS/lkDymbAgEgqHgjHxzf98AR2o3f3
 uoNbqaBfIzFEeAsLiTkJQUg2XX6tVwY9th5iL4MfPM1xOK8M09UDbGvswajphOez2GX7WHQdbQh
 j2XGBIGASNmi8kNIndmTAawcoQkCBWSvNjX6ucnBaLk9uQf0yS0PdPt2yPRhHOwou7Y68oTY19R
 CvXyh89k/PLfTPTjKf/DuY6hv25NPT530e0w8H7rE3BQRVgcvqQGysPsxiCPU2oNan9Guhgf170
 7w0F5sIT5P8d4rUGWa+cQPanzAS72bw2YPQXL3xR0UkiP4mqfCDg8paqHFzOKPLf+Kqubs+DF3J
 s3F7I4KaktV1xIyai1fdIeiio0L3vdxwHwanSP1uDkWPmOESoNgr+K6z6w7gCAnt2qZpczbleox
 CJEEDUBH2+y7HbIFj+t/cc7O+aYG12zaLYARqb7W/a4hBZobdJZdznr1RrIA+mrtA+f37HGklS/
 ROpoQHUHFSeCkLTByDplAdQgpkIjg81XWdhoaNFaFt4IDdgIEjVGWfV6j2gimqduxFLuaLsaE28
 s72v2vWUNLYpe1Aitpxkhw04XFMAvPAeP0O4+pVnkPwKqNiXeH55jiIljhKJq7dXh2fqYc5McDK
 rUsTe/lIzUxEqsw==
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
 drivers/gpu/drm/vkms/vkms_drv.c    |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h    |  4 ++--
 drivers/gpu/drm/vkms/vkms_output.c | 42 +++++++++++++-------------------------
 drivers/gpu/drm/vkms/vkms_plane.c  |  4 ++--
 4 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0c1a713b7b7b..1226a790bece 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -172,7 +172,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	return vkms_output_init(vkmsdev);
 }
 
 static int vkms_create(struct vkms_config *config)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5e46ea5b96dc..dac063f11dcd 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -148,10 +148,10 @@ struct vkms_device {
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor);
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index);
+int vkms_output_init(struct vkms_device *vkmsdev);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
-				   enum drm_plane_type type, int index);
+				   enum drm_plane_type type);
 
 /* CRC Support */
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 5ce70dd946aa..a6a942b4f84f 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -31,47 +31,24 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
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
@@ -80,6 +57,15 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (ret)
 		return ret;
 
+	if (vkmsdev->config->overlay) {
+		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
+			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY);
+			if (IS_ERR(overlay))
+				return PTR_ERR(overlay);
+			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+		}
+	}
+
 	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
 				 DRM_MODE_CONNECTOR_VIRTUAL);
 	if (ret) {
@@ -95,7 +81,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
 	}
-	encoder->possible_crtcs = 1;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
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
base-commit: a6bb1f77a94335de67dba12e7f52651c115b82d2
change-id: 20240906-vkms-remove-index-3a6e04c38e02

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

