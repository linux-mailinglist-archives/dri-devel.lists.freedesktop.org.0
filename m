Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E38143845
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 09:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9D86EBDC;
	Tue, 21 Jan 2020 08:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5EA76EA6C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 18:38:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D770E31B;
 Mon, 20 Jan 2020 10:38:53 -0800 (PST)
Received: from [10.37.12.169] (unknown [10.37.12.169])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B943B3F68E;
 Mon, 20 Jan 2020 10:38:43 -0800 (PST)
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Quentin Perret <qperret@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
Date: Mon, 20 Jan 2020 18:38:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:32:00 +0000
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
 viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, kernel-team@android.com, mgorman@suse.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/20/20 6:27 PM, Dietmar Eggemann wrote:
> On 20/01/2020 16:09, Quentin Perret wrote:
>> Hey Lukasz,
>>
>> On Monday 20 Jan 2020 at 14:52:07 (+0000), Lukasz Luba wrote:
>>> On 1/17/20 10:54 AM, Quentin Perret wrote:
>>>> Suggested alternative: have two registration functions like so:
>>>>
>>>> 	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
>>>> 			       struct em_data_callback *cb);
>>>> 	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
>>>> 			       struct em_data_callback *cb);
>>>
>>> Interesting, in the internal review Dietmar asked me to remove these two
>>> functions. I had the same idea, which would simplify a bit the
>>> registration and it does not need to check the dev->bus if it is CPU.
>>>
>>> Unfortunately, we would need also two function in drivers/opp/of.c:
>>> dev_pm_opp_of_register_cpu_em(policy->cpus);
>>> and
>>> dev_pm_opp_of_register_dev_em(dev);
>>>
>>> Thus, I have created only one registration function, which you can see
>>> in this patch set.
>>
>> Right, I can see how having a unified API would be appealing, but the
>> OPP dependency is a nono, so we'll need to work around one way or
>> another.
>>
>> FWIW, I don't think having separate APIs for CPUs and other devices is
>> that bad given that we already have entirely different frameworks to
>> drive their respective frequencies. And the _cpu variants are basically
>> just wrappers around the _dev ones, so not too bad either IMO :).
> 
> It's true that we need the policy->cpus cpumask only for cpu devices and
> we have it available when we call em_register_perf_domain()
> [scmi-cpufreq.c driver] or the OPP wrapper dev_pm_opp_of_register_em()
> [e.g. cpufreq-dt.c driver].
> 
> And we shouldn't make EM code dependent on OPP.
> 
> But can't we add 'struct cpumask *mask' as an additional argument to
> both which can be set to NULL for (devfreq) devices?
> 
> We can check in em_register_perf_domain() that we got a valid cpumask
> for a cpu device and ignore it for (devfreq) devices.
> 

I think we could avoid this additional argument 'cpumask'. I have
checked the cpufreq_cpu_get function, which should do be good for this:

---------->8-------------------------
static int _get_sharing_cpus(struct device *cpu_dev, struct cpumask *span)
{
         struct cpufreq_policy *policy;

         policy = cpufreq_cpu_get(cpu_dev->id);
         if (policy) {
                 cpumask_copy(span, policy->cpus);
                 cpufreq_cpu_put(policy);
                 return 0;
         } else {
                 return -EINVAL;
         }
}
--------------------------8<-------------------------------

It would be a replacement for:
ret = dev_pm_opp_get_sharing_cpus(dev, span);

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
