Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAE115714F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEF76E94C;
	Mon, 10 Feb 2020 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0203489D99
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 15:59:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 582151FB;
 Fri,  7 Feb 2020 07:59:54 -0800 (PST)
Received: from [10.37.12.229] (unknown [10.37.12.229])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FC4D3F68E;
 Fri,  7 Feb 2020 07:59:43 -0800 (PST)
Subject: Re: [PATCH v2 1/4] PM / EM: add devices to Energy Model
To: Quentin Perret <qperret@google.com>
References: <20200206134640.11367-1-lukasz.luba@arm.com>
 <20200206134640.11367-2-lukasz.luba@arm.com>
 <20200207120430.GA242912@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <8599944e-160b-c9a9-7cb9-1b88b09c675b@arm.com>
Date: Fri, 7 Feb 2020 15:59:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200207120430.GA242912@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 bsegall@google.com, alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Quentin,


Thank you for the review, please find my comments below.

On 2/7/20 12:04 PM, Quentin Perret wrote:
> On Thursday 06 Feb 2020 at 13:46:37 (+0000), lukasz.luba@arm.com wrote:
>>   2. Core APIs
>> @@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
>>   Drivers are expected to register performance domains into the EM framework by
>>   calling the following API::
>>   
>> -  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
>> -			      struct em_data_callback *cb);
>> +  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
>> +		struct em_data_callback *cb, cpumask_t *cpus);
>>   
>> -Drivers must specify the CPUs of the performance domains using the cpumask
>> +Drivers must specify the device pointer of the performance domains as first
> 
> I find this sentence a little odd no?

Agree, this needs to be redefined.

> 
>>   argument, and provide a callback function returning <frequency, power> tuples
>> -for each capacity state. The callback function provided by the driver is free
>> +for each performance state. The callback function provided by the driver is free
>>   to fetch data from any relevant location (DT, firmware, ...), and by any mean
>> -deemed necessary. See Section 3. for an example of driver implementing this
>> +deemed necessary. For other devices than CPUs the last argumant must be set to
> 
> s/argumant/argument

true

> 
>> +NULL. Only for CPUfreq drivers it is obligatory to specify the cpumask.
> 
> Please note that as of today nothing mandates the caller to be a CPUFreq
> driver -- it could be anything in theory. I'd say 'only for CPU devices'
> instead.

Good point, I will change it into 'only for CPU devices'.

> 
> <snip>
>> @@ -24,51 +27,65 @@ struct em_cap_state {
>>   
>>   /**
>>    * em_perf_domain - Performance domain
>> - * @table:		List of capacity states, in ascending order
>> - * @nr_cap_states:	Number of capacity states
>> - * @cpus:		Cpumask covering the CPUs of the domain
>> + * @table:		List of performance states, in ascending order
>> + * @nr_perf_states:	Number of performance states
>> + * @priv:		In case of EM for CPU device it is a Cpumask
>> + *			covering the CPUs of the domain
> 
> Could you turn @priv back into 'unsigned long priv[0];' and keep the
> allocation as it is today ? That is, append the cpumask to the struct.
> 
> This empty pointer for non-CPU devices is just wasted space, and pointer
> chasing isn't good for your caches. Given that you pre-allocate the pd
> in em_create_pd() you could just have a special case for CPUs there I
> suppose. And _is_cpu_em() will have to check the bus like you did in v1.

OK, I will change it to 'unsigned long priv[0];'. The argument of stall 
because of missing cpumask when we probably already missed for 'em_pd'
in the scheduler code, is good for me.

> 
>>    *
>> - * A "performance domain" represents a group of CPUs whose performance is
>> - * scaled together. All CPUs of a performance domain must have the same
>> - * micro-architecture. Performance domains often have a 1-to-1 mapping with
>> - * CPUFreq policies.
>> + * In case of CPU device, a "performance domain" represents a group of CPUs
>> + * whose performance is scaled together. All CPUs of a performance domain
>> + * must have the same micro-architecture. Performance domains often have
>> + * a 1-to-1 mapping with CPUFreq policies.
>> + * In case of other devices the 'priv' field is unused.
>>    */
>>   struct em_perf_domain {
>> -	struct em_cap_state *table;
>> -	int nr_cap_states;
>> -	unsigned long cpus[0];
>> +	struct em_perf_state *table;
>> +	int nr_perf_states;
>> +	void *priv;
>>   };
> 
> <snip>
>>   struct em_data_callback {
>>   	/**
>> -	 * active_power() - Provide power at the next capacity state of a CPU
>> -	 * @power	: Active power at the capacity state in mW (modified)
>> -	 * @freq	: Frequency at the capacity state in kHz (modified)
>> -	 * @cpu		: CPU for which we do this operation
>> +	 * active_power() - Provide power at the next performance state of a
>> +	 *		    device
>> +	 * @power	: Active power at the performance state in mW (modified)
>> +	 * @freq	: Frequency at the performance state in kHz (modified)
>> +	 * @dev		: Device for which we do this operation (can be a CPU)
>>   	 *
>> -	 * active_power() must find the lowest capacity state of 'cpu' above
>> +	 * active_power() must find the lowest performance state of 'dev' above
>>   	 * 'freq' and update 'power' and 'freq' to the matching active power
>>   	 * and frequency.
>>   	 *
>> -	 * The power is the one of a single CPU in the domain, expressed in
>> -	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
>> -	 * range.
>> +	 * In case of CPUs, the power is the one of a single CPU in the domain,
>> +	 * expressed in milli-watts. It is expected to fit in the
>> +	 * [0, EM_MAX_POWER] range.
>>   	 *
>>   	 * Return 0 on success.
>>   	 */
>> -	int (*active_power)(unsigned long *power, unsigned long *freq, int cpu);
>> +	int (*active_power)(unsigned long *power, unsigned long *freq,
>> +			    struct device *dev);
> 
> Given that you've made explicit in the doc of struct em_perf_state that
> 'power' can be a 'total' value (static + dynamic), this could be renamed
> I suppose.

I have check some literature and indeed 'active power' is not present,
but I could find 'active energy' and 'standby energy'. So we could
use 'active power' when we are talking in context of active energy.
In some other place I found 'Operating power (dynamic + leakage)' and
'Standby power' measurements for different architectures.

So I would prefer to keep 'active_power' which would mean the power
when a device was running (active).

> 
> <snip>
>>   /**
>>    * em_cpu_get() - Return the performance domain for a CPU
>>    * @cpu : CPU to find the performance domain for
>>    *
>> - * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
>> + * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
>>    * exist.
>>    */
>>   struct em_perf_domain *em_cpu_get(int cpu)
>>   {
>> -	return READ_ONCE(per_cpu(em_data, cpu));
> 
> Since CPU perf domains are guaranteed to never go away, it'd be safe to
> keep that per-CPU variable and avoid the locking and list manipulation
> below. No strong opinion, though.

The functions em_cpu_get() and em_get_pd() are called only during
start phase (topology initialization or thermal setup). After that
these subsystems carry on with the returned pointer in their private
structures. So I would prefer to keep implementation clean and have all
EM structures in one list (avoiding the per-cpu).

> 
>> +	struct em_device *em_dev;
>> +
>> +	mutex_lock(&em_pd_mutex);
>> +
>> +	if (list_empty(&em_pd_dev_list))
>> +		goto unlock;
>> +
>> +	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
>> +		if (!_is_cpu_em(em_dev->em_pd))
>> +			continue;
>> +
>> +		if (cpumask_test_cpu(cpu, em_span_cpus(em_dev->em_pd))) {
>> +			mutex_unlock(&em_pd_mutex);
>> +			return em_dev->em_pd;
>> +		}
>> +	}
>> +
>> +unlock:
>> +	mutex_unlock(&em_pd_mutex);
>> +	return NULL;
>>   }
>>   EXPORT_SYMBOL_GPL(em_cpu_get);
> 
> <snip>
>>   /**
>> - * em_register_perf_domain() - Register the Energy Model of a performance domain
>> - * @span	: Mask of CPUs in the performance domain
>> - * @nr_states	: Number of capacity states to register
>> + * em_register_perf_domain() - Register the Energy Model (EM) of a performance
>> + *		domain for the device
>> + * @dev		: Device for which the EM is to register
>> + * @nr_states	: Number of performance states to register
>>    * @cb		: Callback functions providing the data of the Energy Model
>> + * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
>> + *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
> 
> It should be policy->related_cpus actually (or 'real_cpus' even) -- PM_EM
> ignores hotplug ATM. Perhaps we should document that somewhere ...

I also had this feeling until I have checked the cpufreq_online().
In that function after a call to driver's init function, the
'related_cpus' is set, not before (based on policy->cpus).
So I think it is safe to say 'policy->cpus' here.

https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1344

> 
>> + *		type of devices this should be set to NULL.
>>    *
>>    * Create Energy Model tables for a performance domain using the callbacks
>>    * defined in cb.
>> @@ -196,63 +361,129 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
> 
> Thanks,
> Quentin
> 

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
