Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D99A915B3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 09:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3A610EA54;
	Thu, 17 Apr 2025 07:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f4OYKlOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390FB10EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744876191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fHaewztJhU6dXBBKAbX5gnzf+MrVHXnJVP+oMWLhnco=;
 b=f4OYKlOojPpVViXa2uk1ZA8TAFhUNfbMb7xDBtpSY7/hXFKZBf3qbQ0k9rOzqIIpEo4aDy
 z/z0XmSclLafxThRsVKE0yM6KEhjjLyr3EIuPDxLxJE7mEWitl4DQEV+sWOQuyI/B91M0m
 3EKNspX5mBf0Ky6zdgsuiCrJCZ6s8ZY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194--BQmfRZhORWXKAM-9otsew-1; Thu, 17 Apr 2025 03:49:49 -0400
X-MC-Unique: -BQmfRZhORWXKAM-9otsew-1
X-Mimecast-MFC-AGG-ID: -BQmfRZhORWXKAM-9otsew_1744876188
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-af8e645a1d1so343593a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 00:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744876188; x=1745480988;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lbQgrXz5oiICX14AE+d1lrN5WuBPYGRCPNcO8Q1nbVQ=;
 b=d+kAwhEPkUAN6Ue5Acna9a9Lbi4hH0zz/receQirKPsy7NI1jjdMgVD1zPyb9EDebR
 6JUvXp0pENb60xbZAKakemooX61tuVAi04SalNBgp4emL80cQRhXDCnMPYszdMUHtnrW
 UJvpE2Hztez7FRjlkAj/aYmkrHj4aeu6Njkd3lADRWO8Q3AUWuXfEx61cXQQIC+zO5uy
 +PXYbntck8sFQ4bZ8egWsH9Gq4CaR56BVFEb8Nu/0PlJf2ck5KZn5WBLEl1N2adrc0yM
 EbrkMyamAiylxbHpzrGIYxAEFtLxmitmKL5s2kMTMqhxBUaLhmnubKwtr3PAq9/PACub
 DHzg==
X-Gm-Message-State: AOJu0Yxj6RMguB3K4BFhiU4gY+At0JtMY11hqD8gk9/qcQ1x+/yWP2g4
 lZEinXaXsvGIAVJnJXKYZ6LlfQcWbWj0fyJOAcfBxg+MK7aulMa8CbNj0jO3ihthjNcl3jSvHDk
 Dt6cbCpP5FEFQ2CRoFRnQkIuUdHEdSeHnPmAkMxtaE/pN02aFjq8XsMUGQd1RFLZVxQ==
X-Gm-Gg: ASbGncvBje+jJUVfDrdqo11CzPbRVcznm1NIvOP1H9DsFhrGZ4zAZV/JnF9XZtKnfRP
 6W3ZX9Nj4uC1dHgwbcN7g85/DW06559/O1BOq55DnXStuPzr8fBUWBqRMnUeXNQGiZcfZj5PTce
 hPe6IzxwrLfEpD2dLc1my9uUBGKB6Y62ZqokaR6kfoANzLS+8i7JC5BFeXu6srtBlyp6z0tKZFE
 kKPjdkSn7XgOnNEAnl2S1pJftnSBW82+mDu6IngOzTYHlfRPRPfuwTKZqW+8mGmQZ5lMBjKhPS/
 BoNokXoQxh2QChp7o8bj5Wadq6/sy+JsNLUqRA==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:8d3b:e294 with SMTP id
 adf61e73a8af0-203b3e9847emr7096083637.16.1744876188016; 
 Thu, 17 Apr 2025 00:49:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVjB/C/+4oGat9oE5aw8eMd7Xk6k37G4WKUy4clN0zc5tP1oOBnDeVNJos16vE6SjOc2bC2w==
X-Received: by 2002:a05:6a21:3a44:b0:1f5:8d3b:e294 with SMTP id
 adf61e73a8af0-203b3e9847emr7096046637.16.1744876187559; 
 Thu, 17 Apr 2025 00:49:47 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198a89sm11723812b3a.5.2025.04.17.00.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 00:49:47 -0700 (PDT)
Message-ID: <bce0a735c334fc3a26f7795c77323b7684085015.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Fix teardown leaks with waitqueue
From: Philipp Stanner <pstanner@redhat.com>
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 17 Apr 2025 09:49:34 +0200
In-Reply-To: <20250407152239.34429-3-phasta@kernel.org>
References: <20250407152239.34429-2-phasta@kernel.org>
 <20250407152239.34429-3-phasta@kernel.org>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dWi-bfJcUlCWmaHisALup0ivXCWxB4zo6Vbj_L0TNDU_1744876188
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

On Mon, 2025-04-07 at 17:22 +0200, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
>=20
> The GPU scheduler currently does not ensure that its pending_list is
> empty before performing various other teardown tasks in
> drm_sched_fini().
>=20
> If there are still jobs in the pending_list, this is problematic
> because
> after scheduler teardown, no one will call backend_ops.free_job()
> anymore. This would, consequently, result in memory leaks.
>=20
> One way to solve this is to implement a waitqueue that
> drm_sched_fini()
> blocks on until the pending_list has become empty.
>=20
> Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once the
> pending_list becomes empty. Wait in drm_sched_fini() for that to
> happen.
>=20
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 84 ++++++++++++++++++++---=
-
> --
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++
> =C2=A02 files changed, 75 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 829579c41c6b..a6a4deeda72b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -367,7 +367,7 @@ static void drm_sched_run_job_queue(struct
> drm_gpu_scheduler *sched)
> =C2=A0 */
> =C2=A0static void __drm_sched_run_free_queue(struct drm_gpu_scheduler
> *sched)
> =C2=A0{
> -=09if (!READ_ONCE(sched->pause_submit))
> +=09if (!READ_ONCE(sched->pause_free))
> =C2=A0=09=09queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> =C2=A0
> @@ -556,6 +556,7 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0=09=09 * is parked at which point it's safe.
> =C2=A0=09=09 */
> =C2=A0=09=09list_del_init(&job->list);
> +
> =C2=A0=09=09spin_unlock(&sched->job_list_lock);
> =C2=A0
> =C2=A0=09=09status =3D job->sched->ops->timedout_job(job);
> @@ -572,8 +573,10 @@ static void drm_sched_job_timedout(struct
> work_struct *work)
> =C2=A0=09=09spin_unlock(&sched->job_list_lock);
> =C2=A0=09}
> =C2=A0
> -=09if (status !=3D DRM_GPU_SCHED_STAT_ENODEV)
> -=09=09drm_sched_start_timeout_unlocked(sched);
> +=09if (status !=3D DRM_GPU_SCHED_STAT_ENODEV) {
> +=09=09if (!READ_ONCE(sched->cancel_timeout))

Another thing I want to investigate is whether all those booleans we
read with READ_ONCE are actually necessary?

Because I suspect they are not. The cancel_work_sync() functions should
do the trick, and if they're too late we'd just wait one cycle longer.

@Christian, Tvrtko, could be helpful if you can take a look.

> +=09=09=09drm_sched_start_timeout_unlocked(sched);
> +=09}
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -1119,12 +1122,22 @@ drm_sched_get_finished_job(struct
> drm_gpu_scheduler *sched)
> =C2=A0=09=09/* remove job from pending_list */
> =C2=A0=09=09list_del_init(&job->list);
> =C2=A0
> +=09=09/*
> +=09=09 * Inform tasks blocking in drm_sched_fini() that
> it's now safe to proceed.
> +=09=09 */
> +=09=09if (list_empty(&sched->pending_list))
> +=09=09=09wake_up(&sched->pending_list_waitque);
> +
> =C2=A0=09=09/* cancel this job's TO timer */
> =C2=A0=09=09cancel_delayed_work(&sched->work_tdr);
> =C2=A0=09=09/* make the scheduled timestamp more accurate */
> =C2=A0=09=09next =3D list_first_entry_or_null(&sched-
> >pending_list,
> =C2=A0=09=09=09=09=09=09typeof(*next),
> list);
> =C2=A0
> +=09=09// TODO RFC: above we wake up the waitque which
> relies on the fact
> +=09=09// that timeouts have been deactivated. The below
> should never
> +=09=09// reactivate them since the list was empty above.
> Still, should
> +=09=09// we document that?

Regarding this, I re-read the code a few times and conclude that this
is not a problem.


P.

> =C2=A0=09=09if (next) {
> =C2=A0=09=09=09if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &next->s_fence-
> >scheduled.flags))
> @@ -1324,6 +1337,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0=09init_waitqueue_head(&sched->job_scheduled);
> =C2=A0=09INIT_LIST_HEAD(&sched->pending_list);
> =C2=A0=09spin_lock_init(&sched->job_list_lock);
> +=09init_waitqueue_head(&sched->pending_list_waitque);
> =C2=A0=09atomic_set(&sched->credit_count, 0);
> =C2=A0=09INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> =C2=A0=09INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> @@ -1331,6 +1345,8 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0=09atomic_set(&sched->_score, 0);
> =C2=A0=09atomic64_set(&sched->job_id_count, 0);
> =C2=A0=09sched->pause_submit =3D false;
> +=09sched->pause_free =3D false;
> +=09sched->cancel_timeout =3D false;
> =C2=A0
> =C2=A0=09sched->ready =3D true;
> =C2=A0=09return 0;
> @@ -1348,6 +1364,40 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_init);
> =C2=A0
> +/**
> + * drm_sched_submission_and_timeout_stop - stop everything except
> for free_job()
> + * @sched: scheduler instance
> + *
> + * Only needed to cleanly tear down the scheduler in
> drm_sched_fini().
> + */
> +static inline void
> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler
> *sched)
> +{
> +=09WRITE_ONCE(sched->pause_submit, true);
> +=09WRITE_ONCE(sched->cancel_timeout, true);
> +=09cancel_work_sync(&sched->work_run_job);
> +=09cancel_delayed_work_sync(&sched->work_tdr);
> +}
> +
> +static inline void
> +drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> +{
> +=09WRITE_ONCE(sched->pause_free, true);
> +=09cancel_work_sync(&sched->work_free_job);
> +}
> +
> +static inline bool
> +drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
> +{
> +=09bool empty;
> +
> +=09spin_lock(&sched->job_list_lock);
> +=09empty =3D list_empty(&sched->pending_list);
> +=09spin_unlock(&sched->job_list_lock);
> +
> +=09return empty;
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_sched_fini - Destroy a gpu scheduler
> =C2=A0 *
> @@ -1355,26 +1405,24 @@ EXPORT_SYMBOL(drm_sched_init);
> =C2=A0 *
> =C2=A0 * Tears down and cleans up the scheduler.
> =C2=A0 *
> - * This stops submission of new jobs to the hardware through
> - * drm_sched_backend_ops.run_job(). Consequently,
> drm_sched_backend_ops.free_job()
> - * will not be called for all jobs still in
> drm_gpu_scheduler.pending_list.
> - * There is no solution for this currently. Thus, it is up to the
> driver to make
> - * sure that:
> - *
> - *=C2=A0 a) drm_sched_fini() is only called after for all submitted jobs
> - *=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_backend_ops.free_job() has been cal=
led or that
> - *=C2=A0 b) the jobs for which drm_sched_backend_ops.free_job() has not
> been called
> - *=C2=A0=C2=A0=C2=A0=C2=A0 after drm_sched_fini() ran are freed manually=
.
> - *
> - * FIXME: Take care of the above problem and prevent this function
> from leaking
> - * the jobs in drm_gpu_scheduler.pending_list under any
> circumstances.
> + * Note that this function blocks until all the fences returned by
> + * &struct drm_sched_backend_ops.run_job have been signalled.
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0=09struct drm_sched_entity *s_entity;
> =C2=A0=09int i;
> =C2=A0
> -=09drm_sched_wqueue_stop(sched);
> +=09/*
> +=09 * Jobs that have neither been scheduled or which have timed
> out are
> +=09 * gone by now, but jobs that have been submitted through
> +=09 * backend_ops.run_job() and have not yet terminated are
> still pending.
> +=09 *
> +=09 * Wait for the pending_list to become empty to avoid
> leaking those jobs.
> +=09 */
> +=09drm_sched_submission_and_timeout_stop(sched);
> +=09wait_event(sched->pending_list_waitque,
> drm_sched_no_jobs_pending(sched));
> +=09drm_sched_free_stop(sched);
> =C2=A0
> =C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> {
> =C2=A0=09=09struct drm_sched_rq *rq =3D sched->sched_rq[i];
> @@ -1471,6 +1519,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
> =C2=A0void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0=09WRITE_ONCE(sched->pause_submit, true);
> +=09WRITE_ONCE(sched->pause_free, true);
> =C2=A0=09cancel_work_sync(&sched->work_run_job);
> =C2=A0=09cancel_work_sync(&sched->work_free_job);
> =C2=A0}
> @@ -1488,6 +1537,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
> =C2=A0void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
> =C2=A0{
> =C2=A0=09WRITE_ONCE(sched->pause_submit, false);
> +=09WRITE_ONCE(sched->pause_free, false);
> =C2=A0=09queue_work(sched->submit_wq, &sched->work_run_job);
> =C2=A0=09queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..badcf9ea4501 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -29,6 +29,7 @@
> =C2=A0#include <linux/completion.h>
> =C2=A0#include <linux/xarray.h>
> =C2=A0#include <linux/workqueue.h>
> +#include <linux/wait.h>
> =C2=A0
> =C2=A0#define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> =C2=A0
> @@ -533,6 +534,8 @@ struct drm_sched_backend_ops {
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 timeout interval is over.
> =C2=A0 * @pending_list: the list of jobs which are currently in the job
> queue.
> =C2=A0 * @job_list_lock: lock to protect the pending_list.
> + * @pending_list_waitque: a waitqueue for drm_sched_fini() to block
> on until all
> + *=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pending j=
obs have been finished.
> =C2=A0 * @hang_limit: once the hangs by a job crosses this limit then it
> is marked
> =C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 guilty and it will no longer be considered for
> scheduling.
> =C2=A0 * @score: score to help loadbalancer pick a idle sched
> @@ -540,6 +543,8 @@ struct drm_sched_backend_ops {
> =C2=A0 * @ready: marks if the underlying HW is ready to work
> =C2=A0 * @free_guilty: A hit to time out handler to free the guilty job.
> =C2=A0 * @pause_submit: pause queuing of @work_run_job on @submit_wq
> + * @pause_free: pause queuing of @work_free_job on @submit_wq
> + * @cancel_timeout: pause queuing of @work_tdr on @submit_wq
> =C2=A0 * @own_submit_wq: scheduler owns allocation of @submit_wq
> =C2=A0 * @dev: system &struct device
> =C2=A0 *
> @@ -562,12 +567,15 @@ struct drm_gpu_scheduler {
> =C2=A0=09struct delayed_work=09=09work_tdr;
> =C2=A0=09struct list_head=09=09pending_list;
> =C2=A0=09spinlock_t=09=09=09job_list_lock;
> +=09wait_queue_head_t=09=09pending_list_waitque;
> =C2=A0=09int=09=09=09=09hang_limit;
> =C2=A0=09atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 *score;
> =C2=A0=09atomic_t=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 _score;
> =C2=A0=09bool=09=09=09=09ready;
> =C2=A0=09bool=09=09=09=09free_guilty;
> =C2=A0=09bool=09=09=09=09pause_submit;
> +=09bool=09=09=09=09pause_free;
> +=09bool=09=09=09=09cancel_timeout;
> =C2=A0=09bool=09=09=09=09own_submit_wq;
> =C2=A0=09struct device=09=09=09*dev;
> =C2=A0};

