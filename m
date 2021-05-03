Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF10371847
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 17:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5546E8CD;
	Mon,  3 May 2021 15:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5838E6E8D0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 15:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620056825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2YpzZXtC800EVHW5pglD1kRww9nvy1A37XUBKTj8KAo=;
 b=VlKvRUE5Xm0bnYyC+Phf0niwl+aTgc0yDmwmoF0O/7f8GFVFlNwho6ilmxYeg7xVe+1efv
 ezB6v2GL1gvulU7J+3Es8c3eGWNFP3yGYUbtmAyLmhtJTXLOYbFUXO+sLuGWC/wVJQHiTd
 eXIXwRWMWnNOmJsRgOwzK1YqTyrJ/JY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-vKWxRQ1pNsmA8uK8pZQ5JQ-1; Mon, 03 May 2021 11:47:01 -0400
X-MC-Unique: vKWxRQ1pNsmA8uK8pZQ5JQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 897AC800D62;
 Mon,  3 May 2021 15:46:58 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C39C91007610;
 Mon,  3 May 2021 15:46:55 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 2/9] drm/connector: Add a fwnode pointer to drm_connector and
 register with ACPI
Date: Mon,  3 May 2021 17:46:40 +0200
Message-Id: <20210503154647.142551-3-hdegoede@redhat.com>
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a fwnode pointer to struct drm_connector and register an acpi_bus_type
for the connectors with the ACPI subsystem (when CONFIG_ACPI is enabled).

The adding of the fwnode pointer allows drivers to associate a fwnode
that represents a connector with that connector.

When the new fwnode pointer points to an ACPI-companion, then the new
acpi_bus_type will cause the ACPI subsys to bind the device instantiated
for the connector with the fwnode by calling acpi_bind_one(). This will
result in a firmware_node symlink under /sys/class/card#-<connecter-name>/
which helps to verify that the fwnode-s and connectors are properly
matched.

Co-authored-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_sysfs.c | 37 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 553024bcda8a..12cc649c44f0 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -10,6 +10,7 @@
  * Copyright (c) 2003-2004 IBM Corp.
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -56,6 +57,39 @@ static struct device_type drm_sysfs_device_connector = {
 
 struct class *drm_class;
 
+#ifdef CONFIG_ACPI
+static bool drm_connector_acpi_bus_match(struct device *dev)
+{
+	return dev->type == &drm_sysfs_device_connector;
+}
+
+static struct acpi_device *drm_connector_acpi_find_companion(struct device *dev)
+{
+	struct drm_connector *connector = to_drm_connector(dev);
+
+	return to_acpi_device_node(connector->fwnode);
+}
+
+static struct acpi_bus_type drm_connector_acpi_bus = {
+	.name = "drm_connector",
+	.match = drm_connector_acpi_bus_match,
+	.find_companion = drm_connector_acpi_find_companion,
+};
+
+static void drm_sysfs_acpi_register(void)
+{
+	register_acpi_bus_type(&drm_connector_acpi_bus);
+}
+
+static void drm_sysfs_acpi_unregister(void)
+{
+	unregister_acpi_bus_type(&drm_connector_acpi_bus);
+}
+#else
+static void drm_sysfs_acpi_register(void) { }
+static void drm_sysfs_acpi_unregister(void) { }
+#endif
+
 static char *drm_devnode(struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
@@ -89,6 +123,8 @@ int drm_sysfs_init(void)
 	}
 
 	drm_class->devnode = drm_devnode;
+
+	drm_sysfs_acpi_register();
 	return 0;
 }
 
@@ -101,6 +137,7 @@ void drm_sysfs_destroy(void)
 {
 	if (IS_ERR_OR_NULL(drm_class))
 		return;
+	drm_sysfs_acpi_unregister();
 	class_remove_file(drm_class, &class_attr_version.attr);
 	class_destroy(drm_class);
 	drm_class = NULL;
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 0261801af62c..d20bfd7576ed 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1254,6 +1254,8 @@ struct drm_connector {
 	struct device *kdev;
 	/** @attr: sysfs attributes */
 	struct device_attribute *attr;
+	/** @fwnode: associated fwnode supplied by platform firmware */
+	struct fwnode_handle *fwnode;
 
 	/**
 	 * @head:
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
