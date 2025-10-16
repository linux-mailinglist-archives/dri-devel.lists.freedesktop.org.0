Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308D7BE4F17
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094A710E334;
	Thu, 16 Oct 2025 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VP5QS/TT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C38410E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:57:02 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4711810948aso1429625e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637421; x=1761242221; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GWwM20gq7xOoxyKkWmC1LXSVhNHxFS/9ynoMAJqd3o=;
 b=VP5QS/TTcTgLT52ijOHsOwlGcde3U5IGyq7iDGXJK5MN/+jOzNRAMeQ1Wkx7NjgqIg
 kMDP1Zyc8ArpnBARFChp4DlRK40R8LaSraMR/IKOMNgXmGzay8kKd0jCrLhKibuXe2EA
 6VBgbgjrMV5dE/hkZTY56NsX6txKlJHJwbrYNcw0r6AkqjdaKGbo5EZOl0yaUE6fVfeW
 4WOAWoE+0bkFURZMdRdUTnTdPNwtuxs/R9J8aEQo3zHMhi6NFS/Awwx5MeYM96kc3/WV
 Px19rocVo1R3FsgaZSMcASYU+E/nBIFaZBQLR4QSj1L8eJQmNEW3HTxE3pxNcCnc3Z08
 OKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637421; x=1761242221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GWwM20gq7xOoxyKkWmC1LXSVhNHxFS/9ynoMAJqd3o=;
 b=MlDPIjB3v3ytnfMq+203BNV07xBoPgUkaTom9ZCQ399zazWw9QIff72EkeVK/0x5Wt
 aIvS0vcHAkhQTRjvUPnyy+REax61YzQ7cdbmAqfmVFgGvPVBQl+YWTC7KkulLrWwozw7
 ui0/6nFNTS7KRtnYrU56KhQoabIjD+Atd6V/AkZd15YLSa66FrW4bge71DcpVqBL9dJW
 PbInrBlDgmxGMUKB/bRVTuFuoNCc7HCroEHJ48PLfs0ll3949lKwRSvhUBWplKmqarYI
 5PAVC6MdnEsInPRKjTL4ZOWllAJtpUGSOKBiVymlBvBKLD6z7WTak/WBWFMoHp3EI+A+
 DiYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBVcUaOUxCvgR6M6ka2rsos/a97tOytSnuCxHJN3kwNDwRP2wa8smssIn6HNmc1O7lqIQhv+7GCWk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjnRPNcz9YAI29ei7X6aWEkS5P1zopRIDEXWRN7RVMRjpH3fWJ
 pfsRcSJkBrOaBG93v5vTDgSZQIZKrLIJWSZPcS8GfgJW7mXILNQjtqve
X-Gm-Gg: ASbGncue/DATyWJiHm2ZjN2usRaPGiXhJ2FkDVSA19B/7SokRYTaxjT+z/SEPqUR84X
 APga4oy0Hr6U9dflIy+0Zoq/ckTE1D/fq1f4ytcojRBew4qq5iSrnuHMolBsr5UCf+u6VA5Mdfn
 CA3N7nAG7QNANSeGGyUa75SyBW+AbMkfeCQvWOhh9f504TWy8azp1k+wAELffGLjsKEfkZEqd26
 ITQWPvSg90Gfv5Wr1L+6od1QfFqmOhvQ4j7fshLKafQpdspRe6HSeowNLsE+thCKX0q4D7l9lbz
 ndL6CxH+MnenTxXbNIwTpLctsxKMGnNBQJHKOgWov9OfpR+bmNUNmGP17PcS0cjEKjFDqwDKpft
 jHKrz9MuOaTp8x+Ngby0I6w4RA88dIwwjPtNHghRiNK14LNM3Ix7el/ust4vHLyglyEUns2Rncs
 hWJGeOk0xlbg==
X-Google-Smtp-Source: AGHT+IH53BhaYro8jyKEDI34s3L9q4RglYQK6QZS8yLxmdbAtqWCu455uCzIhrqElW+V6d1h6xnYuQ==
X-Received: by 2002:a05:600c:3492:b0:46e:33b2:c8da with SMTP id
 5b1f17b1804b1-4711791cadfmr9916985e9.32.1760637420904; 
 Thu, 16 Oct 2025 10:57:00 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:57:00 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 16/16] drm/vkms: Allow to configure connector status via
 configfs
Date: Thu, 16 Oct 2025 19:56:18 +0200
Message-ID: <20251016175618.10051-17-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
index 90f835f70b3b..ed312f4eff3a 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -26,4 +26,10 @@ struct vkms_connector {
  */
 struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
 
+/**
+ * vkms_trigger_connector_hotplug() - Update the device's connectors status
+ * @vkmsdev: VKMS device to update
+ */
+void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
+
 #endif /* _VKMS_CONNECTOR_H_ */
-- 
2.51.0

