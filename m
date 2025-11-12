Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9CC527B6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F55D10E733;
	Wed, 12 Nov 2025 13:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VnPEmFqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F25F10E733
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762954269;
 bh=CacQxCdfmcjJBG38bt5dlh7ied1SQ9OdWl8axcpwW34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VnPEmFqjP1muNltv3VtiTk2H3++JzOQ3wCsU2dzEnZ1zu2mWnuC5rq6AfLnt0mZ6+
 /UNjwUpo6HCRbi0+dqR7u024Vy5YKskw0bvB4ZUM67ExgJoszmX4nvK7KyzueVEfae
 j0RKYeGC2U7IHxlhhmexJxmSo8KSxV4GNy8tMsBL7DHV76IRO+7IjWH2bJ+u/kyoCZ
 a8L5MCtRw0LXleuKTejGx1kzvvWBH9NKMK7JbdCFWvfMmeuNKnXOMvQsCO8YDApgQM
 ltYoaHwQYpvcedgjwFUWVCUkyDysm05r9IjZ+N43ZAyol43WX4q7u5epDc6rzFgbPW
 tGer5OxFWXyiA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 51CDE17E0610;
 Wed, 12 Nov 2025 14:31:09 +0100 (CET)
Date: Wed, 12 Nov 2025 14:31:04 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Steven Price  <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe  <adrian.larumbe@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>, Ashley Smith <ashley.smith@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v7 1/2] drm/panthor: Make the timeout per-queue instead
 of per-job
Message-ID: <20251112143104.2cabebb9@fedora>
In-Reply-To: <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
 <20251112121744.1356882-2-boris.brezillon@collabora.com>
 <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Philipp,

On Wed, 12 Nov 2025 13:38:00 +0100
Philipp Stanner <pstanner@redhat.com> wrote:

> On Wed, 2025-11-12 at 13:17 +0100, Boris Brezillon wrote:
> > From: Ashley Smith <ashley.smith@collabora.com>
> >=20
> > The timeout logic provided by drm_sched leads to races when we try
> > to suspend it while the drm_sched workqueue queues more jobs. Let's
> > overhaul the timeout handling in panthor to have our own delayed work
> > that's resumed/suspended when a group is resumed/suspended. When an
> > actual timeout occurs, we call drm_sched_fault() to report it
> > through drm_sched, still. But otherwise, the drm_sched timeout is
> > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> > how we protect modifications on the timer.
> >=20
> > One issue seems to be when we call drm_sched_suspend_timeout() from
> > both queue_run_job() and tick_work() which could lead to races due to
> > drm_sched_suspend_timeout() not having a lock. Another issue seems to
> > be in queue_run_job() if the group is not scheduled, we suspend the
> > timeout again which undoes what drm_sched_job_begin() did when calling
> > drm_sched_start_timeout(). So the timeout does not reset when a job
> > is finished.
> >=20
> >  =20
>=20
> [=E2=80=A6]
>=20
> > +
> > +static void
> > +queue_reset_timeout_locked(struct panthor_queue *queue)
> > +{
> > +	lockdep_assert_held(&queue->fence_ctx.lock);
> > +
> > +	if (queue->timeout.remaining !=3D MAX_SCHEDULE_TIMEOUT) {
> > +		mod_delayed_work(queue->scheduler.timeout_wq, =20
>=20
> Here you are interfering with the scheduler's internals again, don't
> you. I think we agreed that we don't want to do such things anymore,
> didn't we?

We're not really touching drm_gpu_scheduler's internals, we're just
retrieving the timeout workqueue we passed at init time:
panthor_queue::timeout is panthor internals not drm_sched internals.

This being said, I agree we should use ptdev->reset.wq instead of
retrieving the timeout workqueue through the drm_gpu_scheduler object.

Just to be clear, the goal of this patch is to bypass the
drm_gpu_scheduler timeout logic entirely, so we can have our own thing
that's not racy (see below).

>=20
> You could write a proper drm_sched API function which serves your
> usecase.

It's not really lack of support for our usecase that drives this
change, but more the fact the current helpers are racy for drivers that
have a 1:1 entity:sched relationship with queues that can be scheduled
out behind drm_gpu_scheduler's back.

>=20
> Or could maybe DRM_GPU_SCHED_STAT_NO_HANG be returned from your driver
> in case an interrupt actually fires?

I don't think it helps, see below.

>=20
> > +				 &queue->timeout.work,
> > +				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> > +	}
> > +}
> > +
> > +static bool
> > +group_can_run(struct panthor_group *group)
> > +{
> > +	return group->state !=3D PANTHOR_CS_GROUP_TERMINATED &&
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 group->state !=3D PANTHOR_CS_GRO=
UP_UNKNOWN_STATE &&
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !group->destroyed && group->fata=
l_queues =3D=3D 0 &&
> > +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !group->timedout;
> > +}
> > +
> >  =20
>=20
> [=E2=80=A6]
>=20
> > +queue_suspend_timeout(struct panthor_queue *queue)
> > +{
> > +	spin_lock(&queue->fence_ctx.lock);
> > +	queue_suspend_timeout_locked(queue);
> > +	spin_unlock(&queue->fence_ctx.lock);
> > +}
> > +
> > +static void
> > +queue_resume_timeout(struct panthor_queue *queue)
> > +{
> > +	spin_lock(&queue->fence_ctx.lock);
> > +
> > +	if (queue_timeout_is_suspended(queue)) {
> > +		mod_delayed_work(queue->scheduler.timeout_wq, =20
>=20
> There is drm_sched_resume_timeout(). Why can it not be used?

Because it's racy. I don't remember all the details, but IIRC, it had
to do with job insertion calling drm_sched_start_timeout() while we're
calling drm_sched_resume_timeout() from cs_slot_reset_locked(). We
tried to make it work, but we gave up at some point and went for a
driver-specific timer, because ultimately what we want is a per-queue
timeout that we can pause/resume without drm_sched interfering when new
jobs are queued to our ring buffers: we resume when the execution
context (AKA group) is scheduled in, and we pause when this execution
context is scheduled out.

That's the very reason we set drm_gpu_scheduler::timeout to
MAX_SCHEDULE_TIMEOUT at init time (AKA, timeout disabled) and never
touch that again. When our driver-internal timer expires, we forward
the information to the drm_sched layer by calling drm_sched_fault().

>=20
> > +				 &queue->timeout.work,
> > +				 queue->timeout.remaining);
> > +
> > +		queue->timeout.remaining =3D MAX_SCHEDULE_TIMEOUT;
> > +	}
> > +
> > +	spin_unlock(&queue->fence_ctx.lock);
> > +}
> > +
> >  =20
>=20
> [=E2=80=A6]
>=20
> > =C2=A0
> > @@ -3270,6 +3379,11 @@ queue_timedout_job(struct drm_sched_job *sched_j=
ob)
> > =C2=A0
> > =C2=A0	queue_start(queue);
> > =C2=A0
> > +	/* We already flagged the queue as faulty, make sure we don't get
> > +	 * called again.
> > +	 */
> > +	queue->scheduler.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +
> > =C2=A0	return DRM_GPU_SCHED_STAT_RESET; =20
>=20
> DRM_GPU_SCHED_STAT_NO_HANG instead of just modifying the scheduler's
> internal data??


	queue->scheduler.timeout =3D MAX_SCHEDULE_TIMEOUT;

is a leftover from a previous version. We shouldn't have to modify that
here because the timeout is initialized to MAX_SCHEDULE_TIMEOUT and
never touched again.

Regards,

Boris
