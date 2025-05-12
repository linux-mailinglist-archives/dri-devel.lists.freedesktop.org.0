Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7AEAB3A13
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2233410E412;
	Mon, 12 May 2025 14:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IS4SOX9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1BC10E082;
 Mon, 12 May 2025 14:09:32 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Zx1gr6W2Wz9t2s;
 Mon, 12 May 2025 16:09:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747058969; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGjALh9eKEZFx0N6cbie0vkm+fZRwhnmy1kasYIhjDI=;
 b=IS4SOX9YvKxf3uXn2X1ZsGOM+1O5TQ6cHc6abSj0zXdmPUz1VBrR0aU+mnRevCnpXM0Xqe
 gTFTHEH/6IEjK39CvZZishOP+Mthn5eUQpjgeo77EdJ4CTj4NEMkQMV+lsA1mL4cLXfWi7
 KzJQ/SrJ2/uGWNEeeOp6kLOcN4LbRtHBKKpSDDGFSjfdoM56zKSRdp9sRv7a2WsCrDLExC
 DcTpT8w1cXAvP+mPfmyUh9OAURAMBK9NzMRfZ6GrfM3/dxXw6gBi/BLXCqxHd/f+TLfTDn
 Vs29GTeY3DdygJKd0ZSfPdo2SGm54S+yg8llkTpMInw+iOb9/IaMTYZv5OBW4Q==
Message-ID: <50debbe5a4856a744b8ac89048405be89f936a6a.camel@mailbox.org>
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
From: Philipp Stanner <phasta@mailbox.org>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, phasta@kernel.org, 
 Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, Melissa Wen
 <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,  Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>,  kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org,  etnaviv@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 16:09:21 +0200
In-Reply-To: <22fdf8aa-437a-4d28-886a-fe10e957edfa@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <aBl2xaVBlYYyBt2o@lstrano-desk.jf.intel.com>
 <aBodbVPeVtAWK6OX@lstrano-desk.jf.intel.com>
 <c0ce8bc07bf5547af5084cfcb2c7572d786fdc0e.camel@mailbox.org>
 <22fdf8aa-437a-4d28-886a-fe10e957edfa@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 47d697da19a3a933f0f
X-MBO-RS-META: nnzga1m3wrejtbp351cpd68ns5cf7ngj
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

On Mon, 2025-05-12 at 11:04 -0300, Ma=C3=ADra Canal wrote:
> Hi Philipp,
>=20
> On 12/05/25 08:13, Philipp Stanner wrote:
> > On Tue, 2025-05-06 at 07:32 -0700, Matthew Brost wrote:
> > > On Mon, May 05, 2025 at 07:41:09PM -0700, Matthew Brost wrote:
> > > > On Sat, May 03, 2025 at 05:59:52PM -0300, Ma=C3=ADra Canal wrote:
> > > > > When the DRM scheduler times out, it's possible that the GPU
> > > > > isn't hung;
> > > > > instead, a job may still be running, and there may be no
> > > > > valid
> > > > > reason to
> > > > > reset the hardware. This can occur in two situations:
> > > > >=20
> > > > > =C2=A0=C2=A0 1. The GPU exposes some mechanism that ensures the G=
PU is
> > > > > still
> > > > > making
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechani=
sm, we can safely
> > > > > skip the
> > > > > reset,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rearm the timeout, and allow the j=
ob to continue
> > > > > running
> > > > > until
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v=
3d and Etnaviv.
> > > > > =C2=A0=C2=A0 2. TDR has fired before the IRQ that signals the fen=
ce.
> > > > > Consequently,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the job actually finishes, but it =
triggers a timeout
> > > > > before
> > > > > signaling
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the completion fence.
> > > > >=20
> > > >=20
> > > > We have both of these cases in Xe too. We implement the
> > > > requeuing
> > > > in Xe
> > > > via driver side function - xe_sched_add_pending_job but this
> > > > looks
> > > > better and will make use of this.
> > > >=20
> > > > > These two scenarios are problematic because we remove the job
> > > > > from the
> > > > > `sched->pending_list` before calling `sched->ops-
> > > > > > timedout_job()`. This
> > > > > means that when the job finally signals completion (e.g. in
> > > > > the
> > > > > IRQ
> > > > > handler), the scheduler won't call `sched->ops->free_job()`.
> > > > > As a
> > > > > result,
> > > > > the job and its resources won't be freed, leading to a memory
> > > > > leak.
> > > > >=20
> > > > > To resolve this issue, we create a new `drm_gpu_sched_stat`
> > > > > that
> > > > > allows a
> > > > > driver to skip the reset. This new status will indicate that
> > > > > the
> > > > > job
> > > > > should be reinserted into the pending list, and the driver
> > > > > will
> > > > > still
> > > > > signal its completion.
> > > > >=20
> > > > > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > >=20
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > >=20
> > >=20
> > > Wait - nevermind I think one issue is below.
> > >=20
> > > > > ---
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c | 14 +++++++++=
+++++
> > > > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > > > > =C2=A0=C2=A02 files changed, 16 insertions(+)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index
> > > > > 829579c41c6b5d8b2abce5ad373c7017469b7680..68ca827d77e32187a03
> > > > > 4309
> > > > > f881135dbc639a9b4 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -568,6 +568,17 @@ static void
> > > > > drm_sched_job_timedout(struct
> > > > > work_struct *work)
> > > > > =C2=A0=C2=A0			job->sched->ops->free_job(job);
> > > > > =C2=A0=C2=A0			sched->free_guilty =3D false;
> > > > > =C2=A0=C2=A0		}
> > > > > +
> > > > > +		/*
> > > > > +		 * If the driver indicated that the GPU is
> > > > > still
> > > > > running and wants to skip
> > > > > +		 * the reset, reinsert the job back into the
> > > > > pending list and realarm the
> > > > > +		 * timeout.
> > > > > +		 */
> > > > > +		if (status =3D=3D DRM_GPU_SCHED_STAT_RUNNING) {
> > > > > +			spin_lock(&sched->job_list_lock);
> > > > > +			list_add(&job->list, &sched-
> > > > > > pending_list);
> > > > > +			spin_unlock(&sched->job_list_lock);
> > > > > +		}
> > >=20
> > > I think you need to requeue free_job wq here. It is possible the
> > > free_job wq ran, didn't find a job, goes to sleep, then we add a
> > > signaled job here which will never get freed.
> >=20
> > I wonder if that could be solved by holding job_list_lock a bit
> > longer.
> > free_job_work will try to check the list for the next signaled job,
> > but
> > will wait for the lock.
> >=20
> > If that works, we could completely rely on the standard mechanism
> > without requeuing, which would be neat.
>=20
> I believe it works. However, the tradeoff would be holding the lock
> for
> the entire reset of the GPU (in the cases the GPU actually hanged),
> which looks like a lot of time.
>=20
> Do you think it's reasonable to do so?

The scheduler only has three distinct work items, run_job, free_job and
timeout.

timeout runs only serially, so that's not relevant; and run_job() and
free_job() should be halted in the timeout handler through
drm_sched_stop() anyways.

Moreover, timeouts should be rare events.

So I'd say yes, the clarity of the code trumps here.

Cheers,
P.


>=20
> Best Regards,
> - Ma=C3=ADra
>=20
> >=20
> > P.
> >=20
> > >=20
> > > Matt
> > >=20
>=20
>=20

