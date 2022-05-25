Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF2533A35
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 11:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94DB10F9F4;
	Wed, 25 May 2022 09:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424510F9C1;
 Wed, 25 May 2022 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653471994; x=1685007994;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nGymsr8SSj+sne0ImeoCBh2PzvGkNLmIxBxKIlbfpMo=;
 b=fjgC3T1eQ+yElOd1vWLWH9PJk85lbBkryQgHvAnqa1J2+JFIKaLWRPbl
 BcuSHe6JWf6lYEzUFR8nUHqZhAu1AmdbUrqnGqc0YD5iWn0DUy8qA1Rpe
 mGgRpqTVDUsnZYGCZa6s3KES8pOjYOx2/Jjt2yJA58fFy2kYazwhxoEek
 9U77kvjaCY/HI6i0m4JxyXjMp3MTKc9DKT+2PFLMbnb8y8UVdnzszdoDs
 A1y2vPCBdO62soGnPUJbqrwP7afnJSTJ79lxlNXZuQyxWj/NB1ZRDMipV
 VuUAanq3qRpcLU4Bhgn8h/Axr3W3WnAzEyBpkUCVYik8PetzTZAIod9zO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="360160826"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="360160826"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 02:46:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="676799098"
Received: from isobansk-mobl.ger.corp.intel.com (HELO [10.213.230.191])
 ([10.213.230.191])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 02:46:31 -0700
Message-ID: <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com>
Date: Wed, 25 May 2022 10:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/05/2022 15:50, Rob Clark wrote:
> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 23/05/2022 23:53, Rob Clark wrote:
>>> On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>>
>>>> Hi Rob,
>>>>
>>>> On 28/07/2021 02:06, Rob Clark wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> The drm/scheduler provides additional prioritization on top of that
>>>>> provided by however many number of ringbuffers (each with their own
>>>>> priority level) is supported on a given generation.  Expose the
>>>>> additional levels of priority to userspace and map the userspace
>>>>> priority back to ring (first level of priority) and schedular priority
>>>>> (additional priority levels within the ring).
>>>>>
>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
>>>>>     drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
>>>>>     drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++++++++++++++-
>>>>>     drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
>>>>>     include/uapi/drm/msm_drm.h              | 14 +++++-
>>>>>     5 files changed, 88 insertions(+), 27 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>> index bad4809b68ef..748665232d29 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>>>>>                         return ret;
>>>>>                 }
>>>>>                 return -EINVAL;
>>>>> -     case MSM_PARAM_NR_RINGS:
>>>>> -             *value = gpu->nr_rings;
>>>>> +     case MSM_PARAM_PRIORITIES:
>>>>> +             *value = gpu->nr_rings * NR_SCHED_PRIORITIES;
>>>>>                 return 0;
>>>>>         case MSM_PARAM_PP_PGTABLE:
>>>>>                 *value = 0;
>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>> index 450efe59abb5..c2ecec5b11c4 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>>>         submit->gpu = gpu;
>>>>>         submit->cmd = (void *)&submit->bos[nr_bos];
>>>>>         submit->queue = queue;
>>>>> -     submit->ring = gpu->rb[queue->prio];
>>>>> +     submit->ring = gpu->rb[queue->ring_nr];
>>>>>         submit->fault_dumped = false;
>>>>>
>>>>>         INIT_LIST_HEAD(&submit->node);
>>>>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>>>         /* Get a unique identifier for the submission for logging purposes */
>>>>>         submitid = atomic_inc_return(&ident) - 1;
>>>>>
>>>>> -     ring = gpu->rb[queue->prio];
>>>>> +     ring = gpu->rb[queue->ring_nr];
>>>>>         trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
>>>>>                 args->nr_bos, args->nr_cmds);
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>>>> index b912cacaecc0..0e4b45bff2e6 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
>>>>>         const char *name;
>>>>>     };
>>>>>
>>>>> +/*
>>>>> + * The number of priority levels provided by drm gpu scheduler.  The
>>>>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>>>>> + * cases, so we don't use it (no need for kernel generated jobs).
>>>>> + */
>>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
>>>>> +
>>>>> +/**
>>>>> + * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
>>>>> + *
>>>>> + * @gpu:        the gpu instance
>>>>> + * @prio:       the userspace priority level
>>>>> + * @ring_nr:    [out] the ringbuffer the userspace priority maps to
>>>>> + * @sched_prio: [out] the gpu scheduler priority level which the userspace
>>>>> + *              priority maps to
>>>>> + *
>>>>> + * With drm/scheduler providing it's own level of prioritization, our total
>>>>> + * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
>>>>> + * Each ring is associated with it's own scheduler instance.  However, our
>>>>> + * UABI is that lower numerical values are higher priority.  So mapping the
>>>>> + * single userspace priority level into ring_nr and sched_prio takes some
>>>>> + * care.  The userspace provided priority (when a submitqueue is created)
>>>>> + * is mapped to ring nr and scheduler priority as such:
>>>>> + *
>>>>> + *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
>>>>> + *   sched_prio = NR_SCHED_PRIORITIES -
>>>>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
>>>>> + *
>>>>> + * This allows generations without preemption (nr_rings==1) to have some
>>>>> + * amount of prioritization, and provides more priority levels for gens
>>>>> + * that do have preemption.
>>>>
>>>> I am exploring how different drivers handle priority levels and this
>>>> caught my eye.
>>>>
>>>> Is the implication of the last paragraphs that on hw with nr_rings > 1,
>>>> ring + 1 preempts ring?
>>>
>>> Other way around, at least from the uabi standpoint.  Ie. ring[0]
>>> preempts ring[1]
>>
>> Ah yes, I figure it out from the comments but then confused myself when
>> writing the email.
>>
>>>> If so I am wondering does the "spreading" of
>>>> user visible priorities by NR_SCHED_PRIORITIES creates a non-preemptable
>>>> levels within every "bucket" or how does that work?
>>>
>>> So, preemption is possible between any priority level before run_job()
>>> gets called, which writes the job into the ringbuffer.  After that
>>
>> Hmm how? Before run_job() the jobs are not runnable, sitting in the
>> scheduler queues, right?
> 
> I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A on
> prio[1] could be executed after submit B on prio[2] provided that
> run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
> preemption because the submit hasn't started running on the GPU yet.
> But rather just scheduling according to priority.
> 
>>> point, you only have "bucket" level preemption, because
>>> NR_SCHED_PRIORITIES levels of priority get mapped to a single FIFO
>>> ringbuffer.
>>
>> Right, and you have one GPU with four rings, which means you expose 12
>> priority levels to userspace, did I get that right?
> 
> Correct
> 
>> If so how do you convey in the ABI that not all there priority levels
>> are equal? Like userspace can submit at prio 4 and expect prio 3 to
>> preempt, as would prio 2 preempt prio 3. While actual behaviour will not
>> match - 3 will not preempt 4.
> 
> It isn't really exposed to userspace, but perhaps it should be..
> Userspace just knows that, to the extent possible, the kernel will try
> to execute prio 3 before prio 4.
> 
>> Also, does your userspace stack (EGL/Vulkan) use the priorities? I had a
>> quick peek in Mesa but did not spot it - although I am not really at
>> home there yet so maybe I missed it.
> 
> Yes, there is an EGL extension:
> 
> https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
> 
> It is pretty limited, it only exposes three priority levels.

Right, is that wired up on msm? And if it is, or could be, how do/would 
you map the three priority levels for GPUs which expose 3 priority 
levels versus the one which exposes 12?

Is it doable properly without leaking the fact drm/sched internal 
implementation detail of three priority levels? Or if you went the other 
way and only exposed up to max 3 levels, then you lose one priority 
level your hardware suppose which is also not good.

It is all quite interesting because your hardware is completely 
different from ours in this respect. In our case i915 decides when to 
preempt, hardware has no concept of priority (*).

Regards,

Tvrtko

(*) Almost no concept of priority in hardware - we do have it on new 
GPUs and only on a subset of engine classes where render and compute 
share the EUs. But I think it's way different from Ardenos.
