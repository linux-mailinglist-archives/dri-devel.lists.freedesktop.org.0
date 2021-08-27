Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7CF3F9AE1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 16:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E838D6E97F;
	Fri, 27 Aug 2021 14:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15936E97D;
 Fri, 27 Aug 2021 14:29:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d26so10840346wrc.0;
 Fri, 27 Aug 2021 07:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=pJAqz29u/08yJ0qufA/Xwf1XpUYWFquFyEPNeMhb1Co=;
 b=hVFHOv44d9hbyJTY8Y1Xv1wFdcTgxOzXhrpatFSzCJjsw1No89sryuVV12Wk229FXP
 MsJ7gWB1hablJ+ULgxVf6h9tT7M9f9VjAf1STu5jmiuga7YPl2qw7+X99Olq6HbABmvm
 AhTFlzsgS/K9Nb62dwYooagEeium0/1/kWEsrqI9BA+EuWrbxxocuhbPnFY5aiHWZVrT
 MehKWX+R7kf+FDS6oyln7cD0QVRjScVcDETQDvUhPp5jwoyLS3QI89+nL5aCPcG67bsM
 nsiD1XWsu0JFeIISgXs3+BTxEwRWftA6d3X9rJu8jKSQIFU+YimI0TmwC2ev29H2tZFZ
 iUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pJAqz29u/08yJ0qufA/Xwf1XpUYWFquFyEPNeMhb1Co=;
 b=laHCB5Xnm56cKeyGf51NR+zrXKV0ME0QH/H31NiJp7HOWmWX0IwRIvG23YgS74peW9
 YHhQma8QxVLomYy3sKipz82s9lxZnb4MM7ctTzYs7KY+SCF2YDRL5VS55S+aYCpbiBT1
 v7cm2Xq5k21OrToMWSdO4mfDSJZM4VtMjm6CIS96dPMJVR9H6w0b5DWIaMXlvzjvzX0U
 MKugwk1TwzqRGVnUQ5G50CwztDa+hkIo1GolYUgp/aIGyFMJBvpM26VYbPQSlUiTBQfq
 AdOcHUEw1htZzCikP4fidhskdfY2TWo8weXrwFQOtB7P1JeMJGwDX3taOWdt81kSYPSV
 0A+A==
X-Gm-Message-State: AOAM531zIwMl4xXat/Ugr26s9FlrGWg12f7MVbu9hwIWUezYXAmDRAFI
 6KuiRrm2mD5mV5PDPUq9XsndYbNJvkc=
X-Google-Smtp-Source: ABdhPJzClc0ofTbnoCnBDBGqjnwTqcilmJdANTbpALscQDtP0Z3bp6WpVNztVcOBAIXm64ZTEdRLig==
X-Received: by 2002:a5d:534c:: with SMTP id t12mr10558747wrv.219.1630074576381; 
 Fri, 27 Aug 2021 07:29:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:1ea5:a2d5:a05c:1ebb?
 ([2a02:908:1252:fb60:1ea5:a2d5:a05c:1ebb])
 by smtp.gmail.com with ESMTPSA id t14sm6457976wrw.59.2021.08.27.07.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 07:29:35 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
 <BL1PR12MB5269AAC2FA518CF85724C85D84C89@BL1PR12MB5269.namprd12.prod.outlook.com>
 <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <da180d36-b5dd-733e-3721-3333b0cf405e@gmail.com>
Date: Fri, 27 Aug 2021 16:29:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <257202a9-a670-5b89-f98d-01855b6e41cf@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I don't think that makes sense.

See we don't want to start the time when the job is inserted into the 
ring buffer, but rather when it starts processing.

Starting processing is a bit swampy defined, but just starting the timer 
when the previous job completes should be fine enough.

Christian.

Am 27.08.21 um 15:57 schrieb Andrey Grodzovsky:
> The TS represents the point in time when the job was inserted into the 
> pending list.
> I don't think it matters when it actually starts to be processed, what 
> matters is when this job was inserted into pending list because right 
> at that point you arm the TO timer (when no other is running already)
> and so when the previous job completes and you cancel and rearm again 
> you can use that TS from the next job in pending list to calculate how 
> much time has actually left for it to run before TDR must be initiated
> and not just give it again full TO value to run even if it has already 
> been running for a while.
>
> Also, i am not sure also about the assumption that what we measure is 
> processing by HW, what we measure is from the moment it was scheduled 
> to ring to the moment the job completed (EOP event). At least that 
> what our TDR timer measures and so it makes sense to set the TS at 
> this point.
>
> Andrey
>
> On 2021-08-27 3:20 a.m., Liu, Monk wrote:
>> [AMD Official Use Only]
>>
>> what is that 'ts' representing for ? it looks to me the jiffies that 
>> it get scheduled to the ring,  but a job scheduled to the ring 
>> doesn't represent it's being processed by hw.
>>
>> Thanks
>>
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>> Sent: Friday, August 27, 2021 4:14 AM
>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org; 
>> Koenig, Christian <Christian.Koenig@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
>>
>> Attached quick patch for per job TTL calculation to make more 
>> precises next timer expiration. It's on top of the patch in this 
>> thread. Let me know if this makes sense.
>>
>> Andrey
>>
>> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>>> issue:
>>>> in cleanup_job the cancle_delayed_work will cancel a TO timer even
>>>> the its corresponding job is still running.
>>>>
>>>> fix:
>>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>>> only when the heading job is signaled, and if there is a "next" job
>>>> we start_timeout again.
>>>>
>>>> v2:
>>>> further cleanup the logic, and do the TDR timer cancelling if the
>>>> signaled job is the last one in its scheduler.
>>>>
>>>> v3:
>>>> change the issue description
>>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>>> recover the implement of drm_sched_job_begin.
>>>>
>>>> TODO:
>>>> 1)introduce pause/resume scheduler in job_timeout to serial the
>>>> handling of scheduler and job_timeout.
>>>> 2)drop the bad job's del and insert in scheduler due to above
>>>> serialization (no race issue anymore with the serialization)
>>>>
>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 25
>>>> ++++++++++---------------
>>>>    1 file changed, 10 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index a2a9536..ecf8140 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>    {
>>>>        struct drm_sched_job *job, *next;
>>>>    -    /*
>>>> -     * Don't destroy jobs while the timeout worker is running OR
>>>> thread
>>>> -     * is being parked and hence assumed to not touch pending_list
>>>> -     */
>>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>>>> -        kthread_should_park())
>>>> +    if (kthread_should_park())
>>>>            return NULL;
>>>
>>> I actually don't see why we need to keep the above, on the other side
>>> (in drm_sched_stop) we won't touch the pending list anyway until sched
>>> thread came to full stop (kthread_park). If you do see a reason why
>>> this needed then a comment should be here i think.
>>>
>>> Andrey
>>>
>>>
>>>> spin_lock(&sched->job_list_lock);
>>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct
>>>> drm_gpu_scheduler *sched)
>>>>        if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>>            /* remove job from pending_list */
>>>>            list_del_init(&job->list);
>>>> +
>>>> +        /* cancel this job's TO timer */
>>>> +        cancel_delayed_work(&sched->work_tdr);
>>>>            /* make the scheduled timestamp more accurate */
>>>>            next = list_first_entry_or_null(&sched->pending_list,
>>>>                            typeof(*next), list);
>>>> -        if (next)
>>>> +
>>>> +        if (next) {
>>>>                next->s_fence->scheduled.timestamp =
>>>>                    job->s_fence->finished.timestamp;
>>>> -
>>>> +            /* start TO timer for next job */
>>>> +            drm_sched_start_timeout(sched);
>>>> +        }
>>>>        } else {
>>>>            job = NULL;
>>>> -        /* queue timeout for next job */
>>>> -        drm_sched_start_timeout(sched);
>>>>        }
>>>>          spin_unlock(&sched->job_list_lock);
>>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>>                          (entity = drm_sched_select_entity(sched))) ||
>>>>                         kthread_should_stop());
>>>>    -        if (cleanup_job) {
>>>> +        if (cleanup_job)
>>>>                sched->ops->free_job(cleanup_job);
>>>> -            /* queue timeout for next job */
>>>> -            drm_sched_start_timeout(sched);
>>>> -        }
>>>>              if (!entity)
>>>>                continue;

