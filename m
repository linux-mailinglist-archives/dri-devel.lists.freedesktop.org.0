Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC45B0D35E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA18D10E604;
	Tue, 22 Jul 2025 07:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="dOtFOwV2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4106B10E604
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 07:37:20 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bmTcY17jTz9tCQ;
 Tue, 22 Jul 2025 09:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1753169837; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2bLNMdIPfKO4SCOWzbgq6cW49X1f449Ft9JQplmrnM=;
 b=dOtFOwV2s+2zqp8anZO/A3wt55S5GA+OUOdwddJkA6Xjqamo+BQst4UfQ1JL6TSjS2sZWp
 hSn/PbC0KPmuOmrOM1dn+j7gU6WDQXF86SLej4or0iuiYXKr83IAVO06VaE5JEtdIhutRA
 7iIjLWAu4hlySiyyiRVjhYrK29/pHSHdDUzG+dHFCl6jGwZ2AcKK4kZ+c3ipQ8AS8UDOda
 ANr40iGCENe9NWv9sO9/iDNOuyUoHYIB0aNCliEseREeYj6OZHwTMfL2p0voQPmoXVM/QA
 HRmqPZf2SiZdS/23U9Cqow6eIx8X5zxQFEi7KbVC3M262lc2LGI2JEg04IGK4A==
Message-ID: <80f569dd3c42f11927324ea80e7c14ac2d3352b5.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, James Flowers <bold.zone2373@fastmail.com>, 
 ckoenig.leichtzumerken@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch,  skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Date: Tue, 22 Jul 2025 09:37:11 +0200
In-Reply-To: <aH6B7JruWCkReaLw@lstrano-desk.jf.intel.com>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
 <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
 <aH6B7JruWCkReaLw@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 41a315498ead22c9c49
X-MBO-RS-META: pxs98gsf34wnustn6xmuyoea4zjoi7m8
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-07-21 at 11:07 -0700, Matthew Brost wrote:
> On Mon, Jul 21, 2025 at 12:14:31PM +0200, Danilo Krummrich wrote:
> > On Mon Jul 21, 2025 at 10:16 AM CEST, Philipp Stanner wrote:
> > > On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
> > > > On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu=
/drm/scheduler/sched_main.c
> > > > > index bfea608a7106..997a2cc1a635 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct =
drm_sched_entity *entity,
> > > > > =C2=A0
> > > > > =C2=A0	entity->oldest_job_waiting =3D ts;
> > > > > =C2=A0
> > > > > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before=
);
> > > > > +	if (!entity->stopped) {
> > > > > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_befor=
e);
> > > > > +	}
> > > >=20
> > > > If this is a race, then this patch here is broken, too, because you=
're
> > > > checking the 'stopped' boolean as the callers of that function do, =
too
> > > > =E2=80=93 just later. :O
> > > >=20
> > > > Could still race, just less likely.
> > > >=20
> > > > The proper way to fix it would then be to address the issue where t=
he
> > > > locking is supposed to happen. Let's look at, for example,
> > > > drm_sched_entity_push_job():
> > > >=20
> > > >=20
> > > > void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> > > > {
> > > > 	(Bla bla bla)
> > > >=20
> > > > =C2=A0	=E2=80=A6=E2=80=A6=E2=80=A6=E2=80=A6
> > > >=20
> > > > 	/* first job wakes up scheduler */
> > > > 	if (first) {
> > > > 		struct drm_gpu_scheduler *sched;
> > > > 		struct drm_sched_rq *rq;
> > > >=20
> > > > 		/* Add the entity to the run queue */
> > > > 		spin_lock(&entity->lock);
> > > > 		if (entity->stopped) {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <---- Aha!
> > > > 			spin_unlock(&entity->lock);
> > > >=20
> > > > 			DRM_ERROR("Trying to push to a killed entity\n");
> > > > 			return;
> > > > 		}
> > > >=20
> > > > 		rq =3D entity->rq;
> > > > 		sched =3D rq->sched;
> > > >=20
> > > > 		spin_lock(&rq->lock);
> > > > 		drm_sched_rq_add_entity(rq, entity);
> > > >=20
> > > > 		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > > 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bu=
mm!
> > > >=20
> > > > 		spin_unlock(&rq->lock);
> > > > 		spin_unlock(&entity->lock);
> > > >=20
> > > > But the locks are still being hold. So that "shouldn't be happening=
"(tm).
> > > >=20
> > > > Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini=
()
> > > > stop entities. The former holds appropriate locks, but drm_sched_fi=
ni()
> > > > doesn't. So that looks like a hot candidate to me. Opinions?
> > > >=20
> > > > On the other hand, aren't drivers prohibited from calling
> > > > drm_sched_entity_push_job() after calling drm_sched_fini()? If the
> > > > fuzzer does that, then it's not the scheduler's fault.
> >=20
> > Exactly, this is the first question to ask.
> >=20
> > And I think it's even more restrictive:
> >=20
> > In drm_sched_fini()
> >=20
> > 	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > 		struct drm_sched_rq *rq =3D sched->sched_rq[i];
> >=20
> > 		spin_lock(&rq->lock);
> > 		list_for_each_entry(s_entity, &rq->entities, list)
> > 			/*
> > 			 * Prevents reinsertion and marks job_queue as idle,
> > 			 * it will be removed from the rq in drm_sched_entity_fini()
> > 			 * eventually
> > 			 */
> > 			s_entity->stopped =3D true;
> > 		spin_unlock(&rq->lock);
> > 		kfree(sched->sched_rq[i]);
> > 	}
> >=20
> > In drm_sched_entity_kill()
> >=20
> > 	static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> > 	{
> > 		struct drm_sched_job *job;
> > 		struct dma_fence *prev;
> >=20
> > 		if (!entity->rq)
> > 			return;
> >=20
> > 		spin_lock(&entity->lock);
> > 		entity->stopped =3D true;
> > 		drm_sched_rq_remove_entity(entity->rq, entity);
> > 		spin_unlock(&entity->lock);
> >=20
> > 		[...]
> > 	}
> >=20
> > If this runs concurrently, this is a UAF as well.
> >=20
> > Personally, I have always been working with the assupmtion that entites=
 have to
> > be torn down *before* the scheduler, but those lifetimes are not docume=
nted
> > properly.
>=20
> Yes, this is my assumption too. I would even take it further: an entity
> shouldn't be torn down until all jobs associated with it are freed as
> well. I think this would solve a lot of issues I've seen on the list
> related to UAF, teardown, etc.

That's kind of impossible with the new tear down design, because
drm_sched_fini() ensures that all jobs are freed on teardown. And
drm_sched_fini() wouldn't be called before all jobs are gone,
effectively resulting in a chicken-egg-problem, or rather: the driver
implementing its own solution for teardown.

P.


>=20
> >=20
> > There are two solutions:
> >=20
> > =C2=A0 (1) Strictly require all entities to be torn down before drm_sch=
ed_fini(),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i.e. stick to the natural ownership and =
lifetime rules here (see below).
> >=20
> > =C2=A0 (2) Actually protect *any* changes of the relevent fields of the=
 entity
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 structure with the entity lock.
> >=20
> > While (2) seems rather obvious, we run into lock inversion with this ap=
proach,
> > as you note below as well. And I think drm_sched_fini() should not mess=
 with
> > entities anyways.
> >=20
> > The ownership here seems obvious:
> >=20
> > The scheduler *owns* a resource that is used by entities. Consequently,=
 entities
> > are not allowed to out-live the scheduler.
> >=20
> > Surely, the current implementation to just take the resource away from =
the
> > entity under the hood can work as well with appropriate locking, but th=
at's a
> > mess.
> >=20
> > If the resource *really* needs to be shared for some reason (which I do=
n't see),
> > shared ownership, i.e. reference counting, is much less error prone.
>=20
> Yes, Xe solves all of this via reference counting (jobs refcount the
> entity). It's a bit easier in Xe since the scheduler and entities are
> the same object due to their 1:1 relationship. But even in non-1:1
> relationships, an entity could refcount the scheduler. The teardown
> sequence would then be: all jobs complete on the entity =E2=86=92 teardow=
n the
> entity =E2=86=92 all entities torn down =E2=86=92 teardown the scheduler.
>=20
> Matt

