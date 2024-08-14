Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E9951E50
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 17:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C428B10E4C3;
	Wed, 14 Aug 2024 15:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ODBNCsvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7838410E4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 15:16:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B76F6000D;
 Wed, 14 Aug 2024 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723648564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKjlHe9xFxfKxkmQ2Xrvh2exVCHwikpOquCsWlg3HDk=;
 b=ODBNCsvgax6yadluuow6Hg23ozJQ0kMLzixXu1PjpmhkBGCY256ZffVGuyDTdZHq4EXtmV
 vVZcfHB4MRqzAywvLKaRur/uRH/hYEWkQMAZTXZU89+xRnwEdsFLXOQv19BgIAI6OIz0Z/
 Gh+VmHZLG6I7nBfCbv4C2RdKvLuxzb0iLQBt7CaEJ7zpTet9w+mjHZ9hLjHxLg/BQZoULa
 LiEk4Pgs4K/06wITfIz6jiCa9323304Vwh5MoMi5jHO1YDkNY7VovzmuZ4A63SyrgH4/YU
 hPQ8Vzq3ZWCIdydU6FaZorIVVp0ybtngc+tkW0LmwyTLW+cH5JI72wBHOoqBnQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 14 Aug 2024 17:15:51 +0200
Subject: [PATCH RFC 4/7] drm/vkms: Introduce plane rotation in ConfigFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240814-google-config-fs-v1-4-8363181907a6@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4639;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VisPuok/AC9dpwIcNrP7vfKY6K/NAxXvu5xl6hEogsw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvMot6Va9baCE8ZVJTTulVVVkuGAfsR922jQtf
 fjv3hnXzCSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrzKLQAKCRAgrS7GWxAs
 4jOZEACpZr0rF5dsoICC5hL0prJ53A10//5QCw9paKJ69iorMAdRkHTI53o8aAktLw7+VIhpuNn
 ouXlySYWierxeqoLOEz1G4424diN9mat2NE32BTPNq49GVd9M7h0JYV0H4z3Vm81TNl5mY/UGJT
 rn1gRrudMq75osD6OsxAQuYNvLJpUG03U99fzxdD2eSTtTV4keuF7HfCAgT302yDDKEHX2KLDSW
 JLpkerC/NANLjnBeOSQhw0K8aM5vozABMpehA7Rac5oahlQQm8XbSsKZ1YMviFgep3JEN9rBGXJ
 vXln1usnX7El9cJKDQ0CdXEoShJCfFvTRl1gH26hi3nwd3kNegUMRwl653r0nCJpHA/3mWXCuxC
 JII7AAPhaLwsD1jpd00dKkhmtwxQe0nzdgwVaJ01PN9K730Am/jpzpfOiuWifZ1WO2PUqTIcOqc
 rod249sXgbg8dRgWVS6FuPhwRieDt/JH7U6ehzHbXbPUYRC07ZgfrhI1bELg6/hqr3iv7UTb40e
 mbl1HO0AffYdaSI6Hpgpzb53HoARS6ZoaYJL1i7k2AMlyAELasbARbgzGQLzrQWU4kS5Mdalz8p
 kaWPKHq2bxhgJ1Bxeo4ZALX5aj9ab+7IkwboB2uu+mBa6wXs5cLlVsUu0P9tO54t3ehRe61uAL+
 Szp0ej3Qge39ULg==
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
new interface to configure the available rotation per planes. VKMS
supports any rotation and reflection, so the userspace can choose any
combination.

The supported rotations are configured by writing a rotation bitmask to
the file `supported_rotations` and the default rotation is chosen by
writing a rotation bitmask to `default_rotation`.

The current interface is:
/config/vkms
       	DEVICE_1
       	┣━ enable
       	┣━ planes
       	┃  ┗━ PLANE_1
       	┃     ┣━ type
       	┃     ┣━ supported_rotations
       	┃     ┗━ default_rotation
       	DEVICE_2
       	┗━ ditto

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 102 +++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index ee64243396b3..d121cf54e752 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -54,10 +54,112 @@ static ssize_t plane_type_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t plane_supported_rotations_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane;
+	unsigned int plane_type;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	plane_type = plane->supported_rotations;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", plane_type);
+}
+
+static ssize_t plane_supported_rotations_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct vkms_config_plane *plane;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+	int ret, val = 0;
+
+	ret = kstrtouint(page, 0, &val);
+	if (ret)
+		return ret;
+
+	/* Should be a supported value */
+	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
+		return -EINVAL;
+	/* Should at least provide one rotation */
+	if (!(val & DRM_MODE_ROTATE_MASK))
+		return -EINVAL;
+
+	mutex_lock(&vkms_configfs->lock);
+
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+
+	/* Ensures that the default rotation is included in supported rotation */
+	if (vkms_configfs->enabled || (val & plane->default_rotation) != plane->default_rotation) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+
+	plane->supported_rotations = val;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
+static ssize_t plane_default_rotation_show(struct config_item *item, char *page)
+{
+	unsigned int plane_type;
+	struct vkms_config_plane *plane;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	plane_type = plane->default_rotation;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", plane_type);
+}
+
+static ssize_t plane_default_rotation_store(struct config_item *item,
+					    const char *page, size_t count)
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
+	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
+		return -EINVAL;
+	/* Should at least provide one rotation */
+	if ((val & DRM_MODE_ROTATE_MASK) == 0)
+		return -EINVAL;
+	/* Should contains only one rotation */
+	if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK))
+		return -EINVAL;
+	mutex_lock(&vkms_configfs->lock);
+
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+
+	/* Ensures that the default rotation is included in supported rotation */
+	if (vkms_configfs->enabled ||
+	    (val & plane->supported_rotations) != val) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+	plane->default_rotation = val;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
 CONFIGFS_ATTR(plane_, type);
+CONFIGFS_ATTR(plane_, supported_rotations);
+CONFIGFS_ATTR(plane_, default_rotation);
 
 static struct configfs_attribute *plane_attrs[] = {
 	&plane_attr_type,
+	&plane_attr_supported_rotations,
+	&plane_attr_default_rotation,
 	NULL,
 };
 

-- 
2.44.2

