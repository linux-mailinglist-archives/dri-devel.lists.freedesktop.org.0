Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 044772D5E82
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484A46EAB4;
	Thu, 10 Dec 2020 14:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9947B6E53C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:30:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 590B513D5;
 Thu, 10 Dec 2020 06:30:43 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.1.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EDF4C3F718;
 Thu, 10 Dec 2020 06:30:39 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/5] thermal: devfreq_cooling: remove old power model and
 use EM
Date: Thu, 10 Dec 2020 14:30:13 +0000
Message-Id: <20201210143014.24685-5-lukasz.luba@arm.com>
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

Remove old power model and use new Energy Model to calculate the power
budget. It drops static + dynamic power calculations and power table
in order to use Energy Model performance domain data. This model
should be easy to use and could find more users. It is also less
complicated to setup the needed structures.

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/devfreq_cooling.c | 307 ++++++++++--------------------
 include/linux/devfreq_cooling.h   |  17 --
 2 files changed, 97 insertions(+), 227 deletions(-)

diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 6cea027d89a3..df1049a34777 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -34,20 +34,17 @@ static DEFINE_IDA(devfreq_ida);
  * @cdev:	Pointer to associated thermal cooling device.
  * @devfreq:	Pointer to associated devfreq device.
  * @cooling_state:	Current cooling state.
- * @power_table:	Pointer to table with maximum power draw for each
- *			cooling state. State is the index into the table, and
- *			the power is in mW.
  * @freq_table:	Pointer to a table with the frequencies sorted in descending
  *		order.  You can index the table by cooling device state
- * @freq_table_size:	Size of the @freq_table and @power_table
- * @power_ops:	Pointer to devfreq_cooling_power, used to generate the
- *		@power_table.
+ * @max_state:	It is the last index, that is, one less than the number of the
+ *		OPPs
+ * @power_ops:	Pointer to devfreq_cooling_power, a more precised model.
  * @res_util:	Resource utilization scaling factor for the power.
  *		It is multiplied by 100 to minimize the error. It is used
  *		for estimation of the power budget instead of using
- *		'utilization' (which is	'busy_time / 'total_time').
- *		The 'res_util' range is from 100 to (power_table[state] * 100)
- *		for the corresponding 'state'.
+ *		'utilization' (which is	'busy_time' / 'total_time').
+ *		The 'res_util' range is from 100 to power * 100	for the
+ *		corresponding 'state'.
  * @capped_state:	index to cooling state with in dynamic power budget
  * @req_max_freq:	PM QoS request for limiting the maximum frequency
  *			of the devfreq device.
@@ -57,9 +54,8 @@ struct devfreq_cooling_device {
 	struct thermal_cooling_device *cdev;
 	struct devfreq *devfreq;
 	unsigned long cooling_state;
-	u32 *power_table;
 	u32 *freq_table;
-	size_t freq_table_size;
+	size_t max_state;
 	struct devfreq_cooling_power *power_ops;
 	u32 res_util;
 	int capped_state;
@@ -71,7 +67,7 @@ static int devfreq_cooling_get_max_state(struct thermal_cooling_device *cdev,
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 
-	*state = dfc->freq_table_size - 1;
+	*state = dfc->max_state;
 
 	return 0;
 }
@@ -93,16 +89,22 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 	struct devfreq *df = dfc->devfreq;
 	struct device *dev = df->dev.parent;
 	unsigned long freq;
+	int perf_idx;
 
 	if (state == dfc->cooling_state)
 		return 0;
 
 	dev_dbg(dev, "Setting cooling state %lu\n", state);
 
-	if (state >= dfc->freq_table_size)
+	if (state > dfc->max_state)
 		return -EINVAL;
 
-	freq = dfc->freq_table[state];
+	if (dev->em_pd) {
+		perf_idx = dfc->max_state - state;
+		freq = dev->em_pd->table[perf_idx].frequency * 1000;
+	} else {
+		freq = dfc->freq_table[state];
+	}
 
 	dev_pm_qos_update_request(&dfc->req_max_freq,
 				  DIV_ROUND_UP(freq, HZ_PER_KHZ));
@@ -113,24 +115,23 @@ static int devfreq_cooling_set_cur_state(struct thermal_cooling_device *cdev,
 }
 
 /**
- * freq_get_state() - get the cooling state corresponding to a frequency
- * @dfc:	Pointer to devfreq cooling device
- * @freq:	frequency in Hz
+ * get_perf_idx() - get the performance index corresponding to a frequency
+ * @em_pd:	Pointer to device's Energy Model
+ * @freq:	frequency in kHz
  *
- * Return: the cooling state associated with the @freq, or
- * THERMAL_CSTATE_INVALID if it wasn't found.
+ * Return: the performance index associated with the @freq, or
+ * -EINVAL if it wasn't found.
  */
-static unsigned long
-freq_get_state(struct devfreq_cooling_device *dfc, unsigned long freq)
+static int get_perf_idx(struct em_perf_domain *em_pd, unsigned long freq)
 {
 	int i;
 
-	for (i = 0; i < dfc->freq_table_size; i++) {
-		if (dfc->freq_table[i] == freq)
+	for (i = 0; i < em_pd->nr_perf_states; i++) {
+		if (em_pd->table[i].frequency == freq)
 			return i;
 	}
 
-	return THERMAL_CSTATE_INVALID;
+	return -EINVAL;
 }
 
 static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
@@ -161,73 +162,6 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
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
-{
-	u64 power;
-	u32 freq_mhz;
-	struct devfreq_cooling_power *dfc_power = dfc->power_ops;
-
-	if (dfc_power->get_dynamic_power)
-		return dfc_power->get_dynamic_power(dfc->devfreq, freq,
-						    voltage);
-
-	freq_mhz = freq / 1000000;
-	power = (u64)dfc_power->dyn_power_coeff * freq_mhz * voltage * voltage;
-	do_div(power, 1000000000);
-
-	return power;
-}
-
-
-static inline unsigned long get_total_power(struct devfreq_cooling_device *dfc,
-					    unsigned long freq,
-					    unsigned long voltage)
-{
-	return get_static_power(dfc, freq) + get_dynamic_power(dfc, freq,
-							       voltage);
-}
-
 static void _normalize_load(struct devfreq_dev_status *status)
 {
 	if (status->total_time > 0xfffff) {
@@ -247,13 +181,12 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 	struct devfreq *df = dfc->devfreq;
+	struct device *dev = df->dev.parent;
 	struct devfreq_dev_status status;
 	unsigned long state;
 	unsigned long freq;
 	unsigned long voltage;
-	u32 dyn_power = 0;
-	u32 static_power = 0;
-	int res;
+	int res, perf_idx;
 
 	mutex_lock(&df->lock);
 	status = df->last_status;
@@ -261,13 +194,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 
 	freq = status.current_frequency;
 
-	state = freq_get_state(dfc, freq);
-	if (state == THERMAL_CSTATE_INVALID) {
-		res = -EAGAIN;
-		goto fail;
-	}
-
-	if (dfc->power_ops->get_real_power) {
+	if (dfc->power_ops && dfc->power_ops->get_real_power) {
 		voltage = get_voltage(df, freq);
 		if (voltage == 0) {
 			res = -EINVAL;
@@ -277,7 +204,7 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 		res = dfc->power_ops->get_real_power(df, power, freq, voltage);
 		if (!res) {
 			state = dfc->capped_state;
-			dfc->res_util = dfc->power_table[state];
+			dfc->res_util = dev->em_pd->table[state].power;
 			dfc->res_util *= SCALE_ERROR_MITIGATION;
 
 			if (*power > 1)
@@ -286,17 +213,19 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 			goto fail;
 		}
 	} else {
-		dyn_power = dfc->power_table[state];
+		/* Energy Model frequencies are in kHz */
+		perf_idx = get_perf_idx(dev->em_pd, freq / 1000);
+		if (perf_idx < 0) {
+			res = -EAGAIN;
+			goto fail;
+		}
 
 		_normalize_load(&status);
 
-		/* Scale dynamic power for utilization */
-		dyn_power *= status.busy_time;
-		dyn_power >>= 10;
-		/* Get static power */
-		static_power = get_static_power(dfc, freq);
-
-		*power = dyn_power + static_power;
+		/* Scale power for utilization */
+		*power = dev->em_pd->table[perf_idx].power;
+		*power *= status.busy_time;
+		*power >>= 10;
 	}
 
 	trace_thermal_power_devfreq_get_power(cdev, &status, freq, *power);
@@ -309,20 +238,19 @@ static int devfreq_cooling_get_requested_power(struct thermal_cooling_device *cd
 }
 
 static int devfreq_cooling_state2power(struct thermal_cooling_device *cdev,
-				       unsigned long state,
-				       u32 *power)
+				       unsigned long state, u32 *power)
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
-	unsigned long freq;
-	u32 static_power;
+	struct devfreq *df = dfc->devfreq;
+	struct device *dev = df->dev.parent;
+	int perf_idx;
 
-	if (state >= dfc->freq_table_size)
+	if (state > dfc->max_state)
 		return -EINVAL;
 
-	freq = dfc->freq_table[state];
-	static_power = get_static_power(dfc, freq);
+	perf_idx = dfc->max_state - state;
+	*power = dev->em_pd->table[perf_idx].power;
 
-	*power = dfc->power_table[state] + static_power;
 	return 0;
 }
 
@@ -331,10 +259,9 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
 {
 	struct devfreq_cooling_device *dfc = cdev->devdata;
 	struct devfreq *df = dfc->devfreq;
+	struct device *dev = df->dev.parent;
 	struct devfreq_dev_status status;
 	unsigned long freq;
-	s32 dyn_power;
-	u32 static_power;
 	s32 est_power;
 	int i;
 
@@ -344,32 +271,28 @@ static int devfreq_cooling_power2state(struct thermal_cooling_device *cdev,
 
 	freq = status.current_frequency;
 
-	if (dfc->power_ops->get_real_power) {
+	if (dfc->power_ops && dfc->power_ops->get_real_power) {
 		/* Scale for resource utilization */
 		est_power = power * dfc->res_util;
 		est_power /= SCALE_ERROR_MITIGATION;
 	} else {
-		static_power = get_static_power(dfc, freq);
-
-		dyn_power = power - static_power;
-		dyn_power = dyn_power > 0 ? dyn_power : 0;
-
 		/* Scale dynamic power for utilization */
 		_normalize_load(&status);
-		dyn_power <<= 10;
-		est_power = dyn_power / status.busy_time;
+		est_power = power << 10;
+		est_power /= status.busy_time;
 	}
 
 	/*
 	 * Find the first cooling state that is within the power
-	 * budget for dynamic power.
+	 * budget. The EM power table is sorted ascending.
 	 */
-	for (i = 0; i < dfc->freq_table_size - 1; i++)
-		if (est_power >= dfc->power_table[i])
+	for (i = dfc->max_state; i > 0; i--)
+		if (est_power >= dev->em_pd->table[i].power)
 			break;
 
-	*state = i;
-	dfc->capped_state = i;
+	*state = dfc->max_state - i;
+	dfc->capped_state = *state;
+
 	trace_thermal_power_devfreq_limit(cdev, freq, *state, power);
 	return 0;
 }
@@ -381,91 +304,43 @@ static struct thermal_cooling_device_ops devfreq_cooling_ops = {
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
@@ -488,9 +363,10 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 				  struct devfreq_cooling_power *dfc_power)
 {
 	struct thermal_cooling_device *cdev;
+	struct device *dev = df->dev.parent;
 	struct devfreq_cooling_device *dfc;
 	char dev_name[THERMAL_NAME_LENGTH];
-	int err;
+	int err, num_opps;
 
 	dfc = kzalloc(sizeof(*dfc), GFP_KERNEL);
 	if (!dfc)
@@ -498,28 +374,44 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 	dfc->devfreq = df;
 
-	if (dfc_power) {
-		dfc->power_ops = dfc_power;
-
+	if (dev->em_pd) {
 		devfreq_cooling_ops.get_requested_power =
 			devfreq_cooling_get_requested_power;
 		devfreq_cooling_ops.state2power = devfreq_cooling_state2power;
 		devfreq_cooling_ops.power2state = devfreq_cooling_power2state;
+
+		dfc->power_ops = dfc_power;
+
+		num_opps = em_pd_nr_perf_states(dev->em_pd);
+	} else {
+		/* Backward compatibility for drivers which do not use IPA */
+		dev_dbg(dev, "missing EM for cooling device\n");
+
+		num_opps = dev_pm_opp_get_opp_count(dev);
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
+	/* max_state is an index, not a counter */
+	dfc->max_state = num_opps - 1;
 
-	err = dev_pm_qos_add_request(df->dev.parent, &dfc->req_max_freq,
+	err = dev_pm_qos_add_request(dev, &dfc->req_max_freq,
 				     DEV_PM_QOS_MAX_FREQUENCY,
 				     PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
 	if (err < 0)
-		goto free_tables;
+		goto free_table;
 
 	err = ida_simple_get(&devfreq_ida, 0, 0, GFP_KERNEL);
 	if (err < 0)
 		goto remove_qos_req;
+
 	dfc->id = err;
 
 	snprintf(dev_name, sizeof(dev_name), "thermal-devfreq-%d", dfc->id);
@@ -528,7 +420,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 						  &devfreq_cooling_ops);
 	if (IS_ERR(cdev)) {
 		err = PTR_ERR(cdev);
-		dev_err(df->dev.parent,
+		dev_err(dev,
 			"Failed to register devfreq cooling device (%d)\n",
 			err);
 		goto release_ida;
@@ -540,12 +432,9 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 
 release_ida:
 	ida_simple_remove(&devfreq_ida, dfc->id);
-
 remove_qos_req:
 	dev_pm_qos_remove_request(&dfc->req_max_freq);
-
-free_tables:
-	kfree(dfc->power_table);
+free_table:
 	kfree(dfc->freq_table);
 free_dfc:
 	kfree(dfc);
@@ -644,9 +533,7 @@ void devfreq_cooling_unregister(struct thermal_cooling_device *cdev)
 
 	em_dev_unregister_perf_domain(dev);
 
-	kfree(dfc->power_table);
 	kfree(dfc->freq_table);
-
 	kfree(dfc);
 }
 EXPORT_SYMBOL_GPL(devfreq_cooling_unregister);
diff --git a/include/linux/devfreq_cooling.h b/include/linux/devfreq_cooling.h
index 7a9fbcc7b265..14baa73fc2de 100644
--- a/include/linux/devfreq_cooling.h
+++ b/include/linux/devfreq_cooling.h
@@ -16,17 +16,6 @@
 
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
@@ -46,14 +35,8 @@
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
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
