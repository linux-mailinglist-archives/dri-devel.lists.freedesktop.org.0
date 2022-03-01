Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D31604C9976
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2103C10E8B0;
	Tue,  1 Mar 2022 23:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688310E8B0
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 23:42:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id v22so24014869ljh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 15:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Je0uRp8727h1TTc3B25vlET4KVfYQCUUi3qPq6QSu/E=;
 b=Mxd3Ju/57STaqFSUcoUHdzkEQamJj8Rs9AVQLfo4UBtN/aEjfV5IoqwLoG8ytsuQJ7
 ir6gM8ycAelCJxTtCKwvyT1dvQxjxijkrqBZPqwyeTS4xaIsln9MhNWrmrkwjW0Txkdf
 UL/AX2mAZIYA5MmxmQmswds1EnKDAxrGAdipYhdFBagPN0kW6vjwwKfYBs9DVjLIohC2
 9sHxfWJE/ZOZe1wibzi0vN6RWPVJY0XBw7AkeB3ccqsGVX932JcE/cMN7XJ+faOwqFpQ
 MERaNl5eAk+8sExq1oTLy7dPZ7+rnAv7QIHCFoKwmw3LR/WJuzf7oFkWUYIaAW0Yf62T
 fNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Je0uRp8727h1TTc3B25vlET4KVfYQCUUi3qPq6QSu/E=;
 b=EggagLuG4c/8NCGtFeWlE0o20/M467qacFHjX8MRn/hPuH9nvvuwXJhHjkbVkDXDNY
 F6wS6TrzVjZSkaYVOKuVRSA4qVflr33f1Nkqqj4BT4kKChq/brHBRA5GR3nsIw7Q4cj1
 RaELX98a6fIhXnw/AOtqzSC989ogpHWbs0AP28cYXr+ir8BpbrrdP8gZUepBkqqMTwce
 Hm7GzJ7OApHI5OTjMLgm1RmSVQY+PVm4RuDHOWlBhaOI5ZlTvsiSC3KA7wW/u/NuuVcq
 s/e5INU7ZxhZ6ElAo/N5R9Mgysnxads0IfNlxTH/oFEMeIuEE/PJ4dVo4WCWo1gMVW16
 Dxpg==
X-Gm-Message-State: AOAM531FXTQynAqfim9I9nxGGsBUOM3DurQHvEWiO4krBh35Rq61lkl7
 4dgfV4N7gat5hhCKXfnQod+zv72/2WVzrGsE2Kc=
X-Google-Smtp-Source: ABdhPJyJlHbLYJEDb5Mbb7KgoOho3fUrxx1XNMxfJ/LarHcHy/dmpkhdkY1BYbV68w08GOXobHGfpV1ksL2ZmaL3tAA=
X-Received: by 2002:a05:651c:124d:b0:246:1a54:cc17 with SMTP id
 h13-20020a05651c124d00b002461a54cc17mr19022784ljh.301.1646178119102; Tue, 01
 Mar 2022 15:41:59 -0800 (PST)
MIME-Version: 1.0
References: <20220228181647.3794298-1-mwen@igalia.com>
 <9e288f3c-3251-f017-3541-d01ae6afe499@amd.com>
In-Reply-To: <9e288f3c-3251-f017-3541-d01ae6afe499@amd.com>
From: Melissa Wen <melissa.srw@gmail.com>
Date: Tue, 1 Mar 2022 22:41:47 -0100
Message-ID: <CAJeY4oE82RUc2mit-1Mnfr50pG4mGBqgnPQMGiHDAnsXXNSQDw@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: centralize error handling when init scheduler
 fails
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Jiawei.Gu@amd.com, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Christian Konig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 8:21 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Acked-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>
> Andrey
Thanks. Applied to drm-misc-next.

Melissa
>
> On 2022-02-28 13:16, Melissa Wen wrote:
> > Remove redundant error message (since now it is very similar to what
> > we do in drm_sched_init) and centralize all error handling in a
> > unique place, as we follow the same steps in any case of failure.
> >
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   drivers/gpu/drm/v3d/v3d_sched.c | 40 +++++++++++----------------------
> >   1 file changed, 13 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 39459ae96f30..06238e6d7f5c 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -392,34 +392,24 @@ v3d_sched_init(struct v3d_dev *v3d)
> >                            hw_jobs_limit, job_hang_limit,
> >                            msecs_to_jiffies(hang_limit_ms), NULL,
> >                            NULL, "v3d_bin", v3d->drm.dev);
> > -     if (ret) {
> > -             dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> >                            &v3d_render_sched_ops,
> >                            hw_jobs_limit, job_hang_limit,
> >                            msecs_to_jiffies(hang_limit_ms), NULL,
> >                            NULL, "v3d_render", v3d->drm.dev);
> > -     if (ret) {
> > -             dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
> > -                     ret);
> > -             v3d_sched_fini(v3d);
> > -             return ret;
> > -     }
> > +     if (ret)
> > +             goto fail;
> >
> >       ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
> >                            &v3d_tfu_sched_ops,
> >                            hw_jobs_limit, job_hang_limit,
> >                            msecs_to_jiffies(hang_limit_ms), NULL,
> >                            NULL, "v3d_tfu", v3d->drm.dev);
> > -     if (ret) {
> > -             dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
> > -                     ret);
> > -             v3d_sched_fini(v3d);
> > -             return ret;
> > -     }
> > +     if (ret)
> > +             goto fail;
> >
> >       if (v3d_has_csd(v3d)) {
> >               ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > @@ -427,27 +417,23 @@ v3d_sched_init(struct v3d_dev *v3d)
> >                                    hw_jobs_limit, job_hang_limit,
> >                                    msecs_to_jiffies(hang_limit_ms), NULL,
> >                                    NULL, "v3d_csd", v3d->drm.dev);
> > -             if (ret) {
> > -                     dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
> > -                             ret);
> > -                     v3d_sched_fini(v3d);
> > -                     return ret;
> > -             }
> > +             if (ret)
> > +                     goto fail;
> >
> >               ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> >                                    &v3d_cache_clean_sched_ops,
> >                                    hw_jobs_limit, job_hang_limit,
> >                                    msecs_to_jiffies(hang_limit_ms), NULL,
> >                                    NULL, "v3d_cache_clean", v3d->drm.dev);
> > -             if (ret) {
> > -                     dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
> > -                             ret);
> > -                     v3d_sched_fini(v3d);
> > -                     return ret;
> > -             }
> > +             if (ret)
> > +                     goto fail;
> >       }
> >
> >       return 0;
> > +
> > +fail:
> > +     v3d_sched_fini(v3d);
> > +     return ret;
> >   }
> >
> >   void
