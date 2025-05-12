Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF46AB35B3
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C4D10E16B;
	Mon, 12 May 2025 11:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="bd9SEtH0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9444F10E07E;
 Mon, 12 May 2025 11:13:49 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Zwxn50f9fz9ssn;
 Mon, 12 May 2025 13:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747048425; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6VQc38QgN1MZ4OmUxYUyjJ/74JTeCoEhU5uT0CRDss=;
 b=bd9SEtH0bMp6mWlqOp+/XoubT+R/6A/FI2Xoos41tlXzHlyWQHVW83MP77g7ftlzQm3XBZ
 NKznZA6R0Kjxc0uTiAi34aTsvM6BwqBCrWV4Gz5eRks/IYUm3eUgg/g5CJxPj9jx5bWsv6
 B4iqXD0wyZDx8QyCGAa9NIzv+CL2tI8SGumjnTSDjt6kLtHPCZp2mPoGKpWoA6IX2I1KDw
 25IvFWMuzCalDcNHFDj79H2xJGFGZYTVXYjZHE1e04Ut/Lg2CU22ZhTdgliNxecABYLQMB
 V7T8DxNc1gIcdJaIXYEYEZ27gjHsuSDnODpXmxXWSg3/THot+8arackkZBzEQA==
Message-ID: <c0ce8bc07bf5547af5084cfcb2c7572d786fdc0e.camel@mailbox.org>
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,  Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>,  Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 13:13:39 +0200
In-Reply-To: <aBodbVPeVtAWK6OX@lstrano-desk.jf.intel.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <aBl2xaVBlYYyBt2o@lstrano-desk.jf.intel.com>
 <aBodbVPeVtAWK6OX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 7ecf2ece5d64cbd60af
X-MBO-RS-META: zqp8xmeyc65fxuih986y7ajugjzybuu7
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

On Tue, 2025-05-06 at 07:32 -0700, Matthew Brost wrote:
> On Mon, May 05, 2025 at 07:41:09PM -0700, Matthew Brost wrote:
> > On Sat, May 03, 2025 at 05:59:52PM -0300, Ma=C3=ADra Canal wrote:
> > > When the DRM scheduler times out, it's possible that the GPU
> > > isn't hung;
> > > instead, a job may still be running, and there may be no valid
> > > reason to
> > > reset the hardware. This can occur in two situations:
> > >=20
> > > =C2=A0 1. The GPU exposes some mechanism that ensures the GPU is stil=
l
> > > making
> > > =C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechanism, we can=
 safely skip the
> > > reset,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 rearm the timeout, and allow the job to cont=
inue running
> > > until
> > > =C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v3d and Etn=
aviv.
> > > =C2=A0 2. TDR has fired before the IRQ that signals the fence.
> > > Consequently,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 the job actually finishes, but it triggers a=
 timeout before
> > > signaling
> > > =C2=A0=C2=A0=C2=A0=C2=A0 the completion fence.
> > >=20
> >=20
> > We have both of these cases in Xe too. We implement the requeuing
> > in Xe
> > via driver side function - xe_sched_add_pending_job but this looks
> > better and will make use of this.
> >=20
> > > These two scenarios are problematic because we remove the job
> > > from the
> > > `sched->pending_list` before calling `sched->ops-
> > > >timedout_job()`. This
> > > means that when the job finally signals completion (e.g. in the
> > > IRQ
> > > handler), the scheduler won't call `sched->ops->free_job()`. As a
> > > result,
> > > the job and its resources won't be freed, leading to a memory
> > > leak.
> > >=20
> > > To resolve this issue, we create a new `drm_gpu_sched_stat` that
> > > allows a
> > > driver to skip the reset. This new status will indicate that the
> > > job
> > > should be reinserted into the pending list, and the driver will
> > > still
> > > signal its completion.
> > >=20
> > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >=20
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> >=20
>=20
> Wait - nevermind I think one issue is below.
>=20
> > > ---
> > > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 14 ++++++++++++++
> > > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > > =C2=A02 files changed, 16 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index
> > > 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a034309
> > > f881135dbc639a9b4 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -568,6 +568,17 @@ static void drm_sched_job_timedout(struct
> > > work_struct *work)
> > > =C2=A0			job->sched->ops->free_job(job);
> > > =C2=A0			sched->free_guilty =3D false;
> > > =C2=A0		}
> > > +
> > > +		/*
> > > +		 * If the driver indicated that the GPU is still
> > > running and wants to skip
> > > +		 * the reset, reinsert the job back into the
> > > pending list and realarm the
> > > +		 * timeout.
> > > +		 */
> > > +		if (status =3D=3D DRM_GPU_SCHED_STAT_RUNNING) {
> > > +			spin_lock(&sched->job_list_lock);
> > > +			list_add(&job->list, &sched-
> > > >pending_list);
> > > +			spin_unlock(&sched->job_list_lock);
> > > +		}
>=20
> I think you need to requeue free_job wq here. It is possible the
> free_job wq ran, didn't find a job, goes to sleep, then we add a
> signaled job here which will never get freed.

I wonder if that could be solved by holding job_list_lock a bit longer.
free_job_work will try to check the list for the next signaled job, but
will wait for the lock.

If that works, we could completely rely on the standard mechanism
without requeuing, which would be neat.

P.

>=20
> Matt
>=20
> > > =C2=A0	} else {
> > > =C2=A0		spin_unlock(&sched->job_list_lock);
> > > =C2=A0	}
> > > @@ -590,6 +601,9 @@ static void drm_sched_job_timedout(struct
> > > work_struct *work)
> > > =C2=A0 * This function is typically used for reset recovery (see the
> > > docu of
> > > =C2=A0 * drm_sched_backend_ops.timedout_job() for details). Do not
> > > call it for
> > > =C2=A0 * scheduler teardown, i.e., before calling drm_sched_fini().
> > > + *
> > > + * As it's used for reset recovery, drm_sched_stop() shouldn't
> > > be called
> > > + * if the scheduler skipped the timeout
> > > (DRM_SCHED_STAT_RUNNING).
> > > =C2=A0 */
> > > =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> > > drm_sched_job *bad)
> > > =C2=A0{
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index
> > > 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b5f
> > > c16b927202a507d51 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -389,11 +389,13 @@ struct drm_sched_job {
> > > =C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> > > =C2=A0 * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> > > =C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> > > anymore.
> > > + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip
> > > the reset.
> > > =C2=A0 */
> > > =C2=A0enum drm_gpu_sched_stat {
> > > =C2=A0	DRM_GPU_SCHED_STAT_NONE,
> > > =C2=A0	DRM_GPU_SCHED_STAT_NOMINAL,
> > > =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> > > +	DRM_GPU_SCHED_STAT_RUNNING,
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/**
> > >=20
> > > --=20
> > > 2.49.0
> > >=20

