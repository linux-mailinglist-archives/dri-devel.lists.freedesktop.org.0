Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD127C1B439
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7771C10E7CB;
	Wed, 29 Oct 2025 14:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bQ5Az7cU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490C610E7C8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B7E2BC0DA84;
 Wed, 29 Oct 2025 14:37:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1C7EA606E8;
 Wed, 29 Oct 2025 14:37:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 01F78117F81AD; Wed, 29 Oct 2025 15:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748640; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RDpTgbAVmwlCytnSgkakGECg7adgLDFGZNh1TIOlRlw=;
 b=bQ5Az7cULeeaEo8tq1YKdl9FIwVBDlzQxAyiJNR3QuQeyWaoHLZ33R78p0SyOZz3ieKACZ
 oa7KqElkFlHCI6oFjkRO7QnGirMJ5TfKMXbOTRInhVxzUA6NKrOkd0tWHB/H0K7ou/VM4D
 9T2SiO9cBh+mdC4F9OhoBCC1X4LC4sMm/AnK2aL/GLBCiRuDo6gPnRJOfIDV+ngG577Pp0
 yCF43xmyeKjlWLODB9xxxlS6OESRskYo3RCd4K97zP278cwF4GV0ML4HCmbYGDslCljqUK
 5cthKxWGs7niFnegp7Gj7UX3IE3Mr4fuZ4CVRyBniXoqddKH2HXfCr2ICZKVcg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:54 +0100
Subject: [PATCH RESEND v2 17/32] drm/vkms: Introduce configfs for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251029-vkms-all-config-v2-17-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10458;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BMVGN+9+t9auyeVa0Egl37tcKEFQ9wQUAEN2uScKJxI=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ84zUXw+hjsAUXMdg7ITFMXanlymzbm5dha
 rXUcZvCXSqJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfAAKCRAgrS7GWxAs
 4mscEADJEQT80j5ffXeHIEdQYyHdxNCHhOQ2lZckInb84U3PonRhUcJkP8RR3b5l+uxHHS7KQyZ
 shHHijvvF+RgN6dIMaZRmoYmR4FJX96YYgH3HDbzL56/qiARvKd0AAjBSv//uJBuORsH3ZR2HWg
 vGklCfTs/ERy7HABbuFHASaTbfZLU6nesGUIjt2YjJ7xJPymtf96NL25/ZQCpA8izjUvzyJk6Dd
 rOJPQZzRhNoPMdVzi0w5S5ka0rWecZMPDO9KloyDDN+pzsJ7ZsRPwKAUvRXZwZhw3RAySs/s82n
 KE+yWQV3JsmkwipXLZEuICA5c7eLnVeyskHDahAS41RiL83dWJBPvzHuiWTswGpx0neIs4ucDjQ
 6P/4Fsw/Se18U8UBGE1uc1TJhwJerTvwmelKOQdKzxl3G4/CYv/q/oyWeUHPOr403IxBcAQ60Zg
 2aRHsYYrjMC2H4lqXXkm0LZk6jZkxAd7vf1jBGzRqc+JF3MFquDAmRhMa1QFgXcCtlxyfkD96z0
 6cehKK84mh3vtg9ebi9zGCPIKgyDDq8BtGcu8c8bo7HS5tOVuE73194lzrxEXQSXm/c1ZqXOss3
 fTvN9h6hUb/Qj6I9AQWPalPJkbP68rAlkx7jSIUiSp+bYhiNTSTUFkkkJ0SWQx01FZIsTuNi7a+
 zAZbXt4Gzbc3vTw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

To allow the userspace to test many hardware configuration, introduce a
new interface to configure the available formats per planes. VKMS supports
multiple formats, so the userspace can choose any combination.

The supported formats are configured by writing the fourcc code in
supported_formats:
 # enable AR24 format
  echo '+AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
 # disable AR24 format
  echo '-AR24' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
 # enable all format supported by VKMS
  echo '+*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats
 # disable all formats
  echo '-*' > /config/vkms/DEVICE_1/planes/PLANE_1/supported_formats

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst                      |   7 +-
 drivers/gpu/drm/vkms/tests/Makefile             |   1 +
 drivers/gpu/drm/vkms/tests/vkms_configfs_test.c | 102 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.c            | 119 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h            |   6 ++
 5 files changed, 234 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 8383e1b94668..779ae363110d 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 8 configurable attributes:
+Planes have 9 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -109,6 +109,11 @@ Planes have 8 configurable attributes:
   must be set too.
 - default_color_range: Default color range presented to the userspace, same
   values as supported_color_range
+- supported_formats: List of supported formats for this plane. To add a new item in the
+  list, write it using a plus its fourcc code: +XR24
+  To remove a format, use a minus and its fourcc: -XR24
+  To add all formats use +*
+  To remove all formats, use -*
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index 5750f0bd9d40..a2dc4008d27e 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -2,6 +2,7 @@
 
 vkms-kunit-tests-y := \
 	vkms_config_test.o \
+	vkms_configfs_test.o \
 	vkms_format_test.o
 
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
new file mode 100644
index 000000000000..0963a8e8a585
--- /dev/null
+++ b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include "linux/printk.h"
+#include <kunit/test.h>
+
+#include "../vkms_configfs.h"
+
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
+
+/**
+ * struct vkms_configfs_parse_format_case - Store test case for format parsing
+ * @data: Contains the string to parse
+ * @data_len: data len
+ * @expected_len: expected len of the matched format
+ * @expected_offset: expected offset in the string for the parsed format
+ */
+struct vkms_configfs_parse_format_case {
+	const char *data;
+	int data_len;
+	int expected_len;
+	int expected_offset;
+};
+
+struct vkms_configfs_parse_format_case vkms_configfs_parse_format_test_cases[] = {
+	{
+		.data = "+RG24",
+		.data_len = 6,
+		.expected_len = 5,
+		.expected_offset = 0,
+	}, {
+		.data = "-RG24",
+		.data_len = 6,
+		.expected_len = 5,
+		.expected_offset = 0
+	}, {
+		.data = "  -RG24",
+		.data_len = 8,
+		.expected_len = 5,
+		.expected_offset = 2
+	}, {
+		.data = "+*",
+		.data_len = 3,
+		.expected_len = 2,
+		.expected_offset = 0
+	}, {
+		.data = "-RG24+RG24",
+		.data_len = 11,
+		.expected_len = 5,
+		.expected_offset = 0
+	}, {
+		.data = "-R1+RG24",
+		.data_len = 9,
+		.expected_len = 3,
+		.expected_offset = 0
+	}, {
+		.data = "\n-R1",
+		.data_len = 5,
+		.expected_len = 3,
+		.expected_offset = 1
+	}, {
+		.data = "-R1111",
+		.data_len = 3,
+		.expected_len = 3,
+		.expected_offset = 0
+	}
+};
+
+static void vkms_configfs_test_parse_format(struct kunit *test)
+{
+	const struct vkms_configfs_parse_format_case *param = test->param_value;
+	char *out;
+	int len = vkms_configfs_parse_next_format(param->data, param->data + param->data_len, &out);
+
+	KUNIT_EXPECT_EQ(test, len, param->expected_len);
+	KUNIT_EXPECT_PTR_EQ(test, out, param->data + param->expected_offset);
+}
+
+static void vkms_configfs_test_parse_format_get_desc(struct vkms_configfs_parse_format_case *t,
+						     char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", t->data);
+}
+
+KUNIT_ARRAY_PARAM(vkms_configfs_test_parse_format, vkms_configfs_parse_format_test_cases,
+		  vkms_configfs_test_parse_format_get_desc
+);
+
+static struct kunit_case vkms_configfs_test_cases[] = {
+	KUNIT_CASE_PARAM(vkms_configfs_test_parse_format,
+			 vkms_configfs_test_parse_format_gen_params),
+	{}
+};
+
+static struct kunit_suite vkms_configfs_test_suite = {
+	.name = "vkms-configfs",
+	.test_cases = vkms_configfs_test_cases,
+};
+
+kunit_test_suite(vkms_configfs_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Kunit test for vkms configfs utility");
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 3f658dd41272..b0a26c4dbebe 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
+
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string.h>
+#include <kunit/visibility.h>
 
 #include "vkms_drv.h"
 #include "vkms_config.h"
@@ -618,6 +621,120 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_formats_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	page[0] = '\0';
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		u32 *formats = vkms_config_plane_get_supported_formats(plane->config);
+
+		for (int i = 0;
+		     i < vkms_config_plane_get_supported_formats_count(plane->config);
+		     i++) {
+			char tmp[6] = { 0 };
+			const ssize_t ret = snprintf(tmp, ARRAY_SIZE(tmp), "%.*s\n",
+					       (int)sizeof(*formats),
+					       (char *)&formats[i]);
+			if (ret < 0)
+				return ret;
+			/*
+			 * Limitation of ConfigFS attributes, an attribute can't be bigger
+			 * than PAGE_SIZE. This will crop the result if this plane support
+			 * more than ≈1000 formats.
+			 */
+			if (ret + strlen(page) > PAGE_SIZE - 1)
+				return -ENOMEM;
+			strncat(page, tmp, ARRAY_SIZE(tmp));
+		}
+	}
+
+	return strlen(page);
+}
+
+/**
+ * parse_next_format() - Parse the next format in page, skipping all non fourcc-related characters
+ * @page: page to search into
+ * @page_end: last charater of the page
+ * @out: Output pointer, will point inside page
+ *
+ * Returns: size of the matched format, @out will point to the + or -
+ */
+VISIBLE_IF_KUNIT
+int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
+{
+	int count = page - page_end;
+	char *tmp_plus = strnchr(page, count, '+');
+	char *tmp_minus = strnchr(page, count, '-');
+
+	if (!tmp_plus && !tmp_minus)
+		return 0;
+	if (!tmp_plus)
+		*out = tmp_minus;
+	else if (!tmp_minus)
+		*out = tmp_plus;
+	else
+		*out = min(tmp_plus, tmp_minus);
+
+	char *end = *out + 1;
+
+	while (end < page_end) {
+		if (!isalnum(*end) && *end != '*')
+			break;
+		end++;
+	}
+
+	return end - *out;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_configfs_parse_next_format);
+
+static ssize_t plane_supported_formats_store(struct config_item *item,
+					     const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+	int ret = 0;
+	const char *end_page = page + count;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		while (1) {
+			char *tmp;
+			char fmt[4] = {' ', ' ', ' ', ' '};
+			int len = vkms_configfs_parse_next_format(page, end_page, &tmp);
+
+			// No fourcc code found
+			if (len <= 1)
+				break;
+
+			page = tmp + len;
+			memcpy(tmp, &fmt[1], min(len - 1, 4));
+			if (tmp[0] == '+') {
+				if (fmt[0] == '*') {
+					ret = vkms_config_plane_add_all_formats(plane->config);
+					if (ret)
+						return ret;
+				} else {
+					ret = vkms_config_plane_add_format(plane->config,
+									   *(int *)fmt);
+					if (ret)
+						return ret;
+				}
+			} else if (tmp[0] == '-') {
+				if (fmt[0] == '*')
+					vkms_config_plane_remove_all_formats(plane->config);
+				else
+					vkms_config_plane_remove_format(plane->config, *(int *)fmt);
+			}
+		}
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
 CONFIGFS_ATTR(plane_, supported_rotations);
@@ -626,6 +743,7 @@ CONFIGFS_ATTR(plane_, supported_color_ranges);
 CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encodings);
 CONFIGFS_ATTR(plane_, default_color_encoding);
+CONFIGFS_ATTR(plane_, supported_formats);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
@@ -636,6 +754,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encodings,
 	&plane_attr_default_color_encoding,
+	&plane_attr_supported_formats,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
index e9020b0043db..2774655bfcc5 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.h
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -2,7 +2,13 @@
 #ifndef _VKMS_CONFIGFS_H_
 #define _VKMS_CONFIGFS_H_
 
+#include <linux/types.h>
+
 int vkms_configfs_register(void);
 void vkms_configfs_unregister(void);
 
+#if IS_ENABLED(CONFIG_KUNIT)
+int vkms_configfs_parse_next_format(const char *page, const char *end_page, char **out);
+#endif
+
 #endif /* _VKMS_CONFIGFS_H_ */

-- 
2.51.0

