Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315262D5E6F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F206EAB6;
	Thu, 10 Dec 2020 14:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAFE16E5A4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:30:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CAA9139F;
 Thu, 10 Dec 2020 06:30:39 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.1.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 457FA3F718;
 Thu, 10 Dec 2020 06:30:36 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
Date: Thu, 10 Dec 2020 14:30:12 +0000
Message-Id: <20201210143014.24685-4-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201210143014.24685-1-lukasz.luba@arm.com>
References: <20201210143014.24685-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: amit.kucheria@verdurent.com, airlied@linux.ie, daniel.lezcano@linaro.org,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com, rui.zhang@intel.com,
 ionela.voinescu@arm.com, orjan.eide@arm.com, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Energy Model (EM) framework supports devices such as Devfreq. Create
new registration function which automatically register EM for the thermal
devfreq_cooling devices. This patch prepares the code for coming changes
which are going to replace old power model with the new EM.

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/devfreq_cooling.c | 54 ++++++++++++++++++++++++++++++-
 include/linux/devfreq_cooling.h   | 10 ++++++
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index afcebadbad24..6cea027d89a3 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -12,6 +12,7 @@
 
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/energy_model.h>
 #include <linux/export.h>
 #include <linux/idr.h>
 #include <linux/slab.h>
@@ -576,22 +577,73 @@ struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df)
 }
 EXPORT_SYMBOL_GPL(devfreq_cooling_register);
 
+/**
+ * devfreq_cooling_em_register_power() - Register devfreq cooling device with
+ *		power information and automatically register Energy Model (EM)
+ * @df:		Pointer to devfreq device.
+ * @dfc_power:	Pointer to devfreq_cooling_power.
+ *
+ * Register a devfreq cooling device and automatically register EM. The
+ * available OPPs must be registered for the device.
+ *
+ * If @dfc_power is provided, the cooling device is registered with the
+ * power extensions. It is using the simple Energy Model which requires
+ * "dynamic-power-coefficient" a devicetree property. To not break drivers
+ * which miss that DT property, the function won't bail out when the EM
+ * registration failed. The cooling device will be registered if everything
+ * else is OK.
+ */
+struct thermal_cooling_device *
+devfreq_cooling_em_register(struct devfreq *df,
+			    struct devfreq_cooling_power *dfc_power)
+{
+	struct thermal_cooling_device *cdev;
+	struct device *dev;
+	int ret;
+
+	if (IS_ERR_OR_NULL(df))
+		return ERR_PTR(-EINVAL);
+
+	dev = df->dev.parent;
+
+	ret = dev_pm_opp_of_register_em(dev, NULL);
+	if (ret)
+		dev_dbg(dev, "Unable to register EM for devfreq cooling device (%d)\n",
+			ret);
+
+	cdev = of_devfreq_cooling_register_power(dev->of_node, df, dfc_power);
+
+	if (IS_ERR_OR_NULL(cdev))
+		em_dev_unregister_perf_domain(dev);
+
+	return cdev;
+}
+EXPORT_SYMBOL_GPL(devfreq_cooling_em_register);
+
 /**
  * devfreq_cooling_unregister() - Unregister devfreq cooling device.
  * @cdev: Pointer to devfreq cooling device to unregister.
+ *
+ * Unregisters devfreq cooling device and related Energy Model if it was
+ * present.
  */
 void devfreq_cooling_unregister(struct thermal_cooling_device *cdev)
 {
 	struct devfreq_cooling_device *dfc;
+	struct device *dev;
 
-	if (!cdev)
+	if (IS_ERR_OR_NULL(cdev))
 		return;
 
 	dfc = cdev->devdata;
+	dev = dfc->devfreq->dev.parent;
 
 	thermal_cooling_device_unregister(dfc->cdev);
 	ida_simple_remove(&devfreq_ida, dfc->id);
 	dev_pm_qos_remove_request(&dfc->req_max_freq);
+
+	em_dev_unregister_perf_domain(dev);
+
 	kfree(dfc->power_table);
 	kfree(dfc->freq_table);
 
diff --git a/include/linux/devfreq_cooling.h b/include/linux/devfreq_cooling.h
index 9df2dfca68dd..7a9fbcc7b265 100644
--- a/include/linux/devfreq_cooling.h
+++ b/include/linux/devfreq_cooling.h
@@ -65,6 +65,9 @@ struct thermal_cooling_device *
 of_devfreq_cooling_register(struct device_node *np, struct devfreq *df);
 struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df);
 void devfreq_cooling_unregister(struct thermal_cooling_device *dfc);
+struct thermal_cooling_device *
+devfreq_cooling_em_register(struct devfreq *df,
+			    struct devfreq_cooling_power *dfc_power);
 
 #else /* !CONFIG_DEVFREQ_THERMAL */
 
@@ -87,6 +90,13 @@ devfreq_cooling_register(struct devfreq *df)
 	return ERR_PTR(-EINVAL);
 }
 
+static inline struct thermal_cooling_device *
+devfreq_cooling_em_register(struct devfreq *df,
+			    struct devfreq_cooling_power *dfc_power)
+{
+	return ERR_PTR(-EINVAL);
+}
+
 static inline void
 devfreq_cooling_unregister(struct thermal_cooling_device *dfc)
 {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
