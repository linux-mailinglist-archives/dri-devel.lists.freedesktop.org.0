Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66DAEDB87
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 13:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F7710E41D;
	Mon, 30 Jun 2025 11:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="dNoKlOVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02B710E41D;
 Mon, 30 Jun 2025 11:46:43 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bW4BS4YRyz9smN;
 Mon, 30 Jun 2025 13:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751284000; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hknamIhTl3df4BnqS3Y+jLQLujmfMkt5ZKTr+yE/7A4=;
 b=dNoKlOVvp03WPtVLbhySIAM/pN69jC2Oa+/cVzh6IJi5DZ/2RbGlAhSvtiysalc3Sp0KIe
 CXkJ2cbf9Xeu2SDLkTVdcvcdRNavuJ7hiujDc+0g08IRQATrZI8Z9OeHRdW9GuqHpuLMlR
 OZo2xmAowbPcVXY+bzimA8iqWadiGLQxlJpxPhnsl5eHAMvJIaKFTrMe6tykDGiFX/lZBL
 uQdKQcDANjDszRT0A8UjDUDhf+PilbefsBxR6/u5UrvlfLILuRYhJ117eZ2vGxUhRlpXaP
 rAOnaigLWRjNhrf1EE14OOfnOVCAFSPjKiY69aD5KcUr0X7bX3La+31Qf4/gfw==
Message-ID: <31490caec4e3c76ec1664536f3cd865880d7bf84.camel@mailbox.org>
Subject: Re: [PATCH v3 2/8] drm/sched: Allow drivers to skip the reset and
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
Date: Mon, 30 Jun 2025 13:46:31 +0200
In-Reply-To: <20250618-sched-skip-reset-v3-2-8be5cca2725d@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-2-8be5cca2725d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: pcpb6jmc3f6wend4y3ymt7c8p8amma5q
X-MBO-RS-ID: be78f09847359c297f1
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

On Wed, 2025-06-18 at 11:47 -0300, Ma=C3=ADra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't
> hung;
> instead, a job may still be running, and there may be no valid reason
> to
> reset the hardware. This can occur in two situations:
>=20
> =C2=A0 1. The GPU exposes some mechanism that ensures the GPU is still
> making
> =C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechanism, the driver=
 can safely skip
> the
> =C2=A0=C2=A0=C2=A0=C2=A0 reset, re-arm the timeout, and allow the job to =
continue running
> until
> =C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v3d, Etnaviv, a=
nd Xe.
> =C2=A0 2. Timeout has fired before the free-job worker. Consequently, the
> =C2=A0=C2=A0=C2=A0=C2=A0 scheduler calls `timedout_job()` for a job that =
isn't timed out.

Optional nit: I'd hint here that timedout_job() is a driver callback.

>=20
> These two scenarios are problematic because the job was removed from
> the
> `sched->pending_list` before calling `sched->ops->timedout_job()`,
> which
> means that when the job finishes, it won't be freed by the scheduler
> though `sched->ops->free_job()` - leading to a memory leak.
>=20
> To solve those problems, create a new `drm_gpu_sched_stat`, called
> DRM_GPU_SCHED_STAT_NO_HANG, that allows a driver to skip the reset.
> The
> new status will indicate that the job must be reinserted into the
> pending list, and the hardware / driver will still complete that job.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 43
> ++++++++++++++++++++++++++++++++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A02 files changed, 44 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index
> fb6d9eddf5b378910b66d456f3610ff2ca7c0f41..5e1c07ca867cb14746cec9a7e53
> 896fe17af6e58 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -380,11 +380,16 @@ static void drm_sched_run_free_queue(struct
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
> @@ -537,6 +542,31 @@ static void drm_sched_job_begin(struct
> drm_sched_job *s_job)
> =C2=A0	spin_unlock(&sched->job_list_lock);
> =C2=A0}
> =C2=A0
> +/**
> + * drm_sched_job_reinsert_on_false_timeout - Reinsert the job on a

nit: The other docstrings all start with lower case after the -

> false timeout
> + * @sched: scheduler instance
> + * @job: job to be reinserted on the pending list
> + *
> + * In the case of a "false timeout" - when a timeout occurs but the
> GPU isn't
> + * hung and the job is making progress, the scheduler must reinsert
> the job back
> + * into the pending list. Otherwise, the job and its resources won't
> be freed
> + * through the &drm_sched_backend_ops.free_job callback.
> + *
> + * Note that after reinserting the job, the scheduler enqueues the
> free-job
> + * work again if ready. Otherwise, a signaled job could be added to
> the pending
> + * list, but never freed.
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
> +	drm_sched_run_free_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
> =C2=A0static void drm_sched_job_timedout(struct work_struct *work)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched;
> @@ -570,6 +600,9 @@ static void drm_sched_job_timedout(struct
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
> @@ -592,6 +625,9 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0 * This function is typically used for reset recovery (see the docu
> of
> =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not call i=
t
> for
> =C2=A0 * scheduler teardown, i.e., before calling drm_sched_fini().
> + *
> + * As it's used for reset recovery, drm_sched_stop() shouldn't be
> called
> + * if the driver skipped the reset (DRM_GPU_SCHED_STAT_NO_HANG).
> =C2=A0 */
> =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> drm_sched_job *bad)
> =C2=A0{
> @@ -677,6 +713,9 @@ EXPORT_SYMBOL(drm_sched_stop);
> =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not call i=
t
> for
> =C2=A0 * scheduler startup. The scheduler itself is fully operational
> after
> =C2=A0 * drm_sched_init() succeeded.
> + *
> + * As it's used for reset recovery, drm_sched_start() shouldn't be
> called
> + * if the driver skipped the reset (DRM_GPU_SCHED_STAT_NO_HANG).
> =C2=A0 */
> =C2=A0void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> =C2=A0{
> @@ -1198,7 +1237,7 @@ static void drm_sched_free_job_work(struct
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
> 83e5c00d8dd9a83ab20547a93d6fc572de97616e..423bcc7d7584d3f85cc5a10982f
> 3cf637a781825 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -393,11 +393,14 @@ struct drm_sched_job {
> =C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> =C2=A0 * @DRM_GPU_SCHED_STAT_RESET: The GPU hung and successfully reset.
> =C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> anymore.
> + * @DRM_GPU_SCHED_STAT_NO_HANG: Contrary to scheduler's belief, the
> GPU
> + * did not hang and is operational.

Maybe

s/belief/assumption

and

s/operational/still running


Up to you, I think either is fine.

Code itself looks good.

P.

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

