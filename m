Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDA18AE0F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153556E9AE;
	Thu, 19 Mar 2020 08:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B32776E8C1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 11:46:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB1B47FA;
 Wed, 18 Mar 2020 04:46:32 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2F5DE3F534;
 Wed, 18 Mar 2020 04:46:21 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v5 1/5] PM / EM: add devices to Energy Model
Date: Wed, 18 Mar 2020 11:45:44 +0000
Message-Id: <20200318114548.19916-2-lukasz.luba@arm.com>
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

Add support of other devices into the Energy Model framework not only the
CPUs. Change the interface to be more unified which can handle other
devices as well.

Acked-by: Quentin Perret <qperret@google.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 Documentation/power/energy-model.rst     | 133 ++++---
 Documentation/scheduler/sched-energy.rst |   2 +-
 drivers/cpufreq/scmi-cpufreq.c           |  13 +-
 drivers/opp/of.c                         |   9 +-
 drivers/thermal/cpufreq_cooling.c        |  12 +-
 include/linux/energy_model.h             | 111 ++++--
 kernel/power/energy_model.c              | 465 ++++++++++++++++++-----
 kernel/sched/fair.c                      |   2 +-
 kernel/sched/topology.c                  |   4 +-
 9 files changed, 541 insertions(+), 210 deletions(-)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index 90a345d57ae9..c0a08ecd4e32 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -1,15 +1,17 @@
-====================
-Energy Model of CPUs
-====================
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+Energy Model of devices
+=======================
 
 1. Overview
 -----------
 
 The Energy Model (EM) framework serves as an interface between drivers knowing
-the power consumed by CPUs at various performance levels, and the kernel
+the power consumed by devices at various performance levels, and the kernel
 subsystems willing to use that information to make energy-aware decisions.
 
-The source of the information about the power consumed by CPUs can vary greatly
+The source of the information about the power consumed by devices can vary greatly
 from one platform to another. These power costs can be estimated using
 devicetree data in some cases. In others, the firmware will know better.
 Alternatively, userspace might be best positioned. And so on. In order to avoid
@@ -25,7 +27,7 @@ framework, and interested clients reading the data from it::
        +---------------+  +-----------------+  +---------------+
        | Thermal (IPA) |  | Scheduler (EAS) |  |     Other     |
        +---------------+  +-----------------+  +---------------+
-               |                   | em_pd_energy()    |
+               |                   | em_cpu_energy()   |
                |                   | em_cpu_get()      |
                +---------+         |         +---------+
                          |         |         |
@@ -47,12 +49,12 @@ framework, and interested clients reading the data from it::
         | Device Tree  |   |   Firmware    |  |      ?       |
         +--------------+   +---------------+  +--------------+
 
-The EM framework manages power cost tables per 'performance domain' in the
-system. A performance domain is a group of CPUs whose performance is scaled
-together. Performance domains generally have a 1-to-1 mapping with CPUFreq
-policies. All CPUs in a performance domain are required to have the same
-micro-architecture. CPUs in different performance domains can have different
-micro-architectures.
+In case of CPU devices the EM framework manages power cost tables per
+'performance domain' in the system. A performance domain is a group of CPUs
+whose performance is scaled together. Performance domains generally have a
+1-to-1 mapping with CPUFreq policies. All CPUs in a performance domain are
+required to have the same micro-architecture. CPUs in different performance
+domains can have different micro-architectures.
 
 
 2. Core APIs
@@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
 Drivers are expected to register performance domains into the EM framework by
 calling the following API::
 
-  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-			      struct em_data_callback *cb);
+  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
+		struct em_data_callback *cb, cpumask_t *cpus);
 
-Drivers must specify the CPUs of the performance domains using the cpumask
-argument, and provide a callback function returning <frequency, power> tuples
-for each capacity state. The callback function provided by the driver is free
+Drivers must provide a callback function returning <frequency, power> tuples
+for each performance state. The callback function provided by the driver is free
 to fetch data from any relevant location (DT, firmware, ...), and by any mean
-deemed necessary. See Section 3. for an example of driver implementing this
+deemed necessary. Only for CPU devices, drivers must specify the CPUs of the
+performance domains using cpumask. For other devices than CPUs the last
+argument must be set to NULL.
+See Section 3. for an example of driver implementing this
 callback, and kernel/power/energy_model.c for further documentation on this
 API.
 
@@ -85,13 +89,20 @@ API.
 2.3 Accessing performance domains
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+There are two API functions which provide the access to the energy model:
+em_cpu_get() which takes CPU id as an argument and em_pd_get() with device
+pointer as an argument. It depends on the subsystem which interface it is
+going to use, but in case of CPU devices both functions return the same
+performance domain.
+
 Subsystems interested in the energy model of a CPU can retrieve it using the
 em_cpu_get() API. The energy model tables are allocated once upon creation of
 the performance domains, and kept in memory untouched.
 
 The energy consumed by a performance domain can be estimated using the
-em_pd_energy() API. The estimation is performed assuming that the schedutil
-CPUfreq governor is in use.
+em_cpu_energy() API. The estimation is performed assuming that the schedutil
+CPUfreq governor is in use in case of CPU device. Currently this calculation is
+not provided for other type of devices.
 
 More details about the above APIs can be found in include/linux/energy_model.h.
 
@@ -106,42 +117,46 @@ EM framework::
 
   -> drivers/cpufreq/foo_cpufreq.c
 
-  01	static int est_power(unsigned long *mW, unsigned long *KHz, int cpu)
-  02	{
-  03		long freq, power;
-  04
-  05		/* Use the 'foo' protocol to ceil the frequency */
-  06		freq = foo_get_freq_ceil(cpu, *KHz);
-  07		if (freq < 0);
-  08			return freq;
-  09
-  10		/* Estimate the power cost for the CPU at the relevant freq. */
-  11		power = foo_estimate_power(cpu, freq);
-  12		if (power < 0);
-  13			return power;
-  14
-  15		/* Return the values to the EM framework */
-  16		*mW = power;
-  17		*KHz = freq;
-  18
-  19		return 0;
-  20	}
-  21
-  22	static int foo_cpufreq_init(struct cpufreq_policy *policy)
-  23	{
-  24		struct em_data_callback em_cb = EM_DATA_CB(est_power);
-  25		int nr_opp, ret;
-  26
-  27		/* Do the actual CPUFreq init work ... */
-  28		ret = do_foo_cpufreq_init(policy);
-  29		if (ret)
-  30			return ret;
-  31
-  32		/* Find the number of OPPs for this policy */
-  33		nr_opp = foo_get_nr_opp(policy);
-  34
-  35		/* And register the new performance domain */
-  36		em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
-  37
-  38	        return 0;
-  39	}
+  01	static int est_power(unsigned long *mW, unsigned long *KHz,
+  02			struct device *dev)
+  03	{
+  04		long freq, power;
+  05
+  06		/* Use the 'foo' protocol to ceil the frequency */
+  07		freq = foo_get_freq_ceil(dev, *KHz);
+  08		if (freq < 0);
+  09			return freq;
+  10
+  11		/* Estimate the power cost for the dev at the relevant freq. */
+  12		power = foo_estimate_power(dev, freq);
+  13		if (power < 0);
+  14			return power;
+  15
+  16		/* Return the values to the EM framework */
+  17		*mW = power;
+  18		*KHz = freq;
+  19
+  20		return 0;
+  21	}
+  22
+  23	static int foo_cpufreq_init(struct cpufreq_policy *policy)
+  24	{
+  25		struct em_data_callback em_cb = EM_DATA_CB(est_power);
+  26		struct device *cpu_dev;
+  27		int nr_opp, ret;
+  28
+  29		cpu_dev = get_cpu_device(cpumask_first(policy->cpus));
+  30
+  31     	/* Do the actual CPUFreq init work ... */
+  32     	ret = do_foo_cpufreq_init(policy);
+  33     	if (ret)
+  34     		return ret;
+  35
+  36     	/* Find the number of OPPs for this policy */
+  37     	nr_opp = foo_get_nr_opp(policy);
+  38
+  39     	/* And register the new performance domain */
+  40     	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
+  41
+  42	        return 0;
+  43	}
diff --git a/Documentation/scheduler/sched-energy.rst b/Documentation/scheduler/sched-energy.rst
index 9580c57a52bc..8ba5a581c1d6 100644
--- a/Documentation/scheduler/sched-energy.rst
+++ b/Documentation/scheduler/sched-energy.rst
@@ -141,7 +141,7 @@ in its previous activation.
 find_energy_efficient_cpu() uses compute_energy() to estimate what will be the
 energy consumed by the system if the waking task was migrated. compute_energy()
 looks at the current utilization landscape of the CPUs and adjusts it to
-'simulate' the task migration. The EM framework provides the em_pd_energy() API
+'simulate' the task migration. The EM framework provides the em_cpu_energy() API
 which computes the expected energy consumption of each performance domain for
 the given utilization landscape.
 
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 61623e2ff149..71ab0a545ac5 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -103,17 +103,12 @@ scmi_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
 }
 
 static int __maybe_unused
-scmi_get_cpu_power(unsigned long *power, unsigned long *KHz, int cpu)
+scmi_get_cpu_power(unsigned long *power, unsigned long *KHz,
+		   struct device *cpu_dev)
 {
-	struct device *cpu_dev = get_cpu_device(cpu);
 	unsigned long Hz;
 	int ret, domain;
 
-	if (!cpu_dev) {
-		pr_err("failed to get cpu%d device\n", cpu);
-		return -ENODEV;
-	}
-
 	domain = handle->perf_ops->device_domain_id(cpu_dev);
 	if (domain < 0)
 		return domain;
@@ -200,7 +195,9 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 
 	policy->fast_switch_possible = true;
 
-	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
+	ret = em_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
+	if (ret)
+		dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
 
 	return 0;
 
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 9cd8f0adacae..0efd6cf6d023 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1047,9 +1047,8 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_of_node);
  * calculation failed because of missing parameters, 0 otherwise.
  */
 static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
-					 int cpu)
+					 struct device *cpu_dev)
 {
-	struct device *cpu_dev;
 	struct dev_pm_opp *opp;
 	struct device_node *np;
 	unsigned long mV, Hz;
@@ -1057,10 +1056,6 @@ static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
 	u64 tmp;
 	int ret;
 
-	cpu_dev = get_cpu_device(cpu);
-	if (!cpu_dev)
-		return -ENODEV;
-
 	np = of_node_get(cpu_dev->of_node);
 	if (!np)
 		return -EINVAL;
@@ -1128,6 +1123,6 @@ void dev_pm_opp_of_register_em(struct cpumask *cpus)
 	if (ret || !cap)
 		return;
 
-	em_register_perf_domain(cpus, nr_opp, &em_cb);
+	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, cpus);
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_register_em);
diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 4ae8c856c88e..dfd1895c314c 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -333,18 +333,18 @@ static inline bool em_is_sane(struct cpufreq_cooling_device *cpufreq_cdev,
 		return false;
 
 	policy = cpufreq_cdev->policy;
-	if (!cpumask_equal(policy->related_cpus, to_cpumask(em->cpus))) {
+	if (!cpumask_equal(policy->related_cpus, em_span_cpus(em))) {
 		pr_err("The span of pd %*pbl is misaligned with cpufreq policy %*pbl\n",
-			cpumask_pr_args(to_cpumask(em->cpus)),
+			cpumask_pr_args(em_span_cpus(em)),
 			cpumask_pr_args(policy->related_cpus));
 		return false;
 	}
 
 	nr_levels = cpufreq_cdev->max_level + 1;
-	if (em->nr_cap_states != nr_levels) {
-		pr_err("The number of cap states in pd %*pbl (%u) doesn't match the number of cooling levels (%u)\n",
-			cpumask_pr_args(to_cpumask(em->cpus)),
-			em->nr_cap_states, nr_levels);
+	if (em->nr_perf_states != nr_levels) {
+		pr_err("The number of performance states in pd %*pbl (%u) doesn't match the number of cooling levels (%u)\n",
+			cpumask_pr_args(em_span_cpus(em)),
+			em->nr_perf_states, nr_levels);
 		return false;
 	}
 
diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index d249b88a4d5a..2664127e0972 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_ENERGY_MODEL_H
 #define _LINUX_ENERGY_MODEL_H
 #include <linux/cpumask.h>
+#include <linux/device.h>
 #include <linux/jump_label.h>
 #include <linux/kobject.h>
 #include <linux/rcupdate.h>
@@ -10,13 +11,15 @@
 #include <linux/types.h>
 
 /**
- * em_cap_state - Capacity state of a performance domain
- * @frequency:	The CPU frequency in KHz, for consistency with CPUFreq
- * @power:	The power consumed by 1 CPU at this level, in milli-watts
+ * em_perf_state - Performance state of a performance domain
+ * @frequency:	The frequency in KHz, for consistency with CPUFreq
+ * @power:	The power consumed at this level, in milli-watts (by 1 CPU or
+		by a registered device). It can be a total power: static and
+		dynamic.
  * @cost:	The cost coefficient associated with this level, used during
  *		energy calculation. Equal to: power * max_frequency / frequency
  */
-struct em_cap_state {
+struct em_perf_state {
 	unsigned long frequency;
 	unsigned long power;
 	unsigned long cost;
@@ -24,63 +27,77 @@ struct em_cap_state {
 
 /**
  * em_perf_domain - Performance domain
- * @table:		List of capacity states, in ascending order
- * @nr_cap_states:	Number of capacity states
- * @cpus:		Cpumask covering the CPUs of the domain
+ * @table:		List of performance states, in ascending order
+ * @nr_perf_states:	Number of performance states
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
-	struct em_cap_state *table;
-	int nr_cap_states;
-	unsigned long cpus[0];
+	struct em_perf_state *table;
+	int nr_perf_states;
+	unsigned long cpus[];
 };
 
+#define em_span_cpus(em) (to_cpumask((em)->cpus))
+
 #ifdef CONFIG_ENERGY_MODEL
-#define EM_CPU_MAX_POWER 0xFFFF
+#define EM_MAX_POWER 0xFFFF
 
 struct em_data_callback {
 	/**
-	 * active_power() - Provide power at the next capacity state of a CPU
-	 * @power	: Active power at the capacity state in mW (modified)
-	 * @freq	: Frequency at the capacity state in kHz (modified)
-	 * @cpu		: CPU for which we do this operation
+	 * active_power() - Provide power at the next performance state of a
+	 *		    device
+	 * @power	: Active power at the performance state in mW (modified)
+	 * @freq	: Frequency at the performance state in kHz (modified)
+	 * @dev		: Device for which we do this operation (can be a CPU)
 	 *
-	 * active_power() must find the lowest capacity state of 'cpu' above
+	 * active_power() must find the lowest performance state of 'dev' above
 	 * 'freq' and update 'power' and 'freq' to the matching active power
 	 * and frequency.
 	 *
-	 * The power is the one of a single CPU in the domain, expressed in
-	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
-	 * range.
+	 * In case of CPUs, the power is the one of a single CPU in the domain,
+	 * expressed in milli-watts. It is expected to fit in the
+	 * [0, EM_MAX_POWER] range.
 	 *
 	 * Return 0 on success.
 	 */
-	int (*active_power)(unsigned long *power, unsigned long *freq, int cpu);
+	int (*active_power)(unsigned long *power, unsigned long *freq,
+			    struct device *dev);
 };
 #define EM_DATA_CB(_active_power_cb) { .active_power = &_active_power_cb }
 
 struct em_perf_domain *em_cpu_get(int cpu);
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb);
+struct em_perf_domain *em_pd_get(struct device *dev);
+void em_pd_put(struct device *dev);
+int em_register_perf_domain(struct device *dev, unsigned int nr_states,
+			struct em_data_callback *cb, cpumask_t *span);
+void em_unregister_perf_domain(struct device *dev);
 
 /**
- * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
+ * em_cpu_energy() - Estimates the energy consumed by the CPUs of a perf. domain
  * @pd		: performance domain for which energy has to be estimated
  * @max_util	: highest utilization among CPUs of the domain
  * @sum_util	: sum of the utilization of all CPUs in the domain
  *
+ * This function should be used only for CPU devices. There is no validation,
+ * i.e. if the EM is a CPU type and has cpumask allocated. It is called from
+ * the scheduler code quite frequently.
+ *
  * Return: the sum of the energy consumed by the CPUs of the domain assuming
  * a capacity state satisfying the max utilization of the domain.
  */
-static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
+static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util)
 {
 	unsigned long freq, scale_cpu;
-	struct em_cap_state *cs;
+	struct em_perf_state *cs;
 	int i, cpu;
 
 	/*
@@ -88,16 +105,16 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 	 * most utilized CPU of the performance domain to a requested frequency,
 	 * like schedutil.
 	 */
-	cpu = cpumask_first(to_cpumask(pd->cpus));
+	cpu = cpumask_first(em_span_cpus(pd));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	cs = &pd->table[pd->nr_cap_states - 1];
+	cs = &pd->table[pd->nr_perf_states - 1];
 	freq = map_util_freq(max_util, cs->frequency, scale_cpu);
 
 	/*
 	 * Find the lowest capacity state of the Energy Model above the
 	 * requested frequency.
 	 */
-	for (i = 0; i < pd->nr_cap_states; i++) {
+	for (i = 0; i < pd->nr_perf_states; i++) {
 		cs = &pd->table[i];
 		if (cs->frequency >= freq)
 			break;
@@ -133,7 +150,7 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 	 *   cpu_nrg = ------------------------ * ---------          (3)
 	 *                    cs->freq            scale_cpu
 	 *
-	 * The first term is static, and is stored in the em_cap_state struct
+	 * The first term is static, and is stored in the em_perf_state struct
 	 * as 'cs->cost'.
 	 *
 	 * Since all CPUs of the domain have the same micro-architecture, they
@@ -149,35 +166,47 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 }
 
 /**
- * em_pd_nr_cap_states() - Get the number of capacity states of a perf. domain
+ * em_pd_nr_perf_states() - Get the number of performance states of a
+		performance domain
  * @pd		: performance domain for which this must be done
  *
- * Return: the number of capacity states in the performance domain table
+ * Return: the number of performance states in the performance domain table
  */
-static inline int em_pd_nr_cap_states(struct em_perf_domain *pd)
+static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 {
-	return pd->nr_cap_states;
+	return pd->nr_perf_states;
 }
 
 #else
 struct em_data_callback {};
 #define EM_DATA_CB(_active_power_cb) { }
 
-static inline int em_register_perf_domain(cpumask_t *span,
-			unsigned int nr_states, struct em_data_callback *cb)
+static inline int em_register_perf_domain(struct device *dev,
+			unsigned int nr_states,	struct em_data_callback *cb,
+			cpumask_t *span)
 {
 	return -EINVAL;
 }
+static inline void em_unregister_perf_domain(struct device *dev)
+{
+}
 static inline struct em_perf_domain *em_cpu_get(int cpu)
 {
 	return NULL;
 }
-static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
+static inline struct em_perf_domain *em_pd_get(struct device *dev)
+{
+	return NULL;
+}
+static inline void em_pd_put(struct device *dev)
+{
+}
+static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
 			unsigned long max_util, unsigned long sum_util)
 {
 	return 0;
 }
-static inline int em_pd_nr_cap_states(struct em_perf_domain *pd)
+static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 {
 	return 0;
 }
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 0a9326f5f421..6dad82575279 100644
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
@@ -12,22 +13,51 @@
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
 
-static void em_debug_create_cs(struct em_cap_state *cs, struct dentry *pd)
+static void em_debug_create_cs(struct em_perf_state *cs, struct dentry *pd)
 {
 	struct dentry *d;
 	char name[24];
@@ -43,28 +73,74 @@ static void em_debug_create_cs(struct em_cap_state *cs, struct dentry *pd)
 
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
+
+	/* Create a sub-directory for each performance state */
+	for (i = 0; i < em_pd->nr_perf_states; i++)
+		em_debug_create_cs(&em_pd->table[i], d);
 
-	/* Create a sub-directory for each capacity state */
-	for (i = 0; i < pd->nr_cap_states; i++)
-		em_debug_create_cs(&pd->table[i], d);
+	em_dev->debug_dir = d;
+}
+
+static void em_debug_remove_pd(struct em_device *em_dev)
+{
+	debugfs_remove_recursive(em_dev->debug_dir);
 }
 
 static int __init em_debug_init(void)
@@ -76,48 +152,44 @@ static int __init em_debug_init(void)
 }
 core_initcall(em_debug_init);
 #else /* CONFIG_DEBUG_FS */
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu) {}
+static void em_debug_create_pd(struct em_device *em_dev) {}
+static void em_debug_remove_pd(struct em_device *em_dev) {}
 #endif
-static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
-						struct em_data_callback *cb)
+
+static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
+				int nr_states, struct em_data_callback *cb)
 {
 	unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
 	unsigned long power, freq, prev_freq = 0;
-	int i, ret, cpu = cpumask_first(span);
-	struct em_cap_state *table;
-	struct em_perf_domain *pd;
+	struct em_perf_state *table;
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
 
-	/* Build the list of capacity states for this performance domain */
+	/* Build the list of performance states for this performance domain */
 	for (i = 0, freq = 0; i < nr_states; i++, freq++) {
 		/*
 		 * active_power() is a driver callback which ceils 'freq' to
-		 * lowest capacity state of 'cpu' above 'freq' and updates
+		 * lowest performance state of 'dev' above 'freq' and updates
 		 * 'power' and 'freq' accordingly.
 		 */
-		ret = cb->active_power(&power, &freq, cpu);
+		ret = cb->active_power(&power, &freq, dev);
 		if (ret) {
-			pr_err("pd%d: invalid cap. state: %d\n", cpu, ret);
+			dev_err(dev, "EM: invalid perf. state: %d\n",
+				ret);
 			goto free_cs_table;
 		}
 
 		/*
 		 * We expect the driver callback to increase the frequency for
-		 * higher capacity states.
+		 * higher performance states.
 		 */
 		if (freq <= prev_freq) {
-			pr_err("pd%d: non-increasing freq: %lu\n", cpu, freq);
+			dev_err(dev, "EM: non-increasing freq: %lu\n",
+				freq);
 			goto free_cs_table;
 		}
 
@@ -125,8 +197,9 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 * The power returned by active_state() is expected to be
 		 * positive, in milli-watts and to fit into 16 bits.
 		 */
-		if (!power || power > EM_CPU_MAX_POWER) {
-			pr_err("pd%d: invalid power: %lu\n", cpu, power);
+		if (!power || power > EM_MAX_POWER) {
+			dev_err(dev, "EM: invalid power: %lu\n",
+				power);
 			goto free_cs_table;
 		}
 
@@ -141,12 +214,12 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 */
 		opp_eff = freq / power;
 		if (opp_eff >= prev_opp_eff)
-			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_cap_state %d >= em_cap_state%d\n",
-					cpu, i, i - 1);
+			dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
+					i, i - 1);
 		prev_opp_eff = opp_eff;
 	}
 
-	/* Compute the cost of each capacity_state. */
+	/* Compute the cost of each performance_state. */
 	fmax = (u64) table[nr_states - 1].frequency;
 	for (i = 0; i < nr_states; i++) {
 		table[i].cost = div64_u64(fmax * table[i].power,
@@ -154,39 +227,155 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 	}
 
 	pd->table = table;
-	pd->nr_cap_states = nr_states;
-	cpumask_copy(to_cpumask(pd->cpus), span);
-
-	em_debug_create_pd(pd, cpu);
+	pd->nr_perf_states = nr_states;
 
-	return pd;
+	return 0;
 
 free_cs_table:
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
+		if (cpumask_equal(span, em_span_cpus(em_dev->em_pd)))
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
 
 /**
- * em_register_perf_domain() - Register the Energy Model of a performance domain
- * @span	: Mask of CPUs in the performance domain
- * @nr_states	: Number of capacity states to register
+ * em_register_perf_domain() - Register the Energy Model (EM) for the device
+ * @dev		: Device for which the EM is to register
+ * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
+ * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
+ *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
+ *		type of devices this should be set to NULL.
  *
  * Create Energy Model tables for a performance domain using the callbacks
  * defined in cb.
@@ -196,63 +385,169 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  *
  * Return 0 on success
  */
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb)
+int em_register_perf_domain(struct device *dev, unsigned int nr_states,
+			    struct em_data_callback *cb, cpumask_t *cpus)
 {
 	unsigned long cap, prev_cap = 0;
 	struct em_perf_domain *pd;
-	int cpu, ret = 0;
+	struct em_device *em_dev;
+	int cpu, ret;
 
-	if (!span || !nr_states || !cb)
+	if (!dev || !nr_states || !cb || !cb->active_power)
 		return -EINVAL;
 
-	/*
-	 * Use a mutex to serialize the registration of performance domains and
-	 * let the driver-defined callback functions sleep.
-	 */
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
-	pd = em_create_pd(span, nr_states, cb);
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
 EXPORT_SYMBOL_GPL(em_register_perf_domain);
+
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
+/**
+ * em_unregister_perf_domain() - Unregister Energy Model (EM) for the device
+ * @dev		: Device for which the EM is registered
+ *
+ * Try to unregister the EM for the specified device (it checks current
+ * reference counter). The EM for CPUs will not be freed.
+ */
+void em_unregister_perf_domain(struct device *dev)
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
+EXPORT_SYMBOL_GPL(em_unregister_perf_domain);
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
+	em_unregister_perf_domain(dev);
+}
+EXPORT_SYMBOL_GPL(em_pd_put);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1141c7e77564..622624c166d1 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -6458,7 +6458,7 @@ compute_energy(struct task_struct *p, int dst_cpu, struct perf_domain *pd)
 		max_util = max(max_util, cpu_util);
 	}
 
-	return em_pd_energy(pd->em_pd, max_util, sum_util);
+	return em_cpu_energy(pd->em_pd, max_util, sum_util);
 }
 
 /*
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 8344757bba6e..046b49d7e9a0 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -285,7 +285,7 @@ static void perf_domain_debug(const struct cpumask *cpu_map,
 		printk(KERN_CONT " pd%d:{ cpus=%*pbl nr_cstate=%d }",
 				cpumask_first(perf_domain_span(pd)),
 				cpumask_pr_args(perf_domain_span(pd)),
-				em_pd_nr_cap_states(pd->em_pd));
+				em_pd_nr_perf_states(pd->em_pd));
 		pd = pd->next;
 	}
 
@@ -398,7 +398,7 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
 		 * complexity check.
 		 */
 		nr_pd++;
-		nr_cs += em_pd_nr_cap_states(pd->em_pd);
+		nr_cs += em_pd_nr_perf_states(pd->em_pd);
 	}
 
 	/* Bail out if the Energy Model complexity is too high. */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
