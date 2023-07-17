Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7A4756FFB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A741710E07C;
	Mon, 17 Jul 2023 22:45:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C503C10E07C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 22:45:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: lina@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 36C474248B;
 Mon, 17 Jul 2023 22:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1689633931;
 bh=cFcJjQIV42C+z+n9/7F0zifjtePcKTUMN6UJ4kfxt/U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RKu7/tu9M8MvBnQjKMUMytcMOB/zh4NtqzmYNdxo/kcvwVB8j/CjLzUFR+1McxWe7
 +7q4xeJFP4H8Q3QZNNVPbZ63VzZal8n+4/eIB+bFmcqSm95l6O8JKvS1sqoCsnIQay
 zoa3UgB6UMmMrIqvqgahjZHtWXPyIMdbYGebvWnZvOHxSPiJH2kTmmnLojV+5kJvVH
 Jc3W/CUUZKWd7qviSBtoZ4Sg6xo2WQSguCve1vrN+4lXN4XDSwYFir0Dt77WAfV+Is
 HBLI1+KM+4VRCtZ67Xa6ePYgHHc1m8jpKT14biuRR6utv0h4DsdlcxGiXU7nqd0JAN
 6HYKya0/KM1sA==
Message-ID: <4587c699-5a59-d465-01f4-1bc2fbef7a12@asahilina.net>
Date: Tue, 18 Jul 2023 07:45:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] drm/scheduler: Clean up jobs when the scheduler is
 torn down.
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-3-c567249709f7@asahilina.net>
 <9343165f-2533-f363-4942-719ee9b7d2a4@amd.com>
 <99f9003f-d959-fff3-361a-25b2f47efc88@asahilina.net>
 <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <49a33f61-91b5-22ee-78b5-c7dd7c0d4a46@amd.com>
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
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 02.40, Luben Tuikov wrote:
> On 2023-07-16 03:51, Asahi Lina wrote:
>> On 15/07/2023 16.14, Luben Tuikov wrote:
>>> On 2023-07-14 04:21, Asahi Lina wrote:
>>>> drm_sched_fini() currently leaves any pending jobs dangling, which
>>>> causes segfaults and other badness when job completion fences are
>>>> signaled after the scheduler is torn down.
>>>
>>> If there are pending jobs, ideally we want to call into the driver,
>>> so that it can release resources it may be holding for those.
>>> The idea behind "pending" is that they are pending in the hardware
>>> and we don't know their state until signalled/the callback called.
>>> (Or unless the device is reset and we get a notification of that fact.)
>>
>> That's what the job->free_job() callback does, then the driver is free
>> to do whatever it wants with those jobs. A driver could opt to
>> synchronously kill those jobs (if it can) or account for them
>> separately/asynchronously.
>>
>> What this patch basically says is that if you destroy a scheduler with
>> pending jobs, it immediately considers them terminated with an error,
>> and returns ownership back to the driver for freeing. Then the driver
>> can decide how to handle the rest and whatever the underlying hardware
>> state is.
>>
>>>> Explicitly detach all jobs from their completion callbacks and free
>>>> them. This makes it possible to write a sensible safe abstraction for
>>>> drm_sched, without having to externally duplicate the tracking of
>>>> in-flight jobs.
>>>>
>>>> This shouldn't regress any existing drivers, since calling
>>>> drm_sched_fini() with any pending jobs is broken and this change should
>>>> be a no-op if there are no pending jobs.
>>>
>>> While this statement is true on its own, it kind of contradicts
>>> the premise of the first paragraph.
>>
>> I mean right *now* it's broken, before this patch. I'm trying to make it
>> safe, but it shouldn't regress any exiting drivers since if they trigger
>> this code path they are broken today.
> 
> Not sure about other drivers--they can speak for themselves and the CC list
> should include them--please use "dim add-missing-cc" and make sure
> that the Git commit description contains the Cc tags--then git send-email
> will populate the SMTP CC. Feel free to add more Cc tags on top of that.

I use `b4 prep -c` which I think does the same thing? I just ran it 
again and it only added 'linaro-mm-sig@lists.linaro.org', not sure why 
that one wasn't there. Am I missing anything else?

>>
>>>
>>>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++++++++++++++++++--
>>>>    1 file changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 1f3bc3606239..a4da4aac0efd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -1186,10 +1186,38 @@ EXPORT_SYMBOL(drm_sched_init);
>>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>>    {
>>>>    	struct drm_sched_entity *s_entity;
>>>> +	struct drm_sched_job *s_job, *tmp;
>>>>    	int i;
>>>>    
>>>> -	if (sched->thread)
>>>> -		kthread_stop(sched->thread);
>>>> +	if (!sched->thread)
>>>> +		return;
>>>> +
>>>> +	/*
>>>> +	 * Stop the scheduler, detaching all jobs from their hardware callbacks
>>>> +	 * and cleaning up complete jobs.
>>>> +	 */
>>>> +	drm_sched_stop(sched, NULL);
>>>> +
>>>> +	/*
>>>> +	 * Iterate through the pending job list and free all jobs.
>>>> +	 * This assumes the driver has either guaranteed jobs are already stopped, or that
>>>> +	 * otherwise it is responsible for keeping any necessary data structures for
>>>> +	 * in-progress jobs alive even when the free_job() callback is called early (e.g. by
>>>> +	 * putting them in its own queue or doing its own refcounting).
>>>> +	 */
>>>> +	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>>>> +		spin_lock(&sched->job_list_lock);
>>>> +		list_del_init(&s_job->list);
>>>> +		spin_unlock(&sched->job_list_lock);
>>>> +
>>>> +		dma_fence_set_error(&s_job->s_fence->finished, -ESRCH);
>>>> +		drm_sched_fence_finished(s_job->s_fence);
>>>
>>> I'd imagine it's better to rebase this on top of drm-misc-next where
>>> drm_sched_fence_finished() takes one more parameter--the error.
>>
>> Ah, sure! I can do that.
> 
> It's worth posting it as a stand-alone patch. Please make sure to add Cc tags
> into the commit description--use "dim add-missing-cc", perhaps also
> git-blame and git-log might help with additional Cc. "scripts/get_maintainer.pl"
> for files unaffected by this commit. (dim add-missing-cc uses get_maintainer.pl
> for affected files.)
> 
> Feel free to post it stand-alone and we'll let the natural review process take over. :-)

I already posted this one as part of the bindings RFC and the other one 
stand-alone, and they got NAKed by Christian, that's why it's a specific 
series for sched now with the docs, per Daniel's suggestion... now 
you're saying I should post them stand-alone again... ?

>>
>>>
>>>> +
>>>> +		WARN_ON(s_job->s_fence->parent);
>>>> +		sched->ops->free_job(s_job);
>>>> +	}
>>>> +
>>>> +	kthread_stop(sched->thread);
>>>>    
>>>>    	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>>>    		struct drm_sched_rq *rq = &sched->sched_rq[i];
>>>>
>>>
>>> Conceptually I don't mind this patch--I see what it is trying to achieve,
>>> but technically, we want the driver to detect GPU removal and return shared
>>> resources back, such as "jobs", which DRM is also aware of.
>>
>> I think you missed the context of why I'm doing this, so in short: my
> 
> As a general rule of thumb, in my writing emails I try to avoid using
> "you" and "I" as much as possible--it sets this divisive stage, and it
> can get misrepresented, especially in email.
> 
> As is the case in research literature, if I absolutely have to use a pronoun--which
> rarely happens, I always use "we", and this is the most number of "I"-s I've used
> in a long while.
> 
>> use case (like Xe's) involves using a separate drm_sched instance *per
>> file* since these queues are scheduled directly by the firmware. So this
>> isn't about GPU removal, but rather about a GPU context going away while
>> jobs are in flight (e.g. the process got killed). We want that to
>> quickly kill the "DRM view" of the world, including signaling all the
>> fences with an error and freeing resources like the scheduler itself.
>>
>> In the case of this particular GPU, there is no known way to actively
>> and synchronously abort GPU jobs, so we need to let them run to
>> completion (or failure), but we don't want that to block process cleanup
>> and freeing a bunch of high-level resources. The driver is architected
>> roughly along the lines of a firmware abstraction layer that maps to the
>> firmware shared memory structures, and then a layer on top that
>> implements the DRM view. When a process gets killed, the DRM side (which
>> includes the scheduler, etc.) gets torn down immediately, and it makes
>> sense to handle this cleanup inside drm_sched since it already has a
>> view into what jobs are in flight. Otherwise, I would have to duplicate
>> job tracking in the driver (actually worse: in the Rust abstraction for
>> safety), which doesn't make much sense.
>>
>> But what I *do* have in the driver is tracking of the firmware
>> structures. So when the drm_sched gets torn down and all the jobs
>> killed, the underlying firmware jobs do run to completion, and the
>> resources they use are all cleaned up after that (it's all reference
>> counted).
> 
> The ref-count definitely helps here.
> 
>> The primitive involved here is that in-flight firmware jobs
>> are assigned an event completion slot, and that keeps a reference to
>> them from a global array until the events fire and all the jobs are
>> known to have completed. This keeps things memory-safe, since we
>> absolutely cannot free/destroy firmware structures while they are in use
>> (otherwise the firmware crashes, which is fatal on these GPUs - requires
>> a full system reboot to recover).
>>
>> In practice, with the VM map model that we use, what ends up happening
>> when a process gets killed is that all the user objects for in-flight
>> jobs get unmapped, which usually causes the GPU hardware (not firmware)
>> to fault. This then triggers early termination of jobs anyway via the
>> firmware fault recovery flow. But even that takes some short amount of
>> time, and by then all the drm_sched stuff is long gone and we're just
>> dealing with the in-flight firmware stuff.
>>
>>> In the case where we're initiating the tear, we should notify the driver that
>>> we're about to forget jobs (resources), so that it knows to return them back
>>> or that it shouldn't notify us for them (since we've notified we're forgetting them.)
>>
>> That contradicts Christian's comment. I tried to document that (after
>> this patch) the scheduler no longer cares about hw fences and whether
>> they are signaled or not after it's destroyed, and I got a strongly
>> worded NAK for it. Sooo... which is it? Is it okay for drivers not to
>> signal the hw fence after a scheduler teardown, or not?
> 
> Christian is correct in that we don't want to hang upstream control
> to the whims of a low-level device driver.
> 
>> But really, I don't see a use case for an explicit "about to forget job"
>> callback. The job free callback already serves the purpose of telling
> 
> Long time ago, in a galaxy far far away, this was needed in order
> to prevent device write-DMA into non-existing (random) memory. As
> this is not the case anymore, go with Christian's comment.
> 
>> the driver to clean up resources associated with a job. If it wants to
>> synchronously abort things there, it could easily take over its own
>> fence signaling and do something with the underlying stuff if the fence
>> is not signaled yet.
>>
>> In my case, since the driver is written in Rust and free_job() just maps
>> to the destructor (Drop impl), that just ends up freeing a bunch of
>> memory and other objects, and I don't particularly care about the state
>> of the firmware side any more after that. The flow is the same whether
>> it was a successful job completion, a failure, or an early destruction
>> due to the drm_sched getting torn down.
>>
>>> (Note also that in this latter case, traditionally, the device would be reset,
>>> so that we can guarantee that it has forgotten all shared resources which
>>> we are to tear up. This is somewhat more complicated with GPUs, thus the method
>>> pointed out above.)
>>
>> Yeah, in the firmware scheduling case we can't do this at all unless the
>> firmware has an explicit teardown/forget op (which I'm not aware of) and
>> a full GPU reset isn't something we can do either. Hence we just let the
>> underlying jobs complete. In practice they tend to die pretty quickly
>> anyway once all the buffers are unmapped.
> 
> Perhaps in the future, as more complex workloads are deferred to this
> hardware and driver, a real-time requirement might be needed for this
> "tend to die pretty quickly", that that there's some guarantee of
> work resuming in some finite time.

That's not something we can control. This hardware is reverse-engineered 
and we don't get to write the firmware (it's signed). Maybe there is a 
job cancel op, and maybe we'll find it some day, or maybe not. I've 
certainly never seen macOS do anything like that, including in very 
blatant cases like a 30-second compute job. On macOS it kept running to 
completion even after I killed the process. We can't make the 
hardware/firmware do something it can't do.

At least there's firmware preemption though, so a rogue long-running job 
shouldn't block everything else.

~~ Lina

