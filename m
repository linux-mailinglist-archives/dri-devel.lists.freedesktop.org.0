Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16ABAFE9AB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE5510E7E3;
	Wed,  9 Jul 2025 13:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WHx8jfOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCA010E7E3;
 Wed,  9 Jul 2025 13:08:37 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bcdZn6X7Kz9tKX;
 Wed,  9 Jul 2025 15:08:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752066514; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kwNYbAXDh5buJKLy2FCMfa+L/ZlmSBvDJJcgs1ljTT8=;
 b=WHx8jfObhikXEUkoeBU1uakxcf+7RwrLIxPnVYX8o+Ij2Ori65joOftJO27L9rrS6r5XcX
 M07AYL9oG1x0fDqExzS3qHRMaQeQcB1R4lneXoAAS7XlFklRnCh4ucROcHGnrFr91c9Lio
 +6IL6zibjJpAKSFU9Y4QKXJ+d+6HDdhBviSG8t5gdjtJh+RWDNNKZISbAuX6fpLjw8X75i
 Hiys7Is6HGp4FpLymTDrs7WBCmjBu0mxMUnTADtNBHToP1XqAghaVKnZ38Y5QIR10wZ0Wp
 hh6MNskNAllCMPjcU8zoeCVn8PVS2LUMl5T3WIW3K/khHl7pWGeiYwa8Uckrig==
Message-ID: <d1ef5cca7c63ecbfd7f1aad04952442eb54dd42e.camel@mailbox.org>
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Wed, 09 Jul 2025 15:08:25 +0200
In-Reply-To: <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: ce00a1ff8e24e23f432
X-MBO-RS-META: 3us6p3a7b7qwqxqaikhmxdo338bfgmmu
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

On Tue, 2025-07-08 at 10:25 -0300, Ma=C3=ADra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't
> hung;
> instead, a job just took unusually long (longer than the timeout) but
> is
> still running, and there is, thus, no reason to reset the hardware.
> This
> can occur in two scenarios:
>=20
> =C2=A0 1. The job is taking longer than the timeout, but the driver
> determined
> =C2=A0=C2=A0=C2=A0=C2=A0 through a GPU-specific mechanism that the hardwa=
re is still
> making
> =C2=A0=C2=A0=C2=A0=C2=A0 progress. Hence, the driver would like the sched=
uler to skip the
> =C2=A0=C2=A0=C2=A0=C2=A0 timeout and treat the job as still pending from =
then onward.
> This
> =C2=A0=C2=A0=C2=A0=C2=A0 happens in v3d, Etnaviv, and Xe.
> =C2=A0 2. Timeout has fired before the free-job worker. Consequently, the
> =C2=A0=C2=A0=C2=A0=C2=A0 scheduler calls `sched->ops->timedout_job()` for=
 a job that
> isn't
> =C2=A0=C2=A0=C2=A0=C2=A0 timed out.
>=20
> These two scenarios are problematic because the job was removed from
> the
> `sched->pending_list` before calling `sched->ops->timedout_job()`,
> which
> means that when the job finishes, it won't be freed by the scheduler
> though `sched->ops->free_job()` - leading to a memory leak.
>=20
> To solve these problems, create a new `drm_gpu_sched_stat`, called
> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip the reset.
> The
> new status will indicate that the job must be reinserted into
> `sched->pending_list`, and the hardware / driver will still complete
> that
> job.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 46
> ++++++++++++++++++++++++++++++++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A02 files changed, 47 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index
> 0f32e2cb43d6af294408968a970990f9f5c47bee..657846d56dacd4f26fffc954fc3
> d025c1e6bfc9f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -374,11 +374,16 @@ static void drm_sched_run_free_queue(struct
> drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0	struct drm_sched_job *job;
> =C2=A0
> -	spin_lock(&sched->job_list_lock);
> =C2=A0	job =3D list_first_entry_or_null(&sched->pending_list,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job, list=
);
> =C2=A0	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> =C2=A0		__drm_sched_run_free_queue(sched);
> +}
> +
> +static void drm_sched_run_free_queue_unlocked(struct
> drm_gpu_scheduler *sched)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	drm_sched_run_free_queue(sched);
> =C2=A0	spin_unlock(&sched->job_list_lock);
> =C2=A0}
> =C2=A0
> @@ -531,6 +536,32 @@ static void drm_sched_job_begin(struct
> drm_sched_job *s_job)
> =C2=A0	spin_unlock(&sched->job_list_lock);
> =C2=A0}
> =C2=A0
> +/**
> + * drm_sched_job_reinsert_on_false_timeout - reinsert the job on a
> false timeout
> + * @sched: scheduler instance
> + * @job: job to be reinserted on the pending list
> + *
> + * In the case of a "false timeout" - when a timeout occurs but the
> GPU isn't
> + * hung and is making progress, the scheduler must reinsert the job
> back into
> + * @sched->pending_list. Otherwise, the job and its resources won't
> be freed
> + * through the &struct drm_sched_backend_ops.free_job callback.
> + *
> + * This function must be used in "false timeout" cases only.
> + */
> +static void drm_sched_job_reinsert_on_false_timeout(struct
> drm_gpu_scheduler *sched,
> +						=C2=A0=C2=A0=C2=A0 struct
> drm_sched_job *job)
> +{
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&job->list, &sched->pending_list);
> +
> +	/* After reinserting the job, the scheduler enqueues the
> free-job work
> +	 * again if ready. Otherwise, a signaled job could be added
> to the
> +	 * pending list, but never freed.
> +	 */
> +	drm_sched_run_free_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
> =C2=A0static void drm_sched_job_timedout(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched;
> @@ -564,6 +595,9 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0			job->sched->ops->free_job(job);
> =C2=A0			sched->free_guilty =3D false;
> =C2=A0		}
> +
> +		if (status =3D=3D DRM_GPU_SCHED_STAT_NO_HANG)
> +			drm_sched_job_reinsert_on_false_timeout(sche
> d, job);
> =C2=A0	} else {
> =C2=A0		spin_unlock(&sched->job_list_lock);
> =C2=A0	}
> @@ -586,6 +620,10 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0 * This function is typically used for reset recovery (see the docu
> of
> =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not call i=
t
> for
> =C2=A0 * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's only used for reset recovery, drivers must not call this
> function
> + * in their &struct drm_sched_backend_ops.timedout_job callback when
> they
> + * skip a reset using &enum
> drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
> =C2=A0 */
> =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> drm_sched_job *bad)
> =C2=A0{
> @@ -671,6 +709,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not call i=
t
> for
> =C2=A0 * scheduler startup. The scheduler itself is fully operational
> after
> =C2=A0 * drm_sched_init() succeeded.
> + *
> + * As it's only used for reset recovery, drivers must not call this
> function
> + * in their &struct drm_sched_backend_ops.timedout_job callback when
> they
> + * skip a reset using &enum
> drm_gpu_sched_stat.DRM_GPU_SCHED_STAT_NO_HANG.
> =C2=A0 */
> =C2=A0void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> =C2=A0{
> @@ -1192,7 +1234,7 @@ static void drm_sched_free_job_work(struct
> work_struct *w)
> =C2=A0	if (job)
> =C2=A0		sched->ops->free_job(job);
> =C2=A0
> -	drm_sched_run_free_queue(sched);
> +	drm_sched_run_free_queue_unlocked(sched);
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index
> 83e5c00d8dd9a83ab20547a93d6fc572de97616e..257d21d8d1d2c4f035d6d4882e1
> 59de59b263c76 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -393,11 +393,14 @@ struct drm_sched_job {
> =C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> =C2=A0 * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
> =C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> anymore.
> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's assumption,
> the GPU
> + * did not hang and is still running.
> =C2=A0 */
> =C2=A0enum drm_gpu_sched_stat {
> =C2=A0	DRM_GPU_SCHED_STAT_NONE,
> =C2=A0	DRM_GPU_SCHED_STAT_RESET,
> =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_NO_HANG,
> =C2=A0};
> =C2=A0
> =C2=A0/**
>=20

