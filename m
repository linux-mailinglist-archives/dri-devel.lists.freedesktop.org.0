Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39A554A302
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0342310FD11;
	Tue, 14 Jun 2022 00:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC0510FD10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:02:50 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10113b4c2b5so8866946fac.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gQwnFqwAB+4lDiP6tZ8yNTvQ5VJTppUsC+MDgnj5Cjk=;
 b=N22uY9ZPGHpR0E52odTMQ5LYGN/fQHvzRUBlB7NGbg9hjevT1YypGKbd9LXAoxKujX
 nhCyP3zueedsZ7pAZEZyRXMNLm1G4w5BlJJCo5OzoPixD9AbDnoaMWJ6NCYLEeVxmgI6
 0ia/bTQwY+uOt/uy53+CEmPNFjudFo+SuXtS5HYpLysXCnRphUaCpelSeCEuT2UmhUTH
 qYpXPG6P29sHwVI7PCuYbinEPJULn/Dh7h8wJfdfyVcacqtPkILFiJqy4NiYcmqDSHbL
 7vpKKVPS4iwfv1sAPRbTyJBe8vNtrMpP2eH0QetemJaSgnQ2DQrj1FHgtkntqlkUvyg6
 JSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gQwnFqwAB+4lDiP6tZ8yNTvQ5VJTppUsC+MDgnj5Cjk=;
 b=l7brOWVeOcXGPA8YThoWTF8/AaHXrkXo1vqWgqXgy5s4gC3Q9r+s3M4sDcvSFsTcMF
 MFBwbIX/llz70Kn6Nv1C6HDC0atRzNsYco5K/YqgrR1skN7dsbi4czNOyqaB/ICOJ3/7
 b2hay+L9DfEY52nQCUfacbLKO2T7jrDYTxJ2FFGGZqrMrEVGGAmKbIY3ZeFSnm/f1lTg
 ydr0OPcqy58aH0ORGeLCwbnZtXZTqFn7FD59FnxUrr+9eG5x9ERHD7/dYZUE0B2al+6T
 MU9zYV4lZ65AW4+riNWiivY/OU+MPGR9y0u0OTpPex3Si9PeLnOFMzm6u/lJXT5tAR5K
 gvKg==
X-Gm-Message-State: AJIora9znKvuniwuw+xQI86S71MkR7AGQUxdu+WP2GI5SIJh2UupcwpJ
 dKV7/suFDQdqJOMHIV9h90k=
X-Google-Smtp-Source: AGRyM1uaV4FsNVNaBYt2GS41Nh8J3G2aK3Mxaxn8r5isPAtwnnc0v4kX6MDyAqPIoajTOhtUIcYiUQ==
X-Received: by 2002:a05:6870:5704:b0:fe:436b:d20 with SMTP id
 k4-20020a056870570400b000fe436b0d20mr778282oap.142.1655164969517; 
 Mon, 13 Jun 2022 17:02:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:49 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 5/9] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Mon, 13 Jun 2022 21:02:22 -0300
Message-Id: <20220614000226.93297-6-igormtorrente@gmail.com>
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

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       | 29 ++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 20 +++++++++++++++---
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 95d71322500b..0d407ec84f94 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -22,11 +22,6 @@
 
 #define NUM_OVERLAY_PLANES 8
 
-struct vkms_writeback_job {
-	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
-	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
-};
-
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
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
+(*line_to_frame_func)(struct vkms_frame_info *frame_info,
+		      const struct line_buffer *buffer, int y);
+
+typedef void
+(*frame_to_line_func)(struct line_buffer *buffer,
+		      const struct vkms_frame_info *frame_info, int y);
+
+struct vkms_writeback_job {
+	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
+	struct vkms_frame_info wb_frame_info;
+	line_to_frame_func wb_write;
+};
+
 /**
  * vkms_plane_state - Driver specific plane state
  * @base: base plane state
@@ -44,6 +62,7 @@ struct vkms_frame_info {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
+	frame_to_line_func plane_read;
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 250e509a298f..c87f6c89e7b4 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -74,12 +74,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
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
@@ -98,7 +101,9 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	if (!job->fb)
 		return;
 
-	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->wb_frame_info.map);
+
+	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
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

