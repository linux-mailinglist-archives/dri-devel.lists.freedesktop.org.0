Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E372ACD57F2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEB710E611;
	Mon, 22 Dec 2025 10:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cd+LMa7F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66E210E583
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B3BA9C1AE05;
 Mon, 22 Dec 2025 10:11:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AE5AA606C1;
 Mon, 22 Dec 2025 10:12:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9ADFA10AB0194; Mon, 22 Dec 2025 11:12:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398323; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+CdmJEkRK0OQbbG51djQaYXH07gnk1RrPWLwZqVPF30=;
 b=cd+LMa7FVFV6/72FhhiBDzgvpiL8tOjmb8xQA2JiOTDIMSHUGIbyH1gWQpm+5sZVshV4Ai
 eHPOtxN5020tIReuy/CX0j687CXRHUwFWaNG9QyUBOdfFqanv8E4quUvdc7raxFh4ZdYjM
 v66AHxKxuSWlxYRm+18BR9kmrs+81uesm4ZVTtw3qvECub7vvcT4ADQ7cjFZnu5bGAaQtl
 osSiNqkyEnLDLdsoGsQKe9rvBPX+2qSKoLceKSR6tAjU4KOjWpmmTu2x7cUZ1iQ3TTTZHh
 otJZZl1QUXIFAfKUwS9/DiryyRxr6+4JNaywm82toBAGcuQSeaC6ayRh+FJQ+g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:20 +0100
Subject: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11354;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=FXCbayNS2qadBlqhzx5IYbuv60BF7i9aXDaAtMTLApo=;
 b=owEBiAJ3/ZANAwAIASCtLsZbECziAcsmYgBpSRlC5GqbOkZVOhvK//jJGpjG+aXt6dWT9C5HX
 lX12YFU56qJAk4EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIU7w/1F1Gg7DgXCq/4s0xpTId6QxgjAwIVeC1
 OTzqQUg6jeDQYMqBs09X88rvz5N+nD0IzG3ISNq9Nt2O1QG+iI5Bre2lZdCbPcLC2O9jx2joTbT
 u7amU119mzlMLYQlTALEx19/B05Ay3ofSSJvK/WVnUpYrbMR60GgMlmv5afLyFUKQyF8xNvQkw0
 FkG/FHjTs6dw+EbylpALX6/tGmbgx7ZmCTKMAtIUYTZbUYcpPBE9vsWwZujSthbOR0OXSOh1bdT
 DJe5mwxMhjxfkLkrtxwEygd8u3GaYm6YlskwB49UuRtC2b6SwR8kmYYFV/FFsdOpasN0szW9yS+
 G7PTAAll5CI2T4BPgVjaAhoa1yxYPwvpkvUH/xGNzw8bqf3ThrGc0iRYV7TZSgeQ/mng1H/dUbo
 ENupKN5IRH0Y5AYqJosFDriythvQ+0nXh0aYlVEmWu68ft9g9UmaJ7Mzqiui9TAo97UKglC+var
 Tfi2ucRgQxHley5tBnIDWZfbrlOgL6GWmRh8wgVg1T/h2qO7cMaQu3mld2OrefjMmW9MHhrrTDz
 gIW+R/dA5wIUZ/+ImSKowHqzY9GwQFfdTcoDt6HWIPf4uid1CvQ8LejrKmGgSruthEjxII/9xjJ
 q6MCo4c/9BugNDnlgi7CocoeAAziFPbOtc/Tmuz/BXtEYtX6/qw==
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
 Documentation/ABI/testing/configfs-vkms         |   9 ++
 Documentation/gpu/vkms.rst                      |   7 +-
 drivers/gpu/drm/vkms/tests/Makefile             |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_configfs_test.c | 102 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.c            | 118 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h            |   6 ++
 6 files changed, 243 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 2ace79ce848a..48f92538c602 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -153,6 +153,15 @@ Description:
         Default color range presented to userspace, same
         values as supported_color_ranges.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_formats
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        List of supported formats for this plane. To add a new
+        item, write its fourcc code prefixed with '+'. To remove,
+        use '-' prefix. Use '+*' to add all formats, '-*' to
+        remove all.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index ab0eb2f97fc2..15d62ad963c9 100644
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
   values as supported_color_ranges
+- supported_formats: List of supported formats for this plane. To add a new item in the
+  list, write it using a plus and fourcc code: +XR24
+  To remove a format, use a minus and its fourcc: -XR24
+  To add all formats use +*
+  To remove all formats, use -*
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/tests/Makefile b/drivers/gpu/drm/vkms/tests/Makefile
index d4d9ba8d4c54..92cfa7262ba4 100644
--- a/drivers/gpu/drm/vkms/tests/Makefile
+++ b/drivers/gpu/drm/vkms/tests/Makefile
@@ -3,6 +3,7 @@
 vkms-kunit-tests-y := \
 	vkms_config_test.o \
 	vkms_format_test.o \
-	vkms_color_test.o
+	vkms_color_test.o \
+	vkms_configfs_test.o \
 
 obj-$(CONFIG_DRM_VKMS_KUNIT_TEST) += vkms-kunit-tests.o
diff --git a/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c b/drivers/gpu/drm/vkms/tests/vkms_configfs_test.c
new file mode 100644
index 000000000000..8d02c2c459d9
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
+ * @str: Contains the string to parse
+ * @str_len: str len
+ * @expected_len: expected len of the matched format
+ * @expected_offset: expected offset in the string for the parsed format
+ */
+struct vkms_configfs_parse_format_case {
+	const char *str;
+	int str_len;
+	int expected_len;
+	int expected_offset;
+};
+
+struct vkms_configfs_parse_format_case vkms_configfs_parse_format_test_cases[] = {
+	{
+		.str = "+RG24",
+		.str_len = 6,
+		.expected_len = 5,
+		.expected_offset = 0,
+	}, {
+		.str = "-RG24",
+		.str_len = 6,
+		.expected_len = 5,
+		.expected_offset = 0
+	}, {
+		.str = "  -RG24",
+		.str_len = 8,
+		.expected_len = 5,
+		.expected_offset = 2
+	}, {
+		.str = "+*",
+		.str_len = 3,
+		.expected_len = 2,
+		.expected_offset = 0
+	}, {
+		.str = "-RG24+RG24",
+		.str_len = 11,
+		.expected_len = 5,
+		.expected_offset = 0
+	}, {
+		.str = "-R1+RG24",
+		.str_len = 9,
+		.expected_len = 3,
+		.expected_offset = 0
+	}, {
+		.str = "\n-R1",
+		.str_len = 5,
+		.expected_len = 3,
+		.expected_offset = 1
+	}, {
+		.str = "-R1111",
+		.str_len = 3,
+		.expected_len = 3,
+		.expected_offset = 0
+	}
+};
+
+static void vkms_configfs_test_parse_format(struct kunit *test)
+{
+	const struct vkms_configfs_parse_format_case *param = test->param_value;
+	char *out;
+	int len = vkms_configfs_parse_next_format(param->str, param->str + param->str_len, &out);
+
+	KUNIT_EXPECT_EQ(test, len, param->expected_len);
+	KUNIT_EXPECT_PTR_EQ(test, out, param->str + param->expected_offset);
+}
+
+static void vkms_configfs_test_parse_format_get_desc(struct vkms_configfs_parse_format_case *t,
+						     char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", t->str);
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
index 7be6d10b2b68..a451d1122acf 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -3,6 +3,8 @@
 #include <linux/configfs.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string.h>
+#include <kunit/visibility.h>
 
 #include "vkms_drv.h"
 #include "vkms_config.h"
@@ -628,6 +630,120 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
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
+ * @page_end: last character of the page
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
+			if (len <= 1 || len > 5)
+				break;
+
+			page = tmp + len;
+			memcpy(fmt, &tmp[1], min(len - 1, 4));
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
@@ -636,6 +752,7 @@ CONFIGFS_ATTR(plane_, supported_color_ranges);
 CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encodings);
 CONFIGFS_ATTR(plane_, default_color_encoding);
+CONFIGFS_ATTR(plane_, supported_formats);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
@@ -646,6 +763,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
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
2.51.2

