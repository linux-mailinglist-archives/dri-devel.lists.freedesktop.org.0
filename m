Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE75186084
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487376E2D7;
	Sun, 15 Mar 2020 23:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BCB7A6EC3A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 17:11:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5810B31B;
 Fri, 13 Mar 2020 10:11:58 -0700 (PDT)
Received: from [10.37.12.40] (unknown [10.37.12.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F1D6B3F534;
 Fri, 13 Mar 2020 10:11:47 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] OPP: change parameter to device pointer in
 dev_pm_opp_of_register_em()
To: Quentin Perret <qperret@google.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-3-lukasz.luba@arm.com>
 <20200313101524.GA150397@google.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <3ac8ebf8-9db0-d168-8b80-f7f5ba345f86@arm.com>
Date: Fri, 13 Mar 2020 17:11:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200313101524.GA150397@google.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
 alyssa.rosenzweig@collabora.com, Morten.Rasmussen@arm.com,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/13/20 10:15 AM, Quentin Perret wrote:
> On Monday 09 Mar 2020 at 13:41:15 (+0000), Lukasz Luba wrote:
>> diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
>> index d2b5f062a07b..676b56424886 100644
>> --- a/drivers/cpufreq/cpufreq-dt.c
>> +++ b/drivers/cpufreq/cpufreq-dt.c
>> @@ -275,7 +275,9 @@ static int cpufreq_init(struct cpufreq_policy *policy)
>>   	policy->cpuinfo.transition_latency = transition_latency;
>>   	policy->dvfs_possible_from_any_cpu = true;
>>   
>> -	dev_pm_opp_of_register_em(policy->cpus);
>> +	ret = dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
>> +	if (ret)
>> +		dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
>>   
>>   	return 0;
> 
> Ah, that answers my comment on patch 01. You're adding the error
> messages here.
> 
> Isn't this more boilerplate for the drivers ? All they do is print the
> same debug message. Maybe just move it inside dev_pm_opp_of_register_em
> directly ?
> 

Agree. I could add a 'fail' label in dev_pm_opp_of_register_em
something like:

--------------------------------->8----------------
dev_pm_opp_of_register_em
...
	nr_opp = dev_pm_opp_get_opp_count(dev);
	if (nr_opp <= 0) {
		ret = -EINVAL;
		goto fail;
	}

...
	ret = em_register_perf_domain()
	if (ret)
		goto fail;

	return 0;

fail:
	dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
	return ret
------------------------8<-----------------

Makes more sense, agree, thank you for your suggestion.

I will remove this
   if (ret)
	dev_dbg(cpu_dev, "Couldn't register Energy Model %d\n", ret);
from the cpufreq drivers.


Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
