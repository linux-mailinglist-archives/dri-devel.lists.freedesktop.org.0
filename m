Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB6040B82A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 21:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9EF6E5C1;
	Tue, 14 Sep 2021 19:34:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF7C6E5BD;
 Tue, 14 Sep 2021 19:34:07 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so138394otf.2; 
 Tue, 14 Sep 2021 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Trvu9nlA00t2F84zxlJncsMRq1OyTstIv33vsK96jME=;
 b=EL3tMokWuM+bY8pDRfnqSPEtabiv7K+kLoxBw6cJmb4Q90HbsE24d6OpH1SYGgGi9g
 Nu+btKaeIGTU2gg4nHeG1ceW9p2/O+gB3AcHxrloMxolKubVqY1KoifrG0H0u5OjklLJ
 LIrfvreAou0Uua1loJFud9gzDCihoV5sre/oF4fpDQXSI+pRrSIh2ogVPfkkPWS6NS+F
 QzyrCPHfZJiSzIRrLLN+KWq91jW1a3OCVm+ipcJwPV8NMWFgpib6bpqvOQ/lN891+XB0
 /mfJPthPuT3VM+3aIgNW5JdXjmP0Z5ToblHS8Koam0uXAtcwN0hXGbWUka19ILANj6jA
 LrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Trvu9nlA00t2F84zxlJncsMRq1OyTstIv33vsK96jME=;
 b=giF7MMMJNTowHjvGKfd+cZ3lrQEEXWJiZGBigFy7huwyKpdvoQJiIfxjTOkzImVFke
 Ta0Q3MkfD/lqPf04xxohiiVICHDAhBkgIe/3acdBV2psc8WKStNezCMpY40Ympic2RvI
 GcuZSUNtrpbG1ITez+nfswMz0mLAPfRy5PjCi82wPe9A9eL92eo9SgYUw3bgNBDhitXA
 7/WB9IER+44p19T9kKMeo+9iaDJFyH/mUahJNA3hBPLsM/cOC6bZLfk6kkv9EkZ/H2hq
 AmBKwW6E3RcyQIaNLjG16y0Be1LEJlH0Rd0mGHPtgEIpuSWP33slaXDj3wwtdyvPWHgX
 Cg6Q==
X-Gm-Message-State: AOAM531cnh/pLd6YA9e6kmyYIZilKgc2FWUK4JoaYFwX/TAsIqyq1yGI
 znYoa7QTJkuHDohT5uR0Gva629rwshJvhAQHhNMahevl
X-Google-Smtp-Source: ABdhPJwudk4DN5ONA4OKPVTVyBme2DDqUGqkSKL3VoDnWYqbAmbcdDhMIHwclH/cVeGfnuZhx6G7uMCT8wpsIvn9+yM=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr16688605otu.299.1631648046893; 
 Tue, 14 Sep 2021 12:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <1630457207-13107-1-git-send-email-Monk.Liu@amd.com>
 <28709f7f-8a48-40ad-87bb-c2f0dd89da38@gmail.com>
 <CADnq5_PRE4WyftqO15c08qwQx2CRszsj4gJQtDeon9TvtV+qkA@mail.gmail.com>
In-Reply-To: <CADnq5_PRE4WyftqO15c08qwQx2CRszsj4gJQtDeon9TvtV+qkA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Sep 2021 15:33:56 -0400
Message-ID: <CADnq5_POHuuQYm5ZULWeumCmsy+eWbsRe0MSKuJcQxb7R=962g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
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

Was this fix independent of the other discussions?  Should this be
applied to drm-misc?

Alex

On Wed, Sep 1, 2021 at 4:42 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Sep 1, 2021 at 2:50 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 01.09.21 um 02:46 schrieb Monk Liu:
> > > issue:
> > > in cleanup_job the cancle_delayed_work will cancel a TO timer
> > > even the its corresponding job is still running.
> > >
> > > fix:
> > > do not cancel the timer in cleanup_job, instead do the cancelling
> > > only when the heading job is signaled, and if there is a "next" job
> > > we start_timeout again.
> > >
> > > v2:
> > > further cleanup the logic, and do the TDR timer cancelling if the sig=
naled job
> > > is the last one in its scheduler.
> > >
> > > v3:
> > > change the issue description
> > > remove the cancel_delayed_work in the begining of the cleanup_job
> > > recover the implement of drm_sched_job_begin.
> > >
> > > v4:
> > > remove the kthread_should_park() checking in cleanup_job routine,
> > > we should cleanup the signaled job asap
> > >
> > > TODO:
> > > 1)introduce pause/resume scheduler in job_timeout to serial the handl=
ing
> > > of scheduler and job_timeout.
> > > 2)drop the bad job's del and insert in scheduler due to above seriali=
zation
> > > (no race issue anymore with the serialization)
> > >
> > > tested-by: jingwen <jingwen.chen@@amd.com>
> > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
>
> Are you planning to push this to drm-misc?
>
> Alex
>
>
> > > ---
> > >   drivers/gpu/drm/scheduler/sched_main.c | 26 +++++++++--------------=
---
> > >   1 file changed, 9 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> > > index a2a9536..3e0bbc7 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -676,15 +676,6 @@ drm_sched_get_cleanup_job(struct drm_gpu_schedul=
er *sched)
> > >   {
> > >       struct drm_sched_job *job, *next;
> > >
> > > -     /*
> > > -      * Don't destroy jobs while the timeout worker is running  OR t=
hread
> > > -      * is being parked and hence assumed to not touch pending_list
> > > -      */
> > > -     if ((sched->timeout !=3D MAX_SCHEDULE_TIMEOUT &&
> > > -         !cancel_delayed_work(&sched->work_tdr)) ||
> > > -         kthread_should_park())
> > > -             return NULL;
> > > -
> > >       spin_lock(&sched->job_list_lock);
> > >
> > >       job =3D list_first_entry_or_null(&sched->pending_list,
> > > @@ -693,17 +684,21 @@ drm_sched_get_cleanup_job(struct drm_gpu_schedu=
ler *sched)
> > >       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> > >               /* remove job from pending_list */
> > >               list_del_init(&job->list);
> > > +
> > > +             /* cancel this job's TO timer */
> > > +             cancel_delayed_work(&sched->work_tdr);
> > >               /* make the scheduled timestamp more accurate */
> > >               next =3D list_first_entry_or_null(&sched->pending_list,
> > >                                               typeof(*next), list);
> > > -             if (next)
> > > +
> > > +             if (next) {
> > >                       next->s_fence->scheduled.timestamp =3D
> > >                               job->s_fence->finished.timestamp;
> > > -
> > > +                     /* start TO timer for next job */
> > > +                     drm_sched_start_timeout(sched);
> > > +             }
> > >       } else {
> > >               job =3D NULL;
> > > -             /* queue timeout for next job */
> > > -             drm_sched_start_timeout(sched);
> > >       }
> > >
> > >       spin_unlock(&sched->job_list_lock);
> > > @@ -791,11 +786,8 @@ static int drm_sched_main(void *param)
> > >                                         (entity =3D drm_sched_select_=
entity(sched))) ||
> > >                                        kthread_should_stop());
> > >
> > > -             if (cleanup_job) {
> > > +             if (cleanup_job)
> > >                       sched->ops->free_job(cleanup_job);
> > > -                     /* queue timeout for next job */
> > > -                     drm_sched_start_timeout(sched);
> > > -             }
> > >
> > >               if (!entity)
> > >                       continue;
> >
