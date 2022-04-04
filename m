Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBD4F1A30
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74CC10E3AF;
	Mon,  4 Apr 2022 20:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4017510E3B1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:53 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id s7so604340qtk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UIpuda6SATM4zPZhDanQdgOPhvKiJ3rQUELJ/pw6Uc=;
 b=R0GljXzuJXAkEAi3ewPVYNRpVuz9UUZ+PZaoDkprmGjif4knEYdbb0XsnYQiI+a/oI
 NFCTOc4gAtfWZkFo+2v8llHJgcd+gzIp8aOoU0HHH+D0Cu9JSJgJOa9saAImIBe5EiSU
 EPziQ+W23GW6pbt0/+HDYK0agFr/dawvUcC0iUZZBj2+CwqThAu7DkuVrCNVmeeZvquM
 W8kk8gVRGuioarI1a4/wlEOJ5KMDtCg3XuFNVO7HFpc80Zzt0wZg5MuXzpPpD0I7xSne
 KYVUtmzlbYSIwm1R20GLHLPP15UBFIzyWRjYTttgJblkqxfZ+bcOxP+BzJrxlieec+IC
 axlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2UIpuda6SATM4zPZhDanQdgOPhvKiJ3rQUELJ/pw6Uc=;
 b=AUwkC16UiElfj6EWtFqPdQgDW/xWsBqHuAo4pxbThdJ2agIVzfbUkg2RL1WoXIJ+HZ
 OTfVByasGSnRuoL2aYwOWBn42WTSlxnukWq/Rq+up8BRZg95ExdgK9Y4PBwLJ/UMYZJf
 VtjE6koDbEt8Nacqzb9ZCiK/rdjgt4fjktiOB9k8WVYmKFfU8EZ0PFvyviByVwMY7Ny1
 SplToA07sjkfcws8GhOxgx9IXvXTLU9l8Na1SGm93y81cRNsL+23PvKqqlSosymuCsow
 YwlhFE0UFZC0HxAIZWeXKe4nj3YD07N1A7kDwDOwd5hUTbZ462AmAcC/1YxqhijZjbhF
 ppng==
X-Gm-Message-State: AOAM533TXRzdJrltOqJLKDl2FWui1ga1GrP7fgvGqts7cRS3+o26tU99
 Sntax4x+1IpS7miFo7Fmoas=
X-Google-Smtp-Source: ABdhPJxgRt06TvGPHz30s4x1PJL7rQS7Q/DD3XZoSVR7+1nZpbVnFUQkoDg3YWaW81epximAdiEb/g==
X-Received: by 2002:a05:622a:1491:b0:2e2:2faa:dd47 with SMTP id
 t17-20020a05622a149100b002e22faadd47mr185042qtx.142.1649105152357; 
 Mon, 04 Apr 2022 13:45:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:52 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 5/9] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Mon,  4 Apr 2022 17:45:11 -0300
Message-Id: <20220404204515.42144-6-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
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
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit is the groundwork to introduce new formats to the planes and
writeback buffer. As part of it, a new buffer metadata field is added to
`vkms_writeback_job`, this metadata is represented by the `vkms_composer`
struct.

Also adds two new function pointers (`{wb,plane}_format_transform_func`)
are defined to handle format conversion to/from internal format.

These things will allow us, in the future, to have different compositing
and wb format types.

V2: Change the code to get the drm_framebuffer reference and not copy its
    contents(Thomas Zimmermann).
V3: Drop the refcount in the wb code(Thomas Zimmermann).
V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
    and vkms_plane_state (Pekka Paalanen)

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
 4 files changed, 49 insertions(+), 16 deletions(-)

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
index 2e6342164bef..2704cfb6904b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -22,13 +22,8 @@
 
 #define NUM_OVERLAY_PLANES 8
 
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
@@ -36,6 +31,29 @@ struct vkms_frame_info {
 	unsigned int cpp;
 };
 
+struct pixel_argb_u16 {
+	u16 a, r, g, b;
+};
+
+struct line_buffer {
+	size_t n_pixels;
+	struct pixel_argb_u16 *pixels;
+};
+
+typedef void
+(*wb_format_transform_func)(struct vkms_frame_info *frame_info,
+			    const struct line_buffer *buffer, int y);
+
+typedef void
+(*plane_format_transform_func)(struct line_buffer *buffer,
+			       const struct vkms_frame_info *frame_info, int y);
+
+struct vkms_writeback_job {
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct vkms_frame_info frame_info;
+	wb_format_transform_func format_func;
+};
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
@@ -44,6 +62,7 @@ struct vkms_frame_info {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
+	plane_format_transform_func format_func;
 };
 
 struct vkms_plane {
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
index 746cb0abc6ec..ad4bb1fb37ca 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -74,12 +74,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
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
@@ -98,7 +101,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	if (!job->fb)
 		return;
 
-	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->frame_info.map);
+
+	drm_framebuffer_put(vkmsjob->frame_info.fb);
 
 	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
 	vkms_set_composer(&vkmsdev->output, false);
@@ -115,14 +120,23 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
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

