Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F96A960695
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 12:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A924610E2CB;
	Tue, 27 Aug 2024 10:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nTDuvTTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40DB10E222
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 10:01:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D3271C0012;
 Tue, 27 Aug 2024 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724752918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nab9sxyGuNbJf2fwXC6yPovjq0ddYSUOgBR9X9KtRm4=;
 b=nTDuvTTwoNbNg3wmmrqgX3ZD1O3vmeezJ0k+zGjlDJWHO0ezmi9BqvLFZt7+XamE33qeCU
 kYPfNprPBPXBKHt8ZjBkG1jTE8SoRnCriHPtvX1rhbuoLNUAySFxkug4b5EzeFW9Lp4jD1
 0mrY3OfRbU50vxuOfOzshnifsGkYXHKiR5lCl6Cfk9V/to8eyhUfByWZGmpUAc1qKep5T2
 kYqCREYFZzO7nHAeTx8GXCEeDr8jzCl5mC3d42fEvzjZ+DONaZfgvsCz/Idn8C8SQTlvJ7
 UU++oJjOc3LKLfuh+8BKQsMyy4wdX48HCiygbFa9bMRpB/nNT4Np5vbfNeqjkA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 27 Aug 2024 11:57:40 +0200
Subject: [PATCH v2 5/6] drm/vkms: Switch to managed for CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-google-vkms-managed-v2-5-f41104553aeb@bootlin.com>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
In-Reply-To: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11461;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=b5zfZhgdJRj84RHHwh0TEbI8bfN8VfBp90V91fl07Zo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmzaQP430g6cQamYKLckg34XmmAfEpSxn3+QXD4
 /dBo9spv6iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZs2kDwAKCRAgrS7GWxAs
 4vDGD/9RVHCp3789th6qbz6hd8Y+12n1amBCApowq8uw6H9VWOxh1KJhcxV/U1a8Wwu8mRSEFYl
 PGh3m/RQG0eYsY+evQLXed1Tc3T78KFV36f/Oiz1XydM7r4UenTrkG4VP4QmXKwJ32XZ6O2UtQR
 Le+ddAW2U9edfU3xp+1XkmfTp5EUnF99AJChL435qBvb6Gke69Cm+sl5407esUlBCyrC0HXjEPz
 vpk3P2JTSdp0W1hCJsrYM71vPyUILyBfl0sKHSTVJQe0VMVdgCPixIeFBHHXk65wkli2l4xvtQ0
 AgoxULVWxdXplEesG2RrYVyvRcqWcN093hsKsyRTqjw/N6j8LiFVGjCKD/CcAbzaacArL8dQKLO
 nWrHDzbUEENfrhc9DEHTzX2zeJn5YrsDcDmbJG7F4uD3HpcYajXePuxJdGNfitDq+Wr3HMHBsn7
 /YmoHrfrtRkgXKvZrKVMRuIkD70k/w5vLtwDnw4s3fDtBTJMS3qgyaa+qqYb/jwlwfB0ZWbtubu
 RvUhDYknjWOAu+DzZUOpE9+EKHrujFDSU8IVEHBsR9N8DPl0vSdNxa8ln1RNgi+p6tAvf7j4Jwx
 Xwn/Pv4Ev2kGOVo+jgGhTwBFjADhinczioqfBhqZK/KG/rSIFf2JOKvZvOb488M79RibTPwReLt
 L9kLLpxKgitF9IQ==
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

The current VKMS driver uses non-managed function to create CRTCs. It
is not an issue yet, but in order to support multiple devices easily,
convert this code to use drm and device managed helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c      | 40 +++++++++++++-------
 drivers/gpu/drm/vkms/vkms_drv.c       |  9 -----
 drivers/gpu/drm/vkms/vkms_drv.h       |  7 ++--
 drivers/gpu/drm/vkms/vkms_output.c    | 69 +++++++++++++++--------------------
 drivers/gpu/drm/vkms/vkms_writeback.c | 14 +++----
 5 files changed, 65 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 2bf733a1b9f0..ff55099c86ce 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_managed.h>
 
 #include "vkms_drv.h"
 
@@ -270,30 +271,41 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor)
+static void vkms_crtc_destroy_workqueue(struct drm_device *dev, void *raw_vkms_crtc)
 {
-	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(crtc);
+	struct vkms_crtc *vkms_crtc = raw_vkms_crtc;
+
+	destroy_workqueue(vkms_crtc->composer_workq);
+}
+
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev, struct drm_plane *primary,
+				 struct drm_plane *cursor)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+	struct vkms_crtc *vkms_crtc;
 	int ret;
 
-	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
-					 &vkms_crtc_funcs, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init CRTC\n");
-		return ret;
+	vkms_crtc = drmm_crtc_alloc_with_planes(dev, struct vkms_crtc, base, primary, cursor,
+						&vkms_crtc_funcs, NULL);
+	if (IS_ERR(vkms_crtc)) {
+		DRM_DEV_ERROR(vkmsdev->drm.dev, "Failed to init CRTC\n");
+		return vkms_crtc;
 	}
+	drm_crtc_helper_add(&vkms_crtc->base, &vkms_crtc_helper_funcs);
 
-	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
-
-	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
+	drm_mode_crtc_set_gamma_size(&vkms_crtc->base, VKMS_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(&vkms_crtc->base, 0, false, VKMS_LUT_SIZE);
 
 	spin_lock_init(&vkms_crtc->lock);
 	spin_lock_init(&vkms_crtc->composer_lock);
 
 	vkms_crtc->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
 	if (!vkms_crtc->composer_workq)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue, vkms_crtc);
+	if (ret)
+		return ERR_PTR(ret);
 
-	return ret;
+	return vkms_crtc;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index f2818374f5c9..5282f71b50a6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -53,14 +53,6 @@ MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
-static void vkms_release(struct drm_device *dev)
-{
-	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
-
-	if (vkms->crtc.composer_workq)
-		destroy_workqueue(vkms->crtc.composer_workq);
-}
-
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *dev = old_state->dev;
@@ -109,7 +101,6 @@ static const struct drm_debugfs_info vkms_config_debugfs_list[] = {
 
 static const struct drm_driver vkms_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_ATOMIC | DRIVER_GEM,
-	.release		= vkms_release,
 	.fops			= &vkms_driver_fops,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 3501cd9401d5..cff2e0686c04 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -126,7 +126,6 @@ struct vkms_config {
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	struct vkms_crtc crtc;
 	const struct vkms_config *config;
 };
 
@@ -143,8 +142,8 @@ struct vkms_device {
 	container_of(target, struct vkms_plane_state, base.base)
 
 /* CRTC */
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
+struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev, struct drm_plane *primary,
+				 struct drm_plane *cursor);
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
@@ -165,6 +164,6 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_crtc *vkms_crtc);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index cd506dcfd50f..0c585e48fa01 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -27,42 +27,31 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
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
 int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
-	struct vkms_crtc *vkms_crtc = &vkmsdev->crtc;
+	struct vkms_plane *primary, *cursor, *overlay = NULL;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct drm_crtc *crtc = &vkms_crtc->base;
-	struct vkms_plane *primary, *cursor = NULL;
-	int ret;
-	int writeback;
+	struct vkms_crtc *crtc;
 	unsigned int n;
+	int ret;
 
+	/*
+	 * Initialize used plane. One primary plane is required to perform the composition.
+	 *
+	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
+	 * composition.
+	 */
 	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
 	if (vkmsdev->config->overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
-			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
-			if (ret)
-				return ret;
+			overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
+			if (IS_ERR(overlay))
+				return PTR_ERR(overlay);
 		}
 	}
 
@@ -72,22 +61,24 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 			return PTR_ERR(cursor);
 	}
 
-	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
-	if (ret)
-		return ret;
+	crtc = vkms_crtc_init(vkmsdev, &primary->base,
+			      cursor ? &cursor->base : NULL);
+	if (IS_ERR(crtc)) {
+		DRM_ERROR("Failed to allocate CRTC\n");
+		return PTR_ERR(crtc);
+	}
 
 	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
 	if (!connector) {
 		DRM_ERROR("Failed to allocate connector\n");
-		ret = -ENOMEM;
-		goto err_connector;
+		return -ENOMEM;
 	}
 
 	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init connector\n");
-		goto err_connector;
+		return ret;
 	}
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
@@ -95,34 +86,34 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
 	if (!encoder) {
 		DRM_ERROR("Failed to allocate encoder\n");
-		ret = -ENOMEM;
-		goto err_connector;
+		return -ENOMEM;
 	}
 
 	ret = drmm_encoder_init(dev, encoder, NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init encoder\n");
-		goto err_connector;
+		return ret;
 	}
-	encoder->possible_crtcs = 1;
 
+	encoder->possible_crtcs = drm_crtc_mask(&crtc->base);
+
+	/* Attach the encoder and the connector */
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		return ret;
 	}
 
+	/* Initialize the writeback component */
 	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
-		if (writeback)
+		ret = vkms_enable_writeback_connector(vkmsdev, crtc);
+		if (ret) {
 			DRM_ERROR("Failed to init writeback connector\n");
+			return ret;
+		}
 	}
 
 	drm_mode_config_reset(dev);
 
 	return 0;
-
-err_connector:
-	drm_crtc_cleanup(crtc);
-	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index e055ad41241b..18aed20cd733 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -106,7 +106,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_device *vkmsdev;
+	struct vkms_crtc *vkms_crtc = container_of(connector, struct vkms_crtc, wb_connector);
 
 	if (!job->fb)
 		return;
@@ -115,8 +115,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->crtc, false);
+	vkms_set_composer(vkms_crtc, false);
 	kfree(vkmsjob);
 }
 
@@ -125,8 +124,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_crtc *vkms_crtc = &vkmsdev->crtc;
+	struct vkms_crtc *vkms_crtc = drm_crtc_to_vkms_crtc(connector_state->crtc);
 	struct drm_writeback_connector *wb_conn = &vkms_crtc->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = vkms_crtc->composer_state;
@@ -140,7 +138,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->crtc, true);
+	vkms_set_composer(vkms_crtc, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
@@ -168,9 +166,9 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_check = vkms_wb_atomic_check,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_crtc *vkms_crtc)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->crtc.wb_connector;
+	struct drm_writeback_connector *wb = &vkms_crtc->wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 

-- 
2.44.2

