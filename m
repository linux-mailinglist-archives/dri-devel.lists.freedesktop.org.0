Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5C1D0BA4
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2696E9D9;
	Wed, 13 May 2020 09:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 049636E8BF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 11:38:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D48E30E;
 Tue, 12 May 2020 04:38:52 -0700 (PDT)
Received: from [10.37.12.83] (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D9103F71E;
 Tue, 12 May 2020 04:38:42 -0700 (PDT)
Subject: Re: [PATCH v7 04/15] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Quentin Perret <qperret@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-5-lukasz.luba@arm.com>
 <20200511134319.GA29112@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <270f3e37-8de8-2841-dca3-8d70089f7317@arm.com>
Date: Tue, 12 May 2020 12:38:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200511134319.GA29112@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 13 May 2020 09:09:29 +0000
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/11/20 2:43 PM, Quentin Perret wrote:
> Hey Lukasz,
> 
> On Monday 11 May 2020 at 12:19:01 (+0100), Lukasz Luba wrote:
> <snip>
>> @@ -27,12 +29,15 @@ struct em_perf_state {
>>    * em_perf_domain - Performance domain
>>    * @table:		List of performance states, in ascending order
>>    * @nr_perf_states:	Number of performance states
>> - * @cpus:		Cpumask covering the CPUs of the domain
>> + * @cpus:		Cpumask covering the CPUs of the domain. It's here
>> + *			for performance reasons to avoid potential cache
>> + *			misses during energy calculations in the scheduler
> 
> And because that saves a pointer, and simplifies allocating/freeing that
> memory region :)

True, I will add this also:
'and simplifies allocating/freeing that memory region'

> 
> <snip>
>> diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
>> index 5b8a1566526a..9cc7f2973600 100644
>> --- a/kernel/power/energy_model.c
>> +++ b/kernel/power/energy_model.c
>> @@ -2,8 +2,9 @@
>>   /*
>>    * Energy Model of CPUs
> 
> Should this comment change too?

Yes, indeed. I will adjust it.

> 
> <snip>
>> -static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
>> +static void em_debug_create_pd(struct device *dev)
>>   {
>>   	struct dentry *d;
>> -	char name[8];
>>   	int i;
>>   
>> -	snprintf(name, sizeof(name), "pd%d", cpu);
>> -
>>   	/* Create the directory of the performance domain */
>> -	d = debugfs_create_dir(name, rootdir);
>> +	d = debugfs_create_dir(dev_name(dev), rootdir);
> 
> So what will be the name for the perf domain of CPUs now? cpuX?

yeap, it will be 'cpu0', 'cpu4', etc...

> 
> <snip>
>> @@ -142,8 +149,8 @@ em_create_pd(struct device *dev, int nr_states, struct em_data_callback *cb,
>>   		 */
>>   		opp_eff = freq / power;
>>   		if (opp_eff >= prev_opp_eff)
>> -			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
>> -					cpu, i, i - 1);
>> +			dev_dbg(dev, "EM: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
>> +					i, i - 1);
> 
> It feels like changing from warn to debug doesn't really belong to this
> patch no?

I thought that these prints are not worth to introduce another patch.
This warning is a bit tricky, because we (SW eng) basically are not able
to tweak OPPs, we can only remove them to calm down this warning.

There are platforms, with dozen of OPPs, seeing this. Warnings triggers 
the automated tests scripts, which are sensitive to dmesg log level and
cause developers to spent time and investigate the issue.

Then, what if these OPPs are needed because the thermal was tested OK
with some OPPs which unfortunately are triggering also this warning.
They cannot remove these OPPS, but the warning would stay. We might see
this also for GPUs.

I decided to change it into dbg, due to the reason above.

> 
> <snip>
>> @@ -216,47 +274,50 @@ int em_dev_register_perf_domain(struct device *dev, unsigned int nr_states,
>>   	 */
>>   	mutex_lock(&em_pd_mutex);
>>   
>> -	for_each_cpu(cpu, span) {
>> -		/* Make sure we don't register again an existing domain. */
>> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
>> -			ret = -EEXIST;
>> -			goto unlock;
>> -		}
>> +	if (dev->em_pd) {
>> +		ret = -EEXIST;
>> +		goto unlock;
>> +	}
>>   
>> -		/*
>> -		 * All CPUs of a domain must have the same micro-architecture
>> -		 * since they all share the same table.
>> -		 */
>> -		cap = arch_scale_cpu_capacity(cpu);
>> -		if (prev_cap && prev_cap != cap) {
>> -			pr_err("CPUs of %*pbl must have the same capacity\n",
>> -							cpumask_pr_args(span));
>> +	if (_is_cpu_device(dev)) {
> 
> Something like
> 
> 	if (!_is_cpu_device(dev))
> 		goto device;
> 
> would limit the diff a bit, but that may just be personal taste.

Possible

> 
> But appart from these nits, the patch LGTM.

Thank you for the review.

I will wait for Daniel's (because he suggested the em_pd inside
device struct) comments and if there is no other issues I will just
resend the patch with adjusted comment fields in response.

Regards,
Lukasz

> 
> Thanks,
> Quentin
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
