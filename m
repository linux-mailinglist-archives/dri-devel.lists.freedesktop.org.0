Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3938C1EBB
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF6810E5B3;
	Fri, 10 May 2024 07:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cKv4aZNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8C110E5A9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:11:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C3741C000A;
 Fri, 10 May 2024 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715325101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7prO++ZWIkCoDMrn6Uhrn59R5uZQF5zUa4NeJy+SNA=;
 b=cKv4aZNMdXs4VBDyHTtZhBKsaXL4Ww2i8eJQ8V+4PoXipqgV5TWB0ZOHDS9AJZrrp+2h+T
 yWln1ewmmoR7c+9QLN54qEVORM36FdcVEqxCQZn0F76Xk9rTu9uHVqatuFvP2fQP/z2G2T
 qBNFk5gsnvtz/tjxX2QlknT/GeE1zjE8UNcwRRXcnVNfNB2G0CbvP8L7egSa1ldRJ99bNe
 nGREvm/ULTYooJ5+tFSF+MkUSDKhqhxFymyGAIF2Qw4Wpa7Rlvzdxn7OhPSkOJBWt7gBtQ
 ehgOTLjYzRyHGl9LrX0XkIZc4CuvLrDFP0DFOum5lsjAQk9tipWsrkWZHK9H1w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 10 May 2024 09:10:41 +0200
Subject: [PATCH v2 5/5] misc: add ge-addon-connector driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
In-Reply-To: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Add a driver to support the runtime hot-pluggable add-on connector on the
GE SUNH device. This connector allows connecting and disconnecting an
add-on to/from the main device to augment its features. Connection and
disconnection can happen at runtime at any moment without notice.

Different add-on models can be connected, and each has an EEPROM with a
model identifier at a fixed address.

The add-on hardware is added and removed using device tree overlay loading
and unloading.

Co-developed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This commit is new in v2.
---
 MAINTAINERS                      |   1 +
 drivers/misc/Kconfig             |  15 ++
 drivers/misc/Makefile            |   1 +
 drivers/misc/ge-sunh-connector.c | 464 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 481 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 672c26372c92..0bdb4fc496b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9905,6 +9905,7 @@ F:	drivers/iio/pressure/mprls0025pa*
 HOTPLUG CONNECTOR FOR GE SUNH ADDONS
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
+F:	drivers/misc/ge-sunh-connector.c
 F:	Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
 
 HP BIOSCFG DRIVER
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 4fb291f0bf7c..99ef2eccbbaa 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -574,6 +574,21 @@ config NSM
 	  To compile this driver as a module, choose M here.
 	  The module will be called nsm.
 
+config GE_SUNH_CONNECTOR
+	tristate "GE SUNH hotplug add-on connector"
+	depends on OF
+	select OF_OVERLAY
+	select FW_LOADER
+	select NVMEM
+	select DRM_HOTPLUG_BRIDGE
+	help
+	  Driver for the runtime hot-pluggable add-on connector on the GE SUNH
+	  device. This connector allows connecting and disconnecting an add-on
+	  to/from the main device to augment its features. Connection and
+	  disconnection can be done at runtime at any moment without
+	  notice. Different add-on models can be connected, and each has an EEPROM
+	  with a model identifier at a fixed address.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index ea6ea5bbbc9c..d973de89bd19 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -68,3 +68,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
+obj-$(CONFIG_GE_SUNH_CONNECTOR)	+= ge-sunh-connector.o
diff --git a/drivers/misc/ge-sunh-connector.c b/drivers/misc/ge-sunh-connector.c
new file mode 100644
index 000000000000..a40bf4bb56bf
--- /dev/null
+++ b/drivers/misc/ge-sunh-connector.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * GE SUNH hotplug add-on connector
+ *
+ * Driver for the runtime hot-pluggable add-on connector on the GE SUNH
+ * device. Add-on connection is detected via GPIOs (+ a debugfs
+ * trigger). On connection, a "base" DT overlay is added that describes
+ * enough to reach the NVMEM cell with the model ID. Based on the ID, an
+ * add-on-specific overlay is loaded on top to describe everything else.
+ *
+ * Copyright (C) 2024, GE HealthCare
+ *
+ * Authors:
+ * Luca Ceresoli <luca.ceresoli@bootlin.com>
+ * Herve Codina <herve.codina@bootlin.com>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+
+enum sunh_conn_overlay_level {
+	SUNH_CONN_OVERLAY_BASE,
+	SUNH_CONN_OVERLAY_ADDON,
+	SUNH_CONN_OVERLAY_N_LEVELS
+};
+
+#define SUNH_CONN_N_STATUS_GPIOS 2
+static const char * const sunh_conn_status_gpio_name[SUNH_CONN_N_STATUS_GPIOS] = {
+	"plugged", "powergood"
+};
+
+struct sunh_conn {
+	struct device *dev;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *status_gpio[SUNH_CONN_N_STATUS_GPIOS];
+
+	bool plugged;
+	int ovcs_id[SUNH_CONN_OVERLAY_N_LEVELS];
+	struct mutex ovl_mutex; // serialize overlay code
+	struct notifier_block nvmem_nb;
+	struct work_struct nvmem_notifier_work;
+
+	struct platform_device *hpb_pdev;
+	struct dentry *debugfs_root;
+};
+
+static int sunh_conn_insert_overlay(struct sunh_conn *conn,
+				    enum sunh_conn_overlay_level level,
+				    const char *filename)
+{
+	const struct firmware *fw;
+	int err;
+
+	err = request_firmware(&fw, filename, conn->dev);
+	if (err)
+		return dev_err_probe(conn->dev, err, "Error requesting overlay %s", filename);
+
+	dev_dbg(conn->dev, "insert overlay %d: %s", level, filename);
+	err = of_overlay_fdt_apply(fw->data, fw->size, &conn->ovcs_id[level], NULL);
+	if (err) {
+		int err2;
+
+		dev_err_probe(conn->dev, err, "Failed to apply overlay %s\n", filename);
+
+		/* changeset may be partially applied */
+		err2 = of_overlay_remove(&conn->ovcs_id[level]);
+		if (err2 < 0)
+			dev_err_probe(conn->dev, err2,
+				      "Failed to remove failed overlay %s\n", filename);
+	}
+
+	release_firmware(fw);
+	return err;
+}
+
+static int sunh_conn_load_base_overlay(struct sunh_conn *conn)
+{
+	int err = 0;
+
+	mutex_lock(&conn->ovl_mutex);
+
+	if (conn->ovcs_id[0] != 0) {
+		dev_dbg(conn->dev, "base overlay already loaded\n");
+		goto out_unlock;
+	}
+
+	err = sunh_conn_insert_overlay(conn, 0, "imx8mp-sundv1-addon-base.dtbo");
+
+out_unlock:
+	mutex_unlock(&conn->ovl_mutex);
+	return err;
+}
+
+static int sunh_conn_load_addon_overlay(struct sunh_conn *conn)
+{
+	u8 addon_id;
+	const char *filename;
+	int err;
+
+	mutex_lock(&conn->ovl_mutex);
+
+	if (conn->ovcs_id[0] == 0) {
+		dev_dbg(conn->dev, "base overlay not loaded\n");
+		err = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (conn->ovcs_id[1] != 0) {
+		dev_dbg(conn->dev, "addon overlay already loaded\n");
+		err = -EEXIST;
+		goto out_unlock;
+	}
+
+	err = nvmem_cell_read_u8(conn->dev, "id", &addon_id);
+	if (err)
+		goto out_unlock;
+
+	dev_dbg(conn->dev, "Found add-on ID %d\n", addon_id);
+
+	switch (addon_id) {
+	case 23:
+		filename = "imx8mp-sundv1-addon-13.dtbo";
+		break;
+	case 24:
+		filename = "imx8mp-sundv1-addon-15.dtbo";
+		break;
+	case 25:
+		filename = "imx8mp-sundv1-addon-18.dtbo";
+		break;
+	default:
+		dev_warn(conn->dev, "Unknown add-on ID %d\n", addon_id);
+		err = -ENODEV;
+		goto out_unlock;
+	}
+
+	err = sunh_conn_insert_overlay(conn, 1, filename);
+
+out_unlock:
+	mutex_unlock(&conn->ovl_mutex);
+	return err;
+}
+
+static void sunh_conn_unload_overlays(struct sunh_conn *conn)
+{
+	int level = SUNH_CONN_OVERLAY_N_LEVELS;
+	int err;
+
+	mutex_lock(&conn->ovl_mutex);
+	while (level) {
+		level--;
+
+		if (conn->ovcs_id[level] == 0)
+			continue;
+
+		dev_dbg(conn->dev, "remove overlay %d (ovcs id %d)",
+			level, conn->ovcs_id[level]);
+
+		err = of_overlay_remove(&conn->ovcs_id[level]);
+		if (err)
+			dev_err_probe(conn->dev, err, "Failed to remove overlay %d\n", level);
+	}
+	mutex_unlock(&conn->ovl_mutex);
+}
+
+static void sunh_conn_reset(struct sunh_conn *conn, bool keep_reset)
+{
+	dev_dbg(conn->dev, "reset\n");
+
+	gpiod_set_value_cansleep(conn->reset_gpio, 1);
+
+	if (keep_reset)
+		return;
+
+	mdelay(10);
+	gpiod_set_value_cansleep(conn->reset_gpio, 0);
+	mdelay(10);
+}
+
+static int sunh_conn_detach(struct sunh_conn *conn)
+{
+	/* Cancel any pending NVMEM notification jobs */
+	cancel_work_sync(&conn->nvmem_notifier_work);
+
+	/* Unload previouly loaded overlays */
+	sunh_conn_unload_overlays(conn);
+
+	/* Set reset signal to have it set on next plug */
+	sunh_conn_reset(conn, true);
+
+	dev_info(conn->dev, "detached\n");
+	return 0;
+}
+
+static int sunh_conn_attach(struct sunh_conn *conn)
+{
+	int err;
+
+	/* Reset the plugged board in order to start from a stable state */
+	sunh_conn_reset(conn, false);
+
+	err = sunh_conn_load_base_overlay(conn);
+	if (err)
+		goto err;
+
+	/*
+	 * -EPROBE_DEFER can be due to NVMEM cell not yet available, so
+	 * don't give up, an NVMEM event could arrive later
+	 */
+	err = sunh_conn_load_addon_overlay(conn);
+	if (err && err != -EPROBE_DEFER)
+		goto err;
+
+	dev_info(conn->dev, "attached\n");
+	return 0;
+
+err:
+	sunh_conn_detach(conn);
+	return err;
+}
+
+static int sunh_conn_handle_event(struct sunh_conn *conn, bool plugged)
+{
+	int err;
+
+	if (plugged == conn->plugged)
+		return 0;
+
+	dev_info(conn->dev, "%s\n", plugged ? "connected" : "disconnected");
+
+	err = (plugged ?
+	       sunh_conn_attach(conn) :
+	       sunh_conn_detach(conn));
+
+	conn->plugged = plugged;
+
+	return err;
+}
+
+/*
+ * Return the current status of the connector as reported by the hardware.
+ *
+ * Returns:
+ * - 0 if not connected (any of the existing status GPIOs not asserted) or
+ *   no status GPIOs exist
+ * - 1 if connected in a stable manner (all status GPIOs are asserted)
+ * - a negative error code in case reading the GPIOs fail
+ */
+static int sunh_conn_get_connector_status(struct sunh_conn *conn)
+{
+	int status = 0;
+	int i;
+
+	for (i = 0; i < SUNH_CONN_N_STATUS_GPIOS; i++) {
+		int val;
+
+		if (!conn->status_gpio[i])
+			continue;
+
+		val = gpiod_get_value_cansleep(conn->status_gpio[i]);
+
+		if (val < 0) {
+			dev_err(conn->dev, "Error reading %s GPIO (%d)\n",
+				sunh_conn_status_gpio_name[i], val);
+			return val;
+		}
+
+		if (val == 0) {
+			dev_dbg(conn->dev, "%s GPIO deasserted\n",
+				sunh_conn_status_gpio_name[i]);
+			return 0;
+		}
+
+		status = 1;
+	}
+
+	return status;
+}
+
+static irqreturn_t sunh_conn_gpio_irq(int irq, void *data)
+{
+	struct sunh_conn *conn = data;
+	int conn_status;
+
+	conn_status = sunh_conn_get_connector_status(conn);
+	if (conn_status >= 0)
+		sunh_conn_handle_event(conn, conn_status);
+
+	return IRQ_HANDLED;
+}
+
+static int plugged_read(void *dat, u64 *val)
+{
+	struct sunh_conn *conn = dat;
+
+	*val = conn->plugged;
+
+	return 0;
+}
+
+static int plugged_write(void *dat, u64 val)
+{
+	struct sunh_conn *conn = dat;
+
+	if (val > 1)
+		return -EINVAL;
+
+	return sunh_conn_handle_event(conn, val);
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(plugged_fops, plugged_read, plugged_write, "%lld\n");
+
+static void sunh_conn_nvmem_notifier_work(struct work_struct *work)
+{
+	struct sunh_conn *conn = container_of(work, struct sunh_conn, nvmem_notifier_work);
+
+	sunh_conn_load_addon_overlay(conn);
+}
+
+static int sunh_conn_nvmem_notifier(struct notifier_block *nb, unsigned long action, void *arg)
+{
+	struct sunh_conn *conn = container_of(nb, struct sunh_conn, nvmem_nb);
+
+	if (action == NVMEM_CELL_ADD)
+		queue_work(system_power_efficient_wq, &conn->nvmem_notifier_work);
+
+	return NOTIFY_OK;
+}
+
+static int sunh_conn_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sunh_conn *conn;
+	int conn_status;
+	int err;
+	int i;
+
+	const struct platform_device_info hpb_info = {
+		.parent = dev,
+		.fwnode = dev->fwnode,
+		.of_node_reused = true,
+		.name = "hotplug-dsi-bridge",
+		.id = PLATFORM_DEVID_NONE,
+	};
+
+	/* Cannot load overlay from filesystem before rootfs is mounted */
+	if (system_state < SYSTEM_RUNNING)
+		return -EPROBE_DEFER;
+
+	conn = devm_kzalloc(dev, sizeof(*conn), GFP_KERNEL);
+	if (!conn)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, conn);
+	conn->dev = dev;
+
+	mutex_init(&conn->ovl_mutex);
+	INIT_WORK(&conn->nvmem_notifier_work, sunh_conn_nvmem_notifier_work);
+
+	conn->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(conn->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(conn->reset_gpio),
+				     "Error getting reset GPIO\n");
+
+	for (i = 0; i < SUNH_CONN_N_STATUS_GPIOS; i++) {
+		conn->status_gpio[i] =
+			devm_gpiod_get_optional(dev, sunh_conn_status_gpio_name[i], GPIOD_IN);
+		if (IS_ERR(conn->status_gpio[i]))
+			return dev_err_probe(dev, PTR_ERR(conn->status_gpio[i]),
+					     "Error getting %s GPIO\n",
+					     sunh_conn_status_gpio_name[i]);
+	}
+
+	conn->hpb_pdev = platform_device_register_full(&hpb_info);
+	if (IS_ERR(conn->hpb_pdev)) {
+		err = PTR_ERR(conn->hpb_pdev);
+		return dev_err_probe(dev, err, "Error registering DRM bridge\n");
+	}
+
+	conn->nvmem_nb.notifier_call = sunh_conn_nvmem_notifier;
+	err = nvmem_register_notifier(&conn->nvmem_nb);
+	if (err) {
+		dev_err_probe(dev, err, "Error registering NVMEM notifier\n");
+		goto err_unregister_drm_bridge;
+	}
+
+	for (i = 0; i < SUNH_CONN_N_STATUS_GPIOS; i++) {
+		if (conn->status_gpio[i]) {
+			err = devm_request_threaded_irq(dev, gpiod_to_irq(conn->status_gpio[i]),
+							NULL, sunh_conn_gpio_irq,
+							IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
+							IRQF_ONESHOT,
+							dev_name(dev), conn);
+			if (err) {
+				dev_err_probe(dev, err, "Error getting %s GPIO IRQ\n",
+					sunh_conn_status_gpio_name[i]);
+				goto err_nvmem_unregister_notifier;
+			}
+		}
+	}
+
+	conn_status = sunh_conn_get_connector_status(conn);
+	if (conn_status < 0) {
+		err = conn_status;
+		goto err_nvmem_unregister_notifier;
+	}
+
+	/* Ensure initial state is known and overlay loaded if plugged */
+	sunh_conn_handle_event(conn, conn_status);
+
+	conn->debugfs_root = debugfs_create_dir(dev_name(dev), NULL);
+	debugfs_create_file("plugged", 0644, conn->debugfs_root, conn, &plugged_fops);
+
+	return 0;
+
+err_nvmem_unregister_notifier:
+	nvmem_unregister_notifier(&conn->nvmem_nb);
+	cancel_work_sync(&conn->nvmem_notifier_work);
+err_unregister_drm_bridge:
+	platform_device_unregister(conn->hpb_pdev);
+	return err;
+}
+
+static void sunh_conn_remove(struct platform_device *pdev)
+{
+	struct sunh_conn *conn = platform_get_drvdata(pdev);
+
+	debugfs_remove(conn->debugfs_root);
+	sunh_conn_detach(conn);
+
+	nvmem_unregister_notifier(&conn->nvmem_nb);
+	cancel_work_sync(&conn->nvmem_notifier_work);
+
+	platform_device_unregister(conn->hpb_pdev);
+}
+
+static const struct of_device_id sunh_conn_dt_ids[] = {
+	{ .compatible = "ge,sunh-addon-connector" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, sunh_conn_dt_ids);
+
+static struct platform_driver sunh_conn_driver = {
+	.driver = {
+		.name = "sunh-addon-connector",
+		.of_match_table = sunh_conn_dt_ids,
+	},
+	.probe = sunh_conn_probe,
+	.remove_new = sunh_conn_remove,
+};
+module_platform_driver(sunh_conn_driver);
+
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
+MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
+MODULE_DESCRIPTION("GE SUNH hotplug add-on connector");
+MODULE_LICENSE("GPL");

-- 
2.34.1

