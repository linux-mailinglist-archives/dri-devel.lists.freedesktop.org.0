Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B527DCD5813
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:12:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E9410E614;
	Mon, 22 Dec 2025 10:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="H3/gjMiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0918310E614
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:12:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D7EE31A2373;
 Mon, 22 Dec 2025 10:12:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB2C1606C1;
 Mon, 22 Dec 2025 10:12:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 688CC10AB019D; Mon, 22 Dec 2025 11:12:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398354; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3rDioDZW96sB584fik+FAOG3Tfu7GIllXvDUIad2QaU=;
 b=H3/gjMiy1Ah/0o28KH6F8ewKmPS92fchHI6LlHR6bEjCsvnaybUE2vRe5oD7A6Fk1ztL8j
 LSDWLJiU6CQZTS3Qsi992tS714usPg4k+dgs7nhyyeJC6EITK7fI/9dl78W8TlBOfGekWz
 oBxsSfLArza5C70r1SYf1+FMbE6UCwVeAKBfxryZCHZ9cUYNjZRMkq19p9dqWOk8MAkAOU
 WO17rFaoGYJlr1T+KyBsVt+PJMR6tnFUdOiNTlr+kvkcfXZWa0Jfn3nCtW7tDdPvimmiPX
 8qaGTuFE7IQTP9FU38+wUprGwx6fcr1fChcsbcKAfPQEAZH+pWlMLW+QN90FMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:28 +0100
Subject: [PATCH v3 26/33] drm/vkms: Introduce configfs for connector
 supported colorspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-26-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4154;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zNfRFxKJmGCWDW0RYX4Fz/88QHBhgC3Pcntft5M0I1E=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDMqFdQIhDtPFad62IvTs5XqevUfd4TbXm2
 ozE3UzmGp2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJRPxAArNKk6uHmRocRHNqJy5a+Iy7cMLJm6TW
 OKehyBJ2bvrrbW+8i33Ef3ehLPyn71gbdqkN2qO3bNvUoSzDTdIP3+EV4ceaLsefNRt+uRLmALw
 02DRivgqFxLbbqkLEREtPXhbMF7ipDleODNk2C4tviZvKhnhz3R9Q6O15A8XJ4TitrDTP2TAhDM
 yG9A9buLOxeiezxgKcBtH0Yza/+TARi1r1L2Y0UGVWW77/wQ14ZEcr714AD1E5m9KE2BeupoH0D
 fHQOuF4mLZkWUSSZAfeTstaS+gOgOeNrHpxDMETXlnmM7U3OWSIsm3EAaLcwXeidwuRLeu5q8Na
 lxuccMqYNTd6obEGFK0NUJTIVTSu8ic4u6fSApKfUk0kEIJ/0MXmZsRT2NKovWc+Qi9KNhCsncj
 fRwVkdUP4jtP2CVvlW8VJyAtYFnnx8/i9eNCye8U51CV3SvFfYk3sL75OyPn5pr0oqLh4moevqb
 JdrcIiVUnu2UNJcZ/FrtXCWez2pswo5rc4XAlendWMwcrogtZw+bL5Bk5BEYSyJh51gA+vQ2LaB
 IEp7RzUL/66iGY1A5DaWlGtEAhJoMEjWe7mOmU4vEX0PPq6PH+geZHZt0pHgLCMMFWLQwJyhTnq
 TFYP/8BOtMtZbTmWanfxpkstPhioR6AmNamqiD+m7QGirTlaWgOg=
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms |  8 +++++++
 Documentation/gpu/vkms.rst              |  7 +++++-
 drivers/gpu/drm/vkms/vkms_configfs.c    | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
index 5452140cc508..f750e616be54 100644
--- a/Documentation/ABI/testing/configfs-vkms
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -40,6 +40,14 @@ Description:
         Type of the connector. Possible values match those
         exposed by the "type" field in drm_connector.
 
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/supported_colorspaces
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Supported colorspaces for HDMI, DP, and eDP connectors.
+        Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
+        etc. See enum drm_colorspace for full list.
+
 What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
 Date:		Nov 2025
 Contact:	dri-devel@lists.freedesktop.org
diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 41c6f4733663..1c4a8023374c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -138,11 +138,16 @@ Last but not least, create one or more connectors::
 
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
index d6a85d6c466f..90bf6e6995ae 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -1233,12 +1233,52 @@ static ssize_t connector_type_store(struct config_item *item,
 	return count;
 }
 
+static ssize_t connector_supported_colorspaces_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	int colorspaces;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+	colorspaces = vkms_config_connector_get_supported_colorspaces(connector->config);
+
+	return sprintf(page, "%u", colorspaces);
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
+
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
2.51.2

