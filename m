Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1294534E26
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 13:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D7D10EE3D;
	Thu, 26 May 2022 11:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A3010E04A;
 Thu, 26 May 2022 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653565126; x=1685101126;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KhMIukvCOhsMzXS2l0pVC29uNeSuy2/Pzba4cvCajfg=;
 b=MsLHaCPol/3blaazcTitTh8Y1b2KmP+b7R2oXnYUoaf/QvfmnN1Nshdv
 R7NFNo824r1d452sD9Xdt+d6Re3pk/LsGd8mSamaqJbNd05+47rtgxKSJ
 rZRxtKmg8Ha9TdWc0H4R2EEk6fAlylmGg4ZevbZoj/Cs7kSlPpVfcVBIR
 RfTP4gl4YfuHRYc0Y1WQvIxcixPpWhXqrraJgMecdi4CSjy7Ly97u8+hN
 piu2ylEFDKzttkbJArjDkWS2A7DP1F6PoUOO/P4IqJLECrPfBEFK8oCkW
 RiUh70oswE4sqQKrrUsurtKjnlJEAbyBXXdIFfYrpBOAP4fy/kDfWlPYt A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="254001217"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="254001217"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 04:38:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="664894859"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.214.182])
 ([10.213.214.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 04:38:43 -0700
Message-ID: <423c1077-191d-000c-2f3b-f60277a8f3f1@linux.intel.com>
Date: Thu, 26 May 2022 12:38:41 +0100
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
 <1cd913da-6e51-509c-a6e6-83bf79cae20b@linux.intel.com>
 <CAF6AEGs_+mhY9x1HG=jHmpwGU6jUS1G4mF6bJCd3yN0JRhocsQ@mail.gmail.com>
 <046f2d0f-5e61-7d24-1b40-006f2377c974@linux.intel.com>
 <CAF6AEGtcZ=rcVeFCRdj2gF0=4OV0B4EJ51FuZY0sge3EEgSgzg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGtcZ=rcVeFCRdj2gF0=4OV0B4EJ51FuZY0sge3EEgSgzg@mail.gmail.com>
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


On 26/05/2022 04:37, Rob Clark wrote:
> On Wed, May 25, 2022 at 9:22 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 25/05/2022 14:41, Rob Clark wrote:
>>> On Wed, May 25, 2022 at 2:46 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>>
>>>> On 24/05/2022 15:50, Rob Clark wrote:
>>>>> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 23/05/2022 23:53, Rob Clark wrote:
>>>>>>> On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
>>>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> Hi Rob,
>>>>>>>>
>>>>>>>> On 28/07/2021 02:06, Rob Clark wrote:
>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>>>>
>>>>>>>>> The drm/scheduler provides additional prioritization on top of that
>>>>>>>>> provided by however many number of ringbuffers (each with their own
>>>>>>>>> priority level) is supported on a given generation.  Expose the
>>>>>>>>> additional levels of priority to userspace and map the userspace
>>>>>>>>> priority back to ring (first level of priority) and schedular priority
>>>>>>>>> (additional priority levels within the ring).
>>>>>>>>>
>>>>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>> ---
>>>>>>>>>       drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
>>>>>>>>>       drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
>>>>>>>>>       drivers/gpu/drm/msm/msm_gpu.h           | 58 ++++++++++++++++++++++++-
>>>>>>>>>       drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
>>>>>>>>>       include/uapi/drm/msm_drm.h              | 14 +++++-
>>>>>>>>>       5 files changed, 88 insertions(+), 27 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>> index bad4809b68ef..748665232d29 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
>>>>>>>>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value)
>>>>>>>>>                           return ret;
>>>>>>>>>                   }
>>>>>>>>>                   return -EINVAL;
>>>>>>>>> -     case MSM_PARAM_NR_RINGS:
>>>>>>>>> -             *value = gpu->nr_rings;
>>>>>>>>> +     case MSM_PARAM_PRIORITIES:
>>>>>>>>> +             *value = gpu->nr_rings * NR_SCHED_PRIORITIES;
>>>>>>>>>                   return 0;
>>>>>>>>>           case MSM_PARAM_PP_PGTABLE:
>>>>>>>>>                   *value = 0;
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>>> index 450efe59abb5..c2ecec5b11c4 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>>>>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>>>>>>>>           submit->gpu = gpu;
>>>>>>>>>           submit->cmd = (void *)&submit->bos[nr_bos];
>>>>>>>>>           submit->queue = queue;
>>>>>>>>> -     submit->ring = gpu->rb[queue->prio];
>>>>>>>>> +     submit->ring = gpu->rb[queue->ring_nr];
>>>>>>>>>           submit->fault_dumped = false;
>>>>>>>>>
>>>>>>>>>           INIT_LIST_HEAD(&submit->node);
>>>>>>>>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>>>>>>>           /* Get a unique identifier for the submission for logging purposes */
>>>>>>>>>           submitid = atomic_inc_return(&ident) - 1;
>>>>>>>>>
>>>>>>>>> -     ring = gpu->rb[queue->prio];
>>>>>>>>> +     ring = gpu->rb[queue->ring_nr];
>>>>>>>>>           trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
>>>>>>>>>                   args->nr_bos, args->nr_cmds);
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>> index b912cacaecc0..0e4b45bff2e6 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>>>>>>>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
>>>>>>>>>           const char *name;
>>>>>>>>>       };
>>>>>>>>>
>>>>>>>>> +/*
>>>>>>>>> + * The number of priority levels provided by drm gpu scheduler.  The
>>>>>>>>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
>>>>>>>>> + * cases, so we don't use it (no need for kernel generated jobs).
>>>>>>>>> + */
>>>>>>>>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * msm_gpu_convert_priority - Map userspace priority to ring # and sched priority
>>>>>>>>> + *
>>>>>>>>> + * @gpu:        the gpu instance
>>>>>>>>> + * @prio:       the userspace priority level
>>>>>>>>> + * @ring_nr:    [out] the ringbuffer the userspace priority maps to
>>>>>>>>> + * @sched_prio: [out] the gpu scheduler priority level which the userspace
>>>>>>>>> + *              priority maps to
>>>>>>>>> + *
>>>>>>>>> + * With drm/scheduler providing it's own level of prioritization, our total
>>>>>>>>> + * number of available priority levels is (nr_rings * NR_SCHED_PRIORITIES).
>>>>>>>>> + * Each ring is associated with it's own scheduler instance.  However, our
>>>>>>>>> + * UABI is that lower numerical values are higher priority.  So mapping the
>>>>>>>>> + * single userspace priority level into ring_nr and sched_prio takes some
>>>>>>>>> + * care.  The userspace provided priority (when a submitqueue is created)
>>>>>>>>> + * is mapped to ring nr and scheduler priority as such:
>>>>>>>>> + *
>>>>>>>>> + *   ring_nr    = userspace_prio / NR_SCHED_PRIORITIES
>>>>>>>>> + *   sched_prio = NR_SCHED_PRIORITIES -
>>>>>>>>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
>>>>>>>>> + *
>>>>>>>>> + * This allows generations without preemption (nr_rings==1) to have some
>>>>>>>>> + * amount of prioritization, and provides more priority levels for gens
>>>>>>>>> + * that do have preemption.
>>>>>>>>
>>>>>>>> I am exploring how different drivers handle priority levels and this
>>>>>>>> caught my eye.
>>>>>>>>
>>>>>>>> Is the implication of the last paragraphs that on hw with nr_rings > 1,
>>>>>>>> ring + 1 preempts ring?
>>>>>>>
>>>>>>> Other way around, at least from the uabi standpoint.  Ie. ring[0]
>>>>>>> preempts ring[1]
>>>>>>
>>>>>> Ah yes, I figure it out from the comments but then confused myself when
>>>>>> writing the email.
>>>>>>
>>>>>>>> If so I am wondering does the "spreading" of
>>>>>>>> user visible priorities by NR_SCHED_PRIORITIES creates a non-preemptable
>>>>>>>> levels within every "bucket" or how does that work?
>>>>>>>
>>>>>>> So, preemption is possible between any priority level before run_job()
>>>>>>> gets called, which writes the job into the ringbuffer.  After that
>>>>>>
>>>>>> Hmm how? Before run_job() the jobs are not runnable, sitting in the
>>>>>> scheduler queues, right?
>>>>>
>>>>> I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A on
>>>>> prio[1] could be executed after submit B on prio[2] provided that
>>>>> run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
>>>>> preemption because the submit hasn't started running on the GPU yet.
>>>>> But rather just scheduling according to priority.
>>>>>
>>>>>>> point, you only have "bucket" level preemption, because
>>>>>>> NR_SCHED_PRIORITIES levels of priority get mapped to a single FIFO
>>>>>>> ringbuffer.
>>>>>>
>>>>>> Right, and you have one GPU with four rings, which means you expose 12
>>>>>> priority levels to userspace, did I get that right?
>>>>>
>>>>> Correct
>>>>>
>>>>>> If so how do you convey in the ABI that not all there priority levels
>>>>>> are equal? Like userspace can submit at prio 4 and expect prio 3 to
>>>>>> preempt, as would prio 2 preempt prio 3. While actual behaviour will not
>>>>>> match - 3 will not preempt 4.
>>>>>
>>>>> It isn't really exposed to userspace, but perhaps it should be..
>>>>> Userspace just knows that, to the extent possible, the kernel will try
>>>>> to execute prio 3 before prio 4.
>>>>>
>>>>>> Also, does your userspace stack (EGL/Vulkan) use the priorities? I had a
>>>>>> quick peek in Mesa but did not spot it - although I am not really at
>>>>>> home there yet so maybe I missed it.
>>>>>
>>>>> Yes, there is an EGL extension:
>>>>>
>>>>> https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priority.txt
>>>>>
>>>>> It is pretty limited, it only exposes three priority levels.
>>>>
>>>> Right, is that wired up on msm? And if it is, or could be, how do/would
>>>> you map the three priority levels for GPUs which expose 3 priority
>>>> levels versus the one which exposes 12?
>>>
>>> We don't yet, but probably should, expose a cap to indicate to
>>> userspace the # of hw rings vs # of levels of sched priority
>>
>> What bothers me is the question of whether this setup provides a
>> consistent benefit. Why would userspace use other than "real" (hardware)
>> priority levels on chips where they are available?
> 
> yeah, perhaps we could decide that userspace doesn't really need more
> than 3 prio levels, and that on generations which have better
> preemption than what drm/sched provides, *only* expose those priority
> levels.  I've avoided that so far because it seems wrong for the
> kernel to assume that a single EGL extension is all there is when it
> comes to userspace context priority.. the other option is to expose
> more information to userspace and let it decide.

Maybe in msm you could reserve 0 for kernel submissions (if you have 
such use cases) and expose levels 1-3 via drm/sched? If you could wire 
that up, and if four levels is most your hardware will have.

Although with that option it seems drm/sched could starve lower 
priorities, I mean not give anything to the hw/fw scheduler on higher 
rings as longs as there is work on lower. Which if those chips have some 
smarter algorithm would defeat it.

So perhaps there is no way but improving drm/sched. Backend controlled 
number of priorities and backend control for whether "in flight" job s 
limit is global vs per priority level (per run queue).

Btw my motivation looking into all this is that we have CPU nice and 
ionice supporting more levels and I'd like to tie that all together into 
one consistent user friendly story (see 
https://patchwork.freedesktop.org/series/102348/). In a world of 
heterogenous compute pipelines I think that is the way forward. I even 
demonstrated this from within ChromeOS, since the compositor uses nice 
-5 is automatically gives it more GPU bandwith compared to for instance 
Android VM.

I know of other hardware supporting more than three levels, but I need 
to study more drm drivers to gain a complete picture. I only started 
with msm since it looked simple. :)

> Honestly, the combination of the fact that a6xx is the first gen
> shipping in consumer products with upstream driver (using drm/sched),
> and not having had time yet to implement hw preemption for a6xx yet,
> means not a whole lot of thought has gone into the current arrangement
> ;-)

:)

What kind of scheduling algorithm does your hardware have between those 
priority levels?

>> For instance if you exposed 4 instead of 12 on a respective platform,
>> would that be better or worse? Yes you could only map three directly
>> drm/sched and one would have to be "fake". Like:
>>
>> hw prio 0 -> drm/sched 2
>> hw prio 1 -> drm/sched 1
>> hw prio 2 -> drm/sched 0
>> hw prio 3 -> drm/sched 0
>>
>> Not saying that's nice either. Perhaps the answer is that drm/sched
>> needs more flexibility for instance if it wants to be widely used.
> 
> I'm not sure what I'd add to drm/sched.. once it calls run_job()
> things are out of its hands, so really all it can do is re-order
> things prior to calling run_job() according to it's internal priority
> levels.  And that is still better than no re-ordering so it adds some
> value, even if not complete.

Not sure about the value there - as mentioned before I see problems on 
the uapi front with not all priorities being equal.

Besides, priority order scheduling is kind of meh to me. Especially if 
it only applies in the scheduling frontend. If frontend and backend 
algorithms do not even match then it's even more weird.

IMO sooner or later GPU scheduling will have to catchup with state of 
the art from the CPU world and use priority as a hint for time sharing 
decisions.

>> For instance in i915 uapi we have priority as int -1023 - +1023. And
>> matching implementation on some platforms, until the new ones which are
>> GuC firmware based, where we need to squash that to low/normal/high.
> 
> hmm, that is a more awkward problem, since it sounds like you are
> mapping many more priority levels into a much smaller set of hw
> priority levels.  Do you have separate drm_sched instances per hw
> priority level?  If so you can do the same thing of using drm_sched
> priority levels to multiply # of hw priority levels, but ofc that is
> not perfect (and won't get you to 2k).

We don't use drm/sched yet, I was just mentioning what we have in uapi. 
But yes, our current scheduling backend can handle more than three levels.

> But is there anything that actually *uses* that many levels of priority?

 From userspace no, there are only a few internal priority levels for 
things like heartbeats the driver is sending to check engine health and 
page flip priority boosts.

Regards,

Tvrtko
