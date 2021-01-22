Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F96B30143F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jan 2021 10:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AA06E1CF;
	Sat, 23 Jan 2021 09:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F4E16E9DC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:11:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2395411D4;
 Fri, 22 Jan 2021 02:11:33 -0800 (PST)
Received: from [10.57.9.64] (unknown [10.57.9.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11E523F719;
 Fri, 22 Jan 2021 02:11:30 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Add governor data with pre-defined
 thresholds
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20210121170445.19761-1-lukasz.luba@arm.com>
 <f1b5c801-71f9-c3b9-2017-d9ee5c6fd3d2@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <ec393a2c-2220-9ea8-db5c-7d651badc6b9@arm.com>
Date: Fri, 22 Jan 2021 10:11:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f1b5c801-71f9-c3b9-2017-d9ee5c6fd3d2@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 Jan 2021 09:38:10 +0000
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/21/21 5:15 PM, Daniel Lezcano wrote:
> On 21/01/2021 18:04, Lukasz Luba wrote:
>> The simple_ondemand devfreq governor uses two thresholds to decide about
>> the frequency change: upthreshold, downdifferential. These two tunable
>> change the behavior of the governor decision, e.g. how fast to increase
>> the frequency or how rapidly limit the frequency. This patch adds needed
>> governor data with thresholds values gathered experimentally in different
>> workloads.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>> Hi all,
>>
>> This patch aims to improve the panfrost performance in various workloads,
>> (benchmarks, games). The simple_ondemand devfreq governor supports
>> tunables to tweak the behaviour of the internal algorithm. The default
>> values for these two thresholds (90 and 5) do not work well with panfrost.
>> These new settings should provide good performance, short latency for
>> rising the frequency due to rapid workload change and decent freq slow
>> down when the load is decaying. Based on frequency change statistics,
>> gathered during experiments, all frequencies are used, depending on
>> the load. This provides some power savings (statistically). The highest
>> frequency is also used when needed.
>>
>> Example glmark2 results:
>> 1. freq fixed to max: 153
>> 2. these new thresholds values (w/ patch): 151
>> 3. default governor values (w/o patch): 114
>>
>> In future the devfreq framework would expose via sysfs these two
>> tunables, so they can be adjusted by the middleware based on currently
>> running workload (game, desktop, web browser, etc). These new values
>> should be good enough, though.
>>
>> Regards,
>> Lukasz Luba
>>
>>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 10 +++++++++-
>>   drivers/gpu/drm/panfrost/panfrost_devfreq.h |  2 ++
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> index 56b3f5935703..7c5ffc81dce1 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>> @@ -130,8 +130,16 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>   	panfrost_devfreq_profile.initial_freq = cur_freq;
>>   	dev_pm_opp_put(opp);
>>   
>> +	/*
>> +	 * Setup default thresholds for the simple_ondemand governor.
>> +	 * The values are chosen based on experiments.
>> +	 */
>> +	pfdevfreq->gov_data.upthreshold = 45;
>> +	pfdevfreq->gov_data.downdifferential = 5;
>> +
>>   	devfreq = devm_devfreq_add_device(dev, &panfrost_devfreq_profile,
>> -					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
>> +					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
>> +					  &pfdevfreq->gov_data);
>>   	if (IS_ERR(devfreq)) {
>>   		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
>>   		ret = PTR_ERR(devfreq);
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>> index db6ea48e21f9..1e2a4de941aa 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>> @@ -4,6 +4,7 @@
>>   #ifndef __PANFROST_DEVFREQ_H__
>>   #define __PANFROST_DEVFREQ_H__
>>   
>> +#include <linux/devfreq.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/ktime.h>
>>   
>> @@ -17,6 +18,7 @@ struct panfrost_devfreq {
>>   	struct devfreq *devfreq;
>>   	struct opp_table *regulators_opp_table;
>>   	struct thermal_cooling_device *cooling;
>> +	struct devfreq_simple_ondemand_data gov_data;
>>   	bool opp_of_table_added;
>>   
>>   	ktime_t busy_time;
> 
> I think it is simpler to do:
> 
> +static struct devfreq_simple_ondemand_data panfrost_ondemand_data = {
> +       .upthreshold = 45,
> +       .downdifferential = 5,
> +};
> 
> [ ... ]
> 
>         devfreq = devm_devfreq_add_device(dev, &panfrost_devfreq_profile,
> -                                         DEVFREQ_GOV_SIMPLE_ONDEMAND,
> NULL);
> +                                         DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +                                         &panfrost_ondemand_data);
> 
> 

Yes, it's simpler. The driver would probably never have to serve two
GPUs. I've tried to keep this thing inside the panfrost struct,
forgetting about it.

Steven already reviewed the patch, so it can probably stay.
I will keep it in mind. Thank you for the comments.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
