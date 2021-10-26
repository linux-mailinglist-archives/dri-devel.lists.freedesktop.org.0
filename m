Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1643B14F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5165E6E425;
	Tue, 26 Oct 2021 11:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E4F6E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:37 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id y11so13092627qtn.13
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qtCE7jonGK+7NebnXrOPLBttVq28Cf6oUZgL1KGrk/M=;
 b=ZC9LYvGxv9FOqQMVsliBmhIvRoEsCuS55GUwwR3ywalLi5KL36jUQ2p9GFdGQz7UrP
 W5LqbiVjLnNV0VP1V2IaSDk+YdG7+phUqxrfh6/Zmc90tnPHLPCs30n/e58QKxzScRyP
 lp+xs42JmgGFAEPFbNfSrD10WbjZq/ZLLjeyDPSepnvJ2vXeC6z6uRtRCZ85vSWsA+Qu
 xSj1vysMYlMZUY7dSfIyVWRhACC27hMKFGeCEZ6+pf1xhiS6SJOXochx/3LTXk190aQ0
 L3ZiwAuYzbu4PcatIVogyAANYdqZHQKwkYQ1Xg6EDgu8ftwrqnzV7j3IkNCHpt6CZbK4
 nXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qtCE7jonGK+7NebnXrOPLBttVq28Cf6oUZgL1KGrk/M=;
 b=HYRBOgcShRdvbegYjM1XDIB5PNtaay964hpQ52+krEeOAa9MKnk7JRYBS32GqwQjm4
 R8APxx3k7OxuGxW6qpCZ9xI1QtzoITMaxHF+WwQbO0/EjhH2sgIYNeyYwdBgYrZR8Jcm
 mphD/pamviGnFmzoy2l2PNokWvOt8Lwt9Rz+TiIq+M8OwUYEXIf4qwU3XvyCr1iTLm3E
 RqLboCjfi1fi6eAE8sSZrXXAU280bHErPe5k1YlwVXA6aKtf8eizLT3/qdQtGuc4x/vi
 Ig1pitfiotF+NG5RlgOXjpcZJDsWaa5PVBcLDIZ+4dL91EAOBjSFTU1t47K0mtfKExZI
 R5KA==
X-Gm-Message-State: AOAM531yC0JOIbKRaGBQUuMAxB5YZawRD/JSpkhbEsPTjBddRsVSLOBm
 zoMgm3urvdEIWE6GR9GHm8Y=
X-Google-Smtp-Source: ABdhPJxPO6dQX2xPy5zHAQLRFlT46jR0wnx3KgNLEvUGrqdlQxY3gqyX5EQiNXBlouZusogy5qC+9w==
X-Received: by 2002:ac8:58d6:: with SMTP id u22mr23618085qta.7.1635248076975; 
 Tue, 26 Oct 2021 04:34:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:36 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Tue, 26 Oct 2021 08:34:04 -0300
Message-Id: <20211026113409.7242-5-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026113409.7242-1-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
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
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h       | 12 ++++++------
 drivers/gpu/drm/vkms/vkms_plane.c     | 10 +++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 21 ++++++++++++++++++---
 4 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 82f79e508f81..383ca657ddf7 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -153,7 +153,7 @@ static void compose_plane(struct vkms_composer *primary_composer,
 			  struct vkms_composer *plane_composer,
 			  void *vaddr_out)
 {
-	struct drm_framebuffer *fb = &plane_composer->fb;
+	struct drm_framebuffer *fb = plane_composer->fb;
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
@@ -174,7 +174,7 @@ static int compose_active_planes(void **vaddr_out,
 				 struct vkms_composer *primary_composer,
 				 struct vkms_crtc_state *crtc_state)
 {
-	struct drm_framebuffer *fb = &primary_composer->fb;
+	struct drm_framebuffer *fb = primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	const void *vaddr;
 	int i;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 64e62993b06f..9e4c1e95bbb1 100644
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
 struct vkms_composer {
-	struct drm_framebuffer fb;
+	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
 	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
@@ -34,6 +29,11 @@ struct vkms_composer {
 	unsigned int cpp;
 };
 
+struct vkms_writeback_job {
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
+	struct vkms_composer composer;
+};
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 32409e15244b..0a28cb7a85e2 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
 	struct vkms_plane_state *vkms_state = to_vkms_plane_state(old_state);
 	struct drm_crtc *crtc = vkms_state->base.base.crtc;
 
-	if (crtc) {
+	if (crtc && vkms_state->composer->fb) {
 		/* dropping the reference we acquired in
 		 * vkms_primary_plane_update()
 		 */
-		if (drm_framebuffer_read_refcount(&vkms_state->composer->fb))
-			drm_framebuffer_put(&vkms_state->composer->fb);
+		if (drm_framebuffer_read_refcount(vkms_state->composer->fb))
+			drm_framebuffer_put(vkms_state->composer->fb);
 	}
 
 	kfree(vkms_state->composer);
@@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	composer = vkms_plane_state->composer;
 	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
-	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
+	composer->fb = fb;
 	memcpy(&composer->map, &shadow_plane_state->data, sizeof(composer->map));
-	drm_framebuffer_get(&composer->fb);
+	drm_framebuffer_get(composer->fb);
 	composer->offset = fb->offsets[0];
 	composer->pitch = fb->pitches[0];
 	composer->cpp = fb->format->cpp[0];
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227f555f..32734cdbf6c2 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -75,12 +75,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	if (!vkmsjob)
 		return -ENOMEM;
 
-	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
+	ret = drm_gem_fb_vmap(job->fb, vkmsjob->composer.map, vkmsjob->data);
 	if (ret) {
 		DRM_ERROR("vmap failed: %d\n", ret);
 		goto err_kfree;
 	}
 
+	vkmsjob->composer.fb = job->fb;
+	drm_framebuffer_get(vkmsjob->composer.fb);
+
 	job->priv = vkmsjob;
 
 	return 0;
@@ -99,7 +102,10 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	if (!job->fb)
 		return;
 
-	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->composer.map);
+
+	if (drm_framebuffer_read_refcount(vkmsjob->composer.fb))
+		drm_framebuffer_put(vkmsjob->composer.fb);
 
 	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
 	vkms_set_composer(&vkmsdev->output, false);
@@ -116,14 +122,23 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_writeback_connector *wb_conn = &output->wb_connector;
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
+	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
+	struct vkms_writeback_job *active_wb;
+	struct vkms_composer *wb_composer;
 
 	if (!conn_state)
 		return;
 
 	vkms_set_composer(&vkmsdev->output, true);
 
+	active_wb = conn_state->writeback_job->priv;
+	wb_composer = &active_wb->composer;
+
 	spin_lock_irq(&output->composer_lock);
-	crtc_state->active_writeback = conn_state->writeback_job->priv;
+	crtc_state->active_writeback = active_wb;
+	wb_composer->offset = fb->offsets[0];
+	wb_composer->pitch = fb->pitches[0];
+	wb_composer->cpp = fb->format->cpp[0];
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
-- 
2.30.2

