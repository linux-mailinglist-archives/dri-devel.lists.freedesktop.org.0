Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A15BEC43E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8686610E1E1;
	Sat, 18 Oct 2025 02:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MG8XqxBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15AC10E1E1
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 8E6444E4115A;
 Sat, 18 Oct 2025 02:02:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 62B3960701;
 Sat, 18 Oct 2025 02:02:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 18902102F2374; 
 Sat, 18 Oct 2025 04:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752925; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mUC/vEkoGcXyZ75OJMbMdVS3GQepVe8NXgqtCKnbu8s=;
 b=MG8XqxBbhtzHtKE3Rbi7qq92o7l6lKRDN39PwNMFxjRFESoMQCz/GOwFG4qv19c7P+IwHA
 XkWTJnC8noJ3S0A1E/bodsAjDj86Dmf9NQMnvchss2eSyuRWTK82mPgtWcy7ZDaShYI91V
 MYJ66O/RWQf2rJHCOWH2EwYRAhJVv12rU6mrSn+ltWBkzSfs3Kn3fb+gqj0MmxURzBc84z
 u1etgs0UmQETn6oJbh9QfNWAS4REcKi39vgw0SSloJr0huj50o9BnbwByb62f3T2iPOTCb
 KJi4fMM02ZJ8J5IkrJNtK2uNkhP6+4vVCkHqK+XeqDoFRSFMtmR4Mkz0e4mUmw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:08 +0200
Subject: [PATCH 08/22] drm/vkms: Introduce configfs for plane color range
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-8-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5887;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/b9xPd8YaiacLRDm2YN6LLTzKy1Exvm8U/k97YcQ6S4=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT9Q5gxuxkfUXK1xhgoVTs0uZ/MGBCv8tX0c
 La3ktFmyiOJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/QAKCRAgrS7GWxAs
 4gVxD/9clV2LbSo3hSWwXpfE0TS9smFi5xG4lS7M/QE9lwhC7YW8vy+T3PMJvZIS1QB67u2eSl2
 KcIzxdqN3qPl25/Fz+5eVy2HApKpEF3LoO4gnbeAO6j6gAWAWT0aXkVhDdhFivhyz/1880iFKnR
 CHavexbpc3lW9gGV6ag2zOFPcDLUzy/8nYeLh202t4DuFv/dYJCLoadZvxCsC9s1bGjVeiA+sos
 ggO0TK5czcfH5oCfy18NgwFwygV8FNLXSGboPqZHbLSoup8VjfN8vytcUxvJf5yck3V08BxSbO2
 Qhafposo9X2PecE0FKwgsBihC33UeplYyFbEUhRoHw25Tn/h9GSD3s4LWcQl4oUEl8sLEvMXwrf
 jgEsorWE+9MGMuS4iJBHHbDUX4WxxLdYBLOyebk34rssS1l4UjaM9vLzknwCbQx2Wvl4+gNBTyz
 VF0Qd5UB4v4AnZyCPR+51PSEHuE8nWURE13AgPWbvMJoVPxn+drXSMEciTWfNaGhiGh0QZLC5rQ
 yQ0OVKqYK4WGYFJWPcD+C2L03ngpd6Di+bMs2WJe/5A5vQq3piE8zUcFQekMyS6+83Iw85upI5A
 6rOsd5upPxYCvtDnxuCXp0+54FaL80mhc+SKjRsen28Os4b3CfeCCSycAARNsDrQk1pqTHOCadZ
 p0SZ3ha6w3XdqFA==
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
 Documentation/gpu/vkms.rst           |  7 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 93 ++++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 4ff75b53a386..979f8a545498 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -87,7 +87,7 @@ Start by creating one or more planes::
 
   sudo mkdir /config/vkms/my-vkms/planes/plane0
 
-Planes have 5 configurable attribute:
+Planes have 7 configurable attribute:
 
 - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
   exposed by the "type" property of a plane)
@@ -101,6 +101,11 @@ Planes have 5 configurable attribute:
   by the COLOR_ENCODING property of a plane)
 - default_color_encoding: Default color encoding presented to the userspace, same
   values as supported_color_encoding
+- supported_color_range: Available color range for a plane, as a bitmask:
+  0x1 DRM_COLOR_YCBCR_LIMITED_RANGE, 0x2 DRM_COLOR_YCBCR_FULL_RANGE (same values as
+  those exposed by the COLOR_RANGE property of a plane)
+- default_color_range: Default color range presented to the userspace, same
+  values as supported_color_range
 
 Continue by creating one or more CRTCs::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a4e0e054cf2d..0b280c73b0cc 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -412,6 +412,95 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_range_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int supported_color_range;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		supported_color_range = vkms_config_plane_get_supported_color_range(plane->config);
+	}
+
+	return sprintf(page, "%u", supported_color_range);
+}
+
+static ssize_t plane_supported_color_range_store(struct config_item *item,
+						 const char *page, size_t count)
+{
+	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled ||
+		    (val & vkms_config_plane_get_default_color_range(plane->config)) !=
+		     vkms_config_plane_get_default_color_range(plane->config))
+			return -EINVAL;
+		vkms_config_plane_set_supported_color_range(plane->config, val);
+	}
+
+	return count;
+}
+
+static ssize_t plane_default_color_range_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_plane *plane;
+	unsigned int default_color_range;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
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
+	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		/* Ensures that the default rotation is included in supported rotation */
+		if (plane->dev->enabled ||
+		    (val & vkms_config_plane_get_supported_color_range(plane->config)) !=
+		     val)
+			return -EINVAL;
+		vkms_config_plane_set_default_color_range(plane->config, val);
+	}
+
+	return count;
+}
+
 static ssize_t plane_supported_color_encoding_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -513,6 +602,8 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_range);
+CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encoding);
 CONFIGFS_ATTR(plane_, default_color_encoding);
 
@@ -520,6 +611,8 @@ static struct configfs_attribute *plane_item_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_range,
+	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encoding,
 	&plane_attr_default_color_encoding,
 	NULL,

-- 
2.51.0

