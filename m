Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5706CA18004
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A345C10E5DE;
	Tue, 21 Jan 2025 14:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OZUUfthM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D1110E5D3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5FFCC000F;
 Tue, 21 Jan 2025 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUsKkmGAFs6k8Yn+KqxWP5wqz1X2+AvvPHUTijbIldY=;
 b=OZUUfthMGXZHtlfNQk2qnnJOTx8NeGoapIoFvEHJro3rAu3j+6hMWkWMuwwxcDSI8lfjiR
 a+yCR6L1z0jjbObWu+9O7G4pbzcP+YJiTdrLA3nzoXM/NYYeo/+OBsAlw5sK1FNOOn11k3
 kFfU4oblQ4tGgEZQfmbZG2pPu/qVyeThmAODvm87ouY+RvZGu0XPGgLYYkW54DbRkjc/+z
 YlLFFZsiSc8C0Sk8f7oHe2Q+G5lzFMKt5EdoyfiWb32UAvdcG86l+FaRBIyXYQC9HjFBCn
 Y43nYTTQ5ORLLDmZXpwzmiFFOTmVY0dvZwpdF3UtdTWxy8EQ9G9s9QDuGPAWbA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:50 +0100
Subject: [PATCH RFC v3 06/14] drm/vkms: Introduce configfs for crtc and encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-config-fs-v3-6-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=20793;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=l+eBSQS58TyEh0+EXc/PnoVH5DKTBi+3J2IbJZ/0ZN4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FBxAvO6RcdtRh8eRbjvyG/FNQ6+TElxc/pk
 qYmdoNiVhmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQQAKCRAgrS7GWxAs
 4ppPEACaY7JggZIixLD4jd2ZnwOXkw9/GnzQwXolvny4QuGOfZmg1B1Be0baESuPAiXgIH5NH3B
 gar3C/f2lI/0amBulx6DN05NBJK2ArYgbtxDf4j0eOFd52SAc9wGhnq7AmhUWyHF1mIeeBu3/bN
 inb5NNGfauUew0N6OHkN2/M/XlLf4kBMvj9DxhUlhBd+YyI94e2KGsDqnjoSOGF3NMUgxcK9hpD
 91rhyid1Ldsxm98vYTJ4NqJpfP944MGwD2WoJVxyMp0hG42tbYPgIqE0o7bzQfp6y6YjXx/yLbc
 LgoW2i0rfYpR6BtIdgHBidE75e/diQBJL4hB1DwcDPj6wxyua6mP5S4CR5SAcPR39HZazfoyyoH
 8Nef2uWH8ztySrY8vnPe5E8i0A9kMm4pLfQoqtJhrj+DsHWJdENGWP01DWsWN24hfZh1KEo9JdU
 8AokGOQsWOjRRQq5ZRnzQlxY7VU/W8dHTCYPX8VE8lN6jxh+6U4/+2IMcCaMG4nJ+hsIQ5REHBF
 edHwOUZBwcZSad2+lYxK9iEIQhdVhzX6M/FcqMrlW/IhqMVef5keFybQUb0r2d64fFJWtwGxAwQ
 AopWKF6ZoZHnN8HWgeq1hvgV1R/SGhddFfoqKmZb7nnOZnQWBuWxSzWmoXbTPZKF9AeajREuttc
 olj0MoIOH3Klz0w==
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
new interface to configure CRTCs and encoders.

The CRTCs and encoders are created in their own directory. To link the
CRTC, symlinks are used in the `possible_crtcs` folders.

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
	┃     ┣━ default_color_range
	┃     ┗━ possible_crtcs
	┃        ┗━ >> /config/vkms/DEVICE_1/crtcs/CRTC_1
	┣━ encoders
	┃  ┗━ ENCODER_1
	┃     ┗━ possible_crtcs
	┃        ┗━ >> /config/vkms/DEVICE_1/crtcs/CRTC_1
	┣━ crtcs
	┃  ┗━ CRTC_1
	DEVICE_2
	┗━ ditto

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_configfs.c | 401 +++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_configfs.h |  54 ++++-
 2 files changed, 434 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index d121cf54e75238bdb582362596a353682cceebd3..9f41506849552960970aa08b9329b4f88d0aa8e7 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -5,6 +5,7 @@
 #include <drm/drm_print.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/generic-radix-tree.h>
 
 #include "vkms_configfs.h"
 #include "vkms_drv.h"
@@ -185,6 +186,84 @@ static const struct config_item_type subgroup_plane = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static const struct config_item_type crtc_item_type;
+static const struct config_item_type planes_item_type;
+
+static int possible_crtcs_allow_link(struct config_item *src,
+				     struct config_item *target)
+{
+	struct vkms_configfs_device *vkms_configfs = plane_possible_crtc_src_item_to_vkms_configfs_device(src);
+	struct vkms_config_crtc *crtc;
+
+	mutex_lock(&vkms_configfs->lock);
+
+	if (target->ci_type != &crtc_item_type) {
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+
+	crtc = crtc_item_to_vkms_configfs_crtc(target)->vkms_config_crtc;
+	struct vkms_config_plane *plane = plane_possible_crtc_src_item_to_vkms_configfs_plane(src)->vkms_config_plane;
+
+	struct vkms_config_crtc *crtc_entry;
+	unsigned long idx = 0;
+
+	xa_for_each(&plane->possible_crtcs, idx, crtc_entry) {
+		if (crtc_entry == crtc) {
+			mutex_unlock(&vkms_configfs->lock);
+			return -EINVAL;
+		}
+	}
+
+	if (vkms_config_plane_attach_crtc(plane, crtc))
+		return -EINVAL;
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return 0;
+}
+
+static void possible_crtcs_drop_link(struct config_item *src,
+				     struct config_item *target)
+{
+	struct vkms_config_crtc *crtc;
+	struct vkms_configfs_device *vkms_configfs = plane_possible_crtc_src_item_to_vkms_configfs_device(src);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	crtc = crtc_item_to_vkms_configfs_crtc(target)->vkms_config_crtc;
+	struct vkms_config_plane *plane = plane_possible_crtc_src_item_to_vkms_configfs_plane(src)->vkms_config_plane;
+
+	struct vkms_config_crtc  *crtc_entry;
+	struct vkms_config_plane *plane_entry;
+	unsigned long crtc_idx  = -1;
+
+	xa_for_each(&plane->possible_crtcs, crtc_idx, crtc_entry) {
+		if (crtc_entry == crtc)
+			break;
+	}
+	unsigned long plane_idx = -1;
+
+	xa_erase(&plane->possible_crtcs, crtc_idx);
+	xa_for_each(&crtc->possible_planes, plane_idx, plane_entry) {
+		if (plane_entry == plane)
+			break;
+	}
+	xa_erase(&crtc->possible_planes, plane_idx);
+
+	mutex_unlock(&vkms_configfs->lock);
+}
+
+static struct configfs_item_operations plane_possible_crtcs_item_ops = {
+	.allow_link = &possible_crtcs_allow_link,
+	.drop_link = &possible_crtcs_drop_link,
+};
+
+static struct config_item_type plane_possible_crtcs_group_type = {
+	.ct_item_ops = &plane_possible_crtcs_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
 static struct config_group *planes_make_group(struct config_group *config_group,
 					      const char *name)
 {
@@ -209,10 +288,7 @@ static struct config_group *planes_make_group(struct config_group *config_group,
 
 	if (list_count_nodes(&vkms_configfs->vkms_config->planes) == 1)
 		vkms_configfs_plane->vkms_config_plane->type = DRM_PLANE_TYPE_PRIMARY;
-
-	if (!vkms_configfs_plane->vkms_config_plane ||
-	    vkms_config_plane_attach_crtc(vkms_configfs_plane->vkms_config_plane,
-					  vkms_configfs->vkms_config_crtc)) {
+	if (!vkms_configfs_plane->vkms_config_plane) {
 		kfree(vkms_configfs_plane);
 		mutex_unlock(&vkms_configfs->lock);
 		return ERR_PTR(-ENOMEM);
@@ -229,7 +305,12 @@ static struct config_group *planes_make_group(struct config_group *config_group,
 
 	config_group_init_type_name(&vkms_configfs_plane->group, name, &subgroup_plane);
 
+	config_group_init_type_name(&vkms_configfs_plane->possible_crtc_group, "possible_crtcs",
+				    &plane_possible_crtcs_group_type);
+	configfs_add_default_group(&vkms_configfs_plane->possible_crtc_group,
+				   &vkms_configfs_plane->group);
 	vkms_configfs_plane->vkms_configfs_device = vkms_configfs;
+
 	mutex_unlock(&vkms_configfs->lock);
 
 	return &vkms_configfs_plane->group;
@@ -244,6 +325,283 @@ static const struct config_item_type planes_item_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void crtc_release(struct config_item *item)
+{
+	struct vkms_configfs_crtc *vkms_configfs_crtc = crtc_item_to_vkms_configfs_crtc(item);
+
+	mutex_lock(&vkms_configfs_crtc->vkms_configfs_device->lock);
+	vkms_config_delete_crtc(vkms_configfs_crtc->vkms_config_crtc,
+				vkms_configfs_crtc->vkms_configfs_device->vkms_config);
+	mutex_unlock(&vkms_configfs_crtc->vkms_configfs_device->lock);
+
+	kfree(vkms_configfs_crtc);
+}
+
+static struct configfs_item_operations crtc_item_operations = {
+	.release = crtc_release,
+};
+
+static const struct config_item_type crtc_item_type = {
+	.ct_owner	= THIS_MODULE,
+	.ct_item_ops	= &crtc_item_operations,
+};
+
+static struct config_group *crtcs_make_group(struct config_group *config_group,
+					     const char *name)
+{
+	struct config_item *root_item = config_group->cg_item.ci_parent;
+	struct vkms_configfs_device *vkms_configfs = config_item_to_vkms_configfs_device(root_item);
+	struct vkms_configfs_crtc *vkms_configfs_crtc;
+
+	vkms_configfs_crtc = kzalloc(sizeof(*vkms_configfs_crtc), GFP_KERNEL);
+
+	if (!vkms_configfs_crtc)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&vkms_configfs->lock);
+	vkms_configfs_crtc->vkms_configfs_device = vkms_configfs;
+
+	if (vkms_configfs->enabled) {
+		kfree(vkms_configfs_crtc);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-EINVAL);
+	}
+
+	vkms_configfs_crtc->vkms_config_crtc = vkms_config_create_crtc(vkms_configfs->vkms_config);
+
+	if (!vkms_configfs_crtc->vkms_config_crtc) {
+		kfree(vkms_configfs_crtc);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	vkms_configfs_crtc->vkms_config_crtc->name = kzalloc(strlen(name) + 1, GFP_KERNEL);
+	if (!vkms_configfs_crtc->vkms_config_crtc->name) {
+		kfree(vkms_configfs_crtc->vkms_config_crtc);
+		kfree(vkms_configfs_crtc);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	vkms_configfs_crtc->vkms_configfs_device = vkms_configfs;
+
+	strscpy(vkms_configfs_crtc->vkms_config_crtc->name, name, strlen(name) + 1);
+	config_group_init_type_name(&vkms_configfs_crtc->group, name,
+				    &crtc_item_type);
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return &vkms_configfs_crtc->group;
+}
+
+static struct configfs_group_operations crtcs_group_operations = {
+	.make_group	= &crtcs_make_group,
+};
+
+static const struct config_item_type crtcs_item_type = {
+	.ct_group_ops    = &crtcs_group_operations,
+	.ct_owner        = THIS_MODULE,
+};
+
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_config_crtc *crtc;
+	struct vkms_configfs_device *vkms_configfs = encoder_possible_crtc_src_item_to_vkms_configfs_device(src);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	if (target->ci_type != &crtc_item_type) {
+		DRM_ERROR("Unable to link non-CRTCs.\n");
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+
+	crtc = crtc_item_to_vkms_configfs_crtc(target)->vkms_config_crtc;
+	struct vkms_config_encoder *encoder = encoder_possible_crtc_src_item_to_vkms_configfs_encoder(src)->vkms_config_encoder;
+
+	struct vkms_config_crtc *crtc_entry;
+	unsigned long idx = 0;
+
+	xa_for_each(&encoder->possible_crtcs, idx, crtc_entry) {
+		if (crtc_entry == crtc) {
+			pr_err("Tried to add two symlinks to the same CRTC from the same object.\n");
+			mutex_unlock(&vkms_configfs->lock);
+			return -EINVAL;
+		}
+	}
+
+	if (vkms_config_encoder_attach_crtc(encoder, crtc))
+		return -EINVAL;
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return 0;
+}
+
+static void encoder_possible_crtcs_drop_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_config_crtc *crtc;
+	struct vkms_configfs_device *vkms_configfs = encoder_possible_crtc_src_item_to_vkms_configfs_device(src);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	crtc = crtc_item_to_vkms_configfs_crtc(target)->vkms_config_crtc;
+	struct vkms_config_encoder *encoder = encoder_possible_crtc_src_item_to_vkms_configfs_encoder(src)->vkms_config_encoder;
+
+	struct vkms_config_encoder *encoder_entry;
+	struct vkms_config_crtc *crtc_entry;
+	unsigned long encoder_idx = -1;
+	unsigned long crtc_idx = -1;
+
+	xa_for_each(&encoder->possible_crtcs, crtc_idx, crtc_entry) {
+		if (crtc_entry == crtc)
+			break;
+	}
+	xa_erase(&encoder->possible_crtcs, crtc_idx);
+	xa_for_each(&crtc->possible_encoders, encoder_idx, encoder_entry) {
+		if (encoder_entry == encoder)
+			break;
+	}
+	xa_erase(&crtc->possible_encoders, encoder_idx);
+
+	mutex_unlock(&vkms_configfs->lock);
+}
+
+static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
+	.allow_link	= &encoder_possible_crtcs_allow_link,
+	.drop_link	= &encoder_possible_crtcs_drop_link,
+};
+
+static struct config_item_type encoder_possible_crtcs_item_type = {
+	.ct_item_ops	= &encoder_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static void encoder_release(struct config_item *item)
+{
+	struct vkms_configfs_encoder *vkms_configfs_encoder = encoder_item_to_vkms_configfs_encoder(item);
+
+	mutex_lock(&vkms_configfs_encoder->vkms_configfs_device->lock);
+	vkms_config_delete_encoder(vkms_configfs_encoder->vkms_config_encoder,
+				   vkms_configfs_encoder->vkms_configfs_device->vkms_config);
+	mutex_unlock(&vkms_configfs_encoder->vkms_configfs_device->lock);
+
+	kfree(vkms_configfs_encoder);
+}
+
+static struct configfs_item_operations encoder_item_operations = {
+	.release	= encoder_release,
+};
+
+static const struct config_item_type encoder_item_type = {
+	.ct_item_ops	= &encoder_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *encoder_make_group(struct config_group *config_group,
+					       const char *name)
+{
+	struct vkms_configfs_device *vkms_configfs = encoder_item_to_vkms_configfs_device(&config_group->cg_item);
+	struct vkms_configfs_encoder *vkms_configfs_encoder;
+
+	vkms_configfs_encoder = kzalloc(sizeof(*vkms_configfs_encoder), GFP_KERNEL);
+
+	if (!vkms_configfs_encoder)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	if (vkms_configfs->enabled) {
+		kfree(vkms_configfs_encoder);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-EINVAL);
+	}
+
+	vkms_configfs_encoder->vkms_config_encoder = vkms_config_create_encoder(vkms_configfs->vkms_config);
+
+	if (!vkms_configfs_encoder->vkms_config_encoder) {
+		kfree(vkms_configfs_encoder);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	vkms_configfs_encoder->vkms_config_encoder->name = kzalloc(strlen(name) + 1, GFP_KERNEL);
+	if (!vkms_configfs_encoder->vkms_config_encoder->name) {
+		kfree(vkms_configfs_encoder->vkms_config_encoder);
+		kfree(vkms_configfs_encoder);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	strscpy(vkms_configfs_encoder->vkms_config_encoder->name, name, strlen(name) + 1);
+	config_group_init_type_name(&vkms_configfs_encoder->group, name,
+				    &encoder_item_type);
+
+	config_group_init_type_name(&vkms_configfs_encoder->possible_crtc_group, "possible_crtcs",
+				    &encoder_possible_crtcs_item_type);
+	configfs_add_default_group(&vkms_configfs_encoder->possible_crtc_group,
+				   &vkms_configfs_encoder->group);
+	vkms_configfs_encoder->vkms_configfs_device = vkms_configfs;
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return &vkms_configfs_encoder->group;
+}
+
+static struct configfs_group_operations encoder_group_operations = {
+	.make_group	= &encoder_make_group,
+};
+
+static const struct config_item_type encoders_item_type = {
+	.ct_group_ops	= &encoder_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+/**
+ * configfs_lock_dependencies() - In order to forbid the userspace to delete items when the
+ * device is enabled, mark all configfs items as dependent
+ *
+ * @vkms_configfs_device: Device to lock
+ */
+static void configfs_lock_dependencies(struct vkms_configfs_device *vkms_configfs_device)
+{
+	/* Lock the group itself */
+	configfs_depend_item_unlocked(vkms_configfs_device->group.cg_subsys,
+				      &vkms_configfs_device->group.cg_item);
+	/* Lock the planes elements */
+	struct config_item *item;
+
+	list_for_each_entry(item, &vkms_configfs_device->plane_group.cg_children, ci_entry) {
+		configfs_depend_item_unlocked(vkms_configfs_device->plane_group.cg_subsys,
+					      item);
+	}
+	list_for_each_entry(item, &vkms_configfs_device->crtc_group.cg_children, ci_entry) {
+		configfs_depend_item_unlocked(vkms_configfs_device->crtc_group.cg_subsys,
+					      item);
+	}
+}
+
+/**
+ * configfs_unlock_dependencies() - Once the device is disable, its configuration can be modified.
+ *
+ * @vkms_configfs_device: Device to unlock
+ */
+static void configfs_unlock_dependencies(struct vkms_configfs_device *vkms_configfs_device)
+{
+	struct config_item *item;
+
+	configfs_undepend_item_unlocked(&vkms_configfs_device->group.cg_item);
+
+	list_for_each_entry(item, &vkms_configfs_device->plane_group.cg_children, ci_entry) {
+		configfs_undepend_item_unlocked(item);
+	}
+	list_for_each_entry(item, &vkms_configfs_device->crtc_group.cg_children, ci_entry) {
+		configfs_undepend_item_unlocked(item);
+	}
+}
+
 static ssize_t device_enable_show(struct config_item *item, char *page)
 {
 	return sprintf(page, "%d\n",
@@ -264,13 +622,25 @@ static ssize_t device_enable_store(struct config_item *item,
 		return -EINVAL;
 
 	mutex_lock(&vkms_configfs_device->lock);
+	if (vkms_configfs_device->enabled == value) {
+		mutex_unlock(&vkms_configfs_device->lock);
+		return (ssize_t)count;
+	}
+
+	if (value && !vkms_config_is_valid(vkms_configfs_device->vkms_config)) {
+		mutex_unlock(&vkms_configfs_device->lock);
+		return -EINVAL;
+	}
 
 	vkms_configfs_device->enabled = value;
 
-	if (value)
+	if (value) {
+		configfs_lock_dependencies(vkms_configfs_device);
 		vkms_create(vkms_configfs_device->vkms_config);
-	else
+	} else {
+		configfs_unlock_dependencies(vkms_configfs_device);
 		vkms_destroy(vkms_configfs_device->vkms_config);
+	}
 
 	mutex_unlock(&vkms_configfs_device->lock);
 
@@ -309,9 +679,6 @@ static const struct config_item_type device_item_type = {
 static struct config_group *root_make_group(struct config_group *group,
 					    const char *name)
 {
-	struct vkms_config_plane *plane;
-	struct vkms_config_crtc *crtc;
-	struct vkms_config_encoder *encoder;
 	struct vkms_configfs_device *configfs = kzalloc(sizeof(*configfs), GFP_KERNEL);
 
 	if (!configfs)
@@ -326,22 +693,18 @@ static struct config_group *root_make_group(struct config_group *group,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	configfs->vkms_config_crtc = vkms_config_create_crtc(configfs->vkms_config);
-	configfs->vkms_config_encoder = vkms_config_create_encoder(configfs->vkms_config);
-	if (!configfs->vkms_config_crtc || !configfs->vkms_config_encoder ||
-	    vkms_config_encoder_attach_crtc(configfs->vkms_config_encoder,
-					    configfs->vkms_config_crtc)) {
-		vkms_config_destroy(configfs->vkms_config);
-		kfree(configfs);
-		return ERR_PTR(-ENOMEM);
-	}
-
 	config_group_init_type_name(&configfs->group, name,
 				    &device_item_type);
 
 	config_group_init_type_name(&configfs->plane_group, "planes", &planes_item_type);
 	configfs_add_default_group(&configfs->plane_group, &configfs->group);
 
+	config_group_init_type_name(&configfs->crtc_group, "crtcs", &crtcs_item_type);
+	configfs_add_default_group(&configfs->crtc_group, &configfs->group);
+
+	config_group_init_type_name(&configfs->encoder_group, "encoders", &encoders_item_type);
+	configfs_add_default_group(&configfs->encoder_group, &configfs->group);
+
 	return &configfs->group;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
index 0f3701442691c23e33775fdd072701076d3d9387..c033810f86ce467f564a14f74165198f12ea044c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.h
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -20,34 +20,84 @@ struct vkms_configfs_device {
 	struct config_group group;
 
 	struct config_group plane_group;
+	struct config_group crtc_group;
+	struct config_group encoder_group;
 
 	struct mutex lock;
 	bool enabled;
 
 	struct vkms_config *vkms_config;
-	struct vkms_config_crtc *vkms_config_crtc;
-	struct vkms_config_encoder *vkms_config_encoder;
 };
 
 struct vkms_configfs_plane {
 	struct config_group group;
+	struct config_group possible_crtc_group;
 
 	struct vkms_configfs_device *vkms_configfs_device;
 	struct vkms_config_plane *vkms_config_plane;
 };
 
+struct vkms_configfs_crtc {
+	struct config_group group;
+
+	struct vkms_configfs_device *vkms_configfs_device;
+	struct vkms_config_crtc *vkms_config_crtc;
+};
+
+struct vkms_configfs_encoder {
+	/* must be first because it is a krefcounted stuff */
+	struct config_group group;
+
+	struct config_group possible_crtc_group;
+	struct vkms_configfs_device *vkms_configfs_device;
+	struct vkms_config_encoder *vkms_config_encoder;
+};
+
 #define config_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, group)
 
 #define planes_item_to_vkms_configfs_device(item) \
 	config_item_to_vkms_configfs_device((item)->ci_parent)
 
+#define encoders_item_to_vkms_configfs_device(item) \
+	config_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define crtc_item_to_vkms_configfs_crtc(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
+
+#define encoder_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, group)
+
 #define plane_item_to_vkms_configfs_device(item) \
 	planes_item_to_vkms_configfs_device((item)->ci_parent)
 
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define plane_possible_crtc_src_item_to_vkms_configfs_device(item) \
+	plane_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define plane_possible_crtc_src_item_to_vkms_configfs_plane(item) \
+	plane_item_to_vkms_configfs_plane((item)->ci_parent)
+
+#define crtc_item_to_vkms_configfs_device(item) \
+	config_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define crtc_child_item_to_vkms_configfs_device(item) \
+	crtc_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define encoder_item_to_vkms_configfs_device(item) \
+	config_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define encoder_child_item_to_vkms_configfs_device(item) \
+	encoder_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define encoder_possible_crtc_src_item_to_vkms_configfs_device(item) \
+	encoder_child_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define encoder_possible_crtc_src_item_to_vkms_configfs_encoder(item) \
+	encoder_item_to_vkms_configfs_encoder((item)->ci_parent)
+
 /* ConfigFS Support */
 int vkms_init_configfs(void);
 void vkms_unregister_configfs(void);

-- 
2.47.1

