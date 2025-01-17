Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB367A14BC7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DAD10E2FA;
	Fri, 17 Jan 2025 09:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="m0mENJu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB61F10E2FA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:05:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9739B1C0010;
 Fri, 17 Jan 2025 09:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737104706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wW2GE+k42eHWzMuTxRJ4pv3t8Znb8O3qE1HKvW+jpiY=;
 b=m0mENJu+pEwqctltsiTbU4znLsg5xC6pP1pHZzpubq7WhBH+TLn12rNx5QOzCZpIUAnOd6
 vNxNj4FRXzvhHg774MHpZZmpQcS29VW5nlZUHdP1qWzNnmy5GIS39NJAQr9L7R6eNxNSrw
 dD61UO8JFumkaZkJjl5s4RahFE5dS+tK4b+tlTeYyfzykmGu72ktEUZeeCzOCXV2ewNTzR
 T6lUABiJK7M+jdg1DjdKmTC2Sml7c9O+ED4JNkHzdKOPwgZQpM3KBqlSlvAsHuzAT5Vj5h
 SkmDQZJrv00EAV9F6KBHsvMubtM/pFenktKC7O85DcROSt2+HAUdDTxOEOM1eA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 17 Jan 2025 10:04:29 +0100
Subject: [PATCH v4 3/3] drm/vkms: Switch to dynamic allocation for CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-vkms-allocated-v4-3-8ec8fd21aaf6@bootlin.com>
References: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
In-Reply-To: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9891;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pxspv5P5WV7R1DJlKtdquHCZNwmXnqhT4lP7W4392Gk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnih09Emp+aTjh3QtNN+86NRtYwbKdZItwIxMnZ
 5kXAY4MDgCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4odPQAKCRAgrS7GWxAs
 4hKXD/9WQ/ZHuxDEuDtzkbnIbGnVML6Q3c7pr+WG9soOV8bKzH2QFd8O9bpC5DQWtR4ellYJgEr
 +2zt+9La5E4XHU/Vd8K4QxwZNszmEZkZk2c0/ohgVjm92aMjwFoTqmrAJfrawE79anzk4em1Dcn
 PcJYXAYMkpYFyNjU0qtQw+/uESW5h2I8i5ZKu5Vlxhd6QDU7ahfUHD2UnKgSN3W/aUjOkqUDixN
 w+xoOC29y4WRItMRtmvbYLR+UbkM2gYWxQFiZ8Vg/lrPy9/zFI4rQ1sb2ki1DC1eLqGvFkhMyvU
 hfkMWMVTMKcQ+UlpBH5qMd3X83kM1ietmcLeqLSEytN/lKfAKQR8JUy63FRFyeSLwnki/yFXw0p
 VVfZys2/VMMSK0na+u2Ab0ZHSYJf0IPeO0Mp9ifnaFEUdNCXs9b184jGmpW2sqQq5CHjX91g6rE
 hgdwaHrXj//mIQkCGqi4v/UGDegxqihV3iOp5uOtN3ExqbWTZIqnp5fmlFJEzZi9Df2RB2fbcL2
 5OA0SJ0yvZFi1pzx5VM+EkcuC1T7vpVMRFY21q56g1hqYYnwhHnAskIRpQME8rC+BXqQCJkhkuO
 OgLFQWynt6TfrBmahacPczpkAaXtd3T9NxCoA8VFlmT31j/2lUy9s4wdNTXp9cKaiHR2ECmMQza
 2P3ZpXhQiXyxJ9w==
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c      | 32 +++++++++++++++++---------------
 drivers/gpu/drm/vkms/vkms_drv.h       |  8 ++++----
 drivers/gpu/drm/vkms/vkms_output.c    | 22 ++++++++++++----------
 drivers/gpu/drm/vkms/vkms_writeback.c | 23 ++++++++++++-----------
 4 files changed, 45 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 434c35d5e9477d2961826262591db8ab43838e09..cf229aec71c3f03bb1306095e8dd44d63f80cd2a 100644
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
@@ -271,25 +269,29 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
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
@@ -299,9 +301,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	vkms_out->composer_workq = drmm_alloc_ordered_workqueue(dev, "vkms_composer", 0);
 	if (IS_ERR(vkms_out->composer_workq))
-		return PTR_ERR(vkms_out->composer_workq);
+		return ERR_CAST(vkms_out->composer_workq);
 	if (!vkms_out->composer_workq)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
-	return ret;
+	return vkms_out;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 333983bcf8d46ef85101e7c344e256df57551b78..abbb652be2b5389f96cec78837117ceb9acef656 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -215,7 +215,6 @@ struct vkms_config {
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	struct vkms_output output;
 	const struct vkms_config *config;
 };
 
@@ -242,8 +241,9 @@ struct vkms_device {
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
@@ -274,6 +274,6 @@ void vkms_set_composer(struct vkms_output *out, bool enabled);
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct vkms_output *vkms_out);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 21ca975e424d148b0669b87784d86f5da2a8b333..22f0d678af3ac8177e43c4ea730af3f2109de5f3 100644
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
-		writeback = vkms_enable_writeback_connector(vkmsdev, crtc);
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
index 981975c2b0a0c75e4a3aceca2a965f5876ae0a8f..e9b5c74d7c58e7faed870a4368decbd67dab23d2 100644
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
@@ -162,22 +162,23 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_check = vkms_wb_atomic_check,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, struct drm_crtc *crtc)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
+				    struct vkms_output *vkms_output)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkms_output->wb_connector;
 	int ret;
 
-	ret = drmm_encoder_init(&vkmsdev->drm, &vkmsdev->output.wb_encoder,
+	ret = drmm_encoder_init(&vkmsdev->drm, &vkms_output->wb_encoder,
 				NULL, DRM_MODE_ENCODER_VIRTUAL, NULL);
 	if (ret)
 		return ret;
-	vkmsdev->output.wb_encoder.possible_crtcs |= drm_crtc_mask(crtc);
+	vkms_output->wb_encoder.possible_crtcs |= drm_crtc_mask(&vkms_output->crtc);
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
 	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
 					     &vkms_wb_connector_funcs,
-					     &vkmsdev->output.wb_encoder,
+					     &vkms_output->wb_encoder,
 					     vkms_wb_formats,
 					     ARRAY_SIZE(vkms_wb_formats));
 }

-- 
2.47.1

