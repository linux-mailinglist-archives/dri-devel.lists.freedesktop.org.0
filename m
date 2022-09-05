Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B85AD966
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDBC10E4BB;
	Mon,  5 Sep 2022 19:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED59910E4B4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:52 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11ee4649dfcso23360812fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LbgsLGCQVKrD9kLTm+FUsVi1SVDJBFILBGHME0L8bk0=;
 b=DVTlsgXNaGs0Q8HwiTGYe8AG/+0u4lQpGFFzap1R7LxWoj/P1+c84Qc8U+1ALuS2xJ
 wBxHLtAKjv9MHHpc+/Hr1lt0NOyvdPgEJbEOaXjUhThhEmjPZdpUB1OovT8LcWJZALaR
 pmsKL+lOVkV+VGh7fnGi1nj7Ilu3cmZIcme/PPRsJRk18iETn5seJ8qZPK8r+mTlsrAI
 boq1qvoYdDu2yuey2RsxI2RZ7VYihqWt/4IBWijhaUUDaCc3z6/xwt+Uh5rOPhOS6Ozp
 b9vYKU/Z1PoaV518QOmtvoCgbAkQeSjoNtNwVrsbvtj1AV8wFusVVKyNuidllrkl8o6U
 SX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LbgsLGCQVKrD9kLTm+FUsVi1SVDJBFILBGHME0L8bk0=;
 b=E1Y75bl3vsjKYWnIj0NeWuXOUR2fMp3GUZ3V53WY+dnkoTi5RxWxR0ebzXpEy3YpQX
 UJ9ACsi3qxA0IgsCUbJK30yTd6dVNdsZeCcKQSjuOYS4EYF4o4lDMRzsaI7t447/eDdq
 QumARuP/tos0PPtnGnebq/9XwRfuhBteqWLtzpZf1karBYdgzfrr0TFQxaMlnjYUd/VY
 4WrTyBW+4PvRiPTbtKv4VG2R/ZV8HNTF4Y0+y4hjUIAYg0PynnJ9DKTf9EpNutirFKXV
 B0er6fW96AcbRLPlgMK/C5zwfw3dp5PVpBVWU94kh3VeVU2OlcosWEQXPVLRZP46bpog
 wBYQ==
X-Gm-Message-State: ACgBeo1tB/ku2vsJbiovPqZONBSxvDY7TZotDIKr2UbyVmRiOIOXOmjS
 eHcKIviFkAFuJg0HMO74t48=
X-Google-Smtp-Source: AA6agR5PkI4igdxV/iMHcfwjA1cF5YQkJ0qp1V7HdrDBZjdbWkHN1Qx56PHEA5bgvhnW+r6/9/dWDg==
X-Received: by 2002:a05:6870:c68a:b0:127:a3f9:2c16 with SMTP id
 cv10-20020a056870c68a00b00127a3f92c16mr984565oab.246.1662404931896; 
 Mon, 05 Sep 2022 12:08:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:51 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 7/9] drm: vkms: Supports to the case where primary plane
 doesn't match the CRTC
Date: Mon,  5 Sep 2022 16:08:09 -0300
Message-Id: <20220905190811.25024-8-igormtorrente@gmail.com>
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

We will remove the current assumption that the primary plane has the
same size and position as CRTC and that the primary plane is the
bottom-most in zpos order, or is even enabled. At least as far
as the blending machinery is concerned.

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

V6: Improve the commit description (Pekka Paalanen).
    Update some comments (Pekka Paalanen).
    Remove some fields from `vkms_crtc_state` and move where
    some variables are set (Pekka Paalanen).

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 Documentation/gpu/vkms.rst            |  3 +-
 drivers/gpu/drm/vkms/vkms_composer.c  | 59 +++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_writeback.c |  4 ++
 3 files changed, 33 insertions(+), 33 deletions(-)

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
index 5b1a8bdd8268..8e53fa80742b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -61,6 +61,13 @@ static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
 	return false;
 }
 
+static void fill_background(const struct pixel_argb_u16 *background_color,
+			    struct line_buffer *output_buffer)
+{
+	for (size_t i = 0; i < output_buffer->n_pixels; i++)
+		output_buffer->pixels[i] = *background_color;
+}
+
 /**
  * @wb_frame_info: The writeback frame buffer metadata
  * @crtc_state: The crtc state
@@ -78,21 +85,17 @@ static void blend(struct vkms_writeback_job *wb,
 		  struct line_buffer *output_buffer, size_t row_size)
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
-	struct vkms_frame_info *primary_plane_info = plane[0]->frame_info;
 	u32 n_active_planes = crtc_state->num_active_planes;
 
-	int y_dst = primary_plane_info->dst.y1;
-	int h_dst = drm_rect_height(&primary_plane_info->dst);
-	int y_limit = y_dst + h_dst;
+	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
-	for (size_t y = y_dst; y < y_limit; y++) {
-		plane[0]->plane_read(output_buffer, primary_plane_info, y);
+	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
 
-		/* If there are other planes besides primary, we consider the active
-		 * planes should be in z-order and compose them associatively:
-		 * ((primary <- overlay) <- cursor)
-		 */
-		for (size_t i = 1; i < n_active_planes; i++) {
+	for (size_t y = 0; y < crtc_y_limit; y++) {
+		fill_background(&background_color, output_buffer);
+
+		/* The active planes are composed associatively in z-order. */
+		for (size_t i = 0; i < n_active_planes; i++) {
 			if (!check_y_limit(plane[i]->frame_info, y))
 				continue;
 
@@ -124,14 +127,24 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 	return 0;
 }
 
+static int check_iosys_map(struct vkms_crtc_state *crtc_state)
+{
+	struct vkms_plane_state **plane_state = crtc_state->active_planes;
+	u32 n_active_planes = crtc_state->num_active_planes;
+
+	for (size_t i = 0; i < n_active_planes; i++)
+		if (iosys_map_is_null(&plane_state[i]->frame_info->map[0]))
+			return -1;
+
+	return 0;
+}
+
 static int compose_active_planes(struct vkms_writeback_job *active_wb,
 				 struct vkms_crtc_state *crtc_state,
 				 u32 *crc32)
 {
 	size_t line_width, pixel_size = sizeof(struct pixel_argb_u16);
-	struct vkms_frame_info *primary_plane_info = NULL;
 	struct line_buffer output_buffer, stage_buffer;
-	struct vkms_plane_state *act_plane = NULL;
 	int ret = 0;
 
 	/*
@@ -142,22 +155,13 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 	 */
 	static_assert(sizeof(struct pixel_argb_u16) == 8);
 
-	if (crtc_state->num_active_planes >= 1) {
-		act_plane = crtc_state->active_planes[0];
-		if (act_plane->base.base.plane->type == DRM_PLANE_TYPE_PRIMARY)
-			primary_plane_info = act_plane->frame_info;
-	}
-
-	if (!primary_plane_info)
-		return -EINVAL;
-
-	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
+	if (WARN_ON(check_iosys_map(crtc_state)))
 		return -EINVAL;
 
 	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
 		return -EINVAL;
 
-	line_width = drm_rect_width(&primary_plane_info->dst);
+	line_width = crtc_state->base.crtc->mode.hdisplay;
 	stage_buffer.n_pixels = line_width;
 	output_buffer.n_pixels = line_width;
 
@@ -174,13 +178,6 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
 		goto free_stage_buffer;
 	}
 
-	if (active_wb) {
-		struct vkms_frame_info *wb_frame_info = &active_wb->wb_frame_info;
-
-		wb_frame_info->src = primary_plane_info->src;
-		wb_frame_info->dst = primary_plane_info->dst;
-	}
-
 	blend(active_wb, crtc_state, crc32, &stage_buffer,
 	      &output_buffer, line_width * pixel_size);
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index d10dd4de8608..0ce5e28d260d 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -123,6 +123,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
+	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
+	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
 	struct vkms_writeback_job *active_wb;
 	struct vkms_frame_info *wb_frame_info;
 	u32 wb_format = fb->format->format;
@@ -144,6 +146,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->wb_write = get_line_to_frame_function(wb_format);
+	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
+	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
 }
 
 static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
-- 
2.30.2

