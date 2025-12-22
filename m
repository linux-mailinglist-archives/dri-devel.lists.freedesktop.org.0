Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E922CD5822
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FBF10E618;
	Mon, 22 Dec 2025 10:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CR1sNsc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CCE10E617
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E0CE81A2373;
 Mon, 22 Dec 2025 10:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B6CEC606C1;
 Mon, 22 Dec 2025 10:12:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1C7110AB01A1; Mon, 22 Dec 2025 11:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=leEQUM/D0frCB8WsJTkJzyoJM1iUZ4sosJdWRFn8k1k=;
 b=CR1sNsc5mMDY9dCd7wq38cTs4u/4aOSD/55b2u0UzUWKOJgyURLICLoeROQP3daKVDnTrU
 5v9311XQnFx1KE0SWIPJzUjxRJa48mFSVLOTglWHwt+oRQ8bBwy+jWRRmrcbt09Gnk3WOQ
 6gFGxKArNZcvMdWg+IjlHXAHdbtpvh1/XQh0yhdhBmEOPLcqC0NdAk3TaOXAVigs94EVPa
 fmaNWlyjKPBZrBM+QlIWKF71EGONSgGk2ufAFsj8c5Cpb5oIFvrzckUbnax6LgYuJFix2Z
 2vpCdPdmg6xCX3Df+obnhYJ1cXXPFKZfEFiHhf0oZMUtrQYeX5oxHjGcpNrz6w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:30 +0100
Subject: [PATCH v3 28/33] drm/vkms: Introduce configfs for connector EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-28-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6440;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cl8tG4qtFzsCp8zzIFZIkraQNRqrm8LmoP3yMF+oXaE=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDdxpCFERYmAaf45qESPVSBWxU5pI4HM+J7
 noGn52eLz+JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJXTA//YBk7ddaHabqwQrBzB3gRtpI5qlbv29j
 b2QO8/CQe6Bvm7ZRvbj0nxDTMKmPiooUrqXoc1IMOqBNRP01pyPnmh4jRQR5R8HcD8AZ/rNf7tX
 nrS2H4TdJNwRlxCUnuLQHMfuJo8EOi4zY7/3RD7+6XaGG2OJqSVg+g+3Wa//nNiz97b8xXDIPO1
 xalTjDN9sTAIwhgTFNpmzvR+zyXV3cGXWOuW6lmbFgbXdYu3HgUPHhCFFUXWzCE/XLmY/HRhYOr
 VtsNVYdlCnVumiNutJgqqtZSPmMmukXK95Pj8Lb3LGSDTk4HW2YZUon1dqaaCM2pMlDCKWmiTu1
 T7rQgsLzYFoJue+HiR/HIyMFHcSrs98jQmFolg4GNv0g+bPxCCl0ETr0G6FwydjUNZkwNBUvW+5
 ya2UTIpoJVmEay36dgYmtqN4Q2g/4//6dIJriE8Sf5ATNvmxOMaqWKZhdyL//TkyO41CNJt7zCH
 QCQ4A8gThXJVlEAb1AdcZyxX/oVsP9bV6+Ls5SftZhckWMXHEjN9X9qh4mBWxcY/+QQVAtAIDz8
 Ly5wIaZP1CdLvod7FSAEwuWiSVkEWPQYSynmaAWTV80rGnlZzH/tSd3t7x2dxILjbFvlC5Ov0BK
 2f7uLkTcin26ChnSimDnOkKI1+fotO+1iQhsFQT791e2tbV7yNlQ=
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

Introduce new attributes to configure EDID of a connector:
- edid_enable - chose if the connector will have an EDID or not
- edid - raw edid content

Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
x86), it should be sufficient for many tests. One possible evolution is
using a ConfigFS blob to allow bigger EDID.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 14 ++++++
 Documentation/gpu/vkms.rst              |  5 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 80 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c   |  3 ++
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index f750e616be54..4061ada5d88b 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -48,6 +48,20 @@ Description:
         Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
         etc. See enum drm_colorspace for full list.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid_enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Enable or disable EDID for this connector. Value:
+        1 - enabled, 0 - disabled.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Content of the EDID for this connector. Ignored if
+        edid_enabled is not set.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1c4a8023374c..60367fd1bd65 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -138,7 +138,7 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 3 configurable attribute:
+Connectors have 5 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
@@ -147,6 +147,9 @@ Connectors have 3 configurable attribute:
   If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
   Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
   for full list.
+- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
+  EDID but just a list of modes, this attribute allows to disable EDID property.
+- edid: Content of the EDID. Ignored if edid_enabled is not set
 
 
 To finish the configuration, link the different pipeline items::
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 90bf6e6995ae..20f5150e8b24 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1271,14 +1271,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	bool enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+		enabled = vkms_config_connector_get_edid_enabled(connector->config);
+
+	return sprintf(page, "%d\n", enabled);
+}
+
+static ssize_t connector_edid_enabled_store(struct config_item *item,
+					    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_config_connector *connector_cfg;
+	bool enabled;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	connector_cfg = connector->config;
+
+	if (kstrtobool(page, &enabled))
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->lock)
+	{
+		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
+
+		if (connector->dev->enabled &&
+		    vkms_config_connector_get_status(connector_cfg) !=
+		    connector_status_disconnected)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
+	return count;
+}
+
+static ssize_t connector_edid_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+	{
+		unsigned int len = 0;
+		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
+
+		memcpy(page, edid, min(len, PAGE_SIZE));
+		return min(len, PAGE_SIZE);
+	}
+
+	return -EINVAL;
+}
+
+static ssize_t connector_edid_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+	{
+		vkms_config_connector_set_edid(connector->config, page, count);
+
+		if (connector->dev->enabled &&
+		    vkms_config_connector_get_status(connector->config) !=
+		    connector_status_disconnected)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
 CONFIGFS_ATTR(connector_, type);
 CONFIGFS_ATTR(connector_, supported_colorspaces);
+CONFIGFS_ATTR(connector_, edid_enabled);
+CONFIGFS_ATTR(connector_, edid);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
 	&connector_attr_type,
 	&connector_attr_supported_colorspaces,
+	&connector_attr_edid_enabled,
+	&connector_attr_edid,
 	NULL,
 };
 
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index c85d19013720..311858727175 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -143,6 +143,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 
 	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
 
+	if (vkms_config_connector_get_edid_enabled(connector_cfg))
+		drm_connector_attach_edid_property(&connector->base);
+
 	return connector;
 }
 

-- 
2.51.2

