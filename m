Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322C6FC9D6
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 17:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702BA10E38C;
	Tue,  9 May 2023 15:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA31C10E023
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pagEJw3NLV4xMAr5TuZwsod5IwX0MmssQbbAtRahZVw=; b=WqgZVpBCd7Za2e8ueVOn6RloJh
 fk2hdEgp4k5hJjXflcZyR9xSzgBIxcQ+R8H3ACVO7DBT7zKIQP95qdlhkjMd3j23q5dF0pZU04imE
 5+v5eq2dl97k4lECWYiqnE73cAbjAmobJ15esS0RJR2gWDba8IZPdMMZcCf95thg6w951U9ZG/ba4
 bVr+I2gSkSH5lKiTN1DSLe0c4mElXwJ+XI7oAMB865xXgaTMAH8ACwS2Ba4i9PEJSYyAnaQAOuWMI
 p9ITIWndS/7arbdlF39IF4a1QRTA6rABdGx4xyBl8v/QW/6L8vh9uhIU4zYAcKAiWlVRBhdoZeOsc
 zLwgqlCw==;
Received: from 179-241-20-132.3g.claro.net.br ([179.241.20.132] helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pwOuZ-004xfg-1S; Tue, 09 May 2023 17:05:55 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 2/2] drm/vkms: Add support for Virtual Hardware mode
Date: Tue,  9 May 2023 12:05:01 -0300
Message-Id: <20230509150501.81875-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509150501.81875-1-mcanal@igalia.com>
References: <20230509150501.81875-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sumera Priyadarsini <sylphrenadin@gmail.com>

Add a virtual hardware or vblank-less mode as a module to enable VKMS
to emulate virtual devices. This means no vertical blanking events
occur and page-flips are completed arbitrarily when required for
updating the frame.

Add a new drm_crtc_funcs struct, vkms_vblankless_crtc_funcs, and a
drm_crtc_helper_funcs struct, vkms_vblankless_crtc_helper_funcs, which
hold the atomic helpers for virtual hardware mode. The existing
vkms_crtc_funcs struct and vkms_crtc_helper_funcs struct hold atomic
helpers for the default vblank mode. This makes the code flow clearer
and testing the virtual hardware mode easier.

Add a function vkms_crtc_composer() which calls the helper function,
vkms_composer_common() for plane composition in vblank-less mode.
vkms_crtc_composer() is directly called in the atomic hook in
vkms_crtc_atomic_flush().

However, some CRC captures still use vblanks which causes the
CRC-based IGT tests to crash. So, no CRC functions are called in
vblankless mode for now. Therefore, it is not possible to run tests
that demands CRC captures.

This patchset has been tested with the following IGT tests:
kms_writeback, kms_atomic, kms_lease, and kms_flip. It preserves
results except for subtests related to CRC reads and vertical
blanking, in which case, tests skip or fail.

The patch is based on Rodrigo Siqueira's patch [1] and the ensuing
review.

[1] https://patchwork.freedesktop.org/patch/316851/?series=48469&rev=3

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  | 17 ++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      | 38 ++++++++++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.c       | 16 ++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h       |  2 ++
 drivers/gpu/drm/vkms/vkms_writeback.c |  8 ++++--
 5 files changed, 72 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index f488675ccc62..d70e5b656a15 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -285,6 +285,23 @@ void vkms_composer_worker(struct work_struct *work)
 		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
 }
 
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
+{
+	struct drm_crtc *crtc = crtc_state->base.crtc;
+	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
+	bool wb_pending;
+	u32 crc32 = 0;
+	int ret;
+
+	spin_lock_irq(&out->composer_lock);
+	wb_pending = crtc_state->wb_pending;
+	spin_unlock_irq(&out->composer_lock);
+
+	ret = vkms_composer_common(crtc_state, out, wb_pending, &crc32);
+	if (ret)
+		return;
+}
+
 static const char * const pipe_crc_sources[] = {"auto"};
 
 const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 515f6772b866..2128b6d009d8 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -173,6 +173,14 @@ static const struct drm_crtc_funcs vkms_crtc_funcs = {
 	.verify_crc_source	= vkms_verify_crc_source,
 };
 
+static const struct drm_crtc_funcs vkms_vblankless_crtc_funcs = {
+	.set_config             = drm_atomic_helper_set_config,
+	.page_flip              = drm_atomic_helper_page_flip,
+	.reset                  = vkms_atomic_crtc_reset,
+	.atomic_duplicate_state = vkms_atomic_crtc_duplicate_state,
+	.atomic_destroy_state   = vkms_atomic_crtc_destroy_state,
+};
+
 static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
@@ -267,6 +275,17 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 	spin_unlock_irq(&vkms_output->lock);
 }
 
+static void vkms_vblankless_crtc_atomic_flush(struct drm_crtc *crtc,
+					      struct drm_atomic_state *state)
+{
+	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
+
+	vkms_crtc_composer(vkms_state);
+
+	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+}
+
 static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_check	= vkms_crtc_atomic_check,
 	.atomic_begin	= vkms_crtc_atomic_begin,
@@ -275,20 +294,33 @@ static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
 	.atomic_disable	= vkms_crtc_atomic_disable,
 };
 
+static const struct drm_crtc_helper_funcs vkms_vblankless_crtc_helper_funcs = {
+	.atomic_check	= vkms_crtc_atomic_check,
+	.atomic_flush	= vkms_vblankless_crtc_atomic_flush,
+};
+
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor)
 {
 	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
+	struct vkms_device *vkms_dev = drm_device_to_vkms_device(dev);
 	int ret;
 
-	ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
-					 &vkms_crtc_funcs, NULL);
+	if (vkms_dev->config->virtual_hw)
+		ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
+						 &vkms_vblankless_crtc_funcs, NULL);
+	else
+		ret = drmm_crtc_init_with_planes(dev, crtc, primary, cursor,
+						 &vkms_crtc_funcs, NULL);
 	if (ret) {
 		DRM_ERROR("Failed to init CRTC\n");
 		return ret;
 	}
 
-	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
+	if (vkms_dev->config->virtual_hw)
+		drm_crtc_helper_add(crtc, &vkms_vblankless_crtc_helper_funcs);
+	else
+		drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e3c9c9571c8d..c8c029da7980 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -51,6 +51,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool enable_virtual_hw;
+module_param_named(enable_virtual_hw, enable_virtual_hw, bool, 0444);
+MODULE_PARM_DESC(enable_virtual_hw, "Enable/Disable virtual hardware mode (vblank-less mode)");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_release(struct drm_device *dev)
@@ -99,6 +103,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	seq_printf(m, "virtual_hw=%d\n", vkmsdev->config->virtual_hw);
 
 	return 0;
 }
@@ -188,10 +193,12 @@ static int vkms_create(struct vkms_config *config)
 		goto out_devres;
 	}
 
-	ret = drm_vblank_init(&vkms_device->drm, 1);
-	if (ret) {
-		DRM_ERROR("Failed to vblank\n");
-		goto out_devres;
+	if (!vkms_device->config->virtual_hw) {
+		ret = drm_vblank_init(&vkms_device->drm, 1);
+		if (ret) {
+			DRM_ERROR("Failed to vblank\n");
+			goto out_devres;
+		}
 	}
 
 	ret = vkms_modeset_init(vkms_device);
@@ -230,6 +237,7 @@ static int __init vkms_init(void)
 	config->cursor = enable_cursor;
 	config->writeback = enable_writeback;
 	config->overlay = enable_overlay;
+	config->virtual_hw = enable_virtual_hw;
 
 	ret = vkms_create(config);
 	if (ret)
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5f1a0a44a78c..6dbf1a6cb634 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -114,6 +114,7 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
+	bool virtual_hw;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -156,6 +157,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
 void vkms_set_composer(struct vkms_output *out, bool enabled);
+void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
 void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state *plane, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 84a51cd281b9..fcbc115b98ff 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -111,7 +111,10 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
 	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
-	vkms_set_composer(&vkmsdev->output, false);
+
+	if (!vkmsdev->config->virtual_hw)
+		vkms_set_composer(&vkmsdev->output, false);
+
 	kfree(vkmsjob);
 }
 
@@ -135,7 +138,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(&vkmsdev->output, true);
+	if (!vkmsdev->config->virtual_hw)
+		vkms_set_composer(&vkmsdev->output, true);
 
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
-- 
2.40.1

