Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F71A44A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5A26ECB2;
	Fri, 10 Apr 2020 09:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 284A26EC93
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Apr 2020 08:43:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B79527FA;
 Fri, 10 Apr 2020 01:43:10 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFACC3F68F;
 Fri, 10 Apr 2020 01:43:00 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs in
 Energy Model
Date: Fri, 10 Apr 2020 09:42:04 +0100
Message-Id: <20200410084210.24932-5-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200410084210.24932-1-lukasz.luba@arm.com>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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

Add support for other devices that CPUs. The registration function
does not require a valid cpumask pointer and is ready to handle new
devices. Some of the internal structures has been reorganized in order to
keep consistent view (like removing per_cpu pd pointers). To track usage
of the Energy Model structures, they are protected with kref.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 include/linux/energy_model.h |  32 ++-
 kernel/power/energy_model.c  | 433 +++++++++++++++++++++++++++++------
 2 files changed, 389 insertions(+), 76 deletions(-)

diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index 7076cb22b247..f6b8077cc875 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -12,8 +12,10 @@
 
 /**
  * em_perf_state - Performance state of a performance domain
- * @frequency:	The CPU frequency in KHz, for consistency with CPUFreq
- * @power:	The power consumed by 1 CPU at this level, in milli-watts
+ * @frequency:	The frequency in KHz, for consistency with CPUFreq
+ * @power:	The power consumed at this level, in milli-watts (by 1 CPU or
+		by a registered device). It can be a total power: static and
+		dynamic.
  * @cost:	The cost coefficient associated with this level, used during
  *		energy calculation. Equal to: power * max_frequency / frequency
  */
@@ -27,12 +29,15 @@ struct em_perf_state {
  * em_perf_domain - Performance domain
  * @table:		List of performance states, in ascending order
  * @nr_perf_states:	Number of performance states
- * @cpus:		Cpumask covering the CPUs of the domain
+ * @cpus:		Cpumask covering the CPUs of the domain. It's here
+ *			for performance reasons to avoid potential cache
+ *			misses during energy calculations in the scheduler
  *
- * A "performance domain" represents a group of CPUs whose performance is
- * scaled together. All CPUs of a performance domain must have the same
- * micro-architecture. Performance domains often have a 1-to-1 mapping with
- * CPUFreq policies.
+ * In case of CPU device, a "performance domain" represents a group of CPUs
+ * whose performance is scaled together. All CPUs of a performance domain
+ * must have the same micro-architecture. Performance domains often have
+ * a 1-to-1 mapping with CPUFreq policies. In case of other devices the 'cpus'
+ * field is unused.
  */
 struct em_perf_domain {
 	struct em_perf_state *table;
@@ -71,10 +76,13 @@ struct em_data_callback {
 #define EM_DATA_CB(_active_power_cb) { .active_power = &_active_power_cb }
 
 struct em_perf_domain *em_cpu_get(int cpu);
+struct em_perf_domain *em_pd_get(struct device *dev);
+void em_pd_put(struct device *dev);
 int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 						struct em_data_callback *cb);
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 				struct em_data_callback *cb, cpumask_t *span);
+void em_dev_unregister_perf_domain(struct device *dev);
 
 /**
  * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
@@ -184,10 +192,20 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 {
 	return -EINVAL;
 }
+static inline void em_dev_unregister_perf_domain(struct device *dev)
+{
+}
 static inline struct em_perf_domain *em_cpu_get(int cpu)
 {
 	return NULL;
 }
+static inline struct em_perf_domain *em_pd_get(struct device *dev)
+{
+	return NULL;
+}
+static inline void em_pd_put(struct device *dev)
+{
+}
 static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 			unsigned long max_util, unsigned long sum_util)
 {
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 5b8a1566526a..5967a21b56fc 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -2,8 +2,9 @@
 /*
  * Energy Model of CPUs
  *
- * Copyright (c) 2018, Arm ltd.
+ * Copyright (c) 2018-2020, Arm ltd.
  * Written by: Quentin Perret, Arm ltd.
+ * Improvements provided by: Lukasz Luba, Arm ltd.
  */
 
 #define pr_fmt(fmt) "energy_model: " fmt
@@ -12,17 +13,46 @@
 #include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/energy_model.h>
+#include <linux/idr.h>
+#include <linux/kref.h>
 #include <linux/sched/topology.h>
 #include <linux/slab.h>
 
-/* Mapping of each CPU to the performance domain to which it belongs. */
-static DEFINE_PER_CPU(struct em_perf_domain *, em_data);
+/**
+ * em_device - Performance domain wrapper for device
+ * @em_pd:		Performance domain which carries the energy model
+ * @dev:		Device for which this performance domain is set
+ * @id:			Id of this performance domain
+ * @em_dev_list:	List entry to connect all the devices perf. domain
+ * @debug_dir:		Optional debug directory
+ *
+ * Internal structure. It contains a "performance domain" and the corresponding
+ * device.
+ */
+struct em_device {
+	struct em_perf_domain *em_pd;
+	struct device *dev;
+	int id;
+	struct kref kref;
+	struct list_head em_dev_list;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debug_dir;
+#endif
+};
 
+static DEFINE_IDA(em_dev_ida);
 /*
  * Mutex serializing the registrations of performance domains and letting
  * callbacks defined by drivers sleep.
  */
 static DEFINE_MUTEX(em_pd_mutex);
+/* List of devices' energy model, protected by 'em_pd_mutex' */
+static LIST_HEAD(em_pd_dev_list);
+
+static bool _is_cpu_device(struct device *dev)
+{
+	return (dev->bus == &cpu_subsys);
+}
 
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *rootdir;
@@ -43,28 +73,74 @@ static void em_debug_create_ps(struct em_perf_state *ps, struct dentry *pd)
 
 static int em_debug_cpus_show(struct seq_file *s, void *unused)
 {
-	seq_printf(s, "%*pbl\n", cpumask_pr_args(to_cpumask(s->private)));
+	struct em_perf_domain *em_pd = s->private;
+	struct cpumask *mask = em_span_cpus(em_pd);
+
+	seq_printf(s, "%*pbl\n", cpumask_pr_args(mask));
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(em_debug_cpus);
 
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
+static int em_debug_dev_show(struct seq_file *s, void *unused)
 {
+	struct em_device *em_dev = s->private;
+	const char *domain_name;
+
+	domain_name = dev_name(em_dev->dev);
+	if (!domain_name)
+		domain_name = "unknown";
+
+	seq_printf(s, "%s\n", domain_name);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(em_debug_dev);
+
+static int em_debug_type_show(struct seq_file *s, void *unused)
+{
+	struct em_device *em_dev = s->private;
+
+	if (_is_cpu_device(em_dev->dev))
+		seq_puts(s, "EM cpufreq device\n");
+	else
+		seq_puts(s, "EM devfreq device\n");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(em_debug_type);
+
+static void em_debug_create_pd(struct em_device *em_dev)
+{
+	struct em_perf_domain *em_pd = em_dev->em_pd;
 	struct dentry *d;
 	char name[8];
 	int i;
 
-	snprintf(name, sizeof(name), "pd%d", cpu);
+	snprintf(name, sizeof(name), "pd%d", em_dev->id);
 
 	/* Create the directory of the performance domain */
 	d = debugfs_create_dir(name, rootdir);
 
-	debugfs_create_file("cpus", 0444, d, pd->cpus, &em_debug_cpus_fops);
+	if (_is_cpu_device(em_dev->dev))
+		debugfs_create_file("cpus", 0444, d, em_pd,
+				    &em_debug_cpus_fops);
+	else
+		debugfs_create_file("dev_name", 0444, d, em_dev,
+				    &em_debug_dev_fops);
+
+	debugfs_create_file("type", 0444, d, em_dev, &em_debug_type_fops);
 
 	/* Create a sub-directory for each performance state */
-	for (i = 0; i < pd->nr_perf_states; i++)
-		em_debug_create_ps(&pd->table[i], d);
+	for (i = 0; i < em_pd->nr_perf_states; i++)
+		em_debug_create_ps(&em_pd->table[i], d);
+
+	em_dev->debug_dir = d;
+}
+
+static void em_debug_remove_pd(struct em_device *em_dev)
+{
+	debugfs_remove_recursive(em_dev->debug_dir);
 }
 
 static int __init em_debug_init(void)
@@ -76,40 +152,34 @@ static int __init em_debug_init(void)
 }
 core_initcall(em_debug_init);
 #else /* CONFIG_DEBUG_FS */
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu) {}
+static void em_debug_create_pd(struct em_device *em_dev) {}
+static void em_debug_remove_pd(struct em_device *em_dev) {}
 #endif
-static struct em_perf_domain *
-em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
-	     cpumask_t *span)
+
+static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
+				int nr_states, struct em_data_callback *cb)
 {
 	unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
 	unsigned long power, freq, prev_freq = 0;
-	int i, ret, cpu = cpumask_first(span);
 	struct em_perf_state *table;
-	struct em_perf_domain *pd;
+	int i, ret;
 	u64 fmax;
 
-	if (!cb->active_power)
-		return NULL;
-
-	pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
-	if (!pd)
-		return NULL;
-
 	table = kcalloc(nr_states, sizeof(*table), GFP_KERNEL);
 	if (!table)
-		goto free_pd;
+		return -ENOMEM;
 
 	/* Build the list of performance states for this performance domain */
 	for (i = 0, freq = 0; i < nr_states; i++, freq++) {
 		/*
 		 * active_power() is a driver callback which ceils 'freq' to
-		 * lowest performance state of 'cpu' above 'freq' and updates
+		 * lowest performance state of 'dev' above 'freq' and updates
 		 * 'power' and 'freq' accordingly.
 		 */
 		ret = cb->active_power(&power, &freq, dev);
 		if (ret) {
-			pr_err("pd%d: invalid perf. state: %d\n", cpu, ret);
+			dev_err(dev, "EM: invalid perf. state: %d\n",
+				ret);
 			goto free_ps_table;
 		}
 
@@ -118,7 +188,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 		 * higher performance states.
 		 */
 		if (freq <= prev_freq) {
-			pr_err("pd%d: non-increasing freq: %lu\n", cpu, freq);
+			dev_err(dev, "EM: non-increasing freq: %lu\n",
+				freq);
 			goto free_ps_table;
 		}
 
@@ -127,7 +198,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 		 * positive, in milli-watts and to fit into 16 bits.
 		 */
 		if (!power || power > EM_MAX_POWER) {
-			pr_err("pd%d: invalid power: %lu\n", cpu, power);
+			dev_err(dev, "EM: invalid power: %lu\n",
+				power);
 			goto free_ps_table;
 		}
 
@@ -142,8 +214,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 		 */
 		opp_eff = freq / power;
 		if (opp_eff >= prev_opp_eff)
-			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
-					cpu, i, i - 1);
+			dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
+					i, i - 1);
 		prev_opp_eff = opp_eff;
 	}
 
@@ -156,30 +228,143 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
 
 	pd->table = table;
 	pd->nr_perf_states = nr_states;
-	cpumask_copy(to_cpumask(pd->cpus), span);
-
-	em_debug_create_pd(pd, cpu);
 
-	return pd;
+	return 0;
 
 free_ps_table:
 	kfree(table);
-free_pd:
-	kfree(pd);
+	return -EINVAL;
+}
+
+static struct em_perf_domain *em_create_pd(struct device *dev, int nr_states,
+					   struct em_data_callback *cb,
+					   cpumask_t *cpus)
+{
+	struct em_perf_domain *pd;
+	int ret;
+
+	if (_is_cpu_device(dev)) {
+		pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
+		if (!pd)
+			return NULL;
+
+		cpumask_copy(em_span_cpus(pd), cpus);
+	} else {
+		pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+		if (!pd)
+			return NULL;
+	}
+
+	ret = em_create_perf_table(dev, pd, nr_states, cb);
+	if (ret) {
+		kfree(pd);
+		return NULL;
+	}
+
+	return pd;
+}
+
+static bool em_cpus_pd_exist(cpumask_t *span)
+{
+	struct em_device *em_dev;
+
+	/* The em_pd_mutex should be held already. */
+	if (list_empty(&em_pd_dev_list))
+		return 0;
+
+	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
+		if (!_is_cpu_device(em_dev->dev))
+			continue;
+
+		if (cpumask_intersects(span, em_span_cpus(em_dev->em_pd)))
+			return 1;
+	}
+
+	return 0;
+}
+
+static struct em_device *_em_dev_find_existing(struct device *dev)
+{
+	struct em_device *em_dev;
+
+	/* The em_pd_mutex should be held already. */
+	if (list_empty(&em_pd_dev_list))
+		return NULL;
+
+	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list)
+		if (em_dev->dev == dev)
+			return em_dev;
 
 	return NULL;
 }
 
+/**
+ * em_pd_get() - Return the performance domain for a device
+ * @dev : Device to find the performance domain for
+ *
+ * Returns the performance domain to which 'dev' belongs, or NULL if it doesn't
+ * exist.
+ */
+struct em_perf_domain *em_pd_get(struct device *dev)
+{
+	struct em_perf_domain *pd = NULL;
+	struct em_device *em_dev;
+
+	if (IS_ERR_OR_NULL(dev))
+		return NULL;
+
+	if (_is_cpu_device(dev))
+		return em_cpu_get(dev->id);
+
+	mutex_lock(&em_pd_mutex);
+
+	em_dev = _em_dev_find_existing(dev);
+	if (em_dev) {
+		kref_get(&em_dev->kref);
+		pd = em_dev->em_pd;
+	}
+
+	mutex_unlock(&em_pd_mutex);
+	return pd;
+}
+EXPORT_SYMBOL_GPL(em_pd_get);
+
 /**
  * em_cpu_get() - Return the performance domain for a CPU
  * @cpu : CPU to find the performance domain for
  *
- * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
+ * This function is especially useful for subsystems which operate on CPU id,
+ * like topology setup code does. It simplifies code in those subsystems.
+ *
+ * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
  * exist.
  */
 struct em_perf_domain *em_cpu_get(int cpu)
 {
-	return READ_ONCE(per_cpu(em_data, cpu));
+	struct em_device *em_dev;
+
+	mutex_lock(&em_pd_mutex);
+
+	if (list_empty(&em_pd_dev_list))
+		goto unlock;
+
+	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
+		if (!_is_cpu_device(em_dev->dev))
+			continue;
+
+		if (cpumask_test_cpu(cpu, em_span_cpus(em_dev->em_pd))) {
+			/*
+			 * Don't increment kref here, we won't free the EM
+			 * in CPU hotlpug.
+			 */
+			mutex_unlock(&em_pd_mutex);
+			return em_dev->em_pd;
+		}
+	}
+
+unlock:
+	mutex_unlock(&em_pd_mutex);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(em_cpu_get);
 
@@ -188,7 +373,7 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  * @dev		: Device for which the EM is to register
  * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
- * @span	: Pointer to cpumask_t, which in case of a CPU device is
+ * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
  *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
  *		type of devices this should be set to NULL.
  *
@@ -201,13 +386,14 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  * Return 0 on success
  */
 int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
-				struct em_data_callback *cb, cpumask_t *span)
+				struct em_data_callback *cb, cpumask_t *cpus)
 {
 	unsigned long cap, prev_cap = 0;
 	struct em_perf_domain *pd;
+	struct em_device *em_dev;
 	int cpu, ret = 0;
 
-	if (!dev || !span || !nr_states || !cb)
+	if (!dev || !nr_states || !cb)
 		return -EINVAL;
 
 	/*
@@ -216,51 +402,104 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
 	 */
 	mutex_lock(&em_pd_mutex);
 
-	for_each_cpu(cpu, span) {
-		/* Make sure we don't register again an existing domain. */
-		if (READ_ONCE(per_cpu(em_data, cpu))) {
-			ret = -EEXIST;
-			goto unlock;
+	em_dev = _em_dev_find_existing(dev);
+	if (em_dev) {
+		mutex_unlock(&em_pd_mutex);
+		dev_dbg(dev, "EM: found exisiting pd%d\n", em_dev->id);
+		return -EEXIST;
+	}
+
+	if (_is_cpu_device(dev)) {
+		if (!cpus) {
+			mutex_unlock(&em_pd_mutex);
+			dev_err(dev, "EM: invalid CPU mask\n");
+			return -EINVAL;
 		}
 
-		/*
-		 * All CPUs of a domain must have the same micro-architecture
-		 * since they all share the same table.
-		 */
-		cap = arch_scale_cpu_capacity(cpu);
-		if (prev_cap && prev_cap != cap) {
-			pr_err("CPUs of %*pbl must have the same capacity\n",
-							cpumask_pr_args(span));
-			ret = -EINVAL;
-			goto unlock;
+		/* Make sure we don't register domain for existing CPUs */
+		if (em_cpus_pd_exist(cpus)) {
+			mutex_unlock(&em_pd_mutex);
+			return -EEXIST;
+		}
+
+		for_each_cpu(cpu, cpus) {
+			/*
+			 * All CPUs of a domain must have the same
+			 * micro-architecture since they all share the same
+			 * table.
+			 */
+			cap = arch_scale_cpu_capacity(cpu);
+			if (prev_cap && prev_cap != cap) {
+				dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
+					cpumask_pr_args(cpus));
+
+				mutex_unlock(&em_pd_mutex);
+				return -EINVAL;
+			}
+			prev_cap = cap;
 		}
-		prev_cap = cap;
 	}
 
-	/* Create the performance domain and add it to the Energy Model. */
-	pd = em_create_pd(dev, nr_states, cb, span);
+	pd = em_create_pd(dev, nr_states, cb, cpus);
 	if (!pd) {
-		ret = -EINVAL;
-		goto unlock;
+		mutex_unlock(&em_pd_mutex);
+		return -EINVAL;
 	}
 
-	for_each_cpu(cpu, span) {
-		/*
-		 * The per-cpu array can be read concurrently from em_cpu_get().
-		 * The barrier enforces the ordering needed to make sure readers
-		 * can only access well formed em_perf_domain structs.
-		 */
-		smp_store_release(per_cpu_ptr(&em_data, cpu), pd);
+	em_dev = kzalloc(sizeof(struct em_device), GFP_KERNEL);
+	if (!em_dev) {
+		ret = -ENOMEM;
+		goto free_pd;
 	}
 
-	pr_debug("Created perf domain %*pbl\n", cpumask_pr_args(span));
-unlock:
+	em_dev->id = ida_simple_get(&em_dev_ida, 0, 0, GFP_KERNEL);
+	if (em_dev->id < 0) {
+		ret = em_dev->id;
+		goto free_em_dev;
+	}
+
+	em_dev->em_pd = pd;
+	em_dev->dev = dev;
+
+	kref_init(&em_dev->kref);
+	list_add(&em_dev->em_dev_list, &em_pd_dev_list);
+
+	em_debug_create_pd(em_dev);
+	dev_dbg(dev, "EM: created perf domain pd%d\n", em_dev->id);
+
 	mutex_unlock(&em_pd_mutex);
+	return 0;
 
+free_em_dev:
+	kfree(em_dev);
+free_pd:
+	kfree(pd->table);
+	kfree(pd);
+
+	mutex_unlock(&em_pd_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
 
+static void _em_release(struct kref *ref)
+{
+	struct em_device *em_dev = container_of(ref, struct em_device, kref);
+	struct em_perf_domain *pd = em_dev->em_pd;
+
+	dev_dbg(em_dev->dev, "EM: freeing perf domain pd%d\n", em_dev->id);
+
+	/* The em_pd_mutex is already locked. */
+	list_del(&em_dev->em_dev_list);
+
+	em_debug_remove_pd(em_dev);
+
+	ida_simple_remove(&em_dev_ida, em_dev->id);
+
+	kfree(pd->table);
+	kfree(pd);
+	kfree(em_dev);
+}
+
 /**
  * em_register_perf_domain() - Register the Energy Model of a performance domain
  * @span	: Mask of CPUs in the performance domain
@@ -285,3 +524,59 @@ int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
 	return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
 }
 EXPORT_SYMBOL_GPL(em_register_perf_domain);
+
+/**
+ * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
+ * @dev		: Device for which the EM is registered
+ *
+ * Try to unregister the EM for the specified device (it checks current
+ * reference counter). The EM for CPUs will not be freed.
+ */
+void em_dev_unregister_perf_domain(struct device *dev)
+{
+	struct em_device *em_dev, *tmp;
+
+	if (IS_ERR_OR_NULL(dev))
+		return;
+
+	/* We don't support freeing CPU structures in hotplug */
+	if (_is_cpu_device(dev)) {
+		dev_dbg_once(dev, "EM: the structures are not going to be removed\n");
+		return;
+	}
+
+	mutex_lock(&em_pd_mutex);
+
+	if (list_empty(&em_pd_dev_list)) {
+		mutex_unlock(&em_pd_mutex);
+		return;
+	}
+
+	list_for_each_entry_safe(em_dev, tmp, &em_pd_dev_list, em_dev_list) {
+		if (em_dev->dev == dev) {
+			kref_put(&em_dev->kref, _em_release);
+			break;
+		}
+	}
+
+	mutex_unlock(&em_pd_mutex);
+}
+EXPORT_SYMBOL_GPL(em_dev_unregister_perf_domain);
+
+/**
+ * em_pd_put() - Decrement reference of the Energy Model (EM) for the device
+ * @dev		: Device for which the EM is registered
+ *
+ * Decrement reference of the EM for the specified device. If it was the last
+ * reference then it will trigger cleaning. The EM for CPUs will not be freed,
+ * though. It goes in pair with em_pd_get() (which incremented a kref counter).
+ * This should be called when the code which called em_pd_get() has finished
+ * its work with EM structs and won't use them in future. Typical places where
+ * this should be called are e.g. driver unregister function or framework clean
+ * up functions.
+ */
+void em_pd_put(struct device *dev)
+{
+	em_dev_unregister_perf_domain(dev);
+}
+EXPORT_SYMBOL_GPL(em_pd_put);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
