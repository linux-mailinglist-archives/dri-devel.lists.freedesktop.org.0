Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB4EA95D7E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 07:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8CE10E0D6;
	Tue, 22 Apr 2025 05:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="d52MDDUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2E010E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 05:44:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZhWPp4GyNz9tx8;
 Tue, 22 Apr 2025 07:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1745300638; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyl7DJE78Xhm6JuARKMqr4JVN1d0XAr7vflFDVsTzpc=;
 b=d52MDDUTEKA7/iP2N+fmprIs+HB7UP9lvV5ZIcSvpTnM6doeH86pMn1vSX2Dhd1gyo3Ljm
 qqGrgWfGc15JYazrqjx3dibSQMytpzgp2OJrkDPCeq9bvnftdwlcCxDP2JEYKkOYA3v63v
 XawY608Gxb2ywkbBZrSDc4Q3axU0ErP57yLFU1gji76TjQKuUAlNvxAm5WPmQmATt1DPmU
 9/7LJ/t2mn1/aS7COTZq4jdLG0Aa5GePT0ogGDexvQ/VNNIwa1+J5jwi8+DIKF4Kd6BmwX
 NIYhTRk/a/5xaxGKejxidOCtcR+Bv8Saot7MfD2wx+yBLzuqJDJLgffQPljIbQ==
Message-ID: <72c759df0988d48ae64c749927969168369837bc.camel@mailbox.org>
Subject: Re: [RFC] drm/sched: Allow drivers to register for pending list
 cleanup
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Tue, 22 Apr 2025 07:43:54 +0200
In-Reply-To: <20250418113211.69956-1-tvrtko.ursulin@igalia.com>
References: <20250418113211.69956-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: c835256d4206cd4ca65
X-MBO-RS-META: p35x8eq161mdrjkjbqsbyquiax5o5u1r
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

On Fri, 2025-04-18 at 12:32 +0100, Tvrtko Ursulin wrote:
> Quick sketch idea for an alternative to
> https://lore.kernel.org/dri-devel/20250407152239.34429-2-phasta@kernel.or=
g/
> .
>=20
> It is possible it achieves the same effect but with less code and not
> further growing the internal state machine. The callback it adds is
> also
> aligned in spirit (prototype) with other drm_sched_backend_ops
> callbacks.
>=20
> The new callback is ->cancel_job(job) which is called after
> drm_sched_fini() stops the workqueue for all jobs in the
> pending_list.
> After which, instead of waiting on the free worker to free jobs one
> by
> one, all are freed directly.
>=20
> As a demonstration we can remove the driver specific cleanup code
> from the
> mock scheduler. (End result tested for no memory leaks or crashes.)
>=20
> Please check if I am missed some gotcha etc. And if nouveau can by
> made to
> use it.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 33 ++++----
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 76 ++++++++---=
------
> --
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h |=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c |=C2=A0 1 +
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 =
+++++
> =C2=A05 files changed, 77 insertions(+), 59 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 829579c41c6b..6be11befef68 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1349,25 +1349,23 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0EXPORT_SYMBOL(drm_sched_init);
> =C2=A0
> =C2=A0/**
> - * drm_sched_fini - Destroy a gpu scheduler
> + * drm_sched_fini - Tear down and clean up the scheduler
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> =C2=A0 *
> - * Tears down and cleans up the scheduler.
> + * In the process of tear down and cleanup this stops submission of
> new jobs to
> + * the hardware through drm_sched_backend_ops.run_job(), as well as
> freeing of
> + * completed jobs via drm_sched_backend_ops.free_job().
> =C2=A0 *
> - * This stops submission of new jobs to the hardware through
> - * drm_sched_backend_ops.run_job(). Consequently,
> drm_sched_backend_ops.free_job()
> - * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> - * There is no solution for this currently. Thus, it is up to the
> driver to make
> - * sure that:
> + * If the driver does not implement
> drm_sched_backend_ops.cleanup_job(), which
> + * is recommended, drm_sched_backend_ops.free_job() will not be
> called for all
> + * jobs still in drm_gpu_scheduler.pending_list. In this case it is
> up to the
> + * driver to make sure that:
> =C2=A0 *
> - *=C2=A0 a) drm_sched_fini() is only called after for all submitted jobs
> - *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been cal=
led or that
> - *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has not
> been called
> + *=C2=A0 a) Drm_sched_fini() is only called after for all submitted jobs
> + *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been cal=
led or that;
> + *=C2=A0 b) The jobs for which drm_sched_backend_ops.free_job() has not
> been called
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed man=
ually.
> - *
> - * FIXME: Take care of the above problem and prevent this function
> from leaking
> - * the jobs in drm_gpu_scheduler.pending_list under any
> circumstances.
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> @@ -1397,6 +1395,15 @@ void drm_sched_fini(struct drm_gpu_scheduler
> *sched)
> =C2=A0	/* Confirm no work left behind accessing device structures
> */
> =C2=A0	cancel_delayed_work_sync(&sched->work_tdr);
> =C2=A0
> +	if (sched->ops->cancel_job) {
> +		struct drm_sched_job *job;
> +
> +		list_for_each_entry_reverse(job, &sched-
> >pending_list, list) {
> +			sched->ops->cancel_job(job);
> +			sched->ops->free_job(job);
> +		}
> +	}
> +
> =C2=A0	if (sched->own_submit_wq)
> =C2=A0		destroy_workqueue(sched->submit_wq);
> =C2=A0	sched->ready =3D false;
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index f999c8859cf7..3c6be5ca26db 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct
> drm_mock_sched_job *job)
> =C2=A0	lockdep_assert_held(&sched->lock);
> =C2=A0
> =C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_DONE;
> -	list_move_tail(&job->link, &sched->done_list);
> +	list_del(&job->link);
> =C2=A0	dma_fence_signal(&job->hw_fence);
> =C2=A0	complete(&job->done);
> =C2=A0}
> @@ -200,29 +200,49 @@ static struct dma_fence
> *mock_sched_run_job(struct drm_sched_job *sched_job)
> =C2=A0	return &job->hw_fence;
> =C2=A0}
> =C2=A0
> +static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
> +{
> +	struct drm_mock_scheduler *sched =3D
> +		drm_sched_to_mock_sched(sched_job->sched);
> +	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> +
> +	hrtimer_cancel(&job->timer);
> +
> +	spin_lock_irq(&sched->lock);
> +	spin_lock(&job->lock);
> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
> +		job->flags |=3D DRM_MOCK_SCHED_JOB_CANCELED;
> +		list_del(&job->link);
> +		dma_fence_set_error(&job->hw_fence, -ECANCELED);
> +		dma_fence_signal_locked(&job->hw_fence);
> +		complete(&job->done);
> +	}
> +	spin_unlock(&job->lock);
> +	spin_unlock_irq(&sched->lock);
> +}
> +
> =C2=A0static enum drm_gpu_sched_stat
> =C2=A0mock_sched_timedout_job(struct drm_sched_job *sched_job)
> =C2=A0{
> +	struct drm_mock_scheduler *sched =3D
> +		drm_sched_to_mock_sched(sched_job->sched);
> =C2=A0	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> =C2=A0
> +	spin_lock_irq(&sched->lock);
> =C2=A0	job->flags |=3D DRM_MOCK_SCHED_JOB_TIMEDOUT;
> +	list_del(&job->link);
> +	dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
> +	dma_fence_signal(&job->hw_fence);
> +	spin_unlock_irq(&sched->lock);
> =C2=A0
> =C2=A0	return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}
> =C2=A0
> -static void mock_sched_free_job(struct drm_sched_job *sched_job)
> +void drm_mock_sched_job_free(struct drm_sched_job *sched_job)
> =C2=A0{
> -	struct drm_mock_scheduler *sched =3D
> -			drm_sched_to_mock_sched(sched_job->sched);
> =C2=A0	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> -	unsigned long flags;
> =C2=A0
> -	/* Remove from the scheduler done list. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_del(&job->link);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> =C2=A0	dma_fence_put(&job->hw_fence);
> -
> =C2=A0	drm_sched_job_cleanup(sched_job);
> =C2=A0
> =C2=A0	/* Mock job itself is freed by the kunit framework. */
> @@ -230,8 +250,9 @@ static void mock_sched_free_job(struct
> drm_sched_job *sched_job)
> =C2=A0
> =C2=A0static const struct drm_sched_backend_ops drm_mock_scheduler_ops =
=3D {
> =C2=A0	.run_job =3D mock_sched_run_job,
> +	.cancel_job =3D mock_sched_cancel_job,
> =C2=A0	.timedout_job =3D mock_sched_timedout_job,
> -	.free_job =3D mock_sched_free_job
> +	.free_job =3D drm_mock_sched_job_free
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -265,7 +286,6 @@ struct drm_mock_scheduler
> *drm_mock_sched_new(struct kunit *test, long timeout)
> =C2=A0	sched->hw_timeline.context =3D dma_fence_context_alloc(1);
> =C2=A0	atomic_set(&sched->hw_timeline.next_seqno, 0);
> =C2=A0	INIT_LIST_HEAD(&sched->job_list);
> -	INIT_LIST_HEAD(&sched->done_list);
> =C2=A0	spin_lock_init(&sched->lock);
> =C2=A0
> =C2=A0	return sched;
> @@ -280,38 +300,6 @@ struct drm_mock_scheduler
> *drm_mock_sched_new(struct kunit *test, long timeout)
> =C2=A0 */
> =C2=A0void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
> =C2=A0{
> -	struct drm_mock_sched_job *job, *next;
> -	unsigned long flags;
> -	LIST_HEAD(list);
> -
> -	drm_sched_wqueue_stop(&sched->base);
> -
> -	/* Force complete all unfinished jobs. */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->job_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry(job, &list, link)
> -		hrtimer_cancel(&job->timer);
> -
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &list, link)
> -		drm_mock_sched_job_complete(job);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	/*
> -	 * Free completed jobs and jobs not yet processed by the DRM
> scheduler
> -	 * free worker.
> -	 */
> -	spin_lock_irqsave(&sched->lock, flags);
> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
> -		list_move_tail(&job->link, &list);
> -	spin_unlock_irqrestore(&sched->lock, flags);
> -
> -	list_for_each_entry_safe(job, next, &list, link)
> -		mock_sched_free_job(&job->base);
> -
> =C2=A0	drm_sched_fini(&sched->base);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 27caf8285fb7..7b4e09ad6858 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -49,7 +49,6 @@ struct drm_mock_scheduler {
> =C2=A0
> =C2=A0	spinlock_t		lock;
> =C2=A0	struct list_head	job_list;
> -	struct list_head	done_list;
> =C2=A0
> =C2=A0	struct {
> =C2=A0		u64		context;
> @@ -97,7 +96,8 @@ struct drm_mock_sched_job {
> =C2=A0	struct completion	done;
> =C2=A0
> =C2=A0#define DRM_MOCK_SCHED_JOB_DONE		0x1
> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> +#define DRM_MOCK_SCHED_JOB_CANCELED	0x2
> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x4
> =C2=A0	unsigned long		flags;
> =C2=A0
> =C2=A0	struct list_head	link;
> @@ -146,6 +146,8 @@ struct drm_mock_sched_job *
> =C2=A0drm_mock_sched_job_new(struct kunit *test,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mock_sched_entity=
 *entity);
> =C2=A0
> +void drm_mock_sched_job_free(struct drm_sched_job *sched_job);
> +
> =C2=A0/**
> =C2=A0 * drm_mock_sched_job_submit - Arm and submit a job in one go
> =C2=A0 *
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 7230057e0594..968b3046745f 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -241,6 +241,7 @@ static void drm_sched_basic_timeout(struct kunit
> *test)
> =C2=A0			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> =C2=A0			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> =C2=A0
> +	drm_mock_sched_job_free(&job->base);
> =C2=A0	drm_mock_sched_entity_free(entity);
> =C2=A0}
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..0bcbc3ce8188 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -503,6 +503,26 @@ struct drm_sched_backend_ops {
> =C2=A0	 */
> =C2=A0	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job
> *sched_job);
> =C2=A0
> +	/**
> +	 * @cancel_job: Called during pending job cleanup on
> scheduler destroy
> +	 *
> +	 * @sched_job: The job to cancel
> +	 *
> +	 * Called from drm_sched_fini() for every job on the
> +	 * &drm_sched.pending_list after scheduler workqueues have
> been stopped
> +	 * in drm_sched_fini().
> +	 *
> +	 * Job should either be allowed to finish or revoked from
> the backend
> +	 * and signaled with an appropriate fence errno (-
> ECANCELED). After the
> +	 * callback returns scheduler will call
> +	 * &drm_sched_backend_ops.free_job() after which scheduler
> teardown will
> +	 * proceed.
> +	 *
> +	 * Callback is optional but recommended for avoiding memory
> leaks after
> +	 * scheduler tear down.
> +	 */
> +	void (*cancel_job)(struct drm_sched_job *sched_job);


Tvrtko, sorry but this looks absolutely like a reimplementation of my
fix, the sole difference being that the callback has a different name.

Everything else is the same, even the check for the callback.

The only difference I might be able to see (if I try really hard) is
that you don't kill the entire fence context, but cancel job-by-job.

But let's look at it, what does it "kill the fence context" mean? It
means that all fences belonging to the context have to be signaled with
an error =E2=80=93 precisely what you and I do, but with different names.

So I really don't get why you send this patch after I literally spend
months figuring this path forward out.

P.



> +
> =C2=A0	/**
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @free_job: Calle=
d once the job's finished fence has been
> signaled
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's time to=
 clean it up.

