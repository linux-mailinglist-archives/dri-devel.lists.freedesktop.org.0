Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6754C178D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 16:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D4110E6C9;
	Wed, 23 Feb 2022 15:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C450710E6B1;
 Wed, 23 Feb 2022 15:46:03 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x15so5927142wrg.8;
 Wed, 23 Feb 2022 07:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iSfHBOu4v5+uNUdMQr8U/N7yggvNFIAnsnuq86CDDN8=;
 b=fbSjZORrBhhHrOCnk7S6YM3Zgzp9jGKaOTrH8ZsFi5jfiwjUcFu0MuHrtjOPxu+gs7
 Y+mCisYdpElaLEUtLaAjsRd7peyj017FJk05vLUo8er05hHuNjVK1YKynFp4YRqwEUuR
 1fmvddyZjGTXvLzE0MGil9SQG/CYtr6b34brfpE+xAS5Vwuu17htp9yTLmD/crR2nLSM
 IiB8DsDCctlx0FzteoDu8FzHbhR7cAmK0HOEG11kRS10z8F/wzxEqlWWhHxFZeUQnvn1
 gDqTQ5DoJrtjLe94YeNpNhK+uTWC+VEdRrgNYVMGcP7vWXQz1SOtOZjVtGDTKJXn/C7Y
 O3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSfHBOu4v5+uNUdMQr8U/N7yggvNFIAnsnuq86CDDN8=;
 b=N2VW0Jginpy9FXi6P9PZX1ptZ0tVrYX3hkMoJm0uTknC+WfKuYItCkU0Hrb6qXx1Xa
 6HnalQsGRCykICi+7YbRWtgZ+V+Dd0El6E0UoCfkQ3I1A+/jGhIJsDiaNwWSnQstH1eQ
 mZtTZqg5k4xPF+KiEmRa6OsWhg9cA+QbTLs+P8EpMnhtM0XLqcFWaK/Sfqhm6X1I6nNp
 LZ1rqPtOcjdicaUhwtWVPa0vATqMvJbCpgp3kGTBgo11LugHuDUMpSssw152YPKxCITr
 5Bg1b2TDm6RRqsjcp+ZpYvBMaO8E5cSMyolzcdzo+oVUhiuZhI/BltMj+MUM5yNUVAO3
 MP5A==
X-Gm-Message-State: AOAM5335BQLvaLdfTGKshhlSvzMZTutw0z5UxrF9ufRTAjXScVDlw5rt
 pWSGTGuzQTd+4Pn9Lbb2SYHbDoNHaymZEHo8B98=
X-Google-Smtp-Source: ABdhPJyosEjfWY4mjWeCmJhqIR2Tgf0/QybyKJGd2Qa9zYQaZY/M3wuO912/5weuamaNpFuLr3U9YbFz3d8lNVyzudc=
X-Received: by 2002:a05:6000:1a8b:b0:1ea:bc4:e52e with SMTP id
 f11-20020a0560001a8b00b001ea0bc4e52emr176951wry.574.1645631162104; Wed, 23
 Feb 2022 07:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20220219183310.557435-1-robdclark@gmail.com>
 <6f1225ea-d889-9cf8-3a3d-181e319bd453@linaro.org>
In-Reply-To: <6f1225ea-d889-9cf8-3a3d-181e319bd453@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 23 Feb 2022 07:46:21 -0800
Message-ID: <CAF6AEGut-75ri+U=B2eBtNeYQu5ECKPmk51b2_pCgu91uKy1ow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Fix crash on devices without devfreq support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Anders Roxell <anders.roxell@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 7:11 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 19/02/2022 21:33, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Avoid going down devfreq paths on devices where devfreq is not
> > initialized.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Reported-by: Anders Roxell <anders.roxell@linaro.org>
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++------
> >   1 file changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index 9bf319be11f6..26a3669a97b3 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -83,12 +83,17 @@ static struct devfreq_dev_profile msm_devfreq_profile = {
> >   static void msm_devfreq_boost_work(struct kthread_work *work);
> >   static void msm_devfreq_idle_work(struct kthread_work *work);
> >
> > +static bool has_devfreq(struct msm_gpu *gpu)
> > +{
> > +     return !!gpu->funcs->gpu_busy;
>
> I see that devfreq init will be skipped if gpu_busy is NULL.
> Can we use gpu->devfreq instead of this condition?

We could, but then we couldn't also use the same has_devfreq() helper
in msm_devfreq_init().  I thought it was clearer to use the same
helper everywhere.

> I noticed that you have replaced some of gpu->devfreq checks with
> has_devreq() calls. Is there any difference?

It amounts to the same thing because if you don't have gpu_busy, then
devfreq is never initialized.  I just thought it clearer to use the
same check in all places.

BR,
-R

> > +}
> > +
> >   void msm_devfreq_init(struct msm_gpu *gpu)
> >   {
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> >       /* We need target support to do devfreq */
> > -     if (!gpu->funcs->gpu_busy)
> > +     if (!has_devfreq(gpu))
> >               return;
> >
> >       dev_pm_qos_add_request(&gpu->pdev->dev, &df->idle_freq,
> > @@ -149,6 +154,9 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
> >   {
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > +     if (!has_devfreq(gpu))
> > +             return;
> > +
> >       devfreq_cooling_unregister(gpu->cooling);
> >       dev_pm_qos_remove_request(&df->boost_freq);
> >       dev_pm_qos_remove_request(&df->idle_freq);
> > @@ -156,16 +164,24 @@ void msm_devfreq_cleanup(struct msm_gpu *gpu)
> >
> >   void msm_devfreq_resume(struct msm_gpu *gpu)
> >   {
> > -     gpu->devfreq.busy_cycles = 0;
> > -     gpu->devfreq.time = ktime_get();
> > +     struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > -     devfreq_resume_device(gpu->devfreq.devfreq);
> > +     if (!has_devfreq(gpu))
> > +             return;
> > +
> > +     df->busy_cycles = 0;
> > +     df->time = ktime_get();
> > +
> > +     devfreq_resume_device(df->devfreq);
> >   }
> >
> >   void msm_devfreq_suspend(struct msm_gpu *gpu)
> >   {
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > +     if (!has_devfreq(gpu))
> > +             return;
> > +
> >       devfreq_suspend_device(df->devfreq);
> >
> >       cancel_idle_work(df);
> > @@ -185,6 +201,9 @@ void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >       uint64_t freq;
> >
> > +     if (!has_devfreq(gpu))
> > +             return;
> > +
> >       freq = get_freq(gpu);
> >       freq *= factor;
> >
> > @@ -207,7 +226,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
> >       struct devfreq_dev_status status;
> >       unsigned int idle_time;
> >
> > -     if (!df->devfreq)
> > +     if (!has_devfreq(gpu))
> >               return;
> >
> >       /*
> > @@ -253,7 +272,7 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
> >   {
> >       struct msm_gpu_devfreq *df = &gpu->devfreq;
> >
> > -     if (!df->devfreq)
> > +     if (!has_devfreq(gpu))
> >               return;
> >
> >       msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>
>
> --
> With best wishes
> Dmitry
