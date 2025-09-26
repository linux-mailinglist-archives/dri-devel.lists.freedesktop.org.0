Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5F8BA39DE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 14:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F406F10EA42;
	Fri, 26 Sep 2025 12:31:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sxMkABFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E5910EA42;
 Fri, 26 Sep 2025 12:31:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cY9146vt1z9stG;
 Fri, 26 Sep 2025 14:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1758889865; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAFvb8ofxjJ58SEgop88Ebhh0xRZ+BdWq8mY8vVM3pA=;
 b=sxMkABFy8O0YmwR0UhxvHKNczy9uikIHGTIIHHcifd6LAPPtFDqlpPTCJYrvkDsVqURf8k
 bJzgS5Nh2Lq3MY/jCaRmO/Pl7Ou1JJr2FL2FmcAf3JzIOy+aowMrGenKWqMxLoL07+YKlu
 sOPGahJTjxtNm5lmBKpMZugf1v3xiQ0YwIRLYWm+NGLERTUmYp6OvFd4cKsnxLUcEAG+uw
 pGgw/sTk58cTL8ImkPAj31cjNlRES/d2lTCaiv6zrU3uogWGVcws7UrqBmL0k4z6z86ekr
 HKqsIcKZkOvEkNMjOzRePJY33PU/X7+h+z43Spqh4zbQS73VhUJlXPDqBxYmyg==
Message-ID: <e135bab8170168f94e16906d9dc7afeb245ec0de.camel@mailbox.org>
Subject: Re: [RFC v8 07/12] drm/sched: Account entity GPU time
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 26 Sep 2025 14:30:59 +0200
In-Reply-To: <743fa52d-f643-4102-9c56-24dca4359f82@igalia.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-8-tvrtko.ursulin@igalia.com>
 <6d5be3ab8413d44a360ebe7a34771ead6687c989.camel@mailbox.org>
 <743fa52d-f643-4102-9c56-24dca4359f82@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: f69d378cea5110f2bc7
X-MBO-RS-META: r8idda4mfgsattcm14q399gm6t9rjmey
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

On Thu, 2025-09-25 at 12:52 +0100, Tvrtko Ursulin wrote:
>=20
> On 24/09/2025 10:11, Philipp Stanner wrote:
> > On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
> > > To implement fair scheduling we need a view into the GPU time consume=
d by
> > > entities. Problem we have is that jobs and entities objects have deco=
upled
> > > lifetimes, where at the point we have a view into accurate GPU time, =
we
> > > cannot link back to the entity any longer.
> > >=20
> > > Solve this by adding a light weight entity stats object which is refe=
rence
> > > counted by both entity and the job and hence can safely be used from
> > > either side.
> > >=20
> > > With that, the only other thing we need is to add a helper for adding=
 the
> > > job's GPU time into the respective entity stats object, and call it o=
nce
> > > the accurate GPU time has been calculated.
> >=20
> > This in general also looks reasonable and clean to me. Some comments
> > below.
>=20
> Thanks!
>=20
> > btw I've got many nit-comments for all patches, but will wait with
> > those until a v1 is posted.
>=20
> Lets try and strike a balance please. :)

-ENOTFULLYUNDERSTOOD
I suppose we try to strike a balance in v1

>=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 | 39=
 +++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_internal.h | 66 +++++++++=
+++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 6 +-
> > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++
> > > =C2=A0=C2=A04 files changed, 122 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> > > index 7a0a52ba87bf..04ce8b7d436b 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -32,6 +32,39 @@
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include "gpu_scheduler_trace.h"
> > > =C2=A0=20
> > > +
> > > +/**
> > > + * drm_sched_entity_stats_release - Entity stats kref release functi=
on
> > > + *
> > > + * @kref: Entity stats embedded kref pointer
> > > + */
> > > +void drm_sched_entity_stats_release(struct kref *kref)
> > > +{
> > > +	struct drm_sched_entity_stats *stats =3D
> > > +		container_of(kref, typeof(*stats), kref);
> > > +
> > > +	kfree(stats);
> > > +}
> > > +
> > > +/**
> > > + * drm_sched_entity_stats_alloc - Allocate a new struct drm_sched_en=
tity_stats object
> > > + *
> > > + * Returns: Pointer to newly allocated struct drm_sched_entity_stats=
 object.
> > > + */
> > > +static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(v=
oid)
> > > +{
> > > +	struct drm_sched_entity_stats *stats;
> > > +
> > > +	stats =3D kzalloc(sizeof(*stats), GFP_KERNEL);
> > > +	if (!stats)
> > > +		return NULL;
> > > +
> > > +	kref_init(&stats->kref);
> > > +	spin_lock_init(&stats->lock);
> > > +
> > > +	return stats;
> > > +}
> > > +
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * drm_sched_entity_init - Init a context entity used by =
scheduler when
> > > =C2=A0=C2=A0 * submit to HW ring.
> > > @@ -65,6 +98,11 @@ int drm_sched_entity_init(struct drm_sched_entity =
*entity,
> > > =C2=A0=C2=A0		return -EINVAL;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	memset(entity, 0, sizeof(struct drm_sched_entity));
> > > +
> > > +	entity->stats =3D drm_sched_entity_stats_alloc();
> > > +	if (!entity->stats)
> > > +		return -ENOMEM;
> > > +
> > > =C2=A0=C2=A0	INIT_LIST_HEAD(&entity->list);
> > > =C2=A0=C2=A0	entity->rq =3D NULL;
> > > =C2=A0=C2=A0	entity->guilty =3D guilty;
> > > @@ -338,6 +376,7 @@ void drm_sched_entity_fini(struct drm_sched_entit=
y *entity)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	dma_fence_put(rcu_dereference_check(entity->last_schedul=
ed, true));
> > > =C2=A0=C2=A0	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> > > +	drm_sched_entity_stats_put(entity->stats);
> > > =C2=A0=C2=A0}
> > > =C2=A0=C2=A0EXPORT_SYMBOL(drm_sched_entity_fini);
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu=
/drm/scheduler/sched_internal.h
> > > index 703ee48fbc58..27c8460a3601 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > @@ -3,6 +3,22 @@
> > > =C2=A0=C2=A0#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > =C2=A0=C2=A0#define _DRM_GPU_SCHEDULER_INTERNAL_H_
> > > =C2=A0=20
> > > +#include <linux/ktime.h>
> > > +#include <linux/kref.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +/**
> > > + * struct drm_sched_entity_stats - execution stats for an entity.
> > > + *
> > > + * @kref: reference count for the object.
> > > + * @lock: lock guarding the @runtime updates.
> > > + * @runtime: time entity spent on the GPU.
> > > + */
> > > +struct drm_sched_entity_stats {
> >=20
> > Cool docu.
> >=20
> > Though, considering that awkward refcounting patterns are one of the
> > more relevant scheduler problems, I believe it makes sense to add to
> > the docu here a sentence or two about who refcounts this object for
> > what reason.
>=20
> Good idea - it is often not completely easy to find the commit message=
=20
> from git blame.
>=20
> >=20
> > > +	struct kref	kref;
> > > +	spinlock_t	lock;
> > > +	ktime_t		runtime;
> > > +};
> > > =C2=A0=20
> > > =C2=A0=C2=A0/* Used to choose between FIFO and RR job-scheduling */
> > > =C2=A0=C2=A0extern int drm_sched_policy;
> > > @@ -93,4 +109,54 @@ drm_sched_entity_is_ready(struct drm_sched_entity=
 *entity)
> > > =C2=A0=C2=A0	return true;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +void drm_sched_entity_stats_release(struct kref *kref);
> > > +
> > > +/**
> > > + * drm_sched_entity_stats_get - Obtain a reference count on struct d=
rm_sched_entity_stats object
> > > + *
> > > + * @stats: struct drm_sched_entity_stats pointer
> > > + *
> > > + * Returns: struct drm_sched_entity_stats pointer
> > > + */
> > > +static inline struct drm_sched_entity_stats *
> > > +drm_sched_entity_stats_get(struct drm_sched_entity_stats *stats)
> > > +{
> > > +	kref_get(&stats->kref);
> > > +
> > > +	return stats;
> > > +}
> > > +
> > > +/**
> > > + * drm_sched_entity_stats_put - Release a reference count on struct =
drm_sched_entity_stats object
> > > + *
> > > + * @stats: struct drm_sched_entity_stats pointer
> > > + */
> > > +static inline void
> > > +drm_sched_entity_stats_put(struct drm_sched_entity_stats *stats)
> > > +{
> > > +	kref_put(&stats->kref, drm_sched_entity_stats_release);
> > > +}
> > > +
> > > +/**
> > > + * drm_sched_entity_stats_job_add_gpu_time - Account job execution t=
ime to entity
> > > + *
> > > + * @job: Scheduler job to account.
> > > + *
> > > + * Accounts the execution time of @job to its respective entity stat=
s object.
> > > + */
> > > +static inline void
> > > +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
> > > +{
> > > +	struct drm_sched_entity_stats *stats =3D job->entity_stats;
> > > +	struct drm_sched_fence *s_fence =3D job->s_fence;
> > > +	ktime_t start, end;
> > > +
> > > +	start =3D dma_fence_timestamp(&s_fence->scheduled);
> > > +	end =3D dma_fence_timestamp(&s_fence->finished);
> > > +
> > > +	spin_lock(&stats->lock);
> > > +	stats->runtime =3D ktime_add(stats->runtime, ktime_sub(end, start))=
;
> > > +	spin_unlock(&stats->lock);
> > > +}
> > > +
> > > =C2=A0=C2=A0#endif
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index 9411676e772a..a5d7706efbea 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -658,6 +658,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	job->sched =3D sched;
> > > =C2=A0=C2=A0	job->s_priority =3D entity->priority;
> > > +	job->entity_stats =3D drm_sched_entity_stats_get(entity->stats);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	drm_sched_fence_init(job->s_fence, job->entity);
> > > =C2=A0=C2=A0}
> > > @@ -846,6 +847,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *=
job)
> > > =C2=A0=C2=A0		 * been called.
> > > =C2=A0=C2=A0		 */
> > > =C2=A0=C2=A0		dma_fence_put(&job->s_fence->finished);
> > > +		drm_sched_entity_stats_put(job->entity_stats);
> > > =C2=A0=C2=A0	} else {
> > > =C2=A0=C2=A0		/* The job was aborted before it has been committed to =
be run;
> > > =C2=A0=C2=A0		 * notably, drm_sched_job_arm() has not been called.
> > > @@ -997,8 +999,10 @@ static void drm_sched_free_job_work(struct work_=
struct *w)
> > > =C2=A0=C2=A0		container_of(w, struct drm_gpu_scheduler, work_free_job=
);
> > > =C2=A0=C2=A0	struct drm_sched_job *job;
> > > =C2=A0=20
> > > -	while ((job =3D drm_sched_get_finished_job(sched)))
> > > +	while ((job =3D drm_sched_get_finished_job(sched))) {
> > > +		drm_sched_entity_stats_job_add_gpu_time(job);
> > > =C2=A0=C2=A0		sched->ops->free_job(job);
> > > +	}
> >=20
> > The biggest question I'm wondering about is whether the reference
> > should be put in drm_sched_job_cleanup() or drm_sched_free_job_work().
> > The primer is semantically more correct, probably, but the latter is
> > always controlled by the scheduler.
> >=20
> > Hypothetically a driver could just not call drm_sched_job_cleanup() in
> > its free_job() callback =E2=80=93 but then other stuff would leak as we=
ll and
> > everything would be broken anyways.
>=20
> I think drm_sched_entity_stats_put() from drm_sched_job_cleanup() makes=
=20
> sense because latter is where other actions done by drm_sched_job_arm()=
=20
> are cleaned up. And drm_sched_job_arm() is where I placed=20
> drm_sched_entity_stats_get(). So that all looks nicely aligned to me.

ACK.

>=20
> > I probably should change the docu for drm_sched_job_cleanup(), which
> > currently says drivers "should" call it in free_job(), instead of
> > "must".
>=20
> Yeah I agree s/should/must/ is in order.

Will do.


P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0	drm_sched_run_job_queue(sched);
> > > =C2=A0=C2=A0}
> > > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.=
h
> > > index 802a0060db55..f33c78473867 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -71,6 +71,8 @@ enum drm_sched_priority {
> > > =C2=A0=C2=A0	DRM_SCHED_PRIORITY_COUNT
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > +struct drm_sched_entity_stats;
> > > +
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * struct drm_sched_entity - A wrapper around a job queue=
 (typically
> > > =C2=A0=C2=A0 * attached to the DRM file_priv).
> > > @@ -110,6 +112,11 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	struct drm_sched_rq		*rq;
> > > =C2=A0=20
> > > +	/**
> > > +	 * @stats: Stats object reference held by the entity and jobs.
> > > +	 */
> > > +	struct drm_sched_entity_stats	*stats;
> > > +
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * @sched_list:
> > > =C2=A0=C2=A0	 *
> > > @@ -365,6 +372,11 @@ struct drm_sched_job {
> > > =C2=A0=C2=A0	struct drm_sched_fence		*s_fence;
> > > =C2=A0=C2=A0	struct drm_sched_entity=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *entity;
> > > =C2=A0=20
> > > +	/**
> > > +	 * @entity_stats: Stats object reference held by the job and entity=
.
> > > +	 */
> > > +	struct drm_sched_entity_stats	*entity_stats;
> > > +
> > > =C2=A0=C2=A0	enum drm_sched_priority		s_priority;
> > > =C2=A0=C2=A0	u32				credits;
> > > =C2=A0=C2=A0	/** @last_dependency: tracks @dependencies as they signa=
l */
> >=20
>=20

