Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55643C75E1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 19:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1FB6E10A;
	Tue, 13 Jul 2021 17:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A1A6E10A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 17:45:48 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id p67so6601710oig.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmtzcyst+8OgXBI41dqYr4OHovq38Lmve+NnPNNWFaA=;
 b=E9kH+I9A0KksyrSJYGuPUtireKMQ1h2VVRvbVTFj8eIP6xeFILzX1kJzRhrGWs6vO2
 0GxXLljCV1mje7M4duMNSElcxU8qhCQCWnKE3E3TutR8TWp1lLyaL6PvyZo22zMJ0oku
 7HEYM2UyRDUBzKlVlqAyP7or8ocosvwOWsNAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmtzcyst+8OgXBI41dqYr4OHovq38Lmve+NnPNNWFaA=;
 b=NdIdU378crFyi2xIilEEvwmfRE6lG36b/K1XjYL9kg9uetDb1qdZ24R+8NiAQpCq/L
 yQY5B4g6+NJeYyGJR6bsMirTHviDnmk8D1PV+G++/+bDOciv7wl/PX3UNz/PHQbQ6U6U
 hqwH2iw4t4dYrFSECXiGRj4/zuaGNVCPaN9lsQor4ssIb1sRwWs/xoZg7JC/MQvMXO57
 932GCAqGgndaqrqfZW/2wTL/iWi/Qt9mUx328rAug2tXpkIJ5wSNThWH2SBxrzugO83H
 wQIpeUO+kgau+WMiQaVANF8s1uUeSzR2O9QoAfnwj6TJB7T1k9r3kltEMZfz7QZyNIbt
 dGBw==
X-Gm-Message-State: AOAM531XlF5ecWD/XtouhqyY7KcP7P2Xld46QrNhYMLetdEdHwkZ8tCv
 uPSr8lhF1/0WT4OiQazhL0HKI+PolWQjzAXgNZDaBDdk2oM=
X-Google-Smtp-Source: ABdhPJxzpjd8fmeN5xsqQQ8/UWTplGKa3o1OKFivFnAQ9i+M2VhbfW3DpqnVr7dh4haRV9U3tHRv1DXHvWi5XsqX2z4=
X-Received: by 2002:aca:3085:: with SMTP id w127mr398974oiw.101.1626198347467; 
 Tue, 13 Jul 2021 10:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch>
 <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
 <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
 <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
In-Reply-To: <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 19:45:36 +0200
Message-ID: <CAKMK7uF8wZuJVON0-06xDGtuSof2m6Y-cj7qkdUSTYd1PrVt9A@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
To: Rob Clark <robdclark@gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 7:42 PM Rob Clark <robdclark@gmail.com> wrote:
> On Tue, Jul 13, 2021 at 9:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > >
> > > > There's only one exclusive slot, and we must not break the ordering.
> > > >
> > > > Adding a new exclusive fence drops all previous fences from the
> > > > dma_resv. To avoid violating the signalling order we err on the side of
> > > > over-synchronizing by waiting for the existing fences, even if
> > > > userspace asked us to ignore them.
> > > >
> > > > A better fix would be to us a dma_fence_chain or _array like e.g.
> > > > amdgpu now uses, but
> > > > - msm has a synchronous dma_fence_wait for anything from another
> > > >   context, so doesn't seem to care much,
> > > > - and it probably makes sense to lift this into dma-resv.c code as a
> > > >   proper concept, so that drivers don't have to hack up their own
> > > >   solution each on their own.
> > > >
> > > > v2: Improve commit message per Lucas' suggestion.
> > > >
> > > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > Cc: Sean Paul <sean@poorly.run>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: freedreno@lists.freedesktop.org
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index b71da71a3dd8..edd0051d849f 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > >                                 return ret;
> > > >                 }
> > > >
> > > > -               if (no_implicit)
> > > > +               /* exclusive fences must be ordered */
> > > > +               if (no_implicit && !write)
> > > >                         continue;
> > >
> > > In practice, modern userspace (the kind that is more likely to set the
> > > no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> > > every bo, to shave some cpu overhead so I suppose this would not
> > > really hurt anything
> > >
> > > Do you know if this is covered in any piglit/etc test?
> >
> > You need some command submission, plus buffer sharing with vgem
> > setting it's own exclusive fences, plus checking with dma_buf poll()
> > whether it signals all in the right order. That's pretty low-level, so
> > maybe something in igt, but I haven't typed that. Maybe I need to do
> > that for i915 at least.
>
> ok, you lost me at vgem ;-)
>
> (the vgem vs cache situation on arm is kinda hopeless)

Oh that explains a few things ... I just found out why vgem is failing
for wc buffers on x86 (on some of our less-coherent igpu at least),
and wondered how the heck this works on arm. Sounds like it just
doesn't :-/

On the testcase: You'd never actually check buffer contents, only
fences, so the test would still work.
-Daniel
>
> BR,
> -R
>
> > -Daniel
> >
> > > BR,
> > > -R
> > >
> > > >
> > > >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > --
> > > > 2.32.0
> > > >
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
