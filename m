Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A6B0C10C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 12:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F117910E26A;
	Mon, 21 Jul 2025 10:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jHUZbcdG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3156F10E26A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 10:14:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5F9C41816;
 Mon, 21 Jul 2025 10:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3502C4CEED;
 Mon, 21 Jul 2025 10:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753092875;
 bh=ETu8KpCEGzAKbdZ8gkiUUREkFwgiR/4pTO1+nAPNLgA=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=jHUZbcdG1rf4AW7gjQ5sVONiWRCYWOMptP8kv9M0gDoOHoABgCSZk8JJB4ZmEIMxP
 z1GBUldg3bdAB6LxDBca5BP1Uqp4GYfvUSz43adzS5NRidmP5rh5RPOmAx3aL16VlT
 I4K/d5qDIzcYmNU1XodnduRI8/yRzm1mXCVsNPRf4e5zlATa5iBg85iFjDWmUcCIu5
 3DIIo9XQHDPveIySryO6427HHKJGYNcYHyDouKi+YeDsezFiRrUQAmkBQV8oItDXet
 Irmg6iw8ck3sNRfm+yK1LVJryA+HvOBc1beMwvGkOnNv3bs+JSOs38ztYQnhI+6Ydr
 rElpqKGcbY0Fg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 12:14:31 +0200
Message-Id: <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
Cc: <phasta@kernel.org>, "James Flowers" <bold.zone2373@fastmail.com>,
 <matthew.brost@intel.com>, <ckoenig.leichtzumerken@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
In-Reply-To: <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
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

On Mon Jul 21, 2025 at 10:16 AM CEST, Philipp Stanner wrote:
> On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
>> On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
>> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/=
scheduler/sched_main.c
>> > index bfea608a7106..997a2cc1a635 100644
>> > --- a/drivers/gpu/drm/scheduler/sched_main.c
>> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_s=
ched_entity *entity,
>> > =C2=A0
>> > =C2=A0	entity->oldest_job_waiting =3D ts;
>> > =C2=A0
>> > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
>> > +	if (!entity->stopped) {
>> > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
>> > +	}
>>=20
>> If this is a race, then this patch here is broken, too, because you're
>> checking the 'stopped' boolean as the callers of that function do, too
>> =E2=80=93 just later. :O
>>=20
>> Could still race, just less likely.
>>=20
>> The proper way to fix it would then be to address the issue where the
>> locking is supposed to happen. Let's look at, for example,
>> drm_sched_entity_push_job():
>>=20
>>=20
>> void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>> {
>> 	(Bla bla bla)
>>=20
>> =C2=A0	=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6
>>=20
>> 	/* first job wakes up scheduler */
>> 	if (first) {
>> 		struct drm_gpu_scheduler *sched;
>> 		struct drm_sched_rq *rq;
>>=20
>> 		/* Add the entity to the run queue */
>> 		spin_lock(&entity->lock);
>> 		if (entity->stopped) {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <---- Aha!
>> 			spin_unlock(&entity->lock);
>>=20
>> 			DRM_ERROR("Trying to push to a killed entity\n");
>> 			return;
>> 		}
>>=20
>> 		rq =3D entity->rq;
>> 		sched =3D rq->sched;
>>=20
>> 		spin_lock(&rq->lock);
>> 		drm_sched_rq_add_entity(rq, entity);
>>=20
>> 		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
>> 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!
>>=20
>> 		spin_unlock(&rq->lock);
>> 		spin_unlock(&entity->lock);
>>=20
>> But the locks are still being hold. So that "shouldn't be happening"(tm)=
.
>>=20
>> Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
>> stop entities. The former holds appropriate locks, but drm_sched_fini()
>> doesn't. So that looks like a hot candidate to me. Opinions?
>>=20
>> On the other hand, aren't drivers prohibited from calling
>> drm_sched_entity_push_job() after calling drm_sched_fini()? If the
>> fuzzer does that, then it's not the scheduler's fault.

Exactly, this is the first question to ask.

And I think it's even more restrictive:

In drm_sched_fini()

	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
		struct drm_sched_rq *rq =3D sched->sched_rq[i];

		spin_lock(&rq->lock);
		list_for_each_entry(s_entity, &rq->entities, list)
			/*
			 * Prevents reinsertion and marks job_queue as idle,
			 * it will be removed from the rq in drm_sched_entity_fini()
			 * eventually
			 */
			s_entity->stopped =3D true;
		spin_unlock(&rq->lock);
		kfree(sched->sched_rq[i]);
	}

In drm_sched_entity_kill()

	static void drm_sched_entity_kill(struct drm_sched_entity *entity)
	{
		struct drm_sched_job *job;
		struct dma_fence *prev;

		if (!entity->rq)
			return;

		spin_lock(&entity->lock);
		entity->stopped =3D true;
		drm_sched_rq_remove_entity(entity->rq, entity);
		spin_unlock(&entity->lock);

		[...]
	}

If this runs concurrently, this is a UAF as well.

Personally, I have always been working with the assupmtion that entites hav=
e to
be torn down *before* the scheduler, but those lifetimes are not documented
properly.

There are two solutions:

  (1) Strictly require all entities to be torn down before drm_sched_fini()=
,
      i.e. stick to the natural ownership and lifetime rules here (see belo=
w).

  (2) Actually protect *any* changes of the relevent fields of the entity
      structure with the entity lock.

While (2) seems rather obvious, we run into lock inversion with this approa=
ch,
as you note below as well. And I think drm_sched_fini() should not mess wit=
h
entities anyways.

The ownership here seems obvious:

The scheduler *owns* a resource that is used by entities. Consequently, ent=
ities
are not allowed to out-live the scheduler.

Surely, the current implementation to just take the resource away from the
entity under the hood can work as well with appropriate locking, but that's=
 a
mess.

If the resource *really* needs to be shared for some reason (which I don't =
see),
shared ownership, i.e. reference counting, is much less error prone.
