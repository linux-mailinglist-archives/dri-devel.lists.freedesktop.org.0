Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92260A78C9E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D259A10E74A;
	Wed,  2 Apr 2025 10:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="CqUhMhOM";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="k8xTq5m/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7124F10E74B;
 Wed,  2 Apr 2025 10:46:13 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZSM3f6yrnz9tMf;
 Wed,  2 Apr 2025 12:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1743590767; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tp9IFVC5d51kxtENyfzzbJ/G3YVdDmHqYDHwl6jfsjQ=;
 b=CqUhMhOMWbfhxPvwKCdmudA8TiFrQA3tiYLJGB3E+HHqmLMqYBee/rqiBHXXYGpeGi3Ddg
 I16hUk5mPm+qB84q0PQ8+++wDVEa9bBVNn7PeNJFEjMamuZry/gFW+P3MBRlSvd3EMKb0Z
 qBVoDMFVt1OexmIDbWoJfnGQ23SpEC6Y3bFBDQPnpDcNpRI2JWH1geM+2bYk0+Xyh0si5O
 QHIq/8QoI6GLw24TZFEWLvBZ/LQwW9xepGuBGzI7mFOrcG0VhEFCCoh1DAqSHmXm0xWnww
 N5oNgGv6D4gD7casUSkbH291c/Nft1T2o4YTpAxtkUdDPpI3R6kWlRXe2b+sgg==
Message-ID: <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1743590765; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tp9IFVC5d51kxtENyfzzbJ/G3YVdDmHqYDHwl6jfsjQ=;
 b=k8xTq5m/kwfI3UVoLh3F9jSoMftNFfIhP+35EPkZVZA0VKvDbs8sJUMgTzvKa7fCtJKFlz
 bzbKdZ0vE2HgseunomWLjedWQdFO3mU+uuzQYTvs5OOk00kg+nQPRNRcZzeg7/J1KCTQRT
 /IOwR80rryAFrvrB1r9Tvw/k5YbDlQa17sI61EyzeXUDo+QVtoJmurPkmy8FqAgkQyAA/B
 uV+YyiRG6XM1+puPL1VdIp5XEwNOoUzPGvM2WsviTrXdYfHhtHIA9rnfkYhiEi3a80Pdzp
 gdJerSCd51womB/BG1Su7PQqgkwTdu3g7fPrDKF5afOZ5CRx80S9H3Tz4Pi41g==
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Michel =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Date: Wed, 02 Apr 2025 12:46:00 +0200
In-Reply-To: <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 66n3roxtzfsjy85x6kfezd6hhipgycie
X-MBO-RS-ID: b90cb2c8033c3370a09
X-Rspamd-Queue-Id: 4ZSM3f6yrnz9tMf
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

On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
> Round-robin being the non-default policy and unclear how much it is
> used,
> we can notice that it can be implemented using the FIFO data
> structures if
> we only invent a fake submit timestamp which is monotonically
> increasing
> inside drm_sched_rq instances.
>=20
> So instead of remembering which was the last entity the scheduler
> worker
> picked, we can bump the picked one to the bottom of the tree,
> achieving
> the same round-robin behaviour.
>=20
> Advantage is that we can consolidate to a single code path and remove
> a
> bunch of code. Downside is round-robin mode now needs to lock on the
> job
> pop path but that should not be visible.

Why did you decide to do it that way and then later remove RR & FIFO
alltogether in patch 10, basically?

I think the far cleaner way for our development-process would be a
separate patch(-series) that *removes* RR completely. Advantages are:

   1. It should be relatively easy to do
   2. It would simplify the existing code base independently of what
      happens with your RFC series here
   3. Before changing everyone's scheduling policy to a completely new,
      deadline-based one, we could first be sure for a few release
      cycles that everyone is now on FIFO, establishing common ground.
   4. We could CC every- and anyone who might use RR or might know
      someone who does
   5. If it turns out we screwed up and someone really relies on RR, it
      would be easy to revert.

I am not aware of any RR users and have, in past discussions, never
heard of any. So removing it is more tempting for the above reasons.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

+Cc Michel here, too


P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 45 ++++++++------
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 76 ++---------=
-----------
> --
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> =C2=A03 files changed, 36 insertions(+), 90 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 9b0122e99b44..bbb7f3d3e3e8 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -469,9 +469,19 @@ drm_sched_job_dependency(struct drm_sched_job
> *job,
> =C2=A0 return NULL;
> =C2=A0}
> =C2=A0
> +static ktime_t
> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
> +{
> + lockdep_assert_held(&rq->lock);
> +
> + rq->rr_deadline =3D ktime_add_ns(rq->rr_deadline, 1);
> +
> + return rq->rr_deadline;
> +}
> +
> =C2=A0struct drm_sched_job *drm_sched_entity_pop_job(struct
> drm_sched_entity *entity)
> =C2=A0{
> - struct drm_sched_job *sched_job;
> + struct drm_sched_job *sched_job, *next_job;
> =C2=A0
> =C2=A0 sched_job =3D drm_sched_entity_queue_peek(entity);
> =C2=A0 if (!sched_job)
> @@ -506,21 +516,22 @@ struct drm_sched_job
> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> =C2=A0 * Update the entity's location in the min heap according to
> =C2=A0 * the timestamp of the next job, if any.
> =C2=A0 */
> - if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO) {
> - struct drm_sched_job *next;
> + next_job =3D drm_sched_entity_queue_peek(entity);
> + if (next_job) {
> + struct drm_sched_rq *rq;
> + ktime_t ts;
> =C2=A0
> - next =3D drm_sched_entity_queue_peek(entity);
> - if (next) {
> - struct drm_sched_rq *rq;
> + if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> + ts =3D next_job->submit_ts;
> + else
> + ts =3D drm_sched_rq_get_rr_deadline(rq);
> =C2=A0
> - spin_lock(&entity->lock);
> - rq =3D entity->rq;
> - spin_lock(&rq->lock);
> - drm_sched_rq_update_fifo_locked(entity, rq,
> - next->submit_ts);
> - spin_unlock(&rq->lock);
> - spin_unlock(&entity->lock);
> - }
> + spin_lock(&entity->lock);
> + rq =3D entity->rq;
> + spin_lock(&rq->lock);
> + drm_sched_rq_update_fifo_locked(entity, rq, ts);
> + spin_unlock(&rq->lock);
> + spin_unlock(&entity->lock);
> =C2=A0 }
> =C2=A0
> =C2=A0 /* Jobs and entities might have different lifecycles. Since we're
> @@ -619,9 +630,9 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0
> =C2=A0 spin_lock(&rq->lock);
> =C2=A0 drm_sched_rq_add_entity(rq, entity);
> -
> - if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> - drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> + if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_RR)
> + submit_ts =3D drm_sched_rq_get_rr_deadline(rq);
> + drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
> =C2=A0
> =C2=A0 spin_unlock(&rq->lock);
> =C2=A0 spin_unlock(&entity->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 600904271b01..e931a9b91083 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -190,7 +190,6 @@ static void drm_sched_rq_init(struct
> drm_gpu_scheduler *sched,
> =C2=A0 spin_lock_init(&rq->lock);
> =C2=A0 INIT_LIST_HEAD(&rq->entities);
> =C2=A0 rq->rb_tree_root =3D RB_ROOT_CACHED;
> - rq->current_entity =3D NULL;
> =C2=A0 rq->sched =3D sched;
> =C2=A0}
> =C2=A0
> @@ -236,74 +235,13 @@ void drm_sched_rq_remove_entity(struct
> drm_sched_rq *rq,
> =C2=A0 atomic_dec(rq->sched->score);
> =C2=A0 list_del_init(&entity->list);
> =C2=A0
> - if (rq->current_entity =3D=3D entity)
> - rq->current_entity =3D NULL;
> -
> - if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> - drm_sched_rq_remove_fifo_locked(entity, rq);
> + drm_sched_rq_remove_fifo_locked(entity, rq);
> =C2=A0
> =C2=A0 spin_unlock(&rq->lock);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * drm_sched_rq_select_entity_rr - Select an entity which could
> provide a job to run
> - *
> - * @sched: the gpu scheduler
> - * @rq: scheduler run queue to check.
> - *
> - * Try to find the next ready entity.
> - *
> - * Return an entity if one is found; return an error-pointer (!NULL)
> if an
> - * entity was ready, but the scheduler had insufficient credits to
> accommodate
> - * its job; return NULL, if no ready entity was found.
> - */
> -static struct drm_sched_entity *
> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
> - =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_rq *rq)
> -{
> - struct drm_sched_entity *entity;
> -
> - spin_lock(&rq->lock);
> -
> - entity =3D rq->current_entity;
> - if (entity) {
> - list_for_each_entry_continue(entity, &rq->entities, list) {
> - if (drm_sched_entity_is_ready(entity))
> - goto found;
> - }
> - }
> -
> - list_for_each_entry(entity, &rq->entities, list) {
> - if (drm_sched_entity_is_ready(entity))
> - goto found;
> -
> - if (entity =3D=3D rq->current_entity)
> - break;
> - }
> -
> - spin_unlock(&rq->lock);
> -
> - return NULL;
> -
> -found:
> - if (!drm_sched_can_queue(sched, entity)) {
> - /*
> - * If scheduler cannot take more jobs signal the caller to not
> - * consider lower priority queues.
> - */
> - entity =3D ERR_PTR(-ENOSPC);
> - } else {
> - rq->current_entity =3D entity;
> - reinit_completion(&entity->entity_idle);
> - }
> -
> - spin_unlock(&rq->lock);
> -
> - return entity;
> -}
> -
> -/**
> - * drm_sched_rq_select_entity_fifo - Select an entity which provides
> a job to run
> + * drm_sched_rq_select_entity - Select an entity which provides a
> job to run
> =C2=A0 *
> =C2=A0 * @sched: the gpu scheduler
> =C2=A0 * @rq: scheduler run queue to check.
> @@ -315,8 +253,8 @@ drm_sched_rq_select_entity_rr(struct
> drm_gpu_scheduler *sched,
> =C2=A0 * its job; return NULL, if no ready entity was found.
> =C2=A0 */
> =C2=A0static struct drm_sched_entity *
> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
> - struct drm_sched_rq *rq)
> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
> + =C2=A0=C2=A0 struct drm_sched_rq *rq)
> =C2=A0{
> =C2=A0 struct drm_sched_entity *entity =3D NULL;
> =C2=A0 struct rb_node *rb;
> @@ -1061,15 +999,13 @@ void drm_sched_wakeup(struct drm_gpu_scheduler
> *sched)
> =C2=A0static struct drm_sched_entity *
> =C2=A0drm_sched_select_entity(struct drm_gpu_scheduler *sched)
> =C2=A0{
> - struct drm_sched_entity *entity;
> + struct drm_sched_entity *entity =3D NULL;
> =C2=A0 int i;
> =C2=A0
> =C2=A0 /* Start with the highest priority.
> =C2=A0 */
> =C2=A0 for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> - entity =3D drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO ?
> - drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
> - drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
> + entity =3D drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
> =C2=A0 if (entity)
> =C2=A0 break;
> =C2=A0 }
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..1073cc569cce 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -239,8 +239,7 @@ struct drm_sched_entity {
> =C2=A0 * struct drm_sched_rq - queue of entities to be scheduled.
> =C2=A0 *
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> - * @lock: protects @entities, @rb_tree_root and @current_entity.
> - * @current_entity: the entity which is to be scheduled.
> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
> =C2=A0 * @entities: list of the entities to be scheduled.
> =C2=A0 * @rb_tree_root: root of time based priority queue of entities for
> FIFO scheduling
> =C2=A0 *
> @@ -253,7 +252,7 @@ struct drm_sched_rq {
> =C2=A0
> =C2=A0 spinlock_t lock;
> =C2=A0 /* Following members are protected by the @lock: */
> - struct drm_sched_entity *current_entity;
> + ktime_t rr_deadline;
> =C2=A0 struct list_head entities;
> =C2=A0 struct rb_root_cached rb_tree_root;
> =C2=A0};

