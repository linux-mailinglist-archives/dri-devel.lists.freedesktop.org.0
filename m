Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2987056E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9FD1122A9;
	Mon,  4 Mar 2024 15:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hXhsboYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37DA11227C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A18231C000C;
 Mon,  4 Mar 2024 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiFoWvvgAV8DiexHt8SOwI23FzpgbcJPyIxwHbI/8Nc=;
 b=hXhsboYKSftxDDsOcgabRBWsPAy3Uwu5Cqiodq1CL7HBSoBCUP+/A+zyg+fv+330D1nZoG
 UCEKpdeq9RnCpRGQ0Qhkx4A4QI1DMBFZZozROKoSNudHwm7iGnYlaZV2tWV2vt9oKWBCPI
 9sKQCrQTAj7I3LlpjP9Y8oOIs+QIJNYbSN34OCmGw5Iz6xrNR2Yne8DA9I2qfxqm6bUaWI
 zrD6Gxd2BpZ1kXgLtmEYQDq++8++/ZFwPkOSim4HDjcR2PCsHIm0SeOLp/MGltd77hiKP9
 BVvmytnCiUpfjaUME9BgOY7/ilKtEFZCK43nxsuNDHsLRcglPfekHdIRCKEfCw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:07 +0100
Subject: [PATCH v4 02/14] drm/vkms: Use drm_frame directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-2-76beac8e9793@bootlin.com>
References: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
In-Reply-To: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=N7pM5FLs21FNL8hsQWxNphWYncmcUeuWyWea5GV/zSA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejKWjD5hQ40DfvQsgx2cfkxrSI5AgjQdQj2cx9d
 EPinh/2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXoygAKCRAgrS7GWxAs4ghkEA
 CUD6pldr2kgjDm/IJbGMJDkpFrVkyzlDPbX5N7y6jf+KYbBk+xHHcUuYACGW46ckvzvxSu4YdQI4sf
 Dm86BO2j07TIohYqgdpeAClFnRKQ7RSPqUR+qneGidHHqqwZVSL2QUhr4lgtTcAm3LG3CgI4f2fAB0
 8S1ZC2SQQ2P6ZKV8ANq4tOTGvXXmb1XfwcOwzvGsrULn7iuAxclyygs3O4qM0xOaolIcf8ZEFKLl1j
 Gr2yxZsm6j9v+Z/WNYzMNK2c3/SoPhNwvNFDgYx00cG32aughDg4spVVEN6UW0sF//YsV3Aa/4+8ay
 rIOO0JzF9zNlc5Oh7zlKoKnEJLeEeS9lgFe9x5sEssHHQoqRgXrMB1tbUL4Wesb6bwBNWeGb1yHnPw
 a69CmzKlfpwR8TLDWxTGVExrqsiUE3nL95xNXnnBgRcnkrV5r0mVQ1HE7CxdVAGg9q5j+CkgZaeaH+
 xSTUdVo+HUBhOuOiULSsVoaQXliw4CO+QlCtFva5EgP64A8vrfyhYTnU2n1bLMG0GSsYl9Hydj/sMj
 6as+y0bU2KDgRgbFz7q7g7+OjRLbfg5fg8IX48RDbJ1sfcxFrDpAgtxn/Jbncu4LMJPlDENhqV3OOD
 UPGqBFri7IuJaRucHQIO3JvFQOudaNOIkqrO92JusENALsMLUxHzs0HF+AJA==
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
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       |  3 ---
 drivers/gpu/drm/vkms/vkms_formats.c   | 12 +++++++-----
 drivers/gpu/drm/vkms/vkms_plane.c     |  3 ---
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 -----
 4 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8f5710debb1e..b4b357447292 100644
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
index 36046b12f296..172830a3936a 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -11,8 +11,10 @@
 
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
-	return frame_info->offset + (y * frame_info->pitch)
-				  + (x * frame_info->cpp);
+	struct drm_framebuffer *fb = frame_info->fb;
+
+	return fb->offsets[0] + (y * fb->pitches[0])
+			      + (x * fb->format->cpp[0]);
 }
 
 /*
@@ -131,12 +133,12 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
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
@@ -223,7 +225,7 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
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
2.43.0

