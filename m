Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F2CAB3354
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 11:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D1C10E341;
	Mon, 12 May 2025 09:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vYGn906P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A156410E170;
 Mon, 12 May 2025 09:25:00 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZwvMX5fwgz9smN;
 Mon, 12 May 2025 11:24:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1747041896; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jx6/lo73KV9uhh+6cHg1qBPdgm6rkh+b+VT/ZKn9Omg=;
 b=vYGn906PpXjLXF+d3ECyenHZsLtn59hDjs6W3Jh27Bfd+XJIlY761XhkRes9nXHE2SGAij
 ALGb7sJanGlJHN9w+U6xz3y5djtoFy6CNCcvPSobCAKHeVo4PqJ5pqHNPpZZ/92qaVk1on
 IRllAvesOJOwV/khQ/+KWrJOtuM33aVEesHUGAb8O0sHR/DusyWhgPI5Af3g0QM6ZmJ4Rq
 YZnOYljeguDVgWExKY6aHDdNbSpWuNd8PqqFfIpWmHZCyQmUbZ2tJldA6E7Vqi6A9YQgTJ
 /Qmw4H9W/WXF+bXHPpz7JS7ZVE50xdLiZU0ipCPikHbPsc7RIIM1P3m7UgINgw==
Message-ID: <73e6d7c4d216456f10960b5409de46c669bdc3ce.camel@mailbox.org>
Subject: Re: [PATCH 1/8] drm/sched: Allow drivers to skip the reset and keep
 on running
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?=
 Canal <mcanal@igalia.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <mwen@igalia.com>, Lucas Stach
 <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 11:24:48 +0200
In-Reply-To: <95daf571-fa56-4e49-9c45-adb3932aecdb@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-1-ed0d6701a3fe@igalia.com>
 <f48aa17a-3135-4480-b396-2e2077a7d2aa@igalia.com>
 <4020cf8b-3524-46c9-a082-adaf4c1797c2@igalia.com>
 <95daf571-fa56-4e49-9c45-adb3932aecdb@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: cceb89f7b8e4215d719
X-MBO-RS-META: ee3qndim4nmfrwoxiac3r5pseqn7m559
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

On Wed, 2025-05-07 at 13:50 +0100, Tvrtko Ursulin wrote:
>=20
> On 07/05/2025 13:33, Ma=C3=ADra Canal wrote:
> > Hi Tvrtko,
> >=20
> > Thanks for the review!
> >=20
> > On 06/05/25 08:32, Tvrtko Ursulin wrote:
> > >=20
> > > On 03/05/2025 21:59, Ma=C3=ADra Canal wrote:
> > > > When the DRM scheduler times out, it's possible that the GPU
> > > > isn't hung;
> > > > instead, a job may still be running, and there may be no valid
> > > > reason to
> > > > reset the hardware. This can occur in two situations:
> > > >=20
> > > > =C2=A0=C2=A0 1. The GPU exposes some mechanism that ensures the GPU=
 is
> > > > still=20
> > > > making
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 progress. By checking this mechanism=
, we can safely skip
> > > > the=20
> > > > reset,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rearm the timeout, and allow the job=
 to continue running
> > > > until
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 completion. This is the case for v3d=
 and Etnaviv.
> > > > =C2=A0=C2=A0 2. TDR has fired before the IRQ that signals the fence=
.
> > > > Consequently,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the job actually finishes, but it tr=
iggers a timeout
> > > > before=20
> > > > signaling
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the completion fence.
> > > >=20
> > > > These two scenarios are problematic because we remove the job
> > > > from the
> > > > `sched->pending_list` before calling `sched->ops-
> > > > >timedout_job()`. This
> > > > means that when the job finally signals completion (e.g. in the
> > > > IRQ
> > > > handler), the scheduler won't call `sched->ops->free_job()`. As
> > > > a=20
> > > > result,
> > > > the job and its resources won't be freed, leading to a memory
> > > > leak.
> > > >=20
> > > > To resolve this issue, we create a new `drm_gpu_sched_stat`
> > > > that=20
> > > > allows a
> > > > driver to skip the reset. This new status will indicate that
> > > > the job
> > > > should be reinserted into the pending list, and the driver will
> > > > still
> > > > signal its completion.
> > >=20
> >=20
> > [...]
> >=20
> > > > diff --git a/include/drm/gpu_scheduler.h
> > > > b/include/drm/gpu_scheduler.h
> > > > index=20
> > > > 1a7e377d4cbb4fc12ed93c548b236970217945e8..fe9043b6d43141bee831b
> > > > 5fc16b927202a507d51 100644
> > > > --- a/include/drm/gpu_scheduler.h
> > > > +++ b/include/drm/gpu_scheduler.h
> > > > @@ -389,11 +389,13 @@ struct drm_sched_job {
> > > > =C2=A0=C2=A0 * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> > > > =C2=A0=C2=A0 * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> > > > =C2=A0=C2=A0 * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not ava=
ilable
> > > > anymore.
> > > > + * @DRM_GPU_SCHED_STAT_RUNNING: GPU is still running, so skip
> > > > the=20
> > > > reset.
> > >=20
> > > s/GPU/job/ ?
> > >=20
> > > > =C2=A0=C2=A0 */
> > > > =C2=A0 enum drm_gpu_sched_stat {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GPU_SCHED_STAT_NONE,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GPU_SCHED_STAT_NOMINAL,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GPU_SCHED_STAT_ENODEV,
> > > > +=C2=A0=C2=A0=C2=A0 DRM_GPU_SCHED_STAT_RUNNING,
> > >=20
> > > I am wondering if we could make it more obvious what is the
> > > difference=20
> > > between "nominal" and "running" and from whose point of view
> > > should=20
> > > those statuses be considered.
> > =C2=A0> > So far we have "nominal" which means scheduler/hardware is
> > working=20
> > fine
> > > but the job may or may have not been cancelled. With "running" we
> > > kind=20
> > > of split it into two sub-statuses and it would be nice for that
> > > to be=20
> > > intuitively visible from the naming. But I struggle to suggest an
> > > elegant name while preserving nominal as is.
> >=20
> > I was thinking: how about changing DRM_GPU_SCHED_STAT_NOMINAL to
> > DRM_GPU_SCHED_STAT_RESET (the hardware is fine, but we reset it)?
> >=20
> > Then, when we skip the reset, we would have
> > DRM_GPU_SCHED_STAT_NOMINAL
> > (which means the hardware is fine and we didn't reset it).
> >=20
> > I'm open to other suggestions.
>=20
> DRM_GPU_SCHED_STAT_RESET sounds like a good name and seems to paint a
> consistent story between running - reset - enodev.
>=20
> > > Thinking out loud here - perhaps that is pointing towards an=20
> > > alternative that instead of a new status, a new helper to re-
> > > insert=20
> > > the single job (like drm_sched_resubmit_job(sched, job)) would
> > > fit=20
> > > better? Although it would be more churn.
> > >=20
> >=20
> > Although your solution might be more elegant, I'm worried that such
> > a
> > function could be used improperly by new users (e.g. being called
> > in
> > contexts other than `timedout_job()`).
>=20
> We could call it drm_sched_untimedout_job(). </humour>
>=20
> > I'd prefer to have a new status as it'll be use solely for
> > `timedout_job()` (making it harder for users to use it
> > inappropriately).
> > With the addition of Matthew's feedback (calling
> > `drm_sched_run_free_queue()` after adding the job to the pending
> > list),
> > I think it makes even more sense to keep it inside the timeout
> > function.
> >=20
> > I hope others can chime in and give their opinions about your idea.
>=20
> Yeah - Philipp - Danilo - what do you prefer? Third enum with or a
> new=20
> helper?

I'm also afraid that providing yet another helper for this specific
case opens the door to abuse. We had (and still have) issues with the
familiar drm_sched_resubmit_jobs() function. Christian has been very
clear that this was a bad idea, and I'd rather not walk a road that
looks similar to that one.

I tend to think that the status codes are the appropriate mechanism to
address this. They were, after all, invented to inform the scheduler
about what is going on inside the driver.

That said, currently, ENODEV is basically the only error, and
everything unequal ENODEV (i.e., NOMINAL) is the "OK state".

A timeout occurring and the GPU not hanging is, therefore, also "OK".
Whatever the name will be, the docu for NOMINAL must also be adjusted.

How about calling it "NORMAL" instead of "NOMINAL", since that state
actually describes what is both OK and "the norm", i.e., most commonly
the case?

And I wouldn't call it RUNNING, since the GPU is also running in
NOMINAL state. "NO_HANG" could hint more effectively at the fact that
the GPU is, contrary to the scheduler's believe, not hanging.

(I've been out for a few days and am catching up to a lot of things.
Just had time to get deeper into this series. Apologies if my picture
isn't complete yet)

Thanks,
P.


>=20
> Regards,
>=20
> Tvrtko
>=20

