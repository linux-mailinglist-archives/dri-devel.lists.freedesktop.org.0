Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC19866CE7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABC210EF75;
	Mon, 26 Feb 2024 08:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dH0GSjK4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF2C10EF6F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:47:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 018E2E0004;
 Mon, 26 Feb 2024 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708937276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/uAsG5Jzk7tw7K+ro+IYvCPbIFvsjURySsIlhGEh+s=;
 b=dH0GSjK4e4fkWHZQ/bHSXXM3pLkW8TQNEEZwXAUNwiCPRmsaKm6p5WKm7X8+7sYxT1uxaC
 5P82E9L0ADTNIbkBLZcZHrQ7J3EjScLOJ06sWfTaNrs0EaduIdlG+ulT1oQvGQim9l+ZRk
 RpEnHh2fJLFTtsa6FBCDN9FYtnWeFAakOSliyy7gmfpZSjq1RLORm0CF8NRFZTnL/4AaYe
 4vYMnfvUD92CA0hThPulerMFhvAUSD7yUP0645ot0sjYpRq2AF2V6WJ7A250ptdGlllE2F
 gk3ZUR4EQDa3bxvl5tO4LO26mel8xu0o84RHbMwI3ijuxkE+FtGEfxqN9ZkL3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 26 Feb 2024 09:46:39 +0100
Subject: [PATCH v3 9/9] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-yuv-v3-9-ff662f0994db@bootlin.com>
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
In-Reply-To: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9589;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=6XGbmMJEqhgEJWTl1n4SZWXpBs90sgie29UDQGxwWdI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl3FAvEEnhg6zHcf91VHkxpZvnc+igqU9NvWEDOEU2
 qmgridWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZdxQLwAKCRAgrS7GWxAs4rYZD/
 9yRKyAKBE9mNJNDB9x+XcUj3pMp5hbsoHnwnVywLxWGdPWeWMyHpxewWET+xTTZovRHaqU9q5DT3d7
 VtgU170wcbeh+fAVrAzU4xVS6DxpzyrPKn6r9/Rez4t3oZVlLef9MwrbroGFLQDcMcSpghKVPOIdy4
 FbtBGTJjfXeIta/ktcOd0cT0O5NC8VbHQ3I8VA93ZRQuJ+3fGNYwdqsFoBAD/G6q7PMK/N2K177Y5P
 3IT+I522WvYWzMN78ET0+GrK3SgedWAkUWVb2NnDWqXybg2IvwTr2FeGStn87SNoxgdjn+T88Cs+24
 SEbbRwdPm87M53w0rW0BvZ07Xp3M/Uv226IcolFLZgyp+IJ+Zx5t/z57N46e+o46iEh4NeZ9+i+9eG
 jaQr0966oevFylG+LZENFbC+95vp6xtJtx2RIAFa0Qk/U3lHGHygrrHMU0fXitMLxAlsWSn/p1qkkV
 zaJ7H9n5Lo+JHZhcQqol8Kk42Mix3fBgsnK4p/X6GFAc37JfiHZz2A38oJqW48ROW7gnnPZNuLAYo2
 07rvrfLp9tdZE6w4ag6NopAJAlvTQfX7P4RFqL2gc+r0UJclfaem60gmrPosuf9x+JHN0KRSPeN/Jo
 rewMUXOfiYl3yiEH4lDOIikqUAZ5w91Ag5UEr0qwzHMGi+wDSH9ZUE2OBsfw==
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
[Louis Chauvet: fix minor formating issues (whitespace, double line)]
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 155 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |   9 +-
 drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
 6 files changed, 175 insertions(+), 2 deletions(-)

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
index 000000000000..cb6d32ff115d
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -0,0 +1,155 @@
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
index 515c80866a58..20dd23ce9051 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -7,6 +7,8 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
+#include <kunit/visibility.h>
+
 #include "vkms_formats.h"
 
 /**
@@ -175,8 +177,10 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset, u8 *r,
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
 		{ 256, 0,   359 },
@@ -237,6 +241,7 @@ static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pix
 	argb_u16->g = g * 257;
 	argb_u16->b = b * 257;
 }
+EXPORT_SYMBOL_IF_KUNIT(yuv_u8_to_argb_u16);
 
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index 5a3a9e1328d8..4245a5c5e956 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -13,4 +13,9 @@ struct pixel_yuv_u8 {
 	u8 y, u, v;
 };
 
+#if IS_ENABLED(CONFIG_KUNIT)
+void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, const struct pixel_yuv_u8 *yuv_u8,
+			enum drm_color_encoding encoding, enum drm_color_range range);
+#endif
+
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.43.0

