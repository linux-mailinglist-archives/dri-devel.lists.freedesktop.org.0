Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5F54DCFE6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 22:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC3310E798;
	Thu, 17 Mar 2022 21:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DF110E107;
 Thu, 17 Mar 2022 21:07:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id h16so3263221wmd.0;
 Thu, 17 Mar 2022 14:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2ti8g/ld+9idqGBypq+3jGDET4QNV1EIOi7rZI8SYg=;
 b=pUelORlA+hm0f6QAqGhfMd+zAAK4W9I/TgVm7PB9Md7nIvrbt3PcHoNvZUCXiD/Of4
 IzZGDAe8mOXsZrX/H4Ga4rd05sI1XXryJZUIDZYZTf+M2lQLEABbwXjwzlGwb888J744
 WwFMOQt6RN/TSkhfA+C8zoeBPLM4s7U9WynBrp5kSeKfvZ1Xnt/ktBSn0BZM4sd9u/Tg
 YdBOTPRMNsbe5tBoAk3Pru5qV1EGo10C5my5vr/baLjU21gOA1FBLyIJDxnAL4bn+HD6
 7ZQfrMOc8YGRPXnb7Wb8xm2H61WjsJ/uxsEtJZfUUzm7UgdqHS6r6a0Z+cXVZ89njTiU
 Itvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2ti8g/ld+9idqGBypq+3jGDET4QNV1EIOi7rZI8SYg=;
 b=b8uZLIyQvlGi4Z7D4vfC/5UxPV3wtQuCiVKXPOKHSEbhsP+9l0X5+YtoDd6M6tJeGj
 vml+pGaAzbWmZenw6Xr1HdqNooRcb+OnE7CtrE4sX0wn0PvTTtVtnmf3LWtVyvotOtvm
 g0YIHCzXuaDzLtk3dTnS3KIkL5aRIBPfFpbS4FCC0qlxbmBD+HmwFx9lKKluLnOHbZZr
 lfLkR2IM6S7wEnJKm/f8Fxzabe1WJTLoZLsS1YKkJbjl/Nh+DXZG+7QVSb4DNY/S9xmB
 3w+c7gfsyxrRRHybTjRH9Xj80ZAPsBx+orjPG4LdJPyTZKVY+0rDLvOM2Px+Hh39OjpY
 h+Lg==
X-Gm-Message-State: AOAM5339QaAmGHvrzJwgxvE5c4ihwLQ1nVW5IuY53Y7SIOUm0xNjBYGl
 reW6V7BaCScAQ0TAZmrYlVtGd/K9jOQGZs4d3MM=
X-Google-Smtp-Source: ABdhPJxOIk1wL4Vo+j9cGqh9IoH3jz1NeAYIk35hsGWG/uAcKPsisCn2g9s4mStQ0P3jsnqMJhiPuaRMurP+IHPAqi8=
X-Received: by 2002:a05:600c:600a:b0:38c:6c9e:f9c7 with SMTP id
 az10-20020a05600c600a00b0038c6c9ef9c7mr9210334wmb.26.1647551224066; Thu, 17
 Mar 2022 14:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-4-robdclark@gmail.com>
 <3b066b63-c180-09c6-e39f-b408464b5bc1@quicinc.com>
In-Reply-To: <3b066b63-c180-09c6-e39f-b408464b5bc1@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Mar 2022 14:07:45 -0700
Message-ID: <CAF6AEGvF7rJ2iK+roGTA1BEthwCLMguMHrG-45dyxfk=b-acug@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/gpu: Remove mutex from wait_event
 condition
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
 freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 1:45 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 3/11/2022 5:16 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The mutex wasn't really protecting anything before.  Before the previous
> > patch we could still be racing with the scheduler's kthread, as that is
> > not necessarily frozen yet.  Now that we've parked the sched threads,
> > the only race is with jobs retiring, and that is harmless, ie.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +----------
> >   1 file changed, 1 insertion(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index 0440a98988fc..661dfa7681fb 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -607,15 +607,6 @@ static int adreno_runtime_resume(struct device *dev)
> >       return gpu->funcs->pm_resume(gpu);
> >   }
> >
> > -static int active_submits(struct msm_gpu *gpu)
> > -{
> > -     int active_submits;
> > -     mutex_lock(&gpu->active_lock);
> > -     active_submits = gpu->active_submits;
> > -     mutex_unlock(&gpu->active_lock);
> I assumed that this lock here was to ensure proper barriers while
> reading active_submits. Is that not required?

There is a spinlock in prepare_to_wait_event() ahead of checking the
condition, which AFAIU is a sufficient barrier

BR,
-R

>
> -Akhil.
> > -     return active_submits;
> > -}
> > -
> >   static int adreno_runtime_suspend(struct device *dev)
> >   {
> >       struct msm_gpu *gpu = dev_to_gpu(dev);
> > @@ -669,7 +660,7 @@ static int adreno_system_suspend(struct device *dev)
> >       suspend_scheduler(gpu);
> >
> >       remaining = wait_event_timeout(gpu->retire_event,
> > -                                    active_submits(gpu) == 0,
> > +                                    gpu->active_submits == 0,
> >                                      msecs_to_jiffies(1000));
> >       if (remaining == 0) {
> >               dev_err(dev, "Timeout waiting for GPU to suspend\n");
>
