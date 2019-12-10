Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D21182C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3796E86D;
	Tue, 10 Dec 2019 08:49:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2A46E865
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:49:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 729DAB0B6;
 Tue, 10 Dec 2019 08:49:09 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com, noralf@tronnes.org, zboszor@pr.hu
Subject: [PATCH v3 7/9] drm/udl: Remove struct udl_device.active_fb_16
Date: Tue, 10 Dec 2019 09:49:03 +0100
Message-Id: <20191210084905.5570-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210084905.5570-1-tzimmermann@suse.de>
References: <20191210084905.5570-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The udl driver stores the currently active framebuffer to know from
where to accept damage updates.

With the conversion to plane-state damage handling, this is not necessary
any longer. The currently active framebuffer and damaged area are always
stored in the plane state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/udl/udl_drv.h     | 4 ----
 drivers/gpu/drm/udl/udl_fb.c      | 8 --------
 drivers/gpu/drm/udl/udl_main.c    | 3 ---
 drivers/gpu/drm/udl/udl_modeset.c | 9 ---------
 4 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 1ade917cd8d7..dd58b9a51669 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -54,10 +54,6 @@ struct udl_device {
 
 	struct drm_simple_display_pipe display_pipe;
 
-	/* active framebuffer on the 16-bit channel */
-	const struct drm_framebuffer *active_fb_16;
-	spinlock_t active_fb_16_lock;
-
 	struct mutex gem_lock;
 
 	int sku_pixel_limit;
diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb.c
index 98cc2ab3a916..397c62142978 100644
--- a/drivers/gpu/drm/udl/udl_fb.c
+++ b/drivers/gpu/drm/udl/udl_fb.c
@@ -87,7 +87,6 @@ int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 		      int width, int height)
 {
 	struct drm_device *dev = fb->dev;
-	struct udl_device *udl = to_udl(dev);
 	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
 	int i, ret, tmp_ret;
 	char *cmd;
@@ -96,13 +95,6 @@ int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	int log_bpp;
 	void *vaddr;
 
-	spin_lock(&udl->active_fb_16_lock);
-	if (udl->active_fb_16 != fb) {
-		spin_unlock(&udl->active_fb_16_lock);
-		return 0;
-	}
-	spin_unlock(&udl->active_fb_16_lock);
-
 	ret = udl_log_cpp(fb->format->cpp[0]);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index ff3e98666e8c..538718919916 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -314,9 +314,6 @@ int udl_init(struct udl_device *udl)
 
 	DRM_DEBUG("\n");
 
-	udl->active_fb_16 = NULL;
-	spin_lock_init(&udl->active_fb_16_lock);
-
 	mutex_init(&udl->gem_lock);
 
 	if (!udl_parse_vendor_descriptor(dev, udl->udev)) {
diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 75f239e92c89..deac5e303604 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -284,9 +284,6 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	wrptr = udl_dummy_render(wrptr);
 
-	spin_lock(&udl->active_fb_16_lock);
-	udl->active_fb_16 = fb;
-	spin_unlock(&udl->active_fb_16_lock);
 	udl->mode_buf_len = wrptr - buf;
 
 	udl_handle_damage(fb, 0, 0, fb->width, fb->height);
@@ -331,16 +328,10 @@ static void
 udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *old_plane_state)
 {
-	struct drm_device *dev = pipe->crtc.dev;
-	struct udl_device *udl = dev->dev_private;
 	struct drm_plane_state *state = pipe->plane.state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_rect rect;
 
-	spin_lock(&udl->active_fb_16_lock);
-	udl->active_fb_16 = fb;
-	spin_unlock(&udl->active_fb_16_lock);
-
 	if (!fb)
 		return;
 
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
