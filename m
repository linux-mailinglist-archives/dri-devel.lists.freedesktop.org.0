Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB63C7568
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299DF89E9B;
	Tue, 13 Jul 2021 16:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C5089E1B
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:58:30 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso1202969otu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 09:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SEHtexM30zQ1pNlegjyNVvT5I02vNfZvNmYrTBM0+0=;
 b=ZQ+ry+Bx8r9GFRJnBTRGJ89JZCMdTEXJ7q5yArO2dp23xWpZw4BvXP1uG4PK+Uq/ie
 t4UPLQr8vSBiOZFs0RUvpyf6uMGF3ZQntmNGZDOdBBUow/VsywUeAw3wdXzYzCrq/+h2
 QA7P5Sr7mYfyRDcB20gerZcLdLFsNws/E1mDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SEHtexM30zQ1pNlegjyNVvT5I02vNfZvNmYrTBM0+0=;
 b=CDLRN5jqRb1jqDGShe6lgVlsQPHhcW3dnaK8eU6uODySOvcWQzJHmkJBplLLzgwvp9
 1YKBq1O0cXAyqXE+gHap0RfvcJtJew65W/4HI1MAlAAlWVG21RDIgYBhYlAtLspsg61f
 nFbcikhWwZyl17sQTB7WLKT7pIgaOkHWUNIksKpXr4XbvwxLEHKnzpzGDCNWJyy72xFI
 rHb2nSTAfir1whQk5hqY3AL5wxzVCBp2arvJzOP+ZHwsoLu133mbsAcYu8kD97fgmG2g
 yiss7Hz88mb0f2vWiUncNpdZZp2D/lIZXLgIobQon+ABidFOmPkehX1e1sIeaijIdTWj
 4C9Q==
X-Gm-Message-State: AOAM5324JPJhV2vJdp8oGlBjoBGOzSEUIQwuaxq8aHAWc1YAj9Q6lUNj
 3PzBGOgkyk0A2G+y7XpPnDmqdLHv2MeBLGuPT0uKhHjfxiQ=
X-Google-Smtp-Source: ABdhPJwfBxb7hGnmJjrluM8xypb4cOTE7kDdsy2G6JzETLnn61eE66M9+B1vlIXxd1/coMtHeMn4CAh93opbQGLOymI=
X-Received: by 2002:a05:6830:2366:: with SMTP id
 r6mr4310903oth.188.1626195510078; 
 Tue, 13 Jul 2021 09:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-15-daniel.vetter@ffwll.ch>
 <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
In-Reply-To: <CAF6AEGtC0BxABJtSaOmhEt_WKiuptWCHP7g4D5wEaJ4NaEuz4w@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 13 Jul 2021 18:58:19 +0200
Message-ID: <CAKMK7uEL8dr5RT2362ehR1Gb7mvwLmcEsZV+uWDj_kpoovWKxg@mail.gmail.com>
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

On Tue, Jul 13, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 12, 2021 at 1:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > There's only one exclusive slot, and we must not break the ordering.
> >
> > Adding a new exclusive fence drops all previous fences from the
> > dma_resv. To avoid violating the signalling order we err on the side of
> > over-synchronizing by waiting for the existing fences, even if
> > userspace asked us to ignore them.
> >
> > A better fix would be to us a dma_fence_chain or _array like e.g.
> > amdgpu now uses, but
> > - msm has a synchronous dma_fence_wait for anything from another
> >   context, so doesn't seem to care much,
> > - and it probably makes sense to lift this into dma-resv.c code as a
> >   proper concept, so that drivers don't have to hack up their own
> >   solution each on their own.
> >
> > v2: Improve commit message per Lucas' suggestion.
> >
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rob Clark <robdclark@gmail.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: freedreno@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index b71da71a3dd8..edd0051d849f 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                                 return ret;
> >                 }
> >
> > -               if (no_implicit)
> > +               /* exclusive fences must be ordered */
> > +               if (no_implicit && !write)
> >                         continue;
>
> In practice, modern userspace (the kind that is more likely to set the
> no-implicit flag on every submit) also sets MSM_SUBMIT_BO_WRITE on
> every bo, to shave some cpu overhead so I suppose this would not
> really hurt anything
>
> Do you know if this is covered in any piglit/etc test?

You need some command submission, plus buffer sharing with vgem
setting it's own exclusive fences, plus checking with dma_buf poll()
whether it signals all in the right order. That's pretty low-level, so
maybe something in igt, but I haven't typed that. Maybe I need to do
that for i915 at least.
-Daniel

> BR,
> -R
>
> >
> >                 ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > --
> > 2.32.0
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
