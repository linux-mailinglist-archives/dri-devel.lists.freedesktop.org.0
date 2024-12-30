Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F009FEA0A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:40:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF41210E56F;
	Mon, 30 Dec 2024 18:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dRgFCBFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD0110E56F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:40:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0784C60007;
 Mon, 30 Dec 2024 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735584019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejVlBxA7vj98Ej89LtA3GdoAo/x7ZZVblyFnmVrrUsw=;
 b=dRgFCBFFOVJ4hcN3/sUM8rFUSk0nLROBQE0VnnsLYb0a5uooi2DSghj/PGRITi1qpDTm/A
 nKoh//r6xKvPDpruNrowGRVJBw3J9a4hk2NZD1kV7feyPiFqBFl1MWVR5KQJp05j5zJERq
 nYb0zIZBNMbYIdAFhM1rUSCrb7x8ZEx4ocbft+1qRgThGtpbi2efCt9eD81nkKlkWOQlsA
 lCL18ttH0gOkqmvYg+i408oP5X9d+W6fjIH4zZBJi87LkG2gdDqUa9BZYX3Y0Az/kqmIJc
 NZiQHUVmuTueaKXFIlJRfT0wUBhmEi0d47+ErThGMXRuKknr4eAjD1N5QDd/Vw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 30 Dec 2024 19:39:46 +0100
Subject: [PATCH v3 3/3] drm/vkms: Switch to dynamic allocation for CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-vkms-allocated-v3-3-5dda4c1bd459@bootlin.com>
References: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
In-Reply-To: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
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
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=9168;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5Ri+QCGq3Od1tyIvjPTguK4NErzVXjgK0W2VCbnkbQM=;
 b=kA0DAAgBIK0uxlsQLOIByyZiAGdy6Q+jZ0ycX6p5XQ5eZWv3r2sqFetjka+SZX0rSR3pMoJ8r
 IkCMwQAAQgAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJncukPAAoJECCtLsZbECzixuAP/RVo
 UFhT7WMFmFl4k6yqnmYRsE38JDcYpRjYwd9UMyDib18CWtneZrswZDJW2fPPnSgf0E3gDNy2er0
 X6B5lWXVChqVUvk4mZ+ZdVPbd4HxS01h00QvjoJ40UuDZKOEb0keHEn5cdje9mdxSECQfvN1R5G
 t6OdVYylR14CiuMUSWKOX+2fuKJGuyH6bIdGHZvrEqMJ2dmJTzpvsSlhaHjJ7QZpF5xe7Uet/zV
 MtEVKNw2JGyqAFIDxBzUZvz/1T06Zcc7wKfrGozilTbzuh0jUQVoxqgfHpb7gRuVZ9zTooPf8/u
 MI6zQFIjHHKRTkl6AegI4WObVpYlqRNnhqxFkKVOR7jjiERzRWZ+VAFevyCwRAgiG4zdihLkjMw
 LRFM01N8OrZqso3ea7r5cpE9TD1M/mGiM333F/yGAZGXDdmXZHIA6tI9x9dLarJmoNodkQyJcUY
 kWck0AutG8Hr/lwfnCzjLZCM7aBiZegcZlBiLAfT5X3+FtO8iQo57aAOmGtMdS+pinHTkLvHrVF
 zHRE2jSOsVLqnon3/YDY6R3YD9tcC+qSRADIxTnTXzVglLpzd8/aO608Y4gfeKw9JKdOv7BJVIe
 GCMjk3NbGlnuhvjBaWZCohfSNbOGjZhj3STUUaXjwLorzAU/Sho5vpK6eDn0BgE1Ft8dqm+IwT7
 x/0xs
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

A specific allocation for the CRTC is not strictly necessary at this
point, but in order to implement dynamic configuration of VKMS (configFS),
it will be easier to have one allocation per CRTC.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c      | 32 +++++++++++++++++---------------
 drivers/gpu/drm/vkms/vkms_drv.h       |  9 +++++----
 drivers/gpu/drm/vkms/vkms_output.c    | 22 ++++++++++++----------
 drivers/gpu/drm/vkms/vkms_writeback.c | 17 +++++++++--------
 4 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ace8d293f7da611110c1e117b6cf2f3c9e9b4381..d014dec117e7d4ec7e9e38037a4a4cb4bc6be4ca 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -84,9 +84,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      int *max_error, ktime_t *vblank_time,
 				      bool in_vblank_irq)
 {
-	struct drm_device *dev = crtc->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
 	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
@@ -279,25 +277,29 @@ static void vkms_crtc_destroy_workqueue(struct drm_device *dev,
 	destroy_workqueue(vkms_out->composer_workq);
 }
 
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor)
+struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *primary,
+				   struct drm_plane *cursor)
 {
-	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_output *vkms_out;
+	struct drm_crtc *crtc;
 	int ret;
 
-	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
-					 &vkms_crtc_funcs, NULL);
-	if (ret) {
-		DRM_ERROR("Failed to init CRTC\n");
-		return ret;
+	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
+					       primary, cursor,
+					       &vkms_crtc_funcs, NULL);
+	if (IS_ERR(vkms_out)) {
+		DRM_DEV_ERROR(dev->dev, "Failed to init CRTC\n");
+		return vkms_out;
 	}
 
+	crtc = &vkms_out->crtc;
+
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
 	ret = drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
 	if (ret) {
 		DRM_ERROR("Failed to set gamma size\n");
-		return ret;
+		return ERR_PTR(ret);
 	}
 
 	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
@@ -307,12 +309,12 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	vkms_out->composer_workq = alloc_ordered_workqueue("vkms_composer", 0);
 	if (!vkms_out->composer_workq)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	ret = drmm_add_action_or_reset(dev, vkms_crtc_destroy_workqueue,
 				       vkms_out);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
-	return ret;
+	return vkms_out;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 19fd99b8e506c4454d7878b67f692a0441c22665..fbe7de67fb9c6a6a6964d71b452b9a3ce573e0f8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -214,7 +214,6 @@ struct vkms_config {
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	struct vkms_output output;
 	const struct vkms_config *config;
 };
 
@@ -241,8 +240,9 @@ struct vkms_device {
  * @primary: primary plane to attach to the CRTC
  * @cursor: plane to attach to the CRTC
  */
-int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
-		   struct drm_plane *primary, struct drm_plane *cursor);
+struct vkms_output *vkms_crtc_init(struct drm_device *dev,
+				   struct drm_plane *primary,
+				   struct drm_plane *cursor);
 
 /**
  * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
@@ -273,6 +273,7 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_output *vkms_out);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 102b6ad466cb4f7c6704f30cea669e5d7f81540a..22f0d678af3ac8177e43c4ea730af3f2109de5f3 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -30,11 +30,10 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
-	struct drm_crtc *crtc = &output->crtc;
+	struct vkms_output *output;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
 	int ret;
 	int writeback;
@@ -56,9 +55,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 			return PTR_ERR(cursor);
 	}
 
-	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
-	if (ret)
-		return ret;
+	output = vkms_crtc_init(dev, &primary->base,
+				cursor ? &cursor->base : NULL);
+	if (IS_ERR(output)) {
+		DRM_ERROR("Failed to allocate CRTC\n");
+		return PTR_ERR(output);
+	}
 
 	if (vkmsdev->config->overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
@@ -67,7 +69,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 				DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
 				return PTR_ERR(overlay);
 			}
-			overlay->base.possible_crtcs = drm_crtc_mask(crtc);
+			overlay->base.possible_crtcs = drm_crtc_mask(&output->crtc);
 		}
 	}
 
@@ -97,23 +99,23 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		DRM_ERROR("Failed to init encoder\n");
 		return ret;
 	}
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
+	encoder->possible_crtcs = drm_crtc_mask(&output->crtc);
 
+	/* Attach the encoder and the connector */
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
 		DRM_ERROR("Failed to attach connector to encoder\n");
 		return ret;
 	}
 
+	/* Initialize the writeback component */
 	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
+		writeback = vkms_enable_writeback_connector(vkmsdev, output);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
 	}
 
 	drm_mode_config_reset(dev);
 
-	return 0;
-
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index f12417b2d24803a33e4ff56108cc89704a500faf..c9b6e161fa8698491f20082dfe0b713f27bcb918 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -105,7 +105,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_device *vkmsdev;
+	struct vkms_output *vkms_output = container_of(connector,
+						       struct vkms_output,
+						       wb_connector);
 
 	if (!job->fb)
 		return;
@@ -114,8 +116,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+	vkms_set_composer(vkms_output, false);
 	kfree(vkmsjob);
 }
 
@@ -124,8 +125,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 {
 	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
 											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_output *output = drm_crtc_to_vkms_output(connector_state->crtc);
 	struct drm_writeback_connector *wb_conn = &output->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
@@ -139,7 +139,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	vkms_set_composer(output, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
@@ -162,9 +162,10 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_check = vkms_wb_atomic_check,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_output *vkms_output)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 

-- 
2.47.1

