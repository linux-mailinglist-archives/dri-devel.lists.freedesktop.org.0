Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F8155C6A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 18:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060A06FD2D;
	Fri,  7 Feb 2020 17:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BC376FA48
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 13:47:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB336FEC;
 Thu,  6 Feb 2020 05:47:43 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D02743F52E;
 Thu,  6 Feb 2020 05:47:31 -0800 (PST)
From: lukasz.luba@arm.com
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v2 3/4] thermal: devfreq_cooling: Refactor code and switch to
 use Energy Model
Date: Thu,  6 Feb 2020 13:46:39 +0000
Message-Id: <20200206134640.11367-4-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206134640.11367-1-lukasz.luba@arm.com>
References: <20200206134640.11367-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Fri, 07 Feb 2020 17:01:42 +0000
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
 alyssa.rosenzweig@collabora.com, b.zolnierkie@samsung.com,
 s.hauer@pengutronix.de, rostedt@goodmis.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, shawnguo@kernel.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 ionela.voinescu@arm.com, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lukasz Luba <lukasz.luba@arm.com>

The overhauled Energy Model (EM) framework support also devfreq devices.
The unified API interface of the EM can be used in the thermal subsystem to
not duplicate code. The power table now is taken from EM structure and
there is no need to maintain calculation for it locally. In case when the
EM is not provided by the device a simple interface for cooling device is
used.

There is also an improvement in code related to enabling/disabling OPPs,
which prevents from race condition with devfreq governors.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org> # for tracing code
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/devfreq_cooling.c | 427 ++++++++++++++----------------
 include/linux/devfreq_cooling.h   |  17 --
 include/trace/events/thermal.h    |  19 +-
 3 files changed, 202 insertions(+), 261 deletions(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index a87d4fa031c8..1b9f61b6532d 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * devfreq_cooling: Thermal cooling device implementation for devices using
  *                  devfreq
  *
- * Copyright (C) 2014-2015 ARM Limited
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any
- * kind, whether express or implied; without even the implied warranty
- * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
+ * Copyright (C) 2014-2020 ARM Limited
  *
  * TODO:
  *    - If OPPs are added or removed after devfreq cooling has
@@ -20,6 +12,7 @@
 
 #include <linux/devfreq.h>
 #include <linux/devfreq_cooling.h>
+#include <linux/energy_model.h>
 #include <linux/export.h>
 #include <linux/idr.h>
 #include <linux/slab.h>
@@ -39,37 +32,56 @@ static DEFINE_IDA(devfreq_ida);
  * @cdev:	Pointer to associated thermal cooling device.
  * @devfreq:	Pointer to associated devfreq device.
  * @cooling_state:	Current cooling state.
- * @power_table:	Pointer to table with maximum power draw for each
- *			cooling state. State is the index into the table, and
- *			the power is in mW.
- * @freq_table:	Pointer to a table with the frequencies sorted in descending
- *		order.  You can index the table by cooling device state
- * @freq_table_size:	Size of the @freq_table and @power_table
- * @power_ops:	Pointer to devfreq_cooling_power, used to generate the
- *		@power_table.
+ * @freq_table:        Pointer to a table with the frequencies.
+ * @max_level:	It is the last index, that is, one less than the number of the
+ *		OPPs
+ * @power_ops:	Pointer to devfreq_cooling_power, a more precised model.
  * @res_util:	Resource utilization scaling factor for the power.
  *		It is multiplied by 100 to minimize the error. It is used
  *		for estimation of the power budget instead of using
  *		'utilization' (which is	'busy_time / 'total_time').
- *		The 'res_util' range is from 100 to (power_table[state] * 100)
- *		for the corresponding 'state'.
- * @capped_state:	index to cooling state with in dynamic power budget
+ *		The 'res_util' range is from 100 to power * 100	for the
+ *		corresponding 'state'.
+ * @em:		Energy Model which represents the associated Devfreq device
  */
 struct devfreq_cooling_device {
 	int id;
 	struct thermal_cooling_device *cdev;
 	struct devfreq *devfreq;
 	unsigned long cooling_state;
-	u32 *power_table;
 	u32 *freq_table;
-	size_t freq_table_size;
+	size_t max_level;
 	struct devfreq_cooling_power *power_ops;
 	u32 res_util;
-	int capped_state;
+	struct em_perf_domain *em;
 };
 
+static unsigned long _find_freq_for_state(struct devfreq_cooling_device *dfc,
+					  unsigned long cdev_state)
+{
+	unsigned long freq;
+
+	if (dfc->em) {
+		freq = dfc->em->table[dfc->max_level - cdev_state].frequency;
+		/* Energy Model frequencies are in kHz */
+		return freq * 1000;
+	} else {
+		return dfc->freq_table[cdev_state];
+	}
+}
+
+static void _update_devfreq_max_freq(struct devfreq *df, unsigned long max_freq)
+{
+	dev_dbg(df->dev.parent, "devfreq_cooling: max_freq=%luHz\n", max_freq);
+
+	mutex_lock(&df->lock);
+	df->scaling_max_freq = max_freq;
+	update_devfreq(df);
+	mutex_unlock(&df->lock);
+}
+
 /**
- * partition_enable_opps() - disable all opps above a given state
+ * partition_enable_opps() - disable all OPPs above a given state
  * @dfc:	Pointer to devfreq we are operating on
  * @cdev_state:	cooling device state we're setting
  *
@@ -79,16 +91,33 @@ struct devfreq_cooling_device {
 static int partition_enable_opps(struct devfreq_cooling_device *dfc,
 				 unsigned long cdev_state)
 {
-	int i;
 	struct device *dev = dfc->devfreq->dev.parent;
+	bool want_enable, available;
+	struct dev_pm_opp *opp;
+	unsigned long freq;
+	int i, ret;
 
-	for (i = 0; i < dfc->freq_table_size; i++) {
-		struct dev_pm_opp *opp;
-		int ret = 0;
-		unsigned int freq = dfc->freq_table[i];
-		bool want_enable = i >= cdev_state ? true : false;
+	/*
+	 * Avoid race with devfreq governors trying to use OPPs which are
+	 * going to be disabled. Update devfreq upfront when previous cooling
+	 * state had higher frequency or do it later in opposite case.
+	 */
+	freq = _find_freq_for_state(dfc, cdev_state);
+
+	if (dfc->cooling_state < cdev_state)
+		_update_devfreq_max_freq(dfc->devfreq, freq);
 
-		opp = dev_pm_opp_find_freq_exact(dev, freq, !want_enable);
+	dev_dbg(dev, "devfreq_cooling: updating OPPs\n");
+	for (i = 0; i <= dfc->max_level; i++) {
+		available = (i >= dfc->cooling_state);
+		want_enable = (i >= cdev_state);
+
+		if (available == want_enable)
+			continue;
+
+		freq = _find_freq_for_state(dfc, i);
+
+		opp = dev_pm_opp_find_freq_exact(dev, freq, available);
 
 		if (PTR_ERR(opp) == -ERANGE)
 			continue;
@@ -106,6 +135,9 @@ static int partition_enable_opps(struct devfreq_cooling_device *dfc,
 			return ret;
 	}
 
+	if (dfc->cooling_state > cdev_state)
+		_update_devfreq_max_freq(dfc->devfreq, freq);
+
 	return 0;
 }
 
@@ -114,7 +146,7 @@ static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 
-	*state = dfc->freq_table_size - 1;
+	*state = dfc->max_level;
 
 	return 0;
 }
@@ -142,7 +174,7 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 
 	dev_dbg(dev, "Setting cooling state %lu\n", state);
 
-	if (state >= dfc->freq_table_size)
+	if (state > dfc->max_level)
 		return -EINVAL;
 
 	ret = partition_enable_opps(dfc, state);
@@ -155,20 +187,20 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 }
 
 /**
- * freq_get_state() - get the cooling state corresponding to a frequency
+ * freq_get_state() - get the performance index corresponding to a frequency
  * @dfc:	Pointer to devfreq cooling device
- * @freq:	frequency in Hz
+ * @freq:	frequency in kHz
  *
- * Return: the cooling state associated with the @freq, or
+ * Return: the performance index associated with the @freq, or
  * THERMAL_CSTATE_INVALID if it wasn't found.
  */
-static unsigned long
+static int
 freq_get_state(struct devfreq_cooling_device *dfc, unsigned long freq)
 {
 	int i;
 
-	for (i = 0; i < dfc->freq_table_size; i++) {
-		if (dfc->freq_table[i] == freq)
+	for (i = 0; i <= dfc->max_level; i++) {
+		if (dfc->em->table[i].frequency == freq)
 			return i;
 	}
 
@@ -203,132 +235,79 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 	return voltage;
 }
 
-/**
- * get_static_power() - calculate the static power
- * @dfc:	Pointer to devfreq cooling device
- * @freq:	Frequency in Hz
- *
- * Calculate the static power in milliwatts using the supplied
- * get_static_power().  The current voltage is calculated using the
- * OPP library.  If no get_static_power() was supplied, assume the
- * static power is negligible.
- */
-static unsigned long
-get_static_power(struct devfreq_cooling_device *dfc, unsigned long freq)
-{
-	struct devfreq *df = dfc->devfreq;
-	unsigned long voltage;
-
-	if (!dfc->power_ops->get_static_power)
-		return 0;
-
-	voltage = get_voltage(df, freq);
-
-	if (voltage == 0)
-		return 0;
-
-	return dfc->power_ops->get_static_power(df, voltage);
-}
-
-/**
- * get_dynamic_power - calculate the dynamic power
- * @dfc:	Pointer to devfreq cooling device
- * @freq:	Frequency in Hz
- * @voltage:	Voltage in millivolts
- *
- * Calculate the dynamic power in milliwatts consumed by the device at
- * frequency @freq and voltage @voltage.  If the get_dynamic_power()
- * was supplied as part of the devfreq_cooling_power struct, then that
- * function is used.  Otherwise, a simple power model (Pdyn = Coeff *
- * Voltage^2 * Frequency) is used.
- */
-static unsigned long
-get_dynamic_power(struct devfreq_cooling_device *dfc, unsigned long freq,
-		  unsigned long voltage)
+static void dfc_em_get_requested_power(struct em_perf_domain *em,
+				       struct devfreq_dev_status *status,
+				       u32 *power, int em_perf_idx)
 {
-	u64 power;
-	u32 freq_mhz;
-	struct devfreq_cooling_power *dfc_power = dfc->power_ops;
+	unsigned long total_time;
+	u64 current_power;
 
-	if (dfc_power->get_dynamic_power)
-		return dfc_power->get_dynamic_power(dfc->devfreq, freq,
-						    voltage);
+	total_time = status->total_time ?: 1;
 
-	freq_mhz = freq / 1000000;
-	power = (u64)dfc_power->dyn_power_coeff * freq_mhz * voltage * voltage;
-	do_div(power, 1000000000);
-
-	return power;
-}
+	current_power = em->table[em_perf_idx].power;
 
+	/* Scale power for utilization */
+	current_power *= status->busy_time;
+	current_power = do_div(current_power, total_time);
 
-static inline unsigned long get_total_power(struct devfreq_cooling_device *dfc,
-					    unsigned long freq,
-					    unsigned long voltage)
-{
-	return get_static_power(dfc, freq) + get_dynamic_power(dfc, freq,
-							       voltage);
+	*power = current_power;
 }
 
-
 static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cdev,
 					       struct thermal_zone_device *tz,
 					       u32 *power)
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 	struct devfreq *df = dfc->devfreq;
-	struct devfreq_dev_status *status = &df->last_status;
-	unsigned long state;
-	unsigned long freq = status->current_frequency;
-	unsigned long voltage;
-	u32 dyn_power = 0;
-	u32 static_power = 0;
+	struct devfreq_dev_status status;
+	unsigned long voltage, freq;
+	int em_perf_idx;
 	int res;
 
-	state = freq_get_state(dfc, freq);
-	if (state == THERMAL_CSTATE_INVALID) {
-		res = -EAGAIN;
-		goto fail;
-	}
+	mutex_lock(&df->lock);
+	res = df->profile->get_dev_status(df->dev.parent, &status);
+	mutex_unlock(&df->lock);
+	if (res)
+		return res;
+
+	freq = status.current_frequency;
 
-	if (dfc->power_ops->get_real_power) {
+	/* Energy Model frequencies are in kHz */
+	em_perf_idx = freq_get_state(dfc, freq / 1000);
+	if (em_perf_idx == THERMAL_CSTATE_INVALID)
+		return -EAGAIN;
+
+	/*
+	 * If a more sophisticated cooling device model was not provided by the
+	 * driver, use simple Energy Model power calculation.
+	 */
+	if (!dfc->power_ops || !dfc->power_ops->get_real_power) {
+		dfc_em_get_requested_power(dfc->em, &status, power,
+					   em_perf_idx);
+	} else {
 		voltage = get_voltage(df, freq);
 		if (voltage == 0) {
-			res = -EINVAL;
-			goto fail;
+			dfc->res_util = SCALE_ERROR_MITIGATION;
+			return -EINVAL;
 		}
 
 		res = dfc->power_ops->get_real_power(df, power, freq, voltage);
 		if (!res) {
-			state = dfc->capped_state;
-			dfc->res_util = dfc->power_table[state];
+			dfc->res_util = dfc->em->table[em_perf_idx].power;
 			dfc->res_util *= SCALE_ERROR_MITIGATION;
 
 			if (*power > 1)
 				dfc->res_util /= *power;
 		} else {
-			goto fail;
+			/* It is safe to set max in this case */
+			dfc->res_util = SCALE_ERROR_MITIGATION;
+			return res;
 		}
-	} else {
-		dyn_power = dfc->power_table[state];
-
-		/* Scale dynamic power for utilization */
-		dyn_power *= status->busy_time;
-		dyn_power /= status->total_time;
-		/* Get static power */
-		static_power = get_static_power(dfc, freq);
-
-		*power = dyn_power + static_power;
 	}
 
-	trace_thermal_power_devfreq_get_power(cdev, status, freq, dyn_power,
-					      static_power, *power);
+	trace_thermal_power_devfreq_get_power(cdev, &status, freq, *power);
 
 	return 0;
-fail:
-	/* It is safe to set max in this case */
-	dfc->res_util = SCALE_ERROR_MITIGATION;
-	return res;
 }
 
 static int devfreq_cooling_state2power(struct thermal_cooling_device *cdev,
@@ -337,16 +316,14 @@ static int devfreq_cooling_state2power(struct thermal_cooling_device *cdev,
 				       u32 *power)
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
-	unsigned long freq;
-	u32 static_power;
+	int idx;
 
-	if (state >= dfc->freq_table_size)
+	if (state > dfc->max_level)
 		return -EINVAL;
 
-	freq = dfc->freq_table[state];
-	static_power = get_static_power(dfc, freq);
+	idx = dfc->max_level - state;
+	*power = dfc->em->table[idx].power;
 
-	*power = dfc->power_table[state] + static_power;
 	return 0;
 }
 
@@ -359,36 +336,34 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
 	struct devfreq_dev_status *status = &df->last_status;
 	unsigned long freq = status->current_frequency;
 	unsigned long busy_time;
-	s32 dyn_power;
-	u32 static_power;
-	s32 est_power;
+	u64 est_power;
 	int i;
 
-	if (dfc->power_ops->get_real_power) {
-		/* Scale for resource utilization */
-		est_power = power * dfc->res_util;
-		est_power /= SCALE_ERROR_MITIGATION;
-	} else {
-		static_power = get_static_power(dfc, freq);
-
-		dyn_power = power - static_power;
-		dyn_power = dyn_power > 0 ? dyn_power : 0;
-
-		/* Scale dynamic power for utilization */
+	/*
+	 * Scale for resource utilization. Use simple Energy Model power
+	 * calculation if a more sophisticated cooling device model does
+	 * not exist.
+	 */
+	if (!dfc->power_ops || !dfc->power_ops->get_real_power) {
 		busy_time = status->busy_time ?: 1;
-		est_power = (dyn_power * status->total_time) / busy_time;
+
+		est_power = power * status->total_time;
+		est_power = do_div(est_power, busy_time);
+	} else {
+		est_power = power * dfc->res_util;
+		est_power = do_div(est_power, SCALE_ERROR_MITIGATION);
 	}
 
 	/*
 	 * Find the first cooling state that is within the power
-	 * budget for dynamic power.
+	 * budget. The EM power table is sorted ascending.
 	 */
-	for (i = 0; i < dfc->freq_table_size - 1; i++)
-		if (est_power >= dfc->power_table[i])
+	for (i = dfc->max_level; i > 0; i--)
+		if (est_power >= dfc->em->table[i].power)
 			break;
 
-	*state = i;
-	dfc->capped_state = i;
+	*state = dfc->max_level - i;
+
 	trace_thermal_power_devfreq_limit(cdev, freq, *state, power);
 	return 0;
 }
@@ -400,91 +375,43 @@ static struct thermal_cooling_device_ops devfreq_cooling_ops = {
 };
 
 /**
- * devfreq_cooling_gen_tables() - Generate power and freq tables.
- * @dfc: Pointer to devfreq cooling device.
- *
- * Generate power and frequency tables: the power table hold the
- * device's maximum power usage at each cooling state (OPP).  The
- * static and dynamic power using the appropriate voltage and
- * frequency for the state, is acquired from the struct
- * devfreq_cooling_power, and summed to make the maximum power draw.
- *
- * The frequency table holds the frequencies in descending order.
- * That way its indexed by cooling device state.
+ * devfreq_cooling_gen_tables() - Generate frequency table.
+ * @dfc:	Pointer to devfreq cooling device.
+ * @num_opps:	Number of OPPs
  *
- * The tables are malloced, and pointers put in dfc.  They must be
- * freed when unregistering the devfreq cooling device.
+ * Generate frequency table which holds the frequencies in descending
+ * order. That way its indexed by cooling device state. This is for
+ * compatibility with drivers which do not register Energy Model.
  *
  * Return: 0 on success, negative error code on failure.
  */
-static int devfreq_cooling_gen_tables(struct devfreq_cooling_device *dfc)
+static int devfreq_cooling_gen_tables(struct devfreq_cooling_device *dfc,
+				      int num_opps)
 {
 	struct devfreq *df = dfc->devfreq;
 	struct device *dev = df->dev.parent;
-	int ret, num_opps;
 	unsigned long freq;
-	u32 *power_table = NULL;
-	u32 *freq_table;
 	int i;
 
-	num_opps = dev_pm_opp_get_opp_count(dev);
-
-	if (dfc->power_ops) {
-		power_table = kcalloc(num_opps, sizeof(*power_table),
-				      GFP_KERNEL);
-		if (!power_table)
-			return -ENOMEM;
-	}
-
-	freq_table = kcalloc(num_opps, sizeof(*freq_table),
+	dfc->freq_table = kcalloc(num_opps, sizeof(*dfc->freq_table),
 			     GFP_KERNEL);
-	if (!freq_table) {
-		ret = -ENOMEM;
-		goto free_power_table;
-	}
+	if (!dfc->freq_table)
+		return -ENOMEM;
 
 	for (i = 0, freq = ULONG_MAX; i < num_opps; i++, freq--) {
-		unsigned long power, voltage;
 		struct dev_pm_opp *opp;
 
 		opp = dev_pm_opp_find_freq_floor(dev, &freq);
 		if (IS_ERR(opp)) {
-			ret = PTR_ERR(opp);
-			goto free_tables;
+			kfree(dfc->freq_table);
+			return PTR_ERR(opp);
 		}
 
-		voltage = dev_pm_opp_get_voltage(opp) / 1000; /* mV */
 		dev_pm_opp_put(opp);
-
-		if (dfc->power_ops) {
-			if (dfc->power_ops->get_real_power)
-				power = get_total_power(dfc, freq, voltage);
-			else
-				power = get_dynamic_power(dfc, freq, voltage);
-
-			dev_dbg(dev, "Power table: %lu MHz @ %lu mV: %lu = %lu mW\n",
-				freq / 1000000, voltage, power, power);
-
-			power_table[i] = power;
-		}
-
-		freq_table[i] = freq;
+		dfc->freq_table[i] = freq;
 	}
 
-	if (dfc->power_ops)
-		dfc->power_table = power_table;
-
-	dfc->freq_table = freq_table;
-	dfc->freq_table_size = num_opps;
-
 	return 0;
-
-free_tables:
-	kfree(freq_table);
-free_power_table:
-	kfree(power_table);
-
-	return ret;
 }
 
 /**
@@ -509,7 +436,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 	struct thermal_cooling_device *cdev;
 	struct devfreq_cooling_device *dfc;
 	char dev_name[THERMAL_NAME_LENGTH];
-	int err;
+	int err, num_opps;
 
 	dfc = kzalloc(sizeof(*dfc), GFP_KERNEL);
 	if (!dfc)
@@ -517,22 +444,38 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 	dfc->devfreq = df;
 
-	if (dfc_power) {
-		dfc->power_ops = dfc_power;
-
+	dfc->em = em_get_pd(df->dev.parent);
+	if (dfc->em) {
 		devfreq_cooling_ops.get_requested_power =
 			devfreq_cooling_get_requested_power;
 		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
 		devfreq_cooling_ops.power2state = devfreq_cooling_power2state;
+
+		dfc->power_ops = dfc_power;
+
+		num_opps = em_pd_nr_perf_states(dfc->em);
+	} else {
+		/* Backward compatibility for drivers which do not use IPA */
+		dev_dbg(df->dev.parent, "missing EM for cooling device\n");
+
+		num_opps = dev_pm_opp_get_opp_count(df->dev.parent);
+
+		err = devfreq_cooling_gen_tables(dfc, num_opps);
+		if (err)
+			goto free_dfc;
 	}
 
-	err = devfreq_cooling_gen_tables(dfc);
-	if (err)
+	if (num_opps <= 0) {
+		err = -EINVAL;
 		goto free_dfc;
+	}
+
+	/* max_level is an index, not a counter */
+	dfc->max_level = num_opps - 1;
 
 	err = ida_simple_get(&devfreq_ida, 0, 0, GFP_KERNEL);
 	if (err < 0)
-		goto free_tables;
+		goto free_table;
 	dfc->id = err;
 
 	snprintf(dev_name, sizeof(dev_name), "thermal-devfreq-%d", dfc->id);
@@ -553,8 +496,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 release_ida:
 	ida_simple_remove(&devfreq_ida, dfc->id);
-free_tables:
-	kfree(dfc->power_table);
+free_table:
 	kfree(dfc->freq_table);
 free_dfc:
 	kfree(dfc);
@@ -582,7 +524,24 @@ EXPORT_SYMBOL_GPL(of_devfreq_cooling_register);
  */
 struct thermal_cooling_device *devfreq_cooling_register(struct devfreq *df)
 {
-	return of_devfreq_cooling_register(NULL, df);
+	struct thermal_cooling_device *dfc;
+	struct device_node *np = NULL;
+	struct device *dev;
+
+	if (IS_ERR_OR_NULL(df))
+		return ERR_PTR(-EINVAL);
+
+	dev = df->dev.parent;
+
+	if (dev && dev->of_node)
+		np = of_node_get(dev->of_node);
+
+	dfc = of_devfreq_cooling_register(np, df);
+
+	if (np)
+		of_node_put(np);
+
+	return dfc;
 }
 EXPORT_SYMBOL_GPL(devfreq_cooling_register);
 
@@ -594,14 +553,14 @@ void devfreq_cooling_unregister(struct thermal_cooling_device *cdev)
 {
 	struct devfreq_cooling_device *dfc;
 
-	if (!cdev)
+	if (IS_ERR_OR_NULL(cdev))
 		return;
 
 	dfc = cdev->devdata;
 
 	thermal_cooling_device_unregister(dfc->cdev);
 	ida_simple_remove(&devfreq_ida, dfc->id);
-	kfree(dfc->power_table);
+
 	kfree(dfc->freq_table);
 
 	kfree(dfc);
diff --git a/include/linux/devfreq_cooling.h b/include/linux/devfreq_cooling.h
index 4635f95000a4..5e11bbc3ec58 100644
--- a/include/linux/devfreq_cooling.h
+++ b/include/linux/devfreq_cooling.h
@@ -23,17 +23,6 @@
 
 /**
  * struct devfreq_cooling_power - Devfreq cooling power ops
- * @get_static_power:	Take voltage, in mV, and return the static power
- *			in mW.  If NULL, the static power is assumed
- *			to be 0.
- * @get_dynamic_power:	Take voltage, in mV, and frequency, in HZ, and
- *			return the dynamic power draw in mW.  If NULL,
- *			a simple power model is used.
- * @dyn_power_coeff:	Coefficient for the simple dynamic power model in
- *			mW/(MHz mV mV).
- *			If get_dynamic_power() is NULL, then the
- *			dynamic power is calculated as
- *			@dyn_power_coeff * frequency * voltage^2
  * @get_real_power:	When this is set, the framework uses it to ask the
  *			device driver for the actual power.
  *			Some devices have more sophisticated methods
@@ -53,14 +42,8 @@
  *			max total (static + dynamic) power value for each OPP.
  */
 struct devfreq_cooling_power {
-	unsigned long (*get_static_power)(struct devfreq *devfreq,
-					  unsigned long voltage);
-	unsigned long (*get_dynamic_power)(struct devfreq *devfreq,
-					   unsigned long freq,
-					   unsigned long voltage);
 	int (*get_real_power)(struct devfreq *df, u32 *power,
 			      unsigned long freq, unsigned long voltage);
-	unsigned long dyn_power_coeff;
 };
 
 #ifdef CONFIG_DEVFREQ_THERMAL
diff --git a/include/trace/events/thermal.h b/include/trace/events/thermal.h
index 135e5421f003..8a5f04888abd 100644
--- a/include/trace/events/thermal.h
+++ b/include/trace/events/thermal.h
@@ -153,31 +153,30 @@ TRACE_EVENT(thermal_power_cpu_limit,
 TRACE_EVENT(thermal_power_devfreq_get_power,
 	TP_PROTO(struct thermal_cooling_device *cdev,
 		 struct devfreq_dev_status *status, unsigned long freq,
-		u32 dynamic_power, u32 static_power, u32 power),
+		u32 power),
 
-	TP_ARGS(cdev, status,  freq, dynamic_power, static_power, power),
+	TP_ARGS(cdev, status,  freq, power),
 
 	TP_STRUCT__entry(
 		__string(type,         cdev->type    )
 		__field(unsigned long, freq          )
-		__field(u32,           load          )
-		__field(u32,           dynamic_power )
-		__field(u32,           static_power  )
+		__field(u32,           busy_time)
+		__field(u32,           total_time)
 		__field(u32,           power)
 	),
 
 	TP_fast_assign(
 		__assign_str(type, cdev->type);
 		__entry->freq = freq;
-		__entry->load = (100 * status->busy_time) / status->total_time;
-		__entry->dynamic_power = dynamic_power;
-		__entry->static_power = static_power;
+		__entry->busy_time = status->busy_time;
+		__entry->total_time = status->total_time;
 		__entry->power = power;
 	),
 
-	TP_printk("type=%s freq=%lu load=%u dynamic_power=%u static_power=%u power=%u",
+	TP_printk("type=%s freq=%lu load=%u power=%u",
 		__get_str(type), __entry->freq,
-		__entry->load, __entry->dynamic_power, __entry->static_power,
+		__entry->total_time == 0 ? 0 :
+			(100 * __entry->busy_time) / __entry->total_time,
 		__entry->power)
 );
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
