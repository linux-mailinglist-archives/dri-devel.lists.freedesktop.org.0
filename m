Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6BD24416
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 12:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E78310E73E;
	Thu, 15 Jan 2026 11:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oi7JGdzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B0310E11C;
 Thu, 15 Jan 2026 11:44:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AFDB443BAF;
 Thu, 15 Jan 2026 11:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E30AC116D0;
 Thu, 15 Jan 2026 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768477468;
 bh=us7oGf8s7A31Hz7qsGcqOwfc6BdegtJ5RHsN+2wnK5U=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=oi7JGdzUlFzP/FMb8kEp7Q105WqQ3FGFR+OkCz/Ch/V8YuaGIEpFfY4ky1/60h3UV
 fDPQi9zXutKdJ05VDGVpkzEyHXaEF0zI4rGFfQQ+3eb3mF4AOIs/7eqsZINDkexlhw
 60co1YZ3+XOwVoGLNwjo9h7610r0H4WtBBCifZPJ4Y/TMG3Z7FxCOMdtqeLaEWaPBS
 G62WW0HWvlV81CSZENm6c0hcThYR4/eF9Ow1BJRBikeyCKIenFKAZTba5iuUNCDAKp
 7grboJso5ANcb/AGRkSiLKxts9tJIZiVyKMjqHKge3swMhy1dkXEYYAKsjcecStkxn
 mQzHUddP2dwyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jan 2026 12:44:25 +0100
Message-Id: <DFP4XVVKNIRC.2O817MGMKCQ3P@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 09/28] drm/sched: Add fair scheduling policy
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>, "Pierre-Eric Pelloux-Prayer"
 <pierre-eric.pelloux-prayer@amd.com>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
 <20251219135351.25880-10-tvrtko.ursulin@igalia.com>
 <DFONORJMB1ZM.1JHSIXB9ULHJV@kernel.org>
 <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
In-Reply-To: <1fceb644-ff22-45c8-bd83-4a32786c35f2@igalia.com>
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

On Thu Jan 15, 2026 at 9:28 AM CET, Tvrtko Ursulin wrote:
>
> On 14/01/2026 22:13, Danilo Krummrich wrote:
>> On Fri Dec 19, 2025 at 2:53 PM CET, Tvrtko Ursulin wrote:
>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sch=
eduler/sched_rq.c
>>> index 2d1f579d8352..2fde309d02a6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>> @@ -16,6 +16,35 @@ drm_sched_entity_compare_before(struct rb_node *a, c=
onst struct rb_node *b)
>>>   	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
>>>   }
>>>  =20
>>> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>>> +{
>>> +	enum drm_sched_priority prio =3D DRM_SCHED_PRIORITY_INVALID;
>>> +	struct rb_node *rb;
>>> +
>>> +	lockdep_assert_held(&rq->lock);
>>> +
>>> +	rb =3D rb_first_cached(&rq->rb_tree_root);
>>> +	if (rb) {
>>> +		struct drm_sched_entity *entity =3D
>>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
>>> +
>>> +		/*
>>> +		 * The normal locking order is entity then run-queue so taking
>>> +		 * the entity lock here would be a locking inversion for the
>>> +		 * case when the current head of the run-queue is different from
>>> +		 * the one we already have locked. The unlocked read is fine
>>> +		 * though, because if the priority had just changed it is no big
>>> +		 * deal for our algorithm, but just a transient reachable only
>>> +		 * by drivers with userspace dynamic priority changes API. Equal
>>> +		 * in effect to the priority change becoming visible a few
>>> +		 * instructions later.
>>> +		 */
>>> +		prio =3D READ_ONCE(entity->priority);
>>=20
>> I still think that we should address the root cause of the lock inversio=
n
>> problem instead.
>>=20
>> I previously mentioned that I can take a look at this beginning of this =
year,
>> which I can do soon.
>>=20
>> In the meantime, can you please explain what's the problem with this spe=
cific
>> case? This function is only ever called from drm_sched_rq_remove_fifo_lo=
cked()
>> and drm_sched_rq_update_fifo_locked(), which already seem to hold both l=
ocks.
>
> The entity which is locked is likely not the same as entity at the head=
=20
> of the run-queue from either call chains.
>
> In one case we have just removed the locked entity from the run-queue,=20
> while in the other tree has been re-balanced so a different entity may=20
> have taken the head position.

Ick! That makes it even worse because this would mean that even if we would=
 be
able to take the entity lock here, this is also prone to lock inversion bet=
ween
entities.

I.e. that is a huge indicator that it is even more necessary to revisit loc=
king
design in general.

> Also to note is 99% of cases entity->priority is invariant. Only amdgpu=
=20
> allows for change of priority post entity creation. So for the rest=20
> locking would not gain anything.
>
> Even for amdgpu the unlocked read is not very relevant, since the only=20
> thing this is used is to determine the run-queue insertion position of a=
=20
> re-joining entity. So worst thing that could happen, if userspace thread=
=20
> would race set priority with the job worker picking the next job, is to=
=20
> *one time* pick a different job.

I get that; it is less that dealing with the priority field by itself is a =
huge
issue we can't handle, it is more that the above workaround clearly points =
out a
(locking) design issue, which we should not ignore. It's not only about cod=
e
the code working or being correct, it's also about maintainability.

(Even though I'm aware that DRM scheduler maintainability is a bit the DRM
equivalent of the infamous 3x+1 problem. :)

> Also to address the root cause of the lock inversion would IMHO be to=20
> re-design the whole scheduler and this specific function here does not=20
> seem should be the trigger for that.

I'm not sure it is that bad, let me take a look in the next days and see wh=
at
options we have.
