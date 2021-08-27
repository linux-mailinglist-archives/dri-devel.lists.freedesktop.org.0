Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95453F9435
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 08:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882996E8D8;
	Fri, 27 Aug 2021 06:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0646E8D8;
 Fri, 27 Aug 2021 06:12:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id g138so3129225wmg.4;
 Thu, 26 Aug 2021 23:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9jh9aei13yBSS+RNXZRtXzAqAi8GuIqhLXMAutPl5gc=;
 b=TxGNgkavLPtsL94m7mpAHs9ivj0l4Db+U2Vi5L45n0XlWPzp1PYdSMWA27N1cue7Zn
 GO9u9J7gUph0Cm9nyBnS7FnPq8oFE8e2dpmYnxFrtkFGoP1r+MdExhL95T2IW6cPEUqe
 pzdkKqRq59lEPbxKMqW0HaIDNLTDOdpWmUylGYQSgo2TD0WjyyRjlCKR7SVmSlY/rVdP
 ysnqvWVmqkYhCCsMCj+vsFPuCqa6Y9s+wQATDthE1VcbM7r2GLq0j5R/N+kfoEadNbFc
 fn8SdRqmEj/EeVvRFnZF9AVNDnnyRUD4XDc2kPrhQxRPJn878Cd85c8LddrtIAUSQq4u
 P/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9jh9aei13yBSS+RNXZRtXzAqAi8GuIqhLXMAutPl5gc=;
 b=cLdBKQNwnRQzT1sBuFZuRFp/Jd4BeN/2R8AnaO6S0n8ggSvNDcuzTNb9Et2E1L7x8X
 E6+1IjHdjcb+9hZcw27MKfSQ5EHyiomz415SOoeZBJGzhkLdece4LB1ZHnHFnaubXX+Q
 MdsxiX/tWR1CWP+vq5NGKioguUQF9H+yQvXlRBl3JcmhkMi8n/ArQpbk4ydmbZaWtJ9S
 9GkdKaIUmRTIIyFdDC75eCNUvY0vuJbzMmuVguX+6q6GdQ31KPqMpe4dXIeBUT1C3a86
 8Doq2aZjxPBSJN5PKsvnhMtJgdYB0dP2qfFgBwuhu7KeFYyBc3n9MTm+Sffb3liGFu/Z
 8ntA==
X-Gm-Message-State: AOAM532y8Q+UF/94QIh5Nz3q7TOv66NJs4a251rJPNhrtN557MzVskI4
 jLyJ2j5/E9pEZLzSoCEcVedEOXkH9/YuxYx7
X-Google-Smtp-Source: ABdhPJzIDj6qHSOJ0NeCUo2DAsr5QoMbT9HSk9kDUvi1YQt8ydBqE4kkPlZbzPq29MmZ656lkx27tA==
X-Received: by 2002:a05:600c:4f91:: with SMTP id
 n17mr6731277wmq.54.1630044728373; 
 Thu, 26 Aug 2021 23:12:08 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id k13sm4021606wms.33.2021.08.26.23.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:12:07 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: fix the bug of time out calculation(v3)
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Monk Liu
 <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <20419179-ee90-45aa-f4b8-b6bcb20a9c52@amd.com>
 <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8c675723-b272-3d81-06c2-fe574a1dff06@gmail.com>
Date: Fri, 27 Aug 2021 08:12:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cc01416c-c04e-a716-f617-71351c1ad06a@amd.com>
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

I don't think that this will be necessary nor desired.

See the job should be cleaned up as soon as possible after it is 
finished or otherwise we won't cancel the timeout quick enough either.

Christian.

Am 26.08.21 um 22:14 schrieb Andrey Grodzovsky:
> Attached quick patch for per job TTL calculation to make more precises 
> next timer expiration. It's on top of the patch in this thread. Let me 
> know if this makes sense.
>
> Andrey
>
> On 2021-08-26 10:03 a.m., Andrey Grodzovsky wrote:
>>
>> On 2021-08-26 12:55 a.m., Monk Liu wrote:
>>> issue:
>>> in cleanup_job the cancle_delayed_work will cancel a TO timer
>>> even the its corresponding job is still running.
>>>
>>> fix:
>>> do not cancel the timer in cleanup_job, instead do the cancelling
>>> only when the heading job is signaled, and if there is a "next" job
>>> we start_timeout again.
>>>
>>> v2:
>>> further cleanup the logic, and do the TDR timer cancelling if the 
>>> signaled job
>>> is the last one in its scheduler.
>>>
>>> v3:
>>> change the issue description
>>> remove the cancel_delayed_work in the begining of the cleanup_job
>>> recover the implement of drm_sched_job_begin.
>>>
>>> TODO:
>>> 1)introduce pause/resume scheduler in job_timeout to serial the 
>>> handling
>>> of scheduler and job_timeout.
>>> 2)drop the bad job's del and insert in scheduler due to above 
>>> serialization
>>> (no race issue anymore with the serialization)
>>>
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 25 ++++++++++---------------
>>>   1 file changed, 10 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index a2a9536..ecf8140 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -676,13 +676,7 @@ drm_sched_get_cleanup_job(struct 
>>> drm_gpu_scheduler *sched)
>>>   {
>>>       struct drm_sched_job *job, *next;
>>>   -    /*
>>> -     * Don't destroy jobs while the timeout worker is running OR 
>>> thread
>>> -     * is being parked and hence assumed to not touch pending_list
>>> -     */
>>> -    if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>> -        !cancel_delayed_work(&sched->work_tdr)) ||
>>> -        kthread_should_park())
>>> +    if (kthread_should_park())
>>>           return NULL;
>>
>>
>> I actually don't see why we need to keep the above,
>> on the other side (in drm_sched_stop) we won't touch the pending list
>> anyway until sched thread came to full stop (kthread_park). If you do 
>> see a reason why
>> this needed then a comment should be here i think.
>>
>> Andrey
>>
>>
>>> spin_lock(&sched->job_list_lock);
>>> @@ -693,17 +687,21 @@ drm_sched_get_cleanup_job(struct 
>>> drm_gpu_scheduler *sched)
>>>       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>>           /* remove job from pending_list */
>>>           list_del_init(&job->list);
>>> +
>>> +        /* cancel this job's TO timer */
>>> +        cancel_delayed_work(&sched->work_tdr);
>>>           /* make the scheduled timestamp more accurate */
>>>           next = list_first_entry_or_null(&sched->pending_list,
>>>                           typeof(*next), list);
>>> -        if (next)
>>> +
>>> +        if (next) {
>>>               next->s_fence->scheduled.timestamp =
>>>                   job->s_fence->finished.timestamp;
>>> -
>>> +            /* start TO timer for next job */
>>> +            drm_sched_start_timeout(sched);
>>> +        }
>>>       } else {
>>>           job = NULL;
>>> -        /* queue timeout for next job */
>>> -        drm_sched_start_timeout(sched);
>>>       }
>>>         spin_unlock(&sched->job_list_lock);
>>> @@ -791,11 +789,8 @@ static int drm_sched_main(void *param)
>>>                         (entity = drm_sched_select_entity(sched))) ||
>>>                        kthread_should_stop());
>>>   -        if (cleanup_job) {
>>> +        if (cleanup_job)
>>>               sched->ops->free_job(cleanup_job);
>>> -            /* queue timeout for next job */
>>> -            drm_sched_start_timeout(sched);
>>> -        }
>>>             if (!entity)
>>>               continue;

