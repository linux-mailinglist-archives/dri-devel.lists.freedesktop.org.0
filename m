Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C328BB8D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 17:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C5F6E4B6;
	Mon, 12 Oct 2020 15:07:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7489E6E4A1;
 Mon, 12 Oct 2020 15:07:51 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t9so19573348wrq.11;
 Mon, 12 Oct 2020 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N63w/hby23Xo2ev/1aEpCrQGDov9SsqcHUiTP2skbiI=;
 b=gbXCeP8b5TF9IDNUV4TODyi0GqMmcmmkbw9MLIQ9qDq52DVtZUZ63yoTWGXllZh1jN
 SkcFCJX1FdeMdwC9XoXvKfl9/+hVW+JY1aveRK30r8h5c06Tj1RWFA0NGY2XVc/5hIOn
 ygTf/XAGuVAfeRT0ic71adgRKeojqB/daFJ9bf7f/Gz4x+X1+9dYdGYmRPOX/fpHxNH5
 3Vi7i8APFHQc/GOt8/Mt5/LLgeEKSClOzmQ2b099rU8d/zmdckwl/Dv4dmsF2SOCr1Hp
 a0XL/l8t0i+76OwTX/3BZUK5DxX3fMBPPrar4I6mMDiKrpPSyUkipy3ieVcxI8bGLPnB
 v+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N63w/hby23Xo2ev/1aEpCrQGDov9SsqcHUiTP2skbiI=;
 b=d5fb3eYrwOlNJgpAe5eB3UXqmYSUuRAgcQswlz8sdPU+RyfUis3Pq8AbjFGedYMnO/
 sAIStdKq5i5RdopnJk/1T82UqflYPRt8MCf4O/aC0EZ/K74TJmgMYB0i5fBIbJHJfp0q
 NgdlwacVYAwEZg2ozanSs8/4ukTzdC9itxchym1GptCaAqvYC/dx8wFSTCnbCkn3+ngp
 8jXJMX9O0/NedQwGQuqEzqkfaRybboaaEJ3Rb8EiV5xzCvyZ1KaZx0Wb1qFq/Cq/Nhs3
 FUQ8LNWSIlvRWwyeUVpr7HdxeLYN+Spaw9FYaAz1bfW0RxTJS/ZzuWsNVk0IhPPZWdsF
 CoDg==
X-Gm-Message-State: AOAM531BRS0bhZOILx/VNLrNyMCYRT/GOcBBkcpiGCyzzSD5iJAOPeEr
 qdNd+fMWQTOF2kfCMG2cNSaS58NDvXb4HS3u2Kc=
X-Google-Smtp-Source: ABdhPJw1J1uRF+oqzk1e06jyzWbAQmoo5BlAKp5GN8GdeH726h8oJY64szLqMuzUfvU3UdrRFzhjdTg78fBEFnzzN4I=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr30811932wrg.83.1602515270083; 
 Mon, 12 Oct 2020 08:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-23-robdclark@gmail.com>
 <20201012144018.GB438822@phenom.ffwll.local>
In-Reply-To: <20201012144018.GB438822@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 12 Oct 2020 08:07:38 -0700
Message-ID: <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] drm/msm: Don't implicit-sync if only a single
 ring
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Any cross-device sync use-cases *must* use explicit sync.  And if there
> > is only a single ring (no-preemption), everything is FIFO order and
> > there is no need to implicit-sync.
> >
> > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > is undefined when fences are not used to synchronize buffer usage across
> > contexts (which is the only case where multiple different priority rings
> > could come into play).
>
> Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
> confused by your commit message?

No, I don't think so.  If there is only a single priority level
ringbuffer (ie. no preemption to higher priority ring) then everything
is inherently FIFO order.

For cases where we are sharing buffers with something external to drm,
explicit sync will be used.  And we don't implicit sync with display,
otherwise x11 (frontbuffer rendering) would not work

BR,
-R

> Since for these protocols we do expect implicit sync accross processes to
> work. Even across devices (and nvidia have actually provided quite a bunch
> of patches to make this work in i915 - ttm based drivers get this right,
> plus dumb scanout drivers using the right helpers also get this all
> right).
> -Daniel
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 3151a0ca8904..c69803ea53c8 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >       return ret;
> >  }
> >
> > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> >  {
> >       int i, ret = 0;
> >
> > @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                               return ret;
> >               }
> >
> > -             if (no_implicit)
> > +             if (!implicit_sync)
> >                       continue;
> >
> >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out;
> >
> > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> >       if (ret)
> >               goto out;
> >
> > --
> > 2.26.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
