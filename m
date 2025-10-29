Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAACC1B436
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E6410E7CD;
	Wed, 29 Oct 2025 14:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1ZT8Wp7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7452910E7C6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:37:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5D6034E413CF;
 Wed, 29 Oct 2025 14:37:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 32F23606E8;
 Wed, 29 Oct 2025 14:37:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 24ACB117F81B6; Wed, 29 Oct 2025 15:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=TiSP9apTRMTQa/+Qm2OMWAOpekvvQHx/ArvOL/FMv3k=;
 b=1ZT8Wp7IhA0jpWViW/RL1lMvau22xIyx6MpyZ4NhS+GjZj7+EerXqiBfDrX56WW5EHyLes
 ccHEP4/sQvbyIumX/R/qYmutb7uJ9Hru9PZy7SnAmbkgpcXla2UfuRwdOv+wUoBAGYB5xl
 f/HkC6TDoYP7CDXczsslPF4gP353gtam5QoJUi6cJtdTrdQynxX8OdtY5rAXGTqzjjl3Ge
 K4VqmcKoPMckr4vd8uJ8cE+pZU0ovTPdob8l9R6GtyR5HL7iexHhSyG6u3FjoD4pxqLUxZ
 gPEj3opRcwPyUnfkLm80y/XmxC7zdk+K/VeT/6NO8Q3a9GYKpRt2tTJv6FW2og==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:59 +0100
Subject: [PATCH RESEND v2 22/32] drm/vkms: Introduce configfs for connector
 type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-22-a49a2d4cba26@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3281;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LUx3WgpJ+5BY9H52t76Y/Q40Ik9Sz02o7+/xgILTIdY=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ9E+Gt4xDUfca6oSRjlO9l81jkjGC5fN41Q
 wZPk4xKYW+JAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfQAKCRAgrS7GWxAs
 4tiVD/95NgwtNTW58Dw5zlRj9WzngKn1GBaAFI+2AWbj0K5+yYiR4XoX6KIjCh62WRWxvIRP6ku
 0DhCJ+Lt8h8WZ09G1tk+q8SyuHgxoILusiIjbVF3WI2ZVb9Dmrj+hEmFZpdqLtZIcoZNAL07Yk+
 6vGL8paQ5O6F4NyjF0/3B/YHJ0MCryiFytm9C5RPC7fBxOm5PV9IABmfjylrsZEC89ZiuBxbTmE
 EayYkekH8p6Ij8uGPnwH1k2gtdXYXtrHDj6ZrlhGbwvzXammcPahHrtG1bU/s8xH9WbWmS+6wjm
 Ch43jSMMZqdf+iMzjVrG2h73Br0/qvPIqqqqMbBOr6k+ZUOk9ZLYrTnhXX2sBXFItwKHNrSJaPF
 /2V3h6b2GbSelVVTRxuAYWjGoE22zEANXyIYg4pQ7o9XEIewtPugar2JgswpCtJ7YsUwA2B9A6o
 p2DhUYJG0UkRgv0XlvQ0oJMnJbq1OPLJzxgRvINka/sdhvpK0fiZTK/XGwXqC2Kltcw6/UKSL//
 oxV5Z7/e5sT0Cyo69CDUDuALkP+VPJ+j8FZ2icCCGCDRqbLviSs9Atlurf98Tt8SYabJagR9LRI
 lJcq3BHHwFQm9xLWGv2HauxriIeOtGekElAT7dTu/NEfeZKDSLUzDf76OthN0SiVtfyfVmraSOK
 KXS9xksk+54w0sQ==
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

Add a new attribute to connector to change its type. This is mostly
cosmetic and don't have direct effect in VKMS behavior.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |  3 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 64 ++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 32858f9a3357..99c5cf3dbd78 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -138,10 +138,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 1 configurable attribute:
+Connectors have 2 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
+- type: Type of connector. Same values as exposed by the "type" field in drm_connector.
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 1c0a6ecf2f29..b03e9af569b6 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1161,10 +1161,74 @@ static ssize_t connector_status_store(struct config_item *item,
 	return (ssize_t)count;
 }
 
+static ssize_t connector_type_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int type;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		type = vkms_config_connector_get_type(connector->config);
+	}
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t connector_type_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	int val, ret;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	ret = kstrtouint(page, 10, &val);
+
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case DRM_MODE_CONNECTOR_Unknown:
+	case DRM_MODE_CONNECTOR_VGA:
+	case DRM_MODE_CONNECTOR_DVII:
+	case DRM_MODE_CONNECTOR_DVID:
+	case DRM_MODE_CONNECTOR_DVIA:
+	case DRM_MODE_CONNECTOR_Composite:
+	case DRM_MODE_CONNECTOR_SVIDEO:
+	case DRM_MODE_CONNECTOR_LVDS:
+	case DRM_MODE_CONNECTOR_Component:
+	case DRM_MODE_CONNECTOR_9PinDIN:
+	case DRM_MODE_CONNECTOR_DisplayPort:
+	case DRM_MODE_CONNECTOR_HDMIA:
+	case DRM_MODE_CONNECTOR_HDMIB:
+	case DRM_MODE_CONNECTOR_TV:
+	case DRM_MODE_CONNECTOR_eDP:
+	case DRM_MODE_CONNECTOR_VIRTUAL:
+	case DRM_MODE_CONNECTOR_DSI:
+	case DRM_MODE_CONNECTOR_DPI:
+	case DRM_MODE_CONNECTOR_SPI:
+	case DRM_MODE_CONNECTOR_USB:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EINVAL;
+		vkms_config_connector_set_type(connector->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
+CONFIGFS_ATTR(connector_, type);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
+	&connector_attr_type,
 	NULL,
 };
 

-- 
2.51.0

