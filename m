Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2136828CC3C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 13:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C626E8BA;
	Tue, 13 Oct 2020 11:08:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746C96E114
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:08:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f21so20504040wml.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uvxObDwTo5Y8F/KuyP+1hkA480rLi769JHi4wPHoyZo=;
 b=OjLB26BnBY0bTsdHD3EzrtKyC81oM/0JTZCn6CLgyXf7zcDUfy5vEiXi3UDSzVmHDi
 +28SDYfaM8aC9c0gvCjcQjZSkVZiSn1tj4DX9sZ7XtG7z0O9zDzWRQtW0bl4JEUVlmj6
 oHncYXBeGhKdacVIldQq+ga8Rp+OxaRjm6pSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uvxObDwTo5Y8F/KuyP+1hkA480rLi769JHi4wPHoyZo=;
 b=saaazTJeBcca6d7+WuUaJ8ce7vbnB1CFALRPrS9+dBvfJ/zACedWlbauAmtNjfOV7s
 GwnN40PhQErAT5U67FpNc4LJH8HDCFgwu87DkvgR395U9Rqi7vwfjZFx2d8tSEdcWsnQ
 eDHT0GoUpPlUZzOdzomlYmr9BnjMG+KhXuV6b7V8iJ+pibMSOw3yLZqo07sGBy0eLtSj
 jf8rPQA6v1sFWN1rLeg0Npx2RfYU55RfqBJbaBCG4/ndc+Qig3dSqa/IguqwedK0R3H8
 D7Vrnn2vXMSi4sUXseWJtZjUC6Af33qpYsFvCd6h9JHlhHYVjfB0DpGZQp02Cp1EtR2p
 gWxg==
X-Gm-Message-State: AOAM530o8MNf7I2LpNYK1M3As1+doAuJ/b4HLnhm8MF/c9Zajtb8hJDr
 76ddBKtnZVHPQT9sgNTooIvuBA==
X-Google-Smtp-Source: ABdhPJwdxWAoTqe7At2F5tTQxz1+7Sey1hlKtS1VILSfOid9lZqdcUgzZZ28B6xcbL7mDDIeJVxKpg==
X-Received: by 2002:a1c:ddc2:: with SMTP id u185mr15579789wmg.21.1602587309567; 
 Tue, 13 Oct 2020 04:08:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v11sm13304289wml.26.2020.10.13.04.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 04:08:28 -0700 (PDT)
Date: Tue, 13 Oct 2020 13:08:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v2 22/22] drm/msm: Don't implicit-sync if only a single
 ring
Message-ID: <20201013110826.GD438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-23-robdclark@gmail.com>
 <20201012144018.GB438822@phenom.ffwll.local>
 <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 08:07:38AM -0700, Rob Clark wrote:
> On Mon, Oct 12, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Any cross-device sync use-cases *must* use explicit sync.  And if there
> > > is only a single ring (no-preemption), everything is FIFO order and
> > > there is no need to implicit-sync.
> > >
> > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > is undefined when fences are not used to synchronize buffer usage across
> > > contexts (which is the only case where multiple different priority rings
> > > could come into play).
> >
> > Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
> > confused by your commit message?
> 
> No, I don't think so.  If there is only a single priority level
> ringbuffer (ie. no preemption to higher priority ring) then everything
> is inherently FIFO order.

Well eventually you get a scheduler I guess/hope :-)

> For cases where we are sharing buffers with something external to drm,
> explicit sync will be used.  And we don't implicit sync with display,
> otherwise x11 (frontbuffer rendering) would not work

Uh now I'm even more confused. The implicit sync fences in dma_resv are
kinda for everyone. That's also why dma_resv with the common locking
approach is a useful idea.

So display should definitely support implicit sync, and iirc msm does have
the helper hooked up.

Wrt other subsystems, I guess passing dma_fence around somehow doesn't fit
into v4l (the patches never landed), so v4l doesn't do any kind of sync
right now. But this could be fixed. Not sure what else is going on.

So I guess I still have no idea why you put that into the commit message.

btw for what you're trying to do yourself, the way to do this is to
allocate a fence timeline for your engine, compare fences, and no-op them
all out if their own the same timeline.
-Daniel

> 
> BR,
> -R
> 
> > Since for these protocols we do expect implicit sync accross processes to
> > work. Even across devices (and nvidia have actually provided quite a bunch
> > of patches to make this work in i915 - ttm based drivers get this right,
> > plus dumb scanout drivers using the right helpers also get this all
> > right).
> > -Daniel
> >
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index 3151a0ca8904..c69803ea53c8 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > >       return ret;
> > >  }
> > >
> > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > >  {
> > >       int i, ret = 0;
> > >
> > > @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >                               return ret;
> > >               }
> > >
> > > -             if (no_implicit)
> > > +             if (!implicit_sync)
> > >                       continue;
> > >
> > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >       if (ret)
> > >               goto out;
> > >
> > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > >       if (ret)
> > >               goto out;
> > >
> > > --
> > > 2.26.2
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
