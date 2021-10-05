Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E5423180
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143906EC37;
	Tue,  5 Oct 2021 20:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911B6EC37
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:17:35 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id f130so239039qke.6
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiGk0N0u2kNmWFJE+qdtUv44eJh4PhxY8jpg4qljUIo=;
 b=qE6FbcNe2zE3FSLev1D+zWw+UKU+QeBXsQty/MKhWK0IvqdeeYmE78XFNh/CxVu9M+
 CRr18MughfBb73ehlJuIF6pQJP/KI9oun8LBbJRgnYqt05Wp8GkxOEyEol1jDMt5m9V9
 VtR9n+zCggYsSynnn5/NIa5t621y+J0ZxqLcWxuzG12QjfVCy4zR22iy62INZJdffPcy
 SUuHOU85a2i+rO+ZJ0JyPwYkPi4/U6qjCJvLDtQjvi7iEl91nIFeMnONSBtBOBVFaCSG
 oOdnTJKymsTdmMUBwH00rcVmv5JV1KHfGY0qcE0R72ilfjxst8THzteIWiVdI7gbuxsY
 S3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiGk0N0u2kNmWFJE+qdtUv44eJh4PhxY8jpg4qljUIo=;
 b=yvCAKmNdrhJI4Kmln1VL8jGLZ4UhX7qU4Trr9TQOTXYs7t80wuC/ozfIoy0PcK5gUi
 HktUi+LOdskdmHdVfdk/CbIZfXuyh+tb+8WWlqdSAVP06TJh/x94450AmO5GBnRBDYar
 Y7OTCYh8ismNR6pzvt6Uul11H5XJvc3JIuvIJ9pBn+9jrCfD+Q78q/Xtrwwg36pdB6+F
 +Cv38TGtU4US7uvCs4b1sBhDwWwDmolvxNypyJIpN/Q4UIdNWOoG+aPI3XFVLRlhW24e
 XI1N5Nx9IKjXBGFdZg5qKTY+tNZI1b51xo0uY0QNc7ePBbojzsgZpN/77bPOAME2/OH+
 qwiw==
X-Gm-Message-State: AOAM531D4/7Zvmw1NdcunA2jyfEvHbOqApv4Ji8Zlu1+h4Y1BVrnMaez
 jYa1EdoSmEfvkPtgxQ+tqqA=
X-Google-Smtp-Source: ABdhPJy1bwOZXI7Zcw2koJzJ4UlX9eEJnk7Ohg5sT+jmVMGoMNjwr+0+Vy8SsIL6b1mk+I/7CRPNEQ==
X-Received: by 2002:a37:8941:: with SMTP id l62mr16661388qkd.100.1633465054491; 
 Tue, 05 Oct 2021 13:17:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:9b98::1007])
 by smtp.googlemail.com with ESMTPSA id j2sm13056905qta.84.2021.10.05.13.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:17:34 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH 4/6] drm: vkms: Add fb information to `vkms_writeback_job`
Date: Tue,  5 Oct 2021 17:16:35 -0300
Message-Id: <20211005201637.58563-5-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211005201637.58563-1-igormtorrente@gmail.com>
References: <20211005201637.58563-1-igormtorrente@gmail.com>
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

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       | 10 +++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c | 16 +++++++++++++---
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 64e62993b06f..d62f8ebd454b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -20,11 +20,6 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
-struct vkms_writeback_job {
-	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
-	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
-};
-
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
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
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 8694227f555f..5a3e12f105dc 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -75,7 +75,7 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	if (!vkmsjob)
 		return -ENOMEM;
 
-	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
+	ret = drm_gem_fb_vmap(job->fb, vkmsjob->composer.map, vkmsjob->data);
 	if (ret) {
 		DRM_ERROR("vmap failed: %d\n", ret);
 		goto err_kfree;
@@ -99,7 +99,7 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 	if (!job->fb)
 		return;
 
-	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->composer.map);
 
 	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
 	vkms_set_composer(&vkmsdev->output, false);
@@ -116,14 +116,24 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
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
+	memcpy(&wb_composer->fb, fb, sizeof(struct drm_framebuffer));
+	wb_composer->offset = fb->offsets[0];
+	wb_composer->pitch = fb->pitches[0];
+	wb_composer->cpp = fb->format->cpp[0];
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
-- 
2.30.2

