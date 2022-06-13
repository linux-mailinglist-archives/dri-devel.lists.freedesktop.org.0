Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B078D5499A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE02C10F3C8;
	Mon, 13 Jun 2022 17:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5123810E58C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:17:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id v14so7981119wra.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aBTnuGESBCUEiwOafkRvyvkfuq0zr4bR2Y26oGOBUuw=;
 b=d7KPqbtKuU+6d5cr6ROdZ0C1OP1OWk9Zj5HHKVQ9WEvffYP6U76wEbnNccHijn0/qX
 xCLb/3a/5DRj9bL4WB50QWYuRV0U0adLscw+pFmXKXkZXmpOpyTJGD9vh/RazRMe8LFs
 4pj/CpRXn/ta80Hm02DfDLJv0OyqC1zRgOLHNTsuXezVucCSg4Wt1JfKT/mWugoK4TE/
 agRABD90QHJY3lnCIVBs8weSo1+160hZ0L0GwpGowySz4U/Q81zj2n6Ue+S3FuFqG0Ow
 7n8PcZpNR2TkaH3Tji3UQfpY7X07/uKgU4F74gpDU+oPqY/QnS50gqgmXcqqmIxmYVrc
 fFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aBTnuGESBCUEiwOafkRvyvkfuq0zr4bR2Y26oGOBUuw=;
 b=SNuttTTe5Df2+5jLp5mKzMVssfGBxRfTJvk7LncMTIhaiUhQJqejzMDkCoQ1fg2CA9
 S7d9nccEt9BmE34f552xU9R6YdN0+svhKrL9wSugjo2/Ss8Bf3uW8wVyywg43d70d5Tm
 0gLeC87X9lNC1sqw2ETgUW5WjecesV3nlCdGLbRw9kMBIlQ9VKGZHKir3Rh6vr2aCyPp
 ayUYwyBEF5Efq/GMcQ/Z4JGkCkEOpwGutLAsxddQ3GReQyLS9CmIQpPtquRS5snB9OD8
 95y7rNgsq8NjI/6mb/39CL2r7y+2gHwg7NsGr05CSM4KHTdhDEACe9ht3AHarhgGQtn8
 iLtA==
X-Gm-Message-State: AJIora+BKWKDJhWV7v/4WO+3eyAd6I26I+myfhyXEJonG5ZQqML/5WIA
 c7bnc+iKfyvOFLTur9EEFMo=
X-Google-Smtp-Source: AGRyM1ujLhG3/Nv93ncuamX3kngdkhXy1jnzaw1R0vCjED5U0raoEe+8B1jZ8Wi1gvGfKLc59yoNMw==
X-Received: by 2002:adf:e384:0:b0:213:b1d4:a964 with SMTP id
 e4-20020adfe384000000b00213b1d4a964mr775957wrm.653.1655140668632; 
 Mon, 13 Jun 2022 10:17:48 -0700 (PDT)
Received: from localhost.localdomain ([94.73.36.128])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a056000100a00b0020d106c0386sm9016129wrx.89.2022.06.13.10.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:17:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: javierm@redhat.com
Subject: [PATCH v3 2/3] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
Date: Mon, 13 Jun 2022 19:17:37 +0200
Message-Id: <20220613171738.111013-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com, airlied@linux.ie,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test the conversion from XRGB8888 to RGB332.

What is tested?

 - Different values for the X in XRGB8888 to make sure it is ignored
 - Different clip values: Single pixel and full and partial buffer
 - Well known colors: White, black, red, green, blue, magenta, yellow
   and cyan
 - Other colors: Randomly picked
 - Destination pitch

How to run the tests?

 $ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/gpu/drm/kunit \
         --kconfig_add CONFIG_VIRTIO_UML=y \
         --kconfig_add CONFIG_UML_PCI_OVER_VIRTIO=y

Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/Kconfig                       |  16 ++
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/kunit/.kunitconfig            |   3 +
 drivers/gpu/drm/kunit/Makefile                |   3 +
 .../gpu/drm/kunit/drm_format_helper_test.c    | 160 ++++++++++++++++++
 5 files changed, 183 insertions(+)
 create mode 100644 drivers/gpu/drm/kunit/.kunitconfig
 create mode 100644 drivers/gpu/drm/kunit/Makefile
 create mode 100644 drivers/gpu/drm/kunit/drm_format_helper_test.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 22e7fa48d693..6c2256e8474b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -70,6 +70,22 @@ config DRM_DEBUG_SELFTEST
 
 	  If in doubt, say "N".
 
+config DRM_KUNIT_TEST
+	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
+	depends on DRM && KUNIT=y
+	select DRM_KMS_HELPER
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for DRM. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on DRM and associated drivers.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
+
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 13ef240b3d2b..3171437d74f8 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -76,6 +76,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 #
 
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
+obj-$(CONFIG_DRM_KUNIT_TEST) += kunit/
 
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
diff --git a/drivers/gpu/drm/kunit/.kunitconfig b/drivers/gpu/drm/kunit/.kunitconfig
new file mode 100644
index 000000000000..6ec04b4c979d
--- /dev/null
+++ b/drivers/gpu/drm/kunit/.kunitconfig
@@ -0,0 +1,3 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_KUNIT_TEST=y
diff --git a/drivers/gpu/drm/kunit/Makefile b/drivers/gpu/drm/kunit/Makefile
new file mode 100644
index 000000000000..2c8273796d9d
--- /dev/null
+++ b/drivers/gpu/drm/kunit/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRM_KUNIT_TEST) += drm_format_helper_test.o
diff --git a/drivers/gpu/drm/kunit/drm_format_helper_test.c b/drivers/gpu/drm/kunit/drm_format_helper_test.c
new file mode 100644
index 000000000000..f8f2351f3449
--- /dev/null
+++ b/drivers/gpu/drm/kunit/drm_format_helper_test.c
@@ -0,0 +1,160 @@
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
+#include "../drm_crtc_internal.h"
+
+#define TEST_BUF_SIZE 50
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
+		.name = "Single pixel source buffer",
+		.pitch = 1 * 4,
+		.dst_pitch = 0,
+		.clip = DRM_RECT_INIT(0, 0, 1, 1),
+		.xrgb8888 = { 0x01FF0000 },
+		.expected = { 0xE0 },
+	},
+	{
+		.name = "Single pixel clip rectangle",
+		.pitch = 2 * 4,
+		.dst_pitch = 0,
+		.clip = DRM_RECT_INIT(1, 1, 1, 1),
+		.xrgb8888 = {
+			0x00000000, 0x00000000,
+			0x00000000, 0x10FF0000,
+		},
+		.expected = { 0xE0 },
+	},
+	{
+		/* Well known colors, different values for the X in XRGB8888 to
+		 * make sure it is ignored. Partial clip area.
+		 */
+		.name = "White, black, red, green, blue, magenta, yellow, cyan",
+		.pitch = 4 * 4,
+		.dst_pitch = 0,
+		.clip = DRM_RECT_INIT(1, 1, 2, 4),
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
+		/* Randomly picked colors. Full buffer within the clip area. */
+		.name = "Destination pitch",
+		.pitch = 3 * 4,
+		.dst_pitch = 5,
+		.clip = DRM_RECT_INIT(0, 0, 3, 3),
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
+/*
+ * conversion_buf_size - Return the destination buffer size required to convert
+ * between formats.
+ * @dst_format: destination buffer pixel format (DRM_FORMAT_*)
+ * @dst_pitch: Number of bytes between two consecutive scanlines within dst
+ * @clip: Clip rectangle area to convert
+ *
+ * Returns:
+ * The size of the destination buffer or negative value on error.
+ */
+static size_t conversion_buf_size(u32 dst_format, unsigned int dst_pitch,
+				  const struct drm_rect *clip)
+{
+	const struct drm_format_info *dst_fi = drm_format_info(dst_format);
+
+	if (!dst_fi)
+		return -EINVAL;
+
+	if (!dst_pitch)
+		dst_pitch = drm_rect_width(clip) * dst_fi->cpp[0];
+
+	return dst_pitch * drm_rect_height(clip);
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
+	dst_size = conversion_buf_size(DRM_FORMAT_RGB332, params->dst_pitch,
+				       &params->clip);
+	KUNIT_ASSERT_GT(test, dst_size, 0);
+
+	dst = kunit_kzalloc(test, dst_size, GFP_KERNEL);
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

