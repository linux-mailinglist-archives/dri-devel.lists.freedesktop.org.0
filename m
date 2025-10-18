Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8ABEC44A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2634A10E2FD;
	Sat, 18 Oct 2025 02:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YS09XkyB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD6B10E2B8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C4A1FC041FD;
 Sat, 18 Oct 2025 02:01:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2660960701;
 Sat, 18 Oct 2025 02:02:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59F0E102F237F; 
 Sat, 18 Oct 2025 04:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6hPeezFEK8fFUjlqG2IDHzYvBSjLQwDfcFS+n/juJTY=;
 b=YS09XkyB68cPwVaPxsefZMB0FogT97D3R8wHmoWhfEKQXxlbCOJgQNuhvX/BZJPefR5r16
 wlRdKoJF0nDCHygQ4EuujVBs3Xjnb3JO6DFnJq5zcN7jioD+pJhHg6mcwIKGxmndd+c2vE
 4PTTYQ27q/khHJyz7KcnVSF1gILQYuPcmIl9ORc/Yt3FhgDEgNS0R0XlVKg4FBz3C/u3O+
 4FszEt6xlhohkhfuZ4Uo9VcmFpxcTOmDPA3c6nwzjUpC5GJJn80GYUIKNg3zy203eN4+uh
 z/O3dXTsAeHyR0bIZ+6tHs2DfMo+Uizcjz/QtKK2GERxo27bHm5NJTAUAfTmGw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:10 +0200
Subject: [PATCH 10/22] drm/vkms: Introduce configfs for plane format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251018-vkms-all-config-v1-10-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5175;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2mNbkLDFLzCOZFQ6ci6dI5H4l8UxAsXqJTQKymqgUTs=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT+I0II7TfpO7rU5VavNZfCeHY2NWiG5clr+
 nqIqu6L2MiJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/gAKCRAgrS7GWxAs
 4lK5D/9LQYak6q+u2zx53xekb9Fp4hX0sIKRYXeysmmMj4mJf+jOzTjRExvxPU/0d4ImoM17Mnb
 TLUcGqoN1tjUm8idcxEGIEzOGGZ6z0AuIqfa1JlF5mO/xdMLAnLSuQhm+QcVNLBgWC2cTB2hCeu
 yUYHwIfyxGwXTcFfcBAE7JB3QYnTpmMrFmvh8c4sabgPCVvVgbFQA2gr0nPXaWSXpriEAXq4f1z
 OcCaL0wWyBeLVpXjR8GBUcm8xmLiQDzKIrDKm1YaRxIyW1+VDgmrnXCvz8mzuCnpEzhgsPv6nrw
 TG5XfjSzuucEClJg1WASFSz/D+ULLgscSJZIdlwY2wguk1shF+A1P0e+MZNIxOLoxRDfuIHN3ih
 XMgpH1yI8zfKV0IlHhC/u6Zv/vPm4iksrDrbXvw71aJTZWmnP5gJrTTVhlzIRxvSS/ownG0IY9g
 qzp2qrN+JnLcbHd6v5r0XKpqqNBfN82ZoC4yDb5ZTuFcoOGoiXQC2ru63UMJfaGI0dZ4EES4ltT
 58tL6iTIG1jEXuYLBYjfjmcBZae4VHzMPuvD49DfjNTUCJmTl9KHbeE/o8GZekgqka4cPEjcvMc
 6kXo7fCmq8ZHCjhPEUZ70lVt3mS/qAR6OT2e5B7x9ZGZEXJIH6sjNeV0saEQOm94ZkTRlHuVBFF
 ci9iZkuEvrTT1Ig==
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
 Documentation/gpu/vkms.rst           |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 82 ++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 979f8a545498..deb14e7c48ea 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 7 configurable attribute:
+Planes have 8 configurable attribute:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -106,6 +106,11 @@ Planes have 7 configurable attribute:
   those exposed by the COLOR_RANGE property of a plane)
 - default_color_range: Default color range presented to the userspace, same
   values as supported_color_range
+- supported_formats: List of supported formats for this plane. To add a new item in the
+  list, write it using a plus its fourcc code: +XR24
+  To remove a format, use a minus and its fourcc: -XR24
+  To add all formats use +*
+  To remove all formats, use -*
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 0b280c73b0cc..528f22fa2df1 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -599,6 +599,86 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
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
+	scoped_guard(mutex, &plane->dev->lock)
+	{
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
+static ssize_t plane_supported_formats_store(struct config_item *item,
+					     const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+	int ret = 0;
+	int ptr = 0;
+
+	scoped_guard(mutex, &plane->dev->lock)
+	{
+		while (ptr < count) {
+			char tmp[4] = { ' ', ' ', ' ', ' ' };
+
+			memcpy(tmp, &page[ptr + 1], min(sizeof(tmp), count - (ptr + 1)));
+			if (page[ptr] == '+') {
+				if (tmp[0] == '*') {
+					ret = vkms_config_plane_add_all_formats(plane->config);
+					if (ret)
+						return ret;
+					ptr += 1;
+				} else {
+					ret = vkms_config_plane_add_format(plane->config,
+									   *(int *)tmp);
+					if (ret)
+						return ret;
+					ptr += 4;
+				}
+			} else if (page[ptr] == '-') {
+				if (tmp[0] == '*') {
+					vkms_config_plane_remove_all_formats(plane->config);
+					ptr += 1;
+				} else {
+					vkms_config_plane_remove_format(plane->config, *(int *)tmp);
+					ptr += 4;
+				}
+			}
+			/* Skip anything that is not a + or a - */
+			ptr += 1;
+		}
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
@@ -606,6 +686,7 @@ CONFIGFS_ATTR(plane_, supported_color_range);
 CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encoding);
 CONFIGFS_ATTR(plane_, default_color_encoding);
+CONFIGFS_ATTR(plane_, supported_formats);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
@@ -615,6 +696,7 @@ static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encoding,
 	&plane_attr_default_color_encoding,
+	&plane_attr_supported_formats,
 	NULL,
 };
 

-- 
2.51.0

