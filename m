Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF77530001E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 11:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D51D6E9CD;
	Fri, 22 Jan 2021 10:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72DA26E9A6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 10:24:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9D3D11D4;
 Fri, 22 Jan 2021 02:24:20 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 889CA3F719;
 Fri, 22 Jan 2021 02:24:19 -0800 (PST)
Subject: Re: [PATCH] drm/panfrost: Add governor data with pre-defined
 thresholds
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20210121170445.19761-1-lukasz.luba@arm.com>
 <c5ad1148-0494-aaed-581a-c13ed94e42e8@arm.com>
 <38c4dc94-0613-33f9-e4e4-e42d451aed9b@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <cd5a78e8-ba0a-d502-29e7-8d25ddb52659@arm.com>
Date: Fri, 22 Jan 2021 10:24:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <38c4dc94-0613-33f9-e4e4-e42d451aed9b@arm.com>
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alyssa.rosenzweig@collabora.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/01/2021 10:00, Lukasz Luba wrote:
> 
> 
> On 1/22/21 8:21 AM, Steven Price wrote:
>> On 21/01/2021 17:04, Lukasz Luba wrote:
>>> The simple_ondemand devfreq governor uses two thresholds to decide about
>>> the frequency change: upthreshold, downdifferential. These two tunable
>>> change the behavior of the governor decision, e.g. how fast to increase
>>> the frequency or how rapidly limit the frequency. This patch adds needed
>>> governor data with thresholds values gathered experimentally in 
>>> different
>>> workloads.
>>>
>>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>>> ---
>>> Hi all,
>>>
>>> This patch aims to improve the panfrost performance in various 
>>> workloads,
>>> (benchmarks, games). The simple_ondemand devfreq governor supports
>>> tunables to tweak the behaviour of the internal algorithm. The default
>>> values for these two thresholds (90 and 5) do not work well with 
>>> panfrost.
>>> These new settings should provide good performance, short latency for
>>> rising the frequency due to rapid workload change and decent freq slow
>>> down when the load is decaying. Based on frequency change statistics,
>>> gathered during experiments, all frequencies are used, depending on
>>> the load. This provides some power savings (statistically). The highest
>>> frequency is also used when needed.
>>>
>>> Example glmark2 results:
>>> 1. freq fixed to max: 153
>>> 2. these new thresholds values (w/ patch): 151
>>> 3. default governor values (w/o patch): 114
>>
>> It would be good to state which platform this is on as this obviously 
>> can vary depending on the OPPs available.
> 
> Sorry about that. It was Rock Pi 4B and I have mesa 20.2.4.
> 
>>
>> Of course the real fix here would be to improve the utilisation of the 
>> GPU[1] so we actually hit the 90% threshold more easily (AFAICT kbase 
>> uses the default 90/5 thresholds), but this seems like a reasonable 
>> change for now.
> 
> Agree, improving the scheduler would be the best option. I'll have a
> look at that patch and why it got this 10% lower performance. Maybe
> I would find something during testing.

I'm afraid it'll probably need a fair bit of work to rebase - things 
have changed around that code. I'm hoping that most of the problem was 
really around how Mesa was driving the GPU at that time and things 
should be better. The DDK (hacked to talk Panfrost ioctls) saw a 
performance improvement.

Let me know if you hit problems and need any help.

>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Thank you for the review. I guess this patch would go through drm tree?

Yes, I'll push it to drm-misc-next later.

Thanks,

Steve

> Regards,
> Lukasz
> 
>>
>> Thanks,
>>
>> Steve
>>
>> [1] When I get some time I need to rework the "queue jobs on the 
>> hardware"[2] patch I posted ages ago. Last time it actually caused a 
>> performance regression though...
>>
>> [2] 
>> https://lore.kernel.org/r/20190816093107.30518-2-steven.price%40arm.com
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
