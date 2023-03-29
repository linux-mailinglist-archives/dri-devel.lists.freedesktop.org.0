Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02056CCF76
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 03:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C55510E0B5;
	Wed, 29 Mar 2023 01:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1610E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 01:23:29 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-541942bfdccso139599277b3.14
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 18:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680053008;
 h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=N7yaWZOV98pN1e0RutJtwqRQeyHTjDNf5r+4T28ooxk=;
 b=fzxE7ReWbsp9gCDxcGY8m0OEUYwNaoDcJ7yIuAmyHD3rYLrwastEHnK7qiMZVudOlE
 JDq+aLM1ZgG0DHYLK92Hz1XUZVF9Y04Yh2ghDQE/u/DrDRdcwecYsXMz6R1duGVEPZc/
 rEFJQA9Fm2UMAKrusvXj3uXzCZzfnh7bBLpxZ728mj60XXdlmxg7wzUdcaipLrKywqhL
 lTKJCm2s73Hown+Rnm12KMPmYuDSci2KGjP5cZwViArQORMCJNysgfyWy3odWdfY9Y4m
 XB6ZMFwFa9KTgWETiHxTHysZrOc9FFdYASWCQGtOlWgYHmN0M7StXEjO7S/4zlKrWOlB
 qyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680053008;
 h=to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N7yaWZOV98pN1e0RutJtwqRQeyHTjDNf5r+4T28ooxk=;
 b=FIBj5YahMbPZnH7Ik2rcJaRIMPsQZHTIFoXl0gOYga+6wxA0bVFBk8rlgXLUHRR7p8
 /8VtU0T3K8Emc8T+6sEaFdp0PxTsUd+q5/+5TfpieUakrp9GgqazcQXX6qNh8WTnfRF9
 Abgj+2GDJQRNC8EX6PWNvDHnC1FC/b3kK7nN2XW7AhwPEmO9Vn4RaOPzGYlHOqbgNAAB
 T2abnCt6ew+6O34c50d/W8gemyPMLDtT45go2YCcTHO9IlH28Cq1P+1OplgrB8sFA/0P
 Oa3qTA43Hld2b25c0kcHvvCuyq3WjJFscIKXx5TKJ24LUeAneUiJI8yiMv9e4vz2Lgx5
 ijPQ==
X-Gm-Message-State: AAQBX9d+C3gj/Zuhk5Egiy1W5hLbKI/vjmLtFQb4uf8p3nVcbzMNki2j
 jIH+ktRY1nss5NDFkubyw1JC5//h35M3Tg==
X-Google-Smtp-Source: AKy350YbN/ihFhyFpjgfxZYiVFlZsBshiulBLleWFswDVgz2/MMTdw5Da/eIuHEwE9TcRgrT4TPhElR7T2sDOQ==
X-Received: from wonchungspecialist.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1440])
 (user=wonchung job=sendgmr) by 2002:a05:6902:18cd:b0:b74:6c88:7bff with SMTP
 id ck13-20020a05690218cd00b00b746c887bffmr9437660ybb.0.1680053008235; Tue, 28
 Mar 2023 18:23:28 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:21:47 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230329012147.1908231-1-wonchung@google.com>
Subject: [PATCH v5] drm/sysfs: Link DRM connectors to corresponding Type-C
 connectors
From: Won Chung <wonchung@google.com>
To: wonchung@google.com, bleung@google.com, pmalani@chromium.org, 
 heikki.krogerus@linux.intel.com, imre.deak@intel.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com, 
 gildekel@chromium.org, seanpaul@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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
---
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
index 183130355997..c21312e87aa2 100644
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
+			drm_err(dev, "failed to add component\n");
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
2.40.0.348.gf938b09366-goog

