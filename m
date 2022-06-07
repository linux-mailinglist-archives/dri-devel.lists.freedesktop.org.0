Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0147153FF30
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61210E82E;
	Tue,  7 Jun 2022 12:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F7410E396;
 Tue,  7 Jun 2022 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654605822; x=1686141822;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5tsrrsj0QT9Xru7AzFXlHA5L6Suua65/OotN/ckwQyQ=;
 b=CAkVRLYDOZIrsnNh1pFOvW9pJ2/dYRhLTZu9w5yUDTwGlgNhL/NynaoJ
 Ru0Bd5Ks5LvnL45lX6zjuTh9nCf4uHHOVpkySW+rjYRG9pID85szNqgNU
 htpHfS+FGeIJBDtOtPPprXQ6cOe5OvuTVDD+6ayNQ4EEP0ftIjiLsTtlM
 BntisWTaALigBGdp4i9HPunsU7CEYNbXi4priQLmf0yZXDLtg796iN8tp
 lukEKRK0578MSp2Z7SXjp/0lx8hChdBM4gCWRCwLv/lQaQhepGTazGDqX
 XsfwE1tJ7RLjVA1IMCK4FZ7oPfuj/be+GOQN/e1XDCnIznAm9NGPlRr+C g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="363062966"
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="363062966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 05:43:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; d="scan'208";a="636109796"
Received: from bdgardin-mobl1.ger.corp.intel.com (HELO [10.213.217.225])
 ([10.213.217.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2022 05:43:38 -0700
Message-ID: <8ba6957f-d69e-abf1-c6c8-15549ffb9e1c@linux.intel.com>
Date: Tue, 7 Jun 2022 13:43:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Freedreno] [PATCH v4 12/13] drm/msm: Utilize gpu scheduler
 priorities
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
 <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com>
 <CAF6AEGs_+mhY9x1HG=jHmpwGU6jUS1G4mF6bJCd3yN0JRhocsQ@mail.gmail.com>
 <046f2d0f-5e61-7d24-1b40-006f2377c974@linux.intel.com>
 <CAF6AEGtcZ=rcVeFCRdj2gF0=4OV0B4EJ51FuZY0sge3EEgSgzg@mail.gmail.com>
 <423c1077-191d-000c-2f3b-f60277a8f3f1@linux.intel.com>
 <CAF6AEGt7qY1UL65AAntoc1eUQYGH_w5fVLR0xP-aU6T6mj614g@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGt7qY1UL65AAntoc1eUQYGH_w5fVLR0xP-aU6T6mj614g@mail.gmail.com>
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
 freedreno <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/05/2022 05:25, Rob Clark wrote:
> On Thu, May 26, 2022 at 4:38 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>> On 26/05/2022 04:37, Rob Clark wrote:
>>> On Wed, May 25, 2022 at 9:22 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 25/05/2022 14:41, Rob Clark wrote:
>>>>> On Wed, May 25, 2022 at 2:46 AM Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 24/05/2022 15:50, Rob Clark wrote:
>>>>>>> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 23/05/2022 23:53, Rob Clark wrote:
>>>>>>>>> On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
>>>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Hi Rob,
>>>>>>>>>>
>>>>>>>>>> On 28/07/2021 02:06, Rob Clark wrote:
>>>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>>
>>>>>>>>>>> The drm/scheduler provides additional prioritization on top of that
>>>>>>>>>>> provided by however many number of ringbuffers (each with their own
>>>>>>>>>>> priority level) is supported on a given generation.  Expose the
>>>>>>>>>>> additional levels of priority to userspace and map the userspace
>>>>>>>>>>> priority back to ring (first level of priority) and schedular priority
>>>>>>>>>>> (additional priority levels within the ring).
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>        drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
>>>>>>>>>>>        drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
>>>>>>>>>>>        drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++++++++++++++-
>>>>>>>>>>>        drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
>>>>>>>>>>>        include/uapi/drm/msm_drm.h              | 14 +++++-
>>>>>>>>>>>        5 files changed, 88 insertions(+), 27 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>>>> index bad4809b68ef..748665232d29 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>>>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>>>>>>>>>>>                            return ret;
>>>>>>>>>>>                    }
>>>>>>>>>>>                    return -EINVAL;
>>>>>>>>>>> -     case MSM_PARAM_NR_RINGS:
>>>>>>>>>>> -             *value = gpu->nr_rings;
>>>>>>>>>>> +     case MSM_PARAM_PRIORITIES:
>>>>>>>>>>> +             *value = gpu->nr_rings * NR_SCHED_PRIORITIES;
>>>>>>>>>>>                    return 0;
>>>>>>>>>>>            case MSM_PARAM_PP_PGTABLE:
>>>>>>>>>>>                    *value = 0;
>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>>>>> index 450efe59abb5..c2ecec5b11c4 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>>>>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>>>>>>>>>            submit->gpu = gpu;
>>>>>>>>>>>            submit->cmd = (void *)&submit->bos[nr_bos];
>>>>>>>>>>>            submit->queue = queue;
>>>>>>>>>>> -     submit->ring = gpu->rb[queue->prio];
>>>>>>>>>>> +     submit->ring = gpu->rb[queue->ring_nr];
>>>>>>>>>>>            submit->fault_dumped = false;
>>>>>>>>>>>
>>>>>>>>>>>            INIT_LIST_HEAD(&submit->node);
>>>>>>>>>>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>>>>>>>>>            /* Get a unique identifier for the submission for logging purposes */
>>>>>>>>>>>            submitid = atomic_inc_return(&ident) - 1;
>>>>>>>>>>>
>>>>>>>>>>> -     ring = gpu->rb[queue->prio];
>>>>>>>>>>> +     ring = gpu->rb[queue->ring_nr];
>>>>>>>>>>>            trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
>>>>>>>>>>>                    args->nr_bos, args->nr_cmds);
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>>>> index b912cacaecc0..0e4b45bff2e6 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>>>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
>>>>>>>>>>>            const char *name;
>>>>>>>>>>>        };
>>>>>>>>>>>
>>>>>>>>>>> +/*
>>>>>>>>>>> + * The number of priority levels provided by drm gpu scheduler.  The
>>>>>>>>>>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>>>>>>>>>>> + * cases, so we don't use it (no need for kernel generated jobs).
>>>>>>>>>>> + */
>>>>>>>>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
>>>>>>>>>>> +
>>>>>>>>>>> +/**
>>>>>>>>>>> + * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
>>>>>>>>>>> + *
>>>>>>>>>>> + * @gpu:        the gpu instance
>>>>>>>>>>> + * @prio:       the userspace priority level
>>>>>>>>>>> + * @ring_nr:    [out] the ringbuffer the userspace priority maps to
>>>>>>>>>>> + * @sched_prio: [out] the gpu scheduler priority level which the userspace
>>>>>>>>>>> + *              priority maps to
>>>>>>>>>>> + *
>>>>>>>>>>> + * With drm/scheduler providing it's own level of prioritization, our total
>>>>>>>>>>> + * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
>>>>>>>>>>> + * Each ring is associated with it's own scheduler instance.  However, our
>>>>>>>>>>> + * UABI is that lower numerical values are higher priority.  So mapping the
>>>>>>>>>>> + * single userspace priority level into ring_nr and sched_prio takes some
>>>>>>>>>>> + * care.  The userspace provided priority (when a submitqueue is created)
>>>>>>>>>>> + * is mapped to ring nr and scheduler priority as such:
>>>>>>>>>>> + *
>>>>>>>>>>> + *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
>>>>>>>>>>> + *   sched_prio = NR_SCHED_PRIORITIES -
>>>>>>>>>>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
>>>>>>>>>>> + *
>>>>>>>>>>> + * This allows generations without preemption (nr_rings==1) to have some
>>>>>>>>>>> + * amount of prioritization, and provides more priority levels for gens
>>>>>>>>>>> + * that do have preemption.
>>>>>>>>>>
>>>>>>>>>> I am exploring how different drivers handle priority levels and this
>>>>>>>>>> caught my eye.
>>>>>>>>>>
>>>>>>>>>> Is the implication of the last paragraphs that on hw with nr_rings > 1,
>>>>>>>>>> ring + 1 preempts ring?
>>>>>>>>>
>>>>>>>>> Other way around, at least from the uabi standpoint.  Ie. ring[0]
>>>>>>>>> preempts ring[1]
>>>>>>>>
>>>>>>>> Ah yes, I figure it out from the comments but then confused myself when
>>>>>>>> writing the email.
>>>>>>>>
>>>>>>>>>> If so I am wondering does the "spreading" of
>>>>>>>>>> user visible priorities by NR_SCHED_PRIORITIES creates a non-preemptable
>>>>>>>>>> levels within every "bucket" or how does that work?
>>>>>>>>>
>>>>>>>>> So, preemption is possible between any priority level before run_job()
>>>>>>>>> gets called, which writes the job into the ringbuffer.  After that
>>>>>>>>
>>>>>>>> Hmm how? Before run_job() the jobs are not runnable, sitting in the
>>>>>>>> scheduler queues, right?
>>>>>>>
>>>>>>> I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A on
>>>>>>> prio[1] could be executed after submit B on prio[2] provided that
>>>>>>> run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
>>>>>>> preemption because the submit hasn't started running on the GPU yet.
>>>>>>> But rather just scheduling according to priority.
>>>>>>>
>>>>>>>>> point, you only have "bucket" level preemption, because
>>>>>>>>> NR_SCHED_PRIORITIES levels of priority get mapped to a single FIFO
>>>>>>>>> ringbuffer.
>>>>>>>>
>>>>>>>> Right, and you have one GPU with four rings, which means you expose 12
>>>>>>>> priority levels to userspace, did I get that right?
>>>>>>>
>>>>>>> Correct
>>>>>>>
>>>>>>>> If so how do you convey in the ABI that not all there priority levels
>>>>>>>> are equal? Like userspace can submit at prio 4 and expect prio 3 to
>>>>>>>> preempt, as would prio 2 preempt prio 3. While actual behaviour will not
>>>>>>>> match - 3 will not preempt 4.
>>>>>>>
>>>>>>> It isn't really exposed to userspace, but perhaps it should be..
>>>>>>> Userspace just knows that, to the extent possible, the kernel will try
>>>>>>> to execute prio 3 before prio 4.
>>>>>>>
>>>>>>>> Also, does your userspace stack (EGL/Vulkan) use the priorities? I had a
>>>>>>>> quick peek in Mesa but did not spot it - although I am not really at
>>>>>>>> home there yet so maybe I missed it.
>>>>>>>
>>>>>>> Yes, there is an EGL extension:
>>>>>>>
>>>>>>> https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
>>>>>>>
>>>>>>> It is pretty limited, it only exposes three priority levels.
>>>>>>
>>>>>> Right, is that wired up on msm? And if it is, or could be, how do/would
>>>>>> you map the three priority levels for GPUs which expose 3 priority
>>>>>> levels versus the one which exposes 12?
>>>>>
>>>>> We don't yet, but probably should, expose a cap to indicate to
>>>>> userspace the # of hw rings vs # of levels of sched priority
>>>>
>>>> What bothers me is the question of whether this setup provides a
>>>> consistent benefit. Why would userspace use other than "real" (hardware)
>>>> priority levels on chips where they are available?
>>>
>>> yeah, perhaps we could decide that userspace doesn't really need more
>>> than 3 prio levels, and that on generations which have better
>>> preemption than what drm/sched provides, *only* expose those priority
>>> levels.  I've avoided that so far because it seems wrong for the
>>> kernel to assume that a single EGL extension is all there is when it
>>> comes to userspace context priority.. the other option is to expose
>>> more information to userspace and let it decide.
>>
>> Maybe in msm you could reserve 0 for kernel submissions (if you have
>> such use cases) and expose levels 1-3 via drm/sched? If you could wire
>> that up, and if four levels is most your hardware will have.
> 
> we fortunately don't need kernel submission for anything... that said,
> the limited # of priorities for drm/sched seems a bit arbitrary
> (although perhaps catering to the existing egl extension)

I don't know the history there. But I am noticing Vulkan has at least four priorities.

First of all there is a "within process" priority which is expressed as [0.0f - 1.0f]. That does not seem to be implemented on the ANV side, which is perhaps understandable for now, since we don't have a scheduler smart enough to distinguish clients, its all just contexts regardless to which client they belong.

Then there is VK_EXT_global_priority which has four discrete levels (*). This one is implemented in ANV and maps to -512, 0, +512 and +1023 in i915 context priority uapi terms.

(*) Interesting fact is that despite four discrete levels, the Vulkan enum values are curiously spaced - as if they wanted to allow for more fine grained control in the future.

typedef enum VkQueueGlobalPriorityKHR {
     VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR = 128,
     VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR = 256,
     VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR = 512,
     VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR = 1024,
     VK_QUEUE_GLOBAL_PRIORITY_LOW_EXT = VK_QUEUE_GLOBAL_PRIORITY_LOW_KHR,
     VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_EXT = VK_QUEUE_GLOBAL_PRIORITY_MEDIUM_KHR,
     VK_QUEUE_GLOBAL_PRIORITY_HIGH_EXT = VK_QUEUE_GLOBAL_PRIORITY_HIGH_KHR,
     VK_QUEUE_GLOBAL_PRIORITY_REALTIME_EXT = VK_QUEUE_GLOBAL_PRIORITY_REALTIME_KHR,
} VkQueueGlobalPriorityKHR;

AMD side seemed almost the same as i915, all until the point when I ended up in the kernel side amdgpu_to_sched_priority which does not seem called from anywhere. So not sure how those four actually map to amdgpu and drm/sched.

Christian are you reading this to help answer perhaps?

>> Although with that option it seems drm/sched could starve lower
>> priorities, I mean not give anything to the hw/fw scheduler on higher
>> rings as longs as there is work on lower. Which if those chips have some
>> smarter algorithm would defeat it.
> 
> So the thing is the (existing) gpu scheduling is strictly priority
> based, and not "nice" based like CPU scheduling.  Those two schemes
> are completely different paradigms, the latter giving some boost to
> processes that have been blocked on I/O (which, I'm not sure there is
> an equiv thing for GPU) or otherwise haven't had a chance to run for a
> while.

I lost you here - I don't think paradigms are different, nor that CPU nice is somehow tied with blocked on I/O.

There is a default inherit from CPU nice to I/O nice, but _only_ for default I/O priority - where it hasn't been explicitly set via respective system calls. Which is exactly what I am proposing for GPU.

>> So perhaps there is no way but improving drm/sched. Backend controlled
>> number of priorities and backend control for whether "in flight" job s
>> limit is global vs per priority level (per run queue).
>>
>> Btw my motivation looking into all this is that we have CPU nice and
>> ionice supporting more levels and I'd like to tie that all together into
>> one consistent user friendly story (see
>> https://patchwork.freedesktop.org/series/102348/). In a world of
>> heterogenous compute pipelines I think that is the way forward. I even
>> demonstrated this from within ChromeOS, since the compositor uses nice
>> -5 is automatically gives it more GPU bandwith compared to for instance
>> Android VM.
> 
> But this can be achieved with a simple priority based scheme, ie.
> compositor is higher priority than app.

Of course. Where it gets more complicated is when you have multiple userspace libraries processing the same data set in turn.

> The situation changes a bit, and becomes more cpu like perhaps, when
> you add long running compute and cpu-offload stuff

Exactly. And not only long running compute but high queue depth in general.

Consider for instance user working in say Handbrake - fires away a transcode in the background while continues to fiddle with previews for a next video. Background transcode can queue up multiple frames worth of work into the GPU, where each frame can be several milliseconds worth of GPU time. Even in this scenario you get into the context scheduling terrirory rather than intearctive bursty / vsynced workloads.

Not only that but to process a single frame we can have a buffer first be decoded on the GPU, processed on the CPU and then encoded on the GPU again. In the future a VPU block will appear in this chain as well. So you need a way to control priority of all components in the chain in an consistent and usable manner.

You can make all the libraries and applications aware of course.. but realistically that will be hard and fragile. What I propose is for an operation like "nice 5 ffmpeg-transcode.sh ..." to just work in the background for the complete pipeline, just as the user intended.

>> I know of other hardware supporting more than three levels, but I need
>> to study more drm drivers to gain a complete picture. I only started
>> with msm since it looked simple. :)
> 
> even in msm the # of priority levels is somewhat arbitrary.. but
> roughly it is that we tell the hw there is something higher priority
> to run, it waits a bit for a cooperative yield point (since force
> preemption is rather expensive for 3d, ie. there is a lot of state to
> save/restore, not just a few cpu registers), and then eventually if a
> cooperative yield point isn't hit it triggers a forced preemption.
> (Only on newer things, older gens only had cooperative yield points to
> work with.)
> 
>>> Honestly, the combination of the fact that a6xx is the first gen
>>> shipping in consumer products with upstream driver (using drm/sched),
>>> and not having had time yet to implement hw preemption for a6xx yet,
>>> means not a whole lot of thought has gone into the current arrangement
>>> ;-)
>>
>> :)
>>
>> What kind of scheduling algorithm does your hardware have between those
>> priority levels?
> 
> Like I said, it is strictly "thing A is higher priority than thing
> B".. there is no CSF or io-nice type thing.  I guess since it is still
> the kernel that initiates the preemption, we could in theory implement

By this you mean you don't just feel the hw priority queues at will but make sure only a small amount of work is in each?

> something more clever.  But I'm not entirely sure something more
> clever makes sense given the relatively high cost of forced preemption
> compared to CPU.  Ofc I could be wrong, I've not given a lot of
> thought to it other than more limited scenarios (ie. compositor should
> be higher priority than app)

To deal with a varying cost of preemption is a matter of selecting the right timeslice. But yes, smart(er) scheduling is a somewhat orthogonal problem to priority control.

Regards,

Tvrtko

> 
> BR,
> -R
> 
>>>> For instance if you exposed 4 instead of 12 on a respective platform,
>>>> would that be better or worse? Yes you could only map three directly
>>>> drm/sched and one would have to be "fake". Like:
>>>>
>>>> hw prio 0 -> drm/sched 2
>>>> hw prio 1 -> drm/sched 1
>>>> hw prio 2 -> drm/sched 0
>>>> hw prio 3 -> drm/sched 0
>>>>
>>>> Not saying that's nice either. Perhaps the answer is that drm/sched
>>>> needs more flexibility for instance if it wants to be widely used.
>>>
>>> I'm not sure what I'd add to drm/sched.. once it calls run_job()
>>> things are out of its hands, so really all it can do is re-order
>>> things prior to calling run_job() according to it's internal priority
>>> levels.  And that is still better than no re-ordering so it adds some
>>> value, even if not complete.
>>
>> Not sure about the value there - as mentioned before I see problems on
>> the uapi front with not all priorities being equal.
>>
>> Besides, priority order scheduling is kind of meh to me. Especially if
>> it only applies in the scheduling frontend. If frontend and backend
>> algorithms do not even match then it's even more weird.
>>
>> IMO sooner or later GPU scheduling will have to catchup with state of
>> the art from the CPU world and use priority as a hint for time sharing
>> decisions.
> 
> Maybe.. that is a lot more sophisticated than the current situation of
> "queue A should have higher priority than queue B"
> 
> OTOH actual preemption of GPU work is a lot more expensive than
> preempting a CPU thread, so not even sure if we should try and look at
> GPU and CPU scheduling the same way.  (But so far I've only looked at
> it as "compositor should have higher priority than app")
> 
> BR,
> -R
> 
>>>> For instance in i915 uapi we have priority as int -1023 - +1023. And
>>>> matching implementation on some platforms, until the new ones which are
>>>> GuC firmware based, where we need to squash that to low/normal/high.
>>>
>>> hmm, that is a more awkward problem, since it sounds like you are
>>> mapping many more priority levels into a much smaller set of hw
>>> priority levels.  Do you have separate drm_sched instances per hw
>>> priority level?  If so you can do the same thing of using drm_sched
>>> priority levels to multiply # of hw priority levels, but ofc that is
>>> not perfect (and won't get you to 2k).
>>
>> We don't use drm/sched yet, I was just mentioning what we have in uapi.
>> But yes, our current scheduling backend can handle more than three levels.
>>
>>> But is there anything that actually *uses* that many levels of priority?
>>
>>   From userspace no, there are only a few internal priority levels for
>> things like heartbeats the driver is sending to check engine health and
>> page flip priority boosts.
>>
>> Regards,
>>
>> Tvrtko
