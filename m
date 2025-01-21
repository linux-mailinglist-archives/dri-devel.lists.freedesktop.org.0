Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC8EA17FFA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C2F10E5D2;
	Tue, 21 Jan 2025 14:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ITEEl9mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C420410E1F7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92E21C000C;
 Tue, 21 Jan 2025 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4kdCBDe9xuwsQeWubDH2efG7OBEWc4e+RRIWgqRgXU=;
 b=ITEEl9mTKsIXw1o9Wuzu4Dfusbn9Mwnv32K26DrWhM4eAVEjgQgT6srKRK0DTbsIx4nrGU
 rmVXrOVH2X27M2zLH5xw4LqpRimXSvVEHHG6fZ3YXvZSivrf6CJ4FPApzoLoGBnradFQwn
 Nu7hDP3xrBl2Y7HDrJ9N6czDqNsZn1rQbeaZZyUZWLhw6aWjk2al/V8t2mD6uZ1KyTOoHC
 jVV8MFwKxKNRc52JIgyvygfI2dyl850+kzkoZEee/3V4J2M9sTpAFep2DgelUD0N2DULVp
 kCo1LjEJQobejYDkTh/HeSiouccsjLQAGGxpSDFBRGCzlKYQYOZcsYok05YXuA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:49 +0100
Subject: [PATCH RFC v3 05/14] drm/vkms: Introduce configfs for plane rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-config-fs-v3-5-8154a6945142@bootlin.com>
References: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
In-Reply-To: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4695;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sh1uavbHrltfBc1dqYD1CAI0M6uGSonUFdAxH2yw5fM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FBtcEAVABgB9edytn9wLYTtplp3sAj8OdJ1
 hEQ9iZm0huJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQQAKCRAgrS7GWxAs
 4sLdEAC4eG769t1R5wWPSUR7hpPE03jOBpieFGxa6TRjI3jz+Zf4RhKSMFd//scQMvo1WMHPUIx
 NN96abXK5IEcxfiGT98yI1ky561pso9RhgO13hICxl7xBCD3O4rPznhP5tIjDBHfCYjm9da4R3V
 XzGZWdeoessXjAiG+GvVZ1AaFaVw3MQskJQM+Rrib1OlbGSTZbAXYPVHqpdflAmHnwNRFrqatwz
 OhWm+4J4oDU+Z81UHbZ5MP0qFoFN4ZQEhe3W0Ba6QnTN4liW7jQwyTYfdIgHL/WOFkT+n5mvcAq
 jzeXIX2rin8wafeXhqf0nd7eEWMfU3AHp2bje1vENp0odMwGmjA5/6gtgUIXfwrtQ+CCRKu/yNr
 J9OXumstQCybZlTESzcPqJ/B/FNXOL9Sc+HL3vyVJpseptcA/1AzaZIdkLlfwWiCjXWTiXvmj/u
 C0jyfmIrohhIMDDSKQNUzCk4jbrLbXs/SEdQCVMw+xGGeCTp8bF2m2ZyI1VJqCSDcut0Xn5B46i
 n3wYGHnJL/BTsQk5XDPHkyLtKvdDgmiE7ai9MHZ5p7jVUHJDGXaB++q9u4bS4L+ivR1MVJ7UW6B
 fW08+B3d6IUzEqD2v1hdfJglaEL9R0S3/W47ZvPK9BSxC/ujMDJ3jJOUyqpRpwppbmZr/SlarHO
 3C2H9WJ0rMa6kzg==
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
index ee64243396b3e586f76ff0671441c172da022421..d121cf54e75238bdb582362596a353682cceebd3 100644
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
2.47.1

