Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3D5AD965
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7810E4B7;
	Mon,  5 Sep 2022 19:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F1810E4B6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:45 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1272fc7f51aso9968972fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=JExMo8FpCrlVNY7hc5GcK9FQU8BRbhVpG31VDhmyLXk=;
 b=PdhgLfD8Kq9e00TXKZd+FdGRXAbNWljCv5Z9PcgFHwmhJEcGzWByqOnuZW4Jb3o4SN
 UbCyZBC5M8NKw9EVBa0uKHaTnOhebXyaVz1RnK0lFgQ9KVuIFLlqg70JWcojOl/twV+l
 bYLuJy/mYuGYhDrn1tyi7pH9Ws8RoIbaAQLl8339Gm/HNVgxMNGSO1QHfBi8BAP7N4dp
 vAIr1QSNLmS82VKc2dNZTDb9PT/K95yb4IH3Cvr70XoZOCexOhbkvuovEqOefzD7ke0m
 skelz3G3rn9jelQC97X0F9TK/Fo/Ul9vJSQ5jBxS9d+BtddxTV+Y2MU3VB6VYCCk7WJ3
 nBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JExMo8FpCrlVNY7hc5GcK9FQU8BRbhVpG31VDhmyLXk=;
 b=qJ0xzHSq7TNPKyT0H01Zxr2TqYaV7bdsaZcItM5vt1/del4k9ElWeQGl2b8wmbgluA
 UMghyVbOqK2A8s8crxqBiMm+eh2ypL/UpglWpO5KYmN0Qf2O4GR0NJYMiSV5v+SXgUa/
 q2YYmgR5VSWenVPy+HsbH85EsEYJiZjEJqGmIOeqz1GqemImoNIyC7ZU4J/UWvTeuVRs
 fXip/+oV634TsPFd4/rgPw3v2k3SwNncCEcrruv2BUFhSndTe59d8BVT9K+oXQ5d7kNy
 w3L7XXuKYpAU28HR5WUv6FOQ+xQHTLMf+6bEzEK6SK6QgwBRIkKpAvZqXjzd8S08ACmC
 f43g==
X-Gm-Message-State: ACgBeo05ZULfHlZuEYxERlkXzCjrTSSThgKBFrhiaquDLTq0sHKTeuYp
 FsqU70fzRVsnRdIjluksHUc=
X-Google-Smtp-Source: AA6agR4GHJh50TRwthB+slbGdbvwdNvLVycGWU4D8+t+OYAsWkFIYtHohrNwUba7UBDvPDWdljz+/A==
X-Received: by 2002:a05:6870:58a4:b0:11c:9b6d:f066 with SMTP id
 be36-20020a05687058a400b0011c9b6df066mr9591697oab.155.1662404924876; 
 Mon, 05 Sep 2022 12:08:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:44 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 5/9] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Mon,  5 Sep 2022 16:08:07 -0300
Message-Id: <20220905190811.25024-6-igormtorrente@gmail.com>
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

This commit is the groundwork to introduce new formats to the planes and
writeback buffer. As part of it, a new buffer metadata field is added to
`vkms_writeback_job`, this metadata is represented by the `vkms_frame_info`
struct.

Also adds two new function pointers (`line_to_frame_func` and
`frame_to_line_func`) are defined to handle format conversion
from/to internal format.

A new internal format(`struct pixel_argb_u16`) is introduced to deal with
all possible inputs. It consists of 16 bits fields that represent each of
the channels.

These things will allow us, in the future, to have different compositing
and wb format types.

V2: Change the code to get the drm_framebuffer reference and not copy its
    contents (Thomas Zimmermann).
V3: Drop the refcount in the wb code (Thomas Zimmermann).
V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
    and vkms_plane_state (Pekka Paalanen)
V6: Improvements to some struct/struct members names (Pekka Paalanen).
    Splits this patch in two (Pekka Paalanen).
V7: Replace line_to_frame_func and frame_to_line_func typedefs
   with the function signature and void* (Melissa Wen).

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 20 +++++++++++++++++---
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 38c44943d915..0a67b8073f7e 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -23,11 +23,6 @@
 
 #define NUM_OVERLAY_PLANES 8
 
-struct vkms_writeback_job {
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
-};
-
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
@@ -37,6 +32,22 @@ struct vkms_frame_info {
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
+struct vkms_writeback_job {
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
+	struct vkms_frame_info wb_frame_info;
+	void (*wb_write)(struct vkms_frame_info *frame_info,
+			 const struct line_buffer *buffer, int y);
+};
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
@@ -45,6 +56,8 @@ struct vkms_frame_info {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
+	void (*plane_read)(struct line_buffer *buffer,
+			   const struct vkms_frame_info *frame_info, int y);
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d427b6c52d03..e0a1ba378fc9 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -75,12 +75,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	if (!vkmsjob)
 		return -ENOMEM;
 
-	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
+	ret = drm_gem_fb_vmap(job->fb, vkmsjob->wb_frame_info.map, vkmsjob->data);
 	if (ret) {
 		DRM_ERROR("vmap failed: %d\n", ret);
 		goto err_kfree;
 	}
 
+	vkmsjob->wb_frame_info.fb = job->fb;
+	drm_framebuffer_get(vkmsjob->wb_frame_info.fb);
+
 	job->priv = vkmsjob;
 
 	return 0;
@@ -99,7 +102,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	if (!job->fb)
 		return;
 
-	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->wb_frame_info.map);
+
+	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
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
+	wb_frame_info = &active_wb->wb_frame_info;
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

