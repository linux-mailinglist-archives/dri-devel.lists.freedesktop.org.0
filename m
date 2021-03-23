Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C97346696
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19936E9ED;
	Tue, 23 Mar 2021 17:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEB76E956
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 17:45:07 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 n6-20020a4ac7060000b02901b50acc169fso5130599ooq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 10:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ja/mzZiq7FyOdyN51ZgQd/VeHc/VrY+Y0ZlNdn6Dyas=;
 b=DbeAasi4R/2HTlZRRsnlDYvlHZgSzPCh1+oyOxVlu9S+gGXB4DW99e/9F5P+ZrhvO6
 0MPYdXpYdKPLcngj+7JBaQrVHEn5JjH7duM3dD87J1vme+dtTC6WqzFvk/0GKEoV8ckr
 bYFSa4nMWQJc9Zhum9Vdr0LPsc9HLjNpdZGuOmzN1SqBQYVFJKM/iGBkFMtNpR8HAt91
 4dr8khX2YFsPN2VEc+rF/M4vOY7b2l4jvdQqpu4Zbww9/O9/5Hbvb4PO4XrgV7P/y8Pt
 ih4ttje+n7z9lP1wJO8bDtipE7sVVesISmt1T9lPFt+opp+HNVkmVSDX+Z7aq7JX4B5w
 AYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ja/mzZiq7FyOdyN51ZgQd/VeHc/VrY+Y0ZlNdn6Dyas=;
 b=Ir2OKAAFt29neVU2MFq+1cC5Rt6hQiWGlHZLq8E9BcRlycaCnIguX8QLkG7ocYRLNg
 Cx2Px/+Rtbgbe0XCasT6hAzU77ONrTk/bCX6bBEYDIx+9ubGDV7vzNCbck1lXq0a888I
 /stEcD9/nah0pkpw7FmeKR1a6ierTPc7VmfPopT8bBhXrJRrEU34utnCGgMNGg5sd4kD
 9eqVrZG1++5KqBDKkwcLf2+VklEFCYipSKwpBdAgVqbV+P+z1/mauR36+Hf7V6IedSb9
 lJhlwlx07yVZnJM82rFbSYElIewqJ6FJkM99B0JUOvtDDWlhXdP2CeM3RdQqsGSJsTCn
 Fyhg==
X-Gm-Message-State: AOAM533PiYKyRbRFEhTBVZ0T1nF3kDgcW8AS/CAecsF7FUrizVitndRK
 h91+hl2lYeyhZfGloDhT4i5tpepI8qiL7v/SryaaDLDsMJO4GA==
X-Google-Smtp-Source: ABdhPJyjHA4iFeqAy6fUESp1Ry6/2rgFuNAu5VcX4yurvkUzDtK+CAIJ0TmS265dTLW/4lAo5ceVjBm361BQajmoWzo=
X-Received: by 2002:a05:6820:38f:: with SMTP id
 r15mr4786280ooj.62.1616521506198; 
 Tue, 23 Mar 2021 10:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-1-jason@jlekstrand.net>
 <20210319223856.2983244-5-jason@jlekstrand.net>
 <b462561b-6340-fdf3-6b1a-e0370bfe090c@linux.intel.com>
 <CAOFGe97y67n4EPb6745QsJdz=ERMn3K-gsLR8Qjmemp92nwMoQ@mail.gmail.com>
 <963d089f-a08a-c3e7-4497-6f7d27b18520@linux.intel.com>
In-Reply-To: <963d089f-a08a-c3e7-4497-6f7d27b18520@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 12:44:52 -0500
Message-ID: <CAOFGe96dUYqXc5F+t8gMQ=xNfdo32q=78wwUoYWFruUqXvyz-g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Implement SINGLE_TIMELINE with
 a syncobj
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 4:35 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 22/03/2021 16:10, Jason Ekstrand wrote:
> > On Mon, Mar 22, 2021 at 7:28 AM Tvrtko Ursulin
>
> [snip]
>
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >>> index 96403130a373d..2c56796f6a71b 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> >>> @@ -3295,6 +3295,15 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >>>                goto err_vma;
> >>>        }
> >>>
> >>> +     if (eb.gem_context->syncobj) {
> >>> +             struct dma_fence *fence;
> >>> +
> >>> +             fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
> >>
> >> Who drops this reference?
> >
> > i915_request_await_dma_fence() below consumes a reference.
>
> Not sure, please check on difference wrt input fence handling.

Gah.  You were right.  It takes a reference if it needs one.  I
thought I was being symmetric with the other syncobj usage but it was
well hidden inside our confusing tear-down paths.

> >>> +             err = i915_request_await_dma_fence(eb.request, fence);
> >>> +             if (err)
> >>> +                     goto err_ext;
> >>> +     }
> >>> +
> >>>        if (in_fence) {
> >>>                if (args->flags & I915_EXEC_FENCE_SUBMIT)
> >>>                        err = i915_request_await_execution(eb.request,
> >>> @@ -3351,6 +3360,12 @@ i915_gem_do_execbuffer(struct drm_device *dev,
> >>>                        fput(out_fence->file);
> >>>                }
> >>>        }
> >>> +
> >>> +     if (eb.gem_context->syncobj) {

At Daniel's request, I've wrapped these in unlikely()

> >>> +             drm_syncobj_replace_fence(eb.gem_context->syncobj,
> >>> +                                       &eb.request->fence);
> >>> +     }
> >>> +
> >>>        i915_request_put(eb.request);
> >>>
> >>>    err_vma:
> >>>
> >>
> >> So essentially moving the synchronisation to top level which is extra
> >> work, but given limited and questionable usage of the uapi may be
> >> acceptable. Need full picture on motivation to understand.
> >
> > For one thing, the GuC scheduler doesn't natively have a concept of
> > "timelines" which can be shared like this.  To work with the GuC
>
> Confused - neither does execlists. It is handled in common layer in
> i915. GuC scheduler has the same concept of one hw context is one
> timeline because that is the hw concept and not backend specific.
>
> > scheduler as currently proposed in DII, they've asked the media driver
> > to stop using this flag in favor of passing a sync file from batch to
> > batch.  If we want to slide GuC scheduling in smoothly, we've got to
> > keep it working.  This means either making timelines a concept there
> > or doing an emulation like this.
>
> Hm not aware and don't see that GuC backend can't or doesn't implement
> this. Perhaps this would be best discussed once GuC patches are posted.
>
> >> Semantics are also not 1:1 since dma fence context will be different.
> >
> > Could you elaborate?
>
> Exported dma fence context as an "timeline" id will be single with the
> current patch and multiple contexts with this implementation.
>
> Daniel also raised another difference caused by lack of serialisation
> due multiple tl->mutex here.
>
> I don't think this is important, it was never part of a contract what
> happens with racing execbufs, but it is definitely required covering
> both topics in the commit message.

I've updated the commit message as follows:

    drm/i915: Implement SINGLE_TIMELINE with a syncobj (v2)

    This API is entirely unnecessary and I'd love to get rid of it.  If
    userspace wants a single timeline across multiple contexts, they can
    either use implicit synchronization or a syncobj, both of which existed
    at the time this feature landed.  The justification given at the time
    was that it would help GL drivers which are inherently single-timeline.
    However, neither of our GL drivers actually wanted the feature.  i965
    was already in maintenance mode at the time and iris uses syncobj for
    everything.

    Unfortunately, as much as I'd love to get rid of it, it is used by the
    media driver so we can't do that.  We can, however, do the next-best
    thing which is to embed a syncobj in the context and do exactly what
    we'd expect from userspace internally.  This isn't an entirely identical
    implementation because it's no longer atomic if userspace races with
    itself by calling execbuffer2 twice simultaneously from different
    threads.  It won't crash in that case; it just doesn't guarantee any
    ordering between those two submits.

    Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
    advantages beyond mere annoyance.  One is that intel_timeline is no
    longer an api-visible object and can remain entirely an implementation
    detail.  This may be advantageous as we make scheduler changes going
    forward.  Second is that, together with deleting the CLONE_CONTEXT API,
    we should now have a 1:1 mapping between intel_context and
    intel_timeline which may help us reduce locking.

I hope that clears up some of the confusion and is less bothersome.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
