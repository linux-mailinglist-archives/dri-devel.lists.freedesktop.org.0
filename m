Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21ED2949D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 00:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F5510E1D7;
	Thu, 15 Jan 2026 23:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LOaHEImT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E7A10E0CA;
 Thu, 15 Jan 2026 23:39:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D0ED41693;
 Thu, 15 Jan 2026 23:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719FDC19421;
 Thu, 15 Jan 2026 23:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768520381;
 bh=3JiyNGzTys16K1FWykJONQxbUbCf3Nhf51CJwNfUhfY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=LOaHEImTAjhcwOF8ipaWO60Ro7uVod5DwScwiy9mnQoZDOU0NJHxCvGFpGPrHVeAX
 A3FAo76msDuboOpCP7uWRc9MoL4rky4s+RecpeHxBcSehYgxq7QB/FLoin6FOu4rl9
 kP+VGePGZRpH3GF7lCSnDT2ZhiHs1rKBShdqGypRwQdaSmh9iCyNuCh8AgocNGRxKT
 34AlLlUCzsXMPRnoclQyktSb+jfAFjJ07uxCsZ0YBsYp8BOxDsHSJg9d4Av3pDs1b1
 aCT+gs3D/MtgR12bX4/gYOuTYVVRUyu9mH2S2QjJtuyvzZfdbqcZy5QngC6o+CqTEW
 vtnrDcvOe8t/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 00:39:37 +0100
Message-Id: <DFPK5HIP7G9C.2LJ6AOH2UPLEO@kernel.org>
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>, "Pierre-Eric Pelloux-Prayer"
 <pierre-eric.pelloux-prayer@amd.com>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
 <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
 <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
 <DFP4XVVKNIRC.2O817MGMKCQ3P@kernel.org>
 <7b1d848c-a0e3-4960-94da-4f9001c1d96f@igalia.com>
In-Reply-To: <7b1d848c-a0e3-4960-94da-4f9001c1d96f@igalia.com>
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

On Thu Jan 15, 2026 at 2:00 PM CET, Tvrtko Ursulin wrote:
> On 15/01/2026 11:44, Danilo Krummrich wrote:
>> On Thu Jan 15, 2026 at 9:28 AM CET, Tvrtko Ursulin wrote:
>>>
>>> On 14/01/2026 22:13, Danilo Krummrich wrote:
>>>> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/s=
cheduler/sched_rq.c
>>>>> index 2d1f579d8352..2fde309d02a6 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>>>> @@ -16,6 +16,35 @@ drm_sched_entity_compare_before(struct rb_node *a,=
 const struct rb_node *b)
>>>>>    	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waitin=
g);
>>>>>    }
>>>>>   =20
>>>>> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>>>>> +{
>>>>> +	enum drm_sched_priority prio =3D DRM_SCHED_PRIORITY_INVALID;
>>>>> +	struct rb_node *rb;
>>>>> +
>>>>> +	lockdep_assert_held(&rq->lock);
>>>>> +
>>>>> +	rb =3D rb_first_cached(&rq->rb_tree_root);
>>>>> +	if (rb) {
>>>>> +		struct drm_sched_entity *entity =3D
>>>>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
>>>>> +
>>>>> +		/*
>>>>> +		 * The normal locking order is entity then run-queue so taking
>>>>> +		 * the entity lock here would be a locking inversion for the
>>>>> +		 * case when the current head of the run-queue is different from
>>>>> +		 * the one we already have locked. The unlocked read is fine
>>>>> +		 * though, because if the priority had just changed it is no big
>>>>> +		 * deal for our algorithm, but just a transient reachable only
>>>>> +		 * by drivers with userspace dynamic priority changes API. Equal
>>>>> +		 * in effect to the priority change becoming visible a few
>>>>> +		 * instructions later.
>>>>> +		 */
>>>>> +		prio =3D READ_ONCE(entity->priority);
>>>>
>>>> I still think that we should address the root cause of the lock invers=
ion
>>>> problem instead.
>>>>
>>>> I previously mentioned that I can take a look at this beginning of thi=
s year,
>>>> which I can do soon.
>>>>
>>>> In the meantime, can you please explain what's the problem with this s=
pecific
>>>> case? This function is only ever called from drm_sched_rq_remove_fifo_=
locked()
>>>> and drm_sched_rq_update_fifo_locked(), which already seem to hold both=
 locks.
>>>
>>> The entity which is locked is likely not the same as entity at the head
>>> of the run-queue from either call chains.
>>>
>>> In one case we have just removed the locked entity from the run-queue,
>>> while in the other tree has been re-balanced so a different entity may
>>> have taken the head position.
>>=20
>> Ick! That makes it even worse because this would mean that even if we wo=
uld be
>> able to take the entity lock here, this is also prone to lock inversion =
between
>> entities.
>
> Not sure what you mean by also an even worse? It is the same entity->rq=
=20
> vs rq->entity lock order inversion. What other inversion is there?

drm_sched_rq_update_prio() is only ever called in call paths where the rq l=
ock
and *some* entity lock is already taken. Now, you are saying that the entit=
y we
update the priority for might be a different one -- *might* be. This has tw=
o
implications, if this entity would not have a lock inversion with the rq an=
d we
could take the lock:

  (1) It could be that we try to take the same entity lock again.

  (2) In another call path it could happen that the order of the two entity
      locks is inverted.

Maybe there is some subtlety why this could actually not happen. But even i=
f,
building on top of more and more subtleties doesn't sound like a great
maintainance approach. :)

>> I.e. that is a huge indicator that it is even more necessary to revisit =
locking
>> design in general.
>>=20
>>> Also to note is 99% of cases entity->priority is invariant. Only amdgpu
>>> allows for change of priority post entity creation. So for the rest
>>> locking would not gain anything.
>>>
>>> Even for amdgpu the unlocked read is not very relevant, since the only
>>> thing this is used is to determine the run-queue insertion position of =
a
>>> re-joining entity. So worst thing that could happen, if userspace threa=
d
>>> would race set priority with the job worker picking the next job, is to
>>> *one time* pick a different job.
>>=20
>> I get that; it is less that dealing with the priority field by itself is=
 a huge
>> issue we can't handle, it is more that the above workaround clearly poin=
ts out a
>> (locking) design issue, which we should not ignore. It's not only about =
code
>> the code working or being correct, it's also about maintainability.
>>=20
>> (Even though I'm aware that DRM scheduler maintainability is a bit the D=
RM
>> equivalent of the infamous 3x+1 problem. :)
>>=20
>>> Also to address the root cause of the lock inversion would IMHO be to
>>> re-design the whole scheduler and this specific function here does not
>>> seem should be the trigger for that.
>>=20
>> I'm not sure it is that bad, let me take a look in the next days and see=
 what
>> options we have.
>
> Okay but I am sure you know there are memory barriers, RCU, SPSC queue,=
=20
> completions, worker management, and at least two locks, and everything=20
> is interdependent.

I am, and I couldn't describe the maintainance burden of the scheduler any
better. :)

> This series at least removes a bunch of code without making things more
> complicated and so can be a good base for further rework. If you suggest =
to
> hold it until all of the above is resolved it will be a few more years ea=
sily.

Let me explain a bit where I'm coming from:

From a maintainer perspective - without saying that things are either black=
 or
white - I'm assessing contributors and contributions on whether the intenti=
on is
to improve the infrastructure in terms of design and maintainability or whe=
ther
the main intention is to "just" get a certain feature merged.

While both are valuable contributions that are appreciated, contributions t=
hat
have a tendency into the latter direction, have to be seen with more scepti=
sism.

Especially when the code base already has known design issues, bulding feat=
ures
on top is very dangerous. Not necessarily because the resulting code might =
be
wrong or because of regressions, etc. But because it most likely increases =
the
difficulty resolving the existing issues -- in the worst case leading to a =
dead
end.

Having that said, I am not saying that you "just" try to get your feature m=
erged
no matter what. Quite the opposite, I very much appreciate your contributio=
ns to
the scheduler and recognize the cleanup work you are doing.

However, for this series I require you to acknowledge that, even if correct=
,
some of this code introduces additional workarounds due to existing design
issues, locking and synchronization subtleties that should be solved in bet=
ter
ways.

I have no objections going ahead with this series if we are on the same pag=
e
regarding this and you are willing to also help out fixing those underlying
design issues, locking and synchronization quirks, etc. subsequently.

But if you are more leaning in the direction of "I don't see an issue overa=
ll,
the code is correct!" I do have concerns.

Improving the situation with the scheduler is the fundamental reason why Ph=
ilipp
and me were stepping up as maintainers, Philipp being more of the active pa=
rt
(doing a great job) and me working more in the background, helping and ment=
oring
him.

Believe me when I say that we want this to move forward, but we also have t=
o
ensure that we are not making a step into the direction of increasing the
difficulty to solve the underlying issues.

So, again, if we are on the same page with this, no objections from my side=
.

- Danilo
