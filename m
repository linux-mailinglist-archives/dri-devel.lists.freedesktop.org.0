Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA630D4C9
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A7F6E9D5;
	Wed,  3 Feb 2021 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B73B289856;
 Tue,  2 Feb 2021 14:02:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7533ED1;
 Tue,  2 Feb 2021 06:02:14 -0800 (PST)
Received: from [10.57.14.222] (unknown [10.57.14.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430A43F718;
 Tue,  2 Feb 2021 06:02:13 -0800 (PST)
Subject: Re: [PATCH] drm/lima: Use delayed timer as default in devfreq profile
To: Qiang Yu <yuq825@gmail.com>
References: <20210127105121.20345-1-lukasz.luba@arm.com>
 <CAKGbVbsn=xVEa0=c3rywRShVZD18LkmLZ1qDUuDsrT5KnTjr6g@mail.gmail.com>
 <3d1b4696-0172-f88a-f41f-c66ac3baa429@arm.com>
 <CAKGbVbsuqsGYRqUyWRiC+h9o7kNMvB16-Y6378KG_rv0SG4VDQ@mail.gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <aab9c140-155e-894f-5b7d-749396a388fc@arm.com>
Date: Tue, 2 Feb 2021 14:02:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAKGbVbsuqsGYRqUyWRiC+h9o7kNMvB16-Y6378KG_rv0SG4VDQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/2/21 1:01 AM, Qiang Yu wrote:
> Hi Lukasz,
> 
> Thanks for the explanation. So the deferred timer option makes a mistake that
> when GPU goes from idle to busy for only one poll periodic, in this
> case 50ms, right?

Not exactly. Driver sets the polling interval to 50ms (in this case)
because it needs ~3-frame average load (in 60fps). I have discovered the
issue quite recently that on systems with 2 CPUs or more, the devfreq
core is not monitoring the devices even for seconds. Therefore, we might
end up with quite big amount of work that GPU is doing, but we don't
know about it. Devfreq core didn't check <- timer didn't fired. Then
suddenly that CPU, which had the deferred timer registered last time,
is waking up and timer triggers to check our device. We get the stats,
but they might be showing load from 1sec not 50ms. We feed them into
governor. Governor sees the new load, but was tested and configured for
50ms, so it might try to rise the frequency to max. The GPU work might
be already lower and there is no need for such freq. Then the CPU goes
idle again, so no devfreq core check for next e.g. 1sec, but the
frequency stays at max OPP and we burn power.

So, it's completely unreliable. We might stuck at min frequency and
suffer the frame drops, or sometimes stuck to max freq and burn more
power when there is no such need.

Similar for thermal governor, which is confused by this old stats and
long period stats, longer than 50ms.

Stats from last e.g. ~1sec tells you nothing about real recent GPU
workload.

> But delayed timer will wakeup CPU every 50ms even when system is idle, will this
> cause more power consumption for the case like phone suspend?

No, in case of phone suspend it won't increase the power consumption.
The device won't be woken up, it will stay in suspend.

Regards,
Lukasz


> 
> Regards,
> Qiang
> 
> 
> On Mon, Feb 1, 2021 at 5:53 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Qiang,
>>
>> On 1/30/21 1:51 PM, Qiang Yu wrote:
>>> Thanks for the patch. But I can't observe any difference on glmark2
>>> with or without this patch.
>>> Maybe you can provide other test which can benefit from it.
>>
>> This is a design problem and has impact on the whole system.
>> There is a few issues. When the device is not checked and there are
>> long delays between last check and current, the history is broken.
>> It confuses the devfreq governor and thermal governor (Intelligent Power
>> Allocation (IPA)). Thermal governor works on stale stats data and makes
>> stupid decisions, because there is no new stats (device not checked).
>> Similar applies to devfreq simple_ondemand governor, where it 'tires' to
>> work on a loooong period even 3sec and make prediction for the next
>> frequency based on it (which is broken).
>>
>> How it should be done: constant reliable check is needed, then:
>> - period is guaranteed and has fixed size, e.g 50ms or 100ms.
>> - device status is quite recent so thermal devfreq cooling provides
>>     'fresh' data into thermal governor
>>
>> This would prevent odd behavior and solve the broken cases.
>>
>>>
>>> Considering it will wake up CPU more frequently, and user may choose
>>> to change this by sysfs,
>>> I'd like to not apply it.
>>
>> The deferred timer for GPU is wrong option, for UFS or eMMC makes more
>> sense. It's also not recommended for NoC busses. I've discovered that
>> some time ago and proposed to have option to switch into delayed timer.
>> Trust me, it wasn't obvious to find out that this missing check has
>> those impacts. So the other engineers or users might not know that some
>> problems they faces (especially when the device load is changing) is due
>> to this delayed vs deffered timer and they will change it in the sysfs.
>>
>> Regards,
>> Lukasz
>>
>>>
>>> Regards,
>>> Qiang
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
