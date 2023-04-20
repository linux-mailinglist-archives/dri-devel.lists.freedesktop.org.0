Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89AA6E8CFE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588D510EBDB;
	Thu, 20 Apr 2023 08:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB78910EBE2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:41:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:4a06:df00:9eb6:d0ff:fe91:8037])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B852660325F;
 Thu, 20 Apr 2023 09:41:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681980113;
 bh=Rs2LkUZANZSaSDuWiahjhyFGmoOs+XfEdUhumEiy2ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oZ0pkYW/aKEoFCI8qlOMe7mXcFslindnDMog5jJIx7o8exdiUzU3KbeIV/XuLBKeb
 TWFboYvF1bQapWHv+Oa6tXQ0RNeM+CSP0/B1K44tJ9BHfSoeGtkuGCg4QBZBVR2UMw
 WMLFYwXo2nwAiVWpr7lg1JAJYV73jJO7BdRB9uIR8He7yneWrwSTteIqFeSqXu8Ofz
 L3BOfu5ta9f/V2o/lHW5p0ij15ual5MkL3vwApdkEibUUimJDvmPznACEaY7U9P4/W
 Tqlqp+c8Bdt7c3IvUh00bLpIghwsmkOjLpI9RUxesSY9OOqNviDUzQ2psQicscPLbF
 +NnsN7koc1EwA==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] vkms: Add support for multiple pipes
Date: Thu, 20 Apr 2023 11:41:46 +0300
Message-Id: <20230420084147.19042-3-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420084147.19042-1-marius.vlad@collabora.com>
References: <20230420084147.19042-1-marius.vlad@collabora.com>
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
Cc: mwen@igalia.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 mcanal@igalia.com, melissa.srw@gmail.com, marius.vlad@collabora.com,
 igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds support for creating multiple virtual pipes, in case one would
need to display multiple independent things on different outputs.

We use a module parameter to specify how many to create,  defaulting to
just one with the possibility of specifying a maximum of 4 possible pipes.

This is of particular importance when testing out the DRM back-end in
compositors, but also to be able to independently set different DPMS states.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c       | 27 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h       | 11 ++++++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  5 ++---
 drivers/gpu/drm/vkms/vkms_writeback.c | 24 ++++++++++++------------
 5 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..0b6c40ac80b6 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -89,8 +89,7 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	unsigned int pipe = crtc->index;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
 	if (!READ_ONCE(vblank->enabled)) {
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6d3a2d57d992..63091ce6735a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,14 +51,19 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static int max_pipes = 1;
+module_param_named(max_pipes, max_pipes, int, 0444);
+MODULE_PARM_DESC(max_pipes, "Specify how many pipes to create");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
 {
-	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
+	int i;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
-	if (vkms->output.composer_workq)
-		destroy_workqueue(vkms->output.composer_workq);
+	for (i = 0; i < vkmsdev->config->max_pipes; i++)
+		destroy_workqueue(vkmsdev->output[i].composer_workq);
 }
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -99,6 +104,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	seq_printf(m, "pipes=%d\n", vkmsdev->config->max_pipes);
 
 	return 0;
 }
@@ -133,6 +139,7 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int i, ret = 0;
 
 	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
@@ -148,7 +155,14 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	for (i = 0; i < vkmsdev->config->max_pipes; i++) {
+		ret = vkms_output_init(vkmsdev, i);
+		if (ret)
+			return ret;
+	}
+
+	drm_mode_config_reset(dev);
+	return ret;
 }
 
 static int vkms_create(struct vkms_config *config)
@@ -184,7 +198,7 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
+	ret = drm_vblank_init(&vkms_device->drm, config->max_pipes);
 	if (ret) {
 		DRM_ERROR("Failed to vblank\n");
 		goto out_devres;
@@ -226,6 +240,9 @@ static int __init vkms_init(void)
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
+	config->max_pipes = max_pipes;
+	if (config->max_pipes > NUM_MAX_PIPES)
+		config->max_pipes = NUM_MAX_PIPES;
 
 	ret = vkms_create(config);
 	if (ret)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4a248567efb2..8256dac944cf 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -21,7 +21,8 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
-#define NUM_OVERLAY_PLANES 8
+#define NUM_OVERLAY_PLANES	8
+#define NUM_MAX_PIPES		4
 
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
@@ -113,6 +114,7 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
+	int max_pipes;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -120,13 +122,16 @@ struct vkms_config {
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	struct vkms_output output;
+	struct vkms_output output[NUM_MAX_PIPES];
 	const struct vkms_config *config;
 };
 
 #define drm_crtc_to_vkms_output(target) \
 	container_of(target, struct vkms_output, crtc)
 
+#define wb_connector_to_vkms_output(target) \
+	container_of(target, struct vkms_output, wb_connector)
+
 #define drm_device_to_vkms_device(target) \
 	container_of(target, struct vkms_device, drm)
 
@@ -157,6 +162,6 @@ void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
 
 /* Writeback */
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, int index);
 
 #endif /* _VKMS_DRV_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ebb75ede65ab..c7b11d0a9753 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -50,7 +50,7 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
-	struct vkms_output *output = &vkmsdev->output;
+	struct vkms_output *output = &vkmsdev->output[index];
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder = &output->encoder;
@@ -105,12 +105,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	}
 
 	if (vkmsdev->config->writeback) {
-		writeback = vkms_enable_writeback_connector(vkmsdev);
+		writeback = vkms_enable_writeback_connector(vkmsdev, index);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
 	}
 
-	drm_mode_config_reset(dev);
 
 	return 0;
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 84a51cd281b9..5f291689f870 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -101,7 +101,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
 	struct vkms_writeback_job *vkmsjob = job->priv;
-	struct vkms_device *vkmsdev;
+	struct vkms_output *output = wb_connector_to_vkms_output(connector);
 
 	if (!job->fb)
 		return;
@@ -110,19 +110,18 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+	vkms_set_composer(output, false);
 	kfree(vkmsjob);
 }
 
 static void vkms_wb_atomic_commit(struct drm_connector *conn,
 				  struct drm_atomic_state *state)
 {
-	struct drm_connector_state *connector_state = drm_atomic_get_new_connector_state(state,
-											 conn);
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(conn->dev);
-	struct vkms_output *output = &vkmsdev->output;
-	struct drm_writeback_connector *wb_conn = &output->wb_connector;
+	struct drm_connector_state *connector_state =
+		drm_atomic_get_new_connector_state(state, conn);
+	struct drm_writeback_job *wb_job = connector_state->writeback_job;
+	struct drm_writeback_connector *wb_conn = wb_job->connector;
+	struct vkms_output *output = wb_connector_to_vkms_output(wb_conn);
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
@@ -135,7 +134,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	vkms_set_composer(output, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
@@ -147,6 +146,7 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	wb_frame_info->cpp = fb->format->cpp[0];
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
+
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->wb_write = get_line_to_frame_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
@@ -160,9 +160,9 @@ static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
 	.atomic_commit = vkms_wb_atomic_commit,
 };
 
-int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
+int vkms_enable_writeback_connector(struct vkms_device *vkmsdev, int index)
 {
-	struct drm_writeback_connector *wb = &vkmsdev->output.wb_connector;
+	struct drm_writeback_connector *wb = &vkmsdev->output[index].wb_connector;
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
@@ -171,5 +171,5 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev)
 					    &vkms_wb_encoder_helper_funcs,
 					    vkms_wb_formats,
 					    ARRAY_SIZE(vkms_wb_formats),
-					    1);
+					    1 << index);
 }
-- 
2.39.2

