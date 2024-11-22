Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638819D634A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D5410EC39;
	Fri, 22 Nov 2024 17:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oMz1yEI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059E610E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8AE7C000A;
 Fri, 22 Nov 2024 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOsGcq1tgnZ8J3YdAQwSil2grZlMHMu/LuOePC1ySMQ=;
 b=oMz1yEI1hls94RmSiM9sPRDlBjlxb/3MRRkxg+zJc/BWsu3CH8hNbDAsQQHwl9XaoC+GJa
 Ff3up5EP9hOATAmI38KKN6+OIAavhfUdEzUSJR88NmXhbE5PW5BEfaJXg2dQdlqyJJwnyl
 nhLPDchLjPWRR5b/c2R+YidAN05CUqwKmMBUeFB+rEjfAT2pRw0WcM7YPYTTGG0YLvbDOb
 O4zesuafKOOh+a5b8ZzlV3u2KJRH2awDOBNR8wt4oSVfuJ09jGik+/tjR1pVLLyYfY5Nrs
 GLYVyhTcZKnYI4sKhdkAcCTAe9ATY6gYbedxSy3E0UNQa0fhl4ea/0waP4rlkA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:31 +0100
Subject: [PATCH RFC v2 05/16] drm/vkms: Introduce configfs for plane rotation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-google-config-fs-v2-5-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4695;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZvvsaZwGqFsLr0ChkQtKz12Rpe5AImIeJhO57DvpCUU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGqV1JFvAcJ+p3yD1XW/GaJZSLJi4ZgXZ9D2
 YfnhbLMTkGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqgAKCRAgrS7GWxAs
 4pIYEADWRI5sKoMv/PlWUSS52nO5VAVtM2FtMi7dn1xxvD46lfriigR6KbhMiaGCGzA1z/vF0qG
 NKX0m5eOeqg5EQCey32+HmjEENRTu11dWUGoSg1Qz/D1eXvyu7kR8l8XOikldJINKBpYPXr2OOG
 a/PQhC7gwJdyg/gTV5yu+bHIRhu7QLRYWXkw6O3gL1not86PPglBroB7WxrT5aseD2X1F7Gu53I
 hWCm/MP69/bmMxmvAoBxmsV1M2Lqi14qVFVu9gYjGCzTvB+jFzk+GEmli32AfiW71cEnm+hlDnL
 oX0hhK5WtblFvUMEv0SB/mygrCNdx7w+3tnGrjke6aKPpf/J7HR4n8cFtIThqOzE+0PeF9x0MnF
 sofuoOQMsekiMLTsen21odN9amU+eUsHgujfD/Tn5B2hR5YemE8rquwzUcCjoIorlmtCxqbm1eZ
 6XZZ7kdmlJXM1pMFhp/Fiy5HLR7k4ygxvBltTK98djUTVO9ai0DKChalBI7wQcvYHHr9Slh4VRh
 IIbhWuHASCJ4z4Mi8+OMGE8QgsJZMsIT06NBbyvuNuZhuqkHPBX64icDkVLoTEBRorkZ4XLcomy
 X3FG81nc2ej04ToYFX3lPSCAf6mDzrRC8W0IGYjUkzCiNZjQoFegpBCKzCD1pX7rpmYH2m1/Tbo
 6DXA2HLtOceepig==
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
2.47.0

