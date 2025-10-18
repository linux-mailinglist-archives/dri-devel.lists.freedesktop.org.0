Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3D1BEC477
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A984710ECEE;
	Sat, 18 Oct 2025 02:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RzabVN2q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173F110E2E2
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:02:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F32854E4115A;
 Sat, 18 Oct 2025 02:02:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C39BE60701;
 Sat, 18 Oct 2025 02:02:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4183E102F2374; 
 Sat, 18 Oct 2025 04:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=/8I2MEdh++U8+vOGiB+Dp1EDa9gPj+KSXHZv6j9iBNk=;
 b=RzabVN2qsRox24jUqmDInDDPVj8gidOdnRHh3XlsMEmSiVlp8WiHqILOUgzUQfGr6OBID9
 kTydwRdj6P19VyUeisFh9k2inTHgWJYOZ7NqbnShIMVau/7GSGy6fsxahG3upojApLT6xa
 KH6jF989IWxoH8ccUPIVr6E7iM4zwZJtQa0M+xyE3rOX6cp5UdG/j7C96YFUeewF3Ur7OT
 7pCf0H59AYQQH6/MrH/QiBn0dPRD3zgp65FnsPJXXfIk0MMN8/GekEe1VlXmU7TQDxAYdq
 2nc0C/3HNc+Ogl3hpKByyoW5RD5PxYv6KitWVR/++aN7aIGBR5PrDCyh2E7FSA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 18 Oct 2025 04:01:17 +0200
Subject: [PATCH 17/22] drm/vkms: Introduce configfs for connector supported
 colorspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-vkms-all-config-v1-17-a7760755d92d@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3130;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=hRacqbEqpcRVbYp59Qv1f5zGs1dDRy0uDoAy0TH4mtk=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT+4veHiMOYckghRdQd54KpIwQAUKA+dI5GA
 k0xc8vjpeiJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/gAKCRAgrS7GWxAs
 4j9MD/wMCq+88WFwqju/f3HhR2LrUP5noLYTCHemnPUVap6yNyHlXiQ1Rc6yk6gJFH4eWupRnys
 YTC+dGD+3hpyKTfwINm3bz6kJ3knWOVSC/NN+coJAEWfYRow3/Y6iyX7jJW9etCZsjtOjbzZYrl
 8ZcTjodLj1aJ3IcIT0psa3zVnUNAWtXQIJ1kwEgtX9jKEzSgIHto6joBaMcPLuR/GaZI/6jX/02
 IUytMIiTsv/kyx83IXc3JnpyhpOKd1RBI5789+c13dnnq4no5KPNFB96PbA+9JisQnesTMAghmo
 IulCxAcXPZH+5n1q3pf+7/5feAZiyZFLQITNY31sZmmVouHG1oliyhzh6z3n2CTalRxxfAIuI3c
 VEZ4Ktg5mrhhdGGm8O4VwDbPHhDRasPXN2d8vQ4Qop3hz0yyUXzJhIarK+6rbKwYcWkrMCh85ET
 9uTtGcBP9yzO+DTEmr3+DL1so2gKoenFNPKcBYEQIMTmnAoiM4QNaCYO34Tj7/sSgthpL0+jo50
 AlHhnPbCYwyfpziHIN4FPMJrz5ZgNqybS/dHOnZZjzGcUOCrc26Oaayfdx8FjIoX+PKWRuhW7fF
 5mv68UeR/72o+F8sLix/TDkh+D6G8VbjY2cxvq6qXxGT3makb8DyYRT6NbhVvSJoMKi5PYO0yBl
 107iG05zVOtR7kw==
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

Add the attribute supported_colorspaces to configure the supported
colorspace of a connector. It will allows emulating some HDR features of
displays. This feature is only supported for HDMI, DP and eDP connectors.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/gpu/vkms.rst           |  7 ++++++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 97ea11a86bd1..650d6f6e79fd 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -135,11 +135,16 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
-Connectors have 2 configurable attribute:
+Connectors have 3 configurable attribute:
 
 - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
   as those exposed by the "status" property of a connector)
 - type: Type of connector. Same values as exposed by the "type" field in drm_connector.
+- supported_colorspaces: Supported colorspaces values for HDMI, DP and eDP connectors.
+  If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
+  Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
+  for full list.
+
 
 To finish the configuration, link the different pipeline items::
 
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 0cf7cee4eb0f..909f4557caec 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1185,12 +1185,51 @@ static ssize_t connector_type_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_supported_colorspaces_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int type;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+		type = vkms_config_connector_get_supported_colorspaces(connector->config);
+
+	return sprintf(page, "%u", type);
+}
+
+static ssize_t connector_supported_colorspaces_store(struct config_item *item,
+						     const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	int val, ret;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	ret = kstrtouint(page, 10, &val);
+	if (ret)
+		return ret;
+
+	if ((val & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0)
+		return -EINVAL;
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+		vkms_config_connector_set_supported_colorspaces(connector->config, val);
+	}
+
+	return count;
+}
+
 CONFIGFS_ATTR(connector_, status);
 CONFIGFS_ATTR(connector_, type);
+CONFIGFS_ATTR(connector_, supported_colorspaces);
 
 static struct configfs_attribute *connector_item_attrs[] = {
 	&connector_attr_status,
 	&connector_attr_type,
+	&connector_attr_supported_colorspaces,
 	NULL,
 };
 

-- 
2.51.0

