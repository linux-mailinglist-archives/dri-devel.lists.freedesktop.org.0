Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10303A98C4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 13:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A666E59B;
	Wed, 16 Jun 2021 11:07:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E4266E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 11:07:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B01821042;
 Wed, 16 Jun 2021 04:07:08 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B7783F70D;
 Wed, 16 Jun 2021 04:07:07 -0700 (PDT)
Subject: Re: [PATCH] modified: gpu/drm/panfrost/panfrost_gpu.c
To: Chunyou Tang <tangchunyou@163.com>
References: <20210609063850.2060-1-tangchunyou@163.com>
 <78a2488a-71d5-548a-e221-7786f788509c@arm.com>
 <20210610210659.00003155@163.com>
 <d1304645-f2bf-8cea-2b60-24e0a3936ed7@arm.com>
 <20210615150452.00007abc@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <31644881-134a-2d6e-dddf-e658a3a8176b@arm.com>
Date: Wed, 16 Jun 2021 12:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210615150452.00007abc@163.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 tangchunyou <tangchunyou@163.icubecorp.cn>, tangchunyou@icubecorp.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2021 08:04, Chunyou Tang wrote:
> Hi steve,
> 	After I send the V2,I found I setting a wrong email 
> configuration,I hope it doesn't affect the patch submission :)
> 	Did you received my another patch about panfrost_job.c?

There's still something odd going on with your emails - I haven't
received them directly (only via the list) and you appear to have sent 3
copies of "[PATCH 2/2] drm/panfrost:report the full raw fault
information instead"[1][2][3] - but I can't see any "[PATCH 1/2]" which
is presumably meant to be the original patch? Can you double check?
Obviously 2/2 depends on 1/2.

[1] https://lore.kernel.org/lkml/20210615054931.707-1-tangchunyou@163.com/
[2] https://lore.kernel.org/lkml/20210615064659.775-1-tangchunyou@163.com/
[3] https://lore.kernel.org/lkml/20210615065936.897-1-tangchunyou@163.com/

You also appear to have sneaked a new patch in here - please do post
patches separately otherwise they tend to get lost.

> 
> 	Author: tangchunyou <tangchunyou@163.icubecorp.cn>
> Date:   Wed Jun 9 14:44:52 2021 +0800
> 
>     modified: gpu/drm/panfrost/panfrost_job.c

As mentioned before - please provide a meaningful description of the
patch in the subject along with the common prefix for the
subsystem/driver (git log is useful to find out what is common for the
code you are changing). For Panfrost this is "drm/panfrost: ".

>     The 'break' can cause 'Memory manager not clean during takedown'
>     It cannot use break to finish the circulation,it should use
>     continue to traverse the circulation.

Have you actually observed this? In what situation?

>     Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..52bccc1d2d42 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -281,7 +281,7 @@ static void panfrost_job_cleanup(struct kref *ref)
>         if (job->mappings) {
>                 for (i = 0; i < job->bo_count; i++) {
>                         if (!job->mappings[i])
> -                               break;
> +                               continue;

So while this change is reasonable as it makes this loop a little more
robust, I don't see how this could actually happen.

Unless I'm mistaken the situation where some mappings may be NULL is
caused by the loop in panfrost_lookup_bos() not completing successfully
(panfrost_gem_mapping_get() returning NULL). In this case if mappings[i]
is NULL then all following mappings must also be NULL. So 'break' allows
us to skip the later ones. Admittedly the performance here isn't
important so I'm not sure it's worth the optimisation, but AIUI this
code isn't actually wrong.

But if you've got an example of this actually breaking then clearly this
is something we need to fix.

Thanks,

Steve

>                         atomic_dec(&job->mappings[i]->obj->gpu_usecount);
>                         panfrost_gem_mapping_put(job->mappings[i]);
> 
> 
> Thank you!
> 
> 
> 
> 于 Fri, 11 Jun 2021 11:10:16 +0100
> Steven Price <steven.price@arm.com> 写道:
> 
>> On 10/06/2021 14:06, Chunyou Tang wrote:
>>> Hi Steven,
>>
>> Hi Chunyou,
>>
>> For some reason I'm not directly receiving your emails (only via the
>> list) - can you double check your email configuration?
>>
>>>>> The GPU exception fault status register(0x3C),the low 8 bit is the
>>>>> EXCEPTION_TYPE.We can see the description at P3-78 in spec.
>>>
>>> 	You can see the spec
>>> 	<arm_heimdall_technical_reference_manual_100612_0001_00_en.pdf>.
>>
>> Thanks - please include that in the commit message - there are many
>> TRMs (one for each GPU) so without the information about exactly which
>> specification the page number is pretty useless. Sadly this
>> documentation isn't public which would be even better but I don't
>> think there are any public specs for this information.
>>
>>>> However this change is correct - panfrost_exception_name() should
>>>> be taking only the lower 8 bits. Even better though would be to to
>>>> report the full raw fault information as well as the high bits can
>>>> contain useful information:
>>>>
>>>> 	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
>>>> 0x%016llx\n", fault_status,
>>>> 		 panfrost_exception_name(pfdev, fault_status &
>>>> 0xFF), address);
>>>
>>> So I change it according to what you said?
>>
>> Yes, please send a v2.
>>
>> Thanks,
>>
>> Steve
>>
>>> 于 Thu, 10 Jun 2021 11:41:52 +0100
>>> Steven Price <steven.price@arm.com> 写道:
>>>
>>>> The subject should have the prefix "drm/panfrost" and should
>>>> mention what the patch is changing (not just the filename).
>>>>
>>>> On 09/06/2021 07:38, ChunyouTang wrote:
> 
>>>>> From: tangchunyou <tangchunyou@163.icubecorp.cn>
>>>>>
>>>>> The GPU exception fault status register(0x3C),the low 8 bit is the
>>>>> EXCEPTION_TYPE.We can see the description at P3-78 in spec.
>>>>
>>>> Nit: When referring to a spec it's always good to mention the name
>>>> - I'm not sure which specification you found this in.
>>>>
>>>>>
>>>>> Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
>>>>> ---
>>>>>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
>>>>> 2aae636f1cf5..1fffb6a0b24f 100644 ---
>>>>> a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
>>>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@ static
>>>>> irqreturn_t panfrost_gpu_irq_handler(int irq, void *data) address
>>>>> |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO); 
>>>>>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
>>>>> 0x%016llx\n",
>>>>> -			 fault_status & 0xFF,
>>>>> panfrost_exception_name(pfdev, fault_status),
>>>>> +			 fault_status & 0xFF,
>>>>> panfrost_exception_name(pfdev, fault_status & 0xFF),
>>>>
>>>> However this change is correct - panfrost_exception_name() should
>>>> be taking only the lower 8 bits. Even better though would be to to
>>>> report the full raw fault information as well as the high bits can
>>>> contain useful information:
>>>>
>>>> 	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
>>>> 0x%016llx\n", fault_status,
>>>> 		 panfrost_exception_name(pfdev, fault_status &
>>>> 0xFF), address);
>>>>
>>>> Thanks,
>>>>
>>>> Steve
>>>>
>>>>>  			 address);
>>>>>  
>>>>>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
>>>>>
>>>
>>>
> 
> 

