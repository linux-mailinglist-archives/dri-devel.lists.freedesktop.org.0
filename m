Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D3348D6A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 10:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A1E6ED02;
	Thu, 25 Mar 2021 09:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4621E6ECFE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 09:54:17 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so1357569ota.9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IZ/pWb17zU3PB2ypyOi4hIR8gSLbthAMKW6CUng+GhY=;
 b=SVWTNUlIJw9dEJO1ZHFFXP32UW35qVxiyemNDYOQ2+vHXnAaUYiE+wzFJCYHlmFRZu
 dQaaLBVhFowVUMnPdUjj3EAns55wSnGwT5ryY/VXEW4xvat1R1l83jeReTrCERuQ3LhN
 nBhyY26P4+zHH9SmZOFk4xB5+FG4BYO7WtsIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IZ/pWb17zU3PB2ypyOi4hIR8gSLbthAMKW6CUng+GhY=;
 b=RKTS63Q8lkxH8G6Gh1edcTyBSmxRJh7aHqakTUz8MOI/Uz5VeaAe1s/CePMKqnD3XO
 8Y2uA5bJMS5MF98HXWJZv2Jga0x3GZ25BCPwcRbiHjS+vLDlKLsq6Fsf4knFrg1fyTdw
 szQouvMZAyDehhLir0YwlSWp2dCGSmGao6uYmARbdT/+ZAeyXGSicauMgTrv3j+YuQjr
 srEazYcpRSsDc9qIS3F/sZbA3kfqhvvALQtx25vYy22D3B2+aMHB0dXffh/lUzwuW2Lx
 TFWZjmFCrb/u6UvYmnASn2Yk1ErT30wJkzhrpZM1iXeZEN8nla9vY5h4MqD7Mlsox9XJ
 Wtqg==
X-Gm-Message-State: AOAM533VOs+BAlGzuRK+AjjVQEEVsjLWwJdx7TXUWAi8JmHf+v5Cf+iw
 nRDgWh7u6VclRHkeyuBtjmblHLWKktjY/NSjqEC1Cg==
X-Google-Smtp-Source: ABdhPJwgvq/yTAEf1ptWVIp5GG+/6EAJikWYWiRTzvM+Pcb9DXq0IpFYAqiC7LG3eIGEfDK9MlPwrtJ08ETrdCjbnOk=
X-Received: by 2002:a9d:845:: with SMTP id 63mr4723571oty.303.1616666056455;
 Thu, 25 Mar 2021 02:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-5-jason@jlekstrand.net>
 <20210323175149.3390801-1-jason@jlekstrand.net>
 <6fa4f29f-a98e-b22b-ae0c-7df7e1bf71a7@linux.intel.com>
 <YFsL1ZQ3pkOHXZ9B@phenom.ffwll.local>
 <97de980a-8d19-aa0a-0598-628b9c874af2@linux.intel.com>
 <CAOFGe95AjxvkrAHcY_2CQxzEB+9ndmiP7mijyEWoPFHjZi+OMA@mail.gmail.com>
 <d0d48583-43eb-f91a-c928-543598e97d5e@linux.intel.com>
In-Reply-To: <d0d48583-43eb-f91a-c928-543598e97d5e@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Mar 2021 10:54:05 +0100
Message-ID: <CAKMK7uFArNuDJ17N89nFcHfFDhiQcqrnDBbs7GKFkAByb8CqPA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Implement SINGLE_TIMELINE with a
 syncobj (v2)
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 10:48 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 24/03/2021 17:18, Jason Ekstrand wrote:
> > On Wed, Mar 24, 2021 at 6:36 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 24/03/2021 09:52, Daniel Vetter wrote:
> >>> On Wed, Mar 24, 2021 at 09:28:58AM +0000, Tvrtko Ursulin wrote:
> >>>>
> >>>> On 23/03/2021 17:51, Jason Ekstrand wrote:
> >>>>> This API is entirely unnecessary and I'd love to get rid of it.  If
> >>>>> userspace wants a single timeline across multiple contexts, they can
> >>>>> either use implicit synchronization or a syncobj, both of which existed
> >>>>> at the time this feature landed.  The justification given at the time
> >>>>> was that it would help GL drivers which are inherently single-timeline.
> >>>>> However, neither of our GL drivers actually wanted the feature.  i965
> >>>>> was already in maintenance mode at the time and iris uses syncobj for
> >>>>> everything.
> >>>>>
> >>>>> Unfortunately, as much as I'd love to get rid of it, it is used by the
> >>>>> media driver so we can't do that.  We can, however, do the next-best
> >>>>> thing which is to embed a syncobj in the context and do exactly what
> >>>>> we'd expect from userspace internally.  This isn't an entirely identical
> >>>>> implementation because it's no longer atomic if userspace races with
> >>>>> itself by calling execbuffer2 twice simultaneously from different
> >>>>> threads.  It won't crash in that case; it just doesn't guarantee any
> >>>>> ordering between those two submits.
> >>>>>
> >>>>> Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
> >>>>> advantages beyond mere annoyance.  One is that intel_timeline is no
> >>>>> longer an api-visible object and can remain entirely an implementation
> >>>>> detail.  This may be advantageous as we make scheduler changes going
> >>>>> forward.  Second is that, together with deleting the CLONE_CONTEXT API,
> >>>>> we should now have a 1:1 mapping between intel_context and
> >>>>> intel_timeline which may help us reduce locking.
> >>>>
> >>>> Much, much better commit message although I still fail to understand where
> >>>> do you see implementation details leaking out. So for me this is still
> >>>> something I'd like to get to the bottom of.
> >
> > I didn't say "leaking".  I said it's no longer API-visible.  That's
> > just true.  It used to be a kernel object that userspace was unaware
> > of, then we added SINGLE_TIMELINE and userspace now has some influence
> > over the object.  With this patch, it's hidden again.  I don't get why
> > that's confusing.
>
> I am definitely glad we moved on from leaking to less dramatic wording,
> but it is still not API "visible" in so much struct file_operations * is
> not user visible in any negative way when you do open(2), being just
> implementation detail. But I give up.
>
> >>>> I would also mention the difference regarding fence context change.
> >
> > There are no fence context changes.  The fence that we stuff in the
> > syncobj is an i915 fence and the fence we pull back out is an i915
> > fence.  A syncobj is just a fancy wrapper for a dma_buf pointer.
>
> Change is in the dma_fence->context.
>
> Current code single timeline is one fence context. With this patch that
> is no longer the case.
>
> Not sure that it has any practical implications for the internal
> dma_fence code like is_later checks , haven't analysed it.

We merge fewer fences at the higher levels and rely more on the fence
dependency tracking of the scheduler frontend to sort stuff out.

> And sync fence info ioctl exposes this value to userspace which probably
> has no practical implications. Unless some indirect effect when merging
> fences.

Userspace can use that to do fence merging. Which is always only a
strict optimization. I'm not even sure whether Android does that or
not.

> Main point is that I think these are the things which need to be
> discussed in the commit message.

Yeah makes sense to add these as impact, next to the "we don't deal
with races anymore" part.
-Daniel

>
> >>>> And in general I would maintain this patch as part of a series which ends up
> >>>> demonstrating the "mays" and "shoulds".
> >>>
> >>> I disagree. The past few years we've merged way too much patches and
> >>> features without carefully answering the high level questions of
> >>> - do we really need to solve this problem
> >>> - and if so, are we really solving this problem in the right place
> >>>
> >>> Now we're quite in a hole, and we're not going to get out of this hole if
> >>> we keep applying the same standards that got us here. Anything that does
> >>> not clearly and without reservation the above two questions with "yes"
> >>> needs to be removed or walled off, just so we can eventually see which
> >>> complexity we really need, and what is actually superflous.
> >>
> >> I understand your general point but when I apply it to this specific
> >> patch, even if it is simple, it is neither removing the uapi or walling
> >> it off. So I see it as the usual review standard to ask to see what
> >> "mays" and "shoulds" actually get us in concrete terms.
> >
> > Instead of focusing on the term "leak", let's focus on this line of
> > the commit message instead:
> >
> >>   Second is that, together with deleting the CLONE_CONTEXT API,
> >> we should now have a 1:1 mapping between intel_context and
> >> intel_timeline which may help us reduce locking.
> >
> > Now, I've not written any patches yet which actually reduce the
> > locking.  I can try to look into that today.  I CC'd Maarten on the
> > first send of this because I was hoping he would have good intuition
> > about this.  It may be that this object will always have to require
> > some amount of locking if the scheduler has to touch them in parallel
> > with other stuff.  What I can say concretely, however, is that this
> > does reduce the sharing of an internal object even if it doesn't get
> > rid of it completely.  The one thing that is shared all over the place
> > with this patch is a syncobj which is explicitly designed for exactly
> > this sort of case and can be used and abused by as many threads as
> > you'd like.  That seems like it's going in the right direction.
> >
> > I can further weasel-word the commit message to make the above more
> > prominent if you'd like.
>
> I am not interested in making you weasel-word anything but reaching a
> consensus and what is actually true and accurate.
>
> Regards,
>
> Tvrtko



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
