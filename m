Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28509621C7D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 19:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3FC10E4F6;
	Tue,  8 Nov 2022 18:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40E610E4EF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 18:50:47 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-36810cfa61fso141951637b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 10:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZB1r43VJCLEuCBOYhWr/N5mF6kTlkofIg4Tb9RTYcbk=;
 b=NisyEsfbVYNv6Hsq46RUemq5+Nod7rKoNQcwWsLzOKRC3P3TWNrxadp2uEKtLNU5ff
 l7tXdYBT12CTvVajEmmkWrU6kkKibllyL4yBWeX/OH96i5+OPUZFDwycrxxHR26C4C2C
 U2Zcvf9qO4SfpoogqZ7eoImSdfA6bqHK0x7c9nVdIxLK6QMDB4N3XeL55053VhPJVQyg
 r9YTHT9cYnsFDYazzX+/4DcMPnmCUeUE8wPIjiC37qqaI+XwBN4JmKpgz650rNa8rlch
 fwdGiN0nYtwluN8Dw9C4yhMou1EfuGrMUWQZxqV18u29oweRiMENEM/g3LcEhvRdlkaV
 wsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZB1r43VJCLEuCBOYhWr/N5mF6kTlkofIg4Tb9RTYcbk=;
 b=ZU4mJZJOmYv3ogmsmJ42fcdKjqfWDaF/SwzUmAajsPTROVCloinlJtmegEmdEHvxRH
 7zunDGlYWiLDNP2+oWJpUutq+vjsIAn6q6THmo0uSgn3w4DPeTit8uHepbncn8SEYIps
 6mJ7ki9MpcMabBRh86vHqDC7xIK8Kn/fGHLyZtz+96CEtd8iPbSHcYnZ5ZaEIWv/PQKU
 wL2yC9ubgPKKDwhag2kViW30R+FHSPl5R6rG/aG7rgpD91IbCQvqvSqXY6wCJzpxziV/
 blld5FUwRbMHla9z7tcX48vTGZMa1UbPPN7uPspOG7SvsThFHaslJp3GIROkmda1tneQ
 SSMA==
X-Gm-Message-State: ACrzQf0wQHP41m3+M8zlq6wnpt/7YkevfOjfy3dkbwWKNZyRogx7ALQ/
 oTjATgXO3fTxg63aFIutWA8ij8zjUM+tuw==
X-Google-Smtp-Source: AMsMyM78GhUZSj2TFcme5D9Rasl1Kf/bKSJV841t32VCPr4ab0/mASXWzS/08FZrF2siqV1MO556p8q4WBR9xA==
X-Received: from wonchungspecialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1440])
 (user=wonchung job=sendgmr) by 2002:a0d:df46:0:b0:36a:73db:2c2d with SMTP id
 i67-20020a0ddf46000000b0036a73db2c2dmr55535895ywe.130.1667933436613; Tue, 08
 Nov 2022 10:50:36 -0800 (PST)
Date: Tue,  8 Nov 2022 18:50:04 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221108185004.2263578-1-wonchung@google.com>
Subject: [PATCH v4] drm/sysfs: Link DRM connectors to corresponding Type-C
 connectors
From: Won Chung <wonchung@google.com>
To: wonchung@google.com, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Create a symlink pointing to USB Type-C connector for DRM connectors
when they are created. The link will be created only if the firmware is
able to describe the connection beween the two connectors.

Currently, even if a display uses a USB Type-C port, there is no way for
the userspace to find which port is used for which display. With the
symlink, display information would be accessible from Type-C connectors
and port information would be accessible from DRM connectors.
Associating the two subsystems, userspace would have potential to expose
and utilize more complex information, such as bandwidth used for a
specific USB Type-C port.

Signed-off-by: Won Chung <wonchung@google.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes from v3:
- Append to the commit message on why this patch is needed

Changes from v2:
- Resend the patch to dri-devel list

Changes from v1:
- Fix multiple lines to single line


 drivers/gpu/drm/drm_sysfs.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 430e00b16eec..6a9904fa9186 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -11,12 +11,14 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/component.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
 #include <linux/i2c.h>
 #include <linux/kdev_t.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <drm/drm_connector.h>
@@ -95,6 +97,34 @@ static char *drm_devnode(struct device *dev, umode_t *mode)
 	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
 }
 
+static int typec_connector_bind(struct device *dev,
+	struct device *typec_connector, void *data)
+{
+	int ret;
+
+	ret = sysfs_create_link(&dev->kobj, &typec_connector->kobj, "typec_connector");
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_link(&typec_connector->kobj, &dev->kobj, "drm_connector");
+	if (ret)
+		sysfs_remove_link(&dev->kobj, "typec_connector");
+
+	return ret;
+}
+
+static void typec_connector_unbind(struct device *dev,
+	struct device *typec_connector, void *data)
+{
+	sysfs_remove_link(&typec_connector->kobj, "drm_connector");
+	sysfs_remove_link(&dev->kobj, "typec_connector");
+}
+
+static const struct component_ops typec_connector_ops = {
+	.bind = typec_connector_bind,
+	.unbind = typec_connector_unbind,
+};
+
 static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
 
 /**
@@ -355,6 +385,13 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	if (connector->ddc)
 		return sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
+
+	if (dev_fwnode(kdev)) {
+		r = component_add(kdev, &typec_connector_ops);
+		if (r)
+			drm_err(dev, "failed to add component\n");
+	}
+
 	return 0;
 
 err_free:
@@ -367,6 +404,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
 	if (!connector->kdev)
 		return;
 
+	if (dev_fwnode(connector->kdev))
+		component_del(connector->kdev, &typec_connector_ops);
+
 	if (connector->ddc)
 		sysfs_remove_link(&connector->kdev->kobj, "ddc");
 
-- 
2.37.3.998.g577e59143f-goog

