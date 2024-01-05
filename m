Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80594825883
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 17:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A16810E636;
	Fri,  5 Jan 2024 16:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3322310E623
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 16:43:58 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4T68J15FgwzDr8c;
 Fri,  5 Jan 2024 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1704472642; bh=sqwpQ6x5qhOlKhST2bTqDbph6jVTFp9MazqbgU4yuSs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=CHA6LNtfdvv+W7pwOBOvQ4NRRAgIDG2JHHeWdgaF+Ux0bZheqpTZyIAi1sx0zP9/4
 HDpPpsO+swcPEy+bZJipVVXtCdAUaC+lsFB+LfzlGNtypNytq89jHWdwOiBIKL9k6g
 2f1VtKxOa+Yaw4bE0SO1Pl0tAhWbqpTKTr3oktSA=
X-Riseup-User-ID: CC767B1388D339A0556428D7788F9FD121D74D1B3A067AB065D4BA19CBCA3A74
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T68Hw3vbczJp2K;
 Fri,  5 Jan 2024 16:37:16 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Fri, 05 Jan 2024 13:35:04 -0300
Subject: [PATCH 3/7] drm/vkms: Add range and encoding properties to
 pixel_read function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-vkms-yuv-v1-3-34c4cd3455e0@riseup.net>
References: <20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net>
In-Reply-To: <20240105-vkms-yuv-v1-0-34c4cd3455e0@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create range and encoding properties. This should be noop, as none of
the conversion functions need those properties.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_drv.h     |  3 ++-
 drivers/gpu/drm/vkms/vkms_formats.c | 20 ++++++++++++++------
 drivers/gpu/drm/vkms/vkms_plane.c   |  9 +++++++++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index c38590562e4b..51349a0c32d8 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -56,7 +56,8 @@ struct vkms_writeback_job {
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
 	struct vkms_frame_info *frame_info;
-	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel);
+	void (*pixel_read)(u8 **src_buffer, struct pixel_argb_u16 *out_pixel,
+			   enum drm_color_encoding enconding, enum drm_color_range range);
 };
 
 struct vkms_plane {
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 5566a7cd7bb4..0156372aa1ef 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -51,7 +51,8 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
 	return x;
 }
 
-static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
+static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+				 enum drm_color_encoding encoding, enum drm_color_range range)
 {
 	/*
 	 * The 257 is the "conversion ratio". This number is obtained by the
@@ -65,7 +66,8 @@ static void ARGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pix
 	out_pixel->b = (u16)src_pixels[0][0] * 257;
 }
 
-static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
+static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+				 enum drm_color_encoding encoding, enum drm_color_range range)
 {
 	out_pixel->a = (u16)0xffff;
 	out_pixel->r = (u16)src_pixels[0][2] * 257;
@@ -73,7 +75,8 @@ static void XRGB8888_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pix
 	out_pixel->b = (u16)src_pixels[0][0] * 257;
 }
 
-static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
+static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+				     enum drm_color_encoding encoding, enum drm_color_range range)
 {
 	u16 *pixels = (u16 *)src_pixels[0];
 
@@ -83,7 +86,8 @@ static void ARGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out
 	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
+static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+				     enum drm_color_encoding encoding, enum drm_color_range range)
 {
 	u16 *pixels = (u16 *)src_pixels[0];
 
@@ -93,7 +97,8 @@ static void XRGB16161616_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out
 	out_pixel->b = le16_to_cpu(pixels[0]);
 }
 
-static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel)
+static void RGB565_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
+			       enum drm_color_encoding encoding, enum drm_color_range range)
 {
 	u16 *pixels = (u16 *)src_pixels[0];
 
@@ -132,6 +137,9 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 	int limit = min_t(size_t, drm_rect_width(&frame_info->dst), stage_buffer->n_pixels);
 	u8 *src_pixels[DRM_FORMAT_MAX_PLANES];
 
+	enum drm_color_encoding encoding = plane->base.base.color_encoding;
+	enum drm_color_range range = plane->base.base.color_range;
+
 	for (size_t i = 0; i < frame_format->num_planes; i++)
 		src_pixels[i] = get_packed_src_addr(frame_info, y, i);
 
@@ -146,7 +154,7 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 			}
 		}
 
-		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
+		plane->pixel_read(src_pixels, &out_pixels[x_pos], encoding, range);
 
 		for (size_t i = 0; i < frame_format->num_planes; i++)
 			src_pixels[i] += frame_format->cpp[i];
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8f2c6ea419a3..e87c80575b7d 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -212,5 +212,14 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
+	drm_plane_create_color_properties(&plane->base,
+					  BIT(DRM_COLOR_YCBCR_BT601) |
+					  BIT(DRM_COLOR_YCBCR_BT709) |
+					  BIT(DRM_COLOR_YCBCR_BT2020),
+					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  DRM_COLOR_YCBCR_BT601,
+					  DRM_COLOR_YCBCR_FULL_RANGE);
+
 	return plane;
 }

-- 
2.43.0

