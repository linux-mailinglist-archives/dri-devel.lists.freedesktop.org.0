Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16C4A33FDA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4149210EA89;
	Thu, 13 Feb 2025 13:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="O1mR/FTU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E1910EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:05:46 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YtwQv52lWz9skF;
 Thu, 13 Feb 2025 14:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1739451943; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5kqSvmNzwswbHip6SXUg28tvIe15CZto37LlfL7CFg=;
 b=O1mR/FTUbFpMB+oc/uUjfNRiilaH9d1aiSdtGESpF4I+r1jBN+GvsPHlTyEpV+LSjA6JWR
 OCgky89DWGV/GrRJts4TGUCwyKL26DR2FaE7/Ix2JmuaKi+5M/UCyydGwy8S+c42pbXPgX
 EsJtvt+mCWL410VIZ6Wlv+PDIP+mQClmGnqFjAMLtSJu1AWaUcsAI+LU/EhEnOYGiCf57/
 hoMKaq8Wn3QY1ywV3Ymkn19/MPYiJ/53+FM1dgHGqXkfDMBC2Nw48F9ixQ/g6fCGrNOy5+
 9+5YoTEHIby/gbMxrsjVZqvtcUZk3TzmnTSBte/y+EsanDuDK8PyguV6jFx3hA==
Message-ID: <08870ee9960cc90106859104b8053c0c3f1d0fbe.camel@mailbox.org>
Subject: Re: [RFC 2/5] drm/scheduler: Add scheduler unit testing
 infrastructure and some basic tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo Krummrich
 <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 13 Feb 2025 14:05:39 +0100
In-Reply-To: <20250207143337.60154-3-tvrtko.ursulin@igalia.com>
References: <20250207143337.60154-1-tvrtko.ursulin@igalia.com>
 <20250207143337.60154-3-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 61b6717fe9cb4c45d2b
X-MBO-RS-META: bd7nxk51mw1r1yt9uqmb9uz3auj5aj9a
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

I'm in principle OK with this series. We'll have to discuss a few more
things, but from my POV you could send the next revision as a v1.

Some more input below..

On Fri, 2025-02-07 at 14:33 +0000, Tvrtko Ursulin wrote:
> Implement a mock scheduler backend and add some basic test to
> exercise the
> core scheduler code paths.
>=20
> Mock backend (kind of like a very simple mock GPU) can either process
> jobs
> by tests manually advancing the "timeline" job at a time, or
> alternatively
> jobs can be configured with a time duration in which case they get
> completed asynchronously from the unit test code.
>=20
> Core scheduler classes are subclassed to support this mock
> implementation.
>=20
> The tests added are just a few simple submission patterns.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Philipp Stanner <phasta@kernel.org>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +
> =C2=A0.../gpu/drm/scheduler/tests/drm_mock_entity.c |=C2=A0 29 ++
> =C2=A0.../gpu/drm/scheduler/tests/drm_mock_job.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +
> =C2=A0.../drm/scheduler/tests/drm_mock_scheduler.c=C2=A0 | 255
> ++++++++++++++++++
> =C2=A0.../gpu/drm/scheduler/tests/drm_sched_tests.h | 128 +++++++++
> =C2=A0.../scheduler/tests/drm_sched_tests_basic.c=C2=A0=C2=A0 | 188 +++++=
++++++++
> =C2=A09 files changed, 632 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_entity.=
c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_job.c
> =C2=A0create mode 100644
> drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/drm_sched_tests.=
h
> =C2=A0create mode 100644
> drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c

I'm still not that convinced about the naming convention of those
files. They reside in drm/scheduler, but are called
drm_mock_{something}.c, almost reading as if they are about DRM in
general.

I think we should keep it consistent with the files in drm/scheduler/
and just call those drm/scheduler/tests/sched_mock_job.c etc.

>=20
> diff --git a/drivers/gpu/drm/Kconfig.debug
> b/drivers/gpu/drm/Kconfig.debug
> index a35d74171b7b..89f777f21e95 100644
> --- a/drivers/gpu/drm/Kconfig.debug
> +++ b/drivers/gpu/drm/Kconfig.debug
> @@ -88,5 +88,17 @@ config DRM_TTM_KUNIT_TEST
> =C2=A0
> =C2=A0	=C2=A0 If in doubt, say "N".
> =C2=A0
> +config DRM_SCHED_KUNIT_TEST
> +	tristate "KUnit tests for the DRM scheduler" if
> !KUNIT_ALL_TESTS
> +	select DRM_SCHED
> +	depends on DRM && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	=C2=A0 Choose this option to build unit tests for the DRM
> scheduler.
> +
> +	=C2=A0 Recommended for driver developers only.
> +
> +	=C2=A0 If in doubt, say "N".
> +
> =C2=A0config DRM_EXPORT_FOR_TESTS
> =C2=A0	bool
> diff --git a/drivers/gpu/drm/scheduler/.kunitconfig
> b/drivers/gpu/drm/scheduler/.kunitconfig
> new file mode 100644
> index 000000000000..cece53609fcf
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/.kunitconfig
> @@ -0,0 +1,12 @@
> +CONFIG_KUNIT=3Dy
> +CONFIG_DRM=3Dy
> +CONFIG_DRM_SCHED_KUNIT_TEST=3Dy
> +CONFIG_EXPERT=3Dy
> +CONFIG_DEBUG_SPINLOCK=3Dy
> +CONFIG_DEBUG_MUTEXES=3Dy
> +CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> +CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> +CONFIG_PROVE_LOCKING=3Dy
> +CONFIG_LOCKDEP=3Dy
> +CONFIG_DEBUG_LOCKDEP=3Dy
> +CONFIG_DEBUG_LIST=3Dy
> diff --git a/drivers/gpu/drm/scheduler/Makefile
> b/drivers/gpu/drm/scheduler/Makefile
> index 53863621829f..46dfdca0758a 100644
> --- a/drivers/gpu/drm/scheduler/Makefile
> +++ b/drivers/gpu/drm/scheduler/Makefile
> @@ -23,3 +23,4 @@
> =C2=A0gpu-sched-y :=3D sched_main.o sched_fence.o sched_entity.o
> =C2=A0
> =C2=A0obj-$(CONFIG_DRM_SCHED) +=3D gpu-sched.o
> +obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) +=3D tests/
> diff --git a/drivers/gpu/drm/scheduler/tests/Makefile
> b/drivers/gpu/drm/scheduler/tests/Makefile
> new file mode 100644
> index 000000000000..d69eab6a2e9b
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/Makefile
> @@ -0,0 +1,4 @@
> +
> +obj-$(CONFIG_DRM_SCHED_KUNIT_TEST) +=3D \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_mock_scheduler.o \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_tests_basic.o
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
> b/drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
> new file mode 100644
> index 000000000000..c9205f9ff524
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
> @@ -0,0 +1,29 @@
> +
> +#include "drm_sched_tests.h"
> +
> +struct drm_mock_sched_entity *
> +drm_mock_sched_entity_new(struct kunit *test,
> +			=C2=A0 enum drm_sched_priority priority,
> +			=C2=A0 struct drm_mock_scheduler *sched)
> +{
> +	struct drm_sched_mock_entity *entity;
> +	int ret;
> +
> +	entity =3D kunit_kmalloc(test, sizeof(*entity), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, entity);
> +
> +	ret =3D drm_sched_entity_init(&entity->base,
> +				=C2=A0=C2=A0=C2=A0 priority,
> +				=C2=A0=C2=A0=C2=A0 &sched->base, 1,
> +				=C2=A0=C2=A0=C2=A0 NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	entity->test =3D test;
> +
> +	return entity;
> +}
> +
> +void drm_mock_sched_entity_free(struct drm_mock_sched_entity
> *entity)
> +{
> +	drm_sched_entity_fini(&entity->base);
> +}
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_job.c
> b/drivers/gpu/drm/scheduler/tests/drm_mock_job.c
> new file mode 100644
> index 000000000000..d94568cf3da9
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_job.c
> @@ -0,0 +1,3 @@
> +
> +#include "drm_sched_tests.h"
> +
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> new file mode 100644
> index 000000000000..f65f7c0cfaf7
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
> @@ -0,0 +1,255 @@
> +
> +#include "drm_sched_tests.h"
> +
> +struct drm_mock_sched_entity *
> +drm_mock_new_sched_entity(struct kunit *test,
> +			=C2=A0 enum drm_sched_priority priority,
> +			=C2=A0 struct drm_mock_scheduler *sched)
> +{
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_gpu_scheduler *drm_sched;
> +	int ret;
> +
> +	entity =3D kunit_kzalloc(test, sizeof(*entity), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, entity);
> +
> +	drm_sched =3D &sched->base;
> +	ret =3D drm_sched_entity_init(&entity->base,
> +				=C2=A0=C2=A0=C2=A0 priority,
> +				=C2=A0=C2=A0=C2=A0 &drm_sched, 1,
> +				=C2=A0=C2=A0=C2=A0 NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	entity->test =3D test;
> +
> +	return entity;
> +}
> +
> +void drm_mock_sched_entity_free(struct drm_mock_sched_entity
> *entity)
> +{
> +	drm_sched_entity_destroy(&entity->base);
> +}
> +
> +static enum hrtimer_restart
> +drm_mock_sched_job_signal_timer(struct hrtimer *hrtimer)
> +{
> +	struct drm_mock_sched_job *upto =3D
> +		container_of(hrtimer, typeof(*upto), timer);
> +	struct drm_mock_scheduler *sched =3D
> +		drm_sched_to_mock_sched(upto->base.sched);
> +	struct drm_mock_sched_job *job, *next;
> +	ktime_t now =3D ktime_get();
> +	unsigned long flags;
> +	LIST_HEAD(signal);
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
> {
> +		if (!job->duration_us)
> +			break;
> +
> +		if (ktime_before(now, job->finish_at))
> +			break;
> +
> +		list_move_tail(&job->link, &signal);
> +		sched->hw_timeline.cur_seqno =3D job->hw_fence.seqno;
> +	}
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	list_for_each_entry(job, &signal, link) {
> +		dma_fence_signal(&job->hw_fence);
> +		dma_fence_put(&job->hw_fence);
> +	}
> +
> +	return HRTIMER_NORESTART;
> +}
> +
> +struct drm_mock_sched_job *
> +drm_mock_new_sched_job(struct kunit *test,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mock_sched_entity *ent=
ity)
> +{
> +	struct drm_mock_sched_job *job;
> +	int ret;
> +
> +	job =3D kunit_kzalloc(test, sizeof(*job), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, job);
> +
> +	ret =3D drm_sched_job_init(&job->base,
> +				 &entity->base,
> +				 1,
> +				 NULL);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	job->test =3D test;
> +
> +	spin_lock_init(&job->lock);
> +	INIT_LIST_HEAD(&job->link);
> +	hrtimer_init(&job->timer, CLOCK_MONOTONIC,
> HRTIMER_MODE_ABS);
> +	job->timer.function =3D drm_mock_sched_job_signal_timer;
> +
> +	return job;
> +}
> +
> +static const char *drm_mock_sched_hw_fence_driver_name(struct
> dma_fence *fence)
> +{
> +	return "drm_mock_sched";
> +}
> +
> +static const char *
> +drm_mock_sched_hw_fence_timeline_name(struct dma_fence *fence)
> +{
> +	struct drm_mock_sched_job *job =3D
> +		container_of(fence, typeof(*job), hw_fence);
> +
> +	return (const char *)job->base.sched->name;
> +}
> +static void drm_mock_sched_hw_fence_release(struct dma_fence *fence)

Regarding the function naming convention here everywhere,
"drm_mock_sched_{something}" I guess that's alright as far as I'm
concerned.

But just for some context, have you looked how other unit tests in
drivers/drm/ do their naming convention? Grep doesn't reveal any
drm_mock_* lines.

If there is a convention, would be great if drm/sched/ can be
congruent.


Thx,
P.


> +{
> +	struct drm_mock_sched_job *job =3D
> +		container_of(fence, typeof(*job), hw_fence);
> +
> +	hrtimer_cancel(&job->timer);
> +
> +	/* Freed by the kunit framework */
> +}
> +
> +static const struct dma_fence_ops drm_mock_sched_hw_fence_ops =3D {
> +	.get_driver_name =3D drm_mock_sched_hw_fence_driver_name,
> +	.get_timeline_name =3D drm_mock_sched_hw_fence_timeline_name,
> +	.release =3D drm_mock_sched_hw_fence_release,
> +};
> +
> +static struct dma_fence *mock_sched_run_job(struct drm_sched_job
> *sched_job)
> +{
> +	struct drm_mock_scheduler *sched =3D
> +		drm_sched_to_mock_sched(sched_job->sched);
> +	struct drm_mock_sched_job *job =3D
> drm_sched_job_to_mock_job(sched_job);
> +
> +	dma_fence_init(&job->hw_fence,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_mock_sched_hw_fence_ops,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &job->lock,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched->hw_timeline.context,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc_return(&sched-
> >hw_timeline.next_seqno));
> +
> +	dma_fence_get(&job->hw_fence); /* Reference for the job_list
> */
> +
> +	spin_lock_irq(&sched->lock);
> +	if (job->duration_us) {
> +		ktime_t prev_finish_at =3D 0;
> +
> +		if (!list_empty(&sched->job_list)) {
> +			struct drm_mock_sched_job *prev =3D
> +				list_last_entry(&sched->job_list,
> typeof(*prev),
> +						link);
> +
> +			prev_finish_at =3D prev->finish_at;
> +		}
> +
> +		if (!prev_finish_at)
> +			prev_finish_at =3D ktime_get();
> +
> +		job->finish_at =3D ktime_add_us(prev_finish_at, job-
> >duration_us);
> +	}
> +	list_add_tail(&job->link, &sched->job_list);
> +	if (job->finish_at)
> +		hrtimer_start(&job->timer, job->finish_at,
> HRTIMER_MODE_ABS);
> +	spin_unlock_irq(&sched->lock);
> +
> +	return &job->hw_fence;
> +}
> +
> +static enum drm_gpu_sched_stat
> +mock_sched_timedout_job(struct drm_sched_job *sched_job)
> +{
> +	return DRM_GPU_SCHED_STAT_ENODEV;
> +}
> +
> +static void mock_sched_free_job(struct drm_sched_job *sched_job)
> +{
> +	drm_sched_job_cleanup(sched_job);
> +}
> +
> +static const struct drm_sched_backend_ops drm_mock_scheduler_ops =3D {
> +	.run_job =3D mock_sched_run_job,
> +	.timedout_job =3D mock_sched_timedout_job,
> +	.free_job =3D mock_sched_free_job
> +};
> +
> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
> *test)
> +{
> +	struct drm_mock_scheduler *sched;
> +	int ret;
> +
> +	sched =3D kunit_kzalloc(test, sizeof(*sched), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, sched);
> +
> +	ret =3D drm_sched_init(&sched->base,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 &drm_mock_scheduler_ops,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, /* wq */
> +			=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 U32_MAX, /* max credits */
> +			=C2=A0=C2=A0=C2=A0=C2=A0 UINT_MAX, /* hang limit */
> +			=C2=A0=C2=A0=C2=A0=C2=A0 MAX_SCHEDULE_TIMEOUT, /* timeout */
> +			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, /* timeout wq */
> +			=C2=A0=C2=A0=C2=A0=C2=A0 NULL, /* score */
> +			=C2=A0=C2=A0=C2=A0=C2=A0 "drm-mock-scheduler",
> +			=C2=A0=C2=A0=C2=A0=C2=A0 NULL /* dev */);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	sched->test =3D test;
> +	sched->hw_timeline.context =3D dma_fence_context_alloc(1);
> +	atomic_set(&sched->hw_timeline.next_seqno, 0);
> +	INIT_LIST_HEAD(&sched->job_list);
> +	spin_lock_init(&sched->lock);
> +
> +	return sched;
> +}
> +
> +void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched)
> +{
> +	struct drm_mock_sched_job *job, *next;
> +	unsigned long flags;
> +	LIST_HEAD(signal);
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
> +		list_move_tail(&job->link, &signal);
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	list_for_each_entry(job, &signal, link) {
> +		hrtimer_cancel(&job->timer);
> +		dma_fence_put(&job->hw_fence);
> +	}
> +
> +	drm_sched_fini(&sched->base);
> +}
> +
> +unsigned int drm_mock_sched_advance(struct drm_mock_scheduler
> *sched,
> +				=C2=A0=C2=A0=C2=A0 unsigned int num)
> +{
> +	struct drm_mock_sched_job *job, *next;
> +	unsigned int found =3D 0;
> +	unsigned long flags;
> +	LIST_HEAD(signal);
> +
> +	spin_lock_irqsave(&sched->lock, flags);
> +	if (WARN_ON_ONCE(sched->hw_timeline.cur_seqno + num <
> +			 sched->hw_timeline.cur_seqno))
> +		goto unlock;
> +	sched->hw_timeline.cur_seqno +=3D num;
> +	list_for_each_entry_safe(job, next, &sched->job_list, link)
> {
> +		if (sched->hw_timeline.cur_seqno < job-
> >hw_fence.seqno)
> +			break;
> +
> +		list_move_tail(&job->link, &signal);
> +		found++;
> +	}
> +unlock:
> +	spin_unlock_irqrestore(&sched->lock, flags);
> +
> +	list_for_each_entry(job, &signal, link) {
> +		dma_fence_signal(&job->hw_fence);
> +		dma_fence_put(&job->hw_fence);
> +	}
> +
> +	return found;
> +}
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
> b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
> new file mode 100644
> index 000000000000..e22f7ead6d4e
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
> @@ -0,0 +1,128 @@
> +#ifndef _DRM_SCHED_TESTS_H_
> +#define _DRM_SCHED_TESTS_H_
> +
> +#include <kunit/test.h>
> +#include <linux/atomic.h>
> +#include <linux/dma-fence.h>
> +#include <linux/hrtimer.h>
> +#include <linux/ktime.h>
> +#include <linux/list.h>
> +#include <linux/atomic.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +#include <drm/gpu_scheduler.h>
> +
> +struct drm_mock_scheduler {
> +	struct drm_gpu_scheduler base;
> +
> +	struct kunit		*test;
> +
> +	spinlock_t		lock;
> +	struct list_head	job_list; /* Protected by the lock
> */
> +
> +	struct {
> +		u64		context;
> +		atomic_t	next_seqno;
> +		unsigned int	cur_seqno; /* Protected by the lock
> */
> +	} hw_timeline;
> +};
> +
> +struct drm_mock_sched_entity {
> +	struct drm_sched_entity base;
> +
> +	struct kunit		*test;
> +};
> +
> +struct drm_mock_sched_job {
> +	struct drm_sched_job	base;
> +
> +	struct list_head	link;
> +	struct hrtimer		timer;
> +
> +	unsigned int		duration_us;
> +	ktime_t			finish_at;
> +
> +	spinlock_t		lock;
> +	struct dma_fence	hw_fence;
> +
> +	struct kunit		*test;
> +};
> +
> +static inline struct drm_mock_scheduler *
> +drm_sched_to_mock_sched(struct drm_gpu_scheduler *sched)
> +{
> +	return container_of(sched, struct drm_mock_scheduler, base);
> +};
> +
> +static inline struct drm_mock_sched_entity *
> +drm_sched_entity_to_mock_entity(struct drm_sched_entity
> *sched_entity)
> +{
> +	return container_of(sched_entity, struct
> drm_mock_sched_entity, base);
> +};
> +
> +static inline struct drm_mock_sched_job *
> +drm_sched_job_to_mock_job(struct drm_sched_job *sched_job)
> +{
> +	return container_of(sched_job, struct drm_mock_sched_job,
> base);
> +};
> +
> +struct drm_mock_scheduler *drm_mock_new_scheduler(struct kunit
> *test);
> +void drm_mock_scheduler_fini(struct drm_mock_scheduler *sched);
> +unsigned int drm_mock_sched_advance(struct drm_mock_scheduler
> *sched,
> +				=C2=A0=C2=A0=C2=A0 unsigned int num);
> +
> +struct drm_mock_sched_entity *
> +drm_mock_new_sched_entity(struct kunit *test,
> +			=C2=A0 enum drm_sched_priority priority,
> +			=C2=A0 struct drm_mock_scheduler *sched);
> +void drm_mock_sched_entity_free(struct drm_mock_sched_entity
> *entity);
> +
> +struct drm_mock_sched_job *
> +drm_mock_new_sched_job(struct kunit *test,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_mock_sched_entity *ent=
ity);
> +
> +static inline void drm_mock_sched_job_submit(struct
> drm_mock_sched_job *job)
> +{
> +	drm_sched_job_arm(&job->base);
> +	drm_sched_entity_push_job(&job->base);
> +}
> +
> +static inline void
> +drm_mock_sched_job_set_duration_us(struct drm_mock_sched_job *job,
> +				=C2=A0=C2=A0 unsigned int duration_us)
> +{
> +	job->duration_us =3D duration_us;
> +}
> +
> +static inline bool
> +drm_mock_sched_job_is_finished(struct drm_mock_sched_job *job)
> +{
> +	return dma_fence_is_signaled(&job->base.s_fence->finished);
> +}
> +
> +static inline bool
> +drm_mock_sched_job_wait_finished(struct drm_mock_sched_job *job,
> long timeout)
> +{
> +	long ret;
> +
> +	ret =3D dma_fence_wait_timeout(&job->base.s_fence->finished,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout);
> +
> +	return ret !=3D 0;
> +}
> +
> +static inline long
> +drm_mock_sched_job_wait_scheduled(struct drm_mock_sched_job *job,
> long timeout)
> +{
> +	long ret;
> +
> +	ret =3D dma_fence_wait_timeout(&job->base.s_fence->scheduled,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 timeout);
> +
> +	return ret !=3D 0;
> +}
> +
> +#endif
> diff --git a/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> new file mode 100644
> index 000000000000..030d7e6ea484
> --- /dev/null
> +++ b/drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c
> @@ -0,0 +1,188 @@
> +
> +#include "drm_sched_tests.h"
> +
> +static int drm_sched_basic_init(struct kunit *test)
> +{
> +	test->priv =3D drm_mock_new_scheduler(test);
> +
> +	return 0;
> +}
> +
> +static void drm_sched_basic_exit(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +
> +	drm_mock_scheduler_fini(sched);
> +}
> +
> +static void drm_sched_basic_submit(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job *job;
> +	unsigned int i;
> +	bool done;
> +
> +	/*
> +	 * Submit one job to the scheduler and verify that it gets
> scheduled
> +	 * and completed only when the mock hw backend processes it.
> +	 */
> +
> +	entity =3D drm_mock_new_sched_entity(test,
> +					=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> +					=C2=A0=C2=A0 sched);
> +	job =3D drm_mock_new_sched_job(test, entity);
> +
> +	drm_mock_sched_job_submit(job);
> +
> +	done =3D drm_mock_sched_job_wait_scheduled(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ / 2);
> +	KUNIT_ASSERT_EQ(test, done, false);
> +
> +	i =3D drm_mock_sched_advance(sched, 1);
> +	KUNIT_ASSERT_EQ(test, i, 1);
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
> +struct drm_sched_basic_params {
> +	const char *description;
> +	unsigned int queue_depth;
> +	unsigned int num_entities;
> +	unsigned int job_us;
> +	bool dep_chain;
> +};
> +
> +static const struct drm_sched_basic_params drm_sched_basic_cases[] =3D
> {
> +	{
> +		.description =3D "A queue of jobs in a single entity",
> +		.queue_depth =3D 100,
> +		.job_us =3D 1000,
> +		.num_entities =3D 1,
> +	},
> +	{
> +		.description =3D "A chain of dependent jobs across
> multiple entities",
> +		.queue_depth =3D 100,
> +		.job_us =3D 1000,
> +		.num_entities =3D 1,
> +		.dep_chain =3D true,
> +	},
> +	{
> +		.description =3D "Multiple independent job queues",
> +		.queue_depth =3D 100,
> +		.job_us =3D 1000,
> +		.num_entities =3D 4,
> +	},
> +	{
> +		.description =3D "Multiple inter-dependent job
> queues",
> +		.queue_depth =3D 100,
> +		.job_us =3D 1000,
> +		.num_entities =3D 4,
> +		.dep_chain =3D true,
> +	},
> +};
> +
> +static void
> +drm_sched_basic_desc(const struct drm_sched_basic_params *params,
> char *desc)
> +{
> +	strscpy(desc, params->description, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(drm_sched_basic, drm_sched_basic_cases,
> drm_sched_basic_desc);
> +
> +static void drm_sched_basic_test(struct kunit *test)
> +{
> +	const struct drm_sched_basic_params *params =3D test-
> >param_value;
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_job *job, *prev =3D NULL;
> +	struct drm_mock_sched_entity **entity;
> +	unsigned int i, cur_ent =3D 0;
> +	bool done;
> +
> +	entity =3D kunit_kcalloc(test, params->num_entities,
> sizeof(*entity),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, entity);
> +
> +	for (i =3D 0; i < params->num_entities; i++)
> +		entity[i] =3D drm_mock_new_sched_entity(test,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched);
> +
> +	for (i =3D 0; i < params->queue_depth; i++) {
> +		job =3D drm_mock_new_sched_job(test,
> entity[cur_ent++]);
> +		cur_ent %=3D params->num_entities;
> +		drm_mock_sched_job_set_duration_us(job, params-
> >job_us);
> +		if (params->dep_chain && prev)
> +			drm_sched_job_add_dependency(&job->base,
> +						=C2=A0=C2=A0=C2=A0=C2=A0
> dma_fence_get(&prev->base.s_fence->finished));
> +		drm_mock_sched_job_submit(job);
> +		prev =3D job;
> +	}
> +
> +	done =3D drm_mock_sched_job_wait_finished(job, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	for (i =3D 0; i < params->num_entities; i++)
> +		drm_mock_sched_entity_free(entity[i]);
> +}
> +
> +static void drm_sched_basic_entity_cleanup(struct kunit *test)
> +{
> +	struct drm_mock_sched_job *job, *mid, *prev =3D NULL;
> +	struct drm_mock_scheduler *sched =3D test->priv;
> +	struct drm_mock_sched_entity *entity[4];
> +	const unsigned int qd =3D 100;
> +	unsigned int i, cur_ent =3D 0;
> +	bool done;
> +
> +	/*
> +	 * Submit a queue of jobs across different entities with an
> explicit
> +	 * chain of dependencies between them and trigger entity
> cleanup while
> +	 * the queue is still being processed.
> +	 */
> +
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		entity[i] =3D drm_mock_new_sched_entity(test,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DRM_SCHED_PRIORITY_NORMAL,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched);
> +
> +	for (i =3D 0; i < qd; i++) {
> +		job =3D drm_mock_new_sched_job(test,
> entity[cur_ent++]);
> +		cur_ent %=3D ARRAY_SIZE(entity);
> +		drm_mock_sched_job_set_duration_us(job, 1000);
> +		if (prev)
> +			drm_sched_job_add_dependency(&job->base,
> +						=C2=A0=C2=A0=C2=A0=C2=A0
> dma_fence_get(&prev->base.s_fence->finished));
> +		drm_mock_sched_job_submit(job);
> +		if (i =3D=3D qd / 2)
> +			mid =3D job;
> +		prev =3D job;
> +	}
> +
> +	done =3D drm_mock_sched_job_wait_finished(mid, HZ);
> +	KUNIT_ASSERT_EQ(test, done, true);
> +
> +	/* Exit with half of the queue still pending to be executed.
> */
> +	for (i =3D 0; i < ARRAY_SIZE(entity); i++)
> +		drm_mock_sched_entity_free(entity[i]);}
> +
> +static struct kunit_case drm_sched_basic_tests[] =3D {
> +	KUNIT_CASE(drm_sched_basic_submit),
> +	KUNIT_CASE_PARAM(drm_sched_basic_test,
> drm_sched_basic_gen_params),
> +	KUNIT_CASE(drm_sched_basic_entity_cleanup),
> +	{}
> +};
> +
> +static struct kunit_suite drm_sched_basic =3D {
> +	.name =3D "drm_sched_basic_tests",
> +	.init =3D drm_sched_basic_init,
> +	.exit =3D drm_sched_basic_exit,
> +	.test_cases =3D drm_sched_basic_tests,
> +};
> +
> +kunit_test_suite(drm_sched_basic);

