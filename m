Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4BC528AB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F39010E14D;
	Wed, 12 Nov 2025 13:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AcX6SvEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADE510E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762955335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QnWpDiHJVGTRHZS8gOf0ZaUZrjzwmfuF3CeAh7zOUtM=;
 b=AcX6SvEWNkIcZ1XYx3e8Vbo77hcCWKT5RuFjAhS+eUBOMU34haXb4OuQQHta6vavwW/9y+
 ZSpnlSFdDBHjE6KB5Z6mFNa2oJJIFtYUSyAqbcMzTIJ6su7m0Qfvel4/EELq1AuAjrXl0u
 HlpWRBhmnAYyknjKhLJueVXniOICj+Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-npEwz9bIOxqdEevZqMep2A-1; Wed, 12 Nov 2025 08:48:54 -0500
X-MC-Unique: npEwz9bIOxqdEevZqMep2A-1
X-Mimecast-MFC-AGG-ID: npEwz9bIOxqdEevZqMep2A_1762955333
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42b352355a1so381938f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 05:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762955333; x=1763560133;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XWyDO31RkKP0fb8ylCf2xdfPh0pZfpa0tuLIjbqVmcU=;
 b=PcWa2EZNwVWSj/F1AR7AfvS4sz3X9EeCdbrqk8jEajlrT8eocXQZuOSWSyilegnc27
 7KUyz1IQsArvb/I2ydIpsBjaX/WqLOMM+9t9dsg2Qdb129ZASk5zneUPMq6hfVd+sSoA
 PPv0tn1oXJGfUJ1hxbbd5CA/bmM/5ghGqUJlnlqc112ZczMTAgQsY7kDv4Gr8s8hTrpf
 fmynIXGNkuiYYpsZLISSHzwFhHIhxhHBjEAPzkUogRcBX2ZphAQnMpPEL7cF+RagLJGl
 PJYiKP4iBZbcWVZsgmo7kpmHDV1jy3O4iZPedN+uIBNYwONhmXn3vTzmSDJVslxsJ3gb
 qMjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvr3bs4zNcEMjNCpoA3JFle8wrvYiLhVgiRcs8ZSg5Iqmgmwq8IwcAxCeKAp9amhDRKytnJth1FKc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzeZ2ARTFsQLihzbVG7oD2oxhXKnm1u+MJVguVJtI6JwVQuo1X
 M37HnbDurA+5FMpElmBeB25yDKg+LHFW95YvXOh15Zm5oIMJxkPhbZzmHueRhOCTmt6H7ykDe3G
 ahNSWWzQHrClFnNfFhaYE5s1CPriBdb1Lt8KRHIwAZuX0PHWP9HZhcl9tKHC7d+6rRqG+jw==
X-Gm-Gg: ASbGncsNdMfS7hCXW/Db7EM22SCoxtCCva64SyIO396AUR6OGmm8yWN7zEF97oL14nf
 PmjYqnWsKDJGSzjlq6BqrVJ68PPDUZVUUHBGW04P8swgj8eflkobcCauRjqwja287Nte7HB0Xvl
 HoqJJylW6qA3x3PhhXsFlGY3eUNtod1qMT7sxlC6zKerSZz5U/tZZU6Qg2UQUH1PTeaJLmDI4h7
 gKjDUwUPapXqj5KzjvsmoIlk5APpUeAXcpH/nWQhAX8zNS0nOu/VSajePvfpm2J29aauG9f7WDG
 sVhqlpT1gj9fdgd30BtN8hqPQpcftGGtonRFkyBqpticndi7jNHtvSL1JZHXZLH9MQRlzoQZtNo
 V0VuXmCxTEmLUhb8E68d2kiy6ag==
X-Received: by 2002:a05:6000:381:b0:425:6fb5:2add with SMTP id
 ffacd0b85a97d-42b432c933fmr6446343f8f.19.1762955333181; 
 Wed, 12 Nov 2025 05:48:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHairxwoAyj2QZ7EyFevZy2n0xk0/DyUsFo9xfLw4F55TorCEbw92l58K6kvBm8rCUAMSCi0Q==
X-Received: by 2002:a05:6000:381:b0:425:6fb5:2add with SMTP id
 ffacd0b85a97d-42b432c933fmr6446315f8f.19.1762955332678; 
 Wed, 12 Nov 2025 05:48:52 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e2bcf9sm37351945e9.3.2025.11.12.05.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 05:48:52 -0800 (PST)
Message-ID: <0558310f433debe93dddee0b6373bcb406b8bd62.camel@redhat.com>
Subject: Re: [PATCH v7 1/2] drm/panthor: Make the timeout per-queue instead
 of per-job
From: Philipp Stanner <pstanner@redhat.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?ISO-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Detlev Casanova
 <detlev.casanova@collabora.com>, Ashley Smith <ashley.smith@collabora.com>,
 kernel@collabora.com
Date: Wed, 12 Nov 2025 14:48:51 +0100
In-Reply-To: <20251112143104.2cabebb9@fedora>
References: <20251112121744.1356882-1-boris.brezillon@collabora.com>
 <20251112121744.1356882-2-boris.brezillon@collabora.com>
 <7cea7efb7ff0ab34ab7352158ecce731a3f714d8.camel@redhat.com>
 <20251112143104.2cabebb9@fedora>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6DuPBM1nBIQy_VOZA2rTJjl1EccqP1lV3wr_gZ-o8_E_1762955333
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

On Wed, 2025-11-12 at 14:31 +0100, Boris Brezillon wrote:
> Hi Philipp,
>=20
> On Wed, 12 Nov 2025 13:38:00 +0100
> Philipp Stanner <pstanner@redhat.com> wrote:
>=20
> > On Wed, 2025-11-12 at 13:17 +0100, Boris Brezillon wrote:
> > > From: Ashley Smith <ashley.smith@collabora.com>
> > >=20
> > > The timeout logic provided by drm_sched leads to races when we try
> > > to suspend it while the drm_sched workqueue queues more jobs. Let's
> > > overhaul the timeout handling in panthor to have our own delayed work
> > > that's resumed/suspended when a group is resumed/suspended. When an
> > > actual timeout occurs, we call drm_sched_fault() to report it
> > > through drm_sched, still. But otherwise, the drm_sched timeout is
> > > disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> > > how we protect modifications on the timer.
> > >=20
> > > One issue seems to be when we call drm_sched_suspend_timeout() from
> > > both queue_run_job() and tick_work() which could lead to races due to
> > > drm_sched_suspend_timeout() not having a lock. Another issue seems to
> > > be in queue_run_job() if the group is not scheduled, we suspend the
> > > timeout again which undoes what drm_sched_job_begin() did when callin=
g
> > > drm_sched_start_timeout(). So the timeout does not reset when a job
> > > is finished.
> > >=20
> > > =C2=A0=20
> >=20
> > [=E2=80=A6]
> >=20
> > > +
> > > +static void
> > > +queue_reset_timeout_locked(struct panthor_queue *queue)
> > > +{
> > > +=09lockdep_assert_held(&queue->fence_ctx.lock);
> > > +
> > > +=09if (queue->timeout.remaining !=3D MAX_SCHEDULE_TIMEOUT) {
> > > +=09=09mod_delayed_work(queue->scheduler.timeout_wq,=C2=A0=20
> >=20
> > Here you are interfering with the scheduler's internals again, don't
> > you. I think we agreed that we don't want to do such things anymore,
> > didn't we?
>=20
> We're not really touching drm_gpu_scheduler's internals, we're just
> retrieving the timeout workqueue we passed at init time:
> panthor_queue::timeout is panthor internals not drm_sched internals.
>=20
> This being said, I agree we should use ptdev->reset.wq instead of
> retrieving the timeout workqueue through the drm_gpu_scheduler object.
>=20
> Just to be clear, the goal of this patch is to bypass the
> drm_gpu_scheduler timeout logic entirely, so we can have our own thing
> that's not racy (see below).

OK. timeout_wq sharing is intended and allowed, so if that's what
you're doing, good. But I agree that accessing the wq through the
driver's struct is then cleaner and more obviously correct.

>=20
> >=20
> > You could write a proper drm_sched API function which serves your
> > usecase.
>=20
> It's not really lack of support for our usecase that drives this
> change, but more the fact the current helpers are racy for drivers that
> have a 1:1 entity:sched relationship with queues that can be scheduled
> out behind drm_gpu_scheduler's back.

And you also can't stop drm_sched to prevent races?

>=20
> >=20
> > Or could maybe DRM_GPU_SCHED_STAT_NO_HANG be returned from your driver
> > in case an interrupt actually fires?
>=20
> I don't think it helps, see below.
>=20
> >=20
> > > +=09=09=09=09 &queue->timeout.work,
> > > +=09=09=09=09 msecs_to_jiffies(JOB_TIMEOUT_MS));
> > > +=09}
> > > +}
> > > +
> > > +static bool
> > > +group_can_run(struct panthor_group *group)
> > > +{
> > > +=09return group->state !=3D PANTHOR_CS_GROUP_TERMINATED &&
> > > +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 group->state !=3D PANTHOR_CS=
_GROUP_UNKNOWN_STATE &&
> > > +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !group->destroyed && group->=
fatal_queues =3D=3D 0 &&
> > > +=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !group->timedout;
> > > +}
> > > +
> > > =C2=A0=20
> >=20
> > [=E2=80=A6]
> >=20
> > > +queue_suspend_timeout(struct panthor_queue *queue)
> > > +{
> > > +=09spin_lock(&queue->fence_ctx.lock);
> > > +=09queue_suspend_timeout_locked(queue);
> > > +=09spin_unlock(&queue->fence_ctx.lock);
> > > +}
> > > +
> > > +static void
> > > +queue_resume_timeout(struct panthor_queue *queue)
> > > +{
> > > +=09spin_lock(&queue->fence_ctx.lock);
> > > +
> > > +=09if (queue_timeout_is_suspended(queue)) {
> > > +=09=09mod_delayed_work(queue->scheduler.timeout_wq,=C2=A0=20
> >=20
> > There is drm_sched_resume_timeout(). Why can it not be used?
>=20
> Because it's racy. I don't remember all the details, but IIRC, it had
> to do with job insertion calling drm_sched_start_timeout() while we're
> calling drm_sched_resume_timeout() from cs_slot_reset_locked(). We
> tried to make it work, but we gave up at some point and went for a
> driver-specific timer, because ultimately what we want is a per-queue
> timeout that we can pause/resume without drm_sched interfering when new
> jobs are queued to our ring buffers: we resume when the execution
> context (AKA group) is scheduled in, and we pause when this execution
> context is scheduled out.
>=20
> That's the very reason we set drm_gpu_scheduler::timeout to
> MAX_SCHEDULE_TIMEOUT at init time (AKA, timeout disabled) and never
> touch that again. When our driver-internal timer expires, we forward
> the information to the drm_sched layer by calling drm_sched_fault().

That sounds all.. stressful ;)

As you know I only learned a few weeks ago about your group scheduler
on top of drm_sched. I wish I had heard about it when it was
implemented; we might have come up with the idea for drm_jobqueue
sooner.

>=20
> >=20
> > > +=09=09=09=09 &queue->timeout.work,
> > > +=09=09=09=09 queue->timeout.remaining);
> > > +
> > > +=09=09queue->timeout.remaining =3D MAX_SCHEDULE_TIMEOUT;
> > > +=09}
> > > +
> > > +=09spin_unlock(&queue->fence_ctx.lock);
> > > +}
> > > +
> > > =C2=A0=20
> >=20
> > [=E2=80=A6]
> >=20
> > > =C2=A0
> > > @@ -3270,6 +3379,11 @@ queue_timedout_job(struct drm_sched_job *sched=
_job)
> > > =C2=A0
> > > =C2=A0=09queue_start(queue);
> > > =C2=A0
> > > +=09/* We already flagged the queue as faulty, make sure we don't get
> > > +=09 * called again.
> > > +=09 */
> > > +=09queue->scheduler.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > > +
> > > =C2=A0=09return DRM_GPU_SCHED_STAT_RESET;=C2=A0=20
> >=20
> > DRM_GPU_SCHED_STAT_NO_HANG instead of just modifying the scheduler's
> > internal data??
>=20
>=20
> =09queue->scheduler.timeout =3D MAX_SCHEDULE_TIMEOUT;
>=20
> is a leftover from a previous version. We shouldn't have to modify that
> here because the timeout is initialized to MAX_SCHEDULE_TIMEOUT and
> never touched again.

So you agree that it can be removed in v8?


P.

