Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1630829F8A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A45C10E654;
	Wed, 10 Jan 2024 17:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6DF10E654
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 17:44:57 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4T9FYT3nS6zDqw4;
 Wed, 10 Jan 2024 17:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1704908696; bh=9z+r23Xwz4qJJ+AfJgGnIlXWBhGsIf8hm3cRV4dV0p8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Jza+ksYmUk/mTGp7MHExyHkOpl2kb+WHmke5KAG6a9iAnYJtqNa/fVUqdCDmb+ic1
 Ujh2/N31BpzH1jyqw++03Ufp6rzodj+TdtukXv1u/7R0WvLZjlUEnEbLZ0BmS68+5a
 v5iwjoiDXa8C/34JvJUp+K+nsrdVLWVKg10EPWuY=
X-Riseup-User-ID: 812207DC097E4A86F5EEAC1389160C306716332C8583F7D6FB65CD63A397DA3A
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4T9FYP2xMWzJp9q;
 Wed, 10 Jan 2024 17:44:41 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Date: Wed, 10 Jan 2024 14:44:07 -0300
Subject: [PATCH v2 7/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240110-vkms-yuv-v2-7-952fcaa5a193@riseup.net>
References: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
In-Reply-To: <20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Arthur Grillo <arthurgrillo@riseup.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create KUnit tests to test the conversion between YUV and RGB. Test each
conversion and range combination with some common colors.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/vkms/Kconfig                  |  15 +++
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 156 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |   9 +-
 drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
 7 files changed, 191 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index b9ecdebecb0b..5b0094ad41eb 100644
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
index 000000000000..f04b8169d5a2
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -0,0 +1,156 @@
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
+			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x4c, 0x55, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"green", {0x96, 0x2c, 0x15}, {0x0000, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x1d, 0xff, 0x6b}, {0x0000, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT601,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{"white", {0xeb, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x10, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x51, 0x5a, 0xf0}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"green", {0x91, 0x36, 0x22}, {0x0000, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x29, 0xf0, 0x6e}, {0x0000, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT709,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x35, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xb6, 0x1e, 0x0c}, {0x0000, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x12, 0xff, 0x74}, {0x0000, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT709,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xeb, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x10, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x3f, 0x66, 0xf0}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xad, 0x2a, 0x1a}, {0x0000, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x20, 0xf0, 0x76}, {0x0000, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT2020,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x43, 0x5c, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xad, 0x24, 0x0b}, {0x0000, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x0f, 0xff, 0x76}, {0x0000, 0x0000, 0x0000, 0xffff}},
+		},
+	},
+	{
+		.encoding = DRM_COLOR_YCBCR_BT2020,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 4,
+		.colors = {
+			{"white", {0xeb, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
+			{"gray",  {0x7e, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
+			{"black", {0x10, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
+			{"red",   {0x4a, 0x61, 0xf0}, {0x0000, 0xffff, 0x0000, 0x0000}},
+			{"green", {0xa4, 0x2f, 0x19}, {0x0000, 0x0000, 0xffff, 0x0000}},
+			{"blue",  {0x1d, 0xf0, 0x77}, {0x0000, 0x0000, 0x0000, 0xffff}},
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
+		yuv_u8_to_argb_u16(&argb, &color->yuv, param->encoding, param->range);
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
+
+static void vkms_format_test_yuv_u8_to_argb_u16_case_desc(struct yuv_u8_to_argb_u16_case *t,
+							  char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s - %s",
+		 drm_get_color_encoding_name(t->encoding), drm_get_color_range_name(t->range));
+}
+
+KUNIT_ARRAY_PARAM(yuv_u8_to_argb_u16, yuv_u8_to_argb_u16_cases,
+		  vkms_format_test_yuv_u8_to_argb_u16_case_desc);
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
index 7c1a0ca322d9..e06bbd7c0a67 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -7,6 +7,8 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
+#include <kunit/visibility.h>
+
 #include "vkms_formats.h"
 
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y, size_t index)
@@ -137,8 +139,10 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r,
 	*b = clamp(b_16, 0, 0xffff) >> 8;
 }
 
-static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
-			       enum drm_color_encoding encoding, enum drm_color_range range)
+VISIBLE_IF_KUNIT void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16,
+					 const struct pixel_yuv_u8 *yuv_u8,
+					 enum drm_color_encoding encoding,
+					 enum drm_color_range range)
 {
 	static const s16 bt601_full[3][3] = {
 		{256,   0,  359},
@@ -199,6 +203,7 @@ static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pix
 	argb_u16->g = g * 257;
 	argb_u16->b = b * 257;
 }
+EXPORT_SYMBOL_IF_KUNIT(yuv_u8_to_argb_u16);
 
 static void semi_planar_yuv_to_argb_u16(u8 **src_pixels, struct pixel_argb_u16 *out_pixel,
 					enum drm_color_encoding encoding,
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index a8b2f92bdcb5..0cf835292cec 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -13,4 +13,9 @@ struct pixel_yuv_u8 {
 	u8 y, u, v;
 };
 
+#if IS_ENABLED(CONFIG_KUNIT)
+void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
+			       enum drm_color_encoding encoding, enum drm_color_range range);
+#endif
+
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.43.0

