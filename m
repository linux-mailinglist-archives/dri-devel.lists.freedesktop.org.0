Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB6DBD8C3C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CBC10E5A8;
	Tue, 14 Oct 2025 10:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YM1eSRTd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC4310E5A8;
 Tue, 14 Oct 2025 10:27:45 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cm9QQ0L9Qz9s2L;
 Tue, 14 Oct 2025 12:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760437662; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+X2XzIUzLX+8QgSUPJd6tz/RszJEXzAS3xXXKlCkKg=;
 b=YM1eSRTdwgOOe24b6WscKfGZWBpAqkb5Lkjeb20Ks3wgM40opohbxisKgdoGiEwwjdJbRl
 goQxTAxQyVuuGm0lBcqLQuLMIctL85ljbzHxbo5iyOMSXR7J9yx485kDDfUIW/QlQXeH4F
 BbxKFTpZw83aqatsuGe4Qtcej/EPQUQzWLYCSaGGcD+jyg73VWv2sfduYHf2oXXXixn+dl
 nd7XVh5Trokp3juw0r2YXq4+2Da6qU7oUtARedzslndlM3OU2pB/pOxUs+ZnBYv50ni12p
 S+/OIj/Vu0cO8YgzlWCpVaWW4KUJ5Eiov/U0AF+S2er98lFQj/Cm+0+La1Zz0Q==
Message-ID: <db78f7074cf1e83afbbf68c27b9e7b55bfb9a73b.camel@mailbox.org>
Subject: Re: [PATCH 10/28] drm/sched: Add fair scheduling policy
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Tue, 14 Oct 2025 12:27:37 +0200
In-Reply-To: <20251008085359.52404-11-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-11-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 3aacbd1806ab9e77f33
X-MBO-RS-META: a4p7zyzrfryxknw4ycxsxj45tkzpa6gp
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

On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
> Fair scheduling policy is built upon the same concepts as the well known

nit: "The fair =E2=80=A6"

Or maybe better: call it FAIR, being congruent with the FIFO below.

> CFS kernel scheduler - entity run queue is sorted by the virtual GPU time

nit: Call it "CPU scheduler". The GPU scheduler is a kernel scheduler,
too.

> consumed by entities in a way that the entity with least vruntime runs
> first.
>=20
> It is able to avoid total priority starvation, which is one of the
> problems with FIFO, and it also does not need for per priority run queues=
.
> As it scales the actual GPU runtime by an exponential factor as the
> priority decreases, therefore the virtual runtime for low priority

"therefore," is not necessary because of the sentence starting with
"As"

> entities grows faster than for normal priority, pushing them further down
> the runqueue order for the same real GPU time spent.
>=20
> Apart from this fundamental fairness, fair policy is especially strong in
> oversubscription workloads where it is able to give more GPU time to shor=
t
> and bursty workloads when they are running in parallel with GPU heavy
> clients submitting deep job queues.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 |=C2=A0 28 ++-=
-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0=C2=A0 9 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 147 ++++++++++++++++++++-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 ++-
> =C2=A05 files changed, 191 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 04ce8b7d436b..58f51875547a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -108,6 +108,8 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
> =C2=A0	entity->guilty =3D guilty;
> =C2=A0	entity->num_sched_list =3D num_sched_list;
> =C2=A0	entity->priority =3D priority;
> +	entity->rq_priority =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR ?
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL : priority;
> =C2=A0	/*
> =C2=A0	 * It's perfectly valid to initialize an entity without having a v=
alid
> =C2=A0	 * scheduler attached. It's just not valid to use the scheduler be=
fore it
> @@ -124,17 +126,23 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> =C2=A0		 */
> =C2=A0		pr_warn("%s: called with uninitialized scheduler\n", __func__);
> =C2=A0	} else if (num_sched_list) {
> -		/* The "priority" of an entity cannot exceed the number of run-queues =
of a
> -		 * scheduler. Protect against num_rqs being 0, by converting to signed=
. Choose
> -		 * the lowest priority available.
> +		enum drm_sched_priority p =3D entity->priority;
> +
> +		/*
> +		 * The "priority" of an entity cannot exceed the number of
> +		 * run-queues of a scheduler. Protect against num_rqs being 0,
> +		 * by converting to signed. Choose the lowest priority
> +		 * available.
> =C2=A0		 */
> -		if (entity->priority >=3D sched_list[0]->num_rqs) {
> -			dev_err(sched_list[0]->dev, "entity has out-of-bounds priority: %u. n=
um_rqs: %u\n",
> -				entity->priority, sched_list[0]->num_rqs);
> -			entity->priority =3D max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> -						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> +		if (p >=3D sched_list[0]->num_user_rqs) {
> +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u nu=
m_user_rqs:%u\n",
> +				p, sched_list[0]->num_user_rqs);
> +			p =3D max_t(s32,
> +				 (s32)sched_list[0]->num_user_rqs - 1,
> +				 (s32)DRM_SCHED_PRIORITY_KERNEL);
> +			entity->priority =3D p;
> =C2=A0		}
> -		entity->rq =3D sched_list[0]->sched_rq[entity->priority];
> +		entity->rq =3D sched_list[0]->sched_rq[entity->rq_priority];

That rename could be a separate patch, couldn't it? As I said before
it's always great to have general code improvements as separate patches
since it makes it far easier to review (i.e.: detect / see) core
functionality changes.

> =C2=A0	}
> =C2=A0
> =C2=A0	init_completion(&entity->entity_idle);
> @@ -567,7 +575,7 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty *entity)
> =C2=A0
> =C2=A0	spin_lock(&entity->lock);
> =C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity->num_sche=
d_list);
> -	rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
> +	rq =3D sched ? sched->sched_rq[entity->rq_priority] : NULL;
> =C2=A0	if (rq !=3D entity->rq) {
> =C2=A0		drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0		entity->rq =3D rq;
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm=
/scheduler/sched_internal.h
> index 1132a771aa37..c94e38acc6f2 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -18,18 +18,23 @@
> =C2=A0 * @kref: reference count for the object.
> =C2=A0 * @lock: lock guarding the @runtime updates.
> =C2=A0 * @runtime: time entity spent on the GPU.
> + * @prev_runtime: previous @runtime used to get the runtime delta
> + * @vruntime: virtual runtime as accumulated by the fair algorithm

The other docstrings are all terminated with a full stop '.'

> =C2=A0 */
> =C2=A0struct drm_sched_entity_stats {
> =C2=A0	struct kref	kref;
> =C2=A0	spinlock_t	lock;
> =C2=A0	ktime_t		runtime;
> +	ktime_t		prev_runtime;
> +	u64		vruntime;
> =C2=A0};
> =C2=A0
> =C2=A0/* Used to choose between FIFO and RR job-scheduling */
> =C2=A0extern int drm_sched_policy;
> =C2=A0
> -#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> -#define DRM_SCHED_POLICY_FIFO=C2=A0 1
> +#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0 0
> +#define DRM_SCHED_POLICY_FIFO 1
> +#define DRM_SCHED_POLICY_FAIR 2
>=20

Formatting unnecessarily increases the git diff.

Let's die the death of having the old formatting. As far as it's
forseeable FAIR will be the last policy for the classic drm_sched
anyways, so no future changes here expected.

> =C2=A0
> =C2=A0bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> =C2=A0			 struct drm_sched_entity *entity);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index f180d292bf66..8d8f9c8411f5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -90,7 +90,7 @@ int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> =C2=A0 * DOC: sched_policy (int)
> =C2=A0 * Used to override default entities scheduling policy in a run que=
ue.
> =C2=A0 */
> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entiti=
es on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin, " =
__stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO (default).");
> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entiti=
es on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round Robin, " =
__stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO, " __stringify(DRM_SCHED_POLI=
CY_FAIR) " =3D Fair (default).");
> =C2=A0module_param_named(sched_policy, drm_sched_policy, int, 0444);
> =C2=A0
> =C2=A0static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sc=
hed)
> @@ -1132,11 +1132,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d, const struct drm_sched_init_
> =C2=A0		sched->own_submit_wq =3D true;
> =C2=A0	}
> =C2=A0
> -	sched->sched_rq =3D kmalloc_array(args->num_rqs, sizeof(*sched->sched_r=
q),
> +	sched->num_user_rqs =3D args->num_rqs;
> +	sched->num_rqs =3D drm_sched_policy !=3D DRM_SCHED_POLICY_FAIR ?
> +			 args->num_rqs : 1;
> +	sched->sched_rq =3D kmalloc_array(sched->num_rqs,
> +					sizeof(*sched->sched_rq),

Don't reformat that for the git diff? Line doesn't seem crazily long.

> =C2=A0					GFP_KERNEL | __GFP_ZERO);
> =C2=A0	if (!sched->sched_rq)
> =C2=A0		goto Out_check_own;
> -	sched->num_rqs =3D args->num_rqs;
> +
> =C2=A0	for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> =C2=A0		sched->sched_rq[i] =3D kzalloc(sizeof(*sched->sched_rq[i]), GFP_K=
ERNEL);
> =C2=A0		if (!sched->sched_rq[i])
> @@ -1278,7 +1282,7 @@ void drm_sched_increase_karma(struct drm_sched_job =
*bad)
> =C2=A0	if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
> =C2=A0		atomic_inc(&bad->karma);
> =C2=A0
> -		for (i =3D DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
> +		for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {

Give me a pointer here quickly =E2=80=93 what's that about?

> =C2=A0			struct drm_sched_rq *rq =3D sched->sched_rq[i];
> =C2=A0
> =C2=A0			spin_lock(&rq->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> index 09d316bc3dfa..b868c794cc9d 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -16,6 +16,24 @@ drm_sched_entity_compare_before(struct rb_node *a, con=
st struct rb_node *b)
> =C2=A0	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting=
);
> =C2=A0}
> =C2=A0
> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
> +{
> +	enum drm_sched_priority prio =3D -1;
> +	struct rb_node *rb;

nit:
"node" might be a bitter name than rb. When iterating over a list we
also typically call the iterator sth like "head" and not "list".

But no hard feelings on that change.

> +
> +	lockdep_assert_held(&rq->lock);
> +
> +	rb =3D rb_first_cached(&rq->rb_tree_root);
> +	if (rb) {
> +		struct drm_sched_entity *entity =3D
> +			rb_entry(rb, typeof(*entity), rb_tree_node);
> +
> +		prio =3D entity->priority; /* Unlocked read */

Why an unlocked read? Why is that OK? The comment could detail that.

> +	}
> +
> +	rq->head_prio =3D prio;
> +}
> +
> =C2=A0static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity=
 *entity,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> =C2=A0{
> @@ -25,6 +43,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_=
sched_entity *entity,
> =C2=A0	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> =C2=A0		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> =C2=A0		RB_CLEAR_NODE(&entity->rb_tree_node);
> +		drm_sched_rq_update_prio(rq);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -46,6 +65,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_=
sched_entity *entity,
> =C2=A0
> =C2=A0	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> +	drm_sched_rq_update_prio(rq);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -63,6 +83,114 @@ void drm_sched_rq_init(struct drm_sched_rq *rq,
> =C2=A0	INIT_LIST_HEAD(&rq->entities);
> =C2=A0	rq->rb_tree_root =3D RB_ROOT_CACHED;
> =C2=A0	rq->sched =3D sched;
> +	rq->head_prio =3D -1;

head_prio is an enum.

Better to give the enum an entry like:

PRIO_INVALID =3D -1,

> +}
> +
> +static ktime_t
> +drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
> +{
> +	struct drm_sched_entity *entity;
> +	struct rb_node *rb;
> +
> +	lockdep_assert_held(&rq->lock);
> +
> +	for (rb =3D rb_first_cached(&rq->rb_tree_root); rb; rb =3D rb_next(rb))=
 {
> +		entity =3D rb_entry(rb, typeof(*entity), rb_tree_node);
> +
> +		return entity->stats->vruntime; /* Unlocked read */

Seems the read is unlocked because we just don't care about it racing?

> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +drm_sched_entity_save_vruntime(struct drm_sched_entity *entity,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_t min_vruntime)
> +{
> +	struct drm_sched_entity_stats *stats =3D entity->stats;

Unlocked read?

> +	ktime_t vruntime;
> +
> +	spin_lock(&stats->lock);
> +	vruntime =3D stats->vruntime;
> +	if (min_vruntime && vruntime > min_vruntime)
> +		vruntime =3D ktime_sub(vruntime, min_vruntime);
> +	else
> +		vruntime =3D 0;
> +	stats->vruntime =3D vruntime;
> +	spin_unlock(&stats->lock);
> +}
> +
> +static ktime_t
> +drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
> +				=C2=A0 ktime_t min_vruntime,
> +				=C2=A0 enum drm_sched_priority rq_prio)
> +{
> +	struct drm_sched_entity_stats *stats =3D entity->stats;
> +	enum drm_sched_priority prio =3D entity->priority;
> +	ktime_t vruntime;
> +
> +	BUILD_BUG_ON(DRM_SCHED_PRIORITY_NORMAL < DRM_SCHED_PRIORITY_HIGH);
> +
> +	spin_lock(&stats->lock);
> +	vruntime =3D stats->vruntime;
> +
> +	/*
> +	 * Special handling for entities which were picked from the top of the
> +	 * queue and are now re-joining the top with another one already there.
> +	 */
> +	if (!vruntime && min_vruntime) {
> +		if (prio > rq_prio) {
> +			/*
> +			 * Lower priority should not overtake higher when re-
> +			 * joining at the top of the queue.
> +			 */
> +			vruntime =3D us_to_ktime(prio - rq_prio);
> +		} else if (prio < rq_prio) {
> +			/*
> +			 * Higher priority can go first.
> +			 */
> +			vruntime =3D -us_to_ktime(rq_prio - prio);
> +		}
> +	}
> +
> +	/*
> +	 * Restore saved relative position in the queue.
> +	 */
> +	vruntime =3D ktime_add(min_vruntime, vruntime);
> +
> +	stats->vruntime =3D vruntime;
> +	spin_unlock(&stats->lock);
> +
> +	return vruntime;
> +}
> +
> +static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_entity =
*entity)
> +{
> +	static const unsigned int shift[] =3D {
> +		[DRM_SCHED_PRIORITY_KERNEL] =3D 1,
> +		[DRM_SCHED_PRIORITY_HIGH]=C2=A0=C2=A0 =3D 2,
> +		[DRM_SCHED_PRIORITY_NORMAL] =3D 4,
> +		[DRM_SCHED_PRIORITY_LOW]=C2=A0=C2=A0=C2=A0 =3D 7,

Are those numbers copied from CPU CFS? Are they from an academic paper?
Or have you measured that these generate best results?

Some hint about their background here would be nice.

> +	};
> +	struct drm_sched_entity_stats *stats =3D entity->stats;
> +	ktime_t runtime, prev;
> +
> +	spin_lock(&stats->lock);
> +	prev =3D stats->prev_runtime;
> +	runtime =3D stats->runtime;
> +	stats->prev_runtime =3D runtime;
> +	runtime =3D ktime_add_ns(stats->vruntime,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktime_to_ns(ktime_sub(runtime, p=
rev)) <<
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shift[entity->priority]);
> +	stats->vruntime =3D runtime;
> +	spin_unlock(&stats->lock);
> +
> +	return runtime;
> +}
> +
> +static ktime_t drm_sched_entity_get_job_ts(struct drm_sched_entity *enti=
ty)
> +{
> +	return drm_sched_entity_update_vruntime(entity);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -99,8 +227,14 @@ drm_sched_rq_add_entity(struct drm_sched_entity *enti=
ty, ktime_t ts)
> =C2=A0		list_add_tail(&entity->list, &rq->entities);
> =C2=A0	}
> =C2=A0
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> +		ts =3D drm_sched_rq_get_min_vruntime(rq);
> +		ts =3D drm_sched_entity_restore_vruntime(entity, ts,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rq->head_prio);
> +	} else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR) {
> =C2=A0		ts =3D entity->rr_ts;
> +	}
> +
> =C2=A0	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> =C2=A0
> =C2=A0	spin_unlock(&rq->lock);
> @@ -173,7 +307,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity =
*entity)
> =C2=A0	if (next_job) {
> =C2=A0		ktime_t ts;
> =C2=A0
> -		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR)
> +			ts =3D drm_sched_entity_get_job_ts(entity);
> +		else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)

Could the git diff here and above be kept smaller by reversing the
order of 'if' and 'else if'?

> =C2=A0			ts =3D next_job->submit_ts;
> =C2=A0		else
> =C2=A0			ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> @@ -181,6 +317,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity=
 *entity)
> =C2=A0		drm_sched_rq_update_fifo_locked(entity, rq, ts);
> =C2=A0	} else {
> =C2=A0		drm_sched_rq_remove_fifo_locked(entity, rq);
> +
> +		if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FAIR) {
> +			ktime_t min_vruntime;
> +
> +			min_vruntime =3D drm_sched_rq_get_min_vruntime(rq);
> +			drm_sched_entity_save_vruntime(entity, min_vruntime);
> +		}
> =C2=A0	}
> =C2=A0	spin_unlock(&rq->lock);
> =C2=A0	spin_unlock(&entity->lock);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 93d0b7224a57..bc25508a6ff6 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -150,6 +150,11 @@ struct drm_sched_entity {
> =C2=A0	 */
> =C2=A0	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 priority;
> =C2=A0
> +	/**
> +	 * @rq_priority: Run-queue priority
> +	 */
> +	enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 rq_priority;
> +

AFAIR that's just a temporary addition and will be simplified later.
Still, would probably be neat to be more obvious about why we now have
two priorities.

> =C2=A0	/**
> =C2=A0	 * @rr_ts:
> =C2=A0	 *
> @@ -254,10 +259,11 @@ struct drm_sched_entity {
> =C2=A0 * struct drm_sched_rq - queue of entities to be scheduled.
> =C2=A0 *
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> - * @lock: protects @entities, @rb_tree_root and @rr_ts.
> + * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
> =C2=A0 * @rr_ts: monotonically incrementing fake timestamp for RR mode
> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @rb_tree_root: root of time based priority queue of entities for=
 FIFO scheduling
> + * @head_prio: priority of the top tree element
> =C2=A0 *
> =C2=A0 * Run queue is a set of entities scheduling command submissions fo=
r
> =C2=A0 * one specific ring. It implements the scheduling policy that sele=
cts
> @@ -271,6 +277,7 @@ struct drm_sched_rq {
> =C2=A0	ktime_t				rr_ts;
> =C2=A0	struct list_head		entities;
> =C2=A0	struct rb_root_cached		rb_tree_root;
> +	enum drm_sched_priority		head_prio;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -563,8 +570,10 @@ struct drm_sched_backend_ops {
> =C2=A0 * @credit_count: the current credit count of this scheduler
> =C2=A0 * @timeout: the time after which a job is removed from the schedul=
er.
> =C2=A0 * @name: name of the ring for which this scheduler is being used.
> - * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_CO=
UNT,
> - *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as there'=
s usually one run-queue per priority, but could be less.
> + * @num_user_rqs: Number of run-queues. This is at most
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT, as there's usually one run-=
queue per
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 priority, but could be less.
> + * @num_rqs: Equal to @num_user_rqs for FIFO and RR and 1 for the FAIR p=
olicy.

Alright, so that seems to be what I was looking for above?


P.

> =C2=A0 * @sched_rq: An allocated array of run-queues of size @num_rqs;
> =C2=A0 * @job_scheduled: once drm_sched_entity_flush() is called the sche=
duler
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 waits on this wait queue until all the sc=
heduled jobs are
> @@ -597,6 +606,7 @@ struct drm_gpu_scheduler {
> =C2=A0	long				timeout;
> =C2=A0	const char			*name;
> =C2=A0	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_rqs;
> +	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_user_rqs;
> =C2=A0	struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 **sched_rq;
> =C2=A0	wait_queue_head_t		job_scheduled;
> =C2=A0	atomic64_t			job_id_count;

