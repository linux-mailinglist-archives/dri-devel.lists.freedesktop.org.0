Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1566844B0DF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 17:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579E389D44;
	Tue,  9 Nov 2021 16:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5C489D44;
 Tue,  9 Nov 2021 16:12:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 133so16323360wme.0;
 Tue, 09 Nov 2021 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KYMC5u7/Ae62YrmoU00vw7hWLz92vSlo4JocNf0Htnk=;
 b=nBPUFUIkEZfaMn+igdxTihp13PWx4+RNd4h+Zukt1ZOJB1v8NvEfEXpM9VWB1BHdMc
 39Gra9xnwedrsx7ZatEaSmZqBhG0d+X3u05dWXaGsovf3xyr2lHytbDeCMUX5OLVDxdt
 BC5tB1T9lzHfSx7co8EG+RR3eDB3uAIoMlfP+pFVDaxeDgTgzQYRRrjjSkdmNuPm1TLh
 2o9Pzrg90Ht3HOXMeEncA0ouJDatgi5OjXLscI/RiUxYfGmndPBroYCOLzLHZLTW6VGD
 wqrBTdP27rYPkmOdW4l5qrzvQoTDLUb5Fcjtv9lX9t/7HpYLBt57wAV55U0sAxhM0CrY
 seaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KYMC5u7/Ae62YrmoU00vw7hWLz92vSlo4JocNf0Htnk=;
 b=Jcbx7xeu2ictka5aiOL8LxRA3pVwlTzRp2KbDqgpEMH6fKrS0/kLEuyGj/ohuKQlo5
 GVh6bxd6tSpnXeflipOn04P2M0C29xs56iDxqkw7rB6+w0gam8TGk8JR3Ly6QRWq28wp
 7uwm48khtwqs6nk57sR/LqNrY/0puG51kNjyCTZlhhsSLCPhv+2KOqPDFCY1AGk0MYkn
 MYIc2s9dyNbKUBw1scrddP5cIBT/AbZevQLJDrPVX8/dlDU8sAKXZk5Rn+5tAPQumi6A
 ZKvUPa9vXpN+TWCxf0J+CSTQyAI2x1BDv07ff20kcCTDs4pzGr4XWWOiqyY2OTOxZ+7T
 Yd5Q==
X-Gm-Message-State: AOAM531sMGoyoBxWTfLyFgeJcFm99NDR7XavGmrsPOYrppVPwm9/Nq+Q
 pB9LTtvx7ToEdupXXEfWWIvX2df7A3/heIuNtrU=
X-Google-Smtp-Source: ABdhPJw/Y/P6D270bcQtXGRElScfCFycpWcHhf5icFlUTilz5c5V5YdGuxruBoWhXTDchI0XC26rk+u/CCuBTtpTgOY=
X-Received: by 2002:a05:600c:1d01:: with SMTP id
 l1mr8629429wms.44.1636474323365; 
 Tue, 09 Nov 2021 08:12:03 -0800 (PST)
MIME-Version: 1.0
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
 <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
 <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAF6AEGsELL5WmxJKqyfF69OnVaK6+SnAREvjtFSHBZrm3Gdp7g@mail.gmail.com>
 <YYo6U6D2dxQ7Y6Gn@phenom.ffwll.local>
In-Reply-To: <YYo6U6D2dxQ7Y6Gn@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 9 Nov 2021 08:17:01 -0800
Message-ID: <CAF6AEGvGQP-6eNevDyS9sXg+6qOKMrG7h5rwhKO=v8L5mQOiUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Monk" <Monk.Liu@amd.com>, "Chen, Jingwen" <Jingwen.Chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 9, 2021 at 1:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Nov 08, 2021 at 03:39:17PM -0800, Rob Clark wrote:
> > I stumbled across this thread when I ran into the same issue, while
> > working out how to move drm/msm to use scheduler's retire +
> > timeout/recovery (and get rid of our own mirror list of in-flight
> > jobs).  We already have hw error detection enabled, and it can signal
> > quite fast, so assuming the first job on the list is the guilty job
> > just won't work.
> >
> > But I was considering a slightly different approach to fixing this,
> > instead just handling it all in drm_sched_main() and getting rid of
> > the complicated kthread parking gymnastics.  Ie. something along the
> > lines of:
>
> So handling timeouts in the main sched thread wont work as soon as you
> have multiple engines and reset that impacts across engines:
>
> - Nothing is simplified since you still need to stop the other scheduler
>   threads.
>
> - You get deadlocks if 2 schedulers time out at the same time, and both
>   want to stop the other one.
>
> Hence workqueue. Now the rule for the wq is that you can only have one pe=
r
> reset domain, so
> - single engine you just take the one drm/sched provides
> - if reset affects all your engines in the chip, then you allocate on in
>   the drm_device and pass that to all
> - if you have a complex of gpus all interconnected (e.g. xgmi hive for
>   amd), then it's one wq for the entire hive
>
> _All_ reset related things must be run on that workqueue or things breaks=
,
> which means if you get hw fault that also needs to be run there. I guess
> we should either patch drm/sched to check you call that function from the
> right workqueue, or just handle it internally.

Hmm, ok.. I guess it would be useful to better document the reasoning
for the current design, that would have steered me more towards the
approach taken in this patch.

BR,
-R

> -Daniel
>
> >
> > ---------------------
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 67382621b429..4d6ce775c316 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -764,6 +764,45 @@ static bool drm_sched_blocked(struct
> > drm_gpu_scheduler *sched)
> >         return false;
> >  }
> >
> > +static bool handle_timeout(struct drm_gpu_scheduler *sched)
> > +{
> > +       struct drm_sched_job *bad;
> > +
> > +       if (!sched->has_timeout)
> > +               return false;
> > +
> > +       sched->has_timeout =3D false;
> > +
> > +       spin_lock(&sched->job_list_lock);
> > +       bad =3D list_first_entry_or_null(&sched->pending_list,
> > +                                      struct drm_sched_job, list);
> > +
> > +       if (!bad) {
> > +               spin_unlock(&sched->job_list_lock);
> > +               return false;
> > +       }
> > +
> > +       spin_unlock(&sched->job_list_lock);
> > +
> > +       if (sched->timeout_wq =3D=3D system_wq) {
> > +               /*
> > +                * If driver has no specific requirements about seriali=
zing
> > +                * reset wrt. other engines, just call timedout_job() d=
irectly
> > +                */
> > +               sched->ops->timedout_job(job);
> > +       } else {
> > +               /*
> > +                * Otherwise queue it on timeout_wq and wait for it to =
complete
> > +                */
> > +               ... more typing needed here ...
> > +       }
> > +
> > +       if (sched->free_guilty) {
> > +               sched->ops->free_job(job);
> > +               sched->free_guilty =3D false;
> > +       }
> > +}
> > +
> >  /**
> >   * drm_sched_main - main scheduler thread
> >   *
> > @@ -787,6 +826,7 @@ static int drm_sched_main(void *param)
> >
> >                 wait_event_interruptible(sched->wake_up_worker,
> >                                          (cleanup_job =3D
> > drm_sched_get_cleanup_job(sched)) ||
> > +                                        handle_timeout(sched) ||
> >                                          (!drm_sched_blocked(sched) &&
> >                                           (entity =3D
> > drm_sched_select_entity(sched))) ||
> >                                          kthread_should_stop());
> > ---------------------
> >
> > drm_sched_fault() and the sw timeout handler would just set
> > sched->has_timeout and kick sched->wake_up_worker.
> >
> > And since we handle the timeout case after
> > drm_sched_get_cleanup_job(), we know that all of the successfully
> > completed jobs have already been popped off the list, and won't be
> > unfairly maligned.
> >
> > BR,
> > -R
> >
> > On Tue, Aug 31, 2021 at 6:29 PM Liu, Monk <Monk.Liu@amd.com> wrote:
> > >
> > > [AMD Official Use Only]
> > >
> > > Okay, I will reprepare this patch
> > >
> > > Thanks
> > >
> > > ------------------------------------------
> > > Monk Liu | Cloud-GPU Core team
> > > ------------------------------------------
> > >
> > > -----Original Message-----
> > > From: Daniel Vetter <daniel@ffwll.ch>
> > > Sent: Tuesday, August 31, 2021 9:02 PM
> > > To: Liu, Monk <Monk.Liu@amd.com>
> > > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; C=
hen, Jingwen <Jingwen.Chen@amd.com>
> > > Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and schedul=
er
> > >
> > > On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
> > > > Can we please have some actual commit message here, with detailed
> > > > explanation of the race/bug/whatever, how you fix it and why this i=
s
> > > > the best option?
> > > >
> > > > On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> > > > > tested-by: jingwen chen <jingwen.chen@amd.com>
> > > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > > > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > > > > ---
> > > > >  drivers/gpu/drm/scheduler/sched_main.c | 24
> > > > > ++++--------------------
> > > > >  1 file changed, 4 insertions(+), 20 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index ecf8140..894fdb24 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct w=
ork_struct *work)
> > > > >     sched =3D container_of(work, struct drm_gpu_scheduler,
> > > > > work_tdr.work);
> > > > >
> > > > >     /* Protects against concurrent deletion in
> > > > > drm_sched_get_cleanup_job */
> > > > > +   if (!__kthread_should_park(sched->thread))
> > > >
> > > > This is a __ function, i.e. considered internal, and it's lockless
> > > > atomic, i.e. unordered. And you're not explaining why this works.
> > > >
> > > > Iow it's probably buggy, and an just unconditionally parking the
> > > > kthread is probably the right thing to do. If it's not the right th=
ing
> > > > to do, there's a bug here for sure.
> > >
> > > Also why don't we reuse the function drivers already have to stop a s=
cheduler thread? We seem to have two kthread_park now, that's probably one =
too much.
> > > -Daniel
> > >
> > > > > +           kthread_park(sched->thread);
> > > > > +
> > > > >     spin_lock(&sched->job_list_lock);
> > > > >     job =3D list_first_entry_or_null(&sched->pending_list,
> > > > >                                    struct drm_sched_job, list);
> > > > >
> > > > >     if (job) {
> > > > > -           /*
> > > > > -            * Remove the bad job so it cannot be freed by concur=
rent
> > > > > -            * drm_sched_cleanup_jobs. It will be reinserted back=
 after sched->thread
> > > > > -            * is parked at which point it's safe.
> > > > > -            */
> > > > > -           list_del_init(&job->list);
> > > > >             spin_unlock(&sched->job_list_lock);
> > > > >
> > > > > +           /* vendor's timeout_job should call drm_sched_start()=
 */
> > > > >             status =3D job->sched->ops->timedout_job(job);
> > > > >
> > > > >             /*
> > > > > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler=
 *sched, struct drm_sched_job *bad)
> > > > >     kthread_park(sched->thread);
> > > > >
> > > > >     /*
> > > > > -    * Reinsert back the bad job here - now it's safe as
> > > > > -    * drm_sched_get_cleanup_job cannot race against us and relea=
se the
> > > > > -    * bad job at this point - we parked (waited for) any in prog=
ress
> > > > > -    * (earlier) cleanups and drm_sched_get_cleanup_job will not =
be called
> > > > > -    * now until the scheduler thread is unparked.
> > > > > -    */
> > > > > -   if (bad && bad->sched =3D=3D sched)
> > > > > -           /*
> > > > > -            * Add at the head of the queue to reflect it was the=
 earliest
> > > > > -            * job extracted.
> > > > > -            */
> > > > > -           list_add(&bad->list, &sched->pending_list);
> > > > > -
> > > > > -   /*
> > > > >      * Iterate the job list from later to  earlier one and either=
 deactive
> > > > >      * their HW callbacks or remove them from pending list if the=
y already
> > > > >      * signaled.
> > > > > --
> > > > > 2.7.4
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
blog.
> > > > ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4=
fbf76
> > > > b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376601=
170
> > > > 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiL
> > > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%=
2BJLg
> > > > KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=3D0
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fbl=
og.ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76=
b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660117051194=
614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%2BJLgKeKbGaMMGqeGI=
9KE0P0LXlN4%3D&amp;reserved=3D0
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
