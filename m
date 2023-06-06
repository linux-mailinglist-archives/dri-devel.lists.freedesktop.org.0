Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B970724E57
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE24610E043;
	Tue,  6 Jun 2023 20:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56510E043
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 20:54:27 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QbN4y0345zDqFC;
 Tue,  6 Jun 2023 20:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1686084866; bh=nIixaJFd5nswqD6hlxITJyz18oJLt69u3PRsWlv+PwU=;
 h=From:To:Cc:Subject:Date:From;
 b=HKkJddIH+YWVD6AzBrg+I3Xm5Bttc6uoddM6iPj1TQhrQX7J4koHVySWfxotqSmaC
 u1CoNCJX703VA24+TbGU0g5NIti89snvUL1R4F6C0seOVIIjIs/N8vbB8CNTHQ/UJK
 tRCzgDMwJo0AtQ9K96/2cSLq9EY1/lWwJppPTjHw=
X-Riseup-User-ID: 4982706462238FD7428A4749C6BDEC30E9583D18BCF06DD705A0C53109095425
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QbN4p4TsLzFqgp;
 Tue,  6 Jun 2023 20:54:18 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/vkms: Add support to 1D gamma LUT
Date: Tue,  6 Jun 2023 17:53:52 -0300
Message-Id: <20230606205351.1288556-1-arthurgrillo@riseup.net>
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, pekka.paalanen@collabora.com,
 rodrigosiqueiramelo@gmail.com, xaver.hugl@gmail.com, mdaenzer@redhat.com,
 victoria@system76.com, mwen@igalia.com, mairacanal@riseup.net,
 jadahl@redhat.com, uma.shankar@intel.com, sebastian.wick@redhat.com,
 Arthur Grillo <arthurgrillo@riseup.net>, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support a 1D gamma LUT with interpolation for each color channel on the
VKMS driver. Add a check for the LUT length by creating
vkms_atomic_check().

Tested with:
igt@kms_color@gamma
igt@kms_color@legacy-gamma
igt@kms_color@invalid-gamma-lut-sizes

v2:
    - Add interpolation between the values of the LUT (Simon Ser)

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 97 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +
 drivers/gpu/drm/vkms/vkms_drv.c      | 20 +++++-
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 +
 4 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 906d3df40cdb..24bffd98ba49 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_fixed.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
@@ -89,6 +90,100 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 		output_buffer->pixels[i] = *background_color;
 }
 
+// lerp(a, b, t) = a + (b - a) * t
+static u16 lerp_u16(u16 a, u16 b, s64 t)
+{
+	s64 a_fp = drm_int2fixp(a);
+	s64 b_fp = drm_int2fixp(b);
+
+	s64 ratio = drm_fixp_mul(b_fp - a_fp,  t);
+
+	return drm_fixp2int(a_fp + ratio);
+}
+
+static s64 get_lut_index(u16 color_channel, size_t lut_length)
+{
+	const s64 max_lut_index_fp = drm_int2fixp(lut_length  - 1);
+	const s64 u16_max_fp = drm_int2fixp(0xffff);
+
+	s64 ratio = drm_fixp_div(max_lut_index_fp, u16_max_fp);
+
+	s64 color_channel_fp = drm_int2fixp(color_channel);
+
+	return drm_fixp_mul(color_channel_fp, ratio);
+}
+
+enum lut_area {
+	LUT_RED,
+	LUT_GREEN,
+	LUT_BLUE,
+	LUT_RESERVED
+};
+
+static void apply_lut_to_color_channel(u16 *color_channel, enum lut_area area,
+				       struct drm_color_lut *lut, size_t lut_length)
+{
+	s64 ratio;
+
+	s64 lut_index = get_lut_index(*color_channel, lut_length);
+
+	size_t floor_index = drm_fixp2int(lut_index);
+	size_t ceil_index = drm_fixp2int_ceil(lut_index);
+
+	struct drm_color_lut floor_lut_value = lut[floor_index];
+	struct drm_color_lut ceil_lut_value = lut[ceil_index];
+
+	u16 floor_color_channel;
+	u16 ceil_color_channel;
+
+	switch (area) {
+	case LUT_RED:
+		floor_color_channel = floor_lut_value.red;
+		ceil_color_channel = ceil_lut_value.red;
+		break;
+	case LUT_GREEN:
+		floor_color_channel = floor_lut_value.green;
+		ceil_color_channel = ceil_lut_value.green;
+		break;
+	case LUT_BLUE:
+		floor_color_channel = floor_lut_value.blue;
+		ceil_color_channel = ceil_lut_value.blue;
+		break;
+	case LUT_RESERVED:
+		floor_color_channel = floor_lut_value.reserved;
+		ceil_color_channel = ceil_lut_value.reserved;
+		break;
+	}
+
+	ratio = lut_index - drm_int2fixp(floor_index);
+
+	*color_channel = lerp_u16(floor_color_channel, ceil_color_channel, ratio);
+}
+
+static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
+{
+	struct drm_color_lut *lut;
+	size_t lut_length;
+
+	if (!crtc_state->base.gamma_lut)
+		return;
+
+	lut = (struct drm_color_lut *)crtc_state->base.gamma_lut->data;
+
+	lut_length = crtc_state->base.gamma_lut->length / sizeof(*lut);
+
+	if (!lut_length)
+		return;
+
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
+		struct pixel_argb_u16 *pixel = &output_buffer->pixels[x];
+
+		apply_lut_to_color_channel(&pixel->r, LUT_RED, lut, lut_length);
+		apply_lut_to_color_channel(&pixel->g, LUT_GREEN, lut, lut_length);
+		apply_lut_to_color_channel(&pixel->b, LUT_BLUE, lut, lut_length);
+	}
+}
+
 /**
  * @wb_frame_info: The writeback frame buffer metadata
  * @crtc_state: The crtc state
@@ -128,6 +223,8 @@ static void blend(struct vkms_writeback_job *wb,
 					    output_buffer);
 		}
 
+		apply_lut(crtc_state, output_buffer);
+
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 515f6772b866..61e500b8c9da 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -290,6 +290,9 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 
 	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
 
+	drm_mode_crtc_set_gamma_size(crtc, VKMS_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
+
 	spin_lock_init(&vkms_out->lock);
 	spin_lock_init(&vkms_out->composer_lock);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e3c9c9571c8d..dd0af086e7fa 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -120,9 +120,27 @@ static const struct drm_driver vkms_driver = {
 	.minor			= DRIVER_MINOR,
 };
 
+static int vkms_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	int i;
+
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		if (!new_crtc_state->gamma_lut || !new_crtc_state->color_mgmt_changed)
+			continue;
+
+		if (new_crtc_state->gamma_lut->length / sizeof(struct drm_color_lut *)
+		    > VKMS_LUT_SIZE)
+			return -EINVAL;
+	}
+
+	return drm_atomic_helper_check(dev, state);
+}
+
 static const struct drm_mode_config_funcs vkms_mode_funcs = {
 	.fb_create = drm_gem_fb_create,
-	.atomic_check = drm_atomic_helper_check,
+	.atomic_check = vkms_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5f1a0a44a78c..a3b7025c1b9a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -23,6 +23,8 @@
 
 #define NUM_OVERLAY_PLANES 8
 
+#define VKMS_LUT_SIZE 256
+
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
-- 
2.40.1

