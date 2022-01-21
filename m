Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C515496764
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280E10E462;
	Fri, 21 Jan 2022 21:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0418E10E447
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:39:15 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id n15so17744886uaq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vP5kuX7mZVTY/pG9uRbevQGaPtcr9mHVd+pjSpNXL94=;
 b=MhsVG/mUywxmet15d9JE5ILhVD6J+Qv5OqszhuHHtitaFk1EId+YgSPsaThr4xSdFM
 qtbg+zrFV5jpzrWMnpvVWt2WN4C1CevMwPV8wcnox+qe6NByRncE7t501e/QfEV9GJxS
 1bglH/Y6EXMKmqDK81iabjiAu7CIum41hrK/7Rvt3tAgcXU73p1PiAhrxkwzPgt5wu+r
 uSKgn1CWhkyy/9FsP61vtpxc+u18eVApifdv8LFnEKZJahvbpeJmXO6g7qiCCBdkj10M
 3LE9FWXqPuX0IaS/GuFJWQVkzO3gnrirjw+EE515ERWz/vL6cAlgfH567ALwa6SqICar
 ZpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vP5kuX7mZVTY/pG9uRbevQGaPtcr9mHVd+pjSpNXL94=;
 b=mJ1tN/b7B3BM3/PPrXS0QjT+WzXEIZ7XIgl1gnl8Ni6CqfpWaRw/X+9neET7AcDQJx
 +gubXBVQf2pE2MbkRfLNZdABcxRRwTe+s83oBBH4e9Yrq2WYmFumnlU7uSPqsj8O4QnA
 omFH2b/H5Ey0wa4L8L3NmpEdmDDeGjby5H1bucIMSUDaK9sFd7t2BkFuU1htHtrclrRf
 EyfzQPYnRTqMzRbb1fiauJkKVhDtQiQm+2slRpUdKbIG2rmxNGMk1zAxnruCCxkmHcsz
 QK49gDtLFLenoEGolJT9ZxCK5Q0UnAXfY5fTRZqzfyoEuXrKer+atqKkjHE6Ewqo2WwA
 MwgA==
X-Gm-Message-State: AOAM5331RqdjvqGYoL8HQuQTv50dn1lvdA/TaCi1IE7mOo5qM0PrLUwp
 Snx6+mA9swxRDw5yXZC2S4o=
X-Google-Smtp-Source: ABdhPJx1n+R8gQTLLjIaw52xff0S4ibZRe+lhiFwWj5UcxN2inDx4p8QJV2tfrfj1P2oCab6OUaLvQ==
X-Received: by 2002:a67:c305:: with SMTP id r5mr2674702vsj.83.1642801155076;
 Fri, 21 Jan 2022 13:39:15 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:39:14 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 5/9] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Fri, 21 Jan 2022 18:38:27 -0300
Message-Id: <20220121213831.47229-6-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121213831.47229-1-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
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
index 2e6342164bef..c850d755247c 100644
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
@@ -36,6 +31,11 @@ struct vkms_frame_info {
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

