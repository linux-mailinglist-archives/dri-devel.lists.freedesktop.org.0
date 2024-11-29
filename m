Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F09D181A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 19:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6CC10E553;
	Mon, 18 Nov 2024 18:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TBMYDuoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F4A10E554
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 18:28:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA23DE000C;
 Mon, 18 Nov 2024 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731954515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vK9ytFaaPEDEsPnjBisZ9VIJq0X6SRCq0EddMMj7WU4=;
 b=TBMYDuoGbQoeVBnULviy+mtXVC8BC09/y9jGZ/Qi16zaoMy55a8uWW/R8a7arxKjxErm7O
 7yoiG4UOn64wvyXbh6NofF4JCEmBElgshnsqjmuJPP9snixKuZWy83KLbRdUDOf3AJB6oD
 pmgEwtcQF9w6YteHZslqGhz0zARYLWmxkSeSf3Umcwgk/2hhsHC6nXypYrfqd43csYTiDs
 dsvEUiuLICemm6fADxdIRjMm49s1upzss8AFaf5DCcgf1uVqSJkjRuslepuKZgmuTKhDST
 omROF2kHxqa62BeuS5puhFHC4IeQxaAPFJd4YkHs0CRKx8IjnNQUtFgJhnDG/g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 18 Nov 2024 19:28:21 +0100
Subject: [PATCH v14 6/9] drm/vkms: Avoid computing blending limits inside
 pre_mul_alpha_blend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241118-yuv-v14-6-2dbc2f1e222c@bootlin.com>
References: <20241118-yuv-v14-0-2dbc2f1e222c@bootlin.com>
In-Reply-To: <20241118-yuv-v14-0-2dbc2f1e222c@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>, 
 Helen Koike <helen.koike@collabora.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4191;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=U2uuDNXylIww1C2iIse1SldLLFIaLgZgPM9EJr7nGnE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnO4dGYi25stMLgzG6NcF6PvkI30j0f4DVCPcYp
 OJw5/OExf6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZzuHRgAKCRAgrS7GWxAs
 4p9qEACeMh6xi7K2/oh8ZWR7VasIaub/cbx97/MVcFtuJyKpz00B1DFzNF7lCKJmjru9ysx6jQn
 XM/zMWDtVL7Kp6cyMvdgrVtH11+xfc5nV9vOJChvQDk0D/erxq7zCCWsWXE64nVwcmZRqIZZvn3
 Y0A9HG5by2N3YrUGyWPmBswX8cGTpbO2BcaBodXQtj2gVA1Dx8ozpiT0J4yN546IGe9K+afOCwX
 s8zRfV/NAZbu20BQB8mKRt0epha/xGnk8QkVu8ypDn/tXkrOaQjvsWllW3nTWt6bvG/NWIkHZSx
 RNaHR/k303oFz12cVa0d87YQF7Mm12oB3SX3BUSdDEHmHL8GobwpCQwB/pDocnC6ws4JGfPqR1z
 GAKW8cu3TFEakeeIoI56Xi2PL+iL8klG27OyDGoAl950Z1JPTABkqQ6fLwi4+rjEMNOdvKXMUrD
 s7l+JoP+t8RAfvVVYZUfDCyY8YfIHsQB/KFYvUB+LvzAUXlWeqpii0IX3pab8vnwVWIdo5yHwnj
 jzEX7TYZGQpmLTAj/CLEdftMri5/zd/a9YQiGu87Rni4LvbLO+duUkYL1MrRMpt6pcuDoiD0g2S
 7e9ISQ3u8aTXkktEU7X12WUFXvR2nc+05AUsE9hAWEDssyhJ91p8hgvFlr3Aner65Hv1EedUHfR
 DN/X0gwjAxa0+ag==
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
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 40 +++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 9d1ec06b986fd81949a09e67136dd9bd5c76bf46..e406ab4b14fd4288816565b3cabec93cea5834ae 100644
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
+ * The pixels [0;@pixel_count) in stage_buffer are blended at [@x_start;@x_start+@pixel_count) in
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
2.47.0

