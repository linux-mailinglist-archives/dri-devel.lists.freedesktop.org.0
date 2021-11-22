Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A34595C0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2121589D1D;
	Mon, 22 Nov 2021 19:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD189D1D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:29 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id r15so38973170uao.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+H57AYERyA+sHaSgv5R2HWLmtnMV8kLItu1b/vTkNvA=;
 b=R22/ZphxHNLcLZehT0DjIFIZ5P+mnFbWaqhv9L95qn61iQo45JFWUDPtNRai7UjuYq
 9XszZFMP3oFdLxLvTBNOIBc83rJEmAIMBBlyBd2UfGn7ZUtAFSIJams7IEHhY6PJ2i7u
 pb+Y+qVfE1aiij2yQvWU/5mVwcgd/3B639I7qWtiyvPZQUcXY/Z4tkqLIHCPvkSYCsUw
 o42bSGiJxu9gHHN/8lFkIhwb5EuUlJt/PlVz8ZXjmgpm6u5btd9BMF/ZFkEKKCdGkbZK
 dvsAb5P/GHAx+xSD7E9UzHzMGxgx8zOUVZky/eIOTc8cVyQo8432xH6erTtNEVYXnJgF
 al8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+H57AYERyA+sHaSgv5R2HWLmtnMV8kLItu1b/vTkNvA=;
 b=UuzjhNyNiHLCaPWQEhc4PGHfh4NB98s3+yqsd+TZPtIFN6BzRFnAg4TWlYrNUeCbij
 99IjFEirwcw97e6YaqGA0YbnVA5hy10/CflA60qIyn+8/LJq4d9Aq56vXgl6tfYo0UCD
 U+kkoID9ydzqALxrmosp/lCuh9Pe/R1cdhAyX3ceaH6b8HX/e5iRmNuH3l7+f/rmy++g
 PmbldO8QziwmzLtBnq5R8cpMnCZhkyy06q5MuE0n68yrJJPzz/1AHC/7EYmgKEedORVJ
 ZY1l1JbMDeDsWPl/aCSNgDU/O7088PPXn8CP1ojY+XuTYPIz7szIK/84UREmtbLXxJmt
 w+GA==
X-Gm-Message-State: AOAM53277c5/MwKXgWmfAmKfKqIlp9wIqyuA/C+Nc9lGIQd2UPkC7suC
 IMs0DFX+B8EFUXPE/nZLc1CEqEqQihI=
X-Google-Smtp-Source: ABdhPJyoQHIpOfyvWH8nVXB4QLVHDlqiM61mqX+Rs7zgo2ri8MB74NwcB59+uWnkHejvSYdcmWIJNg==
X-Received: by 2002:ab0:3813:: with SMTP id x19mr87772698uav.56.1637610269022; 
 Mon, 22 Nov 2021 11:44:29 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:28 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 5/9] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Mon, 22 Nov 2021 16:43:56 -0300
Message-Id: <20211122194400.30836-6-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122194400.30836-1-igormtorrente@gmail.com>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit is the groundwork to introduce new formats to the planes and
writeback buffer. As part of it, a new buffer metadata field is added to
`vkms_writeback_job`, this metadata is represented by the `vkms_composer`
struct.

This will allow us, in the future, to have different compositing and wb
format types.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Change the code to get the drm_framebuffer reference and not copy its
    contents(Thomas Zimmermann).

V3: Drop the refcount in the wb code(Thomas Zimmermann).
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++------
 drivers/gpu/drm/vkms/vkms_plane.c     | 10 +++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 20 +++++++++++++++++---
 4 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 2d946368a561..95029d2ebcac 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -153,7 +153,7 @@ static void compose_plane(struct vkms_frame_info *primary_plane_info,
 			  struct vkms_frame_info *plane_frame_info,
 			  void *vaddr_out)
 {
-	struct drm_framebuffer *fb = &plane_frame_info->fb;
+	struct drm_framebuffer *fb = plane_frame_info->fb;
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
@@ -175,7 +175,7 @@ static int compose_active_planes(void **vaddr_out,
 				 struct vkms_frame_info *primary_plane_info,
 				 struct vkms_crtc_state *crtc_state)
 {
-	struct drm_framebuffer *fb = &primary_plane_info->fb;
+	struct drm_framebuffer *fb = primary_plane_info->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	const void *vaddr;
 	int i;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 6f7a279a1ad7..27ed464db7e6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -20,13 +20,8 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
-struct vkms_writeback_job {
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
-	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
-};
-
 struct vkms_frame_info {
-	struct drm_framebuffer fb;
+	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
 	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
@@ -34,6 +29,11 @@ struct vkms_frame_info {
 	unsigned int cpp;
 };
 
+struct vkms_writeback_job {
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct vkms_frame_info frame_info;
+};
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index a56b0f76eddd..28752af0118c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
 	struct drm_crtc *crtc = vkms_state->base.base.crtc;
 
-	if (crtc) {
+	if (crtc && vkms_state->frame_info->fb) {
 		/* dropping the reference we acquired in
 		 * vkms_primary_plane_update()
 		 */
-		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
-			drm_framebuffer_put(&vkms_state->frame_info->fb);
+		if (drm_framebuffer_read_refcount(vkms_state->frame_info->fb))
+			drm_framebuffer_put(vkms_state->frame_info->fb);
 	}
 
 	kfree(vkms_state->frame_info);
@@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	frame_info = vkms_plane_state->frame_info;
 	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
-	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
+	frame_info->fb = fb;
 	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
-	drm_framebuffer_get(&frame_info->fb);
+	drm_framebuffer_get(frame_info->fb);
 	frame_info->offset = fb->offsets[0];
 	frame_info->pitch = fb->pitches[0];
 	frame_info->cpp = fb->format->cpp[0];
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227f555f..de379331b236 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -75,12 +75,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	if (!vkmsjob)
 		return -ENOMEM;
 
-	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
+	ret = drm_gem_fb_vmap(job->fb, vkmsjob->frame_info.map, vkmsjob->data);
 	if (ret) {
 		DRM_ERROR("vmap failed: %d\n", ret);
 		goto err_kfree;
 	}
 
+	vkmsjob->frame_info.fb = job->fb;
+	drm_framebuffer_get(vkmsjob->frame_info.fb);
+
 	job->priv = vkmsjob;
 
 	return 0;
@@ -99,7 +102,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	if (!job->fb)
 		return;
 
-	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->frame_info.map);
+
+	drm_framebuffer_put(vkmsjob->frame_info.fb);
 
 	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
 	vkms_set_composer(&vkmsdev->output, false);
@@ -116,14 +121,23 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_writeback_connector *wb_conn = &output->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
+	struct vkms_writeback_job *active_wb;
+	struct vkms_frame_info *wb_frame_info;
 
 	if (!conn_state)
 		return;
 
 	vkms_set_composer(&vkmsdev->output, true);
 
+	active_wb = conn_state->writeback_job->priv;
+	wb_frame_info = &active_wb->frame_info;
+
 	spin_lock_irq(&output->composer_lock);
-	crtc_state->active_writeback = conn_state->writeback_job->priv;
+	crtc_state->active_writeback = active_wb;
+	wb_frame_info->offset = fb->offsets[0];
+	wb_frame_info->pitch = fb->pitches[0];
+	wb_frame_info->cpp = fb->format->cpp[0];
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
-- 
2.30.2

