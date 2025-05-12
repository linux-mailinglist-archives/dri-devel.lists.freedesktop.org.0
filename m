Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F294AB358C
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC5810E00C;
	Mon, 12 May 2025 11:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="c37TEY9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AC910E00C;
 Mon, 12 May 2025 11:04:27 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZwxZG6FRQz9stK;
 Mon, 12 May 2025 13:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747047862; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJ72oWW3ZsvmA5refa++gMvX14GGJQINDFYKwh55FVU=;
 b=c37TEY9+TBl1AHr7FKQHpFXIQOVwjwiMevtqwVq5n3t42sQ26Lxv/JkDfuQBaNHW/mp4E/
 I8VpJMOXqpMXQmo0Jzw0PZ88PlgOAN8YwTxIbNy6yq3LQlPtQURNx0D/cSVfC7xTTYDslH
 rh/7GrITZ6UubRwfoNMlDWVCXSa5tF3szwOsyNNXd7mFqdrFLLrDVuW+Y8qC5GXbGWk9vM
 kJt4TgA4iKnVfwQfh7gFtvlpqCWA7AlRZXkfCU5bm97KmXmI9KX34A62pIg51coJrcGRd1
 U8o82bTtYfB/AksGmzYOWv/vg55WKZ5UpQelfIMLxOC+XUn7ZCRoVcAhQPZsJw==
Message-ID: <82495d71bf97fbf6970ba6b016b3a121fc4b84f2.camel@mailbox.org>
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, Melissa Wen
 <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,  Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 13:04:10 +0200
In-Reply-To: <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 6f737d7fde11512fa01
X-MBO-RS-META: ma69uq3shq9asjrz5wyb7n1eoydocdc6
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

On Sat, 2025-05-03 at 17:59 -0300, Ma=C3=ADra Canal wrote:
> When the DRM scheduler times out, it's possible that the GPU isn't
> hung;
> instead, a job may still be running, and there may be no valid reason
> to
> reset the hardware. This can occur in two situations:
>=20
> =C2=A0 1. The GPU exposes some mechanism that ensures the GPU is still
> making
> =C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechanism, we can saf=
ely skip the
> reset,
> =C2=A0=C2=A0=C2=A0=C2=A0 rearm the timeout, and allow the job to continue=
 running until
> =C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v3d and Etnaviv=
.

Who is "we" and where is the reset skipped? In the timedout_job()
callback?

> =C2=A0 2. TDR has fired before the IRQ that signals the fence.

Any concern about saying "Timeout" instead of "TDR"? I think most of us
aren't familiar with that acronym.

> Consequently,
> =C2=A0=C2=A0=C2=A0=C2=A0 the job actually finishes, but it triggers a tim=
eout before
> signaling
> =C2=A0=C2=A0=C2=A0=C2=A0 the completion fence.

That formulation doesn't seem correct. Once the timeout fired, the job,
as far as the GPU is concerned, is already finished, isn't it?

What is the "completion fence"? In the scheduler, we call the fence
returned by backend_ops.run_job() the "hardware fence".

And who is the "it" in "it triggers a timeout"? I assume you want to
say "the job has actually finished, but the scheduler triggers a
timeout anyways".


Also the purpose of that list is a bit unclear to me. It seems to be a
list of problems, but point 1 seems valid?


>=20
> These two scenarios are problematic because we remove the job from
> the
> `sched->pending_list` before calling `sched->ops->timedout_job()`.

Who is "we"? :)


> This
> means that when the job finally signals completion (e.g. in the IRQ
> handler),

A job doesn't signal completion.

The hardware / driver signals job completion by signaling the hardware
fence.

>  the scheduler won't call `sched->ops->free_job()`. As a result,
> the job and its resources won't be freed, leading to a memory leak.

OK, I think I get it. But isn't another explanation of the issue that
the driver callback doesn't take care of cleaning up the job that has
timed out (from the scheduler's perspective)?

It's not clear to me that the scheduler actually contains a bug here,
but rather is designed in a way that doesn't consider that some GPUs
have special timeout requirements or, rather, can have bursts of
slowness that don't actually indicate a timeout.

I think the commit message should be very clear about whether this is
an improvement of a design weakness or an actual bug fix.

>=20
> To resolve this issue, we create a new `drm_gpu_sched_stat` that
> allows a
> driver to skip the reset. This new status will indicate that the job
> should be reinserted into the pending list, and the driver will still
> signal its completion.

Hmm, yes, I think that this is the right way to address that problem.
+1


>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A02 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index
> 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309f881
> 135dbc639a9b4 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0			job->sched->ops->free_job(job);
> =C2=A0			sched->free_guilty =3D false;
> =C2=A0		}
> +
> +		/*
> +		 * If the driver indicated that the GPU is still
> running and wants to skip
> +		 * the reset, reinsert the job back into the pending
> list and realarm the
> +		 * timeout.
> +		 */
> +		if (status =3D=3D DRM_GPU_SCHED_STAT_RUNNING) {
> +			spin_lock(&sched->job_list_lock);
> +			list_add(&job->list, &sched->pending_list);
> +			spin_unlock(&sched->job_list_lock);
> +		}
> =C2=A0	} else {
> =C2=A0		spin_unlock(&sched->job_list_lock);
> =C2=A0	}
> @@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct
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
> + * if the scheduler skipped the timeout (DRM_SCHED_STAT_RUNNING).

The same comment then applies to the counterpart, drm_sched_start().=20

We might also want to look into who uses drm_sched_wqueue_{start,stop}
and consider if they need a comment. Though I don't expect you to do
that. Those functions are hacky legacy anyways.


P.

> =C2=A0 */
> =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> drm_sched_job *bad)
> =C2=A0{
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index
> 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5fc16b
> 927202a507d51 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -389,11 +389,13 @@ struct drm_sched_job {
> =C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> =C2=A0 * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> =C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> anymore.
> + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip the
> reset.
> =C2=A0 */
> =C2=A0enum drm_gpu_sched_stat {
> =C2=A0	DRM_GPU_SCHED_STAT_NONE,
> =C2=A0	DRM_GPU_SCHED_STAT_NOMINAL,
> =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> +	DRM_GPU_SCHED_STAT_RUNNING,
> =C2=A0};
> =C2=A0
> =C2=A0/**
>=20

