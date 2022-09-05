Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3235AD964
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AE210E4B0;
	Mon,  5 Sep 2022 19:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA4910E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:42 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-127a3a39131so2474442fac.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1xeRslTCPMfGKPxdcMpXEK2ItptS3Ll9lq6TCHalzNM=;
 b=GvzeKsLBMZjVcIvjQ5JjwN6xoP+/BG4AVX47l1LR4CbTef9ehjUub/3XXtJMzJJvUK
 wFdStBbujrQGKEotwhbm06vwDuMeh/NZql2p+ULpfuCA7T5hu4B1GJGwL7O2nX5CY+x6
 IOyUU2K4Kh3dB3q5YmirvWrB573xmyxqOiOKs1O3mIGRLgb+pAw4sV6zpv1C13S34xg6
 juQkSOTNgvKLd6V7sHIprcFzx5O0GMN2sbFo3bAA9SyMzt53pLkkCG8Urx/XJrptqAxX
 Hgi38a5JCF11vKQ/R4fSajgeUnwcwapI1ynSu/9wcMU+zsUkEZHmbsFvgFLvDn0jLezz
 t6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1xeRslTCPMfGKPxdcMpXEK2ItptS3Ll9lq6TCHalzNM=;
 b=j/o8L7f/kt2cl0qZl9ZktRrk7Axug2d/2rY6eNWZHUPjgNEZXBqdafTR+OQAaRdEhd
 S7i6FuUUHhbFYy1xXBM54M6VlL0WajRq4Q3d0pmJbxTp32OyraXGKuHP6D7U34TeYuY7
 96Hlhhao5ydohZgmqx8bzHiFmw/JgNwBpGjaxdB5ZJOV+pOhY7UuX9yDlidXGYXBXhh8
 6nPzAjhq6Yt8Wc9nUHqom+ajIfYYukLwsE1/yHLXgMxAAp4hYSRMXgrt0vE8fdLC3lUb
 qu78hyvjXt0eueLA/0FVfORDdYuZwJJKRvAMZlC1MUAH7SPmpVp1kRD+89s4yEZe5Q1a
 grOw==
X-Gm-Message-State: ACgBeo0BTX/ngyk38MaSdEp031YOq/l1XvEYXeaGA/i8KjVqSgVvPJl+
 kwbaaGQ3qpntSabg+IzpdJk=
X-Google-Smtp-Source: AA6agR7zFNSmdXzx34/6cpKXgCvFkEMLF4YWQA+0uSRVgMPUCD8f7zk7ionZRwqm8RHmBU+zlbOqew==
X-Received: by 2002:a05:6870:a1a5:b0:120:8d35:c8a3 with SMTP id
 a37-20020a056870a1a500b001208d35c8a3mr9385393oaf.237.1662404921377; 
 Mon, 05 Sep 2022 12:08:41 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:41 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 4/9] drm: vkms: get the reference to `drm_framebuffer`
 instead if coping it
Date: Mon,  5 Sep 2022 16:08:06 -0300
Message-Id: <20220905190811.25024-5-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220905190811.25024-1-igormtorrente@gmail.com>
References: <20220905190811.25024-1-igormtorrente@gmail.com>
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
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of coping `drm_framebuffer` - which can cause problems -
we just get the reference and add the ref count.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c |  4 ++--
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 +-
 drivers/gpu/drm/vkms/vkms_plane.c    | 10 +++++-----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 7c62c5741430..bca049d879e1 100644
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
index cde7d9ac70ad..38c44943d915 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -29,7 +29,7 @@ struct vkms_writeback_job {
 };
 
 struct vkms_frame_info {
-	struct drm_framebuffer fb;
+	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 52ec5a691002..41301d383017 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -49,12 +49,12 @@ static void vkms_plane_destroy_state(struct drm_plane *plane,
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
@@ -109,9 +109,9 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
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

