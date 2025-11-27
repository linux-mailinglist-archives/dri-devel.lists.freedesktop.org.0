Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26516C8D623
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1810E10E78D;
	Thu, 27 Nov 2025 08:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jlOpnkgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618810E78D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764232901;
 bh=fiuexuIsEdUj3/wLG1Gt0LNvGBFg4XOrLFM4dds03V4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jlOpnkgMgtJq5fk2AhOCV+thsCNl5cllxGGP5y+3KFHeYZ/zwHsv3FGToKjPiTZ5U
 UcZHDhKy8JPIrt9p8ysDsEVysJaeWm4OPC98c7Yh4sOfMd+M5Nf3brwqvbmZOrpFy6
 2ZB/wDvmE3rKKDpR0xc5drYT7OC5Ci0J5rnycSZZLbGyrqawdP0N1DJInyNpkJmsRx
 GTyYeHQAgE9WJ1+sBiyXF4wU5V8LoGWrCc0E4mM47mz/1r9WNrKllaFBYRo2vndiN2
 bP8SGPcX+QMALK1uFwdrDRYrArsR+l1s97UqaqA1jNCGWj8BtON079xxbr2Ieh1ABO
 3WOr4V3NIXZ1w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0953317E0DC8;
 Thu, 27 Nov 2025 09:41:40 +0100 (CET)
Date: Thu, 27 Nov 2025 09:41:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, kernel@collabora.com
Subject: Re: [PATCH v2 7/8] drm/panthor: Make sure we resume the tick when
 new jobs are submitted
Message-ID: <20251127094136.28ff55df@fedora>
In-Reply-To: <CAPaKu7SDz8MjHdpEUGBmNfh6Z2EC4CB6vXo74ZzVQUOC_=9nHg@mail.gmail.com>
References: <20251112115142.1270931-1-boris.brezillon@collabora.com>
 <20251112115142.1270931-8-boris.brezillon@collabora.com>
 <CAPaKu7SDz8MjHdpEUGBmNfh6Z2EC4CB6vXo74ZzVQUOC_=9nHg@mail.gmail.com>
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

On Wed, 26 Nov 2025 14:57:32 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Thu, Nov 13, 2025 at 7:32=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > If the group is already assigned a slot but was idle before this job
> > submission, we need to make sure the priority rotation happens in the
> > future. Extract the existing logic living in group_schedule_locked()
> > and call this new sched_resume_tick() helper from the "group is
> > assigned a slot" path.
> >
> > v2:
> > - Add R-b
> >
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 43 +++++++++++++++++++------
> >  1 file changed, 34 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index 0394f377c284..d1484f4a1c5b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -2543,14 +2543,33 @@ static void sync_upd_work(struct work_struct *w=
ork)
> >                 sched_queue_delayed_work(sched, tick, 0);
> >  }
> >
> > +static void sched_resume_tick(struct panthor_device *ptdev)
> > +{
> > +       struct panthor_scheduler *sched =3D ptdev->scheduler;
> > +       u64 delay_jiffies, now;
> > +
> > +       drm_WARN_ON(&ptdev->base, sched->resched_target !=3D U64_MAX);
> > +
> > +       /* Scheduler tick was off, recalculate the resched_target based=
 on the
> > +        * last tick event, and queue the scheduler work.
> > +        */
> > +       now =3D get_jiffies_64();
> > +       sched->resched_target =3D sched->last_tick + sched->tick_period;
> > +       if (sched->used_csg_slot_count =3D=3D sched->csg_slot_count &&
> > +           time_before64(now, sched->resched_target))
> > +               delay_jiffies =3D min_t(unsigned long, sched->resched_t=
arget - now, ULONG_MAX);
> > +       else
> > +               delay_jiffies =3D 0;
> > +
> > +       sched_queue_delayed_work(sched, tick, delay_jiffies);
> > +}
> > +
> >  static void group_schedule_locked(struct panthor_group *group, u32 que=
ue_mask)
> >  {
> >         struct panthor_device *ptdev =3D group->ptdev;
> >         struct panthor_scheduler *sched =3D ptdev->scheduler;
> >         struct list_head *queue =3D &sched->groups.runnable[group->prio=
rity];
> > -       u64 delay_jiffies =3D 0;
> >         bool was_idle;
> > -       u64 now;
> >
> >         if (!group_can_run(group))
> >                 return;
> > @@ -2595,13 +2614,7 @@ static void group_schedule_locked(struct panthor=
_group *group, u32 queue_mask)
> >         /* Scheduler tick was off, recalculate the resched_target based=
 on the
> >          * last tick event, and queue the scheduler work.
> >          */
> > -       now =3D get_jiffies_64();
> > -       sched->resched_target =3D sched->last_tick + sched->tick_period;
> > -       if (sched->used_csg_slot_count =3D=3D sched->csg_slot_count &&
> > -           time_before64(now, sched->resched_target))
> > -               delay_jiffies =3D min_t(unsigned long, sched->resched_t=
arget - now, ULONG_MAX);
> > -
> > -       sched_queue_delayed_work(sched, tick, delay_jiffies);
> > +       sched_resume_tick(ptdev);
> >  }
> >
> >  static void queue_stop(struct panthor_queue *queue,
> > @@ -3202,6 +3215,18 @@ queue_run_job(struct drm_sched_job *sched_job)
> >
> >                 group_schedule_locked(group, BIT(job->queue_idx));
> >         } else {
> > +               u32 queue_mask =3D BIT(job->queue_idx);
> > +               bool resume_tick =3D group_is_idle(group) &&
> > +                                  (group->idle_queues & queue_mask) &&
> > +                                  !(group->blocked_queues & queue_mask=
) &&
> > +                                  sched->resched_target =3D=3D U64_MAX=
; =20
> The logic here should be the same as the first part of
> group_schedule_locked. I wonder if we can refactor that as well.

Could be, yes. I'll give it a try.

>=20
> > +
> > +               /* We just added something to the queue, so it's no lon=
ger idle. */
> > +               group->idle_queues &=3D ~BIT(job->queue_idx); =20
> group->idle_queues &=3D queue_mask;

You mean

			group->idle_queues &=3D ~queue_mask;

I guess.

>=20
> > +
> > +               if (resume_tick)
> > +                       sched_resume_tick(ptdev);
> > +
> >                 gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
> >                 if (!sched->pm.has_ref &&
> >                     !(group->blocked_queues & BIT(job->queue_idx))) {
> > --
> > 2.51.1
> > =20

