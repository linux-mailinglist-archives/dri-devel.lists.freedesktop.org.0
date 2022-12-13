Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D8264BDCC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B45510E349;
	Tue, 13 Dec 2022 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69610E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:12:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5FE6D22A05;
 Tue, 13 Dec 2022 20:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670962358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPS0DIHw8ytWrLtwprnG6o5u5rroOx2QFJYf0xgOYKg=;
 b=lPRoiR9IGquAG9db3e5Rqckfb3U3jo5m1NYpjX11lv5/JbqfZ+jGIiOQQZNjYS3cmTv53G
 TcR+6Pb6blbC0lc1AotiO+fmakfnwNm1f7JRJ149wIf/F+zvddLgr84RA1kVO2tqFpPWHK
 KupanzlNRJjubO6Q18mkxXmsig0PhV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670962358;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPS0DIHw8ytWrLtwprnG6o5u5rroOx2QFJYf0xgOYKg=;
 b=zhjqS35JWdX6y6J8qDO98gj0Ac9D/9HzO4kQqCZhkNPLpVkLLkfCfsPwBHQ1F5WiMlP0tJ
 xt5Zuv8ThXszlfCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DF86138FA;
 Tue, 13 Dec 2022 20:12:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CNNqCrbcmGNyJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Dec 2022 20:12:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net
Subject: [PATCH 5/9] drm/format-helper: Add conversion from XRGB8888 to 15-bit
 RGB555 formats
Date: Tue, 13 Dec 2022 21:12:29 +0100
Message-Id: <20221213201233.9341-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213201233.9341-1-tzimmermann@suse.de>
References: <20221213201233.9341-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add conversion from XRGB8888 to XRGB1555, ARGB1555 and RGBA5551, which
are the formats currently supported by the simplefb infrastructure. The
new helpers allow the output of XRGB8888 framebuffers to firmware
scanout buffers in one of the 15-bit formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 164 +++++++++++++++
 .../gpu/drm/tests/drm_format_helper_test.c    | 186 ++++++++++++++++++
 include/drm/drm_format_helper.h               |   9 +
 3 files changed, 359 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index e562a3cefb89..aa6138756458 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -395,6 +395,161 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb565);
 
+static void drm_fb_xrgb8888_to_xrgb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u16 *dbuf16 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u16 val16;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		val16 = ((pix & 0x00f80000) >> 9) |
+			((pix & 0x0000f800) >> 6) |
+			((pix & 0x000000f8) >> 3);
+		dbuf16[x] = cpu_to_le16(val16);
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_xrgb1555 - Convert XRGB8888 to XRGB1555 clip buffer
+ * @dst: Array of XRGB1555 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * This function copies parts of a framebuffer to display memory and converts
+ * the color format during the process. The parameters @dst, @dst_pitch and
+ * @src refer to arrays. Each array must have at least as many entries as
+ * there are planes in @fb's format. Each entry stores the value for the
+ * format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for XRGB1555 devices that don't support
+ * XRGB8888 natively.
+ */
+void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_xrgb1555_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_xrgb1555);
+
+static void drm_fb_xrgb8888_to_argb1555_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u16 *dbuf16 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u16 val16;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		val16 = BIT(15) | /* set alpha bit */
+			((pix & 0x00f80000) >> 9) |
+			((pix & 0x0000f800) >> 6) |
+			((pix & 0x000000f8) >> 3);
+		dbuf16[x] = cpu_to_le16(val16);
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_argb1555 - Convert XRGB8888 to ARGB1555 clip buffer
+ * @dst: Array of ARGB1555 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * This function copies parts of a framebuffer to display memory and converts
+ * the color format during the process. The parameters @dst, @dst_pitch and
+ * @src refer to arrays. Each array must have at least as many entries as
+ * there are planes in @fb's format. Each entry stores the value for the
+ * format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for ARGB1555 devices that don't support
+ * XRGB8888 natively. It sets an opaque alpha channel as part of the conversion.
+ */
+void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_argb1555_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb1555);
+
+static void drm_fb_xrgb8888_to_rgba5551_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u16 *dbuf16 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u16 val16;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		val16 = ((pix & 0x00f80000) >> 8) |
+			((pix & 0x0000f800) >> 5) |
+			((pix & 0x000000f8) >> 2) |
+			BIT(0); /* set alpha bit */
+		dbuf16[x] = cpu_to_le16(val16);
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_rgba5551 - Convert XRGB8888 to RGBA5551 clip buffer
+ * @dst: Array of RGBA5551 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * This function copies parts of a framebuffer to display memory and converts
+ * the color format during the process. The parameters @dst, @dst_pitch and
+ * @src refer to arrays. Each array must have at least as many entries as
+ * there are planes in @fb's format. Each entry stores the value for the
+ * format's respective color plane at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for RGBA5551 devices that don't support
+ * XRGB8888 natively. It sets an opaque alpha channel as part of the conversion.
+ */
+void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		2,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_rgba5551_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgba5551);
+
 static void drm_fb_xrgb8888_to_rgb888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	u8 *dbuf8 = dbuf;
@@ -761,6 +916,15 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		if (dst_format == DRM_FORMAT_RGB565) {
 			drm_fb_xrgb8888_to_rgb565(dst, dst_pitch, src, fb, clip, false);
 			return 0;
+		} else if (dst_format == DRM_FORMAT_XRGB1555) {
+			drm_fb_xrgb8888_to_xrgb1555(dst, dst_pitch, src, fb, clip);
+			return 0;
+		} else if (dst_format == DRM_FORMAT_ARGB1555) {
+			drm_fb_xrgb8888_to_argb1555(dst, dst_pitch, src, fb, clip);
+			return 0;
+		} else if (dst_format == DRM_FORMAT_RGBA5551) {
+			drm_fb_xrgb8888_to_rgba5551(dst, dst_pitch, src, fb, clip);
+			return 0;
 		} else if (dst_format == DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
 			return 0;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index b15dc7c1eb96..e01695c70bb6 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -32,6 +32,21 @@ struct convert_to_rgb565_result {
 	const u16 expected_swab[TEST_BUF_SIZE];
 };
 
+struct convert_to_xrgb1555_result {
+	unsigned int dst_pitch;
+	const u16 expected[TEST_BUF_SIZE];
+};
+
+struct convert_to_argb1555_result {
+	unsigned int dst_pitch;
+	const u16 expected[TEST_BUF_SIZE];
+};
+
+struct convert_to_rgba5551_result {
+	unsigned int dst_pitch;
+	const u16 expected[TEST_BUF_SIZE];
+};
+
 struct convert_to_rgb888_result {
 	unsigned int dst_pitch;
 	const u8 expected[TEST_BUF_SIZE];
@@ -60,6 +75,9 @@ struct convert_xrgb8888_case {
 	struct convert_to_gray8_result gray8_result;
 	struct convert_to_rgb332_result rgb332_result;
 	struct convert_to_rgb565_result rgb565_result;
+	struct convert_to_xrgb1555_result xrgb1555_result;
+	struct convert_to_argb1555_result argb1555_result;
+	struct convert_to_rgba5551_result rgba5551_result;
 	struct convert_to_rgb888_result rgb888_result;
 	struct convert_to_argb8888_result argb8888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
@@ -85,6 +103,18 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.expected = { 0xF800 },
 			.expected_swab = { 0x00F8 },
 		},
+		.xrgb1555_result = {
+			.dst_pitch = 0,
+			.expected = { 0x7C00 },
+		},
+		.argb1555_result = {
+			.dst_pitch = 0,
+			.expected = { 0xFC00 },
+		},
+		.rgba5551_result = {
+			.dst_pitch = 0,
+			.expected = { 0xF801 },
+		},
 		.rgb888_result = {
 			.dst_pitch = 0,
 			.expected = { 0x00, 0x00, 0xFF },
@@ -123,6 +153,18 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.expected = { 0xF800 },
 			.expected_swab = { 0x00F8 },
 		},
+		.xrgb1555_result = {
+			.dst_pitch = 0,
+			.expected = { 0x7C00 },
+		},
+		.argb1555_result = {
+			.dst_pitch = 0,
+			.expected = { 0xFC00 },
+		},
+		.rgba5551_result = {
+			.dst_pitch = 0,
+			.expected = { 0xF801 },
+		},
 		.rgb888_result = {
 			.dst_pitch = 0,
 			.expected = { 0x00, 0x00, 0xFF },
@@ -188,6 +230,33 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0xE0FF, 0xFF07,
 			},
 		},
+		.xrgb1555_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0x7FFF, 0x0000,
+				0x7C00, 0x03E0,
+				0x001F, 0x7C1F,
+				0x7FE0, 0x03FF,
+			},
+		},
+		.argb1555_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFFFF, 0x8000,
+				0xFC00, 0x83E0,
+				0x801F, 0xFC1F,
+				0xFFE0, 0x83FF,
+			},
+		},
+		.rgba5551_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFFFF, 0x0001,
+				0xF801, 0x07C1,
+				0x003F, 0xF83F,
+				0xFFC1, 0x07FF,
+			},
+		},
 		.rgb888_result = {
 			.dst_pitch = 0,
 			.expected = {
@@ -264,6 +333,30 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00A8, 0x8E6B, 0x330A, 0x0000, 0x0000,
 			},
 		},
+		.xrgb1555_result = {
+			.dst_pitch = 10,
+			.expected = {
+				0x0513, 0x0920, 0x5400, 0x0000, 0x0000,
+				0x35CE, 0x0513, 0x0920, 0x0000, 0x0000,
+				0x5400, 0x35CE, 0x0513, 0x0000, 0x0000,
+			},
+		},
+		.argb1555_result = {
+			.dst_pitch = 10,
+			.expected = {
+				0x8513, 0x8920, 0xD400, 0x0000, 0x0000,
+				0xB5CE, 0x8513, 0x8920, 0x0000, 0x0000,
+				0xD400, 0xB5CE, 0x8513, 0x0000, 0x0000,
+			},
+		},
+		.rgba5551_result = {
+			.dst_pitch = 10,
+			.expected = {
+				0x0A27, 0x1241, 0xA801, 0x0000, 0x0000,
+				0x6B9D, 0x0A27, 0x1241, 0x0000, 0x0000,
+				0xA801, 0x6B9D, 0x0A27, 0x0000, 0x0000,
+			},
+		},
 		.rgb888_result = {
 			.dst_pitch = 15,
 			.expected = {
@@ -443,6 +536,96 @@ static void drm_test_fb_xrgb8888_to_rgb565(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected_swab, dst_size), 0);
 }
 
+static void drm_test_fb_xrgb8888_to_xrgb1555(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_xrgb1555_result *result = &params->xrgb1555_result;
+	size_t dst_size;
+	__u16 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_XRGB1555, result->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_xrgb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
+static void drm_test_fb_xrgb8888_to_argb1555(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_argb1555_result *result = &params->argb1555_result;
+	size_t dst_size;
+	__u16 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_ARGB1555, result->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_argb1555(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
+static void drm_test_fb_xrgb8888_to_rgba5551(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_rgba5551_result *result = &params->rgba5551_result;
+	size_t dst_size;
+	__u16 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_RGBA5551, result->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+	iosys_map_set_vaddr(&dst, buf);
+
+	xrgb8888 = le32buf_to_cpu(test, params->xrgb8888, TEST_BUF_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
+	iosys_map_set_vaddr(&src, xrgb8888);
+
+	drm_fb_xrgb8888_to_rgba5551(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
 static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params = test->param_value;
@@ -570,6 +753,9 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_gray8, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb1555, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb1555, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgba5551, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index 10b2d19cdb66..2d04f5863722 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -30,6 +30,15 @@ void drm_fb_xrgb8888_to_rgb332(struct iosys_map *dst, const unsigned int *dst_pi
 void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_xrgb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_argb1555(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_rgba5551(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
-- 
2.38.1

