Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B7659A548
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1303510F2BC;
	Fri, 19 Aug 2022 18:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78B910E289
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:24:31 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id h67so4295339vsc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YhJ0PfwGgRpVD8HRur52246q3ZW4qW6DCJJNxfqlZTM=;
 b=NxTWm4Ik4RAGT5/psjwm6fQ68bMq6kA+8E+2he+fA+OlCYg0OlmoVMfuoWVc5pMYpq
 /pkR+pfb4GtPV30hEzCynFu7MVInzAUjwyAwFxSAGfIpfD7E2HUxKC7ij9SKzdgvQyJ7
 bPNL5YMOsaWUK7Ut9d/zLcFSjXvnv7fjGd1W7MAyIvvpChY5EuN7sG5Z8PDhfnIGRF5I
 wQ9BfYfgkt5yoDR1HDYZPq0FhqeLLoxhG2TqOxaUpIwQsuQs4Kgj6eIOQQU0/jLhYN01
 fRMJ3/pG+Sr/izSs6hNso1874KJY6V+76cLB6XFzlpaoWJ0W5/2Y6MF6z4LqlR8NT5ih
 U7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YhJ0PfwGgRpVD8HRur52246q3ZW4qW6DCJJNxfqlZTM=;
 b=OMF89WChovO9kzY2/AHX5Lw23edjUvh9ZwQ93Esg0SBqoI15uSREi41zddPR3VvJKH
 7P9o8Q9PBS3NyxUrl6WxR/Rw2yiL/l8p/XnEhEUc3hZ9Wn47Gc0/3Yr83e92rZZ5WJ1t
 +ErS4yg4yP7zFlR7YC4pA9hvYwVawOix5QLNiCpqmxFtYHjLkYlBDWuMzoWfYkqtknLn
 aYaPuT0gZs5qPMwxNxhwNXkY/obgGrZjm89CaAbNgyW1i2QH8RoH8g5U8CwNvwjAUytK
 FAiyfoYngo8NySDxIuBoAk1atS46fNkJkH0sktS+itxgTygRQJL7n8r1WMM3yziFqRZ0
 XSHw==
X-Gm-Message-State: ACgBeo2c50Ro0l7YjmcT4GhpDpxUvNiKvrysd2AGxCC74gsb9jRofvHO
 kHHNsG88S55dAyyoHJrfRzM=
X-Google-Smtp-Source: AA6agR5MtZHq5AQfWyemE2jJapZIq32BSELFeQS55n8gRTUBia6TYuTxlPmZ7sBaK7KkdNwLIxGnbw==
X-Received: by 2002:a05:6102:3d24:b0:388:4323:8e78 with SMTP id
 i36-20020a0561023d2400b0038843238e78mr3544175vsv.86.1660933470728; 
 Fri, 19 Aug 2022 11:24:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a67fa16000000b003901ef5d148sm1990349vsq.6.2022.08.19.11.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 11:24:30 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [RESEND v6 4/9] drm: vkms: get the reference to `drm_framebuffer`
 instead if coping it
Date: Fri, 19 Aug 2022 15:24:06 -0300
Message-Id: <20220819182411.20246-5-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819182411.20246-1-igormtorrente@gmail.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
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

Instead of coping `drm_framebuffer` - which can cause problems -
we just get the reference and add the ref count.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0aded4e87e60..b9fb408e8973 100644
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
index 5199c5f18e17..95d71322500b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -28,7 +28,7 @@ struct vkms_writeback_job {
 };
 
 struct vkms_frame_info {
-	struct drm_framebuffer fb;
+	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index fcae6c508f4b..8adbfdc05e50 100644
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
-- 
2.30.2

