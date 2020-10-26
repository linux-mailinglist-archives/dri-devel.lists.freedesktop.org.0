Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4E298972
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 10:34:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20166E888;
	Mon, 26 Oct 2020 09:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683506E888
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 09:34:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n18so11568517wrs.5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=gYzieEkyuY5GK4uIKGUgpkX8O/MjJBNKsXAywCS/qUs=;
 b=RSgUj4PXQdjvjhUxcBC2NkgGKsRMLzp3PYY9p4Uj7B7AfgPG3ewdfVQ2Mxj+FvMlKu
 0nM+RnXg+PoAL+CHWjAhOGn0dcjtQLB4B33Ee9ctifIVcnGBeey4DCtSyvZ/0tKbQpNJ
 IBJhSVHrSrVQvlRbv8fS4LsmShIvyYlV2SRTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=gYzieEkyuY5GK4uIKGUgpkX8O/MjJBNKsXAywCS/qUs=;
 b=D+ss9n8bK1mPG6AYzsfXB42xcFQiBQkLtLBgNBwHmcaEjM8fRnL3R8dyE98Lu9/tsu
 /E82UHmePLFMx+yoAnasONrp/+cx1pyMspdxxrbOl13yd4YZ2U6kWNb2+FZCzTzFDxhv
 JHTprcgflX2aPliTdZitxtO7dshF1YwXfx4KuImx7xlv3Qhkvu+xC6trBB+uDiL9f9NE
 bTzRU1QTqUW15tAnUqpgJy0ZdbqI79VqtEMuLcZebmDw7uCykUIbCx8aaEARubkOXDqW
 b2KhD5segRCuU0kAt6aFVPG+gKvD4pWmL8DXB90mFya+gP3dO626QfHUtLSMCZcKS24B
 n7Hg==
X-Gm-Message-State: AOAM531hfe/26/V/PjF+Po3DCLphJ3Vl2JxiCUX2OhF0TOS9i7L26VB6
 MrV6mRSo6wY6rqfJQvwVwKp+dA==
X-Google-Smtp-Source: ABdhPJwLY/UfUb4b5DuGG2QhDX+v52BtLVPVfOd8+FPAKqX9G1N3GacfhGqDO8qEumDJ6El2XwbvcQ==
X-Received: by 2002:adf:a306:: with SMTP id c6mr16496122wrb.160.1603704848072; 
 Mon, 26 Oct 2020 02:34:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm23591677wrx.88.2020.10.26.02.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 02:34:07 -0700 (PDT)
Date: Mon, 26 Oct 2020 10:34:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single
 ring
Message-ID: <20201026093405.GG401619@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Sean Paul <sean@poorly.run>
References: <20201023165136.561680-1-robdclark@gmail.com>
 <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
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
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> >
> > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > If there is only a single ring (no-preemption), everything is FIFO order
> > > and there is no need to implicit-sync.
> > >
> > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > is undefined when fences are not used to synchronize buffer usage across
> > > contexts (which is the only case where multiple different priority rings
> > > could come into play).
> >
> > Really, doesn't this break cross-device implicit sync? Okay, you may
> > not have many peripherals that rely on implicit sync on devices where
> > Adreno is usually found, but it seems rather heavy-handed.
> >
> > Wouldn't it be better to only ignore fences from your own ring context
> > in the implicit sync, like we do in the common DRM scheduler
> > (drm_sched_dependency_optimized)?
> 
> we already do this.. as was discussed on an earlier iteration of this patchset
> 
> But I'm not aware of any other non-gpu related implicit sync use-case
> (even on imx devices where display is decoupled from gpu).. I'll
> revert the patch if someone comes up with one, but otherwise lets let
> the implicit sync baggage die

The thing is, dma_resv won't die, even if implicit sync is dead. We're
using internally for activity tracking and memory management. If you don't
set these, then we can't share generic code with msm, and I think everyone
inventing their own memory management is a bit a mistake.

Now you only kill the implicit write sync stuff here, but I'm not sure
that's worth much since you still install all the read fences for
consistency. And if userspace doesn't want to be synced, they can set the
flag and do this on their own: I think you should be able to achieve
exactly the same thing in mesa.

Aside: If you're worried about overhead, you can do O(1) submit if you
manage your ppgtt like amdgpu does.
-Daniel

> 
> BR,
> -R
> 
> 
> 
> >
> > Regards,
> > Lucas
> >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index d04c349d8112..b6babc7f9bb8 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > >       return ret;
> > >  }
> > >
> > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > >  {
> > >       int i, ret = 0;
> > >
> > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >                               return ret;
> > >               }
> > >
> > > -             if (no_implicit)
> > > +             if (!implicit_sync)
> > >                       continue;
> > >
> > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >       if (ret)
> > >               goto out;
> > >
> > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > >       if (ret)
> > >               goto out;
> > >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
