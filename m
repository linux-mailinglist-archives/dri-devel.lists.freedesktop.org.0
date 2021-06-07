Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D443639E4CA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B7F6E94C;
	Mon,  7 Jun 2021 17:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CB16E948
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:06:21 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so441892pja.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fP6yyMrOxlowleWVIKvrc8DjWvcGHG8K7xtH5ir8+78=;
 b=f/U4BkDZp1VuKwYRQ1mAkZCh6VRutVSCEutT+zDKlMpa8ZQ6jiBjOcSz1JzSTipMr2
 E7Q0w16H5Uh1fdnMYxr5/d/yUx+DEs4WGmBPTHV2TKNuSH5q3gmvb2liIMDjZZE0rERO
 MQ1pKmJ3vsJZJ1ONfo9ZgWRpEy0y2HuslfEs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fP6yyMrOxlowleWVIKvrc8DjWvcGHG8K7xtH5ir8+78=;
 b=MgTHScX9RNsUrNaT7CQPJbppI6zW1UJwKH0QwBJ4DOYIZFnQDkuV5bLrFy/xV6/I1Y
 cxx+zbBpCt4ykHJ/gYPKzKE42xeG6byE4t5gORi0mVFB7wp40R+SGfHIlmw12CLDXgjW
 ntjY85zLNza899m/Gv1lpZXYNKuaqOpg3E04gDhTidpn/DuSft9txDCnYRrHhZPe6c8S
 gdzvMk/Np/SdgL8mPRCzm3ESNaDLTNfNe45HWLgjQEPVhfWDPRtymyuqYitzjvF36dq9
 tt5L1pdJPRbaOD2oCsnG2MXXzVDGFw1kj0xRAus2g2SqGQCRT9XoXRz30c/53VMI+pce
 4qAw==
X-Gm-Message-State: AOAM532my4xv0qtCc+qxogPHLJXVl4dq14oBTcnJ8u4w42lxUCgKdVDy
 1yOycDBkhywCrryGj2ddOY9CjA==
X-Google-Smtp-Source: ABdhPJxf2FNb6iO/UZpz0gLz0a8MML3KIy46rwiBHC2JHkl3jtWREZv5Jfy5DtxHVXe0oCUbFSoVhw==
X-Received: by 2002:a17:90a:af8b:: with SMTP id
 w11mr21480873pjq.228.1623085581080; 
 Mon, 07 Jun 2021 10:06:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f656:ffce:6348:a42a])
 by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:06:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 04/11] drm: Introduce the DP AUX bus
Date: Mon,  7 Jun 2021 10:05:48 -0700
Message-Id: <20210607100234.v9.4.I787c9ba09ed5ce12500326ded73a4f7c9265b1b3@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
MIME-Version: 1.0
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
Cc: robdclark@chromium.org, Rajeev Nandan <rajeevny@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historically "simple" eDP panels have been handled by panel-simple
which is a basic platform_device. In the device tree, the panel node
was at the top level and not connected to anything else.

Let's change it so that, instead, panels can be represented as being
children of the "DP AUX bus". Essentially we're saying that the
hierarchy that we're going to represent is the "control" connections
between devices. The DP AUX bus is a control bus provided by an eDP
controller (the parent) and consumed by a device like a panel (the
child).

The primary incentive here is to cleanly provide the panel driver the
ability to communicate over the AUX bus while handling lifetime issues
properly. The panel driver may want the AUX bus for controlling the
backlight or querying the panel's EDID.

The idea for this bus's design was hashed out over IRC [1].

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Rajeev Nandan <rajeevny@codeaurora.org>
Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
There's a whole lot of boilerplate code here. I've tried my best to
grok what all of it should be, drawing inspiration from other similar
bus drivers (auxiliary, i2c, serdev, platform) and I've tried to test
several of the corner cases, but I can't actually believe that I've
touched every code path. Please yell if you see something dumb.

(no changes since v8)

Changes in v8:
- Allow dp-aux-bus to be a module to fix allmodconfig builds

Changes in v7:
- Patch introducing the DP AUX bus is new for v7.

 drivers/gpu/drm/Kconfig          |   5 +
 drivers/gpu/drm/Makefile         |   2 +
 drivers/gpu/drm/drm_dp_aux_bus.c | 326 +++++++++++++++++++++++++++++++
 include/drm/drm_dp_aux_bus.h     |  57 ++++++
 4 files changed, 390 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dp_aux_bus.c
 create mode 100644 include/drm/drm_dp_aux_bus.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 7ff89690a976..1366d8d4610a 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -35,6 +35,11 @@ config DRM_MIPI_DSI
 	bool
 	depends on DRM
 
+config DRM_DP_AUX_BUS
+	tristate
+	depends on DRM
+	depends on OF
+
 config DRM_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index a118692a6df7..12e6f4e485ed 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -33,6 +33,8 @@ drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 
+obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
+
 drm_vram_helper-y := drm_gem_vram_helper.o
 obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
 
diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/drm_dp_aux_bus.c
new file mode 100644
index 000000000000..d0e44de287d4
--- /dev/null
+++ b/drivers/gpu/drm/drm_dp_aux_bus.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2021 Google Inc.
+ *
+ * The DP AUX bus is used for devices that are connected over a DisplayPort
+ * AUX bus. The devices on the far side of the bus are referred to as
+ * endpoints in this code.
+ *
+ * Commonly there is only one device connected to the DP AUX bus: a panel.
+ * Though historically panels (even DP panels) have been modeled as simple
+ * platform devices, putting them under the DP AUX bus allows the panel driver
+ * to perform transactions on that bus.
+ */
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include <drm/drm_dp_aux_bus.h>
+#include <drm/drm_dp_helper.h>
+
+
+/**
+ * dp_aux_ep_match() - The match function for the dp_aux_bus.
+ * @dev: The device to match.
+ * @drv: The driver to try to match against.
+ *
+ * At the moment, we just match on device tree.
+ *
+ * Return: True if this driver matches this device; false otherwise.
+ */
+static int dp_aux_ep_match(struct device *dev, struct device_driver *drv)
+{
+	return !!of_match_device(drv->of_match_table, dev);
+}
+
+/**
+ * dp_aux_ep_probe() - The probe function for the dp_aux_bus.
+ * @dev: The device to probe.
+ *
+ * Calls through to the endpoint driver probe.
+ *
+ * Return: 0 if no error or negative error code.
+ */
+static int dp_aux_ep_probe(struct device *dev)
+{
+	struct dp_aux_ep_driver *aux_ep_drv = to_dp_aux_ep_drv(dev->driver);
+	struct dp_aux_ep_device *aux_ep = to_dp_aux_ep_dev(dev);
+	int ret;
+
+	ret = dev_pm_domain_attach(dev, true);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to attach to PM Domain\n");
+
+	ret = aux_ep_drv->probe(aux_ep);
+	if (ret)
+		dev_pm_domain_detach(dev, true);
+
+	return ret;
+}
+
+/**
+ * dp_aux_ep_remove() - The remove function for the dp_aux_bus.
+ * @dev: The device to remove.
+ *
+ * Calls through to the endpoint driver remove.
+ *
+ * Return: 0 if no error or negative error code.
+ */
+static int dp_aux_ep_remove(struct device *dev)
+{
+	struct dp_aux_ep_driver *aux_ep_drv = to_dp_aux_ep_drv(dev->driver);
+	struct dp_aux_ep_device *aux_ep = to_dp_aux_ep_dev(dev);
+
+	if (aux_ep_drv->remove)
+		aux_ep_drv->remove(aux_ep);
+	dev_pm_domain_detach(dev, true);
+
+	return 0;
+}
+
+/**
+ * dp_aux_ep_shutdown() - The shutdown function for the dp_aux_bus.
+ * @dev: The device to shutdown.
+ *
+ * Calls through to the endpoint driver shutdown.
+ */
+static void dp_aux_ep_shutdown(struct device *dev)
+{
+	struct dp_aux_ep_driver *aux_ep_drv;
+
+	if (!dev->driver)
+		return;
+
+	aux_ep_drv = to_dp_aux_ep_drv(dev->driver);
+	if (aux_ep_drv->shutdown)
+		aux_ep_drv->shutdown(to_dp_aux_ep_dev(dev));
+}
+
+static struct bus_type dp_aux_bus_type = {
+	.name		= "dp-aux",
+	.match		= dp_aux_ep_match,
+	.probe		= dp_aux_ep_probe,
+	.remove		= dp_aux_ep_remove,
+	.shutdown	= dp_aux_ep_shutdown,
+};
+
+static ssize_t modalias_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	return of_device_modalias(dev, buf, PAGE_SIZE);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *dp_aux_ep_dev_attrs[] = {
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(dp_aux_ep_dev);
+
+/**
+ * dp_aux_ep_dev_release() - Free memory for the dp_aux_ep device
+ * @dev: The device to free.
+ *
+ * Return: 0 if no error or negative error code.
+ */
+static void dp_aux_ep_dev_release(struct device *dev)
+{
+	kfree(to_dp_aux_ep_dev(dev));
+}
+
+static struct device_type dp_aux_device_type_type = {
+	.groups		= dp_aux_ep_dev_groups,
+	.uevent		= of_device_uevent_modalias,
+	.release	= dp_aux_ep_dev_release,
+};
+
+/**
+ * of_dp_aux_ep_destroy() - Destroy an DP AUX endpoint device
+ * @dev: The device to destroy.
+ * @data: Not used
+ *
+ * This is just used as a callback by of_dp_aux_depopulate_ep_devices() and
+ * is called for _all_ of the child devices of the device providing the AUX bus.
+ * We'll only act on those that are of type "dp_aux_bus_type".
+ *
+ * This function is effectively an inverse of what's in the loop
+ * in of_dp_aux_populate_ep_devices().
+ *
+ * Return: 0 if no error or negative error code.
+ */
+static int of_dp_aux_ep_destroy(struct device *dev, void *data)
+{
+	struct device_node *np = dev->of_node;
+
+	if (dev->bus != &dp_aux_bus_type)
+		return 0;
+
+	if (!of_node_check_flag(np, OF_POPULATED))
+		return 0;
+
+	of_node_clear_flag(np, OF_POPULATED);
+	of_node_put(np);
+
+	device_unregister(dev);
+
+	return 0;
+}
+
+/**
+ * of_dp_aux_depopulate_ep_devices() - Undo of_dp_aux_populate_ep_devices
+ * @aux: The AUX channel whose devices we want to depopulate
+ *
+ * This will destroy all devices that were created
+ * by of_dp_aux_populate_ep_devices().
+ */
+void of_dp_aux_depopulate_ep_devices(struct drm_dp_aux *aux)
+{
+	device_for_each_child_reverse(aux->dev, NULL, of_dp_aux_ep_destroy);
+}
+EXPORT_SYMBOL_GPL(of_dp_aux_depopulate_ep_devices);
+
+/**
+ * of_dp_aux_populate_ep_devices() - Populate the endpoint devices on the DP AUX
+ * @aux: The AUX channel whose devices we want to populate. It is required that
+ *       drm_dp_aux_init() has already been called for this AUX channel.
+ *
+ * This will populate all the devices under the "aux-bus" node of the device
+ * providing the AUX channel (AKA aux->dev).
+ *
+ * When this function finishes, it is _possible_ (but not guaranteed) that
+ * our sub-devices will have finished probing. It should be noted that if our
+ * sub-devices return -EPROBE_DEFER that we will not return any error codes
+ * ourselves but our sub-devices will _not_ have actually probed successfully
+ * yet. There may be other cases (maybe added in the future?) where sub-devices
+ * won't have been probed yet when this function returns, so it's best not to
+ * rely on that.
+ *
+ * If this function succeeds you should later make sure you call
+ * of_dp_aux_depopulate_ep_devices() to undo it, or just use the devm version
+ * of this function.
+ *
+ * Return: 0 if no error or negative error code.
+ */
+int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+{
+	struct device_node *bus, *np;
+	struct dp_aux_ep_device *aux_ep;
+	int ret;
+
+	/* drm_dp_aux_init() should have been called already; warn if not */
+	WARN_ON_ONCE(!aux->ddc.algo);
+
+	if (!aux->dev->of_node)
+		return 0;
+
+	bus = of_get_child_by_name(aux->dev->of_node, "aux-bus");
+	if (!bus)
+		return 0;
+
+	for_each_available_child_of_node(bus, np) {
+		if (of_node_test_and_set_flag(np, OF_POPULATED))
+			continue;
+
+		aux_ep = kzalloc(sizeof(*aux_ep), GFP_KERNEL);
+		aux_ep->aux = aux;
+
+		aux_ep->dev.parent = aux->dev;
+		aux_ep->dev.bus = &dp_aux_bus_type;
+		aux_ep->dev.type = &dp_aux_device_type_type;
+		aux_ep->dev.of_node = of_node_get(np);
+		dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
+
+		ret = device_register(&aux_ep->dev);
+		if (ret) {
+			dev_err(aux->dev, "Failed to create AUX EP for %pOF: %d\n", np, ret);
+			of_node_clear_flag(np, OF_POPULATED);
+			of_node_put(np);
+
+			/*
+			 * As per docs of device_register(), call this instead
+			 * of kfree() directly for error cases.
+			 */
+			put_device(&aux_ep->dev);
+
+			/*
+			 * Following in the footsteps of of_i2c_register_devices(),
+			 * we won't fail the whole function here--we'll just
+			 * continue registering any other devices we find.
+			 */
+		}
+	}
+
+	of_node_put(bus);
+
+	return 0;
+}
+
+static void of_dp_aux_depopulate_ep_devices_void(void *data)
+{
+	of_dp_aux_depopulate_ep_devices(data);
+}
+
+/**
+ * devm_of_dp_aux_populate_ep_devices() - devm wrapper for of_dp_aux_populate_ep_devices()
+ * @aux: The AUX channel whose devices we want to populate
+ *
+ * Handles freeing w/ devm on the device "aux->dev".
+ *
+ * Return: 0 if no error or negative error code.
+ */
+int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux)
+{
+	int ret;
+
+	ret = of_dp_aux_populate_ep_devices(aux);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(aux->dev,
+					of_dp_aux_depopulate_ep_devices_void,
+					aux);
+}
+EXPORT_SYMBOL_GPL(devm_of_dp_aux_populate_ep_devices);
+
+int __dp_aux_dp_driver_register(struct dp_aux_ep_driver *drv, struct module *owner)
+{
+	drv->driver.owner = owner;
+	drv->driver.bus = &dp_aux_bus_type;
+
+	return driver_register(&drv->driver);
+
+}
+EXPORT_SYMBOL_GPL(__dp_aux_dp_driver_register);
+
+void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *drv)
+{
+	driver_unregister(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(dp_aux_dp_driver_unregister);
+
+static int __init dp_aux_bus_init(void)
+{
+	int ret;
+
+	ret = bus_register(&dp_aux_bus_type);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void __exit dp_aux_bus_exit(void)
+{
+	bus_unregister(&dp_aux_bus_type);
+}
+
+subsys_initcall(dp_aux_bus_init);
+module_exit(dp_aux_bus_exit);
+
+MODULE_AUTHOR("Douglas Anderson <dianders@chromium.org>");
+MODULE_DESCRIPTION("DRM DisplayPort AUX bus");
+MODULE_LICENSE("GPL v2");
diff --git a/include/drm/drm_dp_aux_bus.h b/include/drm/drm_dp_aux_bus.h
new file mode 100644
index 000000000000..4f19b20b1dd6
--- /dev/null
+++ b/include/drm/drm_dp_aux_bus.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2021 Google Inc.
+ *
+ * The DP AUX bus is used for devices that are connected over a DisplayPort
+ * AUX bus. The devices on the far side of the bus are referred to as
+ * endpoints in this code.
+ */
+
+#ifndef _DP_AUX_BUS_H_
+#define _DP_AUX_BUS_H_
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+
+/**
+ * struct dp_aux_ep_device - Main dev structure for DP AUX endpoints
+ *
+ * This is used to instantiate devices that are connected via a DP AUX
+ * bus. Usually the device is a panel, but conceivable other devices could
+ * be hooked up there.
+ */
+struct dp_aux_ep_device {
+	/** @dev: The normal dev pointer */
+	struct device dev;
+	/** @aux: Pointer to the aux bus */
+	struct drm_dp_aux *aux;
+};
+
+struct dp_aux_ep_driver {
+	int (*probe)(struct dp_aux_ep_device *aux_ep);
+	void (*remove)(struct dp_aux_ep_device *aux_ep);
+	void (*shutdown)(struct dp_aux_ep_device *aux_ep);
+	struct device_driver driver;
+};
+
+static inline struct dp_aux_ep_device *to_dp_aux_ep_dev(struct device *dev)
+{
+	return container_of(dev, struct dp_aux_ep_device, dev);
+}
+
+static inline struct dp_aux_ep_driver *to_dp_aux_ep_drv(struct device_driver *drv)
+{
+	return container_of(drv, struct dp_aux_ep_driver, driver);
+}
+
+int of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux);
+void of_dp_aux_depopulate_ep_devices(struct drm_dp_aux *aux);
+int devm_of_dp_aux_populate_ep_devices(struct drm_dp_aux *aux);
+
+#define dp_aux_dp_driver_register(aux_ep_drv) \
+	__dp_aux_dp_driver_register(aux_ep_drv, THIS_MODULE)
+int __dp_aux_dp_driver_register(struct dp_aux_ep_driver *aux_ep_drv,
+				struct module *owner);
+void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *aux_ep_drv);
+
+#endif /* _DP_AUX_BUS_H_ */
-- 
2.32.0.rc1.229.g3e70b5a671-goog

