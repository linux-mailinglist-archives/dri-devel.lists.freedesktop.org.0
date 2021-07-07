Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252813BE738
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 13:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105F26E0E5;
	Wed,  7 Jul 2021 11:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551EF6E0D5
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 11:37:49 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id s17so3085248oij.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=85wMp6mCEGea6kHziz5pSNxjdCXAx9VGNPnYANistYE=;
 b=Zvp163uYjPQXret6++TzRbPj8U5tkTaMRT9a2tRHF48GZYqVWG/6XVU7h5oztek7eU
 JRQcAAkA/y2a3w2aZJgVWk9yrWJ1wo2uPhw4h32ktCjbTmBPX1Hw81SYPL9I94fUb/RS
 bPkj/RO1kcw3128eSRpVf6nhH3Ym1xXZIY6CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=85wMp6mCEGea6kHziz5pSNxjdCXAx9VGNPnYANistYE=;
 b=TGdsZmrRyCax1zAerSWlEwNLdOGzu+56t02E5ddXETWBgYK0wzAnLGwDRqsE7p5crg
 Z7WplVm8mR8MVdwImuSqm+v9aDoUmV8F85kV52lzzFrMCyOoVSCYtul1CXB+ZWVbd565
 W30T7jC6/k5RXJf4Rsen4xrfkBP4IXy0yw/vxkL9oS9sUzGfBphvesSywWZPxovFoKjd
 ysdmJx02rWIvkeeprw0YtM30Vm9sDAEDhX0GhzhJmTgj6Ckd+exI9GSdJh2A9UOJngnM
 K8ozDDqsxyu3d+r/Kf75AXylYuEXq59Wnaj5hZY6JWx7n7meOlFjt/gz0SXP+EMVQZE7
 XhYg==
X-Gm-Message-State: AOAM532MB/5u179wl2BV3KemQAib1CsaIzkq6FlNIB29w9IwLx4dNX4R
 UH1NF3fRUZ5/2u2gnh46K2mRGHaDLniEibRTecAu/g==
X-Google-Smtp-Source: ABdhPJzBh/OgHFXrP1YGWtVa6F5dseZyVBl9o/KLYgvxM2f05qhTSIoMfgakCnk/qOlq+v48P5/sazY9zyPDxZKiQks=
X-Received: by 2002:aca:5793:: with SMTP id l141mr4481746oib.14.1625657868678; 
 Wed, 07 Jul 2021 04:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
 <20210706101209.3034092-4-daniel.vetter@ffwll.ch>
 <7ae23a2b1a4aec4e57881e0d88a7d046fe17bfda.camel@pengutronix.de>
In-Reply-To: <7ae23a2b1a4aec4e57881e0d88a7d046fe17bfda.camel@pengutronix.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 7 Jul 2021 13:37:37 +0200
Message-ID: <CAKMK7uFHnet_rTHmBqsVPNcdWaJ=7nwiS3zHisiGOjBHPt=Qmg@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/etnaviv: Don't break exclusive fence ordering
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 7, 2021 at 10:54 AM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Hi Daniel,
>
> I'm feeling like I miss a ton of context here, so some maybe dumb
> questions/remarks below.
>
> Am Dienstag, dem 06.07.2021 um 12:12 +0200 schrieb Daniel Vetter:
> > There's only one exclusive slot, and we must not break the ordering.
> >
> > A better fix would be to us a dma_fence_chain or _array like e.g.
> > amdgpu now uses, but it probably makes sense to lift this into
> > dma-resv.c code as a proper concept, so that drivers don't have to
> > hack up their own solution each on their own. Hence go with the simple
> > fix for now.
> >
> > Another option is the fence import ioctl from Jason:
> >
> > https://lore.kernel.org/dri-devel/20210610210925.642582-7-jason@jlekstrand.net/
>
> Sorry, but why is the fence import ioctl a alternative to the fix
> proposed in this patch?

It's not an alternative to fixing the issue here, it's an alternative
to trying to fix this here without adding more dependencies. Depends a
bit what exactly you want to do, I just linked this for the bigger
picture.


>
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> > Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> > Cc: etnaviv@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > index 92478a50a580..5c4fed2b7c6a 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> > @@ -178,18 +178,20 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
> >       for (i = 0; i < submit->nr_bos; i++) {
> >               struct etnaviv_gem_submit_bo *bo = &submit->bos[i];
> >               struct dma_resv *robj = bo->obj->base.resv;
> > +             bool write = bo->flags & ETNA_SUBMIT_BO_WRITE;
> >
> > -             if (!(bo->flags & ETNA_SUBMIT_BO_WRITE)) {
> > +             if (!(write)) {
>
> No parenthesis around the write needed.
>
> >                       ret = dma_resv_reserve_shared(robj, 1);
> >                       if (ret)
> >                               return ret;
> >               }
> >
> > -             if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
> > +             /* exclusive fences must be ordered */
>
> I feel like this comment isn't really helpful. It might tell you all
> you need to know if you just paged in all the context around dma_resv
> and the dependency graph, but it's not more than noise to me right now.
>
> I guess the comment should answer the question against what the
> exclusive fence we are going to add needs to be ordered and why it
> isn't safe to skip implicit sync in that case.

The full-length comment is the doc patch, which is last in the series.
Essentially the rule is that your not allowed to drop fences on the
floor (which you do if you just set a new write fence and not take any
of the existing fences as dependencies), at least for shared buffers.
But since it's easier to be consistent I think it's best if we do this
just across the board.

Like the commit message explains, there's a few ways to fix this:
- just treat it as implicit synced
- chain the fences together - that way you don't sync, but also
there's no fence that's being lost. This is what amdgpu does, and also
what the new import ioctl does.

2nd option is a lot more involved, and since all the dma-resv stuff is
a bit under discussion, I went with the most minimal thing possible.
-Daniel

>
> Regards,
> Lucas
> > +             if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT && !write)
> >                       continue;
> >
> >               ret = drm_sched_job_await_implicit(&submit->sched_job, &bo->obj->base,
> > -                                                bo->flags & ETNA_SUBMIT_BO_WRITE);
> > +                                                write);
> >               if (ret)
> >                       return ret;
> >       }
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
