Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B3A4494B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 19:00:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3A710E789;
	Tue, 25 Feb 2025 18:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N/v5nA8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9CB10E69E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 18:00:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso36797835e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506399; x=1741111199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGxwG+6bGnNIthEQL+F1Y0qNbK+3kLrCEEdzMCdmayU=;
 b=N/v5nA8CSY0Ebko1eSgVFWhUmwNZq3uibpFnS98hBJGJhQClSJyMsNkyuiaymDZLGe
 cKwzEY9Cm1XPr++YReAj+bmCSkOGNtMyl8WijfhZB4b9BF5lqELQOJNan/XVuHtjeLo0
 pUNitljb8LvJwCVDPNAzxbruKRCADQ/69nkr1G9Xn+H6T2b2iit/f2bPTaK7PBRSxZHv
 jHJnQvcwBhaMTxywJDbUYVZJRwHhQgHoDm7QyEHsMErON/fsQwUoTNQrT/sX5HlQITYH
 tYaGMZpLUnMFIwrcrMNMitptGN2W7vf4xVDf25zFvRQz32IznGLsd6Vv7gUFqtjv/W5R
 5P8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506399; x=1741111199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yGxwG+6bGnNIthEQL+F1Y0qNbK+3kLrCEEdzMCdmayU=;
 b=qyTR+1Pyxbch6Jp3vY7KMzN5v56nsHSQL+aEvL5NMobEWupP5XKiZp8czrybO3CYG9
 T+JcFmN3LHNcL3M4zjZ7FfEl/iJ0KC1DPEOr0Y8KhhBamAXRM4mz70MFMZBM2q9tTHWE
 VEaz+TWf1X3wgJTpdJ/Da0I25YbTwlj20vi/9KMGcyyzX8O4D+hgq4jJxPgRyrMcjQ+V
 7Zl/9gzTrTgmwJgvRMf6oxdc1nqN7D7dqGBvhshreBTrLjzUlX7edK8vioYYG9ijno5w
 0FU0RxrEUDYlMZF9Do8xAj8ys+VaRwnYm48Yp+rA9JSy7Qp9tKR0T+46WX6k2MPXcSvO
 y5yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzlRXeUeNWjgN4q1TLFeKQazMlV+Y6Y/zTneGf6FLtK/uTu0lMtzElI5h68ETvy2m+2RL3zxop3Ag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6xPxe4e1fSHJlL6RuTJvsseAXQn+jgaSF5pS+SwEyyQcgH7WS
 YQaE0kgYKxaVa0DP/1lk/FOq5Xst5ZGYhefSlTMKq/2x4UWbVdgp
X-Gm-Gg: ASbGncuoH/g+c950xxtUH3NkCgti4s5NcjgwQd0jtWUK7d5PPcxT8ECCmtajwe7D6xH
 yxf/0jhPHW1xtOO3dLro0ulgyO8gY9xStdGNXrHAsId6rxkXX9c8NswfkFdFT0IFTZakILz1h6H
 mePdpKzDeR5ayQ4cVMB0KcV0M3RlWzP+Z73RW485dJ2/qaqTOed/Ur850Vg62SnCPWvC9LGnkif
 DdlCiG3PnT6bo7ysUwRmchrL1w/EA/Griq8Bn5weJOQOoVieweb4YD8mOj9pLCxqLAdZ73FpOCz
 oOqAmezw1guMJwpwr2BzUuZWGeEb
X-Google-Smtp-Source: AGHT+IGqBZvURkcaxlMPmAxOYXrBfupjLCf9BWOro848BGonvQQbFRhIpMLdNCyILndFVpqQPjDTTQ==
X-Received: by 2002:a5d:53cf:0:b0:38d:a90c:d489 with SMTP id
 ffacd0b85a97d-390cc6384a1mr3115400f8f.45.1740506399191; 
 Tue, 25 Feb 2025 09:59:59 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:58 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 16/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Tue, 25 Feb 2025 18:59:36 +0100
Message-ID: <20250225175936.7223-17-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225175936.7223-1-jose.exposito89@gmail.com>
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

When a connector is created, add a `status` file to allow to update the
connector status to:

 - 1 connector_status_connected
 - 2 connector_status_disconnected
 - 3 connector_status_unknown

If the device is enabled, updating the status hot-plug or unplugs the
connector.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c  | 46 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_connector.h |  6 ++++
 4 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c551241fe873..7c54099b1dc6 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -108,6 +108,11 @@ Last but not least, create one or more connectors::
 
   sudo mkdir /config/vkms/my-vkms/connectors/connector0
 
+Connectors have 1 configurable attribute:
+
+- status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
+  as those exposed by the "status" property of a connector)
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index d4d36d2c8f3d..76afb0245388 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -7,6 +7,7 @@
 #include "vkms_drv.h"
 #include "vkms_config.h"
 #include "vkms_configfs.h"
+#include "vkms_connector.h"
 
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
@@ -496,6 +497,50 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	guard(mutex)(&connector->dev->lock);
+	return sprintf(page, "%u",
+		       vkms_config_connector_get_status(connector->config));
+}
+
+static ssize_t connector_status_store(struct config_item *item,
+				      const char *page, size_t count)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	if (kstrtouint(page, 10, &status))
+		return -EINVAL;
+
+	if (status != connector_status_connected &&
+	    status != connector_status_disconnected &&
+	    status != connector_status_unknown)
+		return -EINVAL;
+
+	guard(mutex)(&connector->dev->lock);
+
+	vkms_config_connector_set_status(connector->config, status);
+
+	if (connector->dev->enabled)
+		vkms_trigger_connector_hotplug(connector->dev->config->dev);
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(connector_, status);
+
+static struct configfs_attribute *connector_item_attrs[] = {
+	&connector_attr_status,
+	NULL,
+};
+
 static void connector_release(struct config_item *item)
 {
 	struct vkms_configfs_connector *connector;
@@ -514,6 +559,7 @@ static struct configfs_item_operations connector_item_operations = {
 };
 
 static const struct config_item_type connector_item_type = {
+	.ct_attrs	= connector_item_attrs,
 	.ct_item_ops	= &connector_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b03a00b5803a..ed99270c590f 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -76,3 +76,10 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 
 	return connector;
 }
+
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
+{
+	struct drm_device *dev = &vkmsdev->drm;
+
+	drm_kms_helper_hotplug_event(dev);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 5ab8a6d65182..7865f54a313c 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -33,4 +33,10 @@ struct vkms_connector {
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
 					   struct vkms_config_connector *connector_cfg);
 
+/**
+ * struct vkms_device *vkmsdev() - Update the device's connectors status
+ * @vkmsdev: VKMS device to update
+ */
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.48.1

