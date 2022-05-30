Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D945378E5
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 12:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06F10E4D4;
	Mon, 30 May 2022 10:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD1410E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 10:20:35 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c5-20020a1c3505000000b0038e37907b5bso8137530wma.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vwQvKjruiYRDvc0VTu2YTcpNWREBhBz6WODeePVxVj4=;
 b=ENNC1PTiwcNYIr3PUDMg6bgC0XU/eWjopPXfQaIA9N7ceAmW55Ku/n17e2HVK1+NND
 EWm0MwHUkRlEaSf1enL9KBmfQow7rtfwtYdAruR5jBjqv8OmPv8HlJCMh5fmRt0Arzs0
 V8n2tT3Ffs5SoSjiQ6kW+BZWQaU8tjzFy9ftF+Q+ukyv52OtJ2mpmg1vysF47XxY7HPb
 N/21FzgvFWGPTDRTGYtofvpvT1E1W7XZ8K2662kv8U07LVLEqQhbNrtZnuHdHA7H7+co
 9wfW3kbKdVi6E5pfHBgU2O8VTlmwfOF4TyEDzI94KZ24/ky2cwkIcyfmji36azPwxSsh
 pirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vwQvKjruiYRDvc0VTu2YTcpNWREBhBz6WODeePVxVj4=;
 b=pEJnwjur2kmZ2I2a35HW9gXhOBZLRiLUIKs5N3cWZuFZla0PR87sPs7nC1w4JYPusp
 QPap0MV697b7P8eQ4V/jU9mVuFO60FAvu/YFb81llPvhfdWZDcHx5sSTox2/SxXX8ieQ
 /3NnLBSu6eXE4RIviqrNpX2doiW7y+ki0wr2OanoN8CYUTF8CNuejJA6hKh4uzTRRgn+
 L5A7K681SGkpD6Pmkm9Vvi6UgH2c32KhgzaUtRt1ERX2epRPIv81zFCXUheCm9I7fZl5
 RS8YnuG+ivcPyIwnI9l3Pf0u5dlWcvZSo8lux725Cf/bL9w9r+CfbSyDfDU7+Jku1w8N
 +IxQ==
X-Gm-Message-State: AOAM531Y2tAd2U8Zmw23q2vPPlikmeREdhU+CPKB2xcrm8at3wX8kqLK
 t9y4+ylngIPzh0j/qsCip5s=
X-Google-Smtp-Source: ABdhPJxL3vZuVXfnKO7PAsd5B6SVjTmyB128/hMed8GbealAla7cC+s1Qs0NHQziADSKexCBBawwtg==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr18207748wmj.38.1653906033682; 
 Mon, 30 May 2022 03:20:33 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b003973ea7e725sm12986293wmq.0.2022.05.30.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 03:20:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [RFC PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Date: Mon, 30 May 2022 12:20:17 +0200
Message-Id: <20220530102017.471865-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220530102017.471865-1-jose.exposito89@gmail.com>
References: <20220530102017.471865-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test the conversion from XRGB8888 to RGB332.

What is tested?

 - Different values for the X in XRGB8888 to make sure it is ignored
 - Different clip values: Single pixel and full and partial buffer
 - Well know colors: White, black, red, green, blue, magenta, yellow
   and cyan
 - Other colors: Randomly picked
 - Destination pitch

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/Kconfig                  |  12 ++
 drivers/gpu/drm/Makefile                 |   3 +
 drivers/gpu/drm/drm_format_helper_test.c | 166 +++++++++++++++++++++++
 3 files changed, 181 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_format_helper_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e88c497fa010..d92be6faef15 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -76,6 +76,18 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_FORMAR_HELPER_TEST
+	bool "drm_format_helper tests" if !KUNIT_ALL_TESTS
+	depends on DRM && KUNIT=y
+	select DRM_KMS_HELPER
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the drm_format_helper APIs. This option is not
+	  useful for distributions or general kernels, but only for kernel
+	  developers working on DRM and associated drivers.
+
+	  If in doubt, say "N".
+
 config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
         bool "Enable refcount backtrace history in the DP MST helpers"
 	depends on STACKTRACE_SUPPORT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 15fe3163f822..6a7d7655d38c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -76,6 +76,9 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 #
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
+obj-$(CONFIG_DRM_FORMAR_HELPER_TEST) += drm_kms_helper.o \
+		drm_format_helper_test.o
+CFLAGS_drm_format_helper_test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
diff --git a/drivers/gpu/drm/drm_format_helper_test.c b/drivers/gpu/drm/drm_format_helper_test.c
new file mode 100644
index 000000000000..9c8a3007346c
--- /dev/null
+++ b/drivers/gpu/drm/drm_format_helper_test.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_device.h>
+#include <drm/drm_file.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_print.h>
+#include <drm/drm_rect.h>
+
+#include "drm_crtc_internal.h"
+
+#define TEST_BUF_SIZE 50
+#define CLIP(x, y, w, h) { (x), (y), (x) + (w), (y) + (h) }
+
+struct xrgb8888_to_rgb332_case {
+	const char *name;
+	unsigned int pitch;
+	unsigned int dst_pitch;
+	struct drm_rect clip;
+	const u32 xrgb8888[TEST_BUF_SIZE];
+	const u8 expected[4 * TEST_BUF_SIZE];
+};
+
+static struct xrgb8888_to_rgb332_case xrgb8888_to_rgb332_cases[] = {
+	{
+		.name = "Single pixel source",
+		.pitch = 1 * 4,
+		.dst_pitch = 0,
+		.clip = CLIP(0, 0, 1, 1),
+		.xrgb8888 = { 0x01FF0000 },
+		.expected = { 0xE0 },
+	},
+	{
+		.name = "Single pixel clip",
+		.pitch = 2 * 4,
+		.dst_pitch = 0,
+		.clip = CLIP(1, 1, 1, 1),
+		.xrgb8888 = {
+			0x00000000, 0x00000000,
+			0x00000000, 0x10FF0000,
+		},
+		.expected = { 0xE0 },
+	},
+	{
+		.name = "White, black, red, green, blue, magenta, yellow, cyan",
+		.pitch = 4 * 4,
+		.dst_pitch = 0,
+		.clip = CLIP(1, 1, 2, 4),
+		.xrgb8888 = {
+			0x00000000, 0x00000000, 0x00000000, 0x00000000,
+			0x00000000, 0x11FFFFFF, 0x22000000, 0x00000000,
+			0x00000000, 0x33FF0000, 0x4400FF00, 0x00000000,
+			0x00000000, 0x550000FF, 0x66FF00FF, 0x00000000,
+			0x00000000, 0x77FFFF00, 0x8800FFFF, 0x00000000,
+		},
+		.expected = {
+			0xFF, 0x00,
+			0xE0, 0x1C,
+			0x03, 0xE3,
+			0xFC, 0x1F,
+		},
+	},
+	{
+		.name = "Destination pitch",
+		.pitch = 3 * 4,
+		.dst_pitch = 5,
+		.clip = CLIP(0, 0, 3, 3),
+		.xrgb8888 = {
+			0xA10E449C, 0xB1114D05, 0xC1A80303,
+			0xD16C7073, 0xA20E449C, 0xB2114D05,
+			0xC2A80303, 0xD26C7073, 0xA30E449C,
+		},
+		.expected = {
+			0x0A, 0x08, 0xA0, 0x00, 0x00,
+			0x6D, 0x0A, 0x08, 0x00, 0x00,
+			0xA0, 0x6D, 0x0A, 0x00, 0x00,
+		},
+	},
+};
+
+/**
+ * conversion_buf_size - Return the destination buffer size required to convert
+ * between formats.
+ * @src_format: source buffer pixel format (DRM_FORMAT_*)
+ * @dst_format: destination buffer pixel format (DRM_FORMAT_*)
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
+ * @clip: Clip rectangle area to convert
+ *
+ * Returns:
+ * The size of the destination buffer or negative value on error.
+ */
+static size_t conversion_buf_size(u32 src_format, u32 dst_format,
+				  unsigned int dst_pitch,
+				  const struct drm_rect *clip)
+{
+	const struct drm_format_info *src_fi = drm_format_info(src_format);
+	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
+	size_t width = drm_rect_width(clip);
+	size_t src_nbytes;
+
+	if (!src_fi || !dst_fi)
+		return -EINVAL;
+
+	if (dst_pitch)
+		width = dst_pitch;
+
+	src_nbytes = width * drm_rect_height(clip) * src_fi->cpp[0];
+	if (!src_nbytes)
+		return 0;
+
+	return (src_nbytes * dst_fi->cpp[0]) / src_fi->cpp[0];
+}
+
+static void xrgb8888_to_rgb332_case_desc(struct xrgb8888_to_rgb332_case *t,
+					 char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(xrgb8888_to_rgb332, xrgb8888_to_rgb332_cases,
+		  xrgb8888_to_rgb332_case_desc);
+
+static void xrgb8888_to_rgb332_test(struct kunit *test)
+{
+	const struct xrgb8888_to_rgb332_case *params = test->param_value;
+	size_t dst_size;
+	__u8 *dst = NULL;
+
+	struct drm_framebuffer fb = {
+		.format = drm_format_info(DRM_FORMAT_XRGB8888),
+		.pitches = { params->pitch, 0, 0 },
+	};
+
+	dst_size = conversion_buf_size(DRM_FORMAT_XRGB8888, DRM_FORMAT_RGB332,
+				       params->dst_pitch, &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	dst = kzalloc(dst_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dst);
+
+	drm_fb_xrgb8888_to_rgb332(dst, params->dst_pitch, params->xrgb8888,
+				  &fb, &params->clip);
+	KUNIT_EXPECT_EQ(test, memcmp(dst, params->expected, dst_size), 0);
+}
+
+static struct kunit_case drm_format_helper_test_cases[] = {
+	KUNIT_CASE_PARAM(xrgb8888_to_rgb332_test,
+			 xrgb8888_to_rgb332_gen_params),
+	{}
+};
+
+static struct kunit_suite drm_format_helper_test_suite = {
+	.name = "drm-format-helper-test",
+	.test_cases = drm_format_helper_test_cases,
+};
+
+kunit_test_suite(drm_format_helper_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the drm_format_helper APIs");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("José Expósito <jose.exposito89@gmail.com>");
-- 
2.25.1

