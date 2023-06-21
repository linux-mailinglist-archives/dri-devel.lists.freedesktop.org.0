Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765573904B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80DA10E138;
	Wed, 21 Jun 2023 19:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BDE10E138
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 19:41:53 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QmYmJ4TT9z9t5v;
 Wed, 21 Jun 2023 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1687376513; bh=4uY51egiV3cHxsV6g1NcfQ+pOidLzDdjjGfTI3/ULeQ=;
 h=From:To:Cc:Subject:Date:From;
 b=meixzHmHMt8x+i33/5rmR+ofHdFjKkWWfiUjanTD2ePk/dWB+wcki4QHhLnl1NYmT
 gUop5iI1QnxrtpMXegg9xfOZprKBVFn1zsJNEsgSIoECEh7oCHBYj6rEv+cFufBVWU
 hEA8Kom04UkhPMVhE7BQh84LJHr/8C0W3V7SUl2Q=
X-Riseup-User-ID: 07FDE9F93894830DE6CD522B60C1C22EA3D6DA47D4EAA4052ADF9F18688865C6
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QmYlz18SrzFryq;
 Wed, 21 Jun 2023 19:41:34 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm/vkms: Add support to 1D gamma LUT
Date: Wed, 21 Jun 2023 16:41:21 -0300
Message-ID: <20230621194121.184552-1-arthurgrillo@riseup.net>
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
Cc: hamohammed.sa@gmail.com, aleixpol@kde.org, andrealmeid@riseup.net,
 pekka.paalanen@collabora.com, rodrigosiqueiramelo@gmail.com,
 xaver.hugl@gmail.com, mdaenzer@redhat.com, victoria@system76.com,
 mwen@igalia.com, mairacanal@riseup.net, jadahl@redhat.com,
 uma.shankar@intel.com, sebastian.wick@redhat.com,
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

v3:
    - s/ratio/delta (Pekka)
    - s/color_channel/channel_value (Pekka)
    - s/lut_area/lut_channel
    - Store the `drm_color_lut`, `lut_length`, and
      `channel_value2index_ratio` inside a struct called `vkms_lut`
      (Pekka)
    - Pre-compute some constants values used through the LUT procedure
      (Pekka)
    - Change the switch statement to a cast to __u16* (Pekka)
    - Make the apply_lut_to_channel_value return the computation result
      (Pekka)

v4:
    - Add a comment explaining that `enum lut_area` depends on the
      layout of `struct drm_color_lut` (Pekka)
    - Remove unused variable (kernel test robot)

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 86 ++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +
 drivers/gpu/drm/vkms/vkms_drv.c      | 20 ++++++-
 drivers/gpu/drm/vkms/vkms_drv.h      |  9 +++
 4 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 906d3df40cdb..620c0bafbe56 100644
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
@@ -89,6 +90,73 @@ static void fill_background(const struct pixel_argb_u16 *background_color,
 		output_buffer->pixels[i] = *background_color;
 }
 
+// lerp(a, b, t) = a + (b - a) * t
+static u16 lerp_u16(u16 a, u16 b, s64 t)
+{
+	s64 a_fp = drm_int2fixp(a);
+	s64 b_fp = drm_int2fixp(b);
+
+	s64 delta = drm_fixp_mul(b_fp - a_fp,  t);
+
+	return drm_fixp2int(a_fp + delta);
+}
+
+static s64 get_lut_index(const struct vkms_color_lut *lut, u16 channel_value)
+{
+	s64 color_channel_fp = drm_int2fixp(channel_value);
+
+	return drm_fixp_mul(color_channel_fp, lut->channel_value2index_ratio);
+}
+
+/*
+ * This enum is related to the positions of the variables inside
+ * `struct drm_color_lut`, so the order of both needs to be the same.
+ */
+enum lut_channel {
+	LUT_RED = 0,
+	LUT_GREEN,
+	LUT_BLUE,
+	LUT_RESERVED
+};
+
+static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 channel_value,
+				      enum lut_channel channel)
+{
+	s64 lut_index = get_lut_index(lut, channel_value);
+
+	/*
+	 * This checks if `struct drm_color_lut` had any gap added by the compiler
+	 * between the struct fields.
+	 */
+	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
+
+	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
+	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
+
+	u16 floor_channel_value = floor_lut_value[channel];
+	u16 ceil_channel_value = ceil_lut_value[channel];
+
+	return lerp_u16(floor_channel_value, ceil_channel_value,
+			lut_index & DRM_FIXED_DECIMAL_MASK);
+}
+
+static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buffer *output_buffer)
+{
+	if (!crtc_state->gamma_lut.base)
+		return;
+
+	if (!crtc_state->gamma_lut.lut_length)
+		return;
+
+	for (size_t x = 0; x < output_buffer->n_pixels; x++) {
+		struct pixel_argb_u16 *pixel = &output_buffer->pixels[x];
+
+		pixel->r = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->r, LUT_RED);
+		pixel->g = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->g, LUT_GREEN);
+		pixel->b = apply_lut_to_channel_value(&crtc_state->gamma_lut, pixel->b, LUT_BLUE);
+	}
+}
+
 /**
  * @wb_frame_info: The writeback frame buffer metadata
  * @crtc_state: The crtc state
@@ -128,6 +196,8 @@ static void blend(struct vkms_writeback_job *wb,
 					    output_buffer);
 		}
 
+		apply_lut(crtc_state, output_buffer);
+
 		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
 
 		if (wb)
@@ -242,6 +312,22 @@ void vkms_composer_worker(struct work_struct *work)
 	crtc_state->frame_start = 0;
 	crtc_state->frame_end = 0;
 	crtc_state->crc_pending = false;
+
+	if (crtc->state->gamma_lut) {
+		s64 max_lut_index_fp;
+		s64 u16_max_fp = drm_int2fixp(0xffff);
+
+		crtc_state->gamma_lut.base = (struct drm_color_lut *)crtc->state->gamma_lut->data;
+		crtc_state->gamma_lut.lut_length =
+			crtc->state->gamma_lut->length / sizeof(struct drm_color_lut);
+		max_lut_index_fp = drm_int2fixp(crtc_state->gamma_lut.lut_length  - 1);
+		crtc_state->gamma_lut.channel_value2index_ratio = drm_fixp_div(max_lut_index_fp,
+									       u16_max_fp);
+
+	} else {
+		crtc_state->gamma_lut.base = NULL;
+	}
+
 	spin_unlock_irq(&out->composer_lock);
 
 	/*
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
index 5f1a0a44a78c..f16b5d7b81ef 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -23,6 +23,8 @@
 
 #define NUM_OVERLAY_PLANES 8
 
+#define VKMS_LUT_SIZE 256
+
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
@@ -65,6 +67,12 @@ struct vkms_plane {
 	struct drm_plane base;
 };
 
+struct vkms_color_lut {
+	struct drm_color_lut *base;
+	size_t lut_length;
+	s64 channel_value2index_ratio;
+};
+
 /**
  * vkms_crtc_state - Driver specific CRTC state
  * @base: base CRTC state
@@ -80,6 +88,7 @@ struct vkms_crtc_state {
 	/* stack of active planes for crc computation, should be in z order */
 	struct vkms_plane_state **active_planes;
 	struct vkms_writeback_job *active_writeback;
+	struct vkms_color_lut gamma_lut;
 
 	/* below four are protected by vkms_output.composer_lock */
 	bool crc_pending;
-- 
2.41.0

