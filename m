Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7990F1DE7B2
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 15:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1836E0AA;
	Fri, 22 May 2020 13:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D397A6E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 13:09:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 842C8D6E;
 Fri, 22 May 2020 06:09:30 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461C13F68F;
 Fri, 22 May 2020 06:09:29 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: fix runtime pm imbalance on error
To: dinghao.liu@zju.edu.cn
References: <20200520110504.24388-1-dinghao.liu@zju.edu.cn>
 <73a1dc37-f862-f908-4c9f-64e256283857@arm.com>
 <1986c141.ba6f5.172360851d6.Coremail.dinghao.liu@zju.edu.cn>
From: Steven Price <steven.price@arm.com>
Message-ID: <272650ba-2c44-9084-7829-b04023eba723@arm.com>
Date: Fri, 22 May 2020 14:09:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1986c141.ba6f5.172360851d6.Coremail.dinghao.liu@zju.edu.cn>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2020 08:00, dinghao.liu@zju.edu.cn wrote:
> Hi Steve,
> 
> There are two bailing out points in panfrost_job_hw_submit(): one is
> the error path beginning from pm_runtime_get_sync(), the other one is
> the error path beginning from WARN_ON() in the if statement. The pm
> imbalance fixed in this patch is between these two paths. I think the
> caller of panfrost_job_hw_submit() cannot distinguish this imbalance
> outside this function.

My point is the caller expects panfrost_job_hw_submit() to increase the 
PM reference count. Since panfrost_job_hw_submit() cannot return an 
error (it's void return) we cannot signal to the caller that the 
reference hasn't been taken.

> panfrost_job_timedout() calls pm_runtime_put_noidle() for every job it
> finds, but all jobs are added to the pfdev->jobs just before calling
> panfrost_job_hw_submit(). Therefore I think the imbalance still exists.

My point's exactly that - the "jobs are added to pfdev->jobs just before 
calling panfrost_job_hw_submit()". Since we don't have a way for 
panfrost_job_hw_submit() to fail it must unconditionally take any 
references that will then be freed later on.

> But I'm not very sure if we should add pm_runtime_put on the error path
> after pm_runtime_get_sync(), or remove pm_runtime_put one the error path
> after WARN_ON().

The pm_runtime_put after the WARN_ON() is a bug. Sorry this is probably 
what confused you - clearly the WARN_ON() situation is never meant to 
happen in the first place, so hopefully this isn't actually possible.

Feel free to send a patch removing it! ;)

> As for the problem about panfrost_devfreq_record_busy(), this may be a
> new bug and requires independent patch to fix it.

Indeed, I'll post a proper patch for that later - I just spotted it 
while looking at the code.

Thanks,

Steve

> Regards,
> Dinghao
> 
> 
>> On 20/05/2020 12:05, Dinghao Liu wrote:
>>> pm_runtime_get_sync() increments the runtime PM usage counter even
>>> the call returns an error code. Thus a pairing decrement is needed
>>> on the error handling path to keep the counter balanced.
>>>
>>> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
>>
>> Actually I think we have the opposite problem. To be honest we don't
>> handle this situation very well. By the time panfrost_job_hw_submit() is
>> called the job has already been added to the pfdev->jobs array, so it's
>> considered submitted even if it never actually lands on the hardware. So
>> in the case of this function bailing out early we will then (eventually)
>> hit a timeout and trigger a GPU reset.
>>
>> panfrost_job_timedout() iterates through the pfdev->jobs array and calls
>> pm_runtime_put_noidle() for each job it finds. So there's no inbalance
>> here that I can see.
>>
>> Have you actually observed the situation where pm_runtime_get_sync()
>> returns a failure?
>>
>> HOWEVER, it appears that by bailing out early the call to
>> panfrost_devfreq_record_busy() is never made, which as far as I can see
>> means that there may be an extra call to panfrost_devfreq_record_idle()
>> when the jobs have timed out. Which could underflow the counter.
>>
>> But equally looking at panfrost_job_timedout(), we only call
>> panfrost_devfreq_record_idle() *once* even though multiple jobs might be
>> processed.
>>
>> There's a completely untested patch below which in theory should fix that...
>>
>> Steve
>>
>> ----8<---
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
>> b/drivers/gpu/drm/panfrost/panfrost_job.c
>> index 7914b1570841..f9519afca29d 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>> @@ -145,6 +145,8 @@ static void panfrost_job_hw_submit(struct
>> panfrost_job *job, int js)
>>    	u64 jc_head = job->jc;
>>    	int ret;
>>
>> +	panfrost_devfreq_record_busy(pfdev);
>> +
>>    	ret = pm_runtime_get_sync(pfdev->dev);
>>    	if (ret < 0)
>>    		return;
>> @@ -155,7 +157,6 @@ static void panfrost_job_hw_submit(struct
>> panfrost_job *job, int js)
>>    	}
>>
>>    	cfg = panfrost_mmu_as_get(pfdev, &job->file_priv->mmu);
>> -	panfrost_devfreq_record_busy(pfdev);
>>
>>    	job_write(pfdev, JS_HEAD_NEXT_LO(js), jc_head & 0xFFFFFFFF);
>>    	job_write(pfdev, JS_HEAD_NEXT_HI(js), jc_head >> 32);
>> @@ -410,12 +411,12 @@ static void panfrost_job_timedout(struct
>> drm_sched_job *sched_job)
>>    	for (i = 0; i < NUM_JOB_SLOTS; i++) {
>>    		if (pfdev->jobs[i]) {
>>    			pm_runtime_put_noidle(pfdev->dev);
>> +			panfrost_devfreq_record_idle(pfdev);
>>    			pfdev->jobs[i] = NULL;
>>    		}
>>    	}
>>    	spin_unlock_irqrestore(&pfdev->js->job_lock, flags);
>>
>> -	panfrost_devfreq_record_idle(pfdev);
>>    	panfrost_device_reset(pfdev);
>>
>>    	for (i = 0; i < NUM_JOB_SLOTS; i++)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
