Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369021D0BA3
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 11:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE566E9CE;
	Wed, 13 May 2020 09:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C419889C68
 for <dri-devel@lists.freedesktop.org>; Tue, 12 May 2020 11:11:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9E0930E;
 Tue, 12 May 2020 04:11:18 -0700 (PDT)
Received: from [10.37.12.83] (unknown [10.37.12.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB2703F71E;
 Tue, 12 May 2020 04:11:08 -0700 (PDT)
Subject: Re: [PATCH v7 03/15] PM / EM: update callback structure and add
 device pointer
To: Quentin Perret <qperret@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-4-lukasz.luba@arm.com>
 <20200511115722.GA13741@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <a2c20b82-58e3-a2ef-2d8d-edbaf05277ec@arm.com>
Date: Tue, 12 May 2020 12:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200511115722.GA13741@google.com>
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

Hi Quentin,

On 5/11/20 12:57 PM, Quentin Perret wrote:
> On Monday 11 May 2020 at 12:19:00 (+0100), Lukasz Luba wrote:
>> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
>> index 61623e2ff149..11ee24e06d12 100644
>> --- a/drivers/cpufreq/scmi-cpufreq.c
>> +++ b/drivers/cpufreq/scmi-cpufreq.c
>> @@ -103,17 +103,12 @@ scmi_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
>>   }
>>   
>>   static int __maybe_unused
>> -scmi_get_cpu_power(unsigned long *power, unsigned long *KHz, int cpu)
>> +scmi_get_cpu_power(unsigned long *power, unsigned long *KHz,
>> +		   struct device *cpu_dev)
>>   {
>> -	struct device *cpu_dev = get_cpu_device(cpu);
>>   	unsigned long Hz;
>>   	int ret, domain;
>>   
>> -	if (!cpu_dev) {
>> -		pr_err("failed to get cpu%d device\n", cpu);
>> -		return -ENODEV;
>> -	}
>> -
>>   	domain = handle->perf_ops->device_domain_id(cpu_dev);
>>   	if (domain < 0)
>>   		return domain;
>> @@ -200,7 +195,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
>>   
>>   	policy->fast_switch_possible = true;
>>   
>> -	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
> 
> So this one has no users after this patch right? I suppose you could
> squash patch 05 in this one. But no big deal.

Yes, it was tricky to me to decide the splits suggested by Daniel and
this is the example. I had to introduce the em_dev_register_perf_domain
and make clients of it before I remove the old em_register_perf_domain
completely. I agree it could also go with the patch 5, but it does not
harm to be here.

> 
> Acked-by: Quentin Perret <qperret@google.com>

Thank you for this ACKs and the earlier.

Regards,
Lukasz

> 
>> +	em_dev_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
>>   
>>   	return 0;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
