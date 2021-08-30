Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0813FB2D6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 11:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62C889A4A;
	Mon, 30 Aug 2021 09:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052EF89A4A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 09:02:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q3so20493748edt.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=P0VwUkxlwiDNF5zXlJbfV8JNAaRiNE6CCyXYomEyvrI=;
 b=hfS6z/FKy4eXTdRumbtkBdRZxKmkoRQer3FHqIbFXcWZ8JldQkNBXy8cS5R8V8X199
 wa30n7EaQ1FNoXda2wlwE6FFaoG7Lbp4KuGTyk3b0A1fZJXCCDIgia+z+nDtH21B4z3I
 tlK6+VPFd52FGv9TuLI6/1g7hm/2h15D1abSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P0VwUkxlwiDNF5zXlJbfV8JNAaRiNE6CCyXYomEyvrI=;
 b=I5x5isJtmn9nRSMQDgM4Rx8sk4g9RkPcUxg5J+OWLywsobI5IGir45sP1XkAjTr7Fm
 qgqQD2lnSkFHnOSKBz8m+v86/PJN/dOdTso4hDz3J2Yxgk9dcMY9PaXfZAlHErsqveTO
 +cQRSt7eRE+j29Bs42MlD/ISy+qn/3Vhg8gEj5MoIWHPos7U2PDQRLezf0+m5BQZYP8j
 1beEf1LnZVNvqEdDoPMb1VxvHm4XoINiP5SbAR8SySPY+KZfw5PObiJXgOKQRFIAvq80
 R4sLjCg9U7gmfpUHnoX4r4MuvMsPr3AFKBxCUvRB2YiQbgc/FRyQQhRf3DSGtwIXM+xS
 DZ8Q==
X-Gm-Message-State: AOAM530Q7pbdOGgVfuv1GGY4XiXZkS5jzsnis8bPj9BhgExddrPC23un
 v6g47Nz5A7zu3YskkWBTXABjGg==
X-Google-Smtp-Source: ABdhPJxYyxhCjR7uuGM8J7R+lgAExXey1usensekyctDskpS84BLeSBbFiTNH3XD6qyITSLiAHrxkQ==
X-Received: by 2002:aa7:cc02:: with SMTP id q2mr22493221edt.154.1630314164602; 
 Mon, 30 Aug 2021 02:02:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id cb22sm3862182edb.5.2021.08.30.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 02:02:44 -0700 (PDT)
Date: Mon, 30 Aug 2021 11:02:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v5 16/20] drm/msm: Don't break exclusive fence ordering
Message-ID: <YSyesupzftTAuWqI@phenom.ffwll.local>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-17-daniel.vetter@ffwll.ch>
 <CAF6AEGtSM_TfCKvHh48WFX4DvhdrWLLi3oCMPz1x2_pCZwbPCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtSM_TfCKvHh48WFX4DvhdrWLLi3oCMPz1x2_pCZwbPCQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 09:16:25AM -0700, Rob Clark wrote:
> On Thu, Aug 5, 2021 at 3:47 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
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
> 
> a-b

Also pushed to drm-misc-next, thanks for review&testing.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index fb5a2eab27a2..66633dfd58a2 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -330,7 +330,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                                 return ret;
> >                 }
> >
> > -               if (no_implicit)
> > +               /* exclusive fences must be ordered */
> > +               if (no_implicit && !write)
> >                         continue;
> >
> >                 ret = drm_sched_job_add_implicit_dependencies(&submit->base,
> > --
> > 2.32.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
