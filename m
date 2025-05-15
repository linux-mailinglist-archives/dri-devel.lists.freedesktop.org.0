Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8CAB8291
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1183410E7D8;
	Thu, 15 May 2025 09:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="H+/UIf47";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD31510E207;
 Thu, 15 May 2025 09:28:23 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZylHw3vBRz9tK7;
 Thu, 15 May 2025 11:28:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747301292; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cBm+7dx/76CkBsioMHKcluhBiEdz9fLttBYI4SLScxM=;
 b=H+/UIf47HA87lOuGthYJRFKTq6N0Ic7oqHLFePN2FRNMWgw25oiDIEsMjcvvNuJEg4Q8OT
 eBAQhS+lR2jDLQayUMHcZ2vYjHjTmr8iK7+toVkV2Mv2Oi4zJJ2urGbYTNANCKxaOZs3aG
 7qaM8dvKidcXeThIXhefPK5SkBZ+o4XoEsl1Eq0+3JEFHZPiUHePDk1aKdvvDl7U813+Hw
 jPggUsRtQSnkXYQ9Eli47MBpBrR/jZVdC+nBF0aRmwHuei+0g/gCzVE4ZqVI7cC8eTVL3T
 gsKDTgSsq158ZjjWtsQCfHaxFuN5BZDtJxQVkGtNvVJCpp/kYaf25WUtBBAm6A==
Message-ID: <51f87f358fa1b7ef8db8b67ee6cde38ae071fbe8.camel@mailbox.org>
Subject: Re: [PATCH v4 04/40] drm/sched: Add enqueue credit limit
From: Philipp Stanner <phasta@mailbox.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Connor
 Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Date: Thu, 15 May 2025 11:28:07 +0200
In-Reply-To: <20250514170118.40555-5-robdclark@gmail.com>
References: <20250514170118.40555-1-robdclark@gmail.com>
 <20250514170118.40555-5-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 64bdc0b238082e2d16c
X-MBO-RS-META: g6hdxza7zti7q1hq17xft5ip4yg86shr
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

Hello,

On Wed, 2025-05-14 at 09:59 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> Similar to the existing credit limit mechanism, but applying to jobs
> enqueued to the scheduler but not yet run.
>=20
> The use case is to put an upper bound on preallocated, and
> potentially
> unneeded, pgtable pages.=C2=A0 When this limit is exceeded, pushing new
> jobs
> will block until the count drops below the limit.

the commit message doesn't make clear why that's needed within the
scheduler.

From what I understand from the cover letter, this is a (rare?) Vulkan
feature. And as important as Vulkan is, it's the drivers that implement
support for it. I don't see why the scheduler is a blocker.

All the knowledge about when to stop pushing into the entity is in the
driver, and the scheduler obtains all the knowledge about that from the
driver anyways.

So you could do

if (my_vulkan_condition())
   drm_sched_entity_push_job();

couldn't you?

>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++++--
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++++++++-
> =C2=A03 files changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index dc0e60d2c14b..c5f688362a34 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -580,11 +580,21 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0 * under common lock for the struct drm_sched_entity that was set u=
p
> for
> =C2=A0 * @sched_job in drm_sched_job_init().
> =C2=A0 */
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> +int drm_sched_entity_push_job(struct drm_sched_job *sched_job)

Return code would need to be documented in the docstring, too. If we'd
go for that solution.

> =C2=A0{
> =C2=A0	struct drm_sched_entity *entity =3D sched_job->entity;
> +	struct drm_gpu_scheduler *sched =3D sched_job->sched;
> =C2=A0	bool first;
> =C2=A0	ktime_t submit_ts;
> +	int ret;
> +
> +	ret =3D wait_event_interruptible(
> +			sched->job_scheduled,
> +			atomic_read(&sched->enqueue_credit_count) <=3D
> +			sched->enqueue_credit_limit);

This very significantly changes the function's semantics. This function
is used in a great many drivers, and here it would be transformed into
a function that can block.

From what I see below those credits are to be optional. But even if, it
needs to be clearly documented when a function can block.

> +	if (ret)
> +		return ret;
> +	atomic_add(sched_job->enqueue_credits, &sched-
> >enqueue_credit_count);
> =C2=A0
> =C2=A0	trace_drm_sched_job(sched_job, entity);
> =C2=A0	atomic_inc(entity->rq->sched->score);
> @@ -609,7 +619,7 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0			spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0			DRM_ERROR("Trying to push to a killed
> entity\n");
> -			return;
> +			return -EINVAL;
> =C2=A0		}
> =C2=A0
> =C2=A0		rq =3D entity->rq;
> @@ -626,5 +636,7 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0
> =C2=A0		drm_sched_wakeup(sched);
> =C2=A0	}
> +
> +	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 9412bffa8c74..1102cca69cb4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1217,6 +1217,7 @@ static void drm_sched_run_job_work(struct
> work_struct *w)
> =C2=A0
> =C2=A0	trace_drm_run_job(sched_job, entity);
> =C2=A0	fence =3D sched->ops->run_job(sched_job);
> +	atomic_sub(sched_job->enqueue_credits, &sched-
> >enqueue_credit_count);
> =C2=A0	complete_all(&entity->entity_idle);
> =C2=A0	drm_sched_fence_scheduled(s_fence, fence);
> =C2=A0
> @@ -1253,6 +1254,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0
> =C2=A0	sched->ops =3D args->ops;
> =C2=A0	sched->credit_limit =3D args->credit_limit;
> +	sched->enqueue_credit_limit =3D args->enqueue_credit_limit;
> =C2=A0	sched->name =3D args->name;
> =C2=A0	sched->timeout =3D args->timeout;
> =C2=A0	sched->hang_limit =3D args->hang_limit;
> @@ -1308,6 +1310,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0	INIT_LIST_HEAD(&sched->pending_list);
> =C2=A0	spin_lock_init(&sched->job_list_lock);
> =C2=A0	atomic_set(&sched->credit_count, 0);
> +	atomic_set(&sched->enqueue_credit_count, 0);
> =C2=A0	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> =C2=A0	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> =C2=A0	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index da64232c989d..d830ffe083f1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -329,6 +329,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> dma_fence *f);
> =C2=A0 * @s_fence: contains the fences for the scheduling of job.
> =C2=A0 * @finish_cb: the callback for the finished fence.
> =C2=A0 * @credits: the number of credits this job contributes to the
> scheduler
> + * @enqueue_credits: the number of enqueue credits this job
> contributes
> =C2=A0 * @work: Helper to reschedule job kill to different context.
> =C2=A0 * @id: a unique id assigned to each job scheduled on the scheduler=
.
> =C2=A0 * @karma: increment on every hang caused by this job. If this
> exceeds the hang
> @@ -366,6 +367,7 @@ struct drm_sched_job {
> =C2=A0
> =C2=A0	enum drm_sched_priority		s_priority;
> =C2=A0	u32				credits;
> +	u32				enqueue_credits;

What's the policy of setting this?

drm_sched_job_init() and drm_sched_job_arm() are responsible for
initializing jobs.

> =C2=A0	/** @last_dependency: tracks @dependencies as they signal */
> =C2=A0	unsigned int			last_dependency;
> =C2=A0	atomic_t			karma;
> @@ -485,6 +487,10 @@ struct drm_sched_backend_ops {
> =C2=A0 * @ops: backend operations provided by the driver.
> =C2=A0 * @credit_limit: the credit limit of this scheduler
> =C2=A0 * @credit_count: the current credit count of this scheduler
> + * @enqueue_credit_limit: the credit limit of jobs pushed to
> scheduler and not
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yet r=
un
> + * @enqueue_credit_count: the current crdit count of jobs pushed to
> scheduler
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but n=
ot yet run
> =C2=A0 * @timeout: the time after which a job is removed from the
> scheduler.
> =C2=A0 * @name: name of the ring for which this scheduler is being used.
> =C2=A0 * @num_rqs: Number of run-queues. This is at most
> DRM_SCHED_PRIORITY_COUNT,
> @@ -518,6 +524,8 @@ struct drm_gpu_scheduler {
> =C2=A0	const struct drm_sched_backend_ops	*ops;
> =C2=A0	u32				credit_limit;
> =C2=A0	atomic_t			credit_count;
> +	u32				enqueue_credit_limit;
> +	atomic_t			enqueue_credit_count;
> =C2=A0	long				timeout;
> =C2=A0	const char			*name;
> =C2=A0	u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_rqs;
> @@ -550,6 +558,8 @@ struct drm_gpu_scheduler {
> =C2=A0 * @num_rqs: Number of run-queues. This may be at most
> DRM_SCHED_PRIORITY_COUNT,
> =C2=A0 *	=C2=A0=C2=A0=C2=A0=C2=A0 as there's usually one run-queue per pr=
iority, but may
> be less.
> =C2=A0 * @credit_limit: the number of credits this scheduler can hold fro=
m
> all jobs
> + * @enqueue_credit_limit: the number of credits that can be enqueued
> before
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_s=
ched_entity_push_job() blocks

Is it optional or not? Can it be deactivated?

It seems to me that it is optional, and so far only used in msm. If
there are no other parties in need for that mechanism, the right place
to have this feature probably is msm, which has all the knowledge about
when to block already.


Regards
P.


> =C2=A0 * @hang_limit: number of times to allow a job to hang before
> dropping it.
> =C2=A0 *		This mechanism is DEPRECATED. Set it to 0.
> =C2=A0 * @timeout: timeout value in jiffies for submitted jobs.
> @@ -564,6 +574,7 @@ struct drm_sched_init_args {
> =C2=A0	struct workqueue_struct *timeout_wq;
> =C2=A0	u32 num_rqs;
> =C2=A0	u32 credit_limit;
> +	u32 enqueue_credit_limit;
> =C2=A0	unsigned int hang_limit;
> =C2=A0	long timeout;
> =C2=A0	atomic_t *score;
> @@ -600,7 +611,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *ent=
ity,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner);
> =C2=A0void drm_sched_job_arm(struct drm_sched_job *job);
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> +int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *job,
> =C2=A0				 struct dma_fence *fence);
> =C2=A0int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

