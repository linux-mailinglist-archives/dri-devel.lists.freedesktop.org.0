Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C62828C3C79
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE9C10E4BB;
	Mon, 13 May 2024 07:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JG9zxmx0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B917A10E4AA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:50:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C45720013;
 Mon, 13 May 2024 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715586647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0FKIVGwbdpHIb8BuI5L8JvoZwrAcNtiZQ1DnM4vR/k=;
 b=JG9zxmx0QE5XZwwAB23VPSaT876MjLJpxYpEOKyvK+6U7/doJAkLitv0fs22KEk9r2nnff
 S76qlW1GCzw9wHOiBW0s0qF7U9fUM6a9GK76pFXEymZ5WlSxBI0y1auRYVYUTBc4MADUv+
 W7GD0a7PvV2IB9bXEQXKUVbcpKohUdBk8oJMcb3Ff7BwAXtIZHpT/9EfI4Al9Pvsavrznv
 aP40L+JTUXbj1ses74ogXs/CVn4GefXQBNI+kRh9RKur5V6C6+4oKov560DzzSgsqbCrwV
 oMmQZHRYR/sGEKbxuhzmKFF5A2E1tvlYr/tJq8WYJU/GM1Lo3oSkCwDVIYISxA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 13 May 2024 09:50:29 +0200
Subject: [PATCH v7 08/17] drm/vkms: Avoid computing blending limits inside
 pre_mul_alpha_blend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-yuv-v7-8-380e9ffec502@bootlin.com>
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
In-Reply-To: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4075;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OA93dxY/QDeSwlJlrfR8nLFV2Zt/dq9YRAcwRpxm6+s=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmQcZDw7+y+Iv1zpmacs/s2ByIy4kkuPgEUkd6i
 KIXbdumtgqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkHGQwAKCRAgrS7GWxAs
 4ui/EACTJGgpB/8K/B25SVUZ3HyHEzDf94M3L7psRDl6kaozHoD3oNgsuVqjiYSOsQx+LbbFSCT
 aKiQ/xf6mS2QxLKMDFyHj38eaiMu7N6yx0qqIxjN41B9zQwVii8pYzW9l3E5OUXa5M6zQUDQuDe
 vQTqXw4nwnTc41Gdui3TWfLGbyS2cuW89uiU8KasZjTuvcbDNm/Ipa7Y4tZGLoURdYdzpfYfd1N
 phWVYQO92h1wlvi3fCVz2Lnx+tGdSEDhraiPh29TmtwLzIaJpCFBS4VGW6vh6d735OdVEFrX3Gg
 tuqATNem/pIRFSiT15chhaInC3utoyHvvyjLJuQ5FkY1Vt3HPTZDB2M61B7IMDK7IYT2j2DfPl5
 z6HVq4mjLxdHcT8p2PY+bmJe2tFAZnlxgxy1MC0TiWA4952rzOlwLFFCNF9UJ9hpSKuVrvdOR1n
 AS3x64eGoHnMhm6kwtA1VdoxBNgMSCrXFOSS7UEQcIlEApxpVZ5t2WgcTzDhgAgpfcv/D3khu2T
 y0UjxEM9FxvMTCV62iohWdBlc9LibGVqNFU0MuZGtC7MmY9cirZjEspvqcyaG8xlCn+JrXjM237
 zlUIpCLMbyqLSMfC8T2fK2VZUJIW4TkH4ixXTCFnNqPb9plKO1a7YXeN9IkGPJa9ZavoqNkPkvv
 nWk6jJpVewLVhpQ==
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

The pre_mul_alpha_blend is dedicated to blending, so to avoid mixing
different concepts (coordinate calculation and color management), extract
the x_limit and x_dst computation outside of this helper.
It also increases the maintainability by grouping the computation related
to coordinates in the same place: the loop in `blend`.

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index da0651a94c9b..45b111c74884 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -24,34 +24,30 @@ static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 
 /**
  * pre_mul_alpha_blend - alpha blending equation
- * @frame_info: Source framebuffer's metadata
  * @stage_buffer: The line with the pixels from src_plane
  * @output_buffer: A line buffer that receives all the blends output
+ * @x_start: The start offset
+ * @pixel_count: The number of pixels to blend
  *
- * Using the information from the `frame_info`, this blends only the
- * necessary pixels from the `stage_buffer` to the `output_buffer`
- * using premultiplied blend formula.
+ * The pixels 0..@pixel_count in stage_buffer are blended at @x_start..@x_start+@pixel_count in
+ * output_buffer.
  *
  * The current DRM assumption is that pixel color values have been already
  * pre-multiplied with the alpha channel values. See more
  * drm_plane_create_blend_mode_property(). Also, this formula assumes a
  * completely opaque background.
  */
-static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
-				struct line_buffer *stage_buffer,
-				struct line_buffer *output_buffer)
+static void pre_mul_alpha_blend(const struct line_buffer *stage_buffer,
+				struct line_buffer *output_buffer, int x_start, int pixel_count)
 {
-	int x_dst = frame_info->dst.x1;
-	struct pixel_argb_u16 *out = output_buffer->pixels + x_dst;
-	struct pixel_argb_u16 *in = stage_buffer->pixels;
-	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
-			    stage_buffer->n_pixels);
-
-	for (int x = 0; x < x_limit; x++) {
-		out[x].a = (u16)0xffff;
-		out[x].r = pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
-		out[x].g = pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
-		out[x].b = pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
+	struct pixel_argb_u16 *out = &output_buffer->pixels[x_start];
+	const struct pixel_argb_u16 *in = stage_buffer->pixels;
+
+	for (int i = 0; i < pixel_count; i++) {
+		out[i].a = (u16)0xffff;
+		out[i].r = pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
+		out[i].g = pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
+		out[i].b = pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
 	}
 }
 
@@ -183,7 +179,7 @@ static void blend(struct vkms_writeback_job *wb,
 {
 	struct vkms_plane_state **plane = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
-	int y_pos;
+	int y_pos, x_dst, pixel_count;
 
 	const struct pixel_argb_u16 background_color = { .a = 0xffff };
 
@@ -201,14 +197,16 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
+			x_dst = plane[i]->frame_info->dst.x1;
+			pixel_count = min_t(int, drm_rect_width(&plane[i]->frame_info->dst),
+					    (int)stage_buffer->n_pixels);
 			y_pos = get_y_pos(plane[i]->frame_info, y);
 
 			if (!check_limit(plane[i]->frame_info, y_pos))
 				continue;
 
 			vkms_compose_row(stage_buffer, plane[i], y_pos);
-			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
-					    output_buffer);
+			pre_mul_alpha_blend(stage_buffer, output_buffer, x_dst, pixel_count);
 		}
 
 		apply_lut(crtc_state, output_buffer);

-- 
2.43.2

