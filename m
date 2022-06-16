Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A0F54E2DD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E1A112DD8;
	Thu, 16 Jun 2022 14:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C3311297F;
 Thu, 16 Jun 2022 14:04:10 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so933378wml.2; 
 Thu, 16 Jun 2022 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slC185Ob3bqwRbXUouHuTugpdNeQm0iZ+NbyQh6gPTc=;
 b=BjTvft9fFPRIzJq1i2BdE+Ngl7Lnwas+O5i3jS01WgAIwobhoFJwDsfz+t5rUAkEK4
 8PvZYeBrFNhXVIDPC6oRttEjtOFIF2qSVsdcZAy4lwLb4ZKPfIq6ZgJxN4cDzvfoxrhv
 Eli6czrFILNMmzqSWwheVkrEoq6D72f2Af1wSzkHCtFlioENSWN+0/qWT9V8W8VqDy3J
 TJP8DLFHr/P0/nqeZeDXo96GEgnIreXeODLg8xijl/1UrXE8Hou0JQguVP/wB2gYxJNI
 tHPxOb3tuGJQmQEVDdkSXrJubExIU7an2AMNUFCEXQ2HgaMSv6w/7A+7+ppDssY3r/fU
 HMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slC185Ob3bqwRbXUouHuTugpdNeQm0iZ+NbyQh6gPTc=;
 b=UdehHUbBV08Z3X8szuto+KDDYc7tu5ODAxBNGDFjYyi32aptxkdjqQtKpoQWpmkxPl
 bfNiHe0gayjLF15Yu95YtvJ64cNhlw1Y120UARwAM/Cm2S8rQLeZjdK7RZYlWw5HJOwS
 Bxe2ilmmPDDOrFkjBEf14E8X1gVtLtBp3xH8/lVrTVugqa5rp5P4tRvE7fXBf8zmHwu0
 st2uoc2iRy92z4Bzfyjt12mzsGfWlX9ce5ssIRC0lqEDN5/EdfNeJBHEiTM0zBiR3pwC
 upgnGbOCz7GfXpY30rWutdbtOWunduIPeWMbSg0AzpfCXUtLtZJ9z0WVfo85yBABaZ1i
 FZBg==
X-Gm-Message-State: AJIora9Of/XMMYmzXcPEqh7Pu51mG4kLnT2do5VBjoZ1hfDssSiaT5Ki
 s9Bs1Ovo8P4WWMM+FNQofDLABiT+F89in9Sm3tc=
X-Google-Smtp-Source: AGRyM1vS5uY/KayIVVnAafrvhMLqkQv0X/+RZJiaVU0H2MFh34eE7xgk+0K7uZmYowMiafmu//6OgSqoUg5erP+u2uY=
X-Received: by 2002:a05:600c:4f96:b0:39c:951e:66b7 with SMTP id
 n22-20020a05600c4f9600b0039c951e66b7mr5296884wmq.84.1655388249063; Thu, 16
 Jun 2022 07:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220615162435.3011793-1-robdclark@gmail.com>
 <991331d8-ddda-a816-d279-fdaed90b43c1@linaro.org>
In-Reply-To: <991331d8-ddda-a816-d279-fdaed90b43c1@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Jun 2022 07:04:14 -0700
Message-ID: <CAF6AEGvqoOOcNTrBEFxnROY-M8PazbaZb4zDw4gJFLC7jCR8CA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix fence rollover issue
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 1:27 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 15/06/2022 19:24, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > And while we are at it, let's start the fence counter close to the
> > rollover point so that if issues slip in, they are more obvious.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Should it also have
>
> Fixes: fde5de6cb461 ("drm/msm: move fence code to it's own file")
>
> Or maybe
>
> Fixes: 5f3aee4ceb5b ("drm/msm: Handle fence rollover")

arguably it fixes the first commit that added GPU support (and
finishes up a couple spots that the above commit missed)

I guess I could use the fixes tag just to indicate how far back it
would be reasonable to backport to stable branches.

> Otherwise:
>
> Reviewed: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> > ---
> >   drivers/gpu/drm/msm/msm_fence.c | 13 +++++++++++--
> >   1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> > index 3df255402a33..a35a6746c7cd 100644
> > --- a/drivers/gpu/drm/msm/msm_fence.c
> > +++ b/drivers/gpu/drm/msm/msm_fence.c
> > @@ -28,6 +28,14 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
> >       fctx->fenceptr = fenceptr;
> >       spin_lock_init(&fctx->spinlock);
> >
> > +     /*
> > +      * Start out close to the 32b fence rollover point, so we can
> > +      * catch bugs with fence comparisons.
> > +      */
> > +     fctx->last_fence = 0xffffff00;
> > +     fctx->completed_fence = fctx->last_fence;
> > +     *fctx->fenceptr = fctx->last_fence;
>
> This looks like a debugging hack. But probably it's fine to have it, as
> it wouldn't cause any side effects.

I was originally going to add a modparam or kconfig to enable this..
but then thought, if there is a bug and thing are to go wrong, it's
best for that to happen ASAP rather than after 200-400 days of
uptime.. the latter case can be rather hard to reproduce bugs ;-)

IIRC the kernel does something similar with jiffies to ensure the
rollover point is hit quickly

BR,
-R

> > +
> >       return fctx;
> >   }
> >
> > @@ -46,11 +54,12 @@ bool msm_fence_completed(struct msm_fence_context *fctx, uint32_t fence)
> >               (int32_t)(*fctx->fenceptr - fence) >= 0;
> >   }
> >
> > -/* called from workqueue */
> > +/* called from irq handler */
> >   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
> >   {
> >       spin_lock(&fctx->spinlock);
> > -     fctx->completed_fence = max(fence, fctx->completed_fence);
> > +     if (fence_after(fence, fctx->completed_fence))
> > +             fctx->completed_fence = fence;
> >       spin_unlock(&fctx->spinlock);
> >   }
> >
>
>
> --
> With best wishes
> Dmitry
