Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F761CEDAF
	for <lists+dri-devel@lfdr.de>; Tue, 12 May 2020 09:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACF06E83F;
	Tue, 12 May 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4E75989875
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:21:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF44B1045;
 Mon, 11 May 2020 04:21:42 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06ADE3F305;
 Mon, 11 May 2020 04:21:32 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v7 12/15] thermal: devfreq_cooling: add new registration
 functions with Energy Model
Date: Mon, 11 May 2020 12:19:09 +0100
Message-Id: <20200511111912.3001-13-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Tue, 12 May 2020 07:09:30 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Dietmar.Eggemann@arm.com, airlied@linux.ie, tomeu.vizoso@collabora.com,
 qperret@google.com, sboyd@kernel.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Energy Model (EM) framework supports devices such as Devfreq. Create
new registration functions which automatically register EM for the thermal
devfreq_cooling devices. This patch prepares the code for coming changes
which are going to replace old power model with the new EM.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/devfreq_cooling.c | 99 ++++++++++++++++++++++++++++++-
 include/linux/devfreq_cooling.h   | 22 +++++++
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 36ec6a48606c..c7ffed2d6ee0 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -58,6 +58,8 @@ static DEFINE_IDA(devfreq_ida);
  * @capped_state:	index to cooling state with in dynamic power budget
  * @req_max_freq:	PM QoS request for limiting the maximum frequency
  *			of the devfreq device.
+ * @em:		Energy Model which represents the associated Devfreq device
+ * @em_registered:	Devfreq cooling registered the EM and should free it.
  */
 struct devfreq_cooling_device {
 	int id;
@@ -71,6 +73,8 @@ struct devfreq_cooling_device {
 	u32 res_util;
 	int capped_state;
 	struct dev_pm_qos_request req_max_freq;
+	struct em_perf_domain *em;
+	bool em_registered;
 };
 
 static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
@@ -594,22 +598,115 @@ struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df)
 }
 EXPORT_SYMBOL_GPL(devfreq_cooling_register);
 
+/**
+ * devfreq_cooling_em_register_power() - Register devfreq cooling device with
+ *		power information and attempt to register Energy Model (EM)
+ * @df:		Pointer to devfreq device.
+ * @dfc_power:	Pointer to devfreq_cooling_power.
+ * @em_cb:	Callback functions providing the data of the EM
+ *
+ * Register a devfreq cooling device and attempt to register Energy Model. The
+ * available OPPs must be registered for the device.
+ *
+ * If @dfc_power is provided, the cooling device is registered with the
+ * power extensions. If @em_cb is provided it will be called for each OPP to
+ * calculate power value and cost. If @em_cb is not provided then simple Energy
+ * Model is going to be used, which requires "dynamic-power-coefficient" a
+ * devicetree property.
+ */
+struct thermal_cooling_device *
+devfreq_cooling_em_register_power(struct devfreq *df,
+				  struct devfreq_cooling_power *dfc_power,
+				  struct em_data_callback *em_cb)
+{
+	struct thermal_cooling_device *cdev;
+	struct devfreq_cooling_device *dfc;
+	struct device_node *np = NULL;
+	struct device *dev;
+	int nr_opp, ret;
+
+	if (IS_ERR_OR_NULL(df))
+		return ERR_PTR(-EINVAL);
+
+	dev = df->dev.parent;
+
+	if (em_cb) {
+		nr_opp = dev_pm_opp_get_opp_count(dev);
+		if (nr_opp <= 0) {
+			dev_err(dev, "No valid OPPs found\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		ret = em_dev_register_perf_domain(dev, nr_opp, em_cb, NULL);
+	} else {
+		ret = dev_pm_opp_of_register_em(dev, NULL);
+	}
+
+	if (ret)
+		dev_warn(dev, "Unable to register EM for devfreq cooling device (%d)\n",
+			 ret);
+
+	if (dev->of_node)
+		np = of_node_get(dev->of_node);
+
+	cdev = of_devfreq_cooling_register_power(np, df, dfc_power);
+
+	if (np)
+		of_node_put(np);
+
+	if (IS_ERR_OR_NULL(cdev)) {
+		if (!ret)
+			em_dev_unregister_perf_domain(dev);
+	} else {
+		dfc = cdev->devdata;
+		dfc->em_registered = !ret;
+	}
+
+	return cdev;
+}
+EXPORT_SYMBOL_GPL(devfreq_cooling_em_register_power);
+
+/**
+ * devfreq_cooling_em_register() - Register devfreq cooling device together
+ *				with Energy Model.
+ * @df:		Pointer to devfreq device.
+ * @em_cb:	Callback functions providing the data of the Energy Model
+ *
+ * This function attempts to register Energy Model for devfreq device and then
+ * register the devfreq cooling device.
+ */
+struct thermal_cooling_device *
+devfreq_cooling_em_register(struct devfreq *df, struct em_data_callback *em_cb)
+{
+	return devfreq_cooling_em_register_power(df, NULL, em_cb);
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
+	if (dfc->em_registered)
+		em_dev_unregister_perf_domain(dev);
+
 	kfree(dfc->power_table);
 	kfree(dfc->freq_table);
 
diff --git a/include/linux/devfreq_cooling.h b/include/linux/devfreq_cooling.h
index 79a6e37a1d6f..07df019fcb66 100644
--- a/include/linux/devfreq_cooling.h
+++ b/include/linux/devfreq_cooling.h
@@ -18,6 +18,7 @@
 #define __DEVFREQ_COOLING_H__
 
 #include <linux/devfreq.h>
+#include <linux/energy_model.h>
 #include <linux/thermal.h>
 
 
@@ -72,6 +73,13 @@ struct thermal_cooling_device *
 of_devfreq_cooling_register(struct device_node *np, struct devfreq *df);
 struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df);
 void devfreq_cooling_unregister(struct thermal_cooling_device *dfc);
+struct thermal_cooling_device *
+devfreq_cooling_em_register_power(struct devfreq *df,
+				  struct devfreq_cooling_power *dfc_power,
+				  struct em_data_callback *em_cb);
+struct thermal_cooling_device *
+devfreq_cooling_em_register(struct devfreq *df,
+			    struct em_data_callback *em_cb);
 
 #else /* !CONFIG_DEVFREQ_THERMAL */
 
@@ -94,6 +102,20 @@ devfreq_cooling_register(struct devfreq *df)
 	return ERR_PTR(-EINVAL);
 }
 
+static inline struct thermal_cooling_device *
+devfreq_cooling_em_register_power(struct devfreq *df,
+				  struct devfreq_cooling_power *dfc_power,
+				  struct em_data_callback *em_cb)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline struct thermal_cooling_device *
+devfreq_cooling_em_register(struct devfreq *df,	struct em_data_callback *em_cb)
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
