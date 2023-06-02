Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C161720800
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 18:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712410E5CA;
	Fri,  2 Jun 2023 16:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2D510E05B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 16:57:35 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QXq1V1ClHz9swf;
 Fri,  2 Jun 2023 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1685725054; bh=17f4rfetdYA04j6O3bcOCA0mE2+4bXoZwOGv+V7Uft8=;
 h=From:To:Cc:Subject:Date:From;
 b=TreDHPm77ncQya+iiM/iPa1fisZ8GmbbJL9xms/NfKTZ9A87pf35vZ+DeoQ/LgNHl
 KsvikSVwLxdHvUiH789Z3B5dn6oAzP1BuAc94YVfcC1BVhGmbE4hfoYwd8zx5hOlWY
 EANOVyCPbiCtGnELiXwoYr9qPj/f5Bk4X0cPNUTk=
X-Riseup-User-ID: D126634DE546929216215C86575F5F5DA77990E76AC39A3AF7113F8042D72D42
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QXq1N46RfzFpbL;
 Fri,  2 Jun 2023 16:57:28 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vkms: Add support to 1D gamma LUT
Date: Fri,  2 Jun 2023 13:57:15 -0300
Message-Id: <20230602165715.292382-1-arthurgrillo@riseup.net>
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

Support a 1D gamma LUT for each color channel on the VKMS driver. Add a
check for the LUT length by creating vkms_atomic_check().

Tested with:
igt@kms_color@gamma
igt@kms_color@legacy-gamma
igt@kms_color@invalid-gamma-lut-sizes

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +++
 drivers/gpu/drm/vkms/vkms_drv.c      | 20 +++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_drv.h      |  2 ++
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 906d3df40cdb..7ec9ebe28d5a 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -89,6 +89,32 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 		output_buffer->pixels[i] = *background_color;
 }
 
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
+		size_t lut_r_index = output_buffer->pixels[x].r * (lut_length - 1) / 0xffff;
+		size_t lut_g_index = output_buffer->pixels[x].g * (lut_length - 1) / 0xffff;
+		size_t lut_b_index = output_buffer->pixels[x].b * (lut_length - 1) / 0xffff;
+
+		output_buffer->pixels[x].r = lut[lut_r_index].red;
+		output_buffer->pixels[x].g = lut[lut_g_index].green;
+		output_buffer->pixels[x].b = lut[lut_b_index].blue;
+	}
+}
+
 /**
  * @wb_frame_info: The writeback frame buffer metadata
  * @crtc_state: The crtc state
@@ -128,6 +154,8 @@ static void blend(struct vkms_writeback_job *wb,
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

