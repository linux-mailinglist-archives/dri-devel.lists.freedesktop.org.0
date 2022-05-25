Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C79F53411A
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 18:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B193A10E0FA;
	Wed, 25 May 2022 16:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F4A10E0FA;
 Wed, 25 May 2022 16:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653495090; x=1685031090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=P2oD2DLPDO4W+4LFDKXBXh+xzvJpJ5bumU6qG1oluDQ=;
 b=X8+T+16tTvl8QjxuXMEc6H7VaHoCk2B+ebdaX9G2cTdQudFkRtNq5Ay/
 OyMlDuwHBvVLOQbJm0+nHzMvFbuv9zjECfWG/AFkKv3sJJ948p92iGevE
 v5/NJ/SaEDnCchvFL2Ge8Y8jfz9Z3TjBeBbtzKlzTj4H4GkojR2YiOnWz
 KOaziTliNBJZu6A1TqBHkTyD7wrbZXwjPZR3AJj3FQYbMPd4SET2JPkMq
 TpPyj/PsmeIi5NUTa3HHr1jkdS0c33Lr4zQugcOpwyZU/EFluqagNRNC/
 nW1qk/icSRwzF5+JihXh3Ewhz0I1F16MxbZGGq6xAxr5WhnA9zd94pNMw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="261467663"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="261467663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 09:11:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="676926754"
Received: from isobansk-mobl.ger.corp.intel.com (HELO [10.213.230.191])
 ([10.213.230.191])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 09:11:26 -0700
Message-ID: <1972f50b-d71a-9e2e-d10b-cc4f13bb208f@linux.intel.com>
Date: Wed, 25 May 2022 17:11:24 +0100
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
 <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
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


On 24/05/2022 15:57, Rob Clark wrote:
> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> On 23/05/2022 23:53, Rob Clark wrote:
>>>
>>> btw, one fun (but unrelated) issue I'm hitting with scheduler... I'm
>>> trying to add an igt test to stress shrinker/eviction, similar to the
>>> existing tests/i915/gem_shrink.c.  But we hit an unfortunate
>>> combination of circumstances:
>>> 1. Pinning memory happens in the synchronous part of the submit ioctl,
>>> before enqueuing the job for the kthread to handle.
>>> 2. The first run_job() callback incurs a slight delay (~1.5ms) while
>>> resuming the GPU
>>> 3. Because of that delay, userspace has a chance to queue up enough
>>> more jobs to require locking/pinning more than the available system
>>> RAM..
>>
>> Is that one or multiple threads submitting jobs?
> 
> In this case multiple.. but I think it could also happen with a single
> thread (provided it didn't stall on a fence, directly or indirectly,
> from an earlier submit), because of how resume and actual job
> submission happens from scheduler kthread.
> 
>>> I'm not sure if we want a way to prevent userspace from getting *too*
>>> far ahead of the kthread.  Or maybe at some point the shrinker should
>>> sleep on non-idle buffers?
>>
>> On the direct reclaim path when invoked from the submit ioctl? In i915
>> we only shrink idle objects on direct reclaim and leave active ones for
>> the swapper. It depends on how your locking looks like whether you could
>> do them, whether there would be coupling of locks and fs-reclaim context.
> 
> I think the locking is more or less ok, although lockdep is unhappy
> about one thing[1] which is I think a false warning (ie. not
> recognizing that we'd already successfully acquired the obj lock via
> trylock).  We can already reclaim idle bo's in this path.  But the
> problem with a bunch of submits queued up in the scheduler, is that
> they are already considered pinned and active.  So at some point we
> need to sleep (hopefully interruptabley) until they are no longer
> active, ie. to throttle userspace trying to shove in more submits
> until some of the enqueued ones have a chance to run and complete.

Odd I did not think trylock could trigger that. Looking at your code it 
indeed seems two trylocks. I am pretty sure we use the same trylock 
trick to avoid it. I am confused..

Otherwise if you can afford to sleep you can of course throttle 
organically via direct reclaim. Unless I am forgetting some key gotcha - 
it's been a while I've been active in this area.

Regards,

Tvrtko

> 
> BR,
> -R
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/issues/14
> 
>> Regards,
>>
>> Tvrtko
>>
>>> BR,
>>> -R
>>>
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>> + */
>>>>> +static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
>>>>> +             unsigned *ring_nr, enum drm_sched_priority *sched_prio)
>>>>> +{
>>>>> +     unsigned rn, sp;
>>>>> +
>>>>> +     rn = div_u64_rem(prio, NR_SCHED_PRIORITIES, &sp);
>>>>> +
>>>>> +     /* invert sched priority to map to higher-numeric-is-higher-
>>>>> +      * priority convention
>>>>> +      */
>>>>> +     sp = NR_SCHED_PRIORITIES - sp - 1;
>>>>> +
>>>>> +     if (rn >= gpu->nr_rings)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     *ring_nr = rn;
>>>>> +     *sched_prio = sp;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * A submitqueue is associated with a gl context or vk queue (or equiv)
>>>>>      * in userspace.
>>>>> @@ -257,7 +310,8 @@ struct msm_gpu_perfcntr {
>>>>>      * @id:        userspace id for the submitqueue, unique within the drm_file
>>>>>      * @flags:     userspace flags for the submitqueue, specified at creation
>>>>>      *             (currently unusued)
>>>>> - * @prio:      the submitqueue priority
>>>>> + * @ring_nr:   the ringbuffer used by this submitqueue, which is determined
>>>>> + *             by the submitqueue's priority
>>>>>      * @faults:    the number of GPU hangs associated with this submitqueue
>>>>>      * @ctx:       the per-drm_file context associated with the submitqueue (ie.
>>>>>      *             which set of pgtables do submits jobs associated with the
>>>>> @@ -272,7 +326,7 @@ struct msm_gpu_perfcntr {
>>>>>     struct msm_gpu_submitqueue {
>>>>>         int id;
>>>>>         u32 flags;
>>>>> -     u32 prio;
>>>>> +     u32 ring_nr;
>>>>>         int faults;
>>>>>         struct msm_file_private *ctx;
>>>>>         struct list_head node;
>>>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
>>>>> index 682ba2a7c0ec..32a55d81b58b 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
>>>>> @@ -68,6 +68,8 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>>>>>         struct msm_gpu_submitqueue *queue;
>>>>>         struct msm_ringbuffer *ring;
>>>>>         struct drm_gpu_scheduler *sched;
>>>>> +     enum drm_sched_priority sched_prio;
>>>>> +     unsigned ring_nr;
>>>>>         int ret;
>>>>>
>>>>>         if (!ctx)
>>>>> @@ -76,8 +78,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>>>>>         if (!priv->gpu)
>>>>>                 return -ENODEV;
>>>>>
>>>>> -     if (prio >= priv->gpu->nr_rings)
>>>>> -             return -EINVAL;
>>>>> +     ret = msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sched_prio);
>>>>> +     if (ret)
>>>>> +             return ret;
>>>>>
>>>>>         queue = kzalloc(sizeof(*queue), GFP_KERNEL);
>>>>>
>>>>> @@ -86,24 +89,13 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>>>>>
>>>>>         kref_init(&queue->ref);
>>>>>         queue->flags = flags;
>>>>> -     queue->prio = prio;
>>>>> +     queue->ring_nr = ring_nr;
>>>>>
>>>>> -     ring = priv->gpu->rb[prio];
>>>>> +     ring = priv->gpu->rb[ring_nr];
>>>>>         sched = &ring->sched;
>>>>>
>>>>> -     /*
>>>>> -      * TODO we can allow more priorities than we have ringbuffers by
>>>>> -      * mapping:
>>>>> -      *
>>>>> -      *    ring = prio / 3;
>>>>> -      *    ent_prio = DRM_SCHED_PRIORITY_MIN + (prio % 3);
>>>>> -      *
>>>>> -      * Probably avoid using DRM_SCHED_PRIORITY_KERNEL as that is
>>>>> -      * treated specially in places.
>>>>> -      */
>>>>>         ret = drm_sched_entity_init(&queue->entity,
>>>>> -                     DRM_SCHED_PRIORITY_NORMAL,
>>>>> -                     &sched, 1, NULL);
>>>>> +                     sched_prio, &sched, 1, NULL);
>>>>>         if (ret) {
>>>>>                 kfree(queue);
>>>>>                 return ret;
>>>>> @@ -134,16 +126,19 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>>>>>     int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
>>>>>     {
>>>>>         struct msm_drm_private *priv = drm->dev_private;
>>>>> -     int default_prio;
>>>>> +     int default_prio, max_priority;
>>>>>
>>>>>         if (!priv->gpu)
>>>>>                 return -ENODEV;
>>>>>
>>>>> +     max_priority = (priv->gpu->nr_rings * NR_SCHED_PRIORITIES) - 1;
>>>>> +
>>>>>         /*
>>>>> -      * Select priority 2 as the "default priority" unless nr_rings is less
>>>>> -      * than 2 and then pick the lowest priority
>>>>> +      * Pick a medium priority level as default.  Lower numeric value is
>>>>> +      * higher priority, so round-up to pick a priority that is not higher
>>>>> +      * than the middle priority level.
>>>>>          */
>>>>> -     default_prio = clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1);
>>>>> +     default_prio = DIV_ROUND_UP(max_priority, 2);
>>>>>
>>>>>         INIT_LIST_HEAD(&ctx->submitqueues);
>>>>>
>>>>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
>>>>> index f075851021c3..6b8fffc28a50 100644
>>>>> --- a/include/uapi/drm/msm_drm.h
>>>>> +++ b/include/uapi/drm/msm_drm.h
>>>>> @@ -73,11 +73,19 @@ struct drm_msm_timespec {
>>>>>     #define MSM_PARAM_MAX_FREQ   0x04
>>>>>     #define MSM_PARAM_TIMESTAMP  0x05
>>>>>     #define MSM_PARAM_GMEM_BASE  0x06
>>>>> -#define MSM_PARAM_NR_RINGS   0x07
>>>>> +#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
>>>>>     #define MSM_PARAM_PP_PGTABLE 0x08  /* => 1 for per-process pagetables, else 0 */
>>>>>     #define MSM_PARAM_FAULTS     0x09
>>>>>     #define MSM_PARAM_SUSPENDS   0x0a
>>>>>
>>>>> +/* For backwards compat.  The original support for preemption was based on
>>>>> + * a single ring per priority level so # of priority levels equals the #
>>>>> + * of rings.  With drm/scheduler providing additional levels of priority,
>>>>> + * the number of priorities is greater than the # of rings.  The param is
>>>>> + * renamed to better reflect this.
>>>>> + */
>>>>> +#define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
>>>>> +
>>>>>     struct drm_msm_param {
>>>>>         __u32 pipe;           /* in, MSM_PIPE_x */
>>>>>         __u32 param;          /* in, MSM_PARAM_x */
>>>>> @@ -304,6 +312,10 @@ struct drm_msm_gem_madvise {
>>>>>
>>>>>     #define MSM_SUBMITQUEUE_FLAGS (0)
>>>>>
>>>>> +/*
>>>>> + * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
>>>>> + * a lower numeric value is higher priority.
>>>>> + */
>>>>>     struct drm_msm_submitqueue {
>>>>>         __u32 flags;   /* in, MSM_SUBMITQUEUE_x */
>>>>>         __u32 prio;    /* in, Priority level */
