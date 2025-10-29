Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB140C1B42D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D4210E7C6;
	Wed, 29 Oct 2025 14:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Rtc3QZQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF11A10E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D82204E413CB;
 Wed, 29 Oct 2025 14:37:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC71D606E8;
 Wed, 29 Oct 2025 14:37:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85A06117F81B7; Wed, 29 Oct 2025 15:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748631; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lzv0r4HbW8ZPDlxxuNQc4DxHoOKfZX5QaG27pmKoI4k=;
 b=Rtc3QZQ3fiXUw8+6qo/NflDH5DpOVPJEm+U7pZN9v9i0EbZSXmunHZJUUcgqYnnxDEqsUn
 QZRsR3TSRbxX5uZSD4kt+nYg5TKVeGv4gIfXjHqzK7nJLMGwPl2bIJtgK1qCbPVvi4ii/U
 QAVRc6RV+Gh6NEYdSvtq+B/r8cn3Qj67MYkN3i8h7TqZpxNye1i86bvgavZmTcpyygUA7u
 ApwVchGshenisTrA8K17YU6/u5JQlWP0jn2Bx8koqHcJW1KO38STKOtLD88YNKs0Ma6N5v
 htezIF/xnsBdIDQYhFB8rkJo6CGeCxOXNMt57aZiGmTr/U9K7Y34eWUxXO9EWw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:49 +0100
Subject: [PATCH RESEND v2 12/32] drm/vkms: Introduce configfs for plane
 color encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-12-a49a2d4cba26@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5578;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=kRHIbdbfnhVWw5i8K9kmqCMqIgSkq6c1b5MfkOrcekc=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ7pFOlkdVDyBDjvvg1Ip41PonTgpIVTnnEu
 vMcPoWD2DWJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImewAKCRAgrS7GWxAs
 4obSD/95sJJ/ShFvJ849ag/SzYZvQymScWgZHbsOfYM3cuzwl4gSiGIjbedqQf61cKp1D/ZRZc6
 anOXBqUTaeQus/Ctmb6EfD+OD9cafyRZIkyUyMLDRJeoGjIQFcUJAbKvniJURK/VDLGTtcgW0qh
 t2/epJDrjUofLwrewDgAfpKTPCq5ujoY0VzjW1Dt8cSCtKP43MONAU0qIuv/Ym5IUFV4qsUg/qq
 C1Xxp7h5Ux7HmEJFZdBKSuiYuPNWaE3OTRiVwBLgk4RgMpMAOxoerY2nd9fbNE7W38EM3ZcpO6G
 SVDNYAN97QpYffICDigo0othj3NoJEKSMLUQHnk6hhjU3We+5F9WzJOCvyjiEmxfohXvXn4jaXS
 ZpiMSAaPmYsMjot3vnWHmKXXWjDEsl+IRiqE6x/1VSZOz83X7D/ywM66xRpP6qix7cHgsWwKGPZ
 UWzk6AxjqSH/sQ70c+QaLPIpzA//L/yQfntyLqyTqYeag3QZic1NLVYWj5KvVPkfaX8+UMtRVUE
 LUD8k1UZiqLnG5PeEciA37Zq8jZE/tO3BVLaNJdOfAUjuiED56TcDrcK+cAMRKM7u3m5DsYqLo+
 bfIyb+ItV8AmfFQfu6iGVmkxgX8r72V88E7y5iFgiYN/pzP9OHnJap2hvD8/L0YQ4BKjKSaJtbf
 x8OaHNSVFZMcRhQ==
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
new interface to configure the available color encoding per planes. VKMS
supports multiple color encoding, so the userspace can choose any
combination.

The supported color encoding are configured by writing a color encoding
bitmask to the file `supported_color_encoding` and the default color
encoding is chosen by writing a color encoding bitmask to
`default_color_encoding`.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 98 ++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index eac1a942d6c4..dab6811687a2 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 4 configurable attributes:
+Planes have 6 configurable attributes:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -97,6 +97,11 @@ Planes have 4 configurable attributes:
   (same values as those exposed by the "rotation" property of a plane)
 - default_rotation: Default rotation presented to the userspace, same values as
   possible_rotations.
+- supported_color_encoding: Available encoding for a plane, as a bitmask:
+  0x01 YCBCR_BT601, 0x02: YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
+  by the COLOR_ENCODING property of a plane)
+- default_color_encoding: Default color encoding presented to the userspace, same
+  values as supported_color_encoding
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7cc8ba315ef0..ee2e8d141f9e 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -439,16 +439,114 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_encodings_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int supported_color_encoding;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		supported_color_encoding = vkms_config_plane_get_supported_color_encodings(plane->config);
+	}
+
+	return sprintf(page, "%u", supported_color_encoding);
+}
+
+static ssize_t plane_supported_color_encodings_store(struct config_item *item,
+						     const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled)
+			return -EINVAL;
+
+		vkms_config_plane_set_supported_color_encodings(plane->config, val);
+	}
+
+	return count;
+}
+
+/* Plane default_color_encoding : vkms/<device>/planes/<plane>/default_color_encoding */
+
+static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int default_color_encoding;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		default_color_encoding = vkms_config_plane_get_default_color_encoding(plane->config);
+	}
+
+	return sprintf(page, "%u", default_color_encoding);
+}
+
+static ssize_t plane_default_color_encoding_store(struct config_item *item,
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
+	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled)
+			return -EINVAL;
+
+		vkms_config_plane_set_default_color_encoding(plane->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, name);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_encodings);
+CONFIGFS_ATTR(plane_, default_color_encoding);
 
 static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_name,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_encodings,
+	&plane_attr_default_color_encoding,
 	NULL,
 };
 

-- 
2.51.0

