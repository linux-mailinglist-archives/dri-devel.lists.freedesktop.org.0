Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE7AD7393
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 16:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCE310E87B;
	Thu, 12 Jun 2025 14:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xD9XA+tF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA2A10E873;
 Thu, 12 Jun 2025 14:21:08 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bJ4Sw0z4Dz9sp3;
 Thu, 12 Jun 2025 16:21:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1749738064; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LUPnbMKZsQR2YGEzcKKfW5NC/LS9WZVDDt3t+hU+WYU=;
 b=xD9XA+tF3DtsgZ/TvoLRbK1Aczn2kB03rAMmVtJak3LqwegXNUc9uE/X+ueAQE2lsb3m4z
 nMS/GAVVbawehSW3oHS+UrMDPUfosntFCueeJu0jdBg7agC7b/icGX2oLwDaaDbb/D3uJL
 e0PHOod+Rz4m5QK3iAme7eCMyiPKbR5hv1VO4K8fvv7B7PtHCpIMMecJx5sREk1CryUckd
 v62q0rHqELw4BRYHCKbhp13fonFZXPKIGO8HYmj7yJardsvD2c96JZp/YCYBLIPBPM8h8y
 a26R8D10Vu/FuGEcVYJVpeR3fZsngtoc6ndZnptXNyVwj5KyXuDzGjrPViZ2IA==
Message-ID: <f4f326a0ecb98a9996919c3f827b3247b8207feb.camel@mailbox.org>
Subject: Re: [RFC PATCH 1/6] drm/sched: Avoid memory leaks with cancel_job()
 callback
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Thu, 12 Jun 2025 16:20:58 +0200
In-Reply-To: <62ff8ddb-b2f1-4e52-a026-290561ab5337@igalia.com>
References: <20250603093130.100159-2-phasta@kernel.org>
 <20250603093130.100159-3-phasta@kernel.org>
 <62ff8ddb-b2f1-4e52-a026-290561ab5337@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: oodnuo5gzpywi6c6hikd3z6f1sf1sei5
X-MBO-RS-ID: 8a4021f237a81cd6bf4
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

On Thu, 2025-06-12 at 15:17 +0100, Tvrtko Ursulin wrote:
>=20
> On 03/06/2025 10:31, Philipp Stanner wrote:
> > Since its inception, the GPU scheduler can leak memory if the
> > driver
> > calls drm_sched_fini() while there are still jobs in flight.
> >=20
> > The simplest way to solve this in a backwards compatible manner is
> > by
> > adding a new callback, drm_sched_backend_ops.cancel_job(), which
> > instructs the driver to signal the hardware fence associated with
> > the
> > job. Afterwards, the scheduler can savely use the established
> > free_job()
> > callback for freeing the job.
> >=20
> > Implement the new backend_ops callback cancel_job().
> >=20
> > Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Please just add the link to the patch here (it is only in the cover
> letter):
>=20
> Link:=20
> https://lore.kernel.org/dri-devel/20250418113211.69956-1-tvrtko.ursulin@i=
galia.com/

That I can do, sure

>=20
> And you probably want to take the unit test modifications from the
> same=20
> patch too. You could put them in the same patch or separate.

Necessary adjustments for the unit tests are already implemented and
are waiting for review separately, since this can be done independently
from this entire series:

https://lore.kernel.org/dri-devel/20250605134154.191764-2-phasta@kernel.org=
/


Thx
P.

>=20
> Regards,
>=20
> Tvrtko
>=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 34 ++++++++++++++++----=
-
> > -----
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++
> > =C2=A0 2 files changed, 30 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index d20726d7adf0..3f14f1e151fa 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1352,6 +1352,18 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0=20
> > +static void drm_sched_kill_remaining_jobs(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +	struct drm_sched_job *job, *tmp;
> > +
> > +	/* All other accessors are stopped. No locking necessary.
> > */
> > +	list_for_each_entry_safe_reverse(job, tmp, &sched-
> > >pending_list, list) {
> > +		sched->ops->cancel_job(job);
> > +		list_del(&job->list);
> > +		sched->ops->free_job(job);
> > +	}
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> > =C2=A0=C2=A0 *
> > @@ -1359,19 +1371,11 @@ EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Tears down and cleans up the scheduler.
> > =C2=A0=C2=A0 *
> > - * This stops submission of new jobs to the hardware through
> > - * drm_sched_backend_ops.run_job(). Consequently,
> > drm_sched_backend_ops.free_job()
> > - * will not be called for all jobs still in
> > drm_gpu_scheduler.pending_list.
> > - * There is no solution for this currently. Thus, it is up to the
> > driver to make
> > - * sure that:
> > - *
> > - *=C2=A0 a) drm_sched_fini() is only called after for all submitted
> > jobs
> > - *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been c=
alled or that
> > - *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has no=
t
> > been called
> > - *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed manual=
ly.
> > - *
> > - * FIXME: Take care of the above problem and prevent this function
> > from leaking
> > - * the jobs in drm_gpu_scheduler.pending_list under any
> > circumstances.
> > + * This stops submission of new jobs to the hardware through
> > &struct
> > + * drm_sched_backend_ops.run_job. If &struct
> > drm_sched_backend_ops.cancel_job
> > + * is implemented, all jobs will be canceled through it and
> > afterwards cleaned
> > + * up through &struct drm_sched_backend_ops.free_job. If
> > cancel_job is not
> > + * implemented, memory could leak.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > @@ -1401,6 +1405,10 @@ void drm_sched_fini(struct drm_gpu_scheduler
> > *sched)
> > =C2=A0=C2=A0	/* Confirm no work left behind accessing device structures
> > */
> > =C2=A0=C2=A0	cancel_delayed_work_sync(&sched->work_tdr);
> > =C2=A0=20
> > +	/* Avoid memory leaks if supported by the driver. */
> > +	if (sched->ops->cancel_job)
> > +		drm_sched_kill_remaining_jobs(sched);
> > +
> > =C2=A0=C2=A0	if (sched->own_submit_wq)
> > =C2=A0=C2=A0		destroy_workqueue(sched->submit_wq);
> > =C2=A0=C2=A0	sched->ready =3D false;
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index e62a7214e052..81dcbfc8c223 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -512,6 +512,15 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's=
 time to clean it up.
> > =C2=A0=C2=A0	 */
> > =C2=A0=C2=A0	void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +	/**
> > +	 * @cancel_job: Used by the scheduler to guarantee
> > remaining jobs' fences
> > +	 * get signaled in drm_sched_fini().
> > +	 *
> > +	 * Drivers need to signal the passed job's hardware fence
> > with
> > +	 * -ECANCELED in this callback. They must not free the
> > job.
> > +	 */
> > +	void (*cancel_job)(struct drm_sched_job *sched_job);
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
>=20

