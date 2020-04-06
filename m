Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EDC1A08F5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630A46E5A4;
	Tue,  7 Apr 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E150189E57
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:30:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 313E231B;
 Mon,  6 Apr 2020 06:30:09 -0700 (PDT)
Received: from [10.37.12.4] (unknown [10.37.12.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4473F7D8;
 Mon,  6 Apr 2020 06:29:58 -0700 (PDT)
Subject: Re: [PATCH v5 1/5] PM / EM: add devices to Energy Model
To: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-2-lukasz.luba@arm.com>
 <09b680a5-a118-8c6e-0ae1-03ab5f10c573@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <cb7f670a-a04f-ba6f-1486-0421f3cce2e9@arm.com>
Date: Mon, 6 Apr 2020 14:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <09b680a5-a118-8c6e-0ae1-03ab5f10c573@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the review.

On 4/3/20 5:05 PM, Daniel Lezcano wrote:
> 
> Hi Lukasz,
> 
> 
> On 18/03/2020 12:45, Lukasz Luba wrote:
>> Add support of other devices into the Energy Model framework not only the
>> CPUs. Change the interface to be more unified which can handle other
>> devices as well.
> 
> thanks for taking care of that. Overall I like the changes in this patch
> but it hard to review in details because the patch is too big :/
> 
> Could you split this patch into smaller ones?
> 
> eg. (at your convenience)
> 
>   - One patch renaming s/cap/perf/
> 
>   - One patch adding a new function:
> 
>      em_dev_register_perf_domain(struct device *dev,
> 				unsigned int nr_states,
> 				struct em_data_callback *cb);
> 
>     (+ EXPORT_SYMBOL_GPL)
> 
>      And em_register_perf_domain() using it.
> 
>   - One converting the em_register_perf_domain() user to
> 	em_dev_register_perf_domain
> 
>   - One adding the different new 'em' functions
> 
>   - And finally one removing em_register_perf_domain().

I agree and will do the split. I could also break the dependencies
for future easier merge.

> 
> 
>> Acked-by: Quentin Perret <qperret@google.com>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
> 
> [ ... ]
> 
>>   2. Core APIs
>> @@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
>>   Drivers are expected to register performance domains into the EM framework by
>>   calling the following API::
>>   
>> -  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
>> -			      struct em_data_callback *cb);
>> +  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
>> +		struct em_data_callback *cb, cpumask_t *cpus);
> 
> Isn't possible to get rid of this cpumask by using
> cpufreq_cpu_get() which returns the cpufreq's policy and from their get
> the related cpus ?

We had similar thoughts with Quentin and I've checked this.
Unfortunately, if the policy is a 'new policy' [1] it gets
allocated and passed into cpufreq driver ->init(policy) [2].
Then that policy is set into per_cpu pointer for each related_cpu [3]:

for_each_cpu(j, policy->related_cpus)
	per_cpu(cpufreq_cpu_data, j) = policy;


Thus, any calls of functions (i.e. cpufreq_cpu_get()) which try to
take this ptr before [3] won't work.

We are trying to register EM from cpufreq_driver->init(policy) and the
per_cpu policy is likely to be not populated at that phase.

Regards,
Lukasz

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1328
[2] 
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1350
[3] 
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1374


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
