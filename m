Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C1D9D634D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1677F10E1DD;
	Fri, 22 Nov 2024 17:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="P4Fm/RC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BBD10E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B79B0C0006;
 Fri, 22 Nov 2024 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kt8qlZY/tj6GEp78aj6VZ1os0+2NQYLUu/22uYDQn5g=;
 b=P4Fm/RC03RKOkMSp/B7FO/rxBabGkPz4UZdZdR/bRr69Nlisj3LGxd5uhE3D4JdRHCdBYh
 nOHDVxjZ73lBBtHgOHC4epHFH6QSqit1vPwhJgWLdhCuwzW+WLWZ4QdceBBUWD5SvMcLtF
 +6efdHk7fkLrtIaFe78KvaI0OWOyXANU7sr3BMIUSLzgBSIXf0Ro82V7seH+7uidCfLkwE
 Kyd+foOIPGN0i0jygsSosnZNfEFQBVlWaTa3pavK/lvRp7tNY4SwGitMTq2SP4J4EMawUa
 2F1BSH9uC36/fJzDuk8sHbdQadHoRI9fNx3UCTWG2ANumM2pdPtfZs1jK8HlvQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:32 +0100
Subject: [PATCH RFC v2 06/16] drm/vkms: Introduce configfs for plane color
 encoding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-google-config-fs-v2-6-4b7e6f183320@bootlin.com>
References: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
In-Reply-To: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5428;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=wcIJm3kHeSigFQ99DWfHwW++s/RteRtZ9KRl09b10LU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGqSNwW8YghQk9G6o21hTr/TYaHzLenBo6X6
 AX6vtQ6elyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqgAKCRAgrS7GWxAs
 4iO6D/9ZRsaSOR4MzlK0s9EsmZ8hPpg3JYY4pqDgh/VXZarxHUb4ka3fknzuArnJZPXNFvWo2Lg
 Lor4XIf5p1KTT35chmNGCu6uEXF5r4tj+zgL37PXlBJR7pBZbSiiG5VzDieE8WfDaZWQ4ntEFXc
 0z0eXg1VLK5b8tKakGpuMYLdWurOuYZhIK1OORyeFAup3JYLgkXSx+Zu6m8yggitZxGkcLtZdAZ
 +eGSUk9iteWuyN4aeJ3B9in4FKVPjDj7cx5L1PmrA7CkYQ2mTEpJwRbjcqCrWq9eOIhqypsvqEr
 ChKFrrhNGimhKle7jnNd6fyd9VvmPaXzbqW6xxHBCXvz10cDqGadamCbayRjlaGmSENFnpcoXSZ
 svjsszxI366EmTB3TgU7tNWG6g6NBBVSYRYjeOZln69LI2DEVPdCCsNAeTWn8jlsVXUMWMX+bN5
 hSgfhV71gVCrJXjN1KSJNb1tvUhnnn7DLlUX23z2Q8PQOjsarxoQVkZ1lfGZK0+qXssdlaZ7V7u
 o+ifEjzD23Hy+2hKNu+ogiZToOWJ2EFdOWXDNFIdykYzs5btPod/SmlZfh3EL9A5rOuaF8iUU8n
 UX0ErgfQLxactyYk1oRho+QlutWjWf0zLRsQ0/O8hGosMTku4VepxeDq/9vHUKK6EVFGb3I1BMl
 m/MhI0BVFWZ8D0w==
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
new interface to configure the available color encoding per planes. VKMS
supports multiple color encoding, so the userspace can choose any
combination.

The supported color encoding are configured by writing a color encoding
bitmask to the file `supported_color_encoding` and the default color
encoding is chosen by writing a color encoding bitmask to
`default_color_encoding`.

The current interface is:
/config/vkms
       	DEVICE_1
       	┣━ enable
       	┣━ planes
       	┃  ┗━ PLANE_1
       	┃     ┣━ type
       	┃     ┣━ supported_rotations
       	┃     ┣━ supported_color_encoding
       	┃     ┣━ default_rotation
       	┃     ┗━ default_color_encoding
       	DEVICE_2
       	┗━ ditto

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 107 +++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index d121cf54e75238bdb582362596a353682cceebd3..a3dab59868829266adfe8192c5089cda2044c050 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -152,14 +152,121 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_color_encoding_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane;
+	unsigned int supported_color_encoding;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	supported_color_encoding = plane->supported_color_encoding;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", supported_color_encoding);
+}
+
+static ssize_t plane_supported_color_encoding_store(struct config_item *item,
+						    const char *page, size_t count)
+{
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+	struct vkms_config_plane *plane;
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
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+
+	/* Ensures that the default rotation is included in supported rotation */
+	if (vkms_configfs->enabled || (val & plane->default_color_encoding) !=
+				      plane->default_color_encoding) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+	plane->supported_color_encoding = val;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
+/* Plane default_color_encoding : vkms/<device>/planes/<plane>/default_color_encoding */
+
+static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane;
+	unsigned int default_color_encoding;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	default_color_encoding = plane->default_color_encoding;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", default_color_encoding);
+}
+
+static ssize_t plane_default_color_encoding_store(struct config_item *item,
+						  const char *page, size_t count)
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
+	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020)))
+		return -EINVAL;
+	/* Should at least provide one color range */
+	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
+		    BIT(DRM_COLOR_YCBCR_BT709) |
+		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
+		return -EINVAL;
+	mutex_lock(&vkms_configfs->lock);
+
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+
+	/* Ensures that the default rotation is included in supported rotation */
+	if (vkms_configfs->enabled || (val & plane->supported_color_encoding) != val) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+	plane->default_color_encoding = val;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
 CONFIGFS_ATTR(plane_, supported_rotations);
 CONFIGFS_ATTR(plane_, default_rotation);
+CONFIGFS_ATTR(plane_, supported_color_encoding);
+CONFIGFS_ATTR(plane_, default_color_encoding);
 
 static struct configfs_attribute *plane_attrs[] = {
 	&plane_attr_type,
 	&plane_attr_supported_rotations,
 	&plane_attr_default_rotation,
+	&plane_attr_supported_color_encoding,
+	&plane_attr_default_color_encoding,
 	NULL,
 };
 

-- 
2.47.0

