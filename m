Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2949870579
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 16:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D764C1122B1;
	Mon,  4 Mar 2024 15:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kV3Vg5ij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D6B1122A7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 15:29:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 625D81C0011;
 Mon,  4 Mar 2024 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709566174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sxj7PD7QU9ATJPEMVZ0jCO8idYJAgbdOpi3aVdMCsmM=;
 b=kV3Vg5ijL9b5AdnNkmG9kUZ4jn/zrvdgEKB8/rsRl2Dp3Mnj5IOLpuuLdqCJkO4/6Tsgwf
 rohZUr12EcBNjGKGiN+H492zw4tcJO2KphkVyPyRKRoqvxlpM0pw8Nnp+YdznDOt0os/eA
 4iyAsV2r0021vPX2lwYSBHm7Ymc7S5CV67CbUFmHUWh4k+/zj1ln2zq8MgwMNL1kfrAi5v
 dN44qC5+vnJysmdbAZaRvEry5wiZGRCsOsHlhGEnImjYKXn3QnSidmNSe7ksvrjMQPZOL0
 Fr8ZR3QztMjBKSYQs0XZNBeCut0O1ZrxApFnm98bGUwqq2DhPPoqIdoFZCkuXg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 04 Mar 2024 16:28:19 +0100
Subject: [PATCH v4 14/14] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-yuv-v4-14-76beac8e9793@bootlin.com>
References: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
In-Reply-To: <20240304-yuv-v4-0-76beac8e9793@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10466;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oit4DBZsqYBsCSeCVnB90xL2YrQEqzM2Rsn5P03j1zs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl5ejNN1MQo+P1mq5+sUn5p5kzGYr35Lao4Xt3vrkl
 hn+gONyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeXozQAKCRAgrS7GWxAs4tRhEA
 C+8Urz+c3RbOiqiY+106LXtJxOGqN2KIp8qYemSm/SFIJV8SGLVcCLk/07Wuyixeg3gPw6vrc/aSex
 eKXyNmmKCiI4laJU5Dp9Ci1/HP0njBEQQCTsZtQXjM+DyyBDNZ46FOezgGsgN5dHdN7uJZwYA+8Jqi
 rJDuHAims+TJ5A8xBmOTzml5wvZWm4PCylvmrTFo6DFKqpWKoMKHrJAzkb1Mt5uU/YYyP9uOxJowPb
 oSnez51Yt4TxoI9Ldx3ZxihL4/Zvkf5VMXhTO4cUHaVk61tI1WTVC4Sh7LJzjoBS27eot5awr3wdrC
 NSRT92mPfjZX9OyAWckKPRenTr8/vwCFX3lfqazc9XzvxVNqSrU1crxHSKKr6oQfUY7XOT+yXUggMR
 OxsIjAR5YNX/8up0lCF3uOgtDu6p41pNTpLRghHW9u8a3eo/ipFfHEo6OGjJN7tX++sAneZ0SLO0Xc
 8IRiRJsHL9yque6iqdfXMx2Qq22/NOkpygkgu58aVER48SAjFOKd2Dhk76yLMhuE/LOZQNmw9IU67D
 ckLhhqwchi95f/lBVq8fubuj82cDrOV1g2T7RLq+eDRPwwIyBJDabhk/852Wy9fnIxQHFrt0U/sV0v
 Eam6nfIt49N/WDBWvIDdm3Y/AB39OcdERAFyCuhx2Ubu+98gJZ8sj0oUfwRA==
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

From: Arthur Grillo <arthurgrillo@riseup.net>

Create KUnit tests to test the conversion between YUV and RGB. Test each
conversion and range combination with some common colors.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
[Louis Chauvet: fix minor formating issues (whitespace, double line), change expected alpha from 0x0000 to 0xffff, adapt to the new get_conversion_matrix usage]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/Kconfig                  |  15 +++
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 158 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |   5 +-
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +
 7 files changed, 189 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index b9ecdebecb0b..9b0e1940c14f 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -13,3 +13,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "Tests for VKMS" if !KUNIT_ALL_TESTS
+	depends on DRM_VKMS && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds unit tests for VKMS. This option is not useful for
+	  distributions or general kernels, but only for kernel
+	  developers working on VKMS.
+
+	  For more information on KUnit and unit tests in general,
+	  please refer to the KUnit documentation in
+	  Documentation/dev-tools/kunit/.
+
+	  If in doubt, say "N".
\ No newline at end of file
diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
index 1b28a6a32948..8d3e46dde635 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -9,3 +9,4 @@ vkms-y := \
 	vkms_writeback.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 000000000000..70e378228cbd
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 000000000000..2d1df668569e
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
new file mode 100644
index 000000000000..4636b013602f
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
+
+#include "../../drm_crtc_internal.h"
+
+#include "../vkms_drv.h"
+#include "../vkms_formats.h"
+
+#define TEST_BUFF_SIZE 50
+
+struct yuv_u8_to_argb_u16_case {
+	enum drm_color_encoding encoding;
+	enum drm_color_range range;
+	size_t n_colors;
+	struct format_pair {
+		char *name;
+		struct pixel_yuv_u8 yuv;
+		struct pixel_argb_u16 argb;
+	} colors[TEST_BUFF_SIZE];
+};
+
+static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
+	{
+		.encoding = DRM_COLOR_YCBCR_BT601,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x4c, 0x55, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
+			{"green", {0x96, 0x2c, 0x15}, {0xffff, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x1d, 0xff, 0x6b}, {0xffff, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT601,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x51, 0x5a, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
+			{"green", {0x91, 0x36, 0x22}, {0xffff, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x29, 0xf0, 0x6e}, {0xffff, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT709,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x36, 0x63, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xb6, 0x1e, 0x0c}, {0xffff, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x12, 0xff, 0x74}, {0xffff, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT709,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x3f, 0x66, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xad, 0x2a, 0x1a}, {0xffff, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x20, 0xf0, 0x76}, {0xffff, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT2020,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xff, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x80, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x00, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x43, 0x5c, 0xff}, {0xffff, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xad, 0x24, 0x0b}, {0xffff, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x0f, 0xff, 0x76}, {0xffff, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT2020,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xeb, 0x80, 0x80}, {0xffff, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0xffff, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x10, 0x80, 0x80}, {0xffff, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x4a, 0x61, 0xf0}, {0xffff, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xa4, 0x2f, 0x19}, {0xffff, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x1d, 0xf0, 0x77}, {0xffff, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+};
+
+static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
+{
+	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
+	struct pixel_argb_u16 argb;
+
+	for (size_t i = 0; i < param->n_colors; i++) {
+		const struct format_pair *color = &param->colors[i];
+
+		const struct conversion_matrix *matrix = get_conversion_matrix_to_argb_u16
+			(DRM_FORMAT_NV12, param->encoding, param->range);
+
+		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, matrix);
+
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 257,
+				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.a, argb.a);
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.r, color->argb.r), 257,
+				    "On the R channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.r, argb.r);
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.g, color->argb.g), 257,
+				    "On the G channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.g, argb.g);
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.b, color->argb.b), 257,
+				    "On the B channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.b, argb.b);
+	}
+}
+
+static void vkms_format_test_yuv_u8_to_argb_u16_case_desc(struct yuv_u8_to_argb_u16_case *t,
+							  char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s - %s",
+		 drm_get_color_encoding_name(t->encoding), drm_get_color_range_name(t->range));
+}
+
+KUNIT_ARRAY_PARAM(yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_cases,
+	vkms_format_test_yuv_u8_to_argb_u16_case_desc);
+
+static struct kunit_case vkms_format_test_cases[] = {
+	KUNIT_CASE_PARAM(vkms_format_test_yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_gen_params),
+	{}
+};
+
+static struct kunit_suite vkms_format_test_suite = {
+	.name = "vkms-format",
+	.test_cases = vkms_format_test_cases,
+};
+
+kunit_test_suite(vkms_format_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index d9b70d9b99ef..44d9b9b3bdc3 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -7,6 +7,8 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
+#include <kunit/visibility.h>
+
 #include "vkms_formats.h"
 
 /**
@@ -185,7 +187,7 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const u16 *pixel)
 	return out_pixel;
 }
 
-static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
+VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
 						  struct conversion_matrix *matrix)
 {
 	u8 r, g, b;
@@ -218,6 +220,7 @@ static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr,
 
 	return argb_u16_from_u8888(255, r, g, b);
 }
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
 
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index e1d324764b17..21e66a0cac16 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -13,4 +13,8 @@ struct conversion_matrix *
 get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encoding,
 				  enum drm_color_range range);
 
+#if IS_ENABLED(CONFIG_KUNIT)
+struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 cb, u8 cr, struct conversion_matrix *matrix);
+#endif
+
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.43.0

