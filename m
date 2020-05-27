Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441661E593B
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03F16E405;
	Thu, 28 May 2020 07:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A5AB89A62
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 10:00:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C9EE1045;
 Wed, 27 May 2020 03:00:27 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.37.12.61])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A65FE3F6C4;
 Wed, 27 May 2020 03:00:16 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-imx@nxp.com
Subject: [PATCH v8 1/8] PM / EM: change naming convention from 'capacity' to
 'performance'
Date: Wed, 27 May 2020 10:58:47 +0100
Message-Id: <20200527095854.21714-2-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527095854.21714-1-lukasz.luba@arm.com>
References: <20200527095854.21714-1-lukasz.luba@arm.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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

The Energy Model uses concept of performance domain and capacity states in
order to calculate power used by CPUs. Change naming convention from
capacity to performance state would enable wider usage in future, e.g.
upcoming support for other devices other than CPUs.

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Quentin Perret <qperret@google.com>
Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/thermal/cpufreq_cooling.c | 12 ++---
 include/linux/energy_model.h      | 86 +++++++++++++++++--------------
 kernel/power/energy_model.c       | 44 ++++++++--------
 kernel/sched/topology.c           | 20 +++----
 4 files changed, 84 insertions(+), 78 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index e297e135c031..ad8971e26538 100644
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
+	if (em_pd_nr_perf_states(em) != nr_levels) {
+		pr_err("The number of performance states in pd %*pbl (%u) doesn't match the number of cooling levels (%u)\n",
+			cpumask_pr_args(em_span_cpus(em)),
+			em_pd_nr_perf_states(em), nr_levels);
 		return false;
 	}
 
diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index ade6486a3382..fe336a9eb5d4 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -10,13 +10,13 @@
 #include <linux/types.h>
 
 /**
- * em_cap_state - Capacity state of a performance domain
+ * em_perf_state - Performance state of a performance domain
  * @frequency:	The CPU frequency in KHz, for consistency with CPUFreq
  * @power:	The power consumed by 1 CPU at this level, in milli-watts
  * @cost:	The cost coefficient associated with this level, used during
  *		energy calculation. Equal to: power * max_frequency / frequency
  */
-struct em_cap_state {
+struct em_perf_state {
 	unsigned long frequency;
 	unsigned long power;
 	unsigned long cost;
@@ -24,8 +24,8 @@ struct em_cap_state {
 
 /**
  * em_perf_domain - Performance domain
- * @table:		List of capacity states, in ascending order
- * @nr_cap_states:	Number of capacity states
+ * @table:		List of performance states, in ascending order
+ * @nr_perf_states:	Number of performance states
  * @cpus:		Cpumask covering the CPUs of the domain
  *
  * A "performance domain" represents a group of CPUs whose performance is
@@ -34,22 +34,27 @@ struct em_cap_state {
  * CPUFreq policies.
  */
 struct em_perf_domain {
-	struct em_cap_state *table;
-	int nr_cap_states;
+	struct em_perf_state *table;
+	int nr_perf_states;
 	unsigned long cpus[];
 };
 
+#define em_span_cpus(em) (to_cpumask((em)->cpus))
+
 #ifdef CONFIG_ENERGY_MODEL
 #define EM_CPU_MAX_POWER 0xFFFF
 
 struct em_data_callback {
 	/**
-	 * active_power() - Provide power at the next capacity state of a CPU
-	 * @power	: Active power at the capacity state in mW (modified)
-	 * @freq	: Frequency at the capacity state in kHz (modified)
+	 * active_power() - Provide power at the next performance state of
+	 *		a CPU
+	 * @power	: Active power at the performance state in mW
+	 *		(modified)
+	 * @freq	: Frequency at the performance state in kHz
+	 *		(modified)
 	 * @cpu		: CPU for which we do this operation
 	 *
-	 * active_power() must find the lowest capacity state of 'cpu' above
+	 * active_power() must find the lowest performance state of 'cpu' above
 	 * 'freq' and update 'power' and 'freq' to the matching active power
 	 * and frequency.
 	 *
@@ -80,46 +85,46 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util)
 {
 	unsigned long freq, scale_cpu;
-	struct em_cap_state *cs;
+	struct em_perf_state *ps;
 	int i, cpu;
 
 	/*
-	 * In order to predict the capacity state, map the utilization of the
-	 * most utilized CPU of the performance domain to a requested frequency,
-	 * like schedutil.
+	 * In order to predict the performance state, map the utilization of
+	 * the most utilized CPU of the performance domain to a requested
+	 * frequency, like schedutil.
 	 */
 	cpu = cpumask_first(to_cpumask(pd->cpus));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	cs = &pd->table[pd->nr_cap_states - 1];
-	freq = map_util_freq(max_util, cs->frequency, scale_cpu);
+	ps = &pd->table[pd->nr_perf_states - 1];
+	freq = map_util_freq(max_util, ps->frequency, scale_cpu);
 
 	/*
-	 * Find the lowest capacity state of the Energy Model above the
+	 * Find the lowest performance state of the Energy Model above the
 	 * requested frequency.
 	 */
-	for (i = 0; i < pd->nr_cap_states; i++) {
-		cs = &pd->table[i];
-		if (cs->frequency >= freq)
+	for (i = 0; i < pd->nr_perf_states; i++) {
+		ps = &pd->table[i];
+		if (ps->frequency >= freq)
 			break;
 	}
 
 	/*
-	 * The capacity of a CPU in the domain at that capacity state (cs)
+	 * The capacity of a CPU in the domain at the performance state (ps)
 	 * can be computed as:
 	 *
-	 *             cs->freq * scale_cpu
-	 *   cs->cap = --------------------                          (1)
+	 *             ps->freq * scale_cpu
+	 *   ps->cap = --------------------                          (1)
 	 *                 cpu_max_freq
 	 *
 	 * So, ignoring the costs of idle states (which are not available in
-	 * the EM), the energy consumed by this CPU at that capacity state is
-	 * estimated as:
+	 * the EM), the energy consumed by this CPU at that performance state
+	 * is estimated as:
 	 *
-	 *             cs->power * cpu_util
+	 *             ps->power * cpu_util
 	 *   cpu_nrg = --------------------                          (2)
-	 *                   cs->cap
+	 *                   ps->cap
 	 *
-	 * since 'cpu_util / cs->cap' represents its percentage of busy time.
+	 * since 'cpu_util / ps->cap' represents its percentage of busy time.
 	 *
 	 *   NOTE: Although the result of this computation actually is in
 	 *         units of power, it can be manipulated as an energy value
@@ -129,34 +134,35 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 	 * By injecting (1) in (2), 'cpu_nrg' can be re-expressed as a product
 	 * of two terms:
 	 *
-	 *             cs->power * cpu_max_freq   cpu_util
+	 *             ps->power * cpu_max_freq   cpu_util
 	 *   cpu_nrg = ------------------------ * ---------          (3)
-	 *                    cs->freq            scale_cpu
+	 *                    ps->freq            scale_cpu
 	 *
-	 * The first term is static, and is stored in the em_cap_state struct
-	 * as 'cs->cost'.
+	 * The first term is static, and is stored in the em_perf_state struct
+	 * as 'ps->cost'.
 	 *
 	 * Since all CPUs of the domain have the same micro-architecture, they
-	 * share the same 'cs->cost', and the same CPU capacity. Hence, the
+	 * share the same 'ps->cost', and the same CPU capacity. Hence, the
 	 * total energy of the domain (which is the simple sum of the energy of
 	 * all of its CPUs) can be factorized as:
 	 *
-	 *            cs->cost * \Sum cpu_util
+	 *            ps->cost * \Sum cpu_util
 	 *   pd_nrg = ------------------------                       (4)
 	 *                  scale_cpu
 	 */
-	return cs->cost * sum_util / scale_cpu;
+	return ps->cost * sum_util / scale_cpu;
 }
 
 /**
- * em_pd_nr_cap_states() - Get the number of capacity states of a perf. domain
+ * em_pd_nr_perf_states() - Get the number of performance states of a perf.
+ *				domain
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
@@ -177,7 +183,7 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 {
 	return 0;
 }
-static inline int em_pd_nr_cap_states(struct em_perf_domain *pd)
+static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 {
 	return 0;
 }
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 0a9326f5f421..9892d548a0fa 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -27,18 +27,18 @@ static DEFINE_MUTEX(em_pd_mutex);
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *rootdir;
 
-static void em_debug_create_cs(struct em_cap_state *cs, struct dentry *pd)
+static void em_debug_create_ps(struct em_perf_state *ps, struct dentry *pd)
 {
 	struct dentry *d;
 	char name[24];
 
-	snprintf(name, sizeof(name), "cs:%lu", cs->frequency);
+	snprintf(name, sizeof(name), "ps:%lu", ps->frequency);
 
-	/* Create per-cs directory */
+	/* Create per-ps directory */
 	d = debugfs_create_dir(name, pd);
-	debugfs_create_ulong("frequency", 0444, d, &cs->frequency);
-	debugfs_create_ulong("power", 0444, d, &cs->power);
-	debugfs_create_ulong("cost", 0444, d, &cs->cost);
+	debugfs_create_ulong("frequency", 0444, d, &ps->frequency);
+	debugfs_create_ulong("power", 0444, d, &ps->power);
+	debugfs_create_ulong("cost", 0444, d, &ps->cost);
 }
 
 static int em_debug_cpus_show(struct seq_file *s, void *unused)
@@ -62,9 +62,9 @@ static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
 
 	debugfs_create_file("cpus", 0444, d, pd->cpus, &em_debug_cpus_fops);
 
-	/* Create a sub-directory for each capacity state */
-	for (i = 0; i < pd->nr_cap_states; i++)
-		em_debug_create_cs(&pd->table[i], d);
+	/* Create a sub-directory for each performance state */
+	for (i = 0; i < pd->nr_perf_states; i++)
+		em_debug_create_ps(&pd->table[i], d);
 }
 
 static int __init em_debug_init(void)
@@ -84,7 +84,7 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 	unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
 	unsigned long power, freq, prev_freq = 0;
 	int i, ret, cpu = cpumask_first(span);
-	struct em_cap_state *table;
+	struct em_perf_state *table;
 	struct em_perf_domain *pd;
 	u64 fmax;
 
@@ -99,26 +99,26 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 	if (!table)
 		goto free_pd;
 
-	/* Build the list of capacity states for this performance domain */
+	/* Build the list of performance states for this performance domain */
 	for (i = 0, freq = 0; i < nr_states; i++, freq++) {
 		/*
 		 * active_power() is a driver callback which ceils 'freq' to
-		 * lowest capacity state of 'cpu' above 'freq' and updates
+		 * lowest performance state of 'cpu' above 'freq' and updates
 		 * 'power' and 'freq' accordingly.
 		 */
 		ret = cb->active_power(&power, &freq, cpu);
 		if (ret) {
-			pr_err("pd%d: invalid cap. state: %d\n", cpu, ret);
-			goto free_cs_table;
+			pr_err("pd%d: invalid perf. state: %d\n", cpu, ret);
+			goto free_ps_table;
 		}
 
 		/*
 		 * We expect the driver callback to increase the frequency for
-		 * higher capacity states.
+		 * higher performance states.
 		 */
 		if (freq <= prev_freq) {
 			pr_err("pd%d: non-increasing freq: %lu\n", cpu, freq);
-			goto free_cs_table;
+			goto free_ps_table;
 		}
 
 		/*
@@ -127,7 +127,7 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 */
 		if (!power || power > EM_CPU_MAX_POWER) {
 			pr_err("pd%d: invalid power: %lu\n", cpu, power);
-			goto free_cs_table;
+			goto free_ps_table;
 		}
 
 		table[i].power = power;
@@ -141,12 +141,12 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 */
 		opp_eff = freq / power;
 		if (opp_eff >= prev_opp_eff)
-			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_cap_state %d >= em_cap_state%d\n",
+			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
 					cpu, i, i - 1);
 		prev_opp_eff = opp_eff;
 	}
 
-	/* Compute the cost of each capacity_state. */
+	/* Compute the cost of each performance state. */
 	fmax = (u64) table[nr_states - 1].frequency;
 	for (i = 0; i < nr_states; i++) {
 		table[i].cost = div64_u64(fmax * table[i].power,
@@ -154,14 +154,14 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 	}
 
 	pd->table = table;
-	pd->nr_cap_states = nr_states;
+	pd->nr_perf_states = nr_states;
 	cpumask_copy(to_cpumask(pd->cpus), span);
 
 	em_debug_create_pd(pd, cpu);
 
 	return pd;
 
-free_cs_table:
+free_ps_table:
 	kfree(table);
 free_pd:
 	kfree(pd);
@@ -185,7 +185,7 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
 /**
  * em_register_perf_domain() - Register the Energy Model of a performance domain
  * @span	: Mask of CPUs in the performance domain
- * @nr_states	: Number of capacity states to register
+ * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
  *
  * Create Energy Model tables for a performance domain using the callbacks
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 8344757bba6e..0a411df05fb3 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -282,10 +282,10 @@ static void perf_domain_debug(const struct cpumask *cpu_map,
 	printk(KERN_DEBUG "root_domain %*pbl:", cpumask_pr_args(cpu_map));
 
 	while (pd) {
-		printk(KERN_CONT " pd%d:{ cpus=%*pbl nr_cstate=%d }",
+		printk(KERN_CONT " pd%d:{ cpus=%*pbl nr_pstate=%d }",
 				cpumask_first(perf_domain_span(pd)),
 				cpumask_pr_args(perf_domain_span(pd)),
-				em_pd_nr_cap_states(pd->em_pd));
+				em_pd_nr_perf_states(pd->em_pd));
 		pd = pd->next;
 	}
 
@@ -323,26 +323,26 @@ static void sched_energy_set(bool has_eas)
  *
  * The complexity of the Energy Model is defined as:
  *
- *              C = nr_pd * (nr_cpus + nr_cs)
+ *              C = nr_pd * (nr_cpus + nr_ps)
  *
  * with parameters defined as:
  *  - nr_pd:    the number of performance domains
  *  - nr_cpus:  the number of CPUs
- *  - nr_cs:    the sum of the number of capacity states of all performance
+ *  - nr_ps:    the sum of the number of performance states of all performance
  *              domains (for example, on a system with 2 performance domains,
- *              with 10 capacity states each, nr_cs = 2 * 10 = 20).
+ *              with 10 performance states each, nr_ps = 2 * 10 = 20).
  *
  * It is generally not a good idea to use such a model in the wake-up path on
  * very complex platforms because of the associated scheduling overheads. The
  * arbitrary constraint below prevents that. It makes EAS usable up to 16 CPUs
- * with per-CPU DVFS and less than 8 capacity states each, for example.
+ * with per-CPU DVFS and less than 8 performance states each, for example.
  */
 #define EM_MAX_COMPLEXITY 2048
 
 extern struct cpufreq_governor schedutil_gov;
 static bool build_perf_domains(const struct cpumask *cpu_map)
 {
-	int i, nr_pd = 0, nr_cs = 0, nr_cpus = cpumask_weight(cpu_map);
+	int i, nr_pd = 0, nr_ps = 0, nr_cpus = cpumask_weight(cpu_map);
 	struct perf_domain *pd = NULL, *tmp;
 	int cpu = cpumask_first(cpu_map);
 	struct root_domain *rd = cpu_rq(cpu)->rd;
@@ -394,15 +394,15 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
 		pd = tmp;
 
 		/*
-		 * Count performance domains and capacity states for the
+		 * Count performance domains and performance states for the
 		 * complexity check.
 		 */
 		nr_pd++;
-		nr_cs += em_pd_nr_cap_states(pd->em_pd);
+		nr_ps += em_pd_nr_perf_states(pd->em_pd);
 	}
 
 	/* Bail out if the Energy Model complexity is too high. */
-	if (nr_pd * (nr_cs + nr_cpus) > EM_MAX_COMPLEXITY) {
+	if (nr_pd * (nr_ps + nr_cpus) > EM_MAX_COMPLEXITY) {
 		WARN(1, "rd %*pbl: Failed to start EAS, EM complexity is too high\n",
 						cpumask_pr_args(cpu_map));
 		goto free;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
