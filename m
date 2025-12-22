Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A2CD57EC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF6B10E60C;
	Mon, 22 Dec 2025 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="I7uyW0f9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82FE10E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8EDE34E41D33;
 Mon, 22 Dec 2025 10:12:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 65DA2606C1;
 Mon, 22 Dec 2025 10:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7067910AB019D; Mon, 22 Dec 2025 11:11:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398318; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Z19aSMue5EyUWxQJrAm0oWhEPWe5muY+5GKKRbfkPYI=;
 b=I7uyW0f9JH7dW67DM9UM3Em+MSIgSDP3JYZJfdIIsUdBb/6jCJwnv1EclS8zPf9IKnZD15
 Qn5rhefF0Bm2MYIlS++19cbHLBOi8cy+FAS4gGhyrxg8gDH1GDbQJOgzGNLfM+Nkena6EU
 ctnc8Is+W+494zttkco7f6/pZ0SJN+OLC1DFvA1nTZ6AV0Tho6zThzQvAvJCRstPq81VXj
 Pqh/t/do9AYxFNeOYSGx0yF0wynlHD1LqfW4IxIHNF3LEJ6dJVMokTqAb7Jv9kFsNEIEBB
 wvw8NQXdvzZs40lnX1DARNG5sZIHFALwzpPo7bW6UZasOu9rRS0QwWKpT/nobA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:18 +0100
Subject: [PATCH v3 16/33] drm/vkms: Introduce configfs for plane color
 range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-16-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7379;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GvzL7GhhrNe9khGOkjshp+QmQ+GxzH5YD39LavoAsgU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlBGbQRGEaRq8WOntxQttW+rN+XXuVj9Sd3w
 cycRFVRX0uJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIMfg/+M+HvH+zPiPzcuVqPoup/xfYi287XA4I
 OjEIgMdhObpEczDLRQvpkpO5M6WNwXA70ZOuiu0c7VOQJZTVeuSVwHg+hnbGbewssGt0TK9O7qF
 SOEMMvpSUwgG8K2CCD/0b1/JhW96NzwJMfa10gYi1kt8QaNa5D6j56SxYEi+t35HdKK9YPjFvMN
 4AkqRDufUYEsJ/2B8qMKGT6zmAAMkqFEyT32pEX3BabsR1XV340XKjllQTe5o0PkCn/++de4iiF
 GNrT6BT/Z5dqLRProQ2Q3YKAtqVg/HgvvOwM5q481EGWWBU6B1ddxzE5adc8eugYWwPoaZ9YrCH
 hzH4u8SbDahZ597Cc5hyXFPvk+MRU/Nm8UPqUhz2dLM4ie2BB0zKnMjpb7x8g3luXnjx3KGDN2l
 XyBagH+CmVlPSvBodZBK6rP+pD8HSmxZuY+JnW3rPu8Asvv0j5uBY6fItFAAhAIGpU7vGeUgfaQ
 9hiEbW6QeHruy6h6E4xl2kU/yJKNEe9HDXQxBgviT8YboWoRkBbE07JHMl/kztsK4Nh5izxRpT/
 xmJCDnuBluAGKFG0nCOLSlze07RiH1X2wzEkBiiWau0yiti5MZ6FMUHZilrkz22JFEYtYAARHzC
 G/JFh/0SotbxFducu6lSotrvW8jycF1dnkzI83UnVsWcC2pZj5Iw=
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

To allows the userspace to test many hardware configuration, introduce a
new interface to configure the available color ranges per planes. VKMS
supports multiple color ranges, so the userspace can choose any
combination.

The supported color ranges are configured by writing a color range bitmask
to the file `supported_color_ranges` and the default color range is
chosen by writing a color encoding bitmask to `default_color_range`.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 15 ++++++
 Documentation/gpu/vkms.rst              | 10 +++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 93 +++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 242aae91289c..2ace79ce848a 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -138,6 +138,21 @@ Description:
         Default color encoding presented to userspace, same
         values as supported_color_encoding.
 
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/supported_color_ranges
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Available color ranges for the plane, as a bitmask:
+        0x1 - DRM_COLOR_YCBCR_LIMITED_RANGE,
+        0x2 - DRM_COLOR_YCBCR_FULL_RANGE.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/default_color_range
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Default color range presented to userspace, same
+        values as supported_color_ranges.
+
 What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 0d4dae3ba8e5..ab0eb2f97fc2 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 6 configurable attributes:
+Planes have 8 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -99,10 +99,16 @@ Planes have 6 configurable attributes:
   possible_rotations.
 - supported_color_encodings: Available encodings for a plane, as a bitmask:
   0x01 YCBCR_BT601, 0x02 YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
-  by the COLOR_ENCODING property of a plane). If set, supported_color_range
+  by the COLOR_ENCODING property of a plane). If set, supported_color_ranges
   must be set too.
 - default_color_encoding: Default color encoding presented to the userspace, same
   values as supported_color_encodings
+- supported_color_ranges: Available color range for a plane, as a bitmask:
+  0x1 DRM_COLOR_YCBCR_LIMITED_RANGE, 0x2 DRM_COLOR_YCBCR_FULL_RANGE (same values as
+  those exposed by the COLOR_RANGE property of a plane). If set, supported_color_encoding
+  must be set too.
+- default_color_range: Default color range presented to the userspace, same
+  values as supported_color_ranges
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 755978b17c95..7be6d10b2b68 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -17,6 +17,13 @@
 	BIT(DRM_COLOR_YCBCR_BT709) |		\
 	BIT(DRM_COLOR_YCBCR_BT2020))
 
+/**
+ * VKMS_SUPPORTED_COLOR_RANGES - Bitmask of all supported color ranges in VKMS
+ */
+#define VKMS_SUPPORTED_COLOR_RANGES (		\
+	BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |	\
+	BIT(DRM_COLOR_YCBCR_FULL_RANGE))
+
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
 
@@ -454,6 +461,88 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_ranges_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	unsigned int supported_color_ranges;
+
+	scoped_guard(mutex, &plane->dev->lock)
+		supported_color_ranges = vkms_config_plane_get_supported_color_ranges(plane->config);
+
+	return sprintf(page, "%u", supported_color_ranges);
+}
+
+static ssize_t plane_supported_color_ranges_store(struct config_item *item,
+						  const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~VKMS_SUPPORTED_COLOR_RANGES)
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & VKMS_SUPPORTED_COLOR_RANGES) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_supported_color_ranges(plane->config, val);
+	}
+
+	return count;
+}
+
+static ssize_t plane_default_color_range_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);;
+	unsigned int default_color_range;
+
+	scoped_guard(mutex, &plane->dev->lock)
+		default_color_range = vkms_config_plane_get_default_color_range(plane->config);
+
+	return sprintf(page, "%u", default_color_range);
+}
+
+static ssize_t plane_default_color_range_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~VKMS_SUPPORTED_COLOR_RANGES)
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & VKMS_SUPPORTED_COLOR_RANGES) == 0)
+		return -EINVAL;
+
+	if (!is_power_of_2(val))
+		return -EINVAL;
+
+	/* Convert bit position to the proper enum value */
+	val = __ffs(val) + DRM_COLOR_YCBCR_LIMITED_RANGE;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_plane_set_default_color_range(plane->config, val);
+	}
+
+	return count;
+}
+
 static ssize_t plane_supported_color_encodings_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
@@ -543,6 +632,8 @@ CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_ranges);
+CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encodings);
 CONFIGFS_ATTR(plane_, default_color_encoding);
 
@@ -551,6 +642,8 @@ static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_name,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_ranges,
+	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encodings,
 	&plane_attr_default_color_encoding,
 	NULL,

-- 
2.51.2

