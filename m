Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996E18AE01
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579C66E99C;
	Thu, 19 Mar 2020 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 468C76E8BA
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 11:46:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE4E1FB;
 Wed, 18 Mar 2020 04:46:54 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2CE23F534;
 Wed, 18 Mar 2020 04:46:44 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v5 3/5] thermal: devfreq_cooling: Use PM QoS to set frequency
 limits
Date: Wed, 18 Mar 2020 11:45:46 +0000
Message-Id: <20200318114548.19916-4-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318114548.19916-1-lukasz.luba@arm.com>
References: <20200318114548.19916-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
 bsegall@google.com, Morten.Rasmussen@arm.com, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Dietmar.Eggemann@arm.com, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Kaehlcke <mka@chromium.org>

Now that devfreq supports limiting the frequency range of a device
through PM QoS make use of it instead of disabling OPPs that should
not be used.

The switch from disabling OPPs to PM QoS introduces a subtle behavioral
change in case of conflicting requests (min > max): PM QoS gives
precedence to the MIN_FREQUENCY request, while higher OPPs disabled
with dev_pm_opp_disable() would override MIN_FREQUENCY.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
---

Added missing Chanwoo's Reviewed-by in posted patch v3.

 drivers/thermal/devfreq_cooling.c | 70 ++++++++++---------------------
 1 file changed, 23 insertions(+), 47 deletions(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index a87d4fa031c8..f7f32e98331b 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -24,11 +24,13 @@
 #include <linux/idr.h>
 #include <linux/slab.h>
 #include <linux/pm_opp.h>
+#include <linux/pm_qos.h>
 #include <linux/thermal.h>
 
 #include <trace/events/thermal.h>
 
-#define SCALE_ERROR_MITIGATION 100
+#define HZ_PER_KHZ		1000
+#define SCALE_ERROR_MITIGATION	100
 
 static DEFINE_IDA(devfreq_ida);
 
@@ -54,6 +56,8 @@ static DEFINE_IDA(devfreq_ida);
  *		The 'res_util' range is from 100 to (power_table[state] * 100)
  *		for the corresponding 'state'.
  * @capped_state:	index to cooling state with in dynamic power budget
+ * @req_max_freq:	PM QoS request for limiting the maximum frequency
+ *			of the devfreq device.
  */
 struct devfreq_cooling_device {
 	int id;
@@ -66,49 +70,9 @@ struct devfreq_cooling_device {
 	struct devfreq_cooling_power *power_ops;
 	u32 res_util;
 	int capped_state;
+	struct dev_pm_qos_request req_max_freq;
 };
 
-/**
- * partition_enable_opps() - disable all opps above a given state
- * @dfc:	Pointer to devfreq we are operating on
- * @cdev_state:	cooling device state we're setting
- *
- * Go through the OPPs of the device, enabling all OPPs until
- * @cdev_state and disabling those frequencies above it.
- */
-static int partition_enable_opps(struct devfreq_cooling_device *dfc,
-				 unsigned long cdev_state)
-{
-	int i;
-	struct device *dev = dfc->devfreq->dev.parent;
-
-	for (i = 0; i < dfc->freq_table_size; i++) {
-		struct dev_pm_opp *opp;
-		int ret = 0;
-		unsigned int freq = dfc->freq_table[i];
-		bool want_enable = i >= cdev_state ? true : false;
-
-		opp = dev_pm_opp_find_freq_exact(dev, freq, !want_enable);
-
-		if (PTR_ERR(opp) == -ERANGE)
-			continue;
-		else if (IS_ERR(opp))
-			return PTR_ERR(opp);
-
-		dev_pm_opp_put(opp);
-
-		if (want_enable)
-			ret = dev_pm_opp_enable(dev, freq);
-		else
-			ret = dev_pm_opp_disable(dev, freq);
-
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
 					 unsigned long *state)
 {
@@ -135,7 +99,7 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 	struct devfreq *df = dfc->devfreq;
 	struct device *dev = df->dev.parent;
-	int ret;
+	unsigned long freq;
 
 	if (state == dfc->cooling_state)
 		return 0;
@@ -145,9 +109,10 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	if (state >= dfc->freq_table_size)
 		return -EINVAL;
 
-	ret = partition_enable_opps(dfc, state);
-	if (ret)
-		return ret;
+	freq = dfc->freq_table[state];
+
+	dev_pm_qos_update_request(&dfc->req_max_freq,
+				  DIV_ROUND_UP(freq, HZ_PER_KHZ));
 
 	dfc->cooling_state = state;
 
@@ -530,9 +495,15 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 	if (err)
 		goto free_dfc;
 
-	err = ida_simple_get(&devfreq_ida, 0, 0, GFP_KERNEL);
+	err = dev_pm_qos_add_request(df->dev.parent, &dfc->req_max_freq,
+				     DEV_PM_QOS_MAX_FREQUENCY,
+				     PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
 	if (err < 0)
 		goto free_tables;
+
+	err = ida_simple_get(&devfreq_ida, 0, 0, GFP_KERNEL);
+	if (err < 0)
+		goto remove_qos_req;
 	dfc->id = err;
 
 	snprintf(dev_name, sizeof(dev_name), "thermal-devfreq-%d", dfc->id);
@@ -553,6 +524,10 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 release_ida:
 	ida_simple_remove(&devfreq_ida, dfc->id);
+
+remove_qos_req:
+	dev_pm_qos_remove_request(&dfc->req_max_freq);
+
 free_tables:
 	kfree(dfc->power_table);
 	kfree(dfc->freq_table);
@@ -601,6 +576,7 @@ void devfreq_cooling_unregister(struct thermal_cooling_device *cdev)
 
 	thermal_cooling_device_unregister(dfc->cdev);
 	ida_simple_remove(&devfreq_ida, dfc->id);
+	dev_pm_qos_remove_request(&dfc->req_max_freq);
 	kfree(dfc->power_table);
 	kfree(dfc->freq_table);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
