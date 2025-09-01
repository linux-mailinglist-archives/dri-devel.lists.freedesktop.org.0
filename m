Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA9CB3E2C4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C7F10E446;
	Mon,  1 Sep 2025 12:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DCOk0RkD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4714910E447
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:17 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45b88bff3ebso8238005e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729576; x=1757334376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KXpqkTrNBx08nghW1HrOC6W4PRw4l0CpXqaM8e/MDOo=;
 b=DCOk0RkD3ybVTQ6cXGvIdjB6VOLW0R41+s/CJk/JGjsBl7s1OCmPGrgkZHKGnfMLD7
 +cIXACMB2m5ACwoUiWKquyvMJh4pd4W+6XwzJdbVZ4y7iXYzGe3EVyY2QqIC+otMN3mM
 nUCDC0CjBTQLICK0Yh0RVli4cNluM3i491ZM4JAwCokU6cZDSI9p2yhmMZG8oUoQW8Ax
 VGZTtNc28aOJfqPasVbDqM7r9fGRzpsIw6WfyN99WWUZRMCRS6BK6QeRqkttjYD8KCmu
 4aFROm+M8jg45/H/WYtrHLT1zUqiF7Ppq5h7YOcisPAkv7JryL0kJj0IXGdmBHuJaqfU
 jDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729576; x=1757334376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KXpqkTrNBx08nghW1HrOC6W4PRw4l0CpXqaM8e/MDOo=;
 b=ctsuTM+eckCSFgbQcaQasArq1TWS5pOBDjeMbKjSeGVW1wsgJcx/2XF9XQEE8GahQC
 WxGy9lEODNMUc7pIAaiq5lsdbuijfGk7PO7mPHxU7aakgAu7UrFnqlhhBnvb3RMherY9
 2nzYTzEtd7uzCsi+ClbOfVGGcCmW4iXTxAEuI7OQnVlJDcee0fWtqlHCAUOtXUE6VNg0
 m80xZWqtf+7o+xIR8ljznU8TTmv/uY9FMBoD7PODJn8lbFOiVR8wMgOW6frh2pbipoJa
 WgeGz6NEN2gZtg6BrF1zr8OEnrBWps7VMOofycSTgiCISCY9KzPFjAK5i89FhzqY92vU
 NHQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTlF3EfR1WHKhgt1BWCfFniJpHK322S4yv9aGMkqbcJho3IPTc5PYcSicl9tcZOQ6t45Olnp8cfhc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZjDsXbDuYlKUwL8fIW58vt0e/GUBkqPYA2Ln0T86FYjlCXgP4
 I9r+lhYH8wkIuSQzPDxCgeSwwQR2lKEljn9Poi4q0d5Xxe+cupy5lt0e
X-Gm-Gg: ASbGnct8N4FLSkptu6sFDQ7UpgObQZQw3TPchMP4GH7pGdxdhc/PcPK1dK9wOUKjJrf
 Frhq6MUsaftGXskVNKk34EYBsAIhUSfRoJH8g4DWYxW+aU7qY0TSKuLNN2BUrRllnq5BTQw/ugv
 s5MyTcqYdQMpuAIfeams9BYmg/ibRYohQzXGY/3XbK8szcyuJO1tgZzB8/veugbneC0sNfq+f6n
 SDr71cvyDx3cwmBviPVaE3lX047zChEwDQrL5ctw0vUKvBNPyqBWbixCHe94rYIjF1KttQJsdWc
 GHnCiYS//zuvogXaCi/k2DDO0gXpRNt4vLM1a196er5Dx6dmAWXZpLuBflFmOGEuJt4D9fdL9fG
 eag2ZfeUDtGcLABu9BnoU5y8HZtQUSpxiF4hhyOs=
X-Google-Smtp-Source: AGHT+IE2HSu7KIwEmoxMq08mYeKHKtIF4UHvpucYUvO+CqTQKiYTLe6Jd3B2jaPQ+EeAvqZvZUA7Bw==
X-Received: by 2002:a05:600c:45c9:b0:458:bbed:a81a with SMTP id
 5b1f17b1804b1-45b877be05bmr69423465e9.10.1756729575670; 
 Mon, 01 Sep 2025 05:26:15 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:14 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>
Subject: [PATCH v6 16/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Mon,  1 Sep 2025 14:25:41 +0200
Message-ID: <20250901122541.9983-17-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
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

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 +++
 drivers/gpu/drm/vkms/vkms_configfs.c  | 48 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c |  7 ++++
 drivers/gpu/drm/vkms/vkms_connector.h |  6 ++++
 4 files changed, 66 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 364b574a8cae..3574e01b928d 100644
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
index 8e90acbebd6a..07ab794e1052 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -7,6 +7,7 @@
 #include "vkms_drv.h"
 #include "vkms_config.h"
 #include "vkms_configfs.h"
+#include "vkms_connector.h"
 
 /* To avoid registering configfs more than once or unregistering on error */
 static bool is_configfs_registered;
@@ -512,6 +513,52 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_configfs_connector *connector;
+	enum drm_connector_status status;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+
+	scoped_guard(mutex, &connector->dev->lock)
+		status = vkms_config_connector_get_status(connector->config);
+
+	return sprintf(page, "%u", status);
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
+	scoped_guard(mutex, &connector->dev->lock) {
+		vkms_config_connector_set_status(connector->config, status);
+
+		if (connector->dev->enabled)
+			vkms_trigger_connector_hotplug(connector->dev->config->dev);
+	}
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
@@ -531,6 +578,7 @@ static struct configfs_item_operations connector_item_operations = {
 };
 
 static const struct config_item_type connector_item_type = {
+	.ct_attrs	= connector_item_attrs,
 	.ct_item_ops	= &connector_item_operations,
 	.ct_owner	= THIS_MODULE,
 };
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 89fa8d9d739b..b0a6b212d3f4 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -87,3 +87,10 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 
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
index 90f835f70b3b..35f2adf97e32 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -26,4 +26,10 @@ struct vkms_connector {
  */
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
+/**
+ * struct vkms_device *vkmsdev() - Update the device's connectors status
+ * @vkmsdev: VKMS device to update
+ */
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.51.0

