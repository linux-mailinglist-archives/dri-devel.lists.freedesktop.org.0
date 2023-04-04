Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE9E6D6A95
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 19:29:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C3F110E72F;
	Tue,  4 Apr 2023 17:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3898810E18E;
 Tue,  4 Apr 2023 17:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680629371; x=1712165371;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T0cevVuLoVLn1+gTkF2H91jFQEK+hDzMgLPtnUt2SGo=;
 b=fYDVa/NN5qmiI3SUK8UNkzUttvJATh9WQISzNmeiTPsj8sm51qK9zysY
 /aSOtTw/L71KfbSVEFUHtrRdWtUxP1LhJHFdid9O9ejlgafjw5LKKAYwr
 rAAW+jLAJCdcJOmqiuZYhJMLNBXXgZvbD9jSywr0jNIb+te9q7LIvyMh8
 54B+aZk4bIPfuRYxaWmSPSM16uhsPYm8dE5Q+pLLxH9scTV9T0l3VYF6O
 KnnwfXZZK2Ul2v7S/kZXcuzBr7vHDSkYeDBwEr1tZ+A46WjyHaKWjRdud
 ISkdvi8Xb62PcoQ7GIjHsMpj3Ph/LjqaZSiI6hn3zY5wB+5QpBCnPRDcB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="405022192"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="405022192"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 10:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="860669407"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; d="scan'208";a="860669407"
Received: from pcanders-mobl1.ger.corp.intel.com (HELO [10.213.217.134])
 ([10.213.217.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 10:29:27 -0700
Message-ID: <da288e41-6c5d-0595-e659-5746bfc0ee87@linux.intel.com>
Date: Tue, 4 Apr 2023 18:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
 <ZCwrgvAHGvdTCe7K@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZCwrgvAHGvdTCe7K@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/04/2023 14:52, Matthew Brost wrote:
> On Tue, Apr 04, 2023 at 10:43:03AM +0100, Tvrtko Ursulin wrote:
>>
>> On 04/04/2023 01:22, Matthew Brost wrote:
>>> Hello,
>>>
>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>> have been asked to merge our common DRM scheduler patches first as well
>>> as develop a common solution for long running workloads with the DRM
>>> scheduler. This RFC series is our first attempt at doing this. We
>>> welcome any and all feedback.
>>>
>>> This can we thought of as 4 parts detailed below.
>>>
>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>> entity (patches 1-3)
>>>
>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>> severals problems as the DRM was originally designed to schedule jobs on
>>> hardware queues. The main problem being that DRM scheduler expects the
>>> submission order of jobs to be the completion order of jobs even across
>>> multiple entities. This assumption falls apart with a firmware scheduler
>>> as a firmware scheduler has no concept of jobs and jobs can complete out
>>> of order. A novel solution for was originally thought of by Faith during
>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>> and entity. I believe the AGX driver [3] is using this approach and
>>> Boris may use approach as well for the Mali driver [4].
>>>
>>> To support a 1 to 1 relationship we move the main execution function
>>> from a kthread to a work queue and add a new scheduling mode which
>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>> relationship and can be thought of as using scheduler as a dependency /
>>> infligt job tracker rather than a true scheduler.
>>
>> Once you add capability for a more proper 1:1 via
>> DRM_SCHED_POLICY_SINGLE_ENTITY, do you still have further need to replace
>> kthreads with a wq?
>>
>> Or in other words, what purpose does the offloading of a job picking code to
>> a separate execution context serve? Could it be done directly in the 1:1
>> mode and leave kthread setup for N:M?
>>
> 
> Addressed the other two on my reply to Christian...
> 
> For this one basically the concept of a single entity point IMO is a
> very good concept which I'd like to keep. But most important reason
> being the main execution thread (now worker) is kicked when a dependency
> for a job is resolved, dependencies are dma-fences signaled via a
> callback, and these call backs can be signaled in IRQ contexts. We
> absolutely do not want to enter the backend in an IRQ context for a
> variety of reasons.

Sounds like a fair enough requirement but if drivers will not be 
comfortable with the wq conversion, it is probably possible to introduce 
some vfuncs for the 1:1 case which would allow scheduler users override 
the scheduler wakeup and select a special "pick one job" path. That 
could allow 1:1 users do their thing, leaving rest as is. I mean you 
already have the special single entity scheduler, you'd just need to add 
some more specialization on the init, wake up, etc paths.

And I will mention once more that I find a wq item with a loop such as:

	while (!READ_ONCE(sched->pause_run_wq)) {
	...

A bit dodgy. If you piggy back on any system_wq it smells of system wide 
starvation so for me any proposal with an option to use a system shared 
wq is a no go.

Regards,

Tvrtko


>> Apart from those design level questions, low level open IMO still is that
>> default fallback of using the system_wq has the potential to affect latency
>> for other drivers. But that's for those driver owners to approve.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> - Generic messaging interface for DRM scheduler
>>>
>>> Idea is to be able to communicate to the submission backend with in band
>>> (relative to main execution function) messages. Messages are backend
>>> defined and flexable enough for any use case. In Xe we use these
>>> messages to clean up entites, set properties for entites, and suspend /
>>> resume execution of an entity [5]. I suspect other driver can leverage
>>> this messaging concept too as it a convenient way to avoid races in the
>>> backend.
>>>
>>> - Support for using TDR for all error paths of a scheduler / entity
>>>
>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>
>>> - Annotate dma-fences for long running workloads.
>>>
>>> The idea here is to use dma-fences only as sync points within the
>>> scheduler and never export them for long running workloads. By
>>> annotating these fences as long running we ensure that these dma-fences
>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>> thus approach is the scheduler can still safely flow control the
>>> execution ring buffer via the job limit without breaking the dma-fence
>>> rules.
>>>
>>> Again this a first draft and looking forward to feedback.
>>>
>>> Enjoy - Matt
>>>
>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>> [2] https://patchwork.freedesktop.org/series/112188/
>>> [3] https://patchwork.freedesktop.org/series/114772/
>>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>
>>> Matthew Brost (8):
>>>     drm/sched: Convert drm scheduler to use a work queue rather than
>>>       kthread
>>>     drm/sched: Move schedule policy to scheduler / entity
>>>     drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>>     drm/sched: Add generic scheduler message interface
>>>     drm/sched: Start run wq before TDR in drm_sched_start
>>>     drm/sched: Submit job before starting TDR
>>>     drm/sched: Add helper to set TDR timeout
>>>     drm/syncobj: Warn on long running dma-fences
>>>
>>> Thomas Hellström (2):
>>>     dma-buf/dma-fence: Introduce long-running completion fences
>>>     drm/sched: Support long-running sched entities
>>>
>>>    drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>    drivers/dma-buf/dma-resv.c                  |   5 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>    drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>    drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>    drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>    drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>    drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>    drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>>>    drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>    include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>    include/linux/dma-fence.h                   |  60 ++++-
>>>    16 files changed, 649 insertions(+), 184 deletions(-)
>>>
