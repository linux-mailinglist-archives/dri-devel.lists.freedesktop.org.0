Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBD59D634E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8427D10EC41;
	Fri, 22 Nov 2024 17:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XHLm6lKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43B310E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 893BEC0004;
 Fri, 22 Nov 2024 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5J8/1qIVEDgIv2xfQh9Kc681w0PsuNe7kBPqYu98OwA=;
 b=XHLm6lKydp86udKEjYAIhXJLWEegcN7GLr3g6X38pZGiQY+zPTHZUqBcxpGdZCxG81vOa4
 MKuKlbfxMyVOIIAYFFaJTc0uMKLygAr+zCsfaLDO2Iznpx1gYqInluU50H1e5CNFw9UIRc
 PUxcYoY+ZBGYVXi6LgzuuzHt0Lpda6KfDLxLhzn5+l8uMheSd6rDHSU0B0t+TOWQxfuVym
 iaNP/1yoPMf9DdQTXHTRg3+oeGQiVSxOp2b1zrmCrVP+MHHw8klIHnVzCP+fzBBhojSXLp
 6ioiEgoudjPB3mTiQkkfp0He4/7vTpHNU0Kce99SfUvmmxJ/74CJ2v0dbrucfQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:30 +0100
Subject: [PATCH RFC v2 04/16] drm/vkms: Introduce configfs for plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241122-google-config-fs-v2-4-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8211;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=usRPIC9dVvBKQW8H9D4zLMZm/e80qaVYBx0ziInZwU0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGq2IGl9SOkWOMRuhoWxTsY2gJrG3pDHLL5D
 Qd5VRQzCVGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqgAKCRAgrS7GWxAs
 4qrQD/wOFmEr7vWk8UFB8KSo+JvNCP92X9ut8wmCMB7Y8mo8vBtjRDxdBoksZtzbnG4XFIv21Yu
 3xropWVcyZsB2P20SLAK9wKn9D26m9+65giJo5xgwQY+ZY7JPuDRfGySzQ8/UhzL9i10x3w4UB7
 ryvTrYQkjraMCxdh3WO7/7b1MGA8N711UdYlpVjqzwZbuQiRDuAbhzoIMomlfSvqX16QC1e9s5C
 Hqp1VYPXOenolG7bmPQg8Jl2U+m7vCtdCnD1WvyJNR+b8Ry6O18VhVWrbLXnZAIARoUzqBE58Tb
 t+LgsJWGxrBDl/vdT7OkKEVPnrpchYq1ANAl/tFa8qV3O4N4Axt82los9aDxShkSOe55oQBb6Fd
 jW6W8Cw/LQ/YSIJpdAdVu6nnVNDFQUu+3A9YtpMlCANf8tYgVpNaKOyab9fGSfKRYz6WXavBpms
 LNGq8lEkLC6ay9N5Dq5t5JFB/ggRTHUFH6duLpPXlmXMoJcNa3o+6u7ZCjleGdcm8CKgJrwUT9f
 wfg3vqw4Kxy978kLtDZq8m3ditRHusfHa/cSk1JWhHXpGcy3+TVlp/WCyfZiiaDY0lv75S1UlcE
 b1b/b/WnfLb39EPkfypA18KyWEUjaK/isE8/oCdBJpjTB4WyWHhWrnfhcTXOAN8J611nK2Tf+RR
 WvjcJGJNmUlkZpg==
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
new interface to create and configure planes.

The planes are created by creating a directory in the `planes` directory.
The type of plane is configured by writing 0 (Overlay), 1 (primary) or 2
(cursor) in the file `type`.

As the CRTCs and encoders can't be configured yet, the planes are all
atteched to the same CRTC and encoder.

The current interface is:
/config/vkms
       	DEVICE_1
       	┣━ enable
       	┣━ planes
       	┃  ┣━ PLANE_1
       	┃  ┃  ┣━ type
       	┃  ┣━ PLANE_2
       	┃  ┃  ┗━ type
       	┃  ┗━ PLANE_3
       	┃     ┗━ type
       	DEVICE_2
       	┗━ ditto

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 149 ++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_configfs.h |  20 +++++
 2 files changed, 160 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 6535672f008401cf1ae008ff2ef74452b2575eab..ee64243396b3e586f76ff0671441c172da022421 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -10,6 +10,138 @@
 #include "vkms_drv.h"
 #include "vkms_config.h"
 
+static ssize_t plane_type_show(struct config_item *item, char *page)
+{
+	struct vkms_config_plane *plane;
+	enum drm_plane_type plane_type;
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+
+	mutex_lock(&vkms_configfs->lock);
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	plane_type = plane->type;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return sprintf(page, "%u", plane_type);
+}
+
+static ssize_t plane_type_store(struct config_item *item,
+				const char *page, size_t count)
+{
+	struct vkms_configfs_device *vkms_configfs = plane_item_to_vkms_configfs_device(item);
+	enum drm_plane_type val = DRM_PLANE_TYPE_OVERLAY;
+	struct vkms_config_plane *plane;
+	int ret;
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	if (val != DRM_PLANE_TYPE_PRIMARY && val != DRM_PLANE_TYPE_CURSOR &&
+	    val != DRM_PLANE_TYPE_OVERLAY)
+		return -EINVAL;
+
+	mutex_lock(&vkms_configfs->lock);
+	if (vkms_configfs->enabled) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+
+	plane = plane_item_to_vkms_configfs_plane(item)->vkms_config_plane;
+	plane->type = val;
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return count;
+}
+
+CONFIGFS_ATTR(plane_, type);
+
+static struct configfs_attribute *plane_attrs[] = {
+	&plane_attr_type,
+	NULL,
+};
+
+static void plane_release(struct config_item *item)
+{
+	struct vkms_configfs_plane *vkms_configfs_plane = plane_item_to_vkms_configfs_plane(item);
+
+	mutex_lock(&vkms_configfs_plane->vkms_configfs_device->lock);
+	vkms_config_delete_plane(vkms_configfs_plane->vkms_config_plane,
+				 vkms_configfs_plane->vkms_configfs_device->vkms_config);
+	mutex_unlock(&vkms_configfs_plane->vkms_configfs_device->lock);
+
+	kfree(vkms_configfs_plane);
+}
+
+static struct configfs_item_operations plane_item_operations = {
+	.release	= plane_release,
+};
+
+static const struct config_item_type subgroup_plane = {
+	.ct_attrs	= plane_attrs,
+	.ct_item_ops	= &plane_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *planes_make_group(struct config_group *config_group,
+					      const char *name)
+{
+	struct vkms_configfs_device *vkms_configfs;
+	struct vkms_configfs_plane *vkms_configfs_plane;
+
+	vkms_configfs = planes_item_to_vkms_configfs_device(&config_group->cg_item);
+	vkms_configfs_plane = kzalloc(sizeof(*vkms_configfs_plane), GFP_KERNEL);
+
+	if (!vkms_configfs_plane)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	if (vkms_configfs->enabled) {
+		kfree(vkms_configfs_plane);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-EINVAL);
+	}
+
+	vkms_configfs_plane->vkms_config_plane = vkms_config_create_plane(vkms_configfs->vkms_config);
+
+	if (list_count_nodes(&vkms_configfs->vkms_config->planes) == 1)
+		vkms_configfs_plane->vkms_config_plane->type = DRM_PLANE_TYPE_PRIMARY;
+
+	if (!vkms_configfs_plane->vkms_config_plane ||
+	    vkms_config_plane_attach_crtc(vkms_configfs_plane->vkms_config_plane,
+					  vkms_configfs->vkms_config_crtc)) {
+		kfree(vkms_configfs_plane);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	vkms_configfs_plane->vkms_config_plane->name = kzalloc(strlen(name) + 1, GFP_KERNEL);
+	if (!vkms_configfs_plane->vkms_config_plane->name) {
+		kfree(vkms_configfs_plane->vkms_config_plane);
+		kfree(vkms_configfs_plane);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+	strscpy(vkms_configfs_plane->vkms_config_plane->name, name, strlen(name) + 1);
+
+	config_group_init_type_name(&vkms_configfs_plane->group, name, &subgroup_plane);
+
+	vkms_configfs_plane->vkms_configfs_device = vkms_configfs;
+	mutex_unlock(&vkms_configfs->lock);
+
+	return &vkms_configfs_plane->group;
+}
+
+static struct configfs_group_operations planes_group_operations = {
+	.make_group	= &planes_make_group,
+};
+
+static const struct config_item_type planes_item_type = {
+	.ct_group_ops	= &planes_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enable_show(struct config_item *item, char *page)
 {
 	return sprintf(page, "%d\n",
@@ -92,23 +224,22 @@ static struct config_group *root_make_group(struct config_group *group,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	plane = vkms_config_create_plane(configfs->vkms_config);
-	crtc = vkms_config_create_crtc(configfs->vkms_config);
-	encoder = vkms_config_create_encoder(configfs->vkms_config);
-
-	if (!plane || !crtc || !encoder ||
-	    vkms_config_plane_attach_crtc(plane, crtc) ||
-	    vkms_config_encoder_attach_crtc(encoder, crtc)) {
+	configfs->vkms_config_crtc = vkms_config_create_crtc(configfs->vkms_config);
+	configfs->vkms_config_encoder = vkms_config_create_encoder(configfs->vkms_config);
+	if (!configfs->vkms_config_crtc || !configfs->vkms_config_encoder ||
+	    vkms_config_encoder_attach_crtc(configfs->vkms_config_encoder,
+					    configfs->vkms_config_crtc)) {
 		vkms_config_destroy(configfs->vkms_config);
 		kfree(configfs);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	plane->type = DRM_PLANE_TYPE_PRIMARY;
-
 	config_group_init_type_name(&configfs->group, name,
 				    &device_item_type);
 
+	config_group_init_type_name(&configfs->plane_group, "planes", &planes_item_type);
+	configfs_add_default_group(&configfs->plane_group, &configfs->group);
+
 	return &configfs->group;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
index 3de89c9c552c6603396f38a98ad35263f04bce26..6dc4d34a9e44ed4beb115ad3c86b759e28f5d0ef 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.h
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -19,15 +19,35 @@
 struct vkms_configfs_device {
 	struct config_group group;
 
+	struct config_group plane_group;
+
 	struct mutex lock;
 	bool enabled;
 
 	struct vkms_config *vkms_config;
+	struct vkms_config_crtc *vkms_config_crtc;
+	struct vkms_config_encoder *vkms_config_encoder;
+};
+
+struct vkms_configfs_plane {
+	struct config_group group;
+
+	struct vkms_configfs_device *vkms_configfs_device;
+	struct vkms_config_plane *vkms_config_plane;
 };
 
 #define config_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, group)
 
+#define planes_item_to_vkms_configfs_device(item) \
+	config_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define plane_item_to_vkms_configfs_device(item) \
+	planes_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define plane_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
+
 /* ConfigFS Support */
 int vkms_init_configfs(void);
 void vkms_unregister_configfs(void);

-- 
2.47.0

