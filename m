Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6693AAF4EE
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 09:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CEA10E1E3;
	Thu,  8 May 2025 07:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mOtrNGm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591B010E1E3;
 Thu,  8 May 2025 07:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mamJr4x6xYUWZ33Aa+RwkqNXvXmrkbAZRU+bQhqbPzs=; b=mOtrNGm8+O5YeGNys6LnNoKWT8
 aElpKAkoTmkEWUPa+yCCCZmjMd/utMCoACHQZydfdMeyoYPCdgmQhUwptZ2bhHx8hy7N81X3W4Eav
 uz6MwFDznf60/jCY4YCB2ngeKfrNVN+I12N9xHygKZQy+XgRffyT4Hiv6vnlSJ/fii1jDrQ/gJKBC
 3KgUln0PJzi42qT+3XBh5TmvE2ja90qJuw5eoJKvH7ZSQ1kblTrXbAf2agKauVdQcMPaMHVg4cZBJ
 hBlteduxQRVygvryxzryi2FYTYpmg2EGMNRZL+lOe2hdgXs0Cf4b2i9SqrA9zNhMNs+urazjN/Fou
 9QooKf/Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCvs5-0055al-0F; Thu, 08 May 2025 09:44:56 +0200
Message-ID: <95c8c9f2-6106-4bfe-98af-94621c2f81de@igalia.com>
Date: Thu, 8 May 2025 08:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v7 00/23] DRM scheduling cgroup controller
To: Matthew Brost <matthew.brost@intel.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Leo Liu <Leo.Liu@amd.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Rob Clark <robdclark@gmail.com>, Tejun Heo <tj@kernel.org>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
 <aBxPReU5lHjx2w6n@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aBxPReU5lHjx2w6n@lstrano-desk.jf.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/05/2025 07:29, Matthew Brost wrote:
> On Fri, May 02, 2025 at 01:32:33PM +0100, Tvrtko Ursulin wrote:
>> Hi all,
>>
>> This is another respin of this old work^1 but this version is a total rewrite
>> and completely changes how the control is done.
>>
>> This time round the work builds upon the "fair" DRM scheduler work I have posted
>> recently^2. I am including those patches for completeness and because there were
>> some tweaks there.
>>
>> -> It also means people only interested into the cgroup portion probably only
>>     need to look at the last seven patches.
>>
>>     And of those seven the last one is an example how a DRM scheduler based DRM
>>     driver can be wired up with the cgroup controller. So it is quite simple.
>>
>> To illustrate the runtime effects I ran the Unigine Heaven benchmark in
>> parallel with the deferredmultisampling Vulkan demo, each in its own cgroup.
>> First the scheduling weights were the default 100 and 100 respectively, and we
>> look at the GPU utilisation:
>>
>>    https://people.igalia.com/tursulin/drmcgroup-100-100.png
>>
>> It is about equal or therabout since it oscillates at runtime as the benchmark
>> scenes change.
>>
>> Then we change drm.weight of the deferredmultisampling cgroup to 1:
>>
>>    https://people.igalia.com/tursulin/drmcgroup-100-1.png
>>
>> There we see around 75:25 in favour of Unigine Heaven. (Although it also
>> oscillates as explained above).
>>
>> Important to note is that with GPUs the control is still not nowhere as precise
>> and accurate as with the CPU controller and that the fair scheduler is work in
>> progress. But it works and looks useful.
>>
>> Going into the implementation, in this version it is much simpler than before
>> since the mechanism of time budgets and over-budget singalling is completely
>> gone and replaced with notifying clients directly about their assigned relative
>> scheduling weights.
>>
>> This connects really nicely with the fair DRM scheduler RFC since we can simply
>> mix in the scheduling weight with the existing scheduling entity priority based
>> runtime to vruntime scaling factors.
>>
>> It also means there is much less code in the controller itself.
>>
>> Another advantage is that it is really easy to wire up individual drivers which
>> use the DRM scheduler in the hardware scheduling mode (ie. not 1:1 firmware
>> scheduling).
>>
> 
> Admittedly, I just scanned the series—so it might be easier for you to
> elaborate on the above point.
> 
> With hardware scheduling mode, the DRM scheduler is essentially just a
> dependency tracker that hands off scheduling to the hardware. Are you
> suggesting that this series doesn't affect that mode, or does it have
> some impact on hardware scheduling (e.g., holding back jobs with
> resolved dependencies in the KMD)?

No effect on 1:1 drivers.

(Ignoring some perhaps minor effects from "drm/sched: Queue all free 
credits in one worker invocation", or micro effects from removing the 
run-queues.)

> Follow-up question: aren't most modern drivers and hardware trending
> toward hardware scheduling mode? If so, what is the motivation for
> making such large changes?

If you are asking for the "fair" scheduler itself, that is covered in 
the cover letter for the respective series (benchmark data included). 
Goal is to simplify the code base and make it schedule at least as good 
if not better for all the drivers which are not 1:1.

If you are asking about the cgroup controller (this combined series), 
the motivation is in the previous cover letter linked from this one. 
There is currently no way to externally control DRM scheduling 
priorities and there are use cases to enable it. For example run 
something computational in the background and have it compete less for 
the GPU with the foreground tasks. Or wire with the window manager 
focused/unfocused window handling to automatically prioritise foreground 
tasks via cgroups.

The latter concept was also discussed in the scope of the dmem cgroup 
controller for providing some degree of eviction "protection" to the 
foreground task. So it all fits nicely into those sort of usage models.

1:1 drivers can still hook into this (as they were able throughout the 
life of this RFC). How exactly it would be up to individual firmwares. 
This RFC would notify the driver "this client has this relative 
scheduling weight" and from there it's up to the driver. Ie. those 
drivers wouldn't use the drm_sched_cgroup_notify_weight() helper when 
registering with DRM cgroup controller (which this series provides), but 
would have to come up with their own.

Regards,

Tvrtko

>> On the userspace interface side of things it is the same as before. We have
>> drm.weight as an interface, taking integers from 1 to 10000, the same as CPU and
>> IO cgroup controllers.
>>
>> About the use cases, it is the same as before. With this we would be able to run
>> a workload in the background and make it compete less with the foreground load.
>> Be it explicitly or when integrating with Desktop Environments some of which
>> already have cgroup support for tracking foreground vs background windows or
>> similar.
>>
>> I would be really interested if people would attempt to try this out, either
>> directly the amdgpu support as provided in the series, or by wiring up other
>> drivers.
>>
>> P.S.
>> About the CC list. It's a large series so I will put most people on Cc only in
>> the cover letter as a ping of a sort. Whoever is interested can for now find the
>> series in the archives.
>>
>> 1)
>> https://lore.kernel.org/dri-devel/20231024160727.282960-1-tvrtko.ursulin@linux.intel.com/
>>
>> 2)
>> https://lore.kernel.org/dri-devel/20250425102034.85133-1-tvrtko.ursulin@igalia.com/
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> CC: Leo Liu <Leo.Liu@amd.com>
>> Cc: Maíra Canal <mcanal@igalia.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Koutný <mkoutny@suse.com>
>> Cc: Michel Dänzer <michel.daenzer@mailbox.org>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Tejun Heo <tj@kernel.org>
>>
>> Tvrtko Ursulin (23):
>>    drm/sched: Add some scheduling quality unit tests
>>    drm/sched: Add some more scheduling quality unit tests
>>    drm/sched: De-clutter drm_sched_init
>>    drm/sched: Avoid double re-lock on the job free path
>>    drm/sched: Consolidate drm_sched_job_timedout
>>    drm/sched: Consolidate drm_sched_rq_select_entity_rr
>>    drm/sched: Implement RR via FIFO
>>    drm/sched: Consolidate entity run queue management
>>    drm/sched: Move run queue related code into a separate file
>>    drm/sched: Free all finished jobs at once
>>    drm/sched: Account entity GPU time
>>    drm/sched: Remove idle entity from tree
>>    drm/sched: Add fair scheduling policy
>>    drm/sched: Remove FIFO and RR and simplify to a single run queue
>>    drm/sched: Queue all free credits in one worker invocation
>>    drm/sched: Embed run queue singleton into the scheduler
>>    cgroup: Add the DRM cgroup controller
>>    cgroup/drm: Track DRM clients per cgroup
>>    cgroup/drm: Add scheduling weight callback
>>    cgroup/drm: Introduce weight based scheduling control
>>    drm/sched: Add helper for tracking entities per client
>>    drm/sched: Add helper for DRM cgroup controller weight notifications
>>    drm/amdgpu: Register with the DRM scheduling cgroup controller
>>
>>   Documentation/admin-guide/cgroup-v2.rst       |  22 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  13 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |   1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   9 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
>>   drivers/gpu/drm/drm_file.c                    |  11 +
>>   drivers/gpu/drm/scheduler/Makefile            |   2 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c      | 158 ++--
>>   drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>>   drivers/gpu/drm/scheduler/sched_internal.h    | 126 ++-
>>   drivers/gpu/drm/scheduler/sched_main.c        | 570 +++---------
>>   drivers/gpu/drm/scheduler/sched_rq.c          | 214 +++++
>>   drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
>>   .../gpu/drm/scheduler/tests/tests_scheduler.c | 815 ++++++++++++++++++
>>   include/drm/drm_drv.h                         |  26 +
>>   include/drm/drm_file.h                        |  11 +
>>   include/drm/gpu_scheduler.h                   |  68 +-
>>   include/linux/cgroup_drm.h                    |  29 +
>>   include/linux/cgroup_subsys.h                 |   4 +
>>   init/Kconfig                                  |   5 +
>>   kernel/cgroup/Makefile                        |   1 +
>>   kernel/cgroup/drm.c                           | 446 ++++++++++
>>   27 files changed, 2024 insertions(+), 574 deletions(-)
>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>>   create mode 100644 include/linux/cgroup_drm.h
>>   create mode 100644 kernel/cgroup/drm.c
>>
>> -- 
>> 2.48.0
>>

