Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F8951E4E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 17:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F1C10E4C6;
	Wed, 14 Aug 2024 15:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BkPNgfIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED3710E4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:16:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C2496000C;
 Wed, 14 Aug 2024 15:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723648566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZtHdgw9McHanJ5bgqEq9uSdi74niZL2dpQLUKRPjzOU=;
 b=BkPNgfIj7lzx08jG3e3/K2pbTyUPcF5iXTw/ho9ACTIoCqF+yUCGEvjOsOzEfMbPoyYwrs
 1inTWqg9LmvtK/SmG71dQD2apILkJvqMOOJ9HkwPoYvENWjyypWZrV0Uk5l1HpwJlYkjGQ
 sEJgRjICurqGYHXC1ifVNKmYMk/D5+97cVMRNUu9DH332tGSosjP0E4SQ0ioF/GjJOc6Rd
 u9vGowgFnsyTNC3Bb/5DsjDaF9zgoAZIFCF7c1wj2UnOskekTCW5dJzNXdhdcMMSpomNp1
 SKP+kVmuXQOP9x9zN3EsZGx7kDzrnlvMgh1l0eLrd0ZXqpX1j+9q/sOOmqi4Dw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 17:15:53 +0200
Subject: [PATCH RFC 6/7] drm/vkms: Add color range in ConfigFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240814-google-config-fs-v1-6-8363181907a6@bootlin.com>
References: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
In-Reply-To: <20240814-google-config-fs-v1-0-8363181907a6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5517;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UwfWjkDRUSPTIpDVCjvKIClHTrQ+CQ4DCl4x+NwGblw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMouw1bQlgtzsLxesTAO9Pp5Dmg7I7dl32SPZ
 QU6egIGqXyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzKLgAKCRAgrS7GWxAs
 4iMxEACrdScEUMyOO/jJ053MWzOFSgbEYepGRtExWLtPPnm9+5AUUKkcnsG1OhvPaQUt01+mdqq
 IQGZGP1OWrUnQT+QeRmyASiJMXXL5TeHtKYZiP+5zPa5WMQH684PVwWiGcx8Sg9awp/o2fG+gUu
 OB+L9quTbAZOJ0HQLeBWplv3/9UiNnRJ7I8IG8zVeWnYSZxaqwvEAVxMe2C8zJnx0z6HFyLv+cL
 w/5/7Nq5f+PvYDsLRQUf2/islVyD+O1lWcA9A49ufCNiTJTwyaPgz+dkq0NBReQOHxlAIsPoPwt
 /6z1FR7jLss/VPtL0ISd52wmjJ5dUw4ZgnJsIcfV8W+aiBbSV83ZjPGOjUqM2Ih97JcMYWMV6jD
 Ehp3wkiIx2o1oAPoT6if4WuuQFw5OAE1N6d604mFBdv7gFFYQz8Y3pqu6FBA8xqLOj9+8+DfhuO
 IDtiwAU77SzsmTiSWfeV2EOT/oyPDxT3ZnzNkT4uCBLNloP2YYqRrjziezrfYzWxuElpYLq+hqL
 0YA5E7ms3NHmXY1y/c1omia8ybwK9uGzMWr2jFxD2ZYW6iExhNhl5ueQ5gUVJuDAqIADMsdBNuU
 yuMaHIZWMGuc7TlJlnlPtwIYYl5wkzcWsE6vtTPegaiwNLmLeGAUZVqR8+/n5YwXfZYAFkXQDBO
 AVmX7eTU1ya6gAg==
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

To allows the userspace to test many hardware configuration, introduce a
new interface to configure the available color ranges per planes. VKMS
supports multiple color ranges, so the userspace can choose any
combination.

The supported color ranges are configured by writing a color range bitmask
to the file `supported_color_ranges` and the default color range is
chosen by writing a color encoding bitmask to `default_color_range`.

The current interface is:
/config/vkms
       	DEVICE_1
       	┣━ enable
       	┣━ planes
       	┃  ┗━ PLANE_1
       	┃     ┣━ type
       	┃     ┣━ supported_rotations
       	┃     ┣━ supported_color_encoding
       	┃     ┣━ supported_color_ranges
       	┃     ┣━ default_rotation
       	┃     ┣━ default_color_encoding
       	┃     ┗━ default_color_range
       	DEVICE_2
       	┗━ ditto

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 103 +++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index a3dab5986882..aabc83283626 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -152,6 +152,105 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_color_range_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane;
+	unsigned int plane_type;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	plane_type = plane->supported_color_range;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", plane_type);
+}
+
+static ssize_t plane_color_range_store(struct config_item *item,
+				       const char *page, size_t count)
+{
+	struct vkms_config_plane *plane;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
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
+	mutex_lock(&vkms_configfs->lock);
+
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+
+	/* Ensures that the default rotation is included in supported rotation */
+	if (vkms_configfs->enabled || (val & plane->default_color_range) !=
+				      plane->default_color_range) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+	plane->supported_color_range = val;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
+static ssize_t plane_default_color_range_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane;
+	unsigned int plane_type;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	plane_type = plane->default_color_range;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", plane_type);
+}
+
+static ssize_t plane_default_color_range_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct vkms_config_plane *plane;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
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
+	mutex_lock(&vkms_configfs->lock);
+
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+
+	/* Ensures that the default rotation is included in supported rotation */
+	if (vkms_configfs->enabled || (val & plane->supported_color_range) != val) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+	plane->default_color_range = val;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
 static ssize_t plane_supported_color_encoding_show(struct config_item *item, char *page)
 {
 	struct vkms_config_plane *plane;
@@ -258,6 +357,8 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, color_range);
+CONFIGFS_ATTR(plane_, default_color_range);
 CONFIGFS_ATTR(plane_, supported_color_encoding);
 CONFIGFS_ATTR(plane_, default_color_encoding);
 
@@ -265,6 +366,8 @@ static struct configfs_attribute *plane_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_color_range,
+	&plane_attr_default_color_range,
 	&plane_attr_supported_color_encoding,
 	&plane_attr_default_color_encoding,
 	NULL,

-- 
2.44.2

