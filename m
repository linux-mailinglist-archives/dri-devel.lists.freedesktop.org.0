Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D8A56412
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 10:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5766989F35;
	Fri,  7 Mar 2025 09:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="x0NrEan7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA8E89F35
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 09:37:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4Z8Lm43L0sz9smj;
 Fri,  7 Mar 2025 10:37:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741340228; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4s2jfg7G6ikb3PdVKxX3h5jRV13JB4VUmGRVM+FOEpg=;
 b=x0NrEan78fW52UTLMOY+qbiFq0Upqyes3WZUdoxvnBeu6+yVcG4NTN4tkDkatn+WRvBJls
 OXzwPtN6uj25M1WQ/Dz9tCwuXIaQ/H7Xre9M31gYbo5giCpEyWmTHzxnDldGU9/Wln0VaV
 p9jaeG3QOP8qpU4aQu+e9i1+uEa9MtzaIQvJDwswT0tm7o9KMx1XEShHelD7zIOGEsO7pv
 V4/gzI+z8TOL+QRppqZJjNQHS+XWud8+4gNZNOkUgf42zFGfiJJZI62bGrKZamHEKZvuLI
 Cp1oqjDGb4LoEpBaPNMc4bm7YmFZixyoBax/p5UGEjvZ0KL2hCVgKkBJeET8yw==
Message-ID: <0ff8b5ddce856a7d9f5ffbabcb220e345b2dcfaa.camel@mailbox.org>
Subject: Re: [PATCH v7 3/3] drm/sched: Update timedout_job()'s documentation
From: Philipp Stanner <phasta@mailbox.org>
To: Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 07 Mar 2025 10:37:04 +0100
In-Reply-To: <Z8oMSWulN0mF43aB@lstrano-desk.jf.intel.com>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-5-phasta@kernel.org>
 <Z8oMSWulN0mF43aB@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5f7705042c1a9815e16
X-MBO-RS-META: f1mmh8cr96meugnykqhcrpdagy8bnktp
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

On Thu, 2025-03-06 at 12:57 -0800, Matthew Brost wrote:
> On Wed, Mar 05, 2025 at 02:05:52PM +0100, Philipp Stanner wrote:
> > drm_sched_backend_ops.timedout_job()'s documentation is outdated.
> > It
> > mentions the deprecated function drm_sched_resubmit_jobs().
> > Furthermore,
> > it does not point out the important distinction between hardware
> > and
> > firmware schedulers.
> >=20
> > Since firmware schedulers typically only use one entity per
> > scheduler,
> > timeout handling is significantly more simple because the entity
> > the
> > faulted job came from can just be killed without affecting innocent
> > processes.
> >=20
> > Update the documentation with that distinction and other details.
> >=20
> > Reformat the docstring to work to a unified style with the other
> > handles.
> >=20
>=20
> Looks really good, one suggestion.

Already merged. But I'm working already on the TODO and could address
your feedback in that followup.

Of course, would also be great if you could provide a proposal in a
patch? :)

>=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0include/drm/gpu_scheduler.h | 78 ++++++++++++++++++++++----------=
-
> > ----
> > =C2=A01 file changed, 47 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 6381baae8024..1a7e377d4cbb 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -383,8 +383,15 @@ struct drm_sched_job {
> > =C2=A0	struct xarray			dependencies;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * enum drm_gpu_sched_stat - the scheduler's status
> > + *
> > + * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> > + * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> > + * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> > anymore.
> > + */
> > =C2=A0enum drm_gpu_sched_stat {
> > -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > +	DRM_GPU_SCHED_STAT_NONE,
> > =C2=A0	DRM_GPU_SCHED_STAT_NOMINAL,
> > =C2=A0	DRM_GPU_SCHED_STAT_ENODEV,
> > =C2=A0};
> > @@ -447,43 +454,52 @@ struct drm_sched_backend_ops {
> > =C2=A0	 * @timedout_job: Called when a job has taken too long to
> > execute,
> > =C2=A0	 * to trigger GPU recovery.
> > =C2=A0	 *
> > -	 * This method is called in a workqueue context.
> > +	 * @sched_job: The job that has timed out
> > =C2=A0	 *
> > -	 * Drivers typically issue a reset to recover from GPU
> > hangs, and this
> > -	 * procedure usually follows the following workflow:
> > +	 * Drivers typically issue a reset to recover from GPU
> > hangs.
> > +	 * This procedure looks very different depending on
> > whether a firmware
> > +	 * or a hardware scheduler is being used.
> > =C2=A0	 *
> > -	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > park the
> > -	 *=C2=A0=C2=A0=C2=A0 scheduler thread and cancel the timeout work,
> > guaranteeing that
> > -	 *=C2=A0=C2=A0=C2=A0 nothing is queued while we reset the hardware qu=
eue
> > -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> > -	 * 3. Issue a GPU reset (driver-specific)
> > -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> > -	 * 5. Restart the scheduler using drm_sched_start(). At
> > that point, new
> > -	 *=C2=A0=C2=A0=C2=A0 jobs can be queued, and the scheduler thread is
> > unblocked
> > +	 * For a FIRMWARE SCHEDULER, each ring has one scheduler,
> > and each
> > +	 * scheduler has one entity. Hence, the steps taken
> > typically look as
> > +	 * follows:
> > +	 *
> > +	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > pause the
> > +	 *=C2=A0=C2=A0=C2=A0 scheduler workqueues and cancel the timeout work=
,
> > guaranteeing
> > +	 *=C2=A0=C2=A0=C2=A0 that nothing is queued while the ring is being
> > removed.
> > +	 * 2. Remove the ring. The firmware will make sure that
> > the
> > +	 *=C2=A0=C2=A0=C2=A0 corresponding parts of the hardware are resetted=
,
> > and that other
> > +	 *=C2=A0=C2=A0=C2=A0 rings are not impacted.
> > +	 * 3. Kill the entity and the associated scheduler.
>=20
> Xe doesn't do step 3.
>=20
> It does:
> - Ban entity / scheduler so futures submissions are a NOP. This would
> be
> =C2=A0 submissions with unmet dependencies. Submission at the IOCTL are
> =C2=A0 disallowed=20
> - Signal all job's fences on the pending list
> - Restart scheduler so free_job() is naturally called
>=20
> I'm unsure if this how other firmware schedulers do this, but it
> seems
> to work quite well in Xe.

Alright, so if I interpret this correctly you do that to avoid our
infamous memory leaks. That makes sense.

The memory leaks are documented in drm_sched_fini()'s docu, but it
could make sense to mention them here, too.

=E2=80=A6 thinking about it, we probably actually have to rephrase this lin=
e.
Just tearing down entity & sched makes those leaks very likely. Argh.

Nouveau, also a firmware scheduler, has effectively a copy of the
pending_list and also ensures that all fences get signalled. Only once
that copy of the pending list is empty it calls into drm_sched_fini().
Take a look at nouveau_sched.c if you want, the code is quite
straightforward.

P.

>=20
> Matt
>=20
> > +	 *
> > +	 *
> > +	 * For a HARDWARE SCHEDULER, a scheduler instance
> > schedules jobs from
> > +	 * one or more entities to one ring. This implies that all
> > entities
> > +	 * associated with the affected scheduler cannot be torn
> > down, because
> > +	 * this would effectively also affect innocent userspace
> > processes which
> > +	 * did not submit faulty jobs (for example).
> > +	 *
> > +	 * Consequently, the procedure to recover with a hardware
> > scheduler
> > +	 * should look like this:
> > +	 *
> > +	 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop().
> > +	 * 2. Kill the entity the faulty job stems from.
> > +	 * 3. Issue a GPU reset on all faulty rings (driver-
> > specific).
> > +	 * 4. Re-submit jobs on all schedulers impacted by re-
> > submitting them to
> > +	 *=C2=A0=C2=A0=C2=A0 the entities which are still alive.
> > +	 * 5. Restart all schedulers that were stopped in step #1
> > using
> > +	 *=C2=A0=C2=A0=C2=A0 drm_sched_start().
> > =C2=A0	 *
> > =C2=A0	 * Note that some GPUs have distinct hardware queues but
> > need to reset
> > =C2=A0	 * the GPU globally, which requires extra synchronization
> > between the
> > -	 * timeout handler of the different &drm_gpu_scheduler.
> > One way to
> > -	 * achieve this synchronization is to create an ordered
> > workqueue
> > -	 * (using alloc_ordered_workqueue()) at the driver level,
> > and pass this
> > -	 * queue to drm_sched_init(), to guarantee that timeout
> > handlers are
> > -	 * executed sequentially. The above workflow needs to be
> > slightly
> > -	 * adjusted in that case:
> > +	 * timeout handlers of different schedulers. One way to
> > achieve this
> > +	 * synchronization is to create an ordered workqueue
> > (using
> > +	 * alloc_ordered_workqueue()) at the driver level, and
> > pass this queue
> > +	 * as drm_sched_init()'s @timeout_wq parameter. This will
> > guarantee
> > +	 * that timeout handlers are executed sequentially.
> > =C2=A0	 *
> > -	 * 1. Stop all schedulers impacted by the reset using
> > drm_sched_stop()
> > -	 * 2. Try to gracefully stop non-faulty jobs on all queues
> > impacted by
> > -	 *=C2=A0=C2=A0=C2=A0 the reset (optional)
> > -	 * 3. Issue a GPU reset on all faulty queues (driver-
> > specific)
> > -	 * 4. Re-submit jobs on all schedulers impacted by the
> > reset using
> > -	 *=C2=A0=C2=A0=C2=A0 drm_sched_resubmit_jobs()
> > -	 * 5. Restart all schedulers that were stopped in step #1
> > using
> > -	 *=C2=A0=C2=A0=C2=A0 drm_sched_start()
> > +	 * Return: The scheduler's status, defined by &enum
> > drm_gpu_sched_stat
> > =C2=A0	 *
> > -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > -	 * and the underlying driver has started or completed
> > recovery.
> > -	 *
> > -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > longer
> > -	 * available, i.e. has been unplugged.
> > =C2=A0	 */
> > =C2=A0	enum drm_gpu_sched_stat (*timedout_job)(struct
> > drm_sched_job *sched_job);
> > =C2=A0
> > --=20
> > 2.48.1
> >=20

