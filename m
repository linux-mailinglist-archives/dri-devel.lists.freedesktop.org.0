Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0B3E2ECB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 19:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D7C6EBFD;
	Fri,  6 Aug 2021 17:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F68F6EBFD;
 Fri,  6 Aug 2021 17:15:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso9447747wms.5; 
 Fri, 06 Aug 2021 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dCyOt6fuT3vKd9OQ1cGqS4mQb18lfymYBVtFVf7jJ4A=;
 b=R6XSn0FGIQXxHlZfbPMYFAIp3qZvGqnz2uO6DnOgH+NSLPgZn2dPgU3bfi7x97DrIz
 lcCC+kYvlOo1JatvHjnXcNT+4JWqgIXUOIr8ktUaJpizb+C8bzbqy1QQ0wyeqH9qVqcP
 80UkcftiPH6W9Ic1FaFPxCcY6CprePe1b+MMMtZEjPsh8QX3cri8U78Mb1Ki3ViN8zUI
 q9FZ2oj7kg7k4G0V15nCS3yHxhxJ5hlqUokLVum+6W2V08cAc66ovuRWcEnY6Ii0BteU
 BQRo17h+cVFy/oD/iBy8x0mPSkXVB77H4gqlxHrw7aZIZ0y0MMC1fue0nZT9W6x7en2L
 Qp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dCyOt6fuT3vKd9OQ1cGqS4mQb18lfymYBVtFVf7jJ4A=;
 b=Hlim5QyW4mkfT67iVJ7Q/vSpWDAx6HTeGZB9w9oPY+f9rhP2WsLWprPWZ4KGQrNvIM
 IaEf82QB4kC9D8tN51oP7ZkjD31ggwTxlFA9g+jTpcsIWMDknOb8xRxr6y6lkwmtrRhr
 hv37gITM4V6E7ZRX67MXbS8CFAEc31h5jDfOE/Ex7GvxJhPQsWquwoEewcsZ5JfNleQ4
 Z0jvgmCG5EBtgVXmQzRb2TKi4JWeOcz2hw5+O0WXr7q1NWPSI2hcBOgNVDKuPz5ME4iL
 9m7nvbjS+taL0P8fD9wQoOrJ53YgHRNBkOt/lHO8S6nObyMKOvZRv0H/ZW0+XfMwB8GZ
 bvXg==
X-Gm-Message-State: AOAM530JXtgrwDH53B0d5acO7zMlfZkkoWS7DPDkNKcO6Dxne0ThF138
 L80UcbK/I8mxhZWKpxJTDijnCTUKfHje8Uc4cqU=
X-Google-Smtp-Source: ABdhPJyBrw5+F57Z9us0v2G5eQXZ3/7VCwgnovKyD3o89ran+2+rJTbzcYRU+451NTlUEvVs/nhtDxk1Orc3hl6E2vw=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr22080784wma.49.1628270139083; 
 Fri, 06 Aug 2021 10:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-3-daniel.vetter@ffwll.ch>
 <CAF6AEGvkmZhcPWP58VnL1OXAeJ5tg7v13xkkiYBwkpBi1YiT4g@mail.gmail.com>
 <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com>
In-Reply-To: <CAKMK7uG3gRNfYinM51UVAUckV9ZgN3mgRnJd8E9tERani9b1JQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 6 Aug 2021 10:19:54 -0700
Message-ID: <CAF6AEGuqxb5jEtpQi-aNvjSfPaq0gasH2TLZ+5O836ov9qw+3w@mail.gmail.com>
Subject: Re: [PATCH v5 02/20] drm/msm: Fix drm/sched point of no return rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
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

On Fri, Aug 6, 2021 at 9:42 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote=
:
>
> On Fri, Aug 6, 2021 at 12:58 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
> > >
> > > Originally drm_sched_job_init was the point of no return, after which
> > > drivers must submit a job. I've split that up, which allows us to fix
> > > this issue pretty easily.
> > >
> > > Only thing we have to take care of is to not skip to error paths afte=
r
> > > that. Other drivers do this the same for out-fence and similar things=
.
> > >
> > > Fixes: 1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: freedreno@lists.freedesktop.org
> > > Cc: linux-media@vger.kernel.org
> > > Cc: linaro-mm-sig@lists.linaro.org
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++--------
> > >  1 file changed, 7 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/m=
sm/msm_gem_submit.c
> > > index 6d6c44f0e1f3..d0ed4ddc509e 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -52,9 +52,6 @@ static struct msm_gem_submit *submit_create(struct =
drm_device *dev,
> > >                 return ERR_PTR(ret);
> > >         }
> > >
> > > -       /* FIXME: this is way too early */
> > > -       drm_sched_job_arm(&job->base);
> > > -
> > >         xa_init_flags(&submit->deps, XA_FLAGS_ALLOC);
> > >
> > >         kref_init(&submit->ref);
> > > @@ -883,6 +880,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, =
void *data,
> > >
> > >         submit->user_fence =3D dma_fence_get(&submit->base.s_fence->f=
inished);
> > >
> > > +       /* point of no return, we _have_ to submit no matter what */
> > > +       drm_sched_job_arm(&submit->base);
> > > +
> > >         /*
> > >          * Allocate an id which can be used by WAIT_FENCE ioctl to ma=
p back
> > >          * to the underlying fence.
> > > @@ -892,17 +892,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev=
, void *data,
> > >         if (submit->fence_id < 0) {
> > >                 ret =3D submit->fence_id =3D 0;
> > >                 submit->fence_id =3D 0;
> > > -               goto out;
> > >         }
> > >
> > > -       if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > > +       if (ret =3D=3D 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
> > >                 struct sync_file *sync_file =3D sync_file_create(subm=
it->user_fence);
> > >                 if (!sync_file) {
> > >                         ret =3D -ENOMEM;
> > > -                       goto out;
> > > +               } else {
> > > +                       fd_install(out_fence_fd, sync_file->file);
> > > +                       args->fence_fd =3D out_fence_fd;
> > >                 }
> > > -               fd_install(out_fence_fd, sync_file->file);
> > > -               args->fence_fd =3D out_fence_fd;
> >
> > I wonder if instead we should (approximately) undo "drm/msm/submit:
> > Simplify out-fence-fd handling" so that the point that it could fail
> > is moved up ahead of the drm_sched_job_arm()?
>
> Hm yeah. Up to you how you want to paint this shed, I think either is fin=
e.
>
> > Also, does the dma_fence_get() work before drm_sched_job_arm()?  From
> > a quick look, it looks like it won't, but I'm still playing catchup
> > and haven't had a chance to look at your entire series.  If it doesn't
> > work before drm_sched_job_arm(), then there is really no way to
> > prevent a error path between the fence-init and job-submit.
>
> Yes. I thought I've checked that I put the _arm() in the right spot,
> but I guess I screwed up and you need the fence before the point where
> I've put the job_arm()? And yes the error path cannot be avoided for
> out-fences, that's what I tried to explain in the commit message.
>
> > But, prior to your series, wouldn't a failure after
> > drm_sched_job_init() but before the job is submitted just burn a
> > fence-id, and otherwise carry on it's merry way?
>
> Maybe? I'm not sure whether the scheduler gets confused about the gap
> and freak out abou that. I'm fairly new to that code and learning
> (which is part why I'm working on it). Since you look up in
> fences/syncobj after job_init() it should be pretty easy to whip up a
> testcase and see what happens. Also as long as nothing fails you won't
> see an issue, that's for sure.

fair.. I'll try to come up with a test case.. pre-scheduler-conversion
it wasn't a problem to fail after the fence seqno was allocated (well,
I guess you might have problems if you had 2^31 failures in a row)

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
> > >         }
> > >
> > >         submit_attach_object_fences(submit);
> > > --
> > > 2.32.0
> > >
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
