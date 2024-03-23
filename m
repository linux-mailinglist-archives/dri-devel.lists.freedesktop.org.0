Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F55887982
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 17:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D740C10E34D;
	Sat, 23 Mar 2024 16:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H6Z8QuN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676F410E34D
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 16:44:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C80ECCE069A;
 Sat, 23 Mar 2024 16:44:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB83C433B1;
 Sat, 23 Mar 2024 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711212271;
 bh=qgss4wmPeBO4mgK11p8/bjoZvc4VOd4Jab5WKK2s68k=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H6Z8QuN0qLSAkYgkJfTEpAtG3yJH11UkMPNfp54Efv/CnDWLZVtS89hRKJb+G11aY
 0IwESkNng1DTb00+bD35+Q5bnr3b2eGN3gPfErprUNbjVHVIBpa3ceztt6usrcboSG
 s9/O9l+vk/0Gzw0m6yFTVi+HhC5IjJbgY6ousuIxqQKp0VpgAg9Qvw+DAa+mPyjWvF
 fi/Cbb6t29WqbueVVPoUksRzWsPjO592I1rDDhimJzwJjfF69dLpBVo/alzHNxx2BK
 3KbNWm8tcTB5YirP7tPIcsJsxVIlfvvuFiVhPRl+BlS9hJKeO/lr6XovbTdOhHlirM
 j8RUy16CDYOsA==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
 arm@kernel.org, =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Bamvor Jian Zhang <bamv2005@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, James Seo <james@equiv.tech>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 James Clark <james.clark@arm.com>, Eddie James <eajames@linux.ibm.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v5 08/11] devm-helpers: Add resource managed version of
 debugfs directory create function
Date: Sat, 23 Mar 2024 17:43:56 +0100
Message-ID: <20240323164359.21642-9-kabel@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240323164359.21642-1-kabel@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
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

A few drivers register a devm action to remove a debugfs directory,
implementing a one-liner function that calls debufs_remove_recursive().
Help drivers avoid this repeated implementations by adding managed
version of debugfs directory create function.

Use the new function devm_debugfs_create_dir() in the following
drivers:
  drivers/crypto/caam/ctrl.c
  drivers/gpu/drm/bridge/ti-sn65dsi86.c
  drivers/hwmon/hp-wmi-sensors.c
  drivers/hwmon/mr75203.c
  drivers/hwmon/pmbus/pmbus_core.c

Also use the action function devm_debugfs_dir_recursive_drop() in
driver
  drivers/gpio/gpio-mockup.c

As per Dan Williams' request [1], do not touch the driver
  drivers/cxl/mem.c

[1] https://lore.kernel.org/linux-gpio/65d7918b358a5_1ee3129432@dwillia2-mobl3.amr.corp.intel.com.notmuch/

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/crypto/caam/ctrl.c            | 16 +++--------
 drivers/gpio/gpio-mockup.c            | 11 ++------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 ++-------
 drivers/hwmon/hp-wmi-sensors.c        | 15 ++--------
 drivers/hwmon/mr75203.c               | 15 ++++------
 drivers/hwmon/pmbus/pmbus_core.c      | 16 ++++-------
 include/linux/devm-helpers.h          | 40 +++++++++++++++++++++++++++
 7 files changed, 61 insertions(+), 65 deletions(-)

diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
index bdf367f3f679..ea3ed9a17f1a 100644
--- a/drivers/crypto/caam/ctrl.c
+++ b/drivers/crypto/caam/ctrl.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/device.h>
+#include <linux/devm-helpers.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -604,11 +605,6 @@ static int init_clocks(struct device *dev, const struct caam_imx_data *data)
 	return devm_add_action_or_reset(dev, disable_clocks, ctrlpriv);
 }
 
-static void caam_remove_debugfs(void *root)
-{
-	debugfs_remove_recursive(root);
-}
-
 #ifdef CONFIG_FSL_MC_BUS
 static bool check_version(struct fsl_mc_version *mc_version, u32 major,
 			  u32 minor, u32 revision)
@@ -1058,13 +1054,9 @@ static int caam_probe(struct platform_device *pdev)
 	ctrlpriv->era = caam_get_era(perfmon);
 	ctrlpriv->domain = iommu_get_domain_for_dev(dev);
 
-	dfs_root = debugfs_create_dir(dev_name(dev), NULL);
-	if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-		ret = devm_add_action_or_reset(dev, caam_remove_debugfs,
-					       dfs_root);
-		if (ret)
-			return ret;
-	}
+	dfs_root = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
+	if (IS_ERR(dfs_root))
+		return PTR_ERR(dfs_root);
 
 	caam_debugfs_init(ctrlpriv, perfmon, dfs_root);
 
diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 455eecf6380e..adbe0fe09490 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -12,6 +12,7 @@
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
+#include <linux/devm-helpers.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -390,13 +391,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 	}
 }
 
-static void gpio_mockup_debugfs_cleanup(void *data)
-{
-	struct gpio_mockup_chip *chip = data;
-
-	debugfs_remove_recursive(chip->dbg_dir);
-}
-
 static void gpio_mockup_dispose_mappings(void *data)
 {
 	struct gpio_mockup_chip *chip = data;
@@ -480,7 +474,8 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 
 	gpio_mockup_debugfs_setup(dev, chip);
 
-	return devm_add_action_or_reset(dev, gpio_mockup_debugfs_cleanup, chip);
+	return devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
+					chip->dbg_dir);
 }
 
 static const struct of_device_id gpio_mockup_of_match[] = {
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..85987350f108 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -10,6 +10,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/devm-helpers.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
@@ -427,18 +428,12 @@ static int status_show(struct seq_file *s, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(status);
 
-static void ti_sn65dsi86_debugfs_remove(void *data)
-{
-	debugfs_remove_recursive(data);
-}
-
 static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 {
 	struct device *dev = pdata->dev;
 	struct dentry *debugfs;
-	int ret;
 
-	debugfs = debugfs_create_dir(dev_name(dev), NULL);
+	debugfs = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
 
 	/*
 	 * We might get an error back if debugfs wasn't enabled in the kernel
@@ -447,10 +442,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
 	if (IS_ERR_OR_NULL(debugfs))
 		return;
 
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove, debugfs);
-	if (ret)
-		return;
-
 	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
 }
 
diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index b5325d0e72b9..2a7c33763ce8 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -23,6 +23,7 @@
 
 #include <linux/acpi.h>
 #include <linux/debugfs.h>
+#include <linux/devm-helpers.h>
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/mutex.h>
@@ -1304,12 +1305,6 @@ static int current_reading_show(struct seq_file *seqf, void *ignored)
 }
 DEFINE_SHOW_ATTRIBUTE(current_reading);
 
-/* hp_wmi_devm_debugfs_remove - devm callback for debugfs cleanup */
-static void hp_wmi_devm_debugfs_remove(void *res)
-{
-	debugfs_remove_recursive(res);
-}
-
 /* hp_wmi_debugfs_init - create and populate debugfs directory tree */
 static void hp_wmi_debugfs_init(struct device *dev, struct hp_wmi_info *info,
 				struct hp_wmi_platform_events *pevents,
@@ -1320,21 +1315,15 @@ static void hp_wmi_debugfs_init(struct device *dev, struct hp_wmi_info *info,
 	struct dentry *debugfs;
 	struct dentry *entries;
 	struct dentry *dir;
-	int err;
 	u8 i;
 
 	/* dev_name() gives a not-very-friendly GUID for WMI devices. */
 	scnprintf(buf, sizeof(buf), "hp-wmi-sensors-%u", dev->id);
 
-	debugfs = debugfs_create_dir(buf, NULL);
+	debugfs = devm_debugfs_create_dir(dev, buf, NULL);
 	if (IS_ERR(debugfs))
 		return;
 
-	err = devm_add_action_or_reset(dev, hp_wmi_devm_debugfs_remove,
-				       debugfs);
-	if (err)
-		return;
-
 	entries = debugfs_create_dir("sensor", debugfs);
 
 	for (i = 0; i < icount; i++, info++) {
diff --git a/drivers/hwmon/mr75203.c b/drivers/hwmon/mr75203.c
index 50a8b9c3f94d..50f348fca108 100644
--- a/drivers/hwmon/mr75203.c
+++ b/drivers/hwmon/mr75203.c
@@ -10,6 +10,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/devm-helpers.h>
 #include <linux/hwmon.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
@@ -216,17 +217,11 @@ static const struct file_operations pvt_ts_coeff_j_fops = {
 	.llseek = default_llseek,
 };
 
-static void devm_pvt_ts_dbgfs_remove(void *data)
-{
-	struct pvt_device *pvt = (struct pvt_device *)data;
-
-	debugfs_remove_recursive(pvt->dbgfs_dir);
-	pvt->dbgfs_dir = NULL;
-}
-
 static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
 {
-	pvt->dbgfs_dir = debugfs_create_dir(dev_name(dev), NULL);
+	pvt->dbgfs_dir = devm_debugfs_create_dir(dev, dev_name(dev), NULL);
+	if (IS_ERR(pvt->dbgfs_dir))
+		return PTR_ERR(pvt->dbgfs_dir);
 
 	debugfs_create_u32("ts_coeff_h", 0644, pvt->dbgfs_dir,
 			   &pvt->ts_coeff.h);
@@ -237,7 +232,7 @@ static int pvt_ts_dbgfs_create(struct pvt_device *pvt, struct device *dev)
 	debugfs_create_file("ts_coeff_j", 0644, pvt->dbgfs_dir, pvt,
 			    &pvt_ts_coeff_j_fops);
 
-	return devm_add_action_or_reset(dev, devm_pvt_ts_dbgfs_remove, pvt);
+	return 0;
 }
 
 static umode_t pvt_is_visible(const void *data, enum hwmon_sensor_types type,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index cb4c65a7f288..88d27bb3b69a 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/devm-helpers.h>
 #include <linux/kernel.h>
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -3336,13 +3337,6 @@ static const struct file_operations pmbus_debugfs_ops_mfr = {
 	.open = simple_open,
 };
 
-static void pmbus_remove_debugfs(void *data)
-{
-	struct dentry *entry = data;
-
-	debugfs_remove_recursive(entry);
-}
-
 static int pmbus_init_debugfs(struct i2c_client *client,
 			      struct pmbus_data *data)
 {
@@ -3357,8 +3351,9 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * Create the debugfs directory for this device. Use the hwmon device
 	 * name to avoid conflicts (hwmon numbers are globally unique).
 	 */
-	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
-					   pmbus_debugfs_dir);
+	data->debugfs = devm_debugfs_create_dir(data->dev,
+						dev_name(data->hwmon_dev),
+						pmbus_debugfs_dir);
 	if (IS_ERR_OR_NULL(data->debugfs)) {
 		data->debugfs = NULL;
 		return -ENODEV;
@@ -3542,8 +3537,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 		}
 	}
 
-	return devm_add_action_or_reset(data->dev,
-					pmbus_remove_debugfs, data->debugfs);
+	return 0;
 }
 #else
 static int pmbus_init_debugfs(struct i2c_client *client,
diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
index 3805551fd433..feefe152c752 100644
--- a/include/linux/devm-helpers.h
+++ b/include/linux/devm-helpers.h
@@ -23,6 +23,7 @@
  * already ran.
  */
 
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/kconfig.h>
 #include <linux/irqdomain.h>
@@ -130,4 +131,43 @@ static inline int devm_irq_create_mapping(struct device *dev,
 	return virq;
 }
 
+static inline void devm_debugfs_dir_recursive_drop(void *res)
+{
+	debugfs_remove_recursive(res);
+}
+
+/**
+ * devm_debugfs_create_dir - Resource managed debugfs directory creation
+ * @dev:	Device which lifetime the directory is bound to
+ * @name:	a pointer to a string containing the name of the directory to
+ *		create
+ * @parent:	a pointer to the parent dentry for this file.  This should be a
+ *		directory dentry if set.  If this parameter is NULL, then the
+ *		directory will be created in the root of the debugfs filesystem.
+ *
+ * Create a debugfs directory which is automatically recursively removed when
+ * the driver is detached. A few drivers create debugfs directories which they
+ * want removed before driver is detached.
+ * devm_debugfs_create_dir() can be used to omit the explicit
+ * debugfs_remove_recursive() call when driver is detached.
+ */
+static inline struct dentry *
+devm_debugfs_create_dir(struct device *dev, const char *name,
+			struct dentry *parent)
+{
+	struct dentry *dentry;
+	int err;
+
+	dentry = debugfs_create_dir(name, parent);
+	if (IS_ERR(dentry))
+		return dentry;
+
+	err = devm_add_action_or_reset(dev, devm_debugfs_dir_recursive_drop,
+				       dentry);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	return dentry;
+}
+
 #endif
-- 
2.43.2

