Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2F78BC5D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 03:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3038810E0DD;
	Tue, 29 Aug 2023 01:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCA210E2C9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693272043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxhVIhrfzzCN5tfByAy0BZtSYrapryIHOGLgCPrh8zI=;
 b=S2ZXbK+ooplGk+nSVy8fjPDhnGDg/vjvkPuF6R3BNGwm/2Z/Bw4EhOj8XILCQc+oTSN/tJ
 FMIEjvCGId6DvRmvSOxScWaRxVuV8nSsne5iO2pwlPRtkctQ5zvZWJgO/IlKKhEad8Yy0U
 bkiC27cMuK2c56QnG9jPelE3uGGpJxA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-6RKVd3ZaOruWaZ6WukKxpA-1; Mon, 28 Aug 2023 21:20:41 -0400
X-MC-Unique: 6RKVd3ZaOruWaZ6WukKxpA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-500b575b32aso2052405e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 18:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693272040; x=1693876840;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JxhVIhrfzzCN5tfByAy0BZtSYrapryIHOGLgCPrh8zI=;
 b=UCEoSDEcbKWsl+Y8sch2/0XHdQAbTDJwGQP5eF7HLCV6/Xvk/uzRjOSMWycgs9S6hf
 HCD2hxzBbDuu6Ec7sWfqQY4kxc84zAqdGm8gg5lXQu5lTGVp3rPQ3ZcCX6GwTKB9BQK7
 lSlp+bnD6hk1IvhYzr4haOGB6bLiq7h1Yzr3vnLVgn0M19wsGdilOv3aWOMS8F8HzyWY
 PQ5o2YNoerAcc52YAx+QHUE7T3NkNVYyXTt/g1dqUqR19UTiF5IGMUfArXveTxitBJrS
 6atDUT1meJjH22sPr5e1SDxSROTYMjb/VkRRvD/mGRCa1bFVN/WNi8VMtSJD/P/ps0+A
 Hk4w==
X-Gm-Message-State: AOJu0YwGQzismNvs7HV4p8SUlWfZhTM5/WYXuqz7lq4b0O8iYabvPbD4
 rLsfT5Y0vUfAu2NPI3j+o6TH/mInfGn/PCM+a/bRXOTtl4fC8dzSyATWPFkwcBt+EHWUxneqavs
 3/WSyf/w2mbrufVFmJ3bXwOAFREbZ
X-Received: by 2002:ac2:562f:0:b0:4f9:5519:78b8 with SMTP id
 b15-20020ac2562f000000b004f9551978b8mr16155472lff.63.1693272039846; 
 Mon, 28 Aug 2023 18:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN5OOFFzVHea4mzP9EGBMjC276p5Tl/QTjRKvdJf/AjW490tpIMzq9zGF96d4RWaEAD0duXw==
X-Received: by 2002:ac2:562f:0:b0:4f9:5519:78b8 with SMTP id
 b15-20020ac2562f000000b004f9551978b8mr16155454lff.63.1693272039446; 
 Mon, 28 Aug 2023 18:20:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e10-20020aa7d7ca000000b005256994e335sm5056892eds.92.2023.08.28.18.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 18:20:39 -0700 (PDT)
Message-ID: <fe3e6d7b-8915-e6c5-43db-ddb778bfea9c@redhat.com>
Date: Tue, 29 Aug 2023 03:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <bbb7fe74-bc75-8fc0-0a33-88ff86b81e00@redhat.com>
 <ZOzqUtgXj0J4muYQ@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZOzqUtgXj0J4muYQ@DUT025-TGLU.fm.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/23 20:41, Matthew Brost wrote:
> On Mon, Aug 28, 2023 at 08:04:31PM +0200, Danilo Krummrich wrote:
>> On 8/11/23 04:31, Matthew Brost wrote:
>>> Rather than call free_job and run_job in same work item have a dedicated
>>> work item for each. This aligns with the design and intended use of work
>>> queues.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 137 ++++++++++++++++++-------
>>>    include/drm/gpu_scheduler.h            |   8 +-
>>>    2 files changed, 106 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index cede47afc800..b67469eac179 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1275,7 +1338,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
>>>    void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
>>
>> I was wondering what the scheduler teardown sequence looks like for
>> DRM_SCHED_POLICY_SINGLE_ENTITY and how XE does that.
>>
>> In Nouveau, userspace can ask the kernel to create a channel (or multiple),
>> where each channel represents a ring feeding the firmware scheduler. Userspace
>> can forcefully close channels via either a dedicated IOCTL or by just closing
>> the FD which subsequently closes all channels opened through this FD.
>>
>> When this happens the scheduler needs to be teared down. Without keeping track of
>> things in a driver specific way, the only thing I could really come up with is the
>> following.
>>
>> /* Make sure no more jobs are fetched from the entity. */
>> drm_sched_submit_stop();
>>
>> /* Wait for the channel to be idle, namely jobs in flight to complete. */
>> nouveau_channel_idle();
>>
>> /* Stop the scheduler to free jobs from the pending_list. Ring must be idle at this
>>   * point, otherwise me might leak jobs. Feels more like a workaround to free
>>   * finished jobs.
>>   */
>> drm_sched_stop();
>>
>> /* Free jobs from the entity queue. */
>> drm_sched_entity_fini();
>>
>> /* Probably not even needed in this case. */
>> drm_sched_fini();
>>
>> This doesn't look very straightforward though. I wonder if other drivers feeding
>> firmware schedulers have similar cases. Maybe something like drm_sched_teardown(),
>> which would stop job submission, wait for pending jobs to finish and subsequently
>> free them up would makes sense?
>>
> 
> exec queue == gpu scheduler + entity in Xe
> 
> We kinda invented our own flow with reference counting + use the TDR for
> cleanup.

Thanks for the detailed explanation. In case of making it driver specific
I thought about something similar, pretty much the same reference counting,
but instead of the TDR, let jobs from the entity just return -ECANCELED from
job_run() and also signal pending jobs with the same error code.

On the other hand, I don't really want scheduler and job structures to
potentially outlive the channel. Which is where I think I'd be nice to avoid
consuming all the queued up jobs from the entity in the first place, stop the
schdeduler with drm_sched_submit_stop(), signal all pending_jobs with
-ECANCELED and call the free_job() callbacks right away.

The latter I could probably do in Nouveau as well, however, it kinda feels
wrong to do all that within the driver.

Also, I was wondering how existing drivers using the GPU scheduler handle
that. It seems like they just rely on the pending_list of the scheduler being
empty once drm_sched_fini() is called. Admittedly, that's pretty likely (never
to happen) since it's typically called on driver remove, but I don't see how
that's actually ensured. Am I missing something?
> 
> We have a creation ref for the exec queue plus each job takes a ref to
> the exec queue. On exec queue close [1][2] (whether that be IOCTL or FD
> close) we drop the creation reference and call a vfunc for killing thr
> exec queue. The firmware implementation is here [3].
> 
> If you read through it just sets the TDR to the minimum value [4], the
> TDR will kick any running jobs the off the hardware, signals the jobs
> fences, any jobs waiting on dependencies eventually flush out via
> run_job + TDR for cleanup without going on the hardware, the exec queue
> reference count goes to zero once all jobs are flushed out, we trigger
> the exec queue clean up flow and finally free all memory for the exec
> queue.
> 
> Using the TDR in this way is how we teardown an exec queue for other
> reasons too (user page fault, user job times out, user job hang detected
> by firmware, device reset, etc...).
> 
> This all works rather nicely and is a single code path for all of these
> cases. I'm no sure if this can be made any more generic nor do I really
> see the need too (at least I don't see Xe needing a generic solution).
> 
> Hope this helps,
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_exec_queue.c#L911
> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_device.c#L77
> [3] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next/drivers/gpu/drm/xe#L1184
> [4] https://gitlab.freedesktop.org/drm/xe/kernel/-/tree/drm-xe-next/drivers/gpu/drm/xe#L789
> 
>> - Danilo
>>

