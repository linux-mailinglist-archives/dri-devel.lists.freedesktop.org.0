Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BC985FBB1
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 15:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A5110E970;
	Thu, 22 Feb 2024 14:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ln2qRtYf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F6D10E95C;
 Thu, 22 Feb 2024 14:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 88528CE2804;
 Thu, 22 Feb 2024 14:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C29C433F1;
 Thu, 22 Feb 2024 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708613928;
 bh=95qPQ4pyLbqmGifCgN9f24/iMYMKuT0p0puI4cqB+hE=;
 h=From:To:Cc:Subject:Date:From;
 b=ln2qRtYfLfs0kXHxuqnP8up9ncd9l1czd3XZZFhRJT3/3ilzggShkUxwRJtuGES3D
 Gr11XHaa1rWV9lqiyVw1sfMyZTAsGG/TXkPx6mA7KPpcoJD5fdKHqzqP5VfwNAXhzc
 pTb380CNPZSStK9QDyjU7HRiWbr6LTgJdhwxExFBWgf+jmwMhRPecjVebW7HQB7TX/
 39OsGu3Pq404RCI3CGT+QXsLOzqe6zYg+vfPaECFpUucXFWG7dJwwWAL5cBRKZ87PI
 Nawf6R1xME9bUmX9K37c69v4uByPyuwlQ8Yla0UlxAuOHq+5SNJf7AonMmK+KOmdox
 OKGLFxo3nwNIg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Aleksandr Mezin <mezin.alexander@gmail.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] devm-helpers: Add resource managed version of mutex init
Date: Thu, 22 Feb 2024 15:58:37 +0100
Message-ID: <20240222145838.12916-1-kabel@kernel.org>
X-Mailer: git-send-email 2.43.0
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

A few drivers are doing resource-managed mutex initialization by
implementing ad-hoc one-liner mutex dropping functions and using them
with devm_add_action_or_reset(). Help drivers avoid these repeated
one-liners by adding managed version of mutex initialization.

Use the new function devm_mutex_init() in the following drivers:
  drivers/gpio/gpio-pisosr.c
  drivers/gpio/gpio-sim.c
  drivers/gpu/drm/xe/xe_hwmon.c
  drivers/hwmon/nzxt-smart2.c
  drivers/leds/leds-is31fl319x.c
  drivers/power/supply/mt6370-charger.c
  drivers/power/supply/rt9467-charger.c

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/gpio/gpio-pisosr.c            |  9 ++-----
 drivers/gpio/gpio-sim.c               | 12 ++--------
 drivers/gpu/drm/xe/xe_hwmon.c         | 11 ++-------
 drivers/hwmon/nzxt-smart2.c           |  9 ++-----
 drivers/leds/leds-is31fl319x.c        |  9 ++-----
 drivers/power/supply/mt6370-charger.c | 11 +--------
 drivers/power/supply/rt9467-charger.c | 34 ++++-----------------------
 include/linux/devm-helpers.h          | 32 +++++++++++++++++++++++++
 8 files changed, 47 insertions(+), 80 deletions(-)

diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index e3013e778e15..dddbf37e855f 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -7,6 +7,7 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
@@ -116,11 +117,6 @@ static const struct gpio_chip template_chip = {
 	.can_sleep		= true,
 };
 
-static void pisosr_mutex_destroy(void *lock)
-{
-	mutex_destroy(lock);
-}
-
 static int pisosr_gpio_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -147,8 +143,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(gpio->load_gpio),
 				     "Unable to allocate load GPIO\n");
 
-	mutex_init(&gpio->lock);
-	ret = devm_add_action_or_reset(dev, pisosr_mutex_destroy, &gpio->lock);
+	ret = devm_mutex_init(dev, &gpio->lock);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index c4106e37e6db..fcfcaa4efe70 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -12,6 +12,7 @@
 #include <linux/completion.h>
 #include <linux/configfs.h>
 #include <linux/device.h>
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -307,13 +308,6 @@ static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
 	return len;
 }
 
-static void gpio_sim_mutex_destroy(void *data)
-{
-	struct mutex *lock = data;
-
-	mutex_destroy(lock);
-}
-
 static void gpio_sim_put_device(void *data)
 {
 	struct device *dev = data;
@@ -457,9 +451,7 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
 	if (ret)
 		return ret;
 
-	mutex_init(&chip->lock);
-	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
-				       &chip->lock);
+	ret = devm_mutex_init(dev, &chip->lock);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 174ed2185481..bb88ae1c196c 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/hwmon.h>
 #include <linux/types.h>
@@ -729,13 +730,6 @@ xe_hwmon_get_preregistration_info(struct xe_device *xe)
 		xe_hwmon_energy_get(hwmon, &energy);
 }
 
-static void xe_hwmon_mutex_destroy(void *arg)
-{
-	struct xe_hwmon *hwmon = arg;
-
-	mutex_destroy(&hwmon->hwmon_lock);
-}
-
 void xe_hwmon_register(struct xe_device *xe)
 {
 	struct device *dev = xe->drm.dev;
@@ -751,8 +745,7 @@ void xe_hwmon_register(struct xe_device *xe)
 
 	xe->hwmon = hwmon;
 
-	mutex_init(&hwmon->hwmon_lock);
-	if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
+	if (devm_mutex_init(dev, &hwmon->hwmon_lock))
 		return;
 
 	/* primary GT to access device level properties */
diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
index 7aa586eb74be..00bc89607673 100644
--- a/drivers/hwmon/nzxt-smart2.c
+++ b/drivers/hwmon/nzxt-smart2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2021 Aleksandr Mezin
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/hid.h>
 #include <linux/hwmon.h>
 #include <linux/math.h>
@@ -721,11 +722,6 @@ static int __maybe_unused nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
 	return init_device(drvdata, drvdata->update_interval);
 }
 
-static void mutex_fini(void *lock)
-{
-	mutex_destroy(lock);
-}
-
 static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 				 const struct hid_device_id *id)
 {
@@ -741,8 +737,7 @@ static int nzxt_smart2_hid_probe(struct hid_device *hdev,
 
 	init_waitqueue_head(&drvdata->wq);
 
-	mutex_init(&drvdata->mutex);
-	ret = devm_add_action_or_reset(&hdev->dev, mutex_fini, &drvdata->mutex);
+	ret = devm_mutex_init(&hdev->dev, &drvdata->mutex);
 	if (ret)
 		return ret;
 
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 66c65741202e..e9d7cf6a386c 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -8,6 +8,7 @@
  * effect LEDs.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
@@ -495,11 +496,6 @@ static inline int is31fl3196_db_to_gain(u32 dezibel)
 	return dezibel / IS31FL3196_AUDIO_GAIN_DB_STEP;
 }
 
-static void is31f1319x_mutex_destroy(void *lock)
-{
-	mutex_destroy(lock);
-}
-
 static int is31fl319x_probe(struct i2c_client *client)
 {
 	struct is31fl319x_chip *is31;
@@ -515,8 +511,7 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (!is31)
 		return -ENOMEM;
 
-	mutex_init(&is31->lock);
-	err = devm_add_action_or_reset(dev, is31f1319x_mutex_destroy, &is31->lock);
+	err = devm_mutex_init(dev, &is31->lock);
 	if (err)
 		return err;
 
diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index e24fce087d80..fa0517d0352d 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -766,13 +766,6 @@ static int mt6370_chg_init_psy(struct mt6370_priv *priv)
 	return PTR_ERR_OR_ZERO(priv->psy);
 }
 
-static void mt6370_chg_destroy_attach_lock(void *data)
-{
-	struct mutex *attach_lock = data;
-
-	mutex_destroy(attach_lock);
-}
-
 static void mt6370_chg_destroy_wq(void *data)
 {
 	struct workqueue_struct *wq = data;
@@ -900,9 +893,7 @@ static int mt6370_chg_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init psy\n");
 
-	mutex_init(&priv->attach_lock);
-	ret = devm_add_action_or_reset(dev, mt6370_chg_destroy_attach_lock,
-				       &priv->attach_lock);
+	ret = devm_mutex_init(dev, &priv->attach_lock);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
 
diff --git a/drivers/power/supply/rt9467-charger.c b/drivers/power/supply/rt9467-charger.c
index fdfdc83ab045..84f07c22077f 100644
--- a/drivers/power/supply/rt9467-charger.c
+++ b/drivers/power/supply/rt9467-charger.c
@@ -10,6 +10,7 @@
 #include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -1149,27 +1150,6 @@ static int rt9467_reset_chip(struct rt9467_chg_data *data)
 	return regmap_field_write(data->rm_field[F_RST], 1);
 }
 
-static void rt9467_chg_destroy_adc_lock(void *data)
-{
-	struct mutex *adc_lock = data;
-
-	mutex_destroy(adc_lock);
-}
-
-static void rt9467_chg_destroy_attach_lock(void *data)
-{
-	struct mutex *attach_lock = data;
-
-	mutex_destroy(attach_lock);
-}
-
-static void rt9467_chg_destroy_ichg_ieoc_lock(void *data)
-{
-	struct mutex *ichg_ieoc_lock = data;
-
-	mutex_destroy(ichg_ieoc_lock);
-}
-
 static void rt9467_chg_complete_aicl_done(void *data)
 {
 	struct completion *aicl_done = data;
@@ -1222,21 +1202,15 @@ static int rt9467_charger_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add irq chip\n");
 
-	mutex_init(&data->adc_lock);
-	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_adc_lock,
-				       &data->adc_lock);
+	ret = devm_mutex_init(dev, &data->adc_lock);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init ADC lock\n");
 
-	mutex_init(&data->attach_lock);
-	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_attach_lock,
-				       &data->attach_lock);
+	ret = devm_mutex_init(dev, &data->attach_lock);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init attach lock\n");
 
-	mutex_init(&data->ichg_ieoc_lock);
-	ret = devm_add_action_or_reset(dev, rt9467_chg_destroy_ichg_ieoc_lock,
-				       &data->ichg_ieoc_lock);
+	ret = devm_mutex_init(dev, &data->ichg_ieoc_lock);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init ICHG/IEOC lock\n");
 
diff --git a/include/linux/devm-helpers.h b/include/linux/devm-helpers.h
index 74891802200d..70640fb96117 100644
--- a/include/linux/devm-helpers.h
+++ b/include/linux/devm-helpers.h
@@ -24,6 +24,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/kconfig.h>
+#include <linux/mutex.h>
 #include <linux/workqueue.h>
 
 static inline void devm_delayed_work_drop(void *res)
@@ -76,4 +78,34 @@ static inline int devm_work_autocancel(struct device *dev,
 	return devm_add_action(dev, devm_work_drop, w);
 }
 
+static inline void devm_mutex_drop(void *res)
+{
+	mutex_destroy(res);
+}
+
+/**
+ * devm_mutex_init - Resource managed mutex initialization
+ * @dev:	Device which lifetime mutex is bound to
+ * @lock:	Mutex to be initialized (and automatically destroyed)
+ *
+ * Initialize mutex which is automatically destroyed when driver is detached.
+ * A few drivers initialize mutexes which they want destroyed before driver is
+ * detached, for debugging purposes.
+ * devm_mutex_init() can be used to omit the explicit mutex_destroy() call when
+ * driver is detached.
+ */
+static inline int devm_mutex_init(struct device *dev, struct mutex *lock)
+{
+	mutex_init(lock);
+
+	/*
+	 * mutex_destroy() is an empty function if CONFIG_DEBUG_MUTEXES is
+	 * disabled. No need to allocate an action in that case.
+	 */
+	if (IS_ENABLED(CONFIG_DEBUG_MUTEXES))
+		return devm_add_action_or_reset(dev, devm_mutex_drop, lock);
+	else
+		return 0;
+}
+
 #endif
-- 
2.43.0

