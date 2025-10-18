Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D1BEC47A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3010ECF0;
	Sat, 18 Oct 2025 02:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e3/+m6pa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6C010E2E2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5269EC041FD;
 Sat, 18 Oct 2025 02:02:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A72FE60701;
 Sat, 18 Oct 2025 02:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45F7E102F236C; 
 Sat, 18 Oct 2025 04:02:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3WsXha5E73t8H3r1jXZgYyBkA1sGJtDmBUPYHsAPgho=;
 b=e3/+m6paQCIv/rZUbfcao0pEFooQwtorz9C3j91XWW0gJAu5PLHhN4mcXXjugPumMAsdQJ
 ZPduGQF6mPCIJDxpSF58lpxXtZ7SkdOPu3NBHaajGbYAOl/RiO6owRyGoR4E2b3oNlVrpS
 3hKrRsewvxLRMoZ2J+cwG5LWmCTwNjE68eY9I9uUOT2TmvmU+W8VkItnzqNY33KRarHsGY
 Pa/3tLgizGCWUaRDZhjTQtGfYoOkQk6vTZq0flVggUtZ8n2iehePL/G8paGMYYckmToNrh
 9WgTPJ0JzppGhUw74p8/EIY5mZYaHZvX+JAME/qG4Q9+Zt+WuneCIvI0ttt0bQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:19 +0200
Subject: [PATCH 19/22] drm/vkms: Introduce configfs for connector EDID
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-19-a7760755d92d@bootlin.com>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4873;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=29+P4pWa8FWUP1XwE/tCMa4X1wBauIadGEuAgBL8wcs=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT/s/CkQqnu5wUsyu7DMmkVLS/BHAGpY03MX
 eDbMs4G4RyJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/wAKCRAgrS7GWxAs
 4gdsEACi8ysFOTzAs6OWBQ0nBsvZF0gjkHu9dgzrC+VUepM8QCoRO1Lp8Yd4UukCcZVnmqEqY52
 nMMdJFWNT2wBTduT0zIk40lLwPUMnh5gtTKcerulGPg1r1N2AXJZ1XOhZZcsX4ec3tHB6gInJ9l
 Ql68HZsMbY7U+/Kcx3Q6Ca5+3Y+be98fk6orfSv3lEkPNNC8utDUlexF7tX6Bz37ghWBykC0n41
 phtGlwidsgZBtNEENF/zvOI8kn0cmo5W8UtfIPmsfXxlSi57KgZUapSAzQpqgQtKOIcHFxwOGa0
 TD27JS3+4WBNxIqbtsuHlBKyoE77VJzO2JASJvLGvRHwGsOY+FD10hrDA53d3wZkjSyH+GUF8Qp
 hR3K1p6FJgZcsHBBzdpioAbTDVniMmaNRSQy2M6DvqnGT1e6mNEqEsoRqq7z//ULlOckQrshQDV
 M6HVxhFH1bxMDh5+9LyXmn1y/BuxpXhm53QH5dfqscDCOXFL299GO4+HniZB66YapPUCSaFX8Tr
 GXrYC+967k0TuWC/aDOTNUL9xuGtEPR9pFdqElYt7IVEHfJ+kJtCJNr7GX08d/wxytgyO2AobxH
 LloEw0XMBoEt/QoSwN8dVFdybfq7fWusuarO9adN3odt7jMAbM7fJKHZVhFXXqxd+/hVw9Ydorc
 5AQWORh2bVuTW7Q==
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
- edid_enable - chose if the connector will have an EDD or not
- edid - raw edid content

Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
x86), it should be sufficient for many tests. One possible evolution is
using a ConfigFS blob to allow bigger EDID.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |  5 ++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 81 +++++++++++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 650d6f6e79fd..bbd03f61e61c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -135,7 +135,7 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 3 configurable attribute:
+Connectors have 5 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
@@ -144,6 +144,9 @@ Connectors have 3 configurable attribute:
   If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
   Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
   for full list.
+- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
+  EDID but just a list of modes, this attribute allows to disable EDID property.
+- edid: Content of the EDID. Ignored if edid_enabled is not set
 
 
 To finish the configuration, link the different pipeline items::
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 909f4557caec..a977c0842cd6 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0+
-#include "asm-generic/errno-base.h"
 #include <linux/cleanup.h>
 #include <linux/configfs.h>
 #include <linux/mutex.h>
@@ -1222,14 +1221,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
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
 

-- 
2.51.0

