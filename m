Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DB9D6353
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2511F10EC3C;
	Fri, 22 Nov 2024 17:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DTD5y8Gb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214E810EC44
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:39:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E84B0C000C;
 Fri, 22 Nov 2024 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2tUcZCiDuzBFgWGZXjM+4g83n0WmsqwJbmcETj8nFo=;
 b=DTD5y8GbwL9K6kQuwfRPHQVKVRAPP5haF1SIG/FRzH4Y9Mw8GmHTEtjvMKQcPitP2Ht60r
 zj0vMV9SY06LfQ7GraLUGYpZn4zlWoiCiHX0tcmZZ1rZmK72RQqBlduwr6IoJjkjoZaI7Z
 G0vMf048xT9IwUCacuPt/G0PThJuE/nXGPuMu+Bi+cIb0SbNV0MckFggMwJ4N9/VeGuDH5
 D4ktWm8v7CeoaCOwHsWpacbWOmPo5kQsRsmnFhB7oPTuWXHoi9cBXmsAe4G4tWrL/sPRAN
 JX7/n290M4NEviiRVgubKziajleASs3OuT9SJyRPK8Sk7BZndSDnvfCHyylUzg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 18:38:35 +0100
Subject: [PATCH RFC v2 09/16] drm/vkms: Introduce configfs for connectors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-google-config-fs-v2-9-4b7e6f183320@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10534;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xZC3t90mdHVS6dkEWImmPKHG3JzR8IbQbcP4Irr/elA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGrSK3zM6IRyqZm6zWh4Mw0Q3GHUg+jcJFCA
 AqndrmJVRGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqwAKCRAgrS7GWxAs
 4gWbD/9kN9HN2dqv6GfOV8Ft8gef3hY710UuM5iSarXg5RxViYZ20NtnYHvowB1gBM4f+az9DhH
 mqiuisjn2UuB0SFXFYk3Bpjk+4SZ8n37cK86S8ybrN9TbvLO0P2ie2YDZT/pw0xAZU3DWOaijRJ
 Ftco9iTrWJWsVL85Ajah8C4MQaF6t9VuF3MnKR4KAU35P58sh/HOMD2NMDfVrTdNQXjjiRfFJVS
 wPqRcoST7H6GXgbmhB3nOwU4u5RqsmuGUvL9zONh+VBSSrL9s6/KFQaFp7TLbqoDcv9Jw57p1Yk
 eAJmwujzJG1GBmpZxUypoPhn/AAz6qHfUkMukSPPIQo2Uz2R6j4Nueuxhe9EwTZwzxeN7KKMJg4
 kSu29c1f2Mn2Vt1GiT9RJv4Sjvoo0U9jO5+rwrMAP71vvjD0HhFL8PF578unpOwAbIooqijOeUM
 Tbs6ICkeD7YQccg1hbEO/w9+IDL7gXjtNAykCwCoVRFqF8kQh1gprhpoeveJqQoNoehF4IEbE0i
 eX5Q3xOsEZCA18Xzem+1ketSD+koaog7tP7c6KRun9yd0zvDSEt9Hfsm86SYRvN7QnRlJAoYqnS
 e+lMO0NmFuzk/gmdR26dXvMfZBDhcqgTOMUSE5L7hDcQJ0B/Rui7xHG0oSM5Hq2LFu1AZK5S4Of
 OgbZ7Db1OOUqozQ==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c   |  13 ++++
 drivers/gpu/drm/vkms/vkms_config.h   |   3 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 138 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |  23 ++++++
 4 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 9a461a0481c2a20d6d48f1aa9649843ad1b7d13d..da99785ec89f0c6a7fe1a71fd2e6f5944c844aa9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -516,6 +516,19 @@ vkms_config_connector_attach_encoder(struct vkms_config_connector *vkms_config_c
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
index 529d9c99f3c406d49dc7f3689a84c3dd775399a9..b1d80185216798cc9fc06e7d1cd0c423b7275185 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -197,6 +197,9 @@ int __must_check vkms_config_encoder_attach_crtc(struct vkms_config_encoder *vkm
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
index a410c9be4f2bbf7b2651245747eb357fcf32d1f2..94c288514172b88d06c2b74e36569c6d55383782 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -746,6 +746,7 @@ static struct config_group *encoder_make_group(struct config_group *config_group
 	}
 
 	strscpy(vkms_configfs_encoder->vkms_config_encoder->name, name, strlen(name) + 1);
+
 	config_group_init_type_name(&vkms_configfs_encoder->group, name,
 				    &encoder_item_type);
 
@@ -769,6 +770,139 @@ static const struct config_item_type encoders_item_type = {
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
@@ -915,6 +1049,10 @@ static struct config_group *root_make_group(struct config_group *group,
 	config_group_init_type_name(&configfs->encoder_group, "encoders", &encoders_item_type);
 	configfs_add_default_group(&configfs->encoder_group, &configfs->group);
 
+	config_group_init_type_name(&configfs->connector_group, "connectors",
+				    &connectors_item_type);
+	configfs_add_default_group(&configfs->connector_group, &configfs->group);
+
 	return &configfs->group;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.h b/drivers/gpu/drm/vkms/vkms_configfs.h
index df743e0107f40cd10433bdb638108d266f9c83a6..12c0fdefb813387515d144519479c242b7ef6728 100644
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
2.47.0

