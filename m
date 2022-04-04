Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013BE4F1A32
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068D510E4C7;
	Mon,  4 Apr 2022 20:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6EF10E3B1
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:59 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id 1so8758905qke.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vqscLdnf4y3mAkOShiaUOwtcBK3YKBoKr8m8MDYSv1A=;
 b=XjV1PIeW9t1SrT8svgVJtu3O4xy4AbOmptfNXC62I47ymFJ7O61LkazmHEoh9wJ/Sc
 4yVg00zPVPToZ1Im3rb8W9ukKFLDMwdGkbJ+M06gvhc8/31R3oHgQ6/TFiGV7ATzt6AY
 HBGkPD+cgjTMdx3UlBAWnRQvQr4MBKH0jBLOnHTuJPL9xjrUbppy6LzOn7jFMVYpH3OO
 szj1CxSLBLFQ/GjP4HbTBaX7NQJupKNJQsBrvAyeYqZnlMRlMb3RquQtQbYSnMDEpxMv
 pOp6o4gurtq6kdEcTcRTc+u62IG836LZFTkQQnr6HEUYjnGbMXtfNEU91ByxlE0jg2ld
 7P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vqscLdnf4y3mAkOShiaUOwtcBK3YKBoKr8m8MDYSv1A=;
 b=4KlQamejndsP8vhdjzX3QKvDEr8cTkfjMVJ8JnBKbnUxZh9/o82nZhvBdJtBDtqSlT
 qT2/TOOnFceoGcyB19Kiij4ye78ZG5mg/mQcwWHt1DGVzR64TOlW0XUstg3pnOZ/RVVu
 nAKqFgcmryRfrh4vSui601QybJBnJ8HPorv++7W3P9wXcE+GxkVmX8Bc6rEfV8CJIERW
 Xi/FlQimBUHo2jjFnCINqEg/DyXzCc9xANvSGGfSjFHLE+0wQDKnrWWkzqUdHle5KX03
 2W9iI/RuLyUeZL60dBQXrQfMyef9vVUkGf4U0rZQGzOpYD/gruqIAMH8IHruBe2Ar1Qw
 k7dQ==
X-Gm-Message-State: AOAM5336knwPN9NxOPdS5RzM/Xfya+vvhAWg5ACV6YdbD+hirgep00rg
 F/1HaEUpcvZMC3gG29XOHss=
X-Google-Smtp-Source: ABdhPJyZTpqYQ2N0i8eT3CPsa17UhwUQtWj+Lz0G7fp/jgccC7vQPtg6pW6vLG6WqHuCfTvfVeSM+Q==
X-Received: by 2002:a05:620a:1098:b0:67e:6a67:8494 with SMTP id
 g24-20020a05620a109800b0067e6a678494mr51651qkk.445.1649105158227; 
 Mon, 04 Apr 2022 13:45:58 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:57 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 7/9] drm: vkms: Supports to the case where primary plane
 doesn't match the CRTC
Date: Mon,  4 Apr 2022 17:45:13 -0300
Message-Id: <20220404204515.42144-8-igormtorrente@gmail.com>
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

We will break the current assumption that the primary plane has the
same size and position as CRTC.

For that we will add CRTC dimension information to `vkms_crtc_state`
and add a opaque black backgound color.

Because now we need to fill the background, we had a loss in
performance with this change. Results running the IGT[1] test
`igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:

|                  Frametime                   |
|:--------------------------------------------:|
|  Implementation |  Previous |   This commit  |
|:---------------:|:---------:|:--------------:|
| frametime range |  5~18 ms  |     10~22 ms   |
|     Average     |  8.47 ms  |     12.32 ms   |

[1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 Documentation/gpu/vkms.rst           |  3 +--
 drivers/gpu/drm/vkms/vkms_composer.c | 32 +++++++++++++++++++---------
 drivers/gpu/drm/vkms/vkms_crtc.c     |  4 ++++
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
 4 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index a49e4ae92653..49db221c0f52 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -121,8 +121,7 @@ There's lots of plane features we could add support for:
 - ARGB format on primary plane: blend the primary plane into background with
   translucent alpha.
 
-- Support when the primary plane isn't exactly matching the output size: blend
-  the primary plane into the black background.
+- Add background color KMS property[Good to get started].
 
 - Full alpha blending on all planes.
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index cf24015bf90f..f80842227669 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -61,6 +61,15 @@ static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 	return false;
 }
 
+static void fill_background(struct pixel_argb_u16 *backgroud_color,
+			    struct line_buffer *output_buffer)
+{
+	int i;
+
+	for (i = 0; i < output_buffer->n_pixels; i++)
+		output_buffer->pixels[i] = *backgroud_color;
+}
+
 /**
  * @wb_frame_info: The writeback frame buffer metadata
  * @crtc_state: The crtc state
@@ -78,22 +87,23 @@ static void blend(struct vkms_writeback_job *wb,
 		  struct line_buffer *output_buffer, s64 row_size)
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
-	struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
 	u32 n_active_planes = crtc_state->num_active_planes;
 
-	int y_dst = primary_plane_info->dst.y1;
-	int h_dst = drm_rect_height(&primary_plane_info->dst);
-	int y_limit = y_dst + h_dst;
+	struct pixel_argb_u16 background_color = (struct pixel_argb_u16) {
+		.a = 0xffff
+	};
+
+	int crtc_y_limit = crtc_state->crtc_height;
 	int y, i;
 
-	for (y = y_dst; y < y_limit; y++) {
-		plane[0]->format_func(output_buffer, primary_plane_info, y);
+	for (y = 0; y < crtc_y_limit; y++) {
+		fill_background(&background_color, output_buffer);
 
 		/* If there are other planes besides primary, we consider the active
 		 * planes should be in z-order and compose them associatively:
 		 * ((primary <- overlay) <- cursor)
 		 */
-		for (i = 1; i < n_active_planes; i++) {
+		for (i = 0; i < n_active_planes; i++) {
 			if (!check_y_limit(plane[i]->frame_info, y))
 				continue;
 
@@ -154,7 +164,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
 		return -EINVAL;
 
-	line_width = drm_rect_width(&primary_plane_info->dst);
+	line_width = crtc_state->crtc_width;
 	stage_buffer.n_pixels = line_width;
 	output_buffer.n_pixels = line_width;
 
@@ -175,8 +185,10 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 		struct vkms_frame_info *wb_frame_info = &active_wb->frame_info;
 
 		wb_format = wb_frame_info->fb->format->format;
-		wb_frame_info->src = primary_plane_info->src;
-		wb_frame_info->dst = primary_plane_info->dst;
+		drm_rect_init(&wb_frame_info->src, 0, 0, crtc_state->crtc_width,
+			      crtc_state->crtc_height);
+		drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_state->crtc_width,
+			      crtc_state->crtc_height);
 	}
 
 	blend(active_wb, crtc_state, crc32, &stage_buffer,
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 57bbd32e9beb..4a37e243c2d7 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -248,7 +248,9 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
+	struct drm_display_mode *mode = &crtc_state->mode;
 
 	if (crtc->state->event) {
 		spin_lock(&crtc->dev->event_lock);
@@ -264,6 +266,8 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 	}
 
 	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
+	vkms_output->composer_state->crtc_width = mode->hdisplay;
+	vkms_output->composer_state->crtc_height = mode->vdisplay;
 
 	spin_unlock_irq(&vkms_output->lock);
 }
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 2704cfb6904b..ab92d9f7b701 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -90,6 +90,8 @@ struct vkms_crtc_state {
 	bool wb_pending;
 	u64 frame_start;
 	u64 frame_end;
+	u16 crtc_width;
+	u16 crtc_height;
 };
 
 struct vkms_output {
-- 
2.30.2

