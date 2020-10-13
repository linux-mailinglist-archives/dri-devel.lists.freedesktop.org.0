Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7828D1FA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 18:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C506E901;
	Tue, 13 Oct 2020 16:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4643B6E8FC;
 Tue, 13 Oct 2020 16:15:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e17so24730895wru.12;
 Tue, 13 Oct 2020 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wL3Dm/7T9Aopd/k4LVvtqS/YBgshmRorMqwRcmxT0hk=;
 b=cCxCdK6uQ3V1e++IywUiyODU50GT3jcY9ut9z/tKFmD6ltLq/2Q5z1RrDtVd0HP8Dl
 rve31nT6N2aO+FVyyIVC1WMwynfulT3rhS8i1DwFtXNcBzjj3NywbusA1KwDRmOoyisx
 YO3rRPpLGFnFZACCjw9BLzVvh4afI4ZGDrBkmuBH+okfjYOq12dEyvO3BCsfX8AIZZxL
 jq1lhn0xTsJvsbNTq+SVCy9wMV37qhgPs9NenychlJ8YSV4boQD3CjIsd/XP3hYryP7e
 O7g2q+9gnfOvUMLiOL8L2OY++M4tMUR+atsv3csDNgY+MMsEvtscII4qFKUIRzVRWgBk
 PzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wL3Dm/7T9Aopd/k4LVvtqS/YBgshmRorMqwRcmxT0hk=;
 b=OlNRLtwtdawfLkZzJhsuGLgapzog8vDWBb/qj11SIE9QVrjNOR1DDbfpBM0nG5A8pQ
 O2/AWLJ/ShWI6nmSBNsm5eWF+E4cXBInc7mFeokcIVUZk1E1Lmn88zijUKgdepEUpoSv
 0ilPHn5C/c08T09wP411wB6Rw9CJbPLkgJdRkJr+4Trtw6iIV/W0j8t/p4R1yD95pVG1
 88y5G9NX34xAH0qlYj05FUvhK8nv80PPpOCd0t3xUYUMs2l29PBBcRKshWzYXEg94w+H
 WkehdGJHcxzJ8v2Qn81EgXwvsUaCFY6SXkJv6TREqGSZCZ4I0T+5IOdW9y9x4CJXz+Cr
 Nnwg==
X-Gm-Message-State: AOAM532Lpjm8mamij+dsfN5XWbVdKmISdnpN7StD6KxydSkk4ZpCvs8G
 5/5UAycUjrT282dYDyT68CGct1NHMJDj7ch5qss=
X-Google-Smtp-Source: ABdhPJyvs299kAwlM7M2+hYEAp0nsjVH0AWp3dBdz5/H1ws+O43M178+q+kICgp4raqWULWyFNViWcJuwLlLpfQqU4U=
X-Received: by 2002:a5d:640d:: with SMTP id z13mr480262wru.28.1602605738748;
 Tue, 13 Oct 2020 09:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-23-robdclark@gmail.com>
 <20201012144018.GB438822@phenom.ffwll.local>
 <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
 <20201013110826.GD438822@phenom.ffwll.local>
In-Reply-To: <20201013110826.GD438822@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Oct 2020 09:15:27 -0700
Message-ID: <CAF6AEGvYJS38JjFzJOA3w9W0W_G47DJYw2bi4GsC1qgo3dAZ0A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 22/22] drm/msm: Don't implicit-sync if only
 a single ring
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

On Tue, Oct 13, 2020 at 4:08 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 12, 2020 at 08:07:38AM -0700, Rob Clark wrote:
> > On Mon, Oct 12, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Any cross-device sync use-cases *must* use explicit sync.  And if there
> > > > is only a single ring (no-preemption), everything is FIFO order and
> > > > there is no need to implicit-sync.
> > > >
> > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > is undefined when fences are not used to synchronize buffer usage across
> > > > contexts (which is the only case where multiple different priority rings
> > > > could come into play).
> > >
> > > Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
> > > confused by your commit message?
> >
> > No, I don't think so.  If there is only a single priority level
> > ringbuffer (ie. no preemption to higher priority ring) then everything
> > is inherently FIFO order.
>
> Well eventually you get a scheduler I guess/hope :-)

we do have one currently for some gens, but not others.. hence the
check for # of rings.  (Ie. there is a ring per priority level, if
only one ring, that means no preemption/scheduler)

> > For cases where we are sharing buffers with something external to drm,
> > explicit sync will be used.  And we don't implicit sync with display,
> > otherwise x11 (frontbuffer rendering) would not work
>
> Uh now I'm even more confused. The implicit sync fences in dma_resv are
> kinda for everyone. That's also why dma_resv with the common locking
> approach is a useful idea.
>
> So display should definitely support implicit sync, and iirc msm does have
> the helper hooked up.

yup

> Wrt other subsystems, I guess passing dma_fence around somehow doesn't fit
> into v4l (the patches never landed), so v4l doesn't do any kind of sync
> right now. But this could be fixed. Not sure what else is going on.
>
> So I guess I still have no idea why you put that into the commit message.
>
> btw for what you're trying to do yourself, the way to do this is to
> allocate a fence timeline for your engine, compare fences, and no-op them
> all out if their own the same timeline.

we do that already (with a fence timeline per-ring, in the case of
gens which support multiple rings / preemption).. this patch just
short-circuits that in the case where we already knows the fences will
of the same timeline

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > > Since for these protocols we do expect implicit sync accross processes to
> > > work. Even across devices (and nvidia have actually provided quite a bunch
> > > of patches to make this work in i915 - ttm based drivers get this right,
> > > plus dumb scanout drivers using the right helpers also get this all
> > > right).
> > > -Daniel
> > >
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index 3151a0ca8904..c69803ea53c8 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > >       return ret;
> > > >  }
> > > >
> > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > >  {
> > > >       int i, ret = 0;
> > > >
> > > > @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > >                               return ret;
> > > >               }
> > > >
> > > > -             if (no_implicit)
> > > > +             if (!implicit_sync)
> > > >                       continue;
> > > >
> > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >       if (ret)
> > > >               goto out;
> > > >
> > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > >       if (ret)
> > > >               goto out;
> > > >
> > > > --
> > > > 2.26.2
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
