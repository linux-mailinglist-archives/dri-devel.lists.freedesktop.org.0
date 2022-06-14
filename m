Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68354A304
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5198310FD14;
	Tue, 14 Jun 2022 00:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82EC10FD14
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:02:56 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-fe539f9afbso10538294fac.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGgyy7KZJL6jZflObDRw+FVJFM0Z/5sowg3UO39vA7M=;
 b=bw5oNX+9u2SnX2UDsqc5vrleIxNK7Xw7yiG5JG1gkTFeL1oGcd9Y6shWIZE7fQWm1z
 OU+sR2nYgUcv4RcNfJ+QmaI37R4HYntLG7eAK+HCm4tR2lrTw6hFBpdAiJmO7nY+iyFB
 zRmN0NXf5fUsCMNwchdz3UP5Vi+ZpWdqOjg73NuqMNh6vS7fBl+bYfINpbKJunIHYIBX
 YlwJTZvWUpS25MuWpMMkW3vO5CJSj1NrfFrxTgmKIGMndooAvHOrmIWxvs/b+k/JR2Hb
 4JfrHXXP4qYLVQp91Db5I7ITGwKruMX+qOsW2yGMAG5hV/sKXxPe0l3GQqn+vHJ/g/k7
 3EsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGgyy7KZJL6jZflObDRw+FVJFM0Z/5sowg3UO39vA7M=;
 b=jOAmhJv1nTkLQ+frscln6APXzFapFqsmhCHwjE78wBu00MvBoWYGOP6m/2Y/0rJ212
 I51rU9a3k5nYu26lhpCvYr4ce48iIO0QdQGplbfkmoqojHZVB5S2lOLaEwKRSwFDoTE/
 EX8HQLf427z1GGssQhaQgKGUDXEWzuhNby/MFcnCAEEJCgf9to7jFu0RVAExhX2jKLvZ
 0rdjxUek/G3SOe7b86MOLRnwfvx1008H3u/8yvyPm8ydsU8N+bxBNT7XATioarTxU69U
 zFoKL1tGk4OpeR2xhNSTq5of8RuQ0mLx1CdiXet5vfZjowzZ815Z+9QiId2Aa0WzuTC1
 MTSA==
X-Gm-Message-State: AJIora9j+Siy9c+N9dcxb4CiRnK0k4yQs/cOGPkJYcg2+I1Mnpq24jOM
 20REn7y1J4AwMbO6J1/nbHs=
X-Google-Smtp-Source: AGRyM1v0QQYKhLoVE4uSlYr15y5ZCumzp/xKgCgLGpgiwAVRmgqCOJ7h6JlunNny8bdPMkWgIAhf6Q==
X-Received: by 2002:a05:6870:828d:b0:f3:4dd7:5ceb with SMTP id
 q13-20020a056870828d00b000f34dd75cebmr821680oae.294.1655164976088; 
 Mon, 13 Jun 2022 17:02:56 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:55 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 7/9] drm: vkms: Supports to the case where primary plane
 doesn't match the CRTC
Date: Mon, 13 Jun 2022 21:02:24 -0300
Message-Id: <20220614000226.93297-8-igormtorrente@gmail.com>
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
index d2aabb52cb46..974db5defce4 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -122,6 +122,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = wb_conn->base.state;
 	struct vkms_crtc_state *crtc_state = output->composer_state;
 	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
+	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
+	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
 	struct vkms_writeback_job *active_wb;
 	struct vkms_frame_info *wb_frame_info;
 	u32 wb_format = fb->format->format;
@@ -143,6 +145,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->wb_write = get_line_to_frame_function(wb_format);
+	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
+	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
 }
 
 static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs = {
-- 
2.30.2

