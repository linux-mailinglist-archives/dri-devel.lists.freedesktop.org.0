Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F8D54A301
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A17B10FD0B;
	Tue, 14 Jun 2022 00:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0C210FD10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:02:47 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so10524352fac.9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YhJ0PfwGgRpVD8HRur52246q3ZW4qW6DCJJNxfqlZTM=;
 b=Pqco1H+jUq8hhr7uQvBn1JO3sP9GT/EqStPaSXD81cIle3twsvz8PbdP5L2WZV4XtG
 99cclCkGpVulz3xk4EACwyGQizgWl+w6/F+fverLfPcDmZnS/BqrpPXbvYhZCwTXcilQ
 VfzXrgQUWG6nVBRFUqrVXePe9Rvrk1eHHp873wy3vzJ/oP/xcZOOMOxw7ftTjC28HCmg
 R8IgxxuCSIFon3vmL0nWX5PWJfCQDK6HDtji4BmHzW04JiaFmOkDLN08zjKNwCyU8M+J
 IXaQdMstYT+NeL145y0VY9uFI+Qja15I0UMKWnKdkkC51r+4DmULv+rUiXd1l8n0+zG7
 Zgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YhJ0PfwGgRpVD8HRur52246q3ZW4qW6DCJJNxfqlZTM=;
 b=5NfLORueqCzjj9iPydjpOeMntajOtghaYsy2+Eu42KTmQh9wKrHL2aDanj+A40jmBD
 6B1P60TqXGEVwmyb7xzEa+Mszn+yDwVGCLopi+A5BSyVgzZbyRe/HOJ+Z5GScBaBztDI
 GZv31nTtsoTTregwhrJFK0r1zyDJt0Pk2DqFBchH4IXKs1ZgiFfAmTy+pKJrmTDgAUWa
 pM+0ZSSy0hqw4yl8nxsvJuQWsQgTdHuHqLoxD7XdK0iospRWfVy8VfjUyNPSM01RvKwQ
 AWuKyn/CakxFuoFBWiA4+mRMYPnkXnEJNiGDJ7+9oEi4SFLw54eosXM3u2PvLgKfU/qs
 qxyw==
X-Gm-Message-State: AJIora/VbbkM3POnEAu470fnV5AgKGzx5KULZCpnW+VxkB07PhFH6TLf
 x6TVdXSWgI7TtdNZMlFkXBU=
X-Google-Smtp-Source: AGRyM1t13kZ2KS5o92N3CSO4e7+peNXTaHSFOq/P26GF6DgALX0IWK4eT7rvIwc8bbFL5JET3xhTcg==
X-Received: by 2002:a05:6870:b4a8:b0:f3:3fb0:2da8 with SMTP id
 y40-20020a056870b4a800b000f33fb02da8mr814144oap.179.1655164966344; 
 Mon, 13 Jun 2022 17:02:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:46 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 4/9] drm: vkms: get the reference to `drm_framebuffer`
 instead if coping it
Date: Mon, 13 Jun 2022 21:02:21 -0300
Message-Id: <20220614000226.93297-5-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614000226.93297-1-igormtorrente@gmail.com>
References: <20220614000226.93297-1-igormtorrente@gmail.com>
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

