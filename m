Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59967A277D9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 18:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F88910E6B6;
	Tue,  4 Feb 2025 17:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NWGtTBI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74A10E364
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 17:06:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B37E204AE;
 Tue,  4 Feb 2025 17:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1738688798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDsjN1J+Fn9ZK3ljb6kA3m+S0r2141kjrS24f2hI1eg=;
 b=NWGtTBI4Yf7EeJ7083qtaJv80Cau/WkJyIIQgHERaCjURiFc0sLsjG/sSDq04DXCjEBK3L
 pLEJS01I0CeZI8+ys8TYSx5P/CMHjp/qctDmjNKnoNiIeYPogyLhtjh28MyINHKKvFRXnQ
 uhSxiD6wq4CCZtCrVjlrOar/HeK/vLPwHGpWbY7BhZp9PPnxZroMxAG5a9J97Iai50AcV3
 25nPaMSt6P41zaUl/d+X7w++GUMeyMo4bYB1MVR2wBNQ9GafOLoFPKn6ztgfO5RutQV1wK
 Qmk1gRiSYJkxxCpvLDUa30HvwbH6hS/zLFeG7DTZ0bM/XQCm4guKDkd8JPcQAQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 04 Feb 2025 18:06:16 +0100
Subject: [PATCH v17 5/7] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-yuv-v17-5-9c623880d0ac@bootlin.com>
References: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
In-Reply-To: <20250204-yuv-v17-0-9c623880d0ac@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=16142;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5gred6SqTzXlaHnTULZG9g2lg/AHlzlYOvOFkCHof+o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnokkUXkFcUMb1YblW3aZcyK6xlaf74FJr+/sk1
 2bOhqmTIfKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ6JJFAAKCRAgrS7GWxAs
 4qVED/9orsnMo9cIExkXvI2j9exJX+1dXK6TsRfRNJootnRbq2nZ0y70Y57jTWaZ4LcolEW/4OU
 Ki5W4M+MXrVT6IY2NPCxX/Zst60VX+eioAyplLpITKX0P2fhf3eSgPw26EGkU+Nqe3+WKuxCRfV
 Peq2WBXmSm+tRQLjizEJrRlESeCbBveg1f8hFzNlM2jCQ60y7cSNrEd09xPxM7OsE+tXmVuFuti
 0ZJffCPI0zv7+OHlSb7DUzFOHmF0KMM7/KE2udJB9cgiUc8GjhvQW+Q72exOdAhI2D78cGJpoKU
 YBfwDIs19Wd6LK8dCuaN6HHyi0aQSVa6bAqrD1KT/bHxLO2Z4lcm1xeNoR2hCutOWRDm5JmQ9Pg
 9xmLyR4j4THVD9w6GJ6z4wnzP6Fh279RD0/Kmpr5PEHEGQKPuzKIW47A080WQDs0Zt2vshCMtTP
 wFvBSg8mOdAVTCts5TQdaU8m1oDuT31lllaI1uLQn6QvLr6rsE7Jd5cg9cIEq90TOv+TEHAzY89
 aZGT3w19C+u4CnqtvCy2YIm1BgQty+vAZ01x3ztwNT+LcmammWsD9p0lcrMX/OzKf4/iw+nc/sE
 ryNKAkQ5vzYd8jtxYxMFL3luUsLUSUHlmVBn22r9wuAdvlLLzJZ3skk22KA9QlZTF5eFXnnjFup
 ZIroW5AOdMwVYxw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleefkeffffekgfffjeeujeeihfeiffelleehvddvtedvffdvgfehhfefveehtdehnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtoheprhhoughrihhgohhsihhquhgvihhrrghmvghlohesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepnhhitgholhgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmp
 dhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepphgvkhhkrgdrphgrrghlrghnvghnsegtohhllhgrsghorhgrrdgtohhm
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

The code used to compute the expected result can be found in comment.

[Louis Chauvet:
- fix minor formating issues (whitespace, double line)
- change expected alpha from 0x0000 to 0xffff
- adapt to the new get_conversion_matrix usage
- apply the changes from Arthur
- move struct pixel_yuv_u8 to the test itself]

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/Kconfig                  |  15 ++
 drivers/gpu/drm/vkms/Makefile                 |   1 +
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 271 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |   7 +-
 drivers/gpu/drm/vkms/vkms_formats.h           |   5 +
 7 files changed, 304 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
index 9def079f685bd30e1df3e4082e4818e402395391..d4665e913de7702fbd5c0f047876dad9715c690a 100644
--- a/drivers/gpu/drm/vkms/Kconfig
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -14,3 +14,18 @@ config DRM_VKMS
 	  a VKMS.
 
 	  If M is selected the module will be called vkms.
+
+config DRM_VKMS_KUNIT_TESTS
+	tristate "KUnit tests for VKMS." if !KUNIT_ALL_TESTS
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
index 1b28a6a32948b557867dda51d2ccfdea687a2b62..8d3e46dde6350558a0aab4254df0dfe863f9c6ce 100644
--- a/drivers/gpu/drm/vkms/Makefile
+++ b/drivers/gpu/drm/vkms/Makefile
@@ -9,3 +9,4 @@ vkms-y := \
 	vkms_writeback.o
 
 obj-$(CONFIG_DRM_VKMS) += vkms.o
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += tests/
diff --git a/drivers/gpu/drm/vkms/tests/.kunitconfig b/drivers/gpu/drm/vkms/tests/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..70e378228cbdaa025f01641f207a93a6c01f0853
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/.kunitconfig
@@ -0,0 +1,4 @@
+CONFIG_KUNIT=y
+CONFIG_DRM=y
+CONFIG_DRM_VKMS=y
+CONFIG_DRM_VKMS_KUNIT_TESTS=y
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..2d1df668569e4f243ed9a06c1e16e595c131c4f6
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_DRM_VKMS_KUNIT_TESTS) += vkms_format_test.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..d1c1f46213928ea4f8e0661946516e0a7b012acc
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <kunit/test.h>
+
+#include <drm/drm_fixed.h>
+#include <drm/drm_fourcc.h>
+
+#include "../../drm_crtc_internal.h"
+
+#include "../vkms_formats.h"
+
+#define TEST_BUFF_SIZE 50
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+struct pixel_yuv_u8 {
+	u8 y, u, v;
+};
+
+/*
+ * struct yuv_u8_to_argb_u16_case - Reference values to test the color
+ * conversions in VKMS between YUV to ARGB
+ *
+ * @encoding: Encoding used to convert RGB to YUV
+ * @range: Range used to convert RGB to YUV
+ * @n_colors: Count of test colors in this case
+ * @format_pair.name: Name used for this color conversion, used to
+ *                    clarify the test results
+ * @format_pair.rgb: RGB color tested
+ * @format_pair.yuv: Same color as @format_pair.rgb, but converted to
+ *                   YUV using @encoding and @range.
+ */
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
+/*
+ * The YUV color representation were acquired via the colour python framework.
+ * Below are the function calls used for generating each case.
+ *
+ * For more information got to the docs:
+ * https://colour.readthedocs.io/en/master/generated/colour.RGB_to_YCbCr.html
+ */
+static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u16_cases[] = {
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = False,
+	 *                     out_int = True)
+	 *
+	 * Tests cases for color conversion generated by converting RGB
+	 * values to YUV BT601 full range using the ITU-R BT.601 weights.
+	 */
+	{
+		.encoding = DRM_COLOR_YCBCR_BT601,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x4c, 0x55, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0x96, 0x2c, 0x15 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x1d, 0xff, 0x6b }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		},
+	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.601"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = True,
+	 *                     out_int = True)
+	 * Tests cases for color conversion generated by converting RGB
+	 * values to YUV BT601 limited range using the ITU-R BT.601 weights.
+	 */
+	{
+		.encoding = DRM_COLOR_YCBCR_BT601,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x51, 0x5a, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0x91, 0x36, 0x22 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x29, 0xf0, 0x6e }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		},
+	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = False,
+	 *                     out_int = True)
+	 * Tests cases for color conversion generated by converting RGB
+	 * values to YUV BT709 full range using the ITU-R BT.709 weights.
+	 */
+	{
+		.encoding = DRM_COLOR_YCBCR_BT709,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		},
+	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
+	 *                     in_bits = 16,
+	 *                     int_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = True,
+	 *                     out_int = True)
+	 * Tests cases for color conversion generated by converting RGB
+	 * values to YUV BT709 limited range using the ITU-R BT.709 weights.
+	 */
+	{
+		.encoding = DRM_COLOR_YCBCR_BT709,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x3f, 0x66, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xad, 0x2a, 0x1a }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x20, 0xf0, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		},
+	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = False,
+	 *                     out_int = True)
+	 * Tests cases for color conversion generated by converting RGB
+	 * values to YUV BT2020 full range using the ITU-R BT.2020 weights.
+	 */
+	{
+		.encoding = DRM_COLOR_YCBCR_BT2020,
+		.range = DRM_COLOR_YCBCR_FULL_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x43, 0x5c, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xad, 0x24, 0x0b }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x0f, 0xff, 0x76 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		},
+	},
+	/*
+	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
+	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.2020"],
+	 *                     in_bits = 16,
+	 *                     in_legal = False,
+	 *                     in_int = True,
+	 *                     out_bits = 8,
+	 *                     out_legal = True,
+	 *                     out_int = True)
+	 * Tests cases for color conversion generated by converting RGB
+	 * values to YUV BT2020 limited range using the ITU-R BT.2020 weights.
+	 */
+	{
+		.encoding = DRM_COLOR_YCBCR_BT2020,
+		.range = DRM_COLOR_YCBCR_LIMITED_RANGE,
+		.n_colors = 6,
+		.colors = {
+			{ "white", { 0xeb, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
+			{ "gray",  { 0x7e, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
+			{ "black", { 0x10, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
+			{ "red",   { 0x4a, 0x61, 0xf0 }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
+			{ "green", { 0xa4, 0x2f, 0x19 }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
+			{ "blue",  { 0x1d, 0xf0, 0x77 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
+		},
+	},
+};
+
+/*
+ * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
+ * colors to ARGB colors in VKMS
+ *
+ * This test will use the functions get_conversion_matrix_to_argb_u16 and
+ * argb_u16_from_yuv888 to convert YUV colors (stored in
+ * yuv_u8_to_argb_u16_cases) into ARGB colors.
+ *
+ * The conversion between YUV and RGB is not totally reversible, so there may be
+ * some difference between the expected value and the result.
+ * In addition, there may be some rounding error as the input color is 8 bits
+ * and output color is 16 bits.
+ */
+static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
+{
+	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
+	struct pixel_argb_u16 argb;
+
+	for (size_t i = 0; i < param->n_colors; i++) {
+		const struct format_pair *color = &param->colors[i];
+		struct conversion_matrix matrix;
+
+		get_conversion_matrix_to_argb_u16
+			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
+
+		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
+
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.a, color->argb.a), 0x1ff,
+				    "On the A channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.a, argb.a);
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.r, color->argb.r), 0x1ff,
+				    "On the R channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.r, argb.r);
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.g, color->argb.g), 0x1ff,
+				    "On the G channel of the color %s expected 0x%04x, got 0x%04x",
+				    color->name, color->argb.g, argb.g);
+		KUNIT_EXPECT_LE_MSG(test, abs_diff(argb.b, color->argb.b), 0x1ff,
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
+		  vkms_format_test_yuv_u8_to_argb_u16_case_desc
+);
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
+MODULE_DESCRIPTION("Kunit test for vkms format conversion");
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 8f7a5d54a076913879f03aa289ef9129acf2f7fa..9972780f3fa975ad8f5bcb71fa5c616071a8cf08 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -7,6 +7,8 @@
 #include <drm/drm_rect.h>
 #include <drm/drm_fixed.h>
 
+#include <kunit/visibility.h>
+
 #include "vkms_formats.h"
 
 /**
@@ -247,8 +249,8 @@ static struct pixel_argb_u16 argb_u16_from_RGB565(const __le16 *pixel)
 	return out_pixel;
 }
 
-static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
-						  const struct conversion_matrix *matrix)
+VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
+							    const struct conversion_matrix *matrix)
 {
 	u16 r, g, b;
 	s64 fp_y, fp_channel_1, fp_channel_2;
@@ -278,6 +280,7 @@ static struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel
 
 	return argb_u16_from_u16161616(0xffff, r, g, b);
 }
+EXPORT_SYMBOL_IF_KUNIT(argb_u16_from_yuv888);
 
 /*
  * The following functions are read_line function for each pixel format supported by VKMS.
diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/vkms_formats.h
index d583855cb32027d16b73d2a5b5a0644b13191d08..b4fe62ab9c65d465925d29911f26612193a80799 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.h
+++ b/drivers/gpu/drm/vkms/vkms_formats.h
@@ -13,4 +13,9 @@ void get_conversion_matrix_to_argb_u16(u32 format, enum drm_color_encoding encod
 				       enum drm_color_range range,
 				       struct conversion_matrix *matrix);
 
+#if IS_ENABLED(CONFIG_KUNIT)
+struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
+					   const struct conversion_matrix *matrix);
+#endif
+
 #endif /* _VKMS_FORMATS_H_ */

-- 
2.48.1

