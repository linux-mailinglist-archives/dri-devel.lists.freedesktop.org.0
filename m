Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD25BAC100A
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06F610E15F;
	Thu, 22 May 2025 15:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Viv5MpZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41D10E080
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747927963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+KIi7IgtzuwG9JRM0NfWn2R5/Tu80P8R/8lxyp3okcM=;
 b=Viv5MpZwDqzwuD5QwnW45z2qKDBORQ3dOXeJ2M5intiu18oQJc5v0ikvH1Zjn17yX7+drj
 ES08vrUOYODjBY5zuB4F/12OB85KTs97lmepu4FumUAe/At1tluDg6FrE4YN34r8rxkhmB
 ImOY5by05U4m5ODDboIa7ykkBal484I=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-P29XRXCuNnyjC1gZ21RUEg-1; Thu, 22 May 2025 11:32:42 -0400
X-MC-Unique: P29XRXCuNnyjC1gZ21RUEg-1
X-Mimecast-MFC-AGG-ID: P29XRXCuNnyjC1gZ21RUEg_1747927961
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-231e76f6eafso56171425ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 08:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747927961; x=1748532761;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DeXBrK2bgFthQnpVSUpFiSBohma7/u74wkxma9Kyu9s=;
 b=a/gUl/QK0T4CRGnezXgoHGZfdW8lmPTMQOmbGu6zS42N0opj8SjK0OwDPQb/BeKQIj
 hjwT4kc8IoyDu5rImokpm6j2aIjqnV11w3wKFu8x9fD2XvGQDoxOAvebBijE20Dw4iA6
 PPCj2b3lEcS5PyVdh2/IIZQ6yDufvDWc3/+oIrALSA71Z3ZqpEULsJM2fQWuhybndioi
 vYaAVELr3zpICJCLiRjCML1j5Byc8U5yBhD1ZnG+eybdiRJS8DBT/WWVGDuxAyXhU32U
 jUIlLtwJsQEofp0u4mqQB8CUCt5EQW/PA0YgYCT2FObUbZg338o7P09pSG4fn0rSf5PY
 HSqA==
X-Gm-Message-State: AOJu0YxYr+aJjAj4VPD6cBY0kePQ3oYaTFuJJNcUCM+5+zNsslWe8ZcO
 bpK8Uq779KEkTzr0yL9eJafh5wuKi8HpkBI3b7JJyS4u6KJSr1TRQoJwX+oXaY1wlwhP0RKGibJ
 eutT65iM2j//BJ38He0pJA0A20k3vb5E6L9FX3sfD1drtZVF3ovqsXwy5b8l0/Z39M7DklQ==
X-Gm-Gg: ASbGnctxW2rByS6GEmiZCMuvMktGSlnJGx5g1uJ58PjDWsYntslC/mssWmIzNIGeiIr
 FGQIRADLpWkq4ykLQl/bBKXEQOXni0piR0EBsD2yjttJKOGM17EfO7K20Ne8FM1TfEdNJt1LF8s
 6JORxP1Rcu6WtHsCl67tCZJgBibZV4SFsgUqbX/9GzD1e/AGbdS616mzio6HSPU2DNs7aTxwg8b
 zGWpNIlFWSlG6rbnbVudPbcdDL1vqJS1yHXzRvnOn/8AZRmlY2glNrVsCRPMDWklet3dbZ8tViH
 TKb5fRSdJVLBrLleEO1U7ARCajIz62xzRtH64w==
X-Received: by 2002:a17:902:ea12:b0:224:584:6eef with SMTP id
 d9443c01a7336-231de370161mr380770105ad.41.1747927960962; 
 Thu, 22 May 2025 08:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjPJ3d2Li+gJkA5m0jUKxV/lCdF1BtyKLt3kcWVKRRohcYKbvk2gX+o2xn/FomLrZtISVaEQ==
X-Received: by 2002:a17:902:ea12:b0:224:584:6eef with SMTP id
 d9443c01a7336-231de370161mr380769615ad.41.1747927960459; 
 Thu, 22 May 2025 08:32:40 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-232053579d7sm90944365ad.80.2025.05.22.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 08:32:39 -0700 (PDT)
Message-ID: <44c318c704960c0d0732598773fd256bdfac2fc1.camel@redhat.com>
Subject: Re: [PATCH v3 1/5] drm/sched: Fix teardown leaks with waitqueue
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 22 May 2025 17:32:29 +0200
In-Reply-To: <1a15598f-da02-46a0-8c41-ef8b765dc177@igalia.com>
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-3-phasta@kernel.org>
 <1a15598f-da02-46a0-8c41-ef8b765dc177@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pf5coCeXq5ZwFqcCo54kYiTwOA-JU-hRN9xA-qn-E58_1747927961
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-05-22 at 14:37 +0100, Tvrtko Ursulin wrote:
>=20
> On 22/05/2025 09:27, Philipp Stanner wrote:
> > From: Philipp Stanner <pstanner@redhat.com>
> >=20
> > The GPU scheduler currently does not ensure that its pending_list
> > is
> > empty before performing various other teardown tasks in
> > drm_sched_fini().
> >=20
> > If there are still jobs in the pending_list, this is problematic
> > because
> > after scheduler teardown, no one will call backend_ops.free_job()
> > anymore. This would, consequently, result in memory leaks.
> >=20
> > One way to solve this is to implement a waitqueue that
> > drm_sched_fini()
> > blocks on until the pending_list has become empty. That waitqueue
> > must
> > obviously not block for a significant time. Thus, it's necessary to
> > only
> > wait if it's guaranteed that all fences will get signaled quickly.
> >=20
> > This can be ensured by having the driver implement a new backend
> > ops,
> > cancel_pending_fences(), in which the driver shall signal all
> > unsignaled, in-flight fences with an error.
> >=20
> > Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once
> > the
> > pending_list becomes empty. Wait in drm_sched_fini() for that to
> > happen
> > if cancel_pending_fences() is implemented.
> >=20
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 105
> > ++++++++++++++++++++-----
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++++
> > =C2=A0 2 files changed, 105 insertions(+), 19 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index f7118497e47a..406572f5168e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -367,7 +367,7 @@ static void drm_sched_run_job_queue(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0 */
> > =C2=A0 static void __drm_sched_run_free_queue(struct drm_gpu_scheduler
> > *sched)
> > =C2=A0 {
> > -=09if (!READ_ONCE(sched->pause_submit))
> > +=09if (!READ_ONCE(sched->pause_free))
> > =C2=A0=C2=A0=09=09queue_work(sched->submit_wq, &sched-
> > >work_free_job);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -1121,6 +1121,12 @@ drm_sched_get_finished_job(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0=C2=A0=09=09/* remove job from pending_list */
> > =C2=A0=C2=A0=09=09list_del_init(&job->list);
> > =C2=A0=20
> > +=09=09/*
> > +=09=09 * Inform tasks blocking in drm_sched_fini() that
> > it's now safe to proceed.
> > +=09=09 */
> > +=09=09if (list_empty(&sched->pending_list))
> > +=09=09=09wake_up(&sched->pending_list_waitque);
>=20
> Wait what? ;) (pun intended)
>=20
> I think I mentioned in the last round that waitque looks dodgy.
> Either a=20
> typo or a very unusual and novel shorthand? I suggest a typical wq or
> waitqueue.

Ah right, I forgot about that.

>=20
> I also mentioned that one more advantage of the ->cancel_job()
> approach=20
> is there is no need for these extra calls on the normal path (non=20
> teardown) at all.

Yes, agreed, that's a tiny performance gain. But it's running in a
workqueue, so no big deal. But see below, too

>=20
> > +
> > =C2=A0=C2=A0=09=09/* cancel this job's TO timer */
> > =C2=A0=C2=A0=09=09cancel_delayed_work(&sched->work_tdr);
> > =C2=A0=C2=A0=09=09/* make the scheduled timestamp more accurate */
> > @@ -1326,6 +1332,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0=C2=A0=09init_waitqueue_head(&sched->job_scheduled);
> > =C2=A0=C2=A0=09INIT_LIST_HEAD(&sched->pending_list);
> > =C2=A0=C2=A0=09spin_lock_init(&sched->job_list_lock);
> > +=09init_waitqueue_head(&sched->pending_list_waitque);
> > =C2=A0=C2=A0=09atomic_set(&sched->credit_count, 0);
> > =C2=A0=C2=A0=09INIT_DELAYED_WORK(&sched->work_tdr,
> > drm_sched_job_timedout);
> > =C2=A0=C2=A0=09INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> > @@ -1333,6 +1340,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0=C2=A0=09atomic_set(&sched->_score, 0);
> > =C2=A0=C2=A0=09atomic64_set(&sched->job_id_count, 0);
> > =C2=A0=C2=A0=09sched->pause_submit =3D false;
> > +=09sched->pause_free =3D false;
> > =C2=A0=20
> > =C2=A0=C2=A0=09sched->ready =3D true;
> > =C2=A0=C2=A0=09return 0;
> > @@ -1350,33 +1358,90 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched, const struct drm_sched_init_
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_init);
> > =C2=A0=20
> > +/**
> > + * drm_sched_submission_and_timeout_stop - stop everything except
> > for free_job
> > + * @sched: scheduler instance
> > + *
> > + * Helper for tearing down the scheduler in drm_sched_fini().
> > + */
> > +static void
> > +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +=09WRITE_ONCE(sched->pause_submit, true);
> > +=09cancel_work_sync(&sched->work_run_job);
> > +=09cancel_delayed_work_sync(&sched->work_tdr);
> > +}
> > +
> > +/**
> > + * drm_sched_free_stop - stop free_job
> > + * @sched: scheduler instance
> > + *
> > + * Helper for tearing down the scheduler in drm_sched_fini().
> > + */
> > +static void drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> > +{
> > +=09WRITE_ONCE(sched->pause_free, true);
> > +=09cancel_work_sync(&sched->work_free_job);
> > +}
> > +
> > +/**
> > + * drm_sched_no_jobs_pending - check whether jobs are pending
> > + * @sched: scheduler instance
> > + *
> > + * Checks if jobs are pending for @sched.
> > + *
> > + * Return: true if jobs are pending, false otherwise.
> > + */
> > +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler
> > *sched)
> > +{
> > +=09bool empty;
> > +
> > +=09spin_lock(&sched->job_list_lock);
> > +=09empty =3D list_empty(&sched->pending_list);
> > +=09spin_unlock(&sched->job_list_lock);
> > +
> > +=09return empty;
> > +}
> > +
> > +/**
> > + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending
> > jobs
> > + * @sched: scheduler instance
> > + *
> > + * Must only be called if &struct
> > drm_sched_backend_ops.cancel_pending_fences is
> > + * implemented.
> > + *
> > + * Instructs the driver to kill the fence context associated with
> > this scheduler,
> > + * thereby signaling all pending fences. This, in turn, will
> > trigger
> > + * &struct drm_sched_backend_ops.free_job to be called for all
> > pending jobs.
> > + * The function then blocks until all pending jobs have been
> > freed.
> > + */
> > +static void drm_sched_cancel_jobs_and_wait(struct
> > drm_gpu_scheduler *sched)
> > +{
> > +=09sched->ops->cancel_pending_fences(sched);
> > +=09wait_event(sched->pending_list_waitque,
> > drm_sched_no_jobs_pending(sched));
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > - * Tears down and cleans up the scheduler.
> > - *
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
> > + * Tears down and cleans up the scheduler. Might leak memory if
> > + * &struct drm_sched_backend_ops.cancel_pending_fences is not
> > implemented.
> > =C2=A0=C2=A0 */
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0=09struct drm_sched_entity *s_entity;
> > =C2=A0=C2=A0=09int i;
> > =C2=A0=20
> > -=09drm_sched_wqueue_stop(sched);
> > +=09if (sched->ops->cancel_pending_fences) {
> > +=09=09drm_sched_submission_and_timeout_stop(sched);
> > +=09=09drm_sched_cancel_jobs_and_wait(sched);
> > +=09=09drm_sched_free_stop(sched);
> > +=09} else {
> > +=09=09/* We're in "legacy free-mode" and ignore
> > potential mem leaks */
> > +=09=09drm_sched_wqueue_stop(sched);
> > +=09}
> > =C2=A0=20
> > =C2=A0=C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs=
;
> > i++) {
> > =C2=A0=C2=A0=09=09struct drm_sched_rq *rq =3D sched->sched_rq[i];
> > @@ -1464,7 +1529,7 @@ bool drm_sched_wqueue_ready(struct
> > drm_gpu_scheduler *sched)
> > =C2=A0 EXPORT_SYMBOL(drm_sched_wqueue_ready);
> > =C2=A0=20
> > =C2=A0 /**
> > - * drm_sched_wqueue_stop - stop scheduler submission
> > + * drm_sched_wqueue_stop - stop scheduler submission and freeing
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Stops the scheduler from pulling new jobs from entities.=
 It
> > also stops
> > @@ -1473,13 +1538,14 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
> > =C2=A0 void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0=09WRITE_ONCE(sched->pause_submit, true);
> > +=09WRITE_ONCE(sched->pause_free, true);
> > =C2=A0=C2=A0=09cancel_work_sync(&sched->work_run_job);
> > =C2=A0=C2=A0=09cancel_work_sync(&sched->work_free_job);
> > =C2=A0 }
> > =C2=A0 EXPORT_SYMBOL(drm_sched_wqueue_stop);
> > =C2=A0=20
> > =C2=A0 /**
> > - * drm_sched_wqueue_start - start scheduler submission
> > + * drm_sched_wqueue_start - start scheduler submission and freeing
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Restarts the scheduler after drm_sched_wqueue_stop() has
> > stopped it.
> > @@ -1490,6 +1556,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
> > =C2=A0 void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> > =C2=A0 {
> > =C2=A0=C2=A0=09WRITE_ONCE(sched->pause_submit, false);
> > +=09WRITE_ONCE(sched->pause_free, false);
> > =C2=A0=C2=A0=09queue_work(sched->submit_wq, &sched->work_run_job);
> > =C2=A0=C2=A0=09queue_work(sched->submit_wq, &sched->work_free_job);
> > =C2=A0 }
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index d860db087ea5..d8bd5b605336 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -29,6 +29,7 @@
> > =C2=A0 #include <linux/completion.h>
> > =C2=A0 #include <linux/xarray.h>
> > =C2=A0 #include <linux/workqueue.h>
> > +#include <linux/wait.h>
> > =C2=A0=20
> > =C2=A0 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> > =C2=A0=20
> > @@ -508,6 +509,19 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * and it's=
 time to clean it up.
> > =C2=A0=C2=A0=09 */
> > =C2=A0=C2=A0=09void (*free_job)(struct drm_sched_job *sched_job);
> > +
> > +=09/**
> > +=09 * @cancel_pending_fences: cancel all unsignaled hardware
> > fences
> > +=09 *
> > +=09 * This callback must signal all unsignaled hardware
> > fences associated
> > +=09 * with @sched with an appropriate error code (e.g., -
> > ECANCELED). This
> > +=09 * ensures that all jobs will get freed by the scheduler
> > before
> > +=09 * teardown.
> > +=09 *
> > +=09 * This callback is optional, but it is highly recommended
> > to implement
> > +=09 * it to avoid memory leaks.
> > +=09 */
> > +=09void (*cancel_pending_fences)(struct drm_gpu_scheduler
> > *sched);
>=20
> I still don't understand why insist to use a new term in the backend=20
> ops, and even the whole scheduler API. Nothing in the API so far has=20
> fences in the name. Something like cancel(_all|pending)_jobs or=20
> sched_fini would read more aligned with the rest to me.

Nothing has fences in the name, but they are the central concept of the
API: run_job() returns them, and they are the main mechanism through
which scheduler and driver communicate.

As mentioned in the other mail, the idea behind the callback is to get
all hardware fences signaled. Just that. That's a simple, well
established concept, easy to understand by drivers. In contrast, it
would be far less clear what "cancel" even means. That's evident from
the other patch where we're suddenly wondering whether the driver
should also cancel timers etc. in the callback.

It should not. The contract is simple: "signal everything".

It's also more difficult to abuse, since signaling is always valid. But
when is canceling valid?

Considering how internal APIs have been abused in the past, I can very
well see some party using a cancel_job() callback in the future to
"cancel" single jobs, for example in our (still unsolved)
resubmit_jobs() problem.

>=20
> > =C2=A0 };
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -533,6 +547,8 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 timeout interval is over.
> > =C2=A0=C2=A0 * @pending_list: the list of jobs which are currently in t=
he job
> > queue.
> > =C2=A0=C2=A0 * @job_list_lock: lock to protect the pending_list.
> > + * @pending_list_waitque: a waitqueue for drm_sched_fini() to
> > block on until all
> > + *=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending=
 jobs have been finished.
> > =C2=A0=C2=A0 * @hang_limit: once the hangs by a job crosses this limit =
then
> > it is marked
> > =C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 guilty and it will no longer be considered for
> > scheduling.
> > =C2=A0=C2=A0 * @score: score to help loadbalancer pick a idle sched
> > @@ -540,6 +556,7 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0 * @ready: marks if the underlying HW is ready to work
> > =C2=A0=C2=A0 * @free_guilty: A hit to time out handler to free the guil=
ty
> > job.
> > =C2=A0=C2=A0 * @pause_submit: pause queuing of @work_run_job on @submit=
_wq
> > + * @pause_free: pause queueing of @work_free_job on @submit_wq
> > =C2=A0=C2=A0 * @own_submit_wq: scheduler owns allocation of @submit_wq
> > =C2=A0=C2=A0 * @dev: system &struct device
> > =C2=A0=C2=A0 *
> > @@ -562,12 +579,14 @@ struct drm_gpu_scheduler {
> > =C2=A0=C2=A0=09struct delayed_work=09=09work_tdr;
> > =C2=A0=C2=A0=09struct list_head=09=09pending_list;
> > =C2=A0=C2=A0=09spinlock_t=09=09=09job_list_lock;
> > +=09wait_queue_head_t=09=09pending_list_waitque;
> > =C2=A0=C2=A0=09int=09=09=09=09hang_limit;
> > =C2=A0=C2=A0=09atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 *score;
> > =C2=A0=C2=A0=09atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 _score;
> > =C2=A0=C2=A0=09bool=09=09=09=09ready;
> > =C2=A0=C2=A0=09bool=09=09=09=09free_guilty;
> > =C2=A0=C2=A0=09bool=09=09=09=09pause_submit;
> > +=09bool=09=09=09=09pause_free;
> > =C2=A0=C2=A0=09bool=09=09=09=09own_submit_wq;
> > =C2=A0=C2=A0=09struct device=09=09=09*dev;
> > =C2=A0 };
>=20
> And, as you know, another thing I don't understand is why would we=20
> choose to add more of the state machine when I have shown how it can
> be=20
> done more elegantly. You don't have to reply, this is more a for the=20
> record against v3.

I do like your approach to a degree, and I reimplemented and tested it
during the last days! Don't think I just easily toss aside a good idea;
in fact, weighing between both approaches did cause me some headache :)

The thing is that while implementing it for the unit tests (not even to
begin with Nouveau, where the implementation is a bit more difficult
because some helpers need to be moved), I ran into a ton of faults
because of how the tests are constructed. When do I have to cancel
which timer for which job, all before calling drm_sched_fini(), or each
one separately in cancel_job()? What about timedout jobs?

This [1] for exmaple is an implementation attempt I made which differs
only slightly from yours but does not work and causes all sorts of
issues with timer interrupts.

Now, that could obviously be fixed, and maybe I fail =E2=80=93 but the thin=
g
is, if I can fail, others can, too. And porting the unit tests is a
good beta-test.

When you look at the waitqueue solution, it is easy to implement for
both Nouveau and sched/tests, with minimal adjustments. My approach
works for both and is already well tested in Nouveau.

The ease with which it can be used and the simplicity of the contract
("signal all fences!") gives me confidence that this is, despite the
larger state machine, more maintainable and that it's easier to port
other drivers to the new cleanup method. I've had some success with
similar approaches when cleaning up 16 year old broken PCI code [2].

Moreover, our long term goal should anyways be to, ideally, port all
drivers to the new cleanup design and then make the callback mandatory.
Then some places in drm_sched_fini() can be cleaned up, too.

Besides, the above reasons like the resistence against abuse of a
cancel_job() also apply.


Does that sound convincing? :)
P.


[1] https://paste.debian.net/1376021/
[2] https://lore.kernel.org/linux-pci/20250520085938.GB261485@rocinante/T/#=
m6e28eabdb22286238545c1fa6026445a4001d8e2



>=20
> Regards,
>=20
> Tvrtko
>=20

