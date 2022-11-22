Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6426348DF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 22:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A354C10E483;
	Tue, 22 Nov 2022 20:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BBE10E473
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 20:59:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D6D94618EC;
 Tue, 22 Nov 2022 20:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DC67C43148;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669150745;
 bh=ZU3yF7ZX4fey9D+M4U4aWkHSOyloWRKCFz4fkV5q4UI=;
 h=From:Date:Subject:References:In-Reply-To:To:Reply-To:From;
 b=U8pmu26ZKEnxNhlrmb+PTk6KVtIuaPsEOMLvf9Ar02jE38t92MygcchShnE84zgpY
 MftuyQi8Je9XJOe3b4SdmMxx2KCL4C9+ou86zATReKhezF3Aeeqtz+sjshjnaiFtrk
 uTg/s7fPzfgYi6eHxnqSlgz9Ia4LNhktbfw8OXGXBTpPXyNc4X32YTpjNGOFhJ5LH6
 o5l6W0vMiEqsEwqIGFunKW8qmrPIi6Bck3l9h3l3p5Y1lIuWG3GJtXSYhpal/RLvtF
 N9zARElugGV9RygRFBAPqkxqoIaBQxCR+Oz5WRDXb9QiVN46o4ZQ+DzCb03i5qWJ82
 4jB66pdOA6eWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2775DC47088;
 Tue, 22 Nov 2022 20:59:05 +0000 (UTC)
From: Noralf Trønnes via B4 Submission Endpoint <devnull@kernel.org>
Date: Tue, 22 Nov 2022 21:58:44 +0100
Subject: [PATCH 6/6] drm/gud: Use the shadow plane helper
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221122-gud-shadow-plane-v1-6-9de3afa3383e@tronnes.org>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, stable@kernel.org,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	Hans de Goede <hdegoede@redhat.com>,
	Noralf Trønnes <noralf@tronnes.org>,
	Maxime Ripard <mripard@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1669150743; l=6203;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=kVfw6ro3JkSm73dyILYijcRVCKOZGOTKpXDICw548xw=;
 b=9Epr1sDxxVu0BYMSYeh6BLnlB0KW/3bhu2IokAvnNPm2oTelHLgzbpSArezPSNUwBZvfx2ZslirQ
 hkftktObAFBQa3WcPfGAlUjPqmPnoarVEWU2MnJuXTmVtaO9NdwQ
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf Trønnes <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

Use the shadow plane helper to take care of preparing the framebuffer for
CPU access. The synchronous flushing is now done inline without the use of
a worker. The async path now uses a shadow buffer to hold framebuffer
changes and it doesn't read the framebuffer behind userspace's back
anymore.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c      |  1 +
 drivers/gpu/drm/gud/gud_internal.h |  1 +
 drivers/gpu/drm/gud/gud_pipe.c     | 69 ++++++++++++++++++++++++--------------
 3 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index d57dab104358..5aac7cda0505 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -365,6 +365,7 @@ static void gud_debugfs_init(struct drm_minor *minor)
 static const struct drm_simple_display_pipe_funcs gud_pipe_funcs = {
 	.check      = gud_pipe_check,
 	.update	    = gud_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS
 };
 
 static const struct drm_mode_config_funcs gud_mode_config_funcs = {
diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/gud_internal.h
index e351a1f1420d..0d148a6f27aa 100644
--- a/drivers/gpu/drm/gud/gud_internal.h
+++ b/drivers/gpu/drm/gud/gud_internal.h
@@ -43,6 +43,7 @@ struct gud_device {
 	struct drm_framebuffer *fb;
 	struct drm_rect damage;
 	bool prev_flush_failed;
+	void *shadow_buf;
 };
 
 static inline struct gud_device *to_gud_device(struct drm_device *drm)
diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index dfada6eedc58..7686325f7ee7 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -358,10 +358,10 @@ static void gud_flush_damage(struct gud_device *gdrm, struct drm_framebuffer *fb
 void gud_flush_work(struct work_struct *work)
 {
 	struct gud_device *gdrm = container_of(work, struct gud_device, work);
-	struct iosys_map gem_map = { }, fb_map = { };
+	struct iosys_map shadow_map;
 	struct drm_framebuffer *fb;
 	struct drm_rect damage;
-	int idx, ret;
+	int idx;
 
 	if (!drm_dev_enter(&gdrm->drm, &idx))
 		return;
@@ -369,6 +369,7 @@ void gud_flush_work(struct work_struct *work)
 	mutex_lock(&gdrm->damage_lock);
 	fb = gdrm->fb;
 	gdrm->fb = NULL;
+	iosys_map_set_vaddr(&shadow_map, gdrm->shadow_buf);
 	damage = gdrm->damage;
 	gud_clear_damage(gdrm);
 	mutex_unlock(&gdrm->damage_lock);
@@ -376,33 +377,33 @@ void gud_flush_work(struct work_struct *work)
 	if (!fb)
 		goto out;
 
-	ret = drm_gem_fb_vmap(fb, &gem_map, &fb_map);
-	if (ret)
-		goto fb_put;
+	gud_flush_damage(gdrm, fb, &shadow_map, true, &damage);
 
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		goto vunmap;
-
-	/* Imported buffers are assumed to be WriteCombined with uncached reads */
-	gud_flush_damage(gdrm, fb, &fb_map, !fb->obj[0]->import_attach, &damage);
-
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-vunmap:
-	drm_gem_fb_vunmap(fb, &gem_map);
-fb_put:
 	drm_framebuffer_put(fb);
 out:
 	drm_dev_exit(idx);
 }
 
-static void gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *fb,
-				struct drm_rect *damage)
+static int gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer *fb,
+			       const struct iosys_map *map, struct drm_rect *damage)
 {
 	struct drm_framebuffer *old_fb = NULL;
+	struct iosys_map shadow_map;
 
 	mutex_lock(&gdrm->damage_lock);
 
+	if (!gdrm->shadow_buf) {
+		gdrm->shadow_buf = vzalloc(fb->pitches[0] * fb->height);
+		if (!gdrm->shadow_buf) {
+			mutex_unlock(&gdrm->damage_lock);
+			return -ENOMEM;
+		}
+	}
+
+	iosys_map_set_vaddr(&shadow_map, gdrm->shadow_buf);
+	iosys_map_incr(&shadow_map, drm_fb_clip_offset(fb->pitches[0], fb->format, damage));
+	drm_fb_memcpy(&shadow_map, fb->pitches, map, fb, damage);
+
 	if (fb != gdrm->fb) {
 		old_fb = gdrm->fb;
 		drm_framebuffer_get(fb);
@@ -420,6 +421,26 @@ static void gud_fb_queue_damage(struct gud_device *gdrm, struct drm_framebuffer
 
 	if (old_fb)
 		drm_framebuffer_put(old_fb);
+
+	return 0;
+}
+
+static void gud_fb_handle_damage(struct gud_device *gdrm, struct drm_framebuffer *fb,
+				 const struct iosys_map *map, struct drm_rect *damage)
+{
+	int ret;
+
+	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
+		drm_rect_init(damage, 0, 0, fb->width, fb->height);
+
+	if (gud_async_flush) {
+		ret = gud_fb_queue_damage(gdrm, fb, map, damage);
+		if (ret != -ENOMEM)
+			return;
+	}
+
+	/* Imported buffers are assumed to be WriteCombined with uncached reads */
+	gud_flush_damage(gdrm, fb, map, !fb->obj[0]->import_attach, damage);
 }
 
 int gud_pipe_check(struct drm_simple_display_pipe *pipe,
@@ -544,6 +565,7 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_device *drm = pipe->crtc.dev;
 	struct gud_device *gdrm = to_gud_device(drm);
 	struct drm_plane_state *state = pipe->plane.state;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect damage;
@@ -557,6 +579,8 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 			gdrm->fb = NULL;
 		}
 		gud_clear_damage(gdrm);
+		vfree(gdrm->shadow_buf);
+		gdrm->shadow_buf = NULL;
 		mutex_unlock(&gdrm->damage_lock);
 	}
 
@@ -572,13 +596,8 @@ void gud_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (crtc->state->active_changed)
 		gud_usb_set_u8(gdrm, GUD_REQ_SET_DISPLAY_ENABLE, crtc->state->active);
 
-	if (drm_atomic_helper_damage_merged(old_state, state, &damage)) {
-		if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE)
-			drm_rect_init(&damage, 0, 0, fb->width, fb->height);
-		gud_fb_queue_damage(gdrm, fb, &damage);
-		if (!gud_async_flush)
-			flush_work(&gdrm->work);
-	}
+	if (drm_atomic_helper_damage_merged(old_state, state, &damage))
+		gud_fb_handle_damage(gdrm, fb, &shadow_plane_state->data[0], &damage);
 
 	if (!crtc->state->enable)
 		gud_usb_set_u8(gdrm, GUD_REQ_SET_CONTROLLER_ENABLE, 0);

-- 
b4 0.10.1

