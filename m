Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63CA18005
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A512C10E5DF;
	Tue, 21 Jan 2025 14:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UvoOkkFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB85F10E0E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:38:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB2A0C001A;
 Tue, 21 Jan 2025 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWf6dle4oNDqjM0MlplyHH6oLVNF+p+wzk0WWbB5dHo=;
 b=UvoOkkFlOSZ2j1LU1nfljVlCjXTNvM2Q/MgUi1baYLv1vlLGRgwWCQqqje4A9OE2CBvmqG
 UXC/t+xqUSDUtF/tbl71Yy0int0IKDnr/QJ7zehxqp7oh12MpsyWhSV+8kE1K+ARO5qJG1
 f7emKAmjyAgngUfZ0UUrCXsR+s9AtV0G+LoLn4CjsB3gOZw3/ohtC0tQrBT+YD0ODlC3U/
 dpdYv1sKOgMjy8a5sMk5gIeIrr0T5Iaus2a8C3gwXbxQ89JRQ0mOcZZwJ6AP7GPuPkBdSM
 tXljQ4wuHBF7H+9M7eLJDXgr+jjQHaLGval4SOLHP79GY/1N/2meGr7B6uA5Hg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 15:34:51 +0100
Subject: [PATCH RFC v3 07/14] drm/vkms: Introduce configfs for connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-google-config-fs-v3-7-8154a6945142@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11194;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=AXPdAOX6w84f5uQ0orGhE4wWMnbPuB5cHfFnGIy1IJo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7FBjHdvHbEdQ+rp7D6VShmvPE1X1eTuiRt1q
 K2UEX18gIGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xQQAKCRAgrS7GWxAs
 4h9REACmj/tpeF0jj9DpSlOe0YnOhoa2Scx0hRiLRc3vFtjAaErshqASM3c3gJ+avS3zB5e+bZj
 yiWC6758ntHyNEO+WGZwUsKW/y6LSGU9qU8S2AKK0YTm/D5WYHhfTGEp2HiZFnOuBn26DaFDWB4
 VFtdcwuyKoKLpfcIIXEys8C3pdUj7iM6YahrWb3hJ/oyh70jXyp6wALH8VeHZXP5OPykXoENT89
 /Sy2yuaf9UInr+goNtgsq7Z0Oe/JmvyELiCcVV/0kzsCmt04OrFzkkNTXhdKQ7vr1X7iuel+zn3
 zgyj4QH/SmSx3Jq/IhshBmaNi3ln05C3Y2QRou1uRjqCfFw3XQUW1cRZrfH/cTO6l+s8ut940RZ
 YrEqcxI36QNG+UDfZbA9VIiDtQlKAxPFxcxCbtDenxsyePxfGipvE7NkbZjMO0YfhEM4TK0xnyI
 tYFrOMYENDrkYpTGdw469Q3JJUaxqfMEmqW0XorL++zzKBz+MOIIvg5D2IVfiCVm3fAqelk9h6b
 S4KK1cUDLZNHl2KPNSL4plq4aiU/Ph9jq2kDTFgYDkhb+NcHuhC7eU6ykv2Upvwbl2cYwsWfzRP
 +91paql/AH9IWpLBHxU6oPPHDhF/+4Eor4JvIeX2xK4h+yVVzoV7ho5tFClByFFVxeLUhmcOb5d
 jyKo5dh9JlmViBQ==
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
new interface to create and configure connectors.

The connectors are created by creating a directory in the `connectors`
directory.

Connectors and encoders can be linked by creating a symlink in the
possible_encoders directory.

The current interface is:
/config/vkms
        DEVICE_1
        ┣━ enable
        ┣━ planes
        ┃  ┗━ [...]
        ┣━ connectors
        ┃  ┗━ CONNECTOR_1
        ┃     ┗━ possible_encoders
        ┃        ┗━ >> DEVICE_1/encoders/ENCODER_1
        ┗━ encoders
           ┗━ ENCODER_1

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c   |  13 ++++
 drivers/gpu/drm/vkms/vkms_config.h   |   3 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 138 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |  23 ++++++
 4 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 8ac9cd52cc00f7c317f2514a73c3d2f3908b085b..cb97bf292b72e9faf0050338fe845a254f691987 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -479,6 +479,19 @@ vkms_config_connector_attach_encoder(struct vkms_config_connector *vkms_config_c
 	return ret;
 }
 
+void vkms_config_connector_detach_encoder(struct vkms_config_connector *vkms_config_connector,
+					  struct vkms_config_encoder *vkms_config_encoder)
+{
+	struct vkms_config_encoder *encoder_entry;
+	unsigned long encoder_idx;
+
+	xa_for_each(&vkms_config_connector->possible_encoders, encoder_idx, encoder_entry) {
+		if (encoder_entry == vkms_config_encoder)
+			break;
+	}
+	xa_erase(&vkms_config_connector->possible_encoders, encoder_idx);
+}
+
 bool vkms_config_is_valid(struct vkms_config *config)
 {
 	struct vkms_config_plane *config_plane;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 2e5d2aa34a4f039c738cb9ac5642f3c75df36ba7..57cdf5fc2df1a62f57b4588c36ad0a99f63bee2a 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -189,6 +189,9 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkm
 int __must_check
 vkms_config_connector_attach_encoder(struct vkms_config_connector *vkms_config_connector,
 				     struct vkms_config_encoder *vkms_config_encoder);
+void vkms_config_connector_detach_encoder(struct vkms_config_connector *vkms_config_connector,
+					  struct vkms_config_encoder *vkms_config_encoder);
+
 /**
  * vkms_config_delete_plane() - Remove a plane configuration and frees its memory
  *
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 9f41506849552960970aa08b9329b4f88d0aa8e7..8bb3223c810dddb7d713ad4b01cece825f9939f6 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -536,6 +536,7 @@ static struct config_group *encoder_make_group(struct config_group *config_group
 	}
 
 	strscpy(vkms_configfs_encoder->vkms_config_encoder->name, name, strlen(name) + 1);
+
 	config_group_init_type_name(&vkms_configfs_encoder->group, name,
 				    &encoder_item_type);
 
@@ -559,6 +560,139 @@ static const struct config_item_type encoders_item_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int connector_possible_encoders_allow_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_config_encoder *vkms_config_encoder;
+	struct vkms_configfs_device *vkms_configfs =
+		connector_possible_encoder_src_item_to_vkms_configfs_device
+		(src);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	if (target->ci_type != &encoder_item_type) {
+		DRM_ERROR("Unable to link non-CRTCs.\n");
+		mutex_unlock(&vkms_configfs->lock);
+		return -EINVAL;
+	}
+
+	vkms_config_encoder = encoder_item_to_vkms_configfs_encoder(target)
+				      ->vkms_config_encoder;
+	struct vkms_config_connector *vkms_config_connector =
+		connector_possible_encoder_src_item_to_vkms_configfs_connector
+		(src)
+			->vkms_config_connector;
+
+	if (vkms_config_connector_attach_encoder(vkms_config_connector,
+						 vkms_config_encoder))
+		return -EINVAL;
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return 0;
+}
+
+static void connector_possible_encoders_drop_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_config_encoder *vkms_config_encoder;
+	struct vkms_configfs_device *vkms_configfs =
+		connector_possible_encoder_src_item_to_vkms_configfs_device(src);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	vkms_config_encoder = encoder_item_to_vkms_configfs_encoder(target)->vkms_config_encoder;
+	struct vkms_config_connector *vkms_config_connector =
+		connector_possible_encoder_src_item_to_vkms_configfs_connector(src)
+			->vkms_config_connector;
+
+	vkms_config_connector_detach_encoder(vkms_config_connector, vkms_config_encoder);
+
+	mutex_unlock(&vkms_configfs->lock);
+}
+
+static struct configfs_item_operations connector_possible_encoders_item_operations = {
+	.allow_link = &connector_possible_encoders_allow_link,
+	.drop_link = &connector_possible_encoders_drop_link,
+};
+
+static struct config_item_type connector_possible_encoders_item_type = {
+	.ct_item_ops = &connector_possible_encoders_item_operations,
+	.ct_owner = THIS_MODULE,
+};
+
+static void connector_release(struct config_item *item)
+{
+	struct vkms_configfs_connector *vkms_configfs_connector =
+		connector_item_to_vkms_configfs_connector(item);
+
+	mutex_lock(&vkms_configfs_connector->vkms_configfs_device->lock);
+	vkms_config_delete_connector(vkms_configfs_connector->vkms_config_connector);
+	mutex_unlock(&vkms_configfs_connector->vkms_configfs_device->lock);
+
+	kfree(vkms_configfs_connector);
+}
+
+static struct configfs_item_operations connector_item_operations = {
+	.release = connector_release,
+};
+
+static const struct config_item_type connector_item_type = {
+	.ct_item_ops = &connector_item_operations,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_group *connector_make_group(struct config_group *config_group,
+						 const char *name)
+{
+	struct vkms_configfs_device *vkms_configfs =
+		connector_item_to_vkms_configfs_device(&config_group->cg_item);
+	struct vkms_configfs_connector *vkms_configfs_connector;
+
+	vkms_configfs_connector = kzalloc(sizeof(*vkms_configfs_connector), GFP_KERNEL);
+
+	if (!vkms_configfs_connector)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_lock(&vkms_configfs->lock);
+
+	if (vkms_configfs->enabled) {
+		kfree(vkms_configfs_connector);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-EINVAL);
+	}
+
+	vkms_configfs_connector->vkms_config_connector =
+		vkms_config_create_connector(vkms_configfs->vkms_config);
+
+	if (!vkms_configfs_connector->vkms_config_connector) {
+		kfree(vkms_configfs_connector);
+		mutex_unlock(&vkms_configfs->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&vkms_configfs_connector->group, name, &connector_item_type);
+
+	config_group_init_type_name(&vkms_configfs_connector->possible_encoder_group,
+				    "possible_encoders", &connector_possible_encoders_item_type);
+	configfs_add_default_group(&vkms_configfs_connector->possible_encoder_group,
+				   &vkms_configfs_connector->group);
+	vkms_configfs_connector->vkms_configfs_device = vkms_configfs;
+
+	mutex_unlock(&vkms_configfs->lock);
+
+	return &vkms_configfs_connector->group;
+}
+
+static struct configfs_group_operations connector_group_operations = {
+	.make_group = &connector_make_group,
+};
+
+static const struct config_item_type connectors_item_type = {
+	.ct_group_ops = &connector_group_operations,
+	.ct_owner = THIS_MODULE,
+};
+
 /**
  * configfs_lock_dependencies() - In order to forbid the userspace to delete items when the
  * device is enabled, mark all configfs items as dependent
@@ -705,6 +839,10 @@ static struct config_group *root_make_group(struct config_group *group,
 	config_group_init_type_name(&configfs->encoder_group, "encoders", &encoders_item_type);
 	configfs_add_default_group(&configfs->encoder_group, &configfs->group);
 
+	config_group_init_type_name(&configfs->connector_group, "connectors",
+				    &connectors_item_type);
+	configfs_add_default_group(&configfs->connector_group, &configfs->group);
+
 	return &configfs->group;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
index c033810f86ce467f564a14f74165198f12ea044c..5e13941df3382ed30770e79a0432bf37764d7c59 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.h
+++ b/drivers/gpu/drm/vkms/vkms_configfs.h
@@ -22,6 +22,7 @@ struct vkms_configfs_device {
 	struct config_group plane_group;
 	struct config_group crtc_group;
 	struct config_group encoder_group;
+	struct config_group connector_group;
 
 	struct mutex lock;
 	bool enabled;
@@ -53,6 +54,14 @@ struct vkms_configfs_encoder {
 	struct vkms_config_encoder *vkms_config_encoder;
 };
 
+struct vkms_configfs_connector {
+	struct config_group group;
+
+	struct config_group possible_encoder_group;
+	struct vkms_configfs_device *vkms_configfs_device;
+	struct vkms_config_connector *vkms_config_connector;
+};
+
 #define config_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, group)
 
@@ -68,6 +77,9 @@ struct vkms_configfs_encoder {
 #define encoder_item_to_vkms_configfs_encoder(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, group)
 
+#define connector_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, group)
+
 #define plane_item_to_vkms_configfs_device(item) \
 	planes_item_to_vkms_configfs_device((item)->ci_parent)
 
@@ -89,14 +101,25 @@ struct vkms_configfs_encoder {
 #define encoder_item_to_vkms_configfs_device(item) \
 	config_item_to_vkms_configfs_device((item)->ci_parent)
 
+#define connector_item_to_vkms_configfs_device(item) \
+	config_item_to_vkms_configfs_device((item)->ci_parent)
+
 #define encoder_child_item_to_vkms_configfs_device(item) \
 	encoder_item_to_vkms_configfs_device((item)->ci_parent)
 
 #define encoder_possible_crtc_src_item_to_vkms_configfs_device(item) \
 	encoder_child_item_to_vkms_configfs_device((item)->ci_parent)
 
+#define connector_child_item_to_vkms_configfs_device(item) \
+	connector_item_to_vkms_configfs_device((item)->ci_parent)
+
+#define connector_possible_encoder_src_item_to_vkms_configfs_device(item) \
+	connector_child_item_to_vkms_configfs_device((item)->ci_parent)
+
 #define encoder_possible_crtc_src_item_to_vkms_configfs_encoder(item) \
 	encoder_item_to_vkms_configfs_encoder((item)->ci_parent)
+#define connector_possible_encoder_src_item_to_vkms_configfs_connector(item) \
+	connector_item_to_vkms_configfs_connector((item)->ci_parent)
 
 /* ConfigFS Support */
 int vkms_init_configfs(void);

-- 
2.47.1

