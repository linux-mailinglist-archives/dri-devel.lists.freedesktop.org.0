Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B914C1B48B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C4B910E7DA;
	Wed, 29 Oct 2025 14:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xDFoakFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB71891AA
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 72CDF1A174B;
 Wed, 29 Oct 2025 14:37:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 49861606E8;
 Wed, 29 Oct 2025 14:37:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25A8B117F81B9; Wed, 29 Oct 2025 15:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SpkB+O9TsCu/AbXZ5AMtN1pcUFMsRO/D92Oon6XNGNc=;
 b=xDFoakFgMjXupBjBvM+Gj5BckQhNYGUgz1innM7hTnbwJWUUnazPq0pPkIsagfLx+EUnxB
 EtgFrnebLMMuEDmkcGRBTTG1zI8EKUXG04w8BA2jE/smNK+G9xWDmQAkGRSboKhex3zx4v
 9tDcAW7WacckHu1y3Rl2VAzMgYHHhLIm97Y62Goh7p07wU6snaNpYjuMOYeH9rA3MzerCO
 ysZ+Lv4P8xjrZakBqEhaK2IT0jJViNdqdwnfA5L74eb6A7q1saaVZtiRKd1HTn8upN9IiD
 BU8yBSoop4xirtZCmVW2+ar7cWD05fV+hl2Ady9MrpiqzGRbHKxlXmenCeg7pQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:37:09 +0100
Subject: [PATCH RESEND v2 32/32] drm/vkms: Introduce configfs for dynamic
 connector creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251029-vkms-all-config-v2-32-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10022;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=0c54fSmOm2l+K0LbPt9pg/s8Cgsdy0XFWVvsXyQZpVs=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ+L80/ASVtOKvQ0n7uTXAP0uWajlNrFXD97
 MBpD/48eHyJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfgAKCRAgrS7GWxAs
 4rjNEAC3Tewhm9I9O6xyTAKBKs+x5urd4lBFI762XjQglX8KPHFqn42L8wV5TB3NW10ROXcHFmB
 dDoS1M5l/k9bcLSEziGyPHs1stZpPD8m3oBvsPYmsTtZO4emLQQ7Wdc1BIUKZSv8qOt1B8DwoNV
 3IxpnlIhVuLNQ0/iumRCPSTIbtxbcPvj+hwHW+bjSuL+W0/lW3oaCEWOmrE5XA7hlM+Aizf5UsP
 rJuDomy032u3rNgfNb2P3WjzUS7nWLmjjnNZ0B9FLRqzT7JAPRJnYnyGyH46PwErK9VBU1M66Et
 itz3cGepXEPji0EZk/od9VVOl6hSqRQqxWFnP7nHcuCmMw/yEhEsL/SGQHPDes1YciMxxfSFYJ5
 73cKdhXDKCi3KgpRA3nqVnq1nw/q6GaGbLZIKP9SdL+RhRCb7BG0tRrE66exsMLRchBG0PKqr/g
 9NX7ko+oAGzuPheJ75Dic/HhV1UjcAlKOCUAcxcqcfRelRvMLI82WLVsU3RDmaIJ8T+yrpPlcNh
 4ke7unvlg5PXXuH2/VC4j5hEsL9z4LIaQb+NZueHw0oOQDHtUDCCD6aAUcqdhZh4UMGZ5efGiNH
 490QxoMVjnaPYYW3JAlJWAju63dX/4arQ1RUWy/T4Oc2nduvCO0sfl8NW6sVn/oS105OlRoOUxQ
 lzoB5k76fWrHi9w==
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

DRM allows the connector to be created after the device. To allows
emulating this, add two configfs attributes to connector to allows this.

Using the dynamic attribute you can set if a connector will be dynamic or
not.
Using the enabled attribute, you can set at runtime if a dynamic connector
is present or not.

Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |   6 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 153 ++++++++++++++++++++++++++++++++---
 2 files changed, 146 insertions(+), 13 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 0cc7897d7b83..afed12132ae7 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -138,7 +138,7 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 5 configurable attribute:
+Connectors have 7 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
@@ -150,7 +150,9 @@ Connectors have 5 configurable attribute:
 - edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
   EDID but just a list of modes, this attribute allows to disable EDID property.
 - edid: Content of the EDID. Ignored if edid_enabled is not set
-
+- dynamic: Set to 1 while configuring the device to create a dynamic connector. A dynamic
+  connector can be used to emulate DP MST connectors.
+- enabled: For dynamic connector, set it to 1 to create the connector, 0 to remove it.
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 1843e5d9e1e1..b4315c6cb25c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1135,6 +1135,12 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
 	return sprintf(page, "%u", status);
 }
 
+static bool connector_is_enabled(struct vkms_config_connector *connector_cfg)
+{
+	return !connector_cfg->dynamic ||
+	       (connector_cfg->dynamic && connector_cfg->enabled);
+}
+
 static ssize_t connector_status_store(struct config_item *item,
 				      const char *page, size_t count)
 {
@@ -1154,8 +1160,10 @@ static ssize_t connector_status_store(struct config_item *item,
 	scoped_guard(mutex, &connector->dev->lock) {
 		vkms_config_connector_set_status(connector->config, status);
 
-		if (connector->dev->enabled)
-			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+		if (connector->dev->enabled) {
+			if (connector_is_enabled(connector->config))
+				vkms_trigger_connector_hotplug(connector->dev->config->dev);
+		}
 	}
 
 	return (ssize_t)count;
@@ -1215,8 +1223,10 @@ static ssize_t connector_type_store(struct config_item *item,
 	}
 
 	scoped_guard(mutex, &connector->dev->lock) {
-		if (connector->dev->enabled)
-			return -EINVAL;
+		if (connector->dev->enabled) {
+			if (connector_is_enabled(connector->config))
+				return -EBUSY;
+		}
 		vkms_config_connector_set_type(connector->config, val);
 	}
 
@@ -1332,6 +1342,107 @@ static ssize_t connector_edid_store(struct config_item *item,
 		    connector_status_disconnected)
 			vkms_trigger_connector_hotplug(connector->dev->config->dev);
 	}
+	return count;
+}
+
+static ssize_t connector_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	bool enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+		enabled = vkms_config_connector_is_enabled(connector->config);
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t connector_enabled_store(struct config_item *item,
+				       const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_config_connector *connector_cfg;
+	bool enabled, was_enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	connector_cfg = connector->config;
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (!connector->dev->enabled) {
+			vkms_config_connector_set_enabled(connector_cfg, enabled);
+		} else {
+			// Only dynamic connector can be enabled/disabled at runtime
+			if (!connector_cfg->dynamic)
+				return -EBUSY;
+
+			was_enabled = vkms_config_connector_is_enabled(connector_cfg);
+			vkms_config_connector_set_enabled(connector_cfg, enabled);
+
+			// Resulting configuration is invalid (missing encoder for example)
+			// Early return to avoid drm core issue
+			if (!vkms_config_is_valid(connector->dev->config)) {
+				count = -EINVAL;
+				goto rollback;
+			}
+
+			if (!was_enabled && enabled) {
+				// Adding the connector
+				connector_cfg->connector = vkms_connector_hot_add(connector->dev->config->dev,
+										  connector_cfg);
+				if (IS_ERR(connector_cfg->connector)) {
+					count = PTR_ERR(connector_cfg->connector);
+					goto rollback;
+				}
+			} else if (was_enabled && !enabled) {
+				vkms_connector_hot_remove(connector->dev->config->dev,
+							  connector_cfg->connector);
+			}
+		}
+	}
+	return count;
+
+rollback:
+	vkms_config_connector_set_enabled(connector_cfg, was_enabled);
+	return count;
+}
+
+static ssize_t connector_dynamic_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	bool enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		enabled = vkms_config_connector_is_dynamic(connector->config);
+	}
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t connector_dynamic_store(struct config_item *item,
+				       const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_config_connector *connector_cfg;
+	bool dynamic;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	connector_cfg = connector->config;
+
+	if (kstrtobool(page, &dynamic))
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		// Can't change the dynamic status when the device is activated
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		vkms_config_connector_set_dynamic(connector_cfg, dynamic);
+	}
 
 	return count;
 }
@@ -1341,6 +1452,8 @@ CONFIGFS_ATTR(connector_, type);
 CONFIGFS_ATTR(connector_, supported_colorspaces);
 CONFIGFS_ATTR(connector_, edid_enabled);
 CONFIGFS_ATTR(connector_, edid);
+CONFIGFS_ATTR(connector_, dynamic);
+CONFIGFS_ATTR(connector_, enabled);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
@@ -1348,19 +1461,28 @@ static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_supported_colorspaces,
 	&connector_attr_edid_enabled,
 	&connector_attr_edid,
+	&connector_attr_dynamic,
+	&connector_attr_enabled,
 	NULL,
 };
 
 static void connector_release(struct config_item *item)
 {
 	struct vkms_configfs_connector *connector;
+	struct vkms_config_connector *connector_cfg;
 	struct mutex *lock;
 
 	connector = connector_item_to_vkms_configfs_connector(item);
+	connector_cfg = connector->config;
 	lock = &connector->dev->lock;
 
 	scoped_guard(mutex, lock) {
+		if (connector->dev->enabled && connector_cfg->dynamic && connector_cfg->enabled)
+			vkms_connector_hot_remove(connector->dev->config->dev,
+						  connector_cfg->connector);
+
 		vkms_config_destroy_connector(connector->config);
+
 		kfree(connector);
 	}
 }
@@ -1379,6 +1501,7 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
 						  struct config_item *target)
 {
 	struct vkms_configfs_connector *connector;
+	struct vkms_config_connector *connector_cfg;
 	struct vkms_configfs_encoder *encoder;
 	int ret;
 
@@ -1386,16 +1509,25 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
 		return -EINVAL;
 
 	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	connector_cfg = connector->config;
 	encoder = encoder_item_to_vkms_configfs_encoder(target);
 
 	scoped_guard(mutex, &connector->dev->lock) {
-		if (connector->dev->enabled)
-			return -EBUSY;
+		if (connector->dev->enabled && connector_cfg->enabled) {
+			if (!connector_cfg->dynamic)
+				return -EBUSY;
+			ret = vkms_connector_hot_attach_encoder(connector->dev->config->dev,
+								connector->config->connector,
+								encoder->config->encoder);
+			if (ret)
+				return ret;
+		}
 
 		ret = vkms_config_connector_attach_encoder(connector->config,
 							   encoder->config);
+		if (ret)
+			return ret;
 	}
-
 	return ret;
 }
 
@@ -1433,9 +1565,6 @@ static struct config_group *make_connector_group(struct config_group *group,
 	dev = child_group_to_vkms_configfs_device(group);
 
 	scoped_guard(mutex, &dev->lock) {
-		if (dev->enabled)
-			return ERR_PTR(-EBUSY);
-
 		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
 		if (!connector)
 			return ERR_PTR(-ENOMEM);
@@ -1448,9 +1577,11 @@ static struct config_group *make_connector_group(struct config_group *group,
 			return ERR_CAST(connector->config);
 		}
 
+		vkms_config_connector_set_dynamic(connector->config, connector->dev->enabled);
+		vkms_config_connector_set_enabled(connector->config, !connector->dev->enabled);
+
 		config_group_init_type_name(&connector->group, name,
 					    &connector_item_type);
-
 		config_group_init_type_name(&connector->possible_encoders_group,
 					    "possible_encoders",
 					    &connector_possible_encoders_group_type);

-- 
2.51.0

