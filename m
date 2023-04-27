Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E7C6F0A5D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 18:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005BF10E1B1;
	Thu, 27 Apr 2023 16:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C4C10E1B1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 16:58:47 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-64115e69e1eso5007286b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682614727; x=1685206727;
 h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4Lzzj27mp2U/iXO+CebupzdoIBWSksazoxVaz64r1B0=;
 b=wPcAqL+iVul3uutVHxWzVqPpl0+umqjfEAYMMNSNOHj6zDK3uwg3gH/VRjMzWS26k9
 7xvUTh9PO2llmUmFKJ7KDU+XTrmI1gktLOw1ota2AwVxdT1NafzGAKk+k77/4kB7RsFY
 xa0dyDnvUQ+IFB00opEbYFjqx85RFrV/ROwTUvJrg/1OY2qQAbRSCbatkFbxI4MgSe/C
 SX/6F6yd5W23qDVhbQRcq81GiRgpNbQ94J6J2bC5Fy3mmf+prknc/6gsR981qmMUiiKh
 9C9ugqezyNCvOM054EJ1uxCdHG/Xrl1mDQFT5P6/1688pqy7ejFT2JxHP3siT4gZuOUG
 zzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682614727; x=1685206727;
 h=to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4Lzzj27mp2U/iXO+CebupzdoIBWSksazoxVaz64r1B0=;
 b=AxPZYlHSG9xvvvhYZjfdg6r2Nu9grUqJw3z5Ou6F4Anlmr1kjOAOKBUMT00h6okTqN
 YgOH2IWLn4x4QilB9IP5y130p7tqqM+csKFRFBBebpZFgJKsqK43f6JS0RKkvVsqGc5z
 xzE5TVr1str0DdPPJsEykwXYDa94T5vfSsCfnKfRSeF+NVBzfx8+MDJGR88qV/dtrj1r
 lRWt/czhZCpF1uI3Ge8npH+i5LTbxm4b0owByc77izJWHdwQRwLIswkIVKh+F2GBXf5S
 kqYwbJ0LTZMEeXkwBhs7PcLDqsf8+NEem6C4PdC/rdGbi30EagfVFYJgDAXidYmrTPy+
 Y9vg==
X-Gm-Message-State: AC+VfDxueMYWULDkIX33zZqXBo7qJaDNecbTayfZR2ujpUVxY04Rk5ck
 PWddG+GSbOWIIBd45X+nSqG6Et88LsbcBg==
X-Google-Smtp-Source: ACHHUZ7aBT09JGq1ZUP+qf1beSjVT9Yn2NwVm9PfOTW0h2PofJc8UQjczDIG2kyzpYdoZPnTw412VW9RSIS1xA==
X-Received: from wonchungspecialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1440])
 (user=wonchung job=sendgmr) by 2002:a17:90a:9aa:b0:23d:30a:692b with SMTP id
 39-20020a17090a09aa00b0023d030a692bmr710483pjo.4.1682614726906; Thu, 27 Apr
 2023 09:58:46 -0700 (PDT)
Date: Thu, 27 Apr 2023 16:58:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230427165813.2844530-1-wonchung@google.com>
Subject: [PATCH v6] drm/sysfs: Link DRM connectors to corresponding Type-C
 connectors
From: Won Chung <wonchung@google.com>
To: wonchung@google.com, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com, gildekel@chromium.org, 
 seanpaul@chromium.org, daniel@ffwll.ch, navaremanasi@chromium.org, 
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
and utilize more complex information. ChromeOS intend to use this
information for metrics collection. For example, we want to tell which
port is deriving which displays. Also, combined with USB PD information,
we can tell whether user is charging their device through display.
Chromium patch for parsing the symlink from the kernel is at
http://crrev.com/c/4317207.

We already have a framework in typec port-mapper.c where it goes through
component devices and runs the bind functions for those with matching
_PLD (physical location of device).
https://elixir.bootlin.com/linux/v5.18.1/source/drivers/usb/typec/port-mapper.c
Since _PLD is ACPI specific field, this linking would only work on ACPI
x86 as long as _PLD field for Type-C connectors and DRM connectors are
correctly added to the firmware.

Currently, USB ports and USB4 ports are added as components to create a
symlink with Type C connector.
USB:
https://lore.kernel.org/all/20211223082349.45616-1-heikki.krogerus@linux.intel.com/
USB4:
https://lore.kernel.org/all/20220418175932.1809770-3-wonchung@google.com/
So, we follow the same pattern in this patch.

Signed-off-by: Won Chung <wonchung@google.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Manasi Navare <navaremanasi@chromium.org>
---
Changes from v5:
- Add more details to the error message

Changes from v4: (4 months ago)
- Update commit message with an actual use case from cros userspace
- Move component_add to before ddc check which possibly returns
- Rebased

Changes from v3:
- Append to the commit message on why this patch is needed

Changes from v2:
- Resend the patch to dri-devel list

Changes from v1:
- Fix multiple lines to single line


 drivers/gpu/drm/drm_sysfs.c | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 183130355997..bc869c6fa420 100644
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
 
 #include <drm/drm_accel.h>
@@ -96,6 +98,34 @@ static char *drm_devnode(const struct device *dev, umode_t *mode)
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
@@ -353,9 +383,16 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 
 	connector->kdev = kdev;
 
+	if (dev_fwnode(kdev)) {
+		r = component_add(kdev, &typec_connector_ops);
+		if (r)
+			drm_err(dev, "failed to add component to create link to typec connector\n");
+	}
+
 	if (connector->ddc)
 		return sysfs_create_link(&connector->kdev->kobj,
 				 &connector->ddc->dev.kobj, "ddc");
+
 	return 0;
 
 err_free:
@@ -371,6 +408,9 @@ void drm_sysfs_connector_remove(struct drm_connector *connector)
 	if (connector->ddc)
 		sysfs_remove_link(&connector->kdev->kobj, "ddc");
 
+	if (dev_fwnode(connector->kdev))
+		component_del(connector->kdev, &typec_connector_ops);
+
 	DRM_DEBUG("removing \"%s\" from sysfs\n",
 		  connector->name);
 
-- 
2.40.1.495.gc816e09b53d-goog

