Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB04BFA5E7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08E310E6C2;
	Wed, 22 Oct 2025 06:57:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Sg6TLUDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F26510E6C2;
 Wed, 22 Oct 2025 06:57:08 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cs0Mh5Dxpz9t7p;
 Wed, 22 Oct 2025 08:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761116224; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AIP5fB2IN7lemacuiDksTOGrPz0IXUOa/XX+96Fju9Q=;
 b=Sg6TLUDcI6q2vbAw4t/U/4YdMxRhV9pjFWoIfZxhcg1xMHfQNingdj8cyRgEuR3iy9dTLq
 SxcSwrZJkbDHnr4Qrk7dTt3Rj1g3mwmKnNHBqVJ5QdphP4rw6RhGC+fMbWAz/AE601mMnI
 2jD315F3EfJa6CqtBOEVa1jY6AoXA5aT4n/7Ddy+ChuMma6BsLtoTv9CemYAHTkDJ2fJko
 9CJuBTHIrw/5rwx4gLnffBDkEgELKujOyS0xw/s6Wm4wd6MFZL81UdkSBYbbuZmoFzjc0J
 p1lRwm4tH416ncKf7JWmORmLDM5JejE0t8USRBUFx0J4FuG7kq1HHzMKnYK9Rg==
Message-ID: <df3fa9d1893c3bd2a2b6de73613b26a3b8ed3d55.camel@mailbox.org>
Subject: Re: [PATCH v2 09/27] drm/sched: Add fair scheduling policy
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Date: Wed, 22 Oct 2025 08:56:59 +0200
In-Reply-To: <a6a6e8da-e1ae-44c4-a34f-c684a441ffca@igalia.com>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
 <20251017133644.44747-10-tvrtko.ursulin@igalia.com>
 <2f1eb1943d4d6a7185391e6d35e9c5d9818649da.camel@mailbox.org>
 <a6a6e8da-e1ae-44c4-a34f-c684a441ffca@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1bca62db929b4473e99
X-MBO-RS-META: cotexgp5p78k1fhc8p4mw1s9yckycjia
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

On Mon, 2025-10-20 at 15:39 +0100, Tvrtko Ursulin wrote:
>=20
> On 20/10/2025 14:57, Philipp Stanner wrote:
> > On Fri, 2025-10-17 at 14:36 +0100, Tvrtko Ursulin wrote:
> > > The FAIR scheduling policy is built upon the same concepts as the wel=
l
> > > known CFS CPU scheduler - entity run queue is sorted by the virtual G=
PU
> > > time consumed by entities in a way that the entity with least vruntim=
e
> > > runs first.
> > >=20
> > > It is able to avoid total priority starvation, which is one of the
> > > problems with FIFO, and it also does not need for per priority run qu=
eues.
> > > As it scales the actual GPU runtime by an exponential factor as the
> > > priority decreases, the virtual runtime for low priority entities gro=
ws
> > > faster than for normal priority, pushing them further down the runque=
ue
> > > order for the same real GPU time spent.
> > >=20
> > > Apart from this fundamental fairness, fair policy is especially stron=
g in
> > > oversubscription workloads where it is able to give more GPU time to =
short
> > > and bursty workloads when they are running in parallel with GPU heavy
> > > clients submitting deep job queues.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 |=C2=
=A0 28 ++--
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0=C2=A0 =
5 +
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 166 ++++++++++++++++++++-
> > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> > > =C2=A0=C2=A05 files changed, 207 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index 565eddebb667..4144a97702a5 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -107,6 +107,8 @@ int drm_sched_entity_init(struct drm_sched_entity=
 *entity,
> > > =C2=A0=C2=A0	entity->guilty =3D guilty;
> > > =C2=A0=C2=A0	entity->num_sched_list =3D num_sched_list;
> > > =C2=A0=C2=A0	entity->priority =3D priority;
> > > +	entity->rq_priority =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FA=
IR ?
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL : priori=
ty;
> > > =C2=A0=C2=A0	/*
> > > =C2=A0=C2=A0	 * It's perfectly valid to initialize an entity without =
having a valid
> > > =C2=A0=C2=A0	 * scheduler attached. It's just not valid to use the sc=
heduler before it
> > > @@ -123,17 +125,23 @@ int drm_sched_entity_init(struct drm_sched_enti=
ty *entity,
> > > =C2=A0=C2=A0		 */
> > > =C2=A0=C2=A0		pr_warn("%s: called with uninitialized scheduler\n", __=
func__);
> > > =C2=A0=C2=A0	} else if (num_sched_list) {
> > > -		/* The "priority" of an entity cannot exceed the number of run-que=
ues of a
> > > -		 * scheduler. Protect against num_rqs being 0, by converting to si=
gned. Choose
> > > -		 * the lowest priority available.
> > > +		enum drm_sched_priority p =3D entity->priority;
> > > +
> > > +		/*
> > > +		 * The "priority" of an entity cannot exceed the number of
> > > +		 * run-queues of a scheduler. Protect against num_rqs being 0,
> > > +		 * by converting to signed. Choose the lowest priority
> > > +		 * available.
> > > =C2=A0=C2=A0		 */
> > > -		if (entity->priority >=3D sched_list[0]->num_rqs) {
> > > -			dev_err(sched_list[0]->dev, "entity has out-of-bounds priority: %=
u. num_rqs: %u\n",
> > > -				entity->priority, sched_list[0]->num_rqs);
> > > -			entity->priority =3D max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> > > -						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> > > +		if (p >=3D sched_list[0]->num_user_rqs) {
> > > +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%=
u num_user_rqs:%u\n",
> > > +				p, sched_list[0]->num_user_rqs);
> > > +			p =3D max_t(s32,
> > > +				 (s32)sched_list[0]->num_user_rqs - 1,
> > > +				 (s32)DRM_SCHED_PRIORITY_KERNEL);
> > > +			entity->priority =3D p;
> > > =C2=A0=C2=A0		}
> > > -		entity->rq =3D sched_list[0]->sched_rq[entity->priority];
> > > +		entity->rq =3D sched_list[0]->sched_rq[entity->rq_priority];
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	init_completion(&entity->entity_idle);
> > > @@ -566,7 +574,7 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&entity->lock);
> > > =C2=A0=C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity=
->num_sched_list);
> > > -	rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
> > > +	rq =3D sched ? sched->sched_rq[entity->rq_priority] : NULL;
> > > =C2=A0=C2=A0	if (rq !=3D entity->rq) {
> > > =C2=A0=C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> > > =C2=A0=C2=A0		entity->rq =3D rq;
> > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu=
/drm/scheduler/sched_internal.h
> > > index 9adad48ec084..593e380a2d59 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > @@ -12,6 +12,8 @@
> > > =C2=A0=C2=A0 * @kref: reference count for the object.
> > > =C2=A0=C2=A0 * @lock: lock guarding the @runtime updates.
> > > =C2=A0=C2=A0 * @runtime: time entity spent on the GPU.
> > > + * @prev_runtime: previous @runtime used to get the runtime delta.
> > > + * @vruntime: virtual runtime as accumulated by the fair algorithm.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Because jobs and entities have decoupled lifetimes, ie=
. we cannot access the
> > > =C2=A0=C2=A0 * entity once the job is completed and we know how much =
time it took on the
> > > @@ -22,6 +24,8 @@ struct drm_sched_entity_stats {
> > > =C2=A0=C2=A0	struct kref	kref;
> > > =C2=A0=C2=A0	spinlock_t	lock;
> > > =C2=A0=C2=A0	ktime_t		runtime;
> > > +	ktime_t		prev_runtime;
> > > +	ktime_t		vruntime;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0/* Used to choose between FIFO and RR job-scheduling */
> > > @@ -29,6 +33,7 @@ extern int drm_sched_policy;
> > > =C2=A0=20
> > > =C2=A0=C2=A0#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> > > =C2=A0=C2=A0#define DRM_SCHED_POLICY_FIFO=C2=A0 1
> > > +#define DRM_SCHED_POLICY_FAIR=C2=A0 2
> > > =C2=A0=20
> > > =C2=A0=C2=A0bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> > > =C2=A0=C2=A0			 struct drm_sched_entity *entity);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index 0c5f7a0594bf..74a155377561 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -90,7 +90,7 @@ int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> > > =C2=A0=C2=A0 * DOC: sched_policy (int)
> > > =C2=A0=C2=A0 * Used to override default entities scheduling policy in=
 a run queue.
> > > =C2=A0=C2=A0 */
> > > -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for en=
tities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin=
, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO (default).");
> > > +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for en=
tities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin=
, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO, " __stringify(DRM_SCHED_=
POLICY_FAIR) " =3D Fair (default).");
> > > =C2=A0=C2=A0module_param_named(sched_policy, drm_sched_policy, int, 0=
444);
> >=20
> > Wrong. This patch does not make Fair the default scheduling policy.
>=20
> Right, forgot about this when splitting out the "set fair as default"
> patch. Fixed locally.
>=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0static u32 drm_sched_available_credits(struct drm_gpu_sch=
eduler *sched)
> > > @@ -1133,11 +1133,14 @@ int drm_sched_init(struct drm_gpu_scheduler *=
sched, const struct drm_sched_init_
> > > =C2=A0=C2=A0		sched->own_submit_wq =3D true;
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	sched->sched_rq =3D kmalloc_array(args->num_rqs, sizeof(*sched->sch=
ed_rq),
> > > +	sched->num_user_rqs =3D args->num_rqs;
> > > +	sched->num_rqs =3D drm_sched_policy !=3D DRM_SCHED_POLICY_FAIR ?
> > > +			 args->num_rqs : 1;
> > > +	sched->sched_rq =3D kmalloc_array(sched->num_rqs, sizeof(*sched->sc=
hed_rq),
> > > =C2=A0=C2=A0					GFP_KERNEL | __GFP_ZERO);
> > > =C2=A0=C2=A0	if (!sched->sched_rq)
> > > =C2=A0=C2=A0		goto Out_check_own;
> > > -	sched->num_rqs =3D args->num_rqs;
> > > +
> > > =C2=A0=C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs=
; i++) {
> > > =C2=A0=C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[=
i]), GFP_KERNEL);
> > > =C2=A0=C2=A0		if (!sched->sched_rq[i])
> > > @@ -1279,7 +1282,7 @@ void drm_sched_increase_karma(struct drm_sched_=
job *bad)
> > > =C2=A0=C2=A0	if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
> > > =C2=A0=C2=A0		atomic_inc(&bad->karma);
> > > =C2=A0=20
> > > -		for (i =3D DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
> > > +		for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> > > =C2=A0=C2=A0			struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > > =C2=A0=20
> > > =C2=A0=C2=A0			spin_lock(&rq->lock);
> > > diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/s=
cheduler/sched_rq.c
> > > index 2d1f579d8352..b12d0f1859f0 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_rq.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> > > @@ -5,6 +5,8 @@
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include "sched_internal.h"
> > > =C2=A0=20
> > > +#define DRM_SCHED_PRIORITY_INVALID (-1) /* Do not want the enum visi=
ble outside. */
> >=20
> > Well nope, that's not what I had in mind at all =E2=80=93 there's no ha=
rm at
> > all by defining that in the real enum. Users know that "Invalid" is not
> > supposed to be used.
> >=20
> > Setting it as the starter with -1 in the enum will guarantee
> > correctness since the subsequent members will be numbered
> > incrementingly.
>=20
> It is correct to say drivers should not use it. Therefore we have two
> options.
>=20
> Option 1 - don't even show it to drivers which I chose for simplicity.
>=20
> Option 2 - add it to gpu_scheduler.h. Drivers can now use it so we'd=20
> have to add error checking to drm_sched_entity_init and=20
> drm_sched_entity_set_priority.

I just think that's more consistent. Sure, they could use it, but the
name and a little docstring "Internal initializer. Do not use." should
lift responsibility from our shoulders.

>=20
> Which is a bit is annoying since drm_sched_entity_set_priority has no
> error checking. We can add a warn on.
>=20
> Although I believe I did add error checking to it when I was proposing=
=20
> to fix the drm_sched_entity_init() sched_list container=20
> ownership/lifetime issue some time ago.

Is that patch still around?


> > > +
> > > =C2=A0=C2=A0static __always_inline bool
> > > =C2=A0=C2=A0drm_sched_entity_compare_before(struct rb_node *a, const =
struct rb_node *b)
> > > =C2=A0=C2=A0{
> > > @@ -16,6 +18,32 @@ drm_sched_entity_compare_before(struct rb_node *a,=
 const struct rb_node *b)
> > > =C2=A0=C2=A0	return ktime_before(ea->oldest_job_waiting, eb->oldest_j=
ob_waiting);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
> > > +{
> > > +	enum drm_sched_priority prio =3D DRM_SCHED_PRIORITY_INVALID;
> > > +	struct rb_node *rb;
> > > +
> > > +	lockdep_assert_held(&rq->lock);
> > > +
> > > +	rb =3D rb_first_cached(&rq->rb_tree_root);
> > > +	if (rb) {
> > > +		struct drm_sched_entity *entity =3D
> > > +			rb_entry(rb, typeof(*entity), rb_tree_node);

I know declaring variables just for local scope can be desirable, but
this function is very small and defining 'entity' at the function's top
would you to eliminate the line break.

> > > +
> > > +		/*
> > > +		 * Unlocked read is fine to avoid the rq vs entity lock
> > > +		 * inversion. If the priority had just changed it is no big
> > > +		 * deal for our algorithm, but just a transient reachable only
> > > +		 * by drivers with userspace dynamic priority changes API. Equal
> > > +		 * in effect to the priority change becoming visible a few
> > > +		 * instructions later.
> > > +		 */
> > > +		prio =3D READ_ONCE(entity->priority);
> >=20
> > OK, so here's the good news:
> >=20
> > I just looked it through and once the _whole series_ is applied this
> > actually is not an unlocked read anymore.
> >=20
> > Once the series is applied, the only callers of this function here are
> > drm_sched_rq_remove_tree_locked() and
> > drm_sched_rq_update_tree_locked(), both of which grab the entity lock.
> >=20
> >=20
> > So what we could do is suffer the READ_ONCE for a few patches and then
> > remove it again once the other code paths running into here are
> > removed. And probably add the entity lockdep guard, too.
> >=20
> > Unless I'm mistaken?
>=20
> Yes a little bit. You overlooked that in some cases the it is a=20
> different entity, which the comment alludes to when talks about priority=
=20
> inversion. I will make the comment clearer.

Ah right. I got pulled in by my own optimism here.

Still =E2=80=93 can you please explain to me where / why that leads to lock
inversion with the rq lock?

What I'm seeing so far is that drm_sched_rq_update_prio() +
spin_lock(entity->lock) could deadlock because it could try to lock the
same entity that its caller has already locked. Correct?

>=20
> >=20
> > Best to detail that in the commit message, as always.
> >=20
> >=20
> > > +	}
> > > +
> > > +	rq->head_prio =3D prio;
> > > +}
> > > +
> > > =C2=A0=C2=A0static void drm_sched_rq_remove_fifo_locked(struct drm_sc=
hed_entity *entity,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> > > =C2=A0=C2=A0{
> > > @@ -25,6 +53,7 @@ static void drm_sched_rq_remove_fifo_locked(struct =
drm_sched_entity *entity,
> > > =C2=A0=C2=A0	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> > > =C2=A0=C2=A0		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_roo=
t);
> > > =C2=A0=C2=A0		RB_CLEAR_NODE(&entity->rb_tree_node);
> > > +		drm_sched_rq_update_prio(rq);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > @@ -46,6 +75,7 @@ static void drm_sched_rq_update_fifo_locked(struct =
drm_sched_entity *entity,
> > > =C2=A0=20
> > > =C2=A0=C2=A0	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare=
_before);
> > > +	drm_sched_rq_update_prio(rq);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -62,6 +92,123 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *=
sched,
> > > =C2=A0=C2=A0	INIT_LIST_HEAD(&rq->entities);
> > > =C2=A0=C2=A0	rq->rb_tree_root =3D RB_ROOT_CACHED;
> > > =C2=A0=C2=A0	rq->sched =3D sched;
> > > +	rq->head_prio =3D DRM_SCHED_PRIORITY_INVALID;
> > > +}
> > > +
> > > +static ktime_t
> > > +drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
> > > +{
> > > +	ktime_t vruntime =3D 0;
> > > +	struct rb_node *rb;
> > > +
> > > +	lockdep_assert_held(&rq->lock);
> > > +
> > > +	for (rb =3D rb_first_cached(&rq->rb_tree_root); rb; rb =3D rb_next(=
rb)) {
> > > +		struct drm_sched_entity *entity =3D
> > > +			rb_entry(rb, typeof(*entity), rb_tree_node);
> > > +		struct drm_sched_entity_stats *stats =3D entity->stats;
> > > +
> > > +		/*
> > > +		 * We only need the spin lock here on platforms where access to
> > > +		 * 64-bit ktime_t can tear but for simplicity we take it un-
> > > +		 * conditionally.
> > > +		 */
> > > +		spin_lock(&stats->lock);
> > > +		vruntime =3D stats->vruntime;
> > > +		spin_unlock(&stats->lock);
> > > +	}
> > > +
> > > +	return vruntime;
> > > +}
> > > +
> > > +static void
> > > +drm_sched_entity_save_vruntime(struct drm_sched_entity *entity,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t min_vruntime)
> > > +{
> > > +	struct drm_sched_entity_stats *stats =3D entity->stats;
> > > +	ktime_t vruntime;
> > > +
> > > +	spin_lock(&stats->lock);
> > > +	vruntime =3D stats->vruntime;
> > > +	if (min_vruntime && vruntime > min_vruntime)
> > > +		vruntime =3D ktime_sub(vruntime, min_vruntime);
> > > +	else
> > > +		vruntime =3D 0;
> > > +	stats->vruntime =3D vruntime;
> > > +	spin_unlock(&stats->lock);
> > > +}
> > > +
> > > +static ktime_t
> > > +drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
> > > +				=C2=A0 ktime_t min_vruntime,
> > > +				=C2=A0 enum drm_sched_priority rq_prio)
> > > +{
> > > +	struct drm_sched_entity_stats *stats =3D entity->stats;
> > > +	enum drm_sched_priority prio =3D entity->priority;
> > > +	ktime_t vruntime;
> > > +
> > > +	BUILD_BUG_ON(DRM_SCHED_PRIORITY_NORMAL < DRM_SCHED_PRIORITY_HIGH);
> >=20
> > Why's that a build bug. Who is to set / change those values?
>=20
> It is a build bug because few lines below depend on the current reverse=
=20
> order.
>=20
> As to who can change it- who knows. Better be safe than sorry.=20

Maybe I'm blind, but DRM_SCHED_PRIORITY_* are enumerators statically
defined in gpu_scheduler.h, aren't they? How can NORMAL ever be smaller
than HIGH?

> Alternative is to add a helper such as drm_sched_priority_is_lower(p1,=
=20
> p2) if you prefer that. I don't mind either way.
> > > +
> > > +	spin_lock(&stats->lock);
> > > +	vruntime =3D stats->vruntime;
> > > +
> > > +	/*
> > > +	 * Special handling for entities which were picked from the top of =
the
> > > +	 * queue and are now re-joining the top with another one already th=
ere.
> > > +	 */
> > > +	if (!vruntime && min_vruntime) {
> > > +		if (prio > rq_prio) {
> > > +			/*
> > > +			 * Lower priority should not overtake higher when re-
> > > +			 * joining at the top of the queue.
> > > +			 */
> > > +			vruntime =3D us_to_ktime(prio - rq_prio);
> > > +		} else if (prio < rq_prio) {
> > > +			/*
> > > +			 * Higher priority can go first.
> > > +			 */
> > > +			vruntime =3D -us_to_ktime(rq_prio - prio);
> > > +		}
> > > +	}
> > > +
> > > +	/*
> > > +	 * Restore saved relative position in the queue.
> > > +	 */
> > > +	vruntime =3D ktime_add(min_vruntime, vruntime);
> > > +
> > > +	stats->vruntime =3D vruntime;
> > > +	spin_unlock(&stats->lock);
> > > +
> > > +	return vruntime;
> > > +}
> > > +
> > > +static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_ent=
ity *entity)
> > > +{
> > > +	static const unsigned int shift[] =3D {
> > > +		[DRM_SCHED_PRIORITY_KERNEL] =3D 1,
> > > +		[DRM_SCHED_PRIORITY_HIGH]=C2=A0=C2=A0 =3D 2,
> > > +		[DRM_SCHED_PRIORITY_NORMAL] =3D 4,
> > > +		[DRM_SCHED_PRIORITY_LOW]=C2=A0=C2=A0=C2=A0 =3D 7,
> > > +	};
> >=20
> > Still no comments about these numbers origin?
>=20
> You asked, I answered, you said nothing, I respun with the feedback I
> received. I can add some text no problem.

That'd be great. Something small is perfectly sufficient

> > > +	struct drm_sched_entity_stats *stats =3D entity->stats;
> > > +	ktime_t runtime, prev;
> > > +
> > > +	spin_lock(&stats->lock);
> > > +	prev =3D stats->prev_runtime;
> > > +	runtime =3D stats->runtime;
> > > +	stats->prev_runtime =3D runtime;
> > > +	runtime =3D ktime_add_ns(stats->vruntime,
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_to_ns(ktime_sub(runtim=
e, prev)) <<
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shift[entity->priority]);
> > > +	stats->vruntime =3D runtime;
> > > +	spin_unlock(&stats->lock);
> > > +
> > > +	return runtime;
> > > +}
> > > +
> > > +static ktime_t drm_sched_entity_get_job_ts(struct drm_sched_entity *=
entity)
> > > +{
> > > +	return drm_sched_entity_update_vruntime(entity);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -98,8 +245,14 @@ drm_sched_rq_add_entity(struct drm_sched_entity *=
entity, ktime_t ts)
> > > =C2=A0=C2=A0		list_add_tail(&entity->list, &rq->entities);
> > > =C2=A0=C2=A0	}
> > > =C2=A0=20
> > > -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> > > +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> > > +		ts =3D drm_sched_rq_get_min_vruntime(rq);
> > > +		ts =3D drm_sched_entity_restore_vruntime(entity, ts,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->head_prio);
> > > +	} else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR) {
> > > =C2=A0=C2=A0		ts =3D entity->rr_ts;
> > > +	}
> > > +
> > > =C2=A0=C2=A0	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
> > > @@ -171,7 +324,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_ent=
ity *entity)
> > > =C2=A0=C2=A0	if (next_job) {
> > > =C2=A0=C2=A0		ktime_t ts;
> > > =C2=A0=20
> > > -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR)
> > > +			ts =3D drm_sched_entity_get_job_ts(entity);
> > > +		else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> >=20
> > FAIR is not even the dafault policy in this patch, so git diff could be
> > made smaller by reversing order. Same applies a few lines above.
>=20
> You asked before and I said I prefer FAIR to be first in the if ladder.

Thinking about it, since you remove the other policies anyways we would
then have a larger diff in a later patch..

So it's OK I think. Your choice.

Thx
P.

>=20
> If you insist I can change but TBH in the grand scheme of things it=20
> feels like churn with not much benefit.
>=20
> > (more comments later this week, am a bit busy)
>=20
> No worries, reviews are appreciated!
>=20
> Regards,
>=20
> Tvrtko
>=20
> > > =C2=A0=C2=A0			ts =3D next_job->submit_ts;
> > > =C2=A0=C2=A0		else
> > > =C2=A0=C2=A0			ts =3D drm_sched_rq_next_rr_ts(rq, entity);
> > > @@ -179,6 +334,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_en=
tity *entity)
> > > =C2=A0=C2=A0		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> > > =C2=A0=C2=A0	} else {
> > > =C2=A0=C2=A0		drm_sched_rq_remove_fifo_locked(entity, rq);
> > > +
> > > +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> > > +			ktime_t min_vruntime;
> > > +
> > > +			min_vruntime =3D drm_sched_rq_get_min_vruntime(rq);
> > > +			drm_sched_entity_save_vruntime(entity, min_vruntime);
> > > +		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0=C2=A0	spin_unlock(&rq->lock);
> > > =C2=A0=C2=A0	spin_unlock(&entity->lock);
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index be382cacabb5..ff798ee9e3c2 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -150,6 +150,11 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 priority;
> > > =C2=A0=20
> > > +	/**
> > > +	 * @rq_priority: Run-queue priority
> > > +	 */
> > > +	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 rq_priority;
> > > +
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * @rr_ts:
> > > =C2=A0=C2=A0	 *
> > > @@ -254,10 +259,11 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0 * struct drm_sched_rq - queue of entities to be schedule=
d.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * @sched: the scheduler to which this rq belongs to.
> > > - * @lock: protects @entities, @rb_tree_root and @rr_ts.
> > > + * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
> > > =C2=A0=C2=A0 * @rr_ts: monotonically incrementing fake timestamp for =
RR mode.
> > > =C2=A0=C2=A0 * @entities: list of the entities to be scheduled.
> > > =C2=A0=C2=A0 * @rb_tree_root: root of time based priority queue of en=
tities for FIFO scheduling
> > > + * @head_prio: priority of the top tree element.
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Run queue is a set of entities scheduling command subm=
issions for
> > > =C2=A0=C2=A0 * one specific ring. It implements the scheduling policy=
 that selects
> > > @@ -271,6 +277,7 @@ struct drm_sched_rq {
> > > =C2=A0=C2=A0	ktime_t				rr_ts;
> > > =C2=A0=C2=A0	struct list_head		entities;
> > > =C2=A0=C2=A0	struct rb_root_cached		rb_tree_root;
> > > +	enum drm_sched_priority		head_prio;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -563,8 +570,10 @@ struct drm_sched_backend_ops {
> > > =C2=A0=C2=A0 * @credit_count: the current credit count of this schedu=
ler
> > > =C2=A0=C2=A0 * @timeout: the time after which a job is removed from t=
he scheduler.
> > > =C2=A0=C2=A0 * @name: name of the ring for which this scheduler is be=
ing used.
> > > - * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORIT=
Y_COUNT,
> > > - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as th=
ere's usually one run-queue per priority, but could be less.
> > > + * @num_user_rqs: Number of run-queues. This is at most
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT, as there's usually one r=
un-queue per
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 priority, but could be less.
> > > + * @num_rqs: Equal to @num_user_rqs for FIFO and RR and 1 for the FA=
IR policy.
> > > =C2=A0=C2=A0 * @sched_rq: An allocated array of run-queues of size @n=
um_rqs;
> > > =C2=A0=C2=A0 * @job_scheduled: once drm_sched_entity_flush() is calle=
d the scheduler
> > > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 waits on this wait queue until a=
ll the scheduled jobs are
> > > @@ -597,6 +606,7 @@ struct drm_gpu_scheduler {
> > > =C2=A0=C2=A0	long				timeout;
> > > =C2=A0=C2=A0	const char			*name;
> > > =C2=A0=C2=A0	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_rqs;
> > > +	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_user_rqs;
> > > =C2=A0=C2=A0	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 **sched_rq;
> > > =C2=A0=C2=A0	wait_queue_head_t		job_scheduled;
> > > =C2=A0=C2=A0	atomic64_t			job_id_count;
> >=20
>=20
>=20

