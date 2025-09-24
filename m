Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D846EB98B4E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 09:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742EB10E6AD;
	Wed, 24 Sep 2025 07:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="oxJfZ2p7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA87110E6AD;
 Wed, 24 Sep 2025 07:54:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cWpzK4cPVz9tc2;
 Wed, 24 Sep 2025 09:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758700493; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjzEVdqFcm/q0Dg8U1V9HzZBVpubRGBDdk2RFWYFkck=;
 b=oxJfZ2p7lPT8ICEi0FnPs8YKL5u9WlG5H9wK7Jq4VvgXQZNMncIneYwu7iQy/yniEDdyfJ
 aCev/XsCug+DFGLHq17xBZLIIxrmZkBNWFzdlItfClUoqIuDwdP0rk8ae7S8Sdr4LLRSSe
 K3gBLRP9NX49puCdpUYkyBAaMhbeUuPEr4vY0XO7IGKiqBX18Dcq4gAVUrJifCX4K41ukM
 hy/bUL6iZay2vqah0TE1kbJwHxdt+YHLTuxPE3P1z3d6f8UkL5T6kvqAsqXELEMeAXDg2L
 HHnbe39BRt0eAkk6cnsuWUcwU2d9T3Nj5FQFQ9eyOPhunCgAercEyT0hembLAw==
Message-ID: <45f7bb2c35e55bb0a0d1d719882ea8309189f533.camel@mailbox.org>
Subject: Re: [RFC v8 05/12] drm/sched: Move run queue related code into a
 separate file
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Date: Wed, 24 Sep 2025 09:54:50 +0200
In-Reply-To: <20250903101820.63032-6-tvrtko.ursulin@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-6-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: dr9xrymaasi633qunpqqjupgc665kahp
X-MBO-RS-ID: 0de62f2fa6ff1976b25
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

On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> Lets move all the code dealing with struct drm_sched_rq into a separate
> compilation unit. Advantage being sched_main.c is left with a clearer set
> of responsibilities.

It sounds reasonable to explicitly list those responsibilities. Maybe
even establish them in comments at the top of all C files (in a
separate patch following this one preferably).

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h |=C2=A0=C2=A0 7 +
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 | 21=
8 +-------------------
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 222 +++++++++++++++++++++
> =C2=A04 files changed, 232 insertions(+), 217 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>=20
> diff --git a/drivers/gpu/drm/scheduler/Makefile b/drivers/gpu/drm/schedul=
er/Makefile
> index 6e13e4c63e9d..74e75eff6df5 100644
> --- a/drivers/gpu/drm/scheduler/Makefile
> +++ b/drivers/gpu/drm/scheduler/Makefile
> @@ -20,7 +20,7 @@
> =C2=A0# OTHER DEALINGS IN THE SOFTWARE.
> =C2=A0#
> =C2=A0#
> -gpu-sched-y :=3D sched_main.o sched_fence.o sched_entity.o
> +gpu-sched-y :=3D sched_main.o sched_fence.o sched_entity.o sched_rq.o
> =C2=A0
> =C2=A0obj-$(CONFIG_DRM_SCHED) +=3D gpu-sched.o
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm=
/scheduler/sched_internal.h
> index 8269c5392a82..703ee48fbc58 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -10,8 +10,15 @@ extern int drm_sched_policy;
> =C2=A0#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> =C2=A0#define DRM_SCHED_POLICY_FIFO=C2=A0 1
> =C2=A0
> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +			 struct drm_sched_entity *entity);
> =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> =C2=A0
> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq);
> +struct drm_sched_entity *
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			=C2=A0=C2=A0 struct drm_sched_rq *rq);
> =C2=A0struct drm_gpu_scheduler *
> =C2=A0drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts=
);
> =C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index c53931e63458..97bec2f86502 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -112,8 +112,8 @@ static u32 drm_sched_available_credits(struct drm_gpu=
_scheduler *sched)
> =C2=A0 * Return true if we can push at least one more job from @entity, f=
alse
> =C2=A0 * otherwise.
> =C2=A0 */
> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> -				struct drm_sched_entity *entity)
> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
> +			 struct drm_sched_entity *entity)
> =C2=A0{
> =C2=A0	struct drm_sched_job *s_job;
> =C2=A0
> @@ -133,220 +133,6 @@ static bool drm_sched_can_queue(struct drm_gpu_sche=
duler *sched,
> =C2=A0	return drm_sched_available_credits(sched) >=3D s_job->credits;
> =C2=A0}
> =C2=A0
> -static __always_inline bool drm_sched_entity_compare_before(struct rb_no=
de *a,
> -							=C2=A0=C2=A0=C2=A0 const struct rb_node *b)
> -{
> -	struct drm_sched_entity *ent_a =3D=C2=A0 rb_entry((a), struct drm_sched=
_entity, rb_tree_node);
> -	struct drm_sched_entity *ent_b =3D=C2=A0 rb_entry((b), struct drm_sched=
_entity, rb_tree_node);
> -
> -	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waitin=
g);
> -}
> -
> -static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *ent=
ity,
> -					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> -{
> -	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> -		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> -		RB_CLEAR_NODE(&entity->rb_tree_node);
> -	}
> -}
> -
> -static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *ent=
ity,
> -					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> -					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> -{
> -	/*
> -	 * Both locks need to be grabbed, one to protect from entity->rq change
> -	 * for entity from within concurrent drm_sched_entity_select_rq and the
> -	 * other to update the rb tree structure.
> -	 */
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	drm_sched_rq_remove_fifo_locked(entity, rq);
> -
> -	entity->oldest_job_waiting =3D ts;
> -
> -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> -}
> -
> -/**
> - * drm_sched_rq_init - initialize a given run queue struct
> - *
> - * @sched: scheduler instance to associate with this run queue
> - * @rq: scheduler run queue
> - *
> - * Initializes a scheduler runqueue.
> - */
> -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> -{
> -	spin_lock_init(&rq->lock);
> -	INIT_LIST_HEAD(&rq->entities);
> -	rq->rb_tree_root =3D RB_ROOT_CACHED;
> -	rq->sched =3D sched;
> -}
> -
> -/**
> - * drm_sched_rq_add_entity - add an entity
> - *
> - * @entity: scheduler entity
> - * @ts: submission timestamp
> - *
> - * Adds a scheduler entity to the run queue.
> - *
> - * Returns a DRM scheduler pre-selected to handle this entity.
> - */
> -struct drm_gpu_scheduler *
> -drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> -{
> -	struct drm_gpu_scheduler *sched;
> -	struct drm_sched_rq *rq;
> -
> -	/* Add the entity to the run queue */
> -	spin_lock(&entity->lock);
> -	if (entity->stopped) {
> -		spin_unlock(&entity->lock);
> -
> -		DRM_ERROR("Trying to push to a killed entity\n");
> -		return NULL;
> -	}
> -
> -	rq =3D entity->rq;
> -	spin_lock(&rq->lock);
> -	sched =3D rq->sched;
> -
> -	if (list_empty(&entity->list)) {
> -		atomic_inc(sched->score);
> -		list_add_tail(&entity->list, &rq->entities);
> -	}
> -
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> -		ts =3D entity->rr_ts;
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> -
> -	spin_unlock(&rq->lock);
> -	spin_unlock(&entity->lock);
> -
> -	return sched;
> -}
> -
> -/**
> - * drm_sched_rq_remove_entity - remove an entity
> - *
> - * @rq: scheduler run queue
> - * @entity: scheduler entity
> - *
> - * Removes a scheduler entity from the run queue.
> - */
> -void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> -				struct drm_sched_entity *entity)
> -{
> -	lockdep_assert_held(&entity->lock);
> -
> -	if (list_empty(&entity->list))
> -		return;
> -
> -	spin_lock(&rq->lock);
> -
> -	atomic_dec(rq->sched->score);
> -	list_del_init(&entity->list);
> -
> -	drm_sched_rq_remove_fifo_locked(entity, rq);
> -
> -	spin_unlock(&rq->lock);
> -}
> -
> -static ktime_t
> -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity =
*entity)
> -{
> -	ktime_t ts;
> -
> -	lockdep_assert_held(&entity->lock);
> -	lockdep_assert_held(&rq->lock);
> -
> -	ts =3D ktime_add_ns(rq->rr_ts, 1);
> -	entity->rr_ts =3D ts;
> -	rq->rr_ts =3D ts;
> -
> -	return ts;
> -}
> -
> -/**
> - * drm_sched_rq_pop_entity - pops an entity
> - *
> - * @entity: scheduler entity
> - *
> - * To be called every time after a job is popped from the entity.
> - */
> -void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> -{
> -	struct drm_sched_job *next_job;
> -	struct drm_sched_rq *rq;
> -	ktime_t ts;
> -
> -	/*
> -	 * Update the entity's location in the min heap according to
> -	 * the timestamp of the next job, if any.
> -	 */
> -	next_job =3D drm_sched_entity_queue_peek(entity);
> -	if (!next_job)
> -		return;
> -
> -	spin_lock(&entity->lock);
> -	rq =3D entity->rq;
> -	spin_lock(&rq->lock);
> -	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> -		ts =3D next_job->submit_ts;
> -	else
> -		ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> -	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> -	spin_unlock(&rq->lock);
> -	spin_unlock(&entity->lock);
> -}
> -
> -/**
> - * drm_sched_rq_select_entity - Select an entity which provides a job to=
 run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Find oldest waiting ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL) if =
an
> - * entity was ready, but the scheduler had insufficient credits to accom=
modate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> -			=C2=A0=C2=A0 struct drm_sched_rq *rq)
> -{
> -	struct rb_node *rb;
> -
> -	spin_lock(&rq->lock);
> -	for (rb =3D rb_first_cached(&rq->rb_tree_root); rb; rb =3D rb_next(rb))=
 {
> -		struct drm_sched_entity *entity;
> -
> -		entity =3D rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> -		if (drm_sched_entity_is_ready(entity)) {
> -			/* If we can't queue yet, preserve the current entity in
> -			 * terms of fairness.
> -			 */
> -			if (!drm_sched_can_queue(sched, entity)) {
> -				spin_unlock(&rq->lock);
> -				return ERR_PTR(-ENOSPC);
> -			}
> -
> -			reinit_completion(&entity->entity_idle);
> -			break;
> -		}
> -	}
> -	spin_unlock(&rq->lock);
> -
> -	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> -}
> -
> =C2=A0/**
> =C2=A0 * drm_sched_run_job_queue - enqueue run-job work
> =C2=A0 * @sched: scheduler instance
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> new file mode 100644
> index 000000000000..16d57461765e
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -0,0 +1,222 @@
> +#include <linux/rbtree.h>
> +
> +#include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
> +
> +#include "sched_internal.h"
> +
> +static __always_inline bool
> +drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node =
*b)
> +{
> +	struct drm_sched_entity *ea =3D
> +		rb_entry((a), struct drm_sched_entity, rb_tree_node);
> +	struct drm_sched_entity *eb =3D
> +		rb_entry((b), struct drm_sched_entity, rb_tree_node);
> +
> +	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
> +}
> +
> +static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *ent=
ity,
> +					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +{
> +	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
> +		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
> +		RB_CLEAR_NODE(&entity->rb_tree_node);
> +	}
> +}
> +
> +static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *ent=
ity,
> +					=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq,
> +					=C2=A0=C2=A0=C2=A0 ktime_t ts)
> +{
> +	/*
> +	 * Both locks need to be grabbed, one to protect from entity->rq change
> +	 * for entity from within concurrent drm_sched_entity_select_rq and the
> +	 * other to update the rb tree structure.
> +	 */
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
> +
> +	entity->oldest_job_waiting =3D ts;
> +
> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_before);
> +}
> +
> +/**
> + * drm_sched_rq_init - initialize a given run queue struct
> + *
> + * @sched: scheduler instance to associate with this run queue
> + * @rq: scheduler run queue
> + *
> + * Initializes a scheduler runqueue.
> + */
> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +{
> +	spin_lock_init(&rq->lock);
> +	INIT_LIST_HEAD(&rq->entities);
> +	rq->rb_tree_root =3D RB_ROOT_CACHED;
> +	rq->sched =3D sched;
> +}
> +
> +/**
> + * drm_sched_rq_add_entity - add an entity
> + *
> + * @entity: scheduler entity
> + * @ts: submission timestamp
> + *
> + * Adds a scheduler entity to the run queue.
> + *
> + * Returns a DRM scheduler pre-selected to handle this entity.
> + */
> +struct drm_gpu_scheduler *
> +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
> +{
> +	struct drm_gpu_scheduler *sched;
> +	struct drm_sched_rq *rq;
> +
> +	/* Add the entity to the run queue */
> +	spin_lock(&entity->lock);
> +	if (entity->stopped) {
> +		spin_unlock(&entity->lock);
> +
> +		DRM_ERROR("Trying to push to a killed entity\n");
> +		return NULL;
> +	}
> +
> +	rq =3D entity->rq;
> +	spin_lock(&rq->lock);
> +	sched =3D rq->sched;
> +
> +	if (list_empty(&entity->list)) {
> +		atomic_inc(sched->score);
> +		list_add_tail(&entity->list, &rq->entities);
> +	}
> +
> +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> +		ts =3D entity->rr_ts;
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +
> +	return sched;
> +}
> +
> +/**
> + * drm_sched_rq_remove_entity - remove an entity
> + *
> + * @rq: scheduler run queue
> + * @entity: scheduler entity
> + *
> + * Removes a scheduler entity from the run queue.
> + */
> +void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> +				struct drm_sched_entity *entity)
> +{
> +	lockdep_assert_held(&entity->lock);
> +
> +	if (list_empty(&entity->list))
> +		return;
> +
> +	spin_lock(&rq->lock);
> +
> +	atomic_dec(rq->sched->score);
> +	list_del_init(&entity->list);
> +
> +	drm_sched_rq_remove_fifo_locked(entity, rq);
> +
> +	spin_unlock(&rq->lock);
> +}
> +
> +static ktime_t
> +drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity =
*entity)
> +{
> +	ktime_t ts;
> +
> +	lockdep_assert_held(&entity->lock);
> +	lockdep_assert_held(&rq->lock);
> +
> +	ts =3D ktime_add_ns(rq->rr_ts, 1);
> +	entity->rr_ts =3D ts;
> +	rq->rr_ts =3D ts;
> +
> +	return ts;
> +}
> +
> +/**
> + * drm_sched_rq_pop_entity - pops an entity
> + *
> + * @entity: scheduler entity
> + *
> + * To be called every time after a job is popped from the entity.
> + */
> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
> +{
> +	struct drm_sched_job *next_job;
> +	struct drm_sched_rq *rq;
> +	ktime_t ts;
> +
> +	/*
> +	 * Update the entity's location in the min heap according to
> +	 * the timestamp of the next job, if any.
> +	 */
> +	next_job =3D drm_sched_entity_queue_peek(entity);
> +	if (!next_job)
> +		return;
> +
> +	spin_lock(&entity->lock);
> +	rq =3D entity->rq;
> +	spin_lock(&rq->lock);
> +	if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +		ts =3D next_job->submit_ts;
> +	else
> +		ts =3D drm_sched_rq_get_rr_ts(rq, entity);
> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
> +	spin_unlock(&rq->lock);
> +	spin_unlock(&entity->lock);
> +}
> +
> +/**
> + * drm_sched_rq_select_entity - Select an entity which provides a job to=
 run
> + *
> + * @sched: the gpu scheduler
> + * @rq: scheduler run queue to check.
> + *
> + * Find oldest waiting ready entity.
> + *
> + * Return an entity if one is found; return an error-pointer (!NULL) if =
an
> + * entity was ready, but the scheduler had insufficient credits to accom=
modate
> + * its job; return NULL, if no ready entity was found.
> + */
> +struct drm_sched_entity *
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> +			=C2=A0=C2=A0 struct drm_sched_rq *rq)
> +{
> +	struct rb_node *rb;
> +
> +	spin_lock(&rq->lock);
> +	for (rb =3D rb_first_cached(&rq->rb_tree_root); rb; rb =3D rb_next(rb))=
 {
> +		struct drm_sched_entity *entity;
> +
> +		entity =3D rb_entry(rb, struct drm_sched_entity, rb_tree_node);
> +		if (drm_sched_entity_is_ready(entity)) {
> +			/* If we can't queue yet, preserve the current entity in
> +			 * terms of fairness.
> +			 */
> +			if (!drm_sched_can_queue(sched, entity)) {
> +				spin_unlock(&rq->lock);
> +				return ERR_PTR(-ENOSPC);
> +			}
> +
> +			reinit_completion(&entity->entity_idle);
> +			break;
> +		}
> +	}
> +	spin_unlock(&rq->lock);
> +
> +	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
> +}

