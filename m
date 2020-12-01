Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC962CB6BE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8217F6EA25;
	Wed,  2 Dec 2020 08:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CCA7A6E4D7
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 12:19:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75F30101E;
 Tue,  1 Dec 2020 04:19:46 -0800 (PST)
Received: from [10.57.28.12] (unknown [10.57.28.12])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 782AF3F718;
 Tue,  1 Dec 2020 04:19:27 -0800 (PST)
Subject: Re: [PATCH 2/5] thermal: devfreq_cooling: get a copy of device status
To: Ionela Voinescu <ionela.voinescu@arm.com>
References: <20200921122007.29610-1-lukasz.luba@arm.com>
 <20200921122007.29610-3-lukasz.luba@arm.com> <20201007161120.GC15063@arm.com>
 <76e0ef49-5898-adbb-0c54-23d5999f4907@arm.com>
 <20201201103614.GA1908@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <2fc2031d-e38e-2a17-8667-f2fc8d4f724b@arm.com>
Date: Tue, 1 Dec 2020 12:19:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201201103614.GA1908@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, rui.zhang@intel.com, orjan.eide@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/1/20 10:36 AM, Ionela Voinescu wrote:
> Hi,
> 
> Sorry for the delay and for the noise on this older version. I first
> want to understand the code better.
> 
> On Thursday 22 Oct 2020 at 11:55:28 (+0100), Lukasz Luba wrote:
> [..]
>>
>>>
>>>> +{
>>>> +	/* Make some space if needed */
>>>> +	if (status->busy_time > 0xffff) {
>>>> +		status->busy_time >>= 10;
>>>> +		status->total_time >>= 10;
>>>> +	}
>>>
>>> How about removing the above code and adding here:
>>>
>>> status->busy_time = status->busy_time ? : 1;
>>
>> It's not equivalent. The code operates on raw device values, which
>> might be big (e.g. read from counters). If it's lager than the 0xffff,
>> it is going to be shifted to get smaller.
>>
> 
> Yes, the big values are handled below through the division and by making
> total_time = 1024. These two initial checks are only to cover the
> possibility for busy_time and total_time being 0, or busy_time >
> total_time.
> 
>>>
>>>> +
>>>> +	if (status->busy_time > status->total_time)
>>>
>>> This check would then cover the possibility that total_time is 0.
>>>
>>>> +		status->busy_time = status->total_time;
>>>
>>> But a reversal is needed here:
>>> 		status->total_time = status->busy_time;
>>
>> No, I want to clamp the busy_time, which should not be bigger that
>> total time. It could happen when we deal with 'raw' values from device
>> counters.
>>
> 
> Yes, I understand. But isn't making total_time = busy_time accomplishing
> the same thing?
> 
>>>
>>>> +
>>>> +	status->busy_time *= 100;
>>>> +	status->busy_time /= status->total_time ? : 1;
>>>> +
>>>> +	/* Avoid division by 0 */
>>>> +	status->busy_time = status->busy_time ? : 1;
>>>> +	status->total_time = 100;
>>>
>>> Then all of this code can be replaced by:
>>>
>>> status->busy_time = (unsigned long)div64_u64((u64)status->busy_time << 10,
>>> 					     status->total_time);
>>> status->total_time = 1 << 10;
>>
>> No, the total_time closed to 'unsigned long' would overflow.
>>
> 
> I'm not sure I understand. total_time gets a value of 1024, it's not
> itself shifted by 10.
> 
>>>
>>> This way you gain some resolution to busy_time and the divisions in the
>>> callers would just become shifts by 10.
>>
>>
>> I don't want to gain more resolution here. I want to be prepare for raw
>> (not processed yet) big values coming from driver.
>>
> 
> Agreed! The higher resolution is an extra benefit. The more important
> benefit is that, through my suggestion, you'd be replacing all future
> divisions by shifts.

You have probably missed some bits.
I don't see benefits, you have div64_u64() which is heavy on 32bit CPUs.

Then, what is the range of these values:
busy_time [0, 1024], total_time 1024 in your case.
These values are used for estimating power in two cases:
1. in devfreq_cooling_get_requested_power()
	est_power = power * busy_time / total_time
2. in devfreq_cooling_power2state():
	est_power = power * total_time / busy_time

As you can see above, the est_power values could overflow if total_time,
busy_time are raw values (like in old implementation). So normalize them
into 'some' scale. That was the motivation ('scale' motivation below).

In your case you cannot avoid division in 2. use case, because busy_time
can be any value in range [0, 1024].
We could avoid the division in 1. use case, but load in cpufreq cooling
is also in range of [0, 100], so this devfreq cooling is aligned. I
would like to avoid situation when someone is parsing the traces
and these two devices present different load scale.

I will think about better 'devfreq utilization' (as also Daniel
suggested)in future, but first this EM must be in mainline and cpufreq
cooling changes made by Viresh also there.
But it would be more then just scale change to [0, 1024]...

Regards,
Lukasz


> 
> Thanks,
> Ionela.
> 
>> Regards,
>> Lukasz
>>
>>>
>>> Hope it helps,
>>> Ionela.
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
