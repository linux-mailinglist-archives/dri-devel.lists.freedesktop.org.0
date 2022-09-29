Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C580F5EF8C9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 17:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A4910E5ED;
	Thu, 29 Sep 2022 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5FA410E5ED
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 15:31:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04BED15BF;
 Thu, 29 Sep 2022 08:31:56 -0700 (PDT)
Received: from [10.1.38.20] (e122027.cambridge.arm.com [10.1.38.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72D873F792;
 Thu, 29 Sep 2022 08:31:46 -0700 (PDT)
Message-ID: <ccb55f39-2d7d-1e9d-91ac-70f609370e22@arm.com>
Date: Thu, 29 Sep 2022 16:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 5/6] drm/sched: Use parent fence instead of finished
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <20220914164321.2156-6-Arvind.Yadav@amd.com>
 <e613a225-dabf-7e87-2624-a3244df8a877@arm.com>
 <5beff5e2-8589-28cf-40b4-9e6b9e45b307@amd.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <5beff5e2-8589-28cf-40b4-9e6b9e45b307@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/09/2022 15:57, Christian König wrote:
> Am 29.09.22 um 16:53 schrieb Steven Price:
>> On 14/09/2022 17:43, Arvind Yadav wrote:
>>> Using the parent fence instead of the finished fence
>>> to get the job status. This change is to avoid GPU
>>> scheduler timeout error which can cause GPU reset.
>> I'm able to reproduce crashes on Panfrost and I believe this commit is
>> the cause. Specifically it's possible for job->s_fence->parent to be
>> NULL.
>>
>> The underlying issue seems to involve drm_sched_resubmit_jobs_ext() - if
>> the run_jobs() callback returns an error it will set s_fence->parent to
>> NULL after signalling s_fence->finished:
>>
>>>         fence = sched->ops->run_job(s_job);
>>>         i++;
>>>
>>>         if (IS_ERR_OR_NULL(fence)) {
>>>             if (IS_ERR(fence))
>>>                 dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
>>>
>>>             s_job->s_fence->parent = NULL;
>> I don't understand the reasoning behind this change, but it doesn't seem
>> right to be using the parent fence when we have code which can be
>> setting that pointer to NULL.
>>
>> Since I don't understand the reasoning my only suggestion is to revert
>> this patch (and potentially the dependent patch "dma-buf: Check status
>> of enable-signaling bit on debug"?).
>>
>> Can anyone suggest a better fix?
> 
> Well, first of all please absolutely don't use
> drm_sched_resubmit_jobs_ext()!

Panfrost isn't using drm_sched_resubmit_jobs_ext() directly but via
drm_sched_resubmit_jobs().

> It was an extremely bad idea in amdgpu to approach GPU by re-submitting
> jobs and it was an even worse idea to push this into the scheduler.
> 
> The design of dma_fence is that you submit that once and *only* once and
> then get a result for this submission. If re-submission is desirable it
> should be done in userspace or at least higher levels.

Panfrost has an interesting feature where it's possible to rescue a job
during a GPU reset. Because jobs are queued on the GPU if the job hasn't
actually started executing then it's quite possible to safely resubmit
it from the kernel driver and user space doesn't need to be involved.

The benefit of this is if another process has hung the GPU that
processes jobs can be killed off without affecting any other innocent
processes.

One option would be to hide all this from the scheduler, but I can't see
how to do that without also hiding the actual reset from the scheduler.
Admittedly at the moment Panfrost is far too aggressive at resetting and
will perform a GPU reset in conditions where it's completely
unnecessary. There's work to do there but I haven't had the time to look
at it yet.

> Apart from that, yes a NULL check is missing here but that should be
> trivial to fix.

What I'm struggling to get my head round is whether it's correct to
always treat the job as signalled just because s_fence->parent is NULL?

Thanks,

Steve

> Thanks,
> Christian.
> 
>>
>> Thanks,
>>
>> Steve
>>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>
>>> changes in v1,v2 - Enable signaling for finished fence in sche_main()
>>> is removed
>>>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index e0ab14e0fb6b..2ac28ad11432 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -829,7 +829,7 @@ drm_sched_get_cleanup_job(struct
>>> drm_gpu_scheduler *sched)
>>>       job = list_first_entry_or_null(&sched->pending_list,
>>>                          struct drm_sched_job, list);
>>>   -    if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>>> +    if (job && dma_fence_is_signaled(job->s_fence->parent)) {
>>>           /* remove job from pending_list */
>>>           list_del_init(&job->list);
>>>   @@ -841,7 +841,7 @@ drm_sched_get_cleanup_job(struct
>>> drm_gpu_scheduler *sched)
>>>             if (next) {
>>>               next->s_fence->scheduled.timestamp =
>>> -                job->s_fence->finished.timestamp;
>>> +                job->s_fence->parent->timestamp;
>>>               /* start TO timer for next job */
>>>               drm_sched_start_timeout(sched);
>>>           }
> 

