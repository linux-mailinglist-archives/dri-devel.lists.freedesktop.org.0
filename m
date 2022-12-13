Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D1A64BDCE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765AB10E350;
	Tue, 13 Dec 2022 20:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB8F10E345
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:13:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9F10229FD;
 Tue, 13 Dec 2022 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670962357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6vXl6JARIu2b3EzVvhz2zKG4cFfExsPxoz5ZE2TWOk=;
 b=SF6VBu2E6Cmoi9AMnjVO64Nui4OnUc3q31q+zlYqEKpXO9b6rh30olvrYl24BOs5uOWABe
 on6hnosgCcddG9CJbjYk8C7dXztp+qHtDa/13f+WQlush8YyZ3ISzeq9UIc9Y8ag+c9DwY
 kwr0K5RB1Vm/bhmmftpXalRPFC39cKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670962357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6vXl6JARIu2b3EzVvhz2zKG4cFfExsPxoz5ZE2TWOk=;
 b=vkj/WMsaTuXuIECBhqfY/w5vBIxOkbfhRaOCSQKzZ/aa5k/rOXJuDpgJJ7GEugOsCPj/Ki
 RqgJRCmfYPYughCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9568138FA;
 Tue, 13 Dec 2022 20:12:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CPh9LLXcmGNyJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Dec 2022 20:12:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net
Subject: [PATCH 3/9] drm/format-helper: Add conversion from XRGB8888 to
 ARGB8888
Date: Tue, 13 Dec 2022 21:12:27 +0100
Message-Id: <20221213201233.9341-4-tzimmermann@suse.de>
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

Add dedicated helper to convert from XRGB8888 to ARGB8888. Sets
all alpha bits to make pixels fully opaque.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_format_helper.c           | 53 +++++++++++++++-
 .../gpu/drm/tests/drm_format_helper_test.c    | 63 +++++++++++++++++++
 include/drm/drm_format_helper.h               |  3 +
 3 files changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index 1c7e12610042..9bcb08cf56b5 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -444,6 +444,54 @@ void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pi
 }
 EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
 
+static void drm_fb_xrgb8888_to_argb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
+{
+	u32 *dbuf32 = dbuf;
+	const __le32 *sbuf32 = sbuf;
+	unsigned int x;
+	u32 pix;
+
+	for (x = 0; x < pixels; x++) {
+		pix = le32_to_cpu(sbuf32[x]);
+		pix |= GENMASK(31, 24); /* fill alpha bits */
+		dbuf32[x] = cpu_to_le32(pix);
+	}
+}
+
+/**
+ * drm_fb_xrgb8888_to_argb8888 - Convert XRGB8888 to ARGB8888 clip buffer
+ * @dst: Array of ARGB8888 destination buffers
+ * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
+ *             within @dst; can be NULL if scanlines are stored next to each other.
+ * @src: Array of XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * This function copies parts of a framebuffer to display memory and converts the
+ * color format during the process. The parameters @dst, @dst_pitch and @src refer
+ * to arrays. Each array must have at least as many entries as there are planes in
+ * @fb's format. Each entry stores the value for the format's respective color plane
+ * at the same index.
+ *
+ * This function does not apply clipping on @dst (i.e. the destination is at the
+ * top-left corner).
+ *
+ * Drivers can use this function for ARGB8888 devices that don't support XRGB8888
+ * natively. It sets an opaque alpha channel as part of the conversion.
+ */
+void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip)
+{
+	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
+		4,
+	};
+
+	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
+		    drm_fb_xrgb8888_to_argb8888_line);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_argb8888);
+
 static void drm_fb_rgb565_to_xrgb8888_line(void *dbuf, const void *sbuf, unsigned int pixels)
 {
 	__le32 *dbuf32 = dbuf;
@@ -644,8 +692,6 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 	/* treat alpha channel like filler bits */
 	if (fb_format == DRM_FORMAT_ARGB8888)
 		fb_format = DRM_FORMAT_XRGB8888;
-	if (dst_format == DRM_FORMAT_ARGB8888)
-		dst_format = DRM_FORMAT_XRGB8888;
 	if (fb_format == DRM_FORMAT_ARGB2101010)
 		fb_format = DRM_FORMAT_XRGB2101010;
 	if (dst_format == DRM_FORMAT_ARGB2101010)
@@ -667,6 +713,9 @@ int drm_fb_blit(struct iosys_map *dst, const unsigned int *dst_pitch, uint32_t d
 		} else if (dst_format == DRM_FORMAT_RGB888) {
 			drm_fb_xrgb8888_to_rgb888(dst, dst_pitch, src, fb, clip);
 			return 0;
+		} else if (dst_format == DRM_FORMAT_ARGB8888) {
+			drm_fb_xrgb8888_to_argb8888(dst, dst_pitch, src, fb, clip);
+			return 0;
 		} else if (dst_format == DRM_FORMAT_XRGB2101010) {
 			drm_fb_xrgb8888_to_xrgb2101010(dst, dst_pitch, src, fb, clip);
 			return 0;
diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 2191e57f2297..189483ef98ea 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -37,6 +37,11 @@ struct convert_to_rgb888_result {
 	const u8 expected[TEST_BUF_SIZE];
 };
 
+struct convert_to_argb8888_result {
+	unsigned int dst_pitch;
+	const u32 expected[TEST_BUF_SIZE];
+};
+
 struct convert_to_xrgb2101010_result {
 	unsigned int dst_pitch;
 	const u32 expected[TEST_BUF_SIZE];
@@ -51,6 +56,7 @@ struct convert_xrgb8888_case {
 	struct convert_to_rgb332_result rgb332_result;
 	struct convert_to_rgb565_result rgb565_result;
 	struct convert_to_rgb888_result rgb888_result;
+	struct convert_to_argb8888_result argb8888_result;
 	struct convert_to_xrgb2101010_result xrgb2101010_result;
 };
 
@@ -77,6 +83,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x00, 0x00, 0xFF },
 		},
+		.argb8888_result = {
+			.dst_pitch = 0,
+			.expected = { 0xFFFF0000 },
+		},
 		.xrgb2101010_result = {
 			.dst_pitch = 0,
 			.expected = { 0x3FF00000 },
@@ -107,6 +117,10 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 			.dst_pitch = 0,
 			.expected = { 0x00, 0x00, 0xFF },
 		},
+		.argb8888_result = {
+			.dst_pitch = 0,
+			.expected = { 0xFFFF0000 },
+		},
 		.xrgb2101010_result = {
 			.dst_pitch = 0,
 			.expected = { 0x3FF00000 },
@@ -169,6 +183,15 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
 			},
 		},
+		.argb8888_result = {
+			.dst_pitch = 0,
+			.expected = {
+				0xFFFFFFFF, 0xFF000000,
+				0xFFFF0000, 0xFF00FF00,
+				0xFF0000FF, 0xFFFF00FF,
+				0xFFFFFF00, 0xFF00FFFF,
+			},
+		},
 		.xrgb2101010_result = {
 			.dst_pitch = 0,
 			.expected = {
@@ -229,6 +252,14 @@ static struct convert_xrgb8888_case convert_xrgb8888_cases[] = {
 				0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 			},
 		},
+		.argb8888_result = {
+			.dst_pitch = 20,
+			.expected = {
+				0xFF0E449C, 0xFF114D05, 0xFFA80303, 0x00000000, 0x00000000,
+				0xFF6C7073, 0xFF0E449C, 0xFF114D05, 0x00000000, 0x00000000,
+				0xFFA80303, 0xFF6C7073, 0xFF0E449C, 0x00000000, 0x00000000,
+			},
+		},
 		.xrgb2101010_result = {
 			.dst_pitch = 20,
 			.expected = {
@@ -411,6 +442,37 @@ static void drm_test_fb_xrgb8888_to_rgb888(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
 }
 
+static void drm_test_fb_xrgb8888_to_argb8888(struct kunit *test)
+{
+	const struct convert_xrgb8888_case *params = test->param_value;
+	const struct convert_to_argb8888_result *result = &params->argb8888_result;
+	size_t dst_size;
+	__u32 *buf = NULL;
+	__u32 *xrgb8888 = NULL;
+	struct iosys_map dst, src;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_ARGB8888,
+				       result->dst_pitch, &params->clip);
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
+	drm_fb_xrgb8888_to_argb8888(&dst, &result->dst_pitch, &src, &fb, &params->clip);
+	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
+	KUNIT_EXPECT_EQ(test, memcmp(buf, result->expected, dst_size), 0);
+}
+
 static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 {
 	const struct convert_xrgb8888_case *params = test->param_value;
@@ -447,6 +509,7 @@ static struct kunit_case drm_format_helper_test_cases[] = {
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb332, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb565, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_rgb888, convert_xrgb8888_gen_params),
+	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_argb8888, convert_xrgb8888_gen_params),
 	KUNIT_CASE_PARAM(drm_test_fb_xrgb8888_to_xrgb2101010, convert_xrgb8888_gen_params),
 	{}
 };
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index eb5c98cf82b8..3ce8129dfe43 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -33,6 +33,9 @@ void drm_fb_xrgb8888_to_rgb565(struct iosys_map *dst, const unsigned int *dst_pi
 void drm_fb_xrgb8888_to_rgb888(struct iosys_map *dst, const unsigned int *dst_pitch,
 			       const struct iosys_map *src, const struct drm_framebuffer *fb,
 			       const struct drm_rect *clip);
+void drm_fb_xrgb8888_to_argb8888(struct iosys_map *dst, const unsigned int *dst_pitch,
+				 const struct iosys_map *src, const struct drm_framebuffer *fb,
+				 const struct drm_rect *clip);
 void drm_fb_xrgb8888_to_xrgb2101010(struct iosys_map *dst, const unsigned int *dst_pitch,
 				    const struct iosys_map *src, const struct drm_framebuffer *fb,
 				    const struct drm_rect *clip);
-- 
2.38.1

