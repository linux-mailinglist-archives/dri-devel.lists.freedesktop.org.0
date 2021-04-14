Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B450235F707
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB96E92C;
	Wed, 14 Apr 2021 15:11:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 108D36E924
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618413067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a9SUZclKZtAyGTbXthCCSYgOM7H6rX5/jKMPsjyqdYA=;
 b=LtMR3YmBZ+jrfNhfn3S4N8UOPSiLnPhXPf8mpUprlUmvwrpA5xiFJ8w2+m7EJv9iPuOzK3
 UrnZW0kDGh14PYaXlosuOswAtfLpGiDLXG0Z8q7Z0+F/27n49FEkFWu9N0Cl6zKE7M7cHr
 4bpfjhCkj/KORCQMPBoDSEc1O8Kkojw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-PUOldZ-8Pj6lK4VTzFhOvA-1; Wed, 14 Apr 2021 11:11:05 -0400
X-MC-Unique: PUOldZ-8Pj6lK4VTzFhOvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24A92881282;
 Wed, 14 Apr 2021 15:11:03 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729C05D6BA;
 Wed, 14 Apr 2021 15:10:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rajat Jain <rajatja@google.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Mark Gross <mgross@linux.intel.com>,
 Andy Shevchenko <andy@infradead.org>
Subject: [PATCH resend 2/9] drm: Add privacy-screen class
Date: Wed, 14 Apr 2021 17:10:42 +0200
Message-Id: <20210414151049.95828-3-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
References: <20210414151049.95828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Marco Trevisan <marco.trevisan@canonical.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sebastien Bacher <seb128@ubuntu.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <markpearson@lenovo.com>,
 Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some new laptops the LCD panel has a builtin electronic privacy-screen.
We want to export this functionality as a property on the drm connector
object. But often this functionality is not exposed on the GPU but on some
other (ACPI) device.

This commit adds a privacy-screen class allowing the driver for these
other devices to register themselves as a privacy-screen provider; and
allowing the drm/kms code to get a privacy-screen provider associated
with a specific GPU/connector combo.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/gpu/drm-kms-helpers.rst     |  15 +
 MAINTAINERS                               |   8 +
 drivers/gpu/drm/Kconfig                   |   5 +
 drivers/gpu/drm/Makefile                  |   1 +
 drivers/gpu/drm/drm_privacy_screen.c      | 426 ++++++++++++++++++++++
 include/drm/drm_privacy_screen_consumer.h |  27 ++
 include/drm/drm_privacy_screen_driver.h   |  80 ++++
 include/drm/drm_privacy_screen_machine.h  |  41 +++
 8 files changed, 603 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
 create mode 100644 include/drm/drm_privacy_screen_consumer.h
 create mode 100644 include/drm/drm_privacy_screen_driver.h
 create mode 100644 include/drm/drm_privacy_screen_machine.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 389892f36185..5d8715d2f998 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -423,3 +423,18 @@ Legacy CRTC/Modeset Helper Functions Reference
 
 .. kernel-doc:: drivers/gpu/drm/drm_crtc_helper.c
    :export:
+
+Privacy-screen class
+====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_privacy_screen.c
+   :doc: overview
+
+.. kernel-doc:: include/drm/drm_privacy_screen_driver.h
+   :internal:
+
+.. kernel-doc:: include/drm/drm_privacy_screen_machine.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_privacy_screen.c
+   :export:
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c45120759e6..8220295b2670 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6129,6 +6129,14 @@ F:	drivers/gpu/drm/drm_panel.c
 F:	drivers/gpu/drm/panel/
 F:	include/drm/drm_panel.h
 
+DRM PRIVACY-SCREEN CLASS
+M:	Hans de Goede <hdegoede@redhat.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/drm_privacy_screen*
+F:	include/drm/drm_privacy_screen*
+
 DRM TTM SUBSYSTEM
 M:	Christian Koenig <christian.koenig@amd.com>
 M:	Huang Rui <ray.huang@amd.com>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 3c16bd1afd87..da25ff3a0a34 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -474,3 +474,8 @@ config DRM_PANEL_ORIENTATION_QUIRKS
 config DRM_LIB_RANDOM
 	bool
 	default n
+
+# Separate option, used by drivers outside of drivers/gpu/drm
+config DRM_PRIVACY_SCREEN
+	tristate
+	default n
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 5279db4392df..9a802605249d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_DRM)	+= drm.o
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
+obj-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
 obj-y			+= arm/
 obj-$(CONFIG_DRM_TTM)	+= ttm/
 obj-$(CONFIG_DRM_SCHED)	+= scheduler/
diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
new file mode 100644
index 000000000000..6296fd46156c
--- /dev/null
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <drm/drm_privacy_screen_machine.h>
+#include <drm/drm_privacy_screen_consumer.h>
+#include <drm/drm_privacy_screen_driver.h>
+
+/**
+ * DOC: overview
+ *
+ * This class allows non KMS drivers, from e.g. drivers/platform/x86 to
+ * register a privacy-screen device, which the KMS drivers can then use
+ * to implement the standard privacy-screen properties, see
+ * :ref:`Standard Connector Properties<standard_connector_properties>`.
+ *
+ * KMS drivers using a privacy-screen class device are advised to use the
+ * drm_connector_attach_privacy_screen_provider() and
+ * drm_connector_update_privacy_screen() helpers for dealing with this.
+ */
+
+#define to_drm_privacy_screen(dev) \
+	container_of(dev, struct drm_privacy_screen, dev)
+
+static DEFINE_MUTEX(drm_privacy_screen_lookup_lock);
+static LIST_HEAD(drm_privacy_screen_lookup_list);
+
+static DEFINE_MUTEX(drm_privacy_screen_devs_lock);
+static LIST_HEAD(drm_privacy_screen_devs);
+
+/*** drm_privacy_screen_machine.h functions ***/
+
+/**
+ * drm_privacy_screen_lookup_add - add an entry to the static privacy-screen
+ *    lookup list
+ * @lookup: lookup list entry to add
+ *
+ * Add an entry to the static privacy-screen lookup list. Note the
+ * &struct list_head which is part of the &struct drm_privacy_screen_lookup
+ * gets added to a list owned by the privacy-screen core. So the passed in
+ * &struct drm_privacy_screen_lookup must not be free-ed until it is removed
+ * from the lookup list by calling drm_privacy_screen_lookup_remove().
+ */
+void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup)
+{
+	mutex_lock(&drm_privacy_screen_lookup_lock);
+	list_add(&lookup->list, &drm_privacy_screen_lookup_list);
+	mutex_unlock(&drm_privacy_screen_lookup_lock);
+}
+EXPORT_SYMBOL(drm_privacy_screen_lookup_add);
+
+/**
+ * drm_privacy_screen_lookup_remove - remove an entry to the static
+ *    privacy-screen lookup list
+ * @lookup: lookup list entry to remove
+ *
+ * Remove an entry previously added with drm_privacy_screen_lookup_add()
+ * from the static privacy-screen lookup list.
+ */
+void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup)
+{
+	mutex_lock(&drm_privacy_screen_lookup_lock);
+	list_del(&lookup->list);
+	mutex_unlock(&drm_privacy_screen_lookup_lock);
+}
+EXPORT_SYMBOL(drm_privacy_screen_lookup_remove);
+
+/*** drm_privacy_screen_consumer.h functions ***/
+
+static struct drm_privacy_screen *drm_privacy_screen_get_by_name(
+	const char *name)
+{
+	struct drm_privacy_screen *priv;
+	struct device *dev = NULL;
+
+	mutex_lock(&drm_privacy_screen_devs_lock);
+
+	list_for_each_entry(priv, &drm_privacy_screen_devs, list) {
+		if (strcmp(dev_name(&priv->dev), name) == 0) {
+			dev = get_device(&priv->dev);
+			break;
+		}
+	}
+
+	mutex_unlock(&drm_privacy_screen_devs_lock);
+
+	return dev ? to_drm_privacy_screen(dev) : NULL;
+}
+
+/**
+ * drm_privacy_screen_get - get a privacy-screen provider
+ * @dev: consumer-device for which to get a privacy-screen provider
+ * @con_id: (video)connector name for which to get a privacy-screen provider
+ *
+ * Get a privacy-screen provider for a privacy-screen attached to the
+ * display described by the @dev and @con_id parameters.
+ *
+ * Return:
+ * * A pointer to a &struct drm_privacy_screen on success.
+ * * ERR_PTR(-ENODEV) if no matching privacy-screen is found
+ * * ERR_PTR(-EPROBE_DEFER) if there is a matching privacy-screen,
+ *                          but it has not been registered yet.
+ */
+struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
+						  const char *con_id)
+{
+	const char *dev_id = dev ? dev_name(dev) : NULL;
+	struct drm_privacy_screen_lookup *l;
+	struct drm_privacy_screen *priv;
+	const char *provider = NULL;
+	int match, best = -1;
+
+	/*
+	 * For now we only support using a static lookup table, which is
+	 * populated by the drm_privacy_screen_arch_init() call. This should
+	 * be extended with device-tree / fw_node lookup when support is added
+	 * for device-tree using hardware with a privacy-screen.
+	 *
+	 * The lookup algorithm was shamelessly taken from the clock
+	 * framework:
+	 *
+	 * We do slightly fuzzy matching here:
+	 *  An entry with a NULL ID is assumed to be a wildcard.
+	 *  If an entry has a device ID, it must match
+	 *  If an entry has a connection ID, it must match
+	 * Then we take the most specific entry - with the following order
+	 * of precedence: dev+con > dev only > con only.
+	 */
+	mutex_lock(&drm_privacy_screen_lookup_lock);
+
+	list_for_each_entry(l, &drm_privacy_screen_lookup_list, list) {
+		match = 0;
+
+		if (l->dev_id) {
+			if (!dev_id || strcmp(l->dev_id, dev_id))
+				continue;
+
+			match += 2;
+		}
+
+		if (l->con_id) {
+			if (!con_id || strcmp(l->con_id, con_id))
+				continue;
+
+			match += 1;
+		}
+
+		if (match > best) {
+			provider = l->provider;
+			best = match;
+		}
+	}
+
+	mutex_unlock(&drm_privacy_screen_lookup_lock);
+
+	if (!provider)
+		return ERR_PTR(-ENODEV);
+
+	priv = drm_privacy_screen_get_by_name(provider);
+	if (!priv)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return priv;
+}
+EXPORT_SYMBOL(drm_privacy_screen_get);
+
+/**
+ * drm_privacy_screen_put - release a privacy-screen reference
+ * @priv: privacy screen reference to release
+ *
+ * Release a privacy-screen provider reference gotten through
+ * drm_privacy_screen_get(). May be called with a NULL or ERR_PTR,
+ * in which case it is a no-op.
+ */
+void drm_privacy_screen_put(struct drm_privacy_screen *priv)
+{
+	if (IS_ERR_OR_NULL(priv))
+		return;
+
+	put_device(&priv->dev);
+}
+EXPORT_SYMBOL(drm_privacy_screen_put);
+
+/**
+ * drm_privacy_screen_set_sw_state - set a privacy-screen's sw-state
+ * @priv: privacy screen to set the sw-state for
+ * @sw_state: new sw-state value to set
+ *
+ * Set the sw-state of a privacy screen. If the privacy-screen is not
+ * in a locked hw-state, then the actual and hw-state of the privacy-screen
+ * will be immediately updated to the new value. If the privacy-screen is
+ * in a locked hw-state, then the new sw-state will be remembered as the
+ * requested state to put the privacy-screen in when it becomes unlocked.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
+				    enum drm_privacy_screen_status sw_state)
+{
+	int ret = 0;
+
+	mutex_lock(&priv->lock);
+
+	if (!priv->ops) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/*
+	 * As per the DRM connector properties documentation, setting the
+	 * sw_state while the hw_state is locked is allowed. In this case
+	 * it is a no-op other then storing the new sw_state so that it
+	 * can be honored when the state gets unlocked.
+	 */
+	if (priv->hw_state >= PRIVACY_SCREEN_DISABLED_LOCKED) {
+		priv->sw_state = sw_state;
+		goto out;
+	}
+
+	ret = priv->ops->set_sw_state(priv, sw_state);
+out:
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+EXPORT_SYMBOL(drm_privacy_screen_set_sw_state);
+
+/**
+ * drm_privacy_screen_get_state - get privacy-screen's current state
+ * @priv: privacy screen to get the state for
+ * @sw_state_ret: address where to store the privacy-screens current sw-state
+ * @hw_state_ret: address where to store the privacy-screens current hw-state
+ *
+ * Get the current state of a privacy-screen, both the sw-state and the
+ * hw-state.
+ */
+void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
+				  enum drm_privacy_screen_status *sw_state_ret,
+				  enum drm_privacy_screen_status *hw_state_ret)
+{
+	mutex_lock(&priv->lock);
+	*sw_state_ret = priv->sw_state;
+	*hw_state_ret = priv->hw_state;
+	mutex_unlock(&priv->lock);
+}
+EXPORT_SYMBOL(drm_privacy_screen_get_state);
+
+/*** drm_privacy_screen_driver.h functions ***/
+
+static ssize_t sw_state_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
+	const char * const sw_state_names[] = {
+		"Disabled",
+		"Enabled",
+	};
+	ssize_t ret;
+
+	mutex_lock(&priv->lock);
+
+	if (!priv->ops)
+		ret = -ENODEV;
+	else if (WARN_ON(priv->sw_state >= ARRAY_SIZE(sw_state_names)))
+		ret = -ENXIO;
+	else
+		ret = sprintf(buf, "%s\n", sw_state_names[priv->sw_state]);
+
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+/*
+ * RO: Do not allow setting the sw_state through sysfs, this MUST be done
+ * through the drm_properties on the drm_connector.
+ */
+static DEVICE_ATTR_RO(sw_state);
+
+static ssize_t hw_state_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
+	const char * const hw_state_names[] = {
+		"Disabled",
+		"Enabled",
+		"Disabled, locked",
+		"Enabled, locked",
+	};
+	ssize_t ret;
+
+	mutex_lock(&priv->lock);
+
+	if (!priv->ops)
+		ret = -ENODEV;
+	else if (WARN_ON(priv->hw_state >= ARRAY_SIZE(hw_state_names)))
+		ret = -ENXIO;
+	else
+		ret = sprintf(buf, "%s\n", hw_state_names[priv->hw_state]);
+
+	mutex_unlock(&priv->lock);
+	return ret;
+}
+static DEVICE_ATTR_RO(hw_state);
+
+static struct attribute *drm_privacy_screen_attrs[] = {
+	&dev_attr_sw_state.attr,
+	&dev_attr_hw_state.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(drm_privacy_screen);
+
+static struct class drm_privacy_screen_class = {
+	.name = "privacy_screen",
+	.owner = THIS_MODULE,
+	.dev_groups = drm_privacy_screen_groups,
+};
+
+static void drm_privacy_screen_device_release(struct device *dev)
+{
+	struct drm_privacy_screen *priv = to_drm_privacy_screen(dev);
+
+	kfree(priv);
+}
+
+/**
+ * drm_privacy_screen_register - register a privacy-screen
+ * @parent: parent-device for the privacy-screen
+ * @ops: &struct drm_privacy_screen_ops pointer with ops for the privacy-screen
+ *
+ * Create and register a privacy-screen.
+ *
+ * Return:
+ * * A pointer to the created privacy-screen on success.
+ * * An ERR_PTR(errno) on failure.
+ */
+struct drm_privacy_screen *drm_privacy_screen_register(
+	struct device *parent, const struct drm_privacy_screen_ops *ops)
+{
+	struct drm_privacy_screen *priv;
+	int ret;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	mutex_init(&priv->lock);
+
+	priv->dev.class = &drm_privacy_screen_class;
+	priv->dev.parent = parent;
+	priv->dev.release = drm_privacy_screen_device_release;
+	dev_set_name(&priv->dev, "%s", dev_name(parent));
+	priv->ops = ops;
+
+	priv->ops->get_hw_state(priv);
+
+	ret = device_register(&priv->dev);
+	if (ret) {
+		put_device(&priv->dev);
+		return ERR_PTR(ret);
+	}
+
+	mutex_lock(&drm_privacy_screen_devs_lock);
+	list_add(&priv->list, &drm_privacy_screen_devs);
+	mutex_unlock(&drm_privacy_screen_devs_lock);
+
+	return priv;
+}
+EXPORT_SYMBOL(drm_privacy_screen_register);
+
+/**
+ * drm_privacy_screen_unregister - unregister privacy-screen
+ * @priv: privacy-screen to unregister
+ *
+ * Unregister a privacy-screen registered with drm_privacy_screen_register().
+ * May be called with a NULL or ERR_PTR, in which case it is a no-op.
+ */
+void drm_privacy_screen_unregister(struct drm_privacy_screen *priv)
+{
+	if (IS_ERR_OR_NULL(priv))
+		return;
+
+	mutex_lock(&drm_privacy_screen_devs_lock);
+	list_del(&priv->list);
+	mutex_unlock(&drm_privacy_screen_devs_lock);
+
+	mutex_lock(&priv->lock);
+	priv->ops = NULL;
+	mutex_unlock(&priv->lock);
+
+	device_unregister(&priv->dev);
+}
+EXPORT_SYMBOL(drm_privacy_screen_unregister);
+
+static int __init drm_privacy_screen_init(void)
+{
+	int ret;
+
+	ret = class_register(&drm_privacy_screen_class);
+	if (ret)
+		return ret;
+
+	drm_privacy_screen_arch_init();
+
+	return 0;
+}
+
+static void __exit drm_privacy_screen_exit(void)
+{
+	drm_privacy_screen_arch_exit();
+	class_unregister(&drm_privacy_screen_class);
+}
+
+subsys_initcall(drm_privacy_screen_init);
+module_exit(drm_privacy_screen_exit);
+
+MODULE_AUTHOR("Hans de Goede");
+MODULE_DESCRIPTION("DRM privacy-screen class");
+MODULE_LICENSE("GPL and additional rights");
diff --git a/include/drm/drm_privacy_screen_consumer.h b/include/drm/drm_privacy_screen_consumer.h
new file mode 100644
index 000000000000..169ba72bd60d
--- /dev/null
+++ b/include/drm/drm_privacy_screen_consumer.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#ifndef __DRM_PRIVACY_SCREEN_CONSUMER_H__
+#define __DRM_PRIVACY_SCREEN_CONSUMER_H__
+
+#include <linux/device.h>
+#include <drm/drm_connector.h>
+
+struct drm_privacy_screen;
+
+struct drm_privacy_screen *drm_privacy_screen_get(struct device *dev,
+						  const char *con_id);
+void drm_privacy_screen_put(struct drm_privacy_screen *priv);
+
+int drm_privacy_screen_set_sw_state(struct drm_privacy_screen *priv,
+				    enum drm_privacy_screen_status sw_state);
+void drm_privacy_screen_get_state(struct drm_privacy_screen *priv,
+				  enum drm_privacy_screen_status *sw_state_ret,
+				  enum drm_privacy_screen_status *hw_state_ret);
+
+#endif
diff --git a/include/drm/drm_privacy_screen_driver.h b/include/drm/drm_privacy_screen_driver.h
new file mode 100644
index 000000000000..5187ae52eb03
--- /dev/null
+++ b/include/drm/drm_privacy_screen_driver.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#ifndef __DRM_PRIVACY_SCREEN_DRIVER_H__
+#define __DRM_PRIVACY_SCREEN_DRIVER_H__
+
+#include <linux/device.h>
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <drm/drm_connector.h>
+
+struct drm_privacy_screen;
+
+/**
+ * struct drm_privacy_screen_ops - drm_privacy_screen operations
+ *
+ * Defines the operations which the privacy-screen class code may call.
+ * These functions should be implemented by the privacy-screen driver.
+ */
+struct drm_privacy_screen_ops {
+	/**
+	 * @set_sw_state: Called to request a change of the privacy-screen
+	 * state. The privacy-screen class code contains a check to avoid this
+	 * getting called when the hw_state reports the state is locked.
+	 * It is the driver's responsibility to update sw_state and hw_state.
+	 * This is always called with the drm_privacy_screen's lock held.
+	 */
+	int (*set_sw_state)(struct drm_privacy_screen *priv,
+			    enum drm_privacy_screen_status sw_state);
+	/**
+	 * @get_hw_state: Called to request that the driver gets the current
+	 * privacy-screen state from the hardware and then updates sw_state and
+	 * hw_state accordingly. This will be called by the core just before
+	 * the privacy-screen is registered in sysfs.
+	 */
+	void (*get_hw_state)(struct drm_privacy_screen *priv);
+};
+
+/**
+ * struct drm_privacy_screen - central privacy-screen structure
+ *
+ * Central privacy-screen structure, this contains the struct device used
+ * to register the screen in sysfs, the screen's state, ops, etc.
+ */
+struct drm_privacy_screen {
+	/** @dev: device used to register the privacy-screen in sysfs. */
+	struct device dev;
+	/** @lock: mutex protection all fields in this struct. */
+	struct mutex lock;
+	/** @list: privacy-screen devices list list-entry. */
+	struct list_head list;
+	/**
+	 * @ops: &struct drm_privacy_screen_ops for this privacy-screen.
+	 * This is NULL if the driver has unregistered the privacy-screen.
+	 */
+	const struct drm_privacy_screen_ops *ops;
+	/**
+	 * @sw_state: The privacy-screen's software state, see
+	 * :ref:`Standard Connector Properties<standard_connector_properties>`
+	 * for more info.
+	 */
+	enum drm_privacy_screen_status sw_state;
+	/**
+	 * @hw_state: The privacy-screen's hardware state, see
+	 * :ref:`Standard Connector Properties<standard_connector_properties>`
+	 * for more info.
+	 */
+	enum drm_privacy_screen_status hw_state;
+};
+
+struct drm_privacy_screen *drm_privacy_screen_register(
+	struct device *parent, const struct drm_privacy_screen_ops *ops);
+void drm_privacy_screen_unregister(struct drm_privacy_screen *priv);
+
+#endif
diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
new file mode 100644
index 000000000000..55f4b4fd8e4e
--- /dev/null
+++ b/include/drm/drm_privacy_screen_machine.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ */
+
+#ifndef __DRM_PRIVACY_SCREEN_MACHINE_H__
+#define __DRM_PRIVACY_SCREEN_MACHINE_H__
+
+#include <linux/list.h>
+
+/**
+ * struct drm_privacy_screen_lookup -  static privacy-screen lookup list entry
+ *
+ * Used for the static lookup-list for mapping privacy-screen consumer
+ * dev-connector pairs to a privacy-screen provider.
+ */
+struct drm_privacy_screen_lookup {
+	/** @list: Lookup list list-entry. */
+	struct list_head list;
+	/** @dev_id: Consumer device name or NULL to match all devices. */
+	const char *dev_id;
+	/** @con_id: Consumer connector name or NULL to match all connectors. */
+	const char *con_id;
+	/** @provider: dev_name() of the privacy_screen provider. */
+	const char *provider;
+};
+
+void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
+void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
+
+static inline void drm_privacy_screen_arch_init(void)
+{
+}
+static inline void drm_privacy_screen_arch_exit(void)
+{
+}
+
+#endif
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
