Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B8BD8D12
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7177B10E211;
	Tue, 14 Oct 2025 10:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uQiy0j61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B95510E207;
 Tue, 14 Oct 2025 10:53:30 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmB0720Ykz9tX0;
 Tue, 14 Oct 2025 12:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1760439207; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4GBxqcVmtpBayhDTm7JzPNfHqID20T0/7XJvsPHNbjg=;
 b=uQiy0j61FYxky4gAqQp0HzpJP8h/Z7BP3EQe1oV92IOaBZwSNn720HLDProskPuO6zNHRv
 T4rPQ80nPpRcF/FPAGxOFNGb3fChXFX0iUiso6UqYsBjO0XcKnoRvcrAXP/PP0H5WNEtFE
 KXgsGp0wR23KLSYpo++IoOBVA7iNGlgzVevrCAUB49dpYUJ8Ayop98EXKxX08Vjh/2NfG3
 j6/su+JW82HyFwm+Mu+xaCHNIQmEdRfOf967k4xcPoGVC/sleRYFpUP2XmOFbLvz56IHIe
 +fsBPrOuK3m2stybUNeJXvVZi8fPS2bJk9itHxtLYCKZsDJ17eKQglHhG0MdsA==
Message-ID: <618a50aabddace2531375bc18fb1ca9b00297490.camel@mailbox.org>
Subject: Re: [PATCH 11/28] drm/sched: Favour interactive clients slightly
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Tue, 14 Oct 2025 12:53:23 +0200
In-Reply-To: <20251008085359.52404-12-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-12-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 0caad1969b19553d187
X-MBO-RS-META: 5e5awyn4f7diiicix6e56oem8qsyff6w
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
> GPUs do not always implement preemption and DRM scheduler definitely
> does not support it at the front end scheduling level. This means
> execution quanta can be quite long and is controlled by userspace,
> consequence of which is picking the "wrong" entity to run can have a
> larger negative effect than it would have with a virtual runtime based CP=
U
> scheduler.
>=20
> Another important consideration is that rendering clients often have
> shallow submission queues, meaning they will be entering and exiting the
> scheduler's runnable queue often.
>=20
> Relevant scenario here is what happens when an entity re-joins the
> runnable queue with other entities already present. One cornerstone of th=
e
> virtual runtime algorithm is to let it re-join at the head and rely on th=
e
> virtual runtime accounting and timeslicing to sort it out.
>=20
> However, as explained above, this may not work perfectly in the GPU world=
.
> Entity could always get to overtake the existing entities, or not,
> depending on the submission order and rbtree equal key insertion
> behaviour.
>=20
> Allow interactive jobs to overtake entities already queued up for the
> limited case when interactive entity is re-joining the queue after
> being idle.
>=20
> This gives more opportunity for the compositors to have their rendering
> executed before the GPU hogs even if they have been configured with the
> same scheduling priority.
>=20
> To classify a client as interactive we look at its average job duration
> versus the average for the whole scheduler. We can track this easily by
> plugging into the existing job runtime tracking and applying the
> exponential moving average window on the past submissions. Then, all othe=
r
> things being equal, we let the more interactive jobs go first.

OK so this patch is new. Why was it added? The cover letter says:

"Improved handling of interactive clients by replacing the random noise
on tie approach with the average job duration statistics."

So this is based on additional research you have done in the mean time?
Does it change behavior significantly when compared to the RFC?

The firmware scheduler bros are not affected in any case. Still, I
think that the RFC we discussed in the past and at XDC is now quite
more different from the actual proposal in this v1.

I suppose it's in general good for graphics applications.. what about
compute, doesn't that have longer jobs? Probably still good for people
who do compute on their productive system..

@AMD:
can you review / ack this?

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h | 15 ++++++++++++---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 8 +++++++-
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 14 ++++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++++
> =C2=A05 files changed, 39 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 58f51875547a..1715e1caec40 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -61,6 +61,7 @@ static struct drm_sched_entity_stats *drm_sched_entity_=
stats_alloc(void)
> =C2=A0
> =C2=A0	kref_init(&stats->kref);
> =C2=A0	spin_lock_init(&stats->lock);
> +	ewma_drm_sched_avgtime_init(&stats->avg_job_us);
> =C2=A0
> =C2=A0	return stats;
> =C2=A0}
> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm=
/scheduler/sched_internal.h
> index c94e38acc6f2..a120efc5d763 100644
> --- a/drivers/gpu/drm/scheduler/sched_internal.h
> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> @@ -20,6 +20,7 @@
> =C2=A0 * @runtime: time entity spent on the GPU.
> =C2=A0 * @prev_runtime: previous @runtime used to get the runtime delta
> =C2=A0 * @vruntime: virtual runtime as accumulated by the fair algorithm
> + * @avg_job_us: average job duration
> =C2=A0 */
> =C2=A0struct drm_sched_entity_stats {
> =C2=A0	struct kref	kref;
> @@ -27,6 +28,8 @@ struct drm_sched_entity_stats {
> =C2=A0	ktime_t		runtime;
> =C2=A0	ktime_t		prev_runtime;
> =C2=A0	u64		vruntime;
> +
> +	struct ewma_drm_sched_avgtime=C2=A0=C2=A0 avg_job_us;
> =C2=A0};
> =C2=A0
> =C2=A0/* Used to choose between FIFO and RR job-scheduling */
> @@ -153,20 +156,26 @@ drm_sched_entity_stats_put(struct drm_sched_entity_=
stats *stats)
> =C2=A0 * @job: Scheduler job to account.
> =C2=A0 *
> =C2=A0 * Accounts the execution time of @job to its respective entity sta=
ts object.
> + *
> + * Returns job's real duration in micro seconds.
> =C2=A0 */
> -static inline void
> +static inline ktime_t
> =C2=A0drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
> =C2=A0{
> =C2=A0	struct drm_sched_entity_stats *stats =3D job->entity_stats;
> =C2=A0	struct drm_sched_fence *s_fence =3D job->s_fence;
> -	ktime_t start, end;
> +	ktime_t start, end, duration;
> =C2=A0
> =C2=A0	start =3D dma_fence_timestamp(&s_fence->scheduled);
> =C2=A0	end =3D dma_fence_timestamp(&s_fence->finished);
> +	duration =3D ktime_sub(end, start);
> =C2=A0
> =C2=A0	spin_lock(&stats->lock);
> -	stats->runtime =3D ktime_add(stats->runtime, ktime_sub(end, start));
> +	stats->runtime =3D ktime_add(stats->runtime, duration);
> +	ewma_drm_sched_avgtime_add(&stats->avg_job_us, ktime_to_us(duration));
> =C2=A0	spin_unlock(&stats->lock);
> +
> +	return duration;
> =C2=A0}
> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 8d8f9c8411f5..204d99c6699f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1000,7 +1000,12 @@ static void drm_sched_free_job_work(struct work_st=
ruct *w)
> =C2=A0	struct drm_sched_job *job;
> =C2=A0
> =C2=A0	while ((job =3D drm_sched_get_finished_job(sched))) {
> -		drm_sched_entity_stats_job_add_gpu_time(job);
> +		ktime_t duration =3D drm_sched_entity_stats_job_add_gpu_time(job);
> +
> +		/* Serialized by the worker. */
> +		ewma_drm_sched_avgtime_add(&sched->avg_job_us,
> +					=C2=A0=C2=A0 ktime_to_us(duration));
> +
> =C2=A0		sched->ops->free_job(job);
> =C2=A0	}
> =C2=A0
> @@ -1158,6 +1163,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,=
 const struct drm_sched_init_
> =C2=A0	atomic_set(&sched->_score, 0);
> =C2=A0	atomic64_set(&sched->job_id_count, 0);
> =C2=A0	sched->pause_submit =3D false;
> +	ewma_drm_sched_avgtime_init(&sched->avg_job_us);
> =C2=A0
> =C2=A0	sched->ready =3D true;
> =C2=A0	return 0;
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/sched=
uler/sched_rq.c
> index b868c794cc9d..02742869e75b 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -150,6 +150,20 @@ drm_sched_entity_restore_vruntime(struct drm_sched_e=
ntity *entity,
> =C2=A0			 * Higher priority can go first.
> =C2=A0			 */
> =C2=A0			vruntime =3D -us_to_ktime(rq_prio - prio);
> +		} else {
> +			struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> +
> +			/*
> +			 * Favour entity with shorter jobs (interactivity).
> +			 *
> +			 * (Unlocked read is fine since it is just heuristics.)
> +			 *
> +			 */
> +			if (ewma_drm_sched_avgtime_read(&stats->avg_job_us) <=3D
> +			=C2=A0=C2=A0=C2=A0 ewma_drm_sched_avgtime_read(&sched->avg_job_us))
> +				vruntime =3D -1;
> +			else
> +				vruntime =3D 1;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index bc25508a6ff6..a7e407e04ce0 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -25,11 +25,14 @@
> =C2=A0#define _DRM_GPU_SCHEDULER_H_
> =C2=A0
> =C2=A0#include <drm/spsc_queue.h>
> +#include <linux/average.h>
> =C2=A0#include <linux/dma-fence.h>
> =C2=A0#include <linux/completion.h>
> =C2=A0#include <linux/xarray.h>
> =C2=A0#include <linux/workqueue.h>
> =C2=A0
> +DECLARE_EWMA(drm_sched_avgtime, 6, 4);
> +
> =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> =C2=A0
> =C2=A0/**
> @@ -581,6 +584,7 @@ struct drm_sched_backend_ops {
> =C2=A0 * @job_id_count: used to assign unique id to the each job.
> =C2=A0 * @submit_wq: workqueue used to queue @work_run_job and @work_free=
_job
> =C2=A0 * @timeout_wq: workqueue used to queue @work_tdr
> + * @avg_job_us: Average job duration
> =C2=A0 * @work_run_job: work which calls run_job op of each scheduler.
> =C2=A0 * @work_free_job: work which calls free_job op of each scheduler.
> =C2=A0 * @work_tdr: schedules a delayed call to @drm_sched_job_timedout a=
fter the
> @@ -612,6 +616,7 @@ struct drm_gpu_scheduler {
> =C2=A0	atomic64_t			job_id_count;
> =C2=A0	struct workqueue_struct		*submit_wq;
> =C2=A0	struct workqueue_struct		*timeout_wq;
> +	struct ewma_drm_sched_avgtime=C2=A0=C2=A0 avg_job_us;
> =C2=A0	struct work_struct		work_run_job;
> =C2=A0	struct work_struct		work_free_job;
> =C2=A0	struct delayed_work		work_tdr;

