Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AC20773D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7806EB94;
	Wed, 24 Jun 2020 15:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315796E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:21:21 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id u23so2235136otq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wquOXFEWn2Cz8h4fD7bOldOTEnZnMFN9klSot6Zxc0M=;
 b=HwyMqSHz/E/N4ct2UO5vb0cXBaWohdMFS/Bafi3BRFhdh0GethXNsZlnp8mG4jNeOf
 qPHMkRypjo4In4D/GHcj6s4ZyBoMBe3hdK0zxVJLM2y5tILutqVDayp7Ev4Hp9oFvjp0
 Ia6SLvHwi8Nik7A4gHDOWXvStWl02Rdb0hzY1i/ZTHliyaCYF1BsS7+ofvHuemVSrqvd
 QT8cISUK+Z2UH0KfCveU0Wy2r0AEFI3inuRDx5gMPHLrTCcDPwvID8kpIyBBOyk+yVnF
 WQYToniKyLM9a3yRnTpydB4E2FJ2pxSHIFEXCaqdsAVNZJYZgWJ01LvfhY2aEU5PpwC2
 E+8Q==
X-Gm-Message-State: AOAM532U9TriTAKERf9H8Phc4BYuyV+f0AJdks0xtCPhz1f/p89AmWxE
 YYOwx0IeoA1ytTzu5xj3fEIpTZNTegv/UG7cCrs=
X-Google-Smtp-Source: ABdhPJyU6Vceq/i+D4FJoyDMHD3Kxa9sVDqBsYXE8wzBXIX2aMQrncoNVQ5kIZzttB+nbXP88s/giTQTgNCP8Q4Nxqc=
X-Received: by 2002:a9d:7d15:: with SMTP id v21mr22331055otn.118.1593012080231; 
 Wed, 24 Jun 2020 08:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200527095854.21714-5-lukasz.luba@arm.com>
 <20200610101223.7152-1-lukasz.luba@arm.com>
In-Reply-To: <20200610101223.7152-1-lukasz.luba@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 24 Jun 2020 17:21:08 +0200
Message-ID: <CAJZ5v0i30Bbk_p+ZAedqJeDu5RfzN53m5PAMbOd3wE=adaBqSQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 4/8] PM / EM: add support for other devices
 than CPUs in Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: Nishanth Menon <nm@ti.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benjamin Segall <bsegall@google.com>, alyssa.rosenzweig@collabora.com,
 Matthias Kaehlcke <mka@chromium.org>,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, steven.price@arm.com,
 Chanwoo Choi <cw00.choi@samsung.com>, Ingo Molnar <mingo@redhat.com>,
 dl-linux-imx <linux-imx@nxp.com>, "Zhang, Rui" <rui.zhang@intel.com>,
 Mel Gorman <mgorman@suse.de>, orjan.eide@arm.com,
 Linux PM <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Quentin Perret <qperret@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 patrick.bellasi@matbug.net, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 12:12 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Add support for other devices than CPUs. The registration function
> does not require a valid cpumask pointer and is ready to handle new
> devices. Some of the internal structures has been reorganized in order to
> keep consistent view (like removing per_cpu pd pointers).
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
> Hi all,
>
> This is just a small change compared to v8 addressing Rafael's
> comments an Dan's static analyzes.
> Here are the changes:
> - added comment about mutex usage in the unregister function
> - changed 'dev' into @dev in the kerneldoc comments
> - removed 'else' statement from em_create_pd() to calm down static analizers

I've applied the series as 5.9 material with patch [4/8] replaced with this one.

Sorry for the delays in handling this!

Thanks!

>  include/linux/device.h       |   5 +
>  include/linux/energy_model.h |  29 ++++-
>  kernel/power/energy_model.c  | 244 ++++++++++++++++++++++++-----------
>  3 files changed, 194 insertions(+), 84 deletions(-)
>
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ac8e37cd716a..7023d3ea189b 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -13,6 +13,7 @@
>  #define _DEVICE_H_
>
>  #include <linux/dev_printk.h>
> +#include <linux/energy_model.h>
>  #include <linux/ioport.h>
>  #include <linux/kobject.h>
>  #include <linux/klist.h>
> @@ -559,6 +560,10 @@ struct device {
>         struct dev_pm_info      power;
>         struct dev_pm_domain    *pm_domain;
>
> +#ifdef CONFIG_ENERGY_MODEL
> +       struct em_perf_domain   *em_pd;
> +#endif
> +
>  #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
>         struct irq_domain       *msi_domain;
>  #endif
> diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> index 7076cb22b247..2d4689964029 100644
> --- a/include/linux/energy_model.h
> +++ b/include/linux/energy_model.h
> @@ -12,8 +12,10 @@
>
>  /**
>   * em_perf_state - Performance state of a performance domain
> - * @frequency: The CPU frequency in KHz, for consistency with CPUFreq
> - * @power:     The power consumed by 1 CPU at this level, in milli-watts
> + * @frequency: The frequency in KHz, for consistency with CPUFreq
> + * @power:     The power consumed at this level, in milli-watts (by 1 CPU or
> +               by a registered device). It can be a total power: static and
> +               dynamic.
>   * @cost:      The cost coefficient associated with this level, used during
>   *             energy calculation. Equal to: power * max_frequency / frequency
>   */
> @@ -27,12 +29,16 @@ struct em_perf_state {
>   * em_perf_domain - Performance domain
>   * @table:             List of performance states, in ascending order
>   * @nr_perf_states:    Number of performance states
> - * @cpus:              Cpumask covering the CPUs of the domain
> + * @cpus:              Cpumask covering the CPUs of the domain. It's here
> + *                     for performance reasons to avoid potential cache
> + *                     misses during energy calculations in the scheduler
> + *                     and simplifies allocating/freeing that memory region.
>   *
> - * A "performance domain" represents a group of CPUs whose performance is
> - * scaled together. All CPUs of a performance domain must have the same
> - * micro-architecture. Performance domains often have a 1-to-1 mapping with
> - * CPUFreq policies.
> + * In case of CPU device, a "performance domain" represents a group of CPUs
> + * whose performance is scaled together. All CPUs of a performance domain
> + * must have the same micro-architecture. Performance domains often have
> + * a 1-to-1 mapping with CPUFreq policies. In case of other devices the @cpus
> + * field is unused.
>   */
>  struct em_perf_domain {
>         struct em_perf_state *table;
> @@ -71,10 +77,12 @@ struct em_data_callback {
>  #define EM_DATA_CB(_active_power_cb) { .active_power = &_active_power_cb }
>
>  struct em_perf_domain *em_cpu_get(int cpu);
> +struct em_perf_domain *em_pd_get(struct device *dev);
>  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
>                                                 struct em_data_callback *cb);
>  int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>                                 struct em_data_callback *cb, cpumask_t *span);
> +void em_dev_unregister_perf_domain(struct device *dev);
>
>  /**
>   * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
> @@ -184,10 +192,17 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>  {
>         return -EINVAL;
>  }
> +static inline void em_dev_unregister_perf_domain(struct device *dev)
> +{
> +}
>  static inline struct em_perf_domain *em_cpu_get(int cpu)
>  {
>         return NULL;
>  }
> +static inline struct em_perf_domain *em_pd_get(struct device *dev)
> +{
> +       return NULL;
> +}
>  static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
>                         unsigned long max_util, unsigned long sum_util)
>  {
> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
> index 5b8a1566526a..32d76e78f992 100644
> --- a/kernel/power/energy_model.c
> +++ b/kernel/power/energy_model.c
> @@ -1,9 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Energy Model of CPUs
> + * Energy Model of devices
>   *
> - * Copyright (c) 2018, Arm ltd.
> + * Copyright (c) 2018-2020, Arm ltd.
>   * Written by: Quentin Perret, Arm ltd.
> + * Improvements provided by: Lukasz Luba, Arm ltd.
>   */
>
>  #define pr_fmt(fmt) "energy_model: " fmt
> @@ -15,15 +16,17 @@
>  #include <linux/sched/topology.h>
>  #include <linux/slab.h>
>
> -/* Mapping of each CPU to the performance domain to which it belongs. */
> -static DEFINE_PER_CPU(struct em_perf_domain *, em_data);
> -
>  /*
>   * Mutex serializing the registrations of performance domains and letting
>   * callbacks defined by drivers sleep.
>   */
>  static DEFINE_MUTEX(em_pd_mutex);
>
> +static bool _is_cpu_device(struct device *dev)
> +{
> +       return (dev->bus == &cpu_subsys);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static struct dentry *rootdir;
>
> @@ -49,22 +52,30 @@ static int em_debug_cpus_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(em_debug_cpus);
>
> -static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
> +static void em_debug_create_pd(struct device *dev)
>  {
>         struct dentry *d;
> -       char name[8];
>         int i;
>
> -       snprintf(name, sizeof(name), "pd%d", cpu);
> -
>         /* Create the directory of the performance domain */
> -       d = debugfs_create_dir(name, rootdir);
> +       d = debugfs_create_dir(dev_name(dev), rootdir);
>
> -       debugfs_create_file("cpus", 0444, d, pd->cpus, &em_debug_cpus_fops);
> +       if (_is_cpu_device(dev))
> +               debugfs_create_file("cpus", 0444, d, dev->em_pd->cpus,
> +                                   &em_debug_cpus_fops);
>
>         /* Create a sub-directory for each performance state */
> -       for (i = 0; i < pd->nr_perf_states; i++)
> -               em_debug_create_ps(&pd->table[i], d);
> +       for (i = 0; i < dev->em_pd->nr_perf_states; i++)
> +               em_debug_create_ps(&dev->em_pd->table[i], d);
> +
> +}
> +
> +static void em_debug_remove_pd(struct device *dev)
> +{
> +       struct dentry *debug_dir;
> +
> +       debug_dir = debugfs_lookup(dev_name(dev), rootdir);
> +       debugfs_remove_recursive(debug_dir);
>  }
>
>  static int __init em_debug_init(void)
> @@ -76,40 +87,34 @@ static int __init em_debug_init(void)
>  }
>  core_initcall(em_debug_init);
>  #else /* CONFIG_DEBUG_FS */
> -static void em_debug_create_pd(struct em_perf_domain *pd, int cpu) {}
> +static void em_debug_create_pd(struct device *dev) {}
> +static void em_debug_remove_pd(struct device *dev) {}
>  #endif
> -static struct em_perf_domain *
> -em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
> -            cpumask_t *span)
> +
> +static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
> +                               int nr_states, struct em_data_callback *cb)
>  {
>         unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
>         unsigned long power, freq, prev_freq = 0;
> -       int i, ret, cpu = cpumask_first(span);
>         struct em_perf_state *table;
> -       struct em_perf_domain *pd;
> +       int i, ret;
>         u64 fmax;
>
> -       if (!cb->active_power)
> -               return NULL;
> -
> -       pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
> -       if (!pd)
> -               return NULL;
> -
>         table = kcalloc(nr_states, sizeof(*table), GFP_KERNEL);
>         if (!table)
> -               goto free_pd;
> +               return -ENOMEM;
>
>         /* Build the list of performance states for this performance domain */
>         for (i = 0, freq = 0; i < nr_states; i++, freq++) {
>                 /*
>                  * active_power() is a driver callback which ceils 'freq' to
> -                * lowest performance state of 'cpu' above 'freq' and updates
> +                * lowest performance state of 'dev' above 'freq' and updates
>                  * 'power' and 'freq' accordingly.
>                  */
>                 ret = cb->active_power(&power, &freq, dev);
>                 if (ret) {
> -                       pr_err("pd%d: invalid perf. state: %d\n", cpu, ret);
> +                       dev_err(dev, "EM: invalid perf. state: %d\n",
> +                               ret);
>                         goto free_ps_table;
>                 }
>
> @@ -118,7 +123,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>                  * higher performance states.
>                  */
>                 if (freq <= prev_freq) {
> -                       pr_err("pd%d: non-increasing freq: %lu\n", cpu, freq);
> +                       dev_err(dev, "EM: non-increasing freq: %lu\n",
> +                               freq);
>                         goto free_ps_table;
>                 }
>
> @@ -127,7 +133,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>                  * positive, in milli-watts and to fit into 16 bits.
>                  */
>                 if (!power || power > EM_MAX_POWER) {
> -                       pr_err("pd%d: invalid power: %lu\n", cpu, power);
> +                       dev_err(dev, "EM: invalid power: %lu\n",
> +                               power);
>                         goto free_ps_table;
>                 }
>
> @@ -142,8 +149,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>                  */
>                 opp_eff = freq / power;
>                 if (opp_eff >= prev_opp_eff)
> -                       pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
> -                                       cpu, i, i - 1);
> +                       dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
> +                                       i, i - 1);
>                 prev_opp_eff = opp_eff;
>         }
>
> @@ -156,30 +163,82 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>
>         pd->table = table;
>         pd->nr_perf_states = nr_states;
> -       cpumask_copy(to_cpumask(pd->cpus), span);
>
> -       em_debug_create_pd(pd, cpu);
> -
> -       return pd;
> +       return 0;
>
>  free_ps_table:
>         kfree(table);
> -free_pd:
> -       kfree(pd);
> +       return -EINVAL;
> +}
> +
> +static int em_create_pd(struct device *dev, int nr_states,
> +                       struct em_data_callback *cb, cpumask_t *cpus)
> +{
> +       struct em_perf_domain *pd;
> +       struct device *cpu_dev;
> +       int cpu, ret;
> +
> +       if (_is_cpu_device(dev)) {
> +               pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
> +               if (!pd)
> +                       return -ENOMEM;
> +
> +               cpumask_copy(em_span_cpus(pd), cpus);
> +       } else {
> +               pd = kzalloc(sizeof(*pd), GFP_KERNEL);
> +               if (!pd)
> +                       return -ENOMEM;
> +       }
> +
> +       ret = em_create_perf_table(dev, pd, nr_states, cb);
> +       if (ret) {
> +               kfree(pd);
> +               return ret;
> +       }
> +
> +       if (_is_cpu_device(dev))
> +               for_each_cpu(cpu, cpus) {
> +                       cpu_dev = get_cpu_device(cpu);
> +                       cpu_dev->em_pd = pd;
> +               }
> +
> +       dev->em_pd = pd;
> +
> +       return 0;
> +}
> +
> +/**
> + * em_pd_get() - Return the performance domain for a device
> + * @dev : Device to find the performance domain for
> + *
> + * Returns the performance domain to which @dev belongs, or NULL if it doesn't
> + * exist.
> + */
> +struct em_perf_domain *em_pd_get(struct device *dev)
> +{
> +       if (IS_ERR_OR_NULL(dev))
> +               return NULL;
>
> -       return NULL;
> +       return dev->em_pd;
>  }
> +EXPORT_SYMBOL_GPL(em_pd_get);
>
>  /**
>   * em_cpu_get() - Return the performance domain for a CPU
>   * @cpu : CPU to find the performance domain for
>   *
> - * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
> + * Returns the performance domain to which @cpu belongs, or NULL if it doesn't
>   * exist.
>   */
>  struct em_perf_domain *em_cpu_get(int cpu)
>  {
> -       return READ_ONCE(per_cpu(em_data, cpu));
> +       struct device *cpu_dev;
> +
> +       cpu_dev = get_cpu_device(cpu);
> +       if (!cpu_dev)
> +               return NULL;
> +
> +       return em_pd_get(cpu_dev);
>  }
>  EXPORT_SYMBOL_GPL(em_cpu_get);
>
> @@ -188,7 +247,7 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
>   * @dev                : Device for which the EM is to register
>   * @nr_states  : Number of performance states to register
>   * @cb         : Callback functions providing the data of the Energy Model
> - * @span       : Pointer to cpumask_t, which in case of a CPU device is
> + * @cpus       : Pointer to cpumask_t, which in case of a CPU device is
>   *             obligatory. It can be taken from i.e. 'policy->cpus'. For other
>   *             type of devices this should be set to NULL.
>   *
> @@ -201,13 +260,12 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
>   * Return 0 on success
>   */
>  int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
> -                               struct em_data_callback *cb, cpumask_t *span)
> +                               struct em_data_callback *cb, cpumask_t *cpus)
>  {
>         unsigned long cap, prev_cap = 0;
> -       struct em_perf_domain *pd;
> -       int cpu, ret = 0;
> +       int cpu, ret;
>
> -       if (!dev || !span || !nr_states || !cb)
> +       if (!dev || !nr_states || !cb)
>                 return -EINVAL;
>
>         /*
> @@ -216,47 +274,50 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>          */
>         mutex_lock(&em_pd_mutex);
>
> -       for_each_cpu(cpu, span) {
> -               /* Make sure we don't register again an existing domain. */
> -               if (READ_ONCE(per_cpu(em_data, cpu))) {
> -                       ret = -EEXIST;
> -                       goto unlock;
> -               }
> +       if (dev->em_pd) {
> +               ret = -EEXIST;
> +               goto unlock;
> +       }
>
> -               /*
> -                * All CPUs of a domain must have the same micro-architecture
> -                * since they all share the same table.
> -                */
> -               cap = arch_scale_cpu_capacity(cpu);
> -               if (prev_cap && prev_cap != cap) {
> -                       pr_err("CPUs of %*pbl must have the same capacity\n",
> -                                                       cpumask_pr_args(span));
> +       if (_is_cpu_device(dev)) {
> +               if (!cpus) {
> +                       dev_err(dev, "EM: invalid CPU mask\n");
>                         ret = -EINVAL;
>                         goto unlock;
>                 }
> -               prev_cap = cap;
> +
> +               for_each_cpu(cpu, cpus) {
> +                       if (em_cpu_get(cpu)) {
> +                               dev_err(dev, "EM: exists for CPU%d\n", cpu);
> +                               ret = -EEXIST;
> +                               goto unlock;
> +                       }
> +                       /*
> +                        * All CPUs of a domain must have the same
> +                        * micro-architecture since they all share the same
> +                        * table.
> +                        */
> +                       cap = arch_scale_cpu_capacity(cpu);
> +                       if (prev_cap && prev_cap != cap) {
> +                               dev_err(dev, "EM: CPUs of %*pbl must have the same capacity\n",
> +                                       cpumask_pr_args(cpus));
> +
> +                               ret = -EINVAL;
> +                               goto unlock;
> +                       }
> +                       prev_cap = cap;
> +               }
>         }
>
> -       /* Create the performance domain and add it to the Energy Model. */
> -       pd = em_create_pd(dev, nr_states, cb, span);
> -       if (!pd) {
> -               ret = -EINVAL;
> +       ret = em_create_pd(dev, nr_states, cb, cpus);
> +       if (ret)
>                 goto unlock;
> -       }
>
> -       for_each_cpu(cpu, span) {
> -               /*
> -                * The per-cpu array can be read concurrently from em_cpu_get().
> -                * The barrier enforces the ordering needed to make sure readers
> -                * can only access well formed em_perf_domain structs.
> -                */
> -               smp_store_release(per_cpu_ptr(&em_data, cpu), pd);
> -       }
> +       em_debug_create_pd(dev);
> +       dev_info(dev, "EM: created perf domain\n");
>
> -       pr_debug("Created perf domain %*pbl\n", cpumask_pr_args(span));
>  unlock:
>         mutex_unlock(&em_pd_mutex);
> -
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(em_dev_register_perf_domain);
> @@ -285,3 +346,32 @@ int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
>         return em_dev_register_perf_domain(cpu_dev, nr_states, cb, span);
>  }
>  EXPORT_SYMBOL_GPL(em_register_perf_domain);
> +
> +/**
> + * em_dev_unregister_perf_domain() - Unregister Energy Model (EM) for a device
> + * @dev                : Device for which the EM is registered
> + *
> + * Unregister the EM for the specified @dev (but not a CPU device).
> + */
> +void em_dev_unregister_perf_domain(struct device *dev)
> +{
> +       if (IS_ERR_OR_NULL(dev) || !dev->em_pd)
> +               return;
> +
> +       if (_is_cpu_device(dev))
> +               return;
> +
> +       /*
> +        * The mutex separates all register/unregister requests and protects
> +        * from potential clean-up/setup issues in the debugfs directories.
> +        * The debugfs directory name is the same as device's name.
> +        */
> +       mutex_lock(&em_pd_mutex);
> +       em_debug_remove_pd(dev);
> +
> +       kfree(dev->em_pd->table);
> +       kfree(dev->em_pd);
> +       dev->em_pd = NULL;
> +       mutex_unlock(&em_pd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(em_dev_unregister_perf_domain);
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
