Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1484BE2331
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F032510E2EA;
	Thu, 16 Oct 2025 08:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a27QFQbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438B510E2E7;
 Thu, 16 Oct 2025 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/aHZ4u5zVc7Quj1Womin3dmLqoGPBsxwNlvS4J7FTOA=; b=a27QFQbIKgPoyBM1MbyNMOMjRC
 xfLds6l74MCWJ7eB5CcGQfqZkzglHnCctzVSG8frp2M4kI14kY8y3gMUUH9l40bO7UTqT5U8qmriU
 Y2iTPxBrWQ0PzZqiQZ18Y560ka85akzE5eHeD37S1664dBIVZEC8aBrRaFLnwx+sxXYNwkYfjUqFh
 6E/zlVfibwpgAYASONEsr+LeNFNmHiTbKNB4NrPLr3GChGRQmVQzWx3ZbAUrd98AaKFKxlkfI7UEk
 MnyTv6seDDrNQ3nLpFuPF/jNilGXlNERkKzKuaGrSIGqXczjlAPZxx3tKi7FVouO3Avm41U8uSqNk
 vCuPk2vg==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v9JZQ-00AMBJ-5L; Thu, 16 Oct 2025 10:42:48 +0200
Message-ID: <8ce0c1f8-0abd-4767-a938-f1aea9fe3b48@igalia.com>
Date: Thu, 16 Oct 2025 09:42:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] drm/sched: Add fair scheduling policy
To: phasta@kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-11-tvrtko.ursulin@igalia.com>
 <db78f7074cf1e83afbbf68c27b9e7b55bfb9a73b.camel@mailbox.org>
 <eb1c157e-d99f-4e54-a669-15d4e5f78a64@igalia.com>
 <d76c17eaab3e8dff76720cc395cdfccde029858d.camel@mailbox.org>
 <aO5fErextiuPQcyq@phenom.ffwll.local>
 <3f644749-8ceb-4124-98c6-84dfe198020f@igalia.com>
 <6786d7766f363f2a24da9977b11436651ae1a731.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <6786d7766f363f2a24da9977b11436651ae1a731.camel@mailbox.org>
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


On 16/10/2025 08:06, Philipp Stanner wrote:
> On Tue, 2025-10-14 at 15:58 +0100, Tvrtko Ursulin wrote:
>>
>> On 14/10/2025 15:32, Simona Vetter wrote:
>>> On Tue, Oct 14, 2025 at 04:02:52PM +0200, Philipp Stanner wrote:
>>>> On Tue, 2025-10-14 at 13:56 +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 14/10/2025 11:27, Philipp Stanner wrote:
>>>>>> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>>>>>>> Fair scheduling policy is built upon the same concepts as the well known
>>>>>>
>>>>>> nit: "The fair …"
>>>>>>
>>>>>> Or maybe better: call it FAIR, being congruent with the FIFO below.
>>>>>>
>>>>>>> CFS kernel scheduler - entity run queue is sorted by the virtual GPU time
>>>>>>
>>>>>> nit: Call it "CPU scheduler". The GPU scheduler is a kernel scheduler,
>>>>>> too.
>>>>>>
>>>>>>> consumed by entities in a way that the entity with least vruntime runs
>>>>>>> first.
>>>>>>>
>>>>>>> It is able to avoid total priority starvation, which is one of the
>>>>>>> problems with FIFO, and it also does not need for per priority run queues.
>>>>>>> As it scales the actual GPU runtime by an exponential factor as the
>>>>>>> priority decreases, therefore the virtual runtime for low priority
>>>>>>
>>>>>> "therefore," is not necessary because of the sentence starting with
>>>>>> "As"
>>>>>
>>>>> Done x3 above.
>>>>>
>>>>>>
>>>>>>> entities grows faster than for normal priority, pushing them further down
>>>>>>> the runqueue order for the same real GPU time spent.
>>>>>>>
>>>>>>> Apart from this fundamental fairness, fair policy is especially strong in
>>>>>>> oversubscription workloads where it is able to give more GPU time to short
>>>>>>> and bursty workloads when they are running in parallel with GPU heavy
>>>>>>> clients submitting deep job queues.
>>>>>>>
>>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>>>>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>>>>> ---
>>>>>>>     drivers/gpu/drm/scheduler/sched_entity.c   |  28 ++--
>>>>>>>     drivers/gpu/drm/scheduler/sched_internal.h |   9 +-
>>>>>>>     drivers/gpu/drm/scheduler/sched_main.c     |  12 +-
>>>>>>>     drivers/gpu/drm/scheduler/sched_rq.c       | 147 ++++++++++++++++++++-
>>>>>>>     include/drm/gpu_scheduler.h                |  16 ++-
>>>>>>>     5 files changed, 191 insertions(+), 21 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index 04ce8b7d436b..58f51875547a 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -108,6 +108,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>>>>     	entity->guilty = guilty;
>>>>>>>     	entity->num_sched_list = num_sched_list;
>>>>>>>     	entity->priority = priority;
>>>>>>> +	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_FAIR ?
>>>>>>> +			      DRM_SCHED_PRIORITY_KERNEL : priority;
>>>>>>>     	/*
>>>>>>>     	 * It's perfectly valid to initialize an entity without having a valid
>>>>>>>     	 * scheduler attached. It's just not valid to use the scheduler before it
>>>>>>> @@ -124,17 +126,23 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>>>>     		 */
>>>>>>>     		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>>>>>>     	} else if (num_sched_list) {
>>>>>>> -		/* The "priority" of an entity cannot exceed the number of run-queues of a
>>>>>>> -		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
>>>>>>> -		 * the lowest priority available.
>>>>>>> +		enum drm_sched_priority p = entity->priority;
>>>>>>> +
>>>>>>> +		/*
>>>>>>> +		 * The "priority" of an entity cannot exceed the number of
>>>>>>> +		 * run-queues of a scheduler. Protect against num_rqs being 0,
>>>>>>> +		 * by converting to signed. Choose the lowest priority
>>>>>>> +		 * available.
>>>>>>>     		 */
>>>>>>> -		if (entity->priority >= sched_list[0]->num_rqs) {
>>>>>>> -			dev_err(sched_list[0]->dev, "entity has out-of-bounds priority: %u. num_rqs: %u\n",
>>>>>>> -				entity->priority, sched_list[0]->num_rqs);
>>>>>>> -			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>>>>>>> -						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>>>>>>> +		if (p >= sched_list[0]->num_user_rqs) {
>>>>>>> +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
>>>>>>> +				p, sched_list[0]->num_user_rqs);
>>>>>>> +			p = max_t(s32,
>>>>>>> +				 (s32)sched_list[0]->num_user_rqs - 1,
>>>>>>> +				 (s32)DRM_SCHED_PRIORITY_KERNEL);
>>>>>>> +			entity->priority = p;
>>>>>>>     		}
>>>>>>> -		entity->rq = sched_list[0]->sched_rq[entity->priority];
>>>>>>> +		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
>>>>>>
>>>>>> That rename could be a separate patch, couldn't it? As I said before
>>>>>> it's always great to have general code improvements as separate patches
>>>>>> since it makes it far easier to review (i.e.: detect / see) core
>>>>>> functionality changes.
>>>>>
>>>>> No, this is the new struct member only added in this patch.
>>>>>
>>>>>>
>>>>>>>     	}
>>>>>>>     
>>>>>>>     	init_completion(&entity->entity_idle);
>>>>>>> @@ -567,7 +575,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>>>     
>>>>>>>     	spin_lock(&entity->lock);
>>>>>>>     	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>>>>>>> -	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>>>>>>> +	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
>>>>>>>     	if (rq != entity->rq) {
>>>>>>>     		drm_sched_rq_remove_entity(entity->rq, entity);
>>>>>>>     		entity->rq = rq;
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>>>>>>> index 1132a771aa37..c94e38acc6f2 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>>>>>> @@ -18,18 +18,23 @@
>>>>>>>      * @kref: reference count for the object.
>>>>>>>      * @lock: lock guarding the @runtime updates.
>>>>>>>      * @runtime: time entity spent on the GPU.
>>>>>>> + * @prev_runtime: previous @runtime used to get the runtime delta
>>>>>>> + * @vruntime: virtual runtime as accumulated by the fair algorithm
>>>>>>
>>>>>> The other docstrings are all terminated with a full stop '.'
>>>>>
>>>>> Yep I fixed the whole series in this respect already as response to one
>>>>> of your earlier comments.
>>>>>
>>>>>>
>>>>>>>      */
>>>>>>>     struct drm_sched_entity_stats {
>>>>>>>     	struct kref	kref;
>>>>>>>     	spinlock_t	lock;
>>>>>>>     	ktime_t		runtime;
>>>>>>> +	ktime_t		prev_runtime;
>>>>>>> +	u64		vruntime;
>>>>>>>     };
>>>>>>>     
>>>>>>>     /* Used to choose between FIFO and RR job-scheduling */
>>>>>>>     extern int drm_sched_policy;
>>>>>>>     
>>>>>>> -#define DRM_SCHED_POLICY_RR    0
>>>>>>> -#define DRM_SCHED_POLICY_FIFO  1
>>>>>>> +#define DRM_SCHED_POLICY_RR   0
>>>>>>> +#define DRM_SCHED_POLICY_FIFO 1
>>>>>>> +#define DRM_SCHED_POLICY_FAIR 2
>>>>>>>
>>>>>>
>>>>>> Formatting unnecessarily increases the git diff.
>>>>>>
>>>>>> Let's die the death of having the old formatting. As far as it's
>>>>>> forseeable FAIR will be the last policy for the classic drm_sched
>>>>>> anyways, so no future changes here expected.
>>>>>
>>>>> Strange I thought I fixed this already in the previous respin. Re-fixed
>>>>> and verfied.
>>>>>>>     bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>>>>>>     			 struct drm_sched_entity *entity);
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index f180d292bf66..8d8f9c8411f5 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -90,7 +90,7 @@ int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>>>>>>      * DOC: sched_policy (int)
>>>>>>>      * Used to override default entities scheduling policy in a run queue.
>>>>>>>      */
>>>>>>> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>>>>>> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");
>>>>>>>     module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>>>>>     
>>>>>>>     static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>>>>>> @@ -1132,11 +1132,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>>>>>>     		sched->own_submit_wq = true;
>>>>>>>     	}
>>>>>>>     
>>>>>>> -	sched->sched_rq = kmalloc_array(args->num_rqs, sizeof(*sched->sched_rq),
>>>>>>> +	sched->num_user_rqs = args->num_rqs;
>>>>>>> +	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_FAIR ?
>>>>>>> +			 args->num_rqs : 1;
>>>>>>> +	sched->sched_rq = kmalloc_array(sched->num_rqs,
>>>>>>> +					sizeof(*sched->sched_rq),
>>>>>>
>>>>>> Don't reformat that for the git diff? Line doesn't seem crazily long.
>>>>>
>>>>> Ok.
>>>>>
>>>>>>
>>>>>>>     					GFP_KERNEL | __GFP_ZERO);
>>>>>>>     	if (!sched->sched_rq)
>>>>>>>     		goto Out_check_own;
>>>>>>> -	sched->num_rqs = args->num_rqs;
>>>>>>> +
>>>>>>>     	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>>>>>     		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>>>>>>>     		if (!sched->sched_rq[i])
>>>>>>> @@ -1278,7 +1282,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>>>>>>>     	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>>>>>>>     		atomic_inc(&bad->karma);
>>>>>>>     
>>>>>>> -		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
>>>>>>> +		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>>>>
>>>>>> Give me a pointer here quickly – what's that about?
>>>>>
>>>>> Since FAIR stuffs everthing into a single run queue it needs to start
>>>>> looking into it when looking for the guilty context. FIFO and RR are not
>>>>> affected since they will not find the context with the kernel priority
>>>>> in the kernel run queue anyway.
>>>>>
>>>>>>
>>>>>>>     			struct drm_sched_rq *rq = sched->sched_rq[i];
>>>>>>>     
>>>>>>>     			spin_lock(&rq->lock);
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>>>>>>> index 09d316bc3dfa..b868c794cc9d 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>>>>>> @@ -16,6 +16,24 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
>>>>>>>     	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
>>>>>>>     }
>>>>>>>     
>>>>>>> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>>>>>>> +{
>>>>>>> +	enum drm_sched_priority prio = -1;
>>>>>>> +	struct rb_node *rb;
>>>>>>
>>>>>> nit:
>>>>>> "node" might be a bitter name than rb. When iterating over a list we
>>>>>> also typically call the iterator sth like "head" and not "list".
>>>>>>
>>>>>> But no hard feelings on that change.
>>>>>
>>>>> I am following the convention from drm_sched_rq_select_entity_fifo() to
>>>>> avoid someone complaining I was diverging from the pattern established
>>>>> in the same file. ;)
>>>>
>>>> Don't worry, I will always cover your back against such people!
>>>>
>>>>>>> +
>>>>>>> +	lockdep_assert_held(&rq->lock);
>>>>>>> +
>>>>>>> +	rb = rb_first_cached(&rq->rb_tree_root);
>>>>>>> +	if (rb) {
>>>>>>> +		struct drm_sched_entity *entity =
>>>>>>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
>>>>>>> +
>>>>>>> +		prio = entity->priority; /* Unlocked read */
>>>>>>
>>>>>> Why an unlocked read? Why is that OK? The comment could detail that.
>>>>>
>>>>> Fair point, expanded the explanation.
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	rq->head_prio = prio;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>>>>>>     					    struct drm_sched_rq *rq)
>>>>>>>     {
>>>>>>> @@ -25,6 +43,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>>>>>>     	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>>>>>     		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>>>>>>     		RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>>>> +		drm_sched_rq_update_prio(rq);
>>>>>>>     	}
>>>>>>>     }
>>>>>>>     
>>>>>>> @@ -46,6 +65,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>>>>>     
>>>>>>>     	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>>>>>     		      drm_sched_entity_compare_before);
>>>>>>> +	drm_sched_rq_update_prio(rq);
>>>>>>>     }
>>>>>>>     
>>>>>>>     /**
>>>>>>> @@ -63,6 +83,114 @@ void drm_sched_rq_init(struct drm_sched_rq *rq,
>>>>>>>     	INIT_LIST_HEAD(&rq->entities);
>>>>>>>     	rq->rb_tree_root = RB_ROOT_CACHED;
>>>>>>>     	rq->sched = sched;
>>>>>>> +	rq->head_prio = -1;
>>>>>>
>>>>>> head_prio is an enum.
>>>>>>
>>>>>> Better to give the enum an entry like:
>>>>>>
>>>>>> PRIO_INVALID = -1,
>>>>>
>>>>> Ok.
>>>>>
>>>>>>
>>>>>>> +}
>>>>>>> +
>>>>>>> +static ktime_t
>>>>>>> +drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
>>>>>>> +{
>>>>>>> +	struct drm_sched_entity *entity;
>>>>>>> +	struct rb_node *rb;
>>>>>>> +
>>>>>>> +	lockdep_assert_held(&rq->lock);
>>>>>>> +
>>>>>>> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>>>>>>> +		entity = rb_entry(rb, typeof(*entity), rb_tree_node);
>>>>>>> +
>>>>>>> +		return entity->stats->vruntime; /* Unlocked read */
>>>>>>
>>>>>> Seems the read is unlocked because we just don't care about it racing?
>>>>>
>>>>> If there is a platform which tears ktime_t writes I suppose this could
>>>>> read garbage. I am not sure if there is. Perhaps safer to add the lock
>>>>> around it nevertheless.
>>>>
>>>> I think Sima (+cc) was very explicit about us never to implement our
>>>> own locking or synchronization primitives.
>>>
>>> Yeah, doing lockless just in case isn't great, especially if you're not
>>> really sure about the lkmm. I've done a full-lenght talk ranting about
>>> this all and 2 big blog posts, here's all the links:
>>>
>>> https://blog.ffwll.ch/2023/07/eoss-prague-locking-engineering.html
>>>
>>> The above discussion definitely doesn't inspire the cozy confidence that
>>> this is justified by perf data and engineered by people who know the
>>> ins&outs of how to do lockless stuff under the lkmm. And I know that the
>>> current drm/sched code plays a bit fast&loose in this regard, but we
>>> should try and at least not make things worse. Which means if we do decide
>>> that lockless is required here, it needs to be engineered and documented
>>> with the required utmost care to make sure it won't bite us too badly some
>>> random time in the future.
>>
>> There isn't any lockless algorithms here, nor any performance claims. It
>> is just a read of a ktime_t. I can add the _existing_ entity->stats lock
>> around it just as well for those warm and fuzzy feelings.
> 
> Tvrtko.
> This is not about anyone's feelings. It's about not adding undefined
> behavior. You cannot know whether these values you access locklessly
> will really be loaded each time / loaded correctly. You just literally
> admitted that yourself. Even if you knew, there could be a new

Yes, I even said two replies ago I will add the lock. In fact, it is 
write tearing which would be a problem on 32-bit architectures, not just 
read tearing.

But again, it is not a lockless algorithm and nowhere I am implementing 
a new locking primitive. So as much as my attempt to keep it light 
hearted with the warm and fuzzy feeling comment was a miss, I also think 
the whole long writeups afterwards about dangers of implementing own 
lockelss algorithms and performance were the same.

So lets move on, there is no argument here.

Tvrtko

> architecture in 3 years that loads tearingly. There could be a new
> "great" compiler optimization.
> 
> That's exactly why they designed atomic_t, which merely capsules an
> integer, which one could also "just read".
> 
> 
> Something like the issue with the runqueues not being locked for
> readers must *never* happen again in drm_sched (or elsewhere). We
> discussed that in our workshop at XDC. I think there was mutual
> agreement:
> 
> Always lock everything, and only use well defined and carefully
> engineered alternatives to locking when there is good justification.
> 
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> Not locking stuff that can get accessed asynchronously is just a hard
>>>> No-Go.
>>>>
>>>> That you access things here asynchronously is even more confusing
>>>> considering that in the kunit patch you explicitly add READ_ONCE() for
>>>> documentation purposes.
>>>>
>>>> Premature performance optimization is the root of all evil, and think
>>>> about the unlocked runqueue readers. 5 years down the road no one has
>>>> the slightest clue anymore what is supposed to be locked by whom and
>>>> accessed when and how.
>>>>
>>>> At XDC we had an entire room of highly experienced experts and we had
>>>> no clue anymore.
>>>>
>>>>
>>>> My need to establish in DRM that everything accessed by more than 1 CPU
>>>> at the same time always has to be locked.
>>>>
>>>> Alternatives (memory barriers, RCU, atomics, read once) are permitted
>>>> if one can give really good justification (performance measurements)
>>>> and can provide a clear and clean concept.
>>>>
>>>> I'd have to consult the C standard, but I think just reading from
>>>> something that is not an atomic might even be UB.
>>>>
>>>>
>>>> (That said, all platforms Linux runs on don't tear integers AFAIK.
>>>> Otherwise RCU couldn't work.)
>>>>
>>>>
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void
>>>>>>> +drm_sched_entity_save_vruntime(struct drm_sched_entity *entity,
>>>>>>> +			       ktime_t min_vruntime)
>>>>>>> +{
>>>>>>> +	struct drm_sched_entity_stats *stats = entity->stats;
>>>>>>
>>>>>> Unlocked read?
>>>>>
>>>>> This one isn't, entity->stats never changes from drm_sched_entity_init()
>>>>> to the end.
>>>>>
>>>>>>> +	ktime_t vruntime;
>>>>>>> +
>>>>>>> +	spin_lock(&stats->lock);
>>>>>>> +	vruntime = stats->vruntime;
>>>>>>> +	if (min_vruntime && vruntime > min_vruntime)
>>>>>>> +		vruntime = ktime_sub(vruntime, min_vruntime);
>>>>>>> +	else
>>>>>>> +		vruntime = 0;
>>>>>>> +	stats->vruntime = vruntime;
>>>>>>> +	spin_unlock(&stats->lock);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static ktime_t
>>>>>>> +drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
>>>>>>> +				  ktime_t min_vruntime,
>>>>>>> +				  enum drm_sched_priority rq_prio)
>>>>>>> +{
>>>>>>> +	struct drm_sched_entity_stats *stats = entity->stats;
>>>>>>> +	enum drm_sched_priority prio = entity->priority;
>>>>>>> +	ktime_t vruntime;
>>>>>>> +
>>>>>>> +	BUILD_BUG_ON(DRM_SCHED_PRIORITY_NORMAL < DRM_SCHED_PRIORITY_HIGH);
>>>>>>> +
>>>>>>> +	spin_lock(&stats->lock);
>>>>>>> +	vruntime = stats->vruntime;
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * Special handling for entities which were picked from the top of the
>>>>>>> +	 * queue and are now re-joining the top with another one already there.
>>>>>>> +	 */
>>>>>>> +	if (!vruntime && min_vruntime) {
>>>>>>> +		if (prio > rq_prio) {
>>>>>>> +			/*
>>>>>>> +			 * Lower priority should not overtake higher when re-
>>>>>>> +			 * joining at the top of the queue.
>>>>>>> +			 */
>>>>>>> +			vruntime = us_to_ktime(prio - rq_prio);
>>>>>>> +		} else if (prio < rq_prio) {
>>>>>>> +			/*
>>>>>>> +			 * Higher priority can go first.
>>>>>>> +			 */
>>>>>>> +			vruntime = -us_to_ktime(rq_prio - prio);
>>>>>>> +		}
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	/*
>>>>>>> +	 * Restore saved relative position in the queue.
>>>>>>> +	 */
>>>>>>> +	vruntime = ktime_add(min_vruntime, vruntime);
>>>>>>> +
>>>>>>> +	stats->vruntime = vruntime;
>>>>>>> +	spin_unlock(&stats->lock);
>>>>>>> +
>>>>>>> +	return vruntime;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
>>>>>>> +{
>>>>>>> +	static const unsigned int shift[] = {
>>>>>>> +		[DRM_SCHED_PRIORITY_KERNEL] = 1,
>>>>>>> +		[DRM_SCHED_PRIORITY_HIGH]   = 2,
>>>>>>> +		[DRM_SCHED_PRIORITY_NORMAL] = 4,
>>>>>>> +		[DRM_SCHED_PRIORITY_LOW]    = 7,
>>>>>>
>>>>>> Are those numbers copied from CPU CFS? Are they from an academic paper?
>>>>>> Or have you measured that these generate best results?
>>>>>>
>>>>>> Some hint about their background here would be nice.
>>>>>
>>>>> Finger in the air I'm afraid.
>>>>
>>>> You mean you just tried some numbers?
>>>>
>>>> That's OK, but you could state so here. In a nicer formulation.
>>>>
>>>>>>> +	};
>>>>>>> +	struct drm_sched_entity_stats *stats = entity->stats;
>>>>>>> +	ktime_t runtime, prev;
>>>>>>> +
>>>>>>> +	spin_lock(&stats->lock);
>>>>>>> +	prev = stats->prev_runtime;
>>>>>>> +	runtime = stats->runtime;
>>>>>>> +	stats->prev_runtime = runtime;
>>>>>>> +	runtime = ktime_add_ns(stats->vruntime,
>>>>>>> +			       ktime_to_ns(ktime_sub(runtime, prev)) <<
>>>>>>> +			       shift[entity->priority]);
>>>>>>> +	stats->vruntime = runtime;
>>>>>>> +	spin_unlock(&stats->lock);
>>>>>>> +
>>>>>>> +	return runtime;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static ktime_t drm_sched_entity_get_job_ts(struct drm_sched_entity *entity)
>>>>>>> +{
>>>>>>> +	return drm_sched_entity_update_vruntime(entity);
>>>>>>>     }
>>>>>>>     
>>>>>>>     /**
>>>>>>> @@ -99,8 +227,14 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
>>>>>>>     		list_add_tail(&entity->list, &rq->entities);
>>>>>>>     	}
>>>>>>>     
>>>>>>> -	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>>>>>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
>>>>>>> +		ts = drm_sched_rq_get_min_vruntime(rq);
>>>>>>> +		ts = drm_sched_entity_restore_vruntime(entity, ts,
>>>>>>> +						       rq->head_prio);
>>>>>>> +	} else if (drm_sched_policy == DRM_SCHED_POLICY_RR) {
>>>>>>>     		ts = entity->rr_ts;
>>>>>>> +	}
>>>>>>> +
>>>>>>>     	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>>>>>     
>>>>>>>     	spin_unlock(&rq->lock);
>>>>>>> @@ -173,7 +307,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>>>>>     	if (next_job) {
>>>>>>>     		ktime_t ts;
>>>>>>>     
>>>>>>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>>>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR)
>>>>>>> +			ts = drm_sched_entity_get_job_ts(entity);
>>>>>>> +		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>>>
>>>>>> Could the git diff here and above be kept smaller by reversing the
>>>>>> order of 'if' and 'else if'?
>>>>>
>>>>> Maybe but I liked having the best policy first. Can change if you want.
>>>>
>>>> It's optional.
>>>>
>>>>
>>>> P.
>>>>
>>>>>
>>>>>>
>>>>>>>     			ts = next_job->submit_ts;
>>>>>>>     		else
>>>>>>>     			ts = drm_sched_rq_get_rr_ts(rq, entity);
>>>>>>> @@ -181,6 +317,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>>>>>     		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>>>>>     	} else {
>>>>>>>     		drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>>>> +
>>>>>>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
>>>>>>> +			ktime_t min_vruntime;
>>>>>>> +
>>>>>>> +			min_vruntime = drm_sched_rq_get_min_vruntime(rq);
>>>>>>> +			drm_sched_entity_save_vruntime(entity, min_vruntime);
>>>>>>> +		}
>>>>>>>     	}
>>>>>>>     	spin_unlock(&rq->lock);
>>>>>>>     	spin_unlock(&entity->lock);
>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>> index 93d0b7224a57..bc25508a6ff6 100644
>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>> @@ -150,6 +150,11 @@ struct drm_sched_entity {
>>>>>>>     	 */
>>>>>>>     	enum drm_sched_priority         priority;
>>>>>>>     
>>>>>>> +	/**
>>>>>>> +	 * @rq_priority: Run-queue priority
>>>>>>> +	 */
>>>>>>> +	enum drm_sched_priority         rq_priority;
>>>>>>> +
>>>>>>
>>>>>> AFAIR that's just a temporary addition and will be simplified later.
>>>>>> Still, would probably be neat to be more obvious about why we now have
>>>>>> two priorities.
>>>>>>
>>>>>>>     	/**
>>>>>>>     	 * @rr_ts:
>>>>>>>     	 *
>>>>>>> @@ -254,10 +259,11 @@ struct drm_sched_entity {
>>>>>>>      * struct drm_sched_rq - queue of entities to be scheduled.
>>>>>>>      *
>>>>>>>      * @sched: the scheduler to which this rq belongs to.
>>>>>>> - * @lock: protects @entities, @rb_tree_root and @rr_ts.
>>>>>>> + * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
>>>>>>>      * @rr_ts: monotonically incrementing fake timestamp for RR mode
>>>>>>>      * @entities: list of the entities to be scheduled.
>>>>>>>      * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
>>>>>>> + * @head_prio: priority of the top tree element
>>>>>>>      *
>>>>>>>      * Run queue is a set of entities scheduling command submissions for
>>>>>>>      * one specific ring. It implements the scheduling policy that selects
>>>>>>> @@ -271,6 +277,7 @@ struct drm_sched_rq {
>>>>>>>     	ktime_t				rr_ts;
>>>>>>>     	struct list_head		entities;
>>>>>>>     	struct rb_root_cached		rb_tree_root;
>>>>>>> +	enum drm_sched_priority		head_prio;
>>>>>>>     };
>>>>>>>     
>>>>>>>     /**
>>>>>>> @@ -563,8 +570,10 @@ struct drm_sched_backend_ops {
>>>>>>>      * @credit_count: the current credit count of this scheduler
>>>>>>>      * @timeout: the time after which a job is removed from the scheduler.
>>>>>>>      * @name: name of the ring for which this scheduler is being used.
>>>>>>> - * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
>>>>>>> - *           as there's usually one run-queue per priority, but could be less.
>>>>>>> + * @num_user_rqs: Number of run-queues. This is at most
>>>>>>> + *                DRM_SCHED_PRIORITY_COUNT, as there's usually one run-queue per
>>>>>>> + *                priority, but could be less.
>>>>>>> + * @num_rqs: Equal to @num_user_rqs for FIFO and RR and 1 for the FAIR policy.
>>>>>>
>>>>>> Alright, so that seems to be what I was looking for above?
>>>>>
>>>>> Yep.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>>      * @sched_rq: An allocated array of run-queues of size @num_rqs;
>>>>>>>      * @job_scheduled: once drm_sched_entity_flush() is called the scheduler
>>>>>>>      *                 waits on this wait queue until all the scheduled jobs are
>>>>>>> @@ -597,6 +606,7 @@ struct drm_gpu_scheduler {
>>>>>>>     	long				timeout;
>>>>>>>     	const char			*name;
>>>>>>>     	u32                             num_rqs;
>>>>>>> +	u32                             num_user_rqs;
>>>>>>>     	struct drm_sched_rq             **sched_rq;
>>>>>>>     	wait_queue_head_t		job_scheduled;
>>>>>>>     	atomic64_t			job_id_count;
>>>>>>
>>>>>
>>>>
>>>
>>
> 

