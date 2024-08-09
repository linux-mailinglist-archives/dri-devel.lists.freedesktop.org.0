Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F394D5B2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 19:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D83510E9BC;
	Fri,  9 Aug 2024 17:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="lKOERCEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534710E9BA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2024 17:55:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56BCCFF805;
 Fri,  9 Aug 2024 17:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723226099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pOj8GmT1mlz4zSyDQM70F37PMFWnSzDpg422/064V4g=;
 b=lKOERCEacrqqpCAsfkBhKPyOygHhu6+sG5ToDVSiRpMfkOoNpqKm6WKPihAu0GlWbLik+0
 6u4ZSYb8BJ+yFyxea6jMrncz52wurdzAgGCbjNTN1Oay50GRF0Mp6MDbhDXsF3nvlpPNWn
 t7Nyqee6Kd/Rc/l/zTcO4OMDw/AH2p94Pm5g5lxVAMtQDPcSa3iCelPb70ziIAd4q9j7fY
 FNqFdrNeWjBIC8+wUIaU4+Cr0dVc3voiXMqlMvTl5k5bh94N8DXaizM9OmBNboRZZnyPIf
 ZCIqIG2n71kr+Lacr1Hlus6wB4/rB9ZQXc/icmezRdU5hxjXoQ+DZ5dnZyVaLQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 09 Aug 2024 19:54:43 +0200
Subject: [PATCH v10 02/16] drm/vkms: Use drm_frame directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240809-yuv-v10-2-1a7c764166f7@bootlin.com>
References: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
In-Reply-To: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 rdunlap@infradead.org, arthurgrillo@riseup.net, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4272;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=K6GtM1BXIB0XhgPFhSrjOL3ADJI7Y0W6is5xmFlyXP8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmtlfpQn1YBmGEwIxr5rGrmo521Mba2Tplf+/n+
 l7d4uBv3b6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrZX6QAKCRAgrS7GWxAs
 4m+BD/4oW4IqE0qL3Msp71daB2XH1sMEM4UyDUZ/DWTRQojKohuEfoMYILOHGFEvvWvV4R4vH7/
 nMxmQN+hnVkHaLdUxcwcnW6CUnfZELnU22gqVgl5yUg9wsNM330yVfGlnxUFk6Morn8ZDTdLn3k
 OvEhGh4sFHg8N3xJsfPDn38ZssNZsV7tqOTvYZ5zh6fvwuQYg0lZW9CJfKaOLjUEuVDpJka9DXE
 IOpoudlvrBCYYPmDGS9QweyCwqQojiHyelc3gCbhp5q53ZPStQz1PvZDGbS1hmqc5Pu8mbE13jF
 5lmJwMq+DyD3EbP3qpIMwqeHLVaDk8MVMapol9K5FXDPQ2dcK7btmsa3QZ4bAuKZrGLmwHtBOdg
 2ORXeiWQXQ+EMYOOtAo8c9vLznIW3uFFf55+1W7JsWcF0RG8Mvfoou0PQjn+Q1R3sBnvJ3N5GXC
 MX845n3sbUXOznjdu0BA0I8rLpF0uuHdGPv/BEyWGCOC7JyzGWieGW0xPVUdH1WL7J3IpbalJIx
 uQ0faiVHu7XMfFWf+/6E8HpB/FfQFp554Zpfv+91Q5nEUztqOc2NEzLVGryFHOWZBITz2qvcm+E
 PobzfYgov0a2W3Esaw2mWcJO+F9kKhetz9yXaCOqhB3EiPnTlfOcfNMedOfkPzTyZ+XIUjGuf1c
 WESvz+zY8kSWlNw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

From: Arthur Grillo <arthurgrillo@riseup.net>

Remove intermidiary variables and access the variables directly from
drm_frame. These changes should be noop.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
[Louis Chauvet: Applied review from Maíra]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       |  3 ---
 drivers/gpu/drm/vkms/vkms_formats.c   | 11 ++++++-----
 drivers/gpu/drm/vkms/vkms_plane.c     |  3 ---
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 -----
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5e46ea5b96dc..8ac320564334 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -31,9 +31,6 @@ struct vkms_frame_info {
 	struct drm_rect rotated;
 	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int rotation;
-	unsigned int offset;
-	unsigned int pitch;
-	unsigned int cpp;
 };
 
 struct pixel_argb_u16 {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 040b7f113a3b..e03470879ae9 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,8 +11,9 @@
 
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
-	return frame_info->offset + (y * frame_info->pitch)
-				  + (x * frame_info->cpp);
+	struct drm_framebuffer *fb = frame_info->fb;
+
+	return fb->offsets[0] + (y * fb->pitches[0]) + (x * fb->format->cpp[0]);
 }
 
 /*
@@ -131,12 +132,12 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	u8 *src_pixels = get_packed_src_addr(frame_info, y);
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 
-	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->cpp) {
+	for (size_t x = 0; x < limit; x++, src_pixels += frame_info->fb->format->cpp[0]) {
 		int x_pos = get_x_position(frame_info, limit, x);
 
 		if (drm_rotation_90_or_270(frame_info->rotation))
 			src_pixels = get_packed_src_addr(frame_info, x + frame_info->rotated.y1)
-				+ frame_info->cpp * y;
+				+ frame_info->fb->format->cpp[0] * y;
 
 		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
 	}
@@ -223,7 +224,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
 	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst), src_buffer->n_pixels);
 
-	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->cpp)
+	for (size_t x = 0; x < x_limit; x++, dst_pixels += frame_info->fb->format->cpp[0])
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 5a8d295e65f2..21b5adfb44aa 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -125,9 +125,6 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	drm_rect_rotate(&frame_info->rotated, drm_rect_width(&frame_info->rotated),
 			drm_rect_height(&frame_info->rotated), frame_info->rotation);
 
-	frame_info->offset = fb->offsets[0];
-	frame_info->pitch = fb->pitches[0];
-	frame_info->cpp = fb->format->cpp[0];
 	vkms_plane_state->pixel_read = get_pixel_conversion_function(fmt);
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index bc724cbd5e3a..c8582df1f739 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -149,11 +149,6 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;
 	spin_unlock_irq(&output->composer_lock);
-
-	wb_frame_info->offset = fb->offsets[0];
-	wb_frame_info->pitch = fb->pitches[0];
-	wb_frame_info->cpp = fb->format->cpp[0];
-
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->pixel_write = get_pixel_write_function(wb_format);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);

-- 
2.44.2

