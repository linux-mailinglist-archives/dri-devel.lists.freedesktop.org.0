Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B73C75DA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 19:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E559E6E115;
	Tue, 13 Jul 2021 17:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FD16E105;
 Tue, 13 Jul 2021 17:42:42 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso2951610wmj.0; 
 Tue, 13 Jul 2021 10:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BCKTJU2XxIO77fuxxzexkfqoVytjtNEnzHrzE4LOcyU=;
 b=EToeT1inOWCt4oadMwT0v3PUy6du+3gSJVj+TudD76Ny/PVxYy0EbsJx93dlKTqyQI
 pOcBVx56jFbFZZb+yPhKxYY1comJaWESJJgdsvU2fVilj7qc8D4ECl59fIxzS3Z/80My
 eX44oUGaSwbfKF9LLVqHMtkV8DQNViQ9E79l4iOIcDDQaf+EWD7mgyY6wdMsAZcizY9a
 2Bz5waZFphg4c06u4r5xdMCskFuYo6lO8E3IjOZEO9TBCPoHCzPIs6/GyTUs8jEVEklP
 tBLHvoTdsBtxMx+pH3Xb2aUvv3j4BLGnAc3p0Lzt4QFz9jqCDpNYlGo6vuAzrsOkjmTs
 ThiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCKTJU2XxIO77fuxxzexkfqoVytjtNEnzHrzE4LOcyU=;
 b=My2VPEgDOcKiLd3/qLUMTLPn+a1Yoa+1j9FZGpsO/ZaCJxZcSfem1bAnG6kaNZ8gSJ
 VU0WWniKZiQaBocIIElefAbOjaMnYirDSJV4+jKAIx3cYTxKItay94l92Fb5KiwoGHId
 SOia6vRnu6/5A6INoCH+AJgd6myZ7w1u5noSbFPT3qWsykV/c2uFFFbqxKkY1/hNQdBn
 AELWsj/WytdeYs8VyLvH2epAkiih8KpeRl2rgeOAxK8HWHxQw03lvBV3Tz7l6KlJkReE
 yVCU37rmf4GlC/Uk45rGHdAHRlSh7tkYH+zfPBawVf497QG6rkoxtbZwS0ld56Fogyx4
 ihow==
X-Gm-Message-State: AOAM532SfUnxOmTQOGiIr7scHLiuY6UvTnGpS5ub3A3rS9wMQdshK9ne
 n6byfLOZyw4d1FZLHvjvsCtF/wnofddQDhLKaQE=
X-Google-Smtp-Source: ABdhPJxxQFSd3trk1Yz/bp+qnTaH981CyIiqxvsV1KScxRC5xJlYqtoR6lDSCKcCtzuwv3cwAQFgJfx8N9bKEDR7CH4=
X-Received: by 2002:a1c:25c6:: with SMTP id l189mr574530wml.49.1626198161022; 
 Tue, 13 Jul 2021 10:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch>
 <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
 <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
In-Reply-To: <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 Jul 2021 10:46:47 -0700
Message-ID: <CAF6AEGvsQnULTKwqWu+ToX0cVt12hs4SZrZ2Ai216m=8MBaqTQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Tue, Jul 13, 2021 at 9:58 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > There's only one exclusive slot, and we must not break the ordering.
> > >
> > > Adding a new exclusive fence drops all previous fences from the
> > > dma_resv. To avoid violating the signalling order we err on the side of
> > > over-synchronizing by waiting for the existing fences, even if
> > > userspace asked us to ignore them.
> > >
> > > A better fix would be to us a dma_fence_chain or _array like e.g.
> > > amdgpu now uses, but
> > > - msm has a synchronous dma_fence_wait for anything from another
> > >   context, so doesn't seem to care much,
> > > - and it probably makes sense to lift this into dma-resv.c code as a
> > >   proper concept, so that drivers don't have to hack up their own
> > >   solution each on their own.
> > >
> > > v2: Improve commit message per Lucas' suggestion.
> > >
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rob Clark <robdclark@gmail.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Cc: linux-arm-msm@vger.kernel.org
> > > Cc: freedreno@lists.freedesktop.org
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index b71da71a3dd8..edd0051d849f 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >                                 return ret;
> > >                 }
> > >
> > > -               if (no_implicit)
> > > +               /* exclusive fences must be ordered */
> > > +               if (no_implicit && !write)
> > >                         continue;
> >
> > In practice, modern userspace (the kind that is more likely to set the
> > no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> > every bo, to shave some cpu overhead so I suppose this would not
> > really hurt anything
> >
> > Do you know if this is covered in any piglit/etc test?
>
> You need some command submission, plus buffer sharing with vgem
> setting it's own exclusive fences, plus checking with dma_buf poll()
> whether it signals all in the right order. That's pretty low-level, so
> maybe something in igt, but I haven't typed that. Maybe I need to do
> that for i915 at least.

ok, you lost me at vgem ;-)

(the vgem vs cache situation on arm is kinda hopeless)

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
> > >
> > >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
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
