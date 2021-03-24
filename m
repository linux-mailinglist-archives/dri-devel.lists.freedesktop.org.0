Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF1347F23
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E92D6EA4D;
	Wed, 24 Mar 2021 17:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99B6ECBA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:18:43 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id e7so28447606edu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vr2WNubRrh3Xqd2P5XtC/OH8B6bjo7bAIuTATV077zQ=;
 b=spMnOhxB4/nyc24274GAk/pSfpsKE3vxa8yzzWIkxufiNIz4/5CmBA8JRwRIFJhzU0
 MN/oIY0Fe+CtSd/NwA8p3ZJQotkO8DrSQSPEjaRRysMOfJW3Zx9bIPDcs3PPWD6Dznr9
 GElhWTVbvjbsS7PdYdXl/sbEzUZhcyPbHf+TT9AFsRwHGEXwILe0C+mBK8s5A9L2h6/4
 ER6Ob5toR6UAfGZrH365nU2m6pB0KE8DBtgbRPpScnIotJEB2A1YeqWfZKocibSB1q4l
 JDoSKbPmvsDmuqwlpavOiszlxxGeJMNiLPL1Ih/0SjmoB2hNsm5znJw41tceclgVF1vl
 cCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vr2WNubRrh3Xqd2P5XtC/OH8B6bjo7bAIuTATV077zQ=;
 b=h+97TRuG/YPzjTorUSgLLmAUY03l18yncOtnEpKCtMPl5M9RAbYiTTiidOEmdc00x1
 Tb3qj4IsrUxVSoEW0xaD09hvz7ZiXmuPROSrSU5ld2DSR+uZjINPDE4XWOmTIk/dx/5k
 Lja+CGWjNfFBRogCpqCun2QuwcFw8DJcL65Jt5Q+jfNsqlbBR5pABGQpyX1iHbWILWAq
 1GvOXPadFlBfXMQG5VRaurRkfLt5YxhL42qvPezDnPz5pHzqyFU4trMrqX620iXedmdA
 lmBfp0FxcrQKdq2wv2PZUa+X1CJG4CfV1EcHVpx+WO8kqOhLDVY7mpipfTCEFW/Kn37j
 ++Rg==
X-Gm-Message-State: AOAM5326f2KP+SqV25JASdZzPrcn3LsWyWMl0EisDd9wQhz3ya9eC83/
 7VTAIbvZ12SBivOa07xfXtZR1gDziehfxaDs3FjU6rpt29li8g==
X-Google-Smtp-Source: ABdhPJwXra10vUvE4XfhStOmag7nceFNa8UZUxj9ft9a0HYv3X9J2Drio+VjBeRXZkBC364NMYZX5/wK/0xVfgHUnaI=
X-Received: by 2002:aa7:d813:: with SMTP id v19mr4599766edq.213.1616606321557; 
 Wed, 24 Mar 2021 10:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210319223856.2983244-5-jason@jlekstrand.net>
 <20210323175149.3390801-1-jason@jlekstrand.net>
 <6fa4f29f-a98e-b22b-ae0c-7df7e1bf71a7@linux.intel.com>
 <YFsL1ZQ3pkOHXZ9B@phenom.ffwll.local>
 <97de980a-8d19-aa0a-0598-628b9c874af2@linux.intel.com>
In-Reply-To: <97de980a-8d19-aa0a-0598-628b9c874af2@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 24 Mar 2021 12:18:30 -0500
Message-ID: <CAOFGe95AjxvkrAHcY_2CQxzEB+9ndmiP7mijyEWoPFHjZi+OMA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Implement SINGLE_TIMELINE with a
 syncobj (v2)
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Wed, Mar 24, 2021 at 6:36 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 24/03/2021 09:52, Daniel Vetter wrote:
> > On Wed, Mar 24, 2021 at 09:28:58AM +0000, Tvrtko Ursulin wrote:
> >>
> >> On 23/03/2021 17:51, Jason Ekstrand wrote:
> >>> This API is entirely unnecessary and I'd love to get rid of it.  If
> >>> userspace wants a single timeline across multiple contexts, they can
> >>> either use implicit synchronization or a syncobj, both of which existed
> >>> at the time this feature landed.  The justification given at the time
> >>> was that it would help GL drivers which are inherently single-timeline.
> >>> However, neither of our GL drivers actually wanted the feature.  i965
> >>> was already in maintenance mode at the time and iris uses syncobj for
> >>> everything.
> >>>
> >>> Unfortunately, as much as I'd love to get rid of it, it is used by the
> >>> media driver so we can't do that.  We can, however, do the next-best
> >>> thing which is to embed a syncobj in the context and do exactly what
> >>> we'd expect from userspace internally.  This isn't an entirely identical
> >>> implementation because it's no longer atomic if userspace races with
> >>> itself by calling execbuffer2 twice simultaneously from different
> >>> threads.  It won't crash in that case; it just doesn't guarantee any
> >>> ordering between those two submits.
> >>>
> >>> Moving SINGLE_TIMELINE to a syncobj emulation has a couple of technical
> >>> advantages beyond mere annoyance.  One is that intel_timeline is no
> >>> longer an api-visible object and can remain entirely an implementation
> >>> detail.  This may be advantageous as we make scheduler changes going
> >>> forward.  Second is that, together with deleting the CLONE_CONTEXT API,
> >>> we should now have a 1:1 mapping between intel_context and
> >>> intel_timeline which may help us reduce locking.
> >>
> >> Much, much better commit message although I still fail to understand where
> >> do you see implementation details leaking out. So for me this is still
> >> something I'd like to get to the bottom of.

I didn't say "leaking".  I said it's no longer API-visible.  That's
just true.  It used to be a kernel object that userspace was unaware
of, then we added SINGLE_TIMELINE and userspace now has some influence
over the object.  With this patch, it's hidden again.  I don't get why
that's confusing.

> >> I would also mention the difference regarding fence context change.

There are no fence context changes.  The fence that we stuff in the
syncobj is an i915 fence and the fence we pull back out is an i915
fence.  A syncobj is just a fancy wrapper for a dma_buf pointer.

> >> And in general I would maintain this patch as part of a series which ends up
> >> demonstrating the "mays" and "shoulds".
> >
> > I disagree. The past few years we've merged way too much patches and
> > features without carefully answering the high level questions of
> > - do we really need to solve this problem
> > - and if so, are we really solving this problem in the right place
> >
> > Now we're quite in a hole, and we're not going to get out of this hole if
> > we keep applying the same standards that got us here. Anything that does
> > not clearly and without reservation the above two questions with "yes"
> > needs to be removed or walled off, just so we can eventually see which
> > complexity we really need, and what is actually superflous.
>
> I understand your general point but when I apply it to this specific
> patch, even if it is simple, it is neither removing the uapi or walling
> it off. So I see it as the usual review standard to ask to see what
> "mays" and "shoulds" actually get us in concrete terms.

Instead of focusing on the term "leak", let's focus on this line of
the commit message instead:

>  Second is that, together with deleting the CLONE_CONTEXT API,
> we should now have a 1:1 mapping between intel_context and
> intel_timeline which may help us reduce locking.

Now, I've not written any patches yet which actually reduce the
locking.  I can try to look into that today.  I CC'd Maarten on the
first send of this because I was hoping he would have good intuition
about this.  It may be that this object will always have to require
some amount of locking if the scheduler has to touch them in parallel
with other stuff.  What I can say concretely, however, is that this
does reduce the sharing of an internal object even if it doesn't get
rid of it completely.  The one thing that is shared all over the place
with this patch is a syncobj which is explicitly designed for exactly
this sort of case and can be used and abused by as many threads as
you'd like.  That seems like it's going in the right direction.

I can further weasel-word the commit message to make the above more
prominent if you'd like.

> I would be able to understand putting the uapi behind the "if gen > 12
> || is_discrete EINVAL", or whatever, since it is fair game to deprecate
> for any new platform or say GuC submission.
>
> Not doing simply that makes me worry there are still misunderstandings
> on what kind of problems were encountered with regards to
> intel_timeline, by work item this or work item that, and that there
> isn't still a confusion about what is the internal timeline object and
> what is the internal hwsp object. I feel there hasn't been full
> transparency on these technical issues which is why I think seeing the
> actual series which is supposed to build on top of this would be helpful.
>
> I even worry that we still have a big disconnect on whether this flag is
> leaking any internal implementation details out to userspace. If the
> commit message was reworded without actual agreement that implementation
> details are not exposed we will continue disagreeing going forward,
> which is not a good start.
>
> We exchanged so many emails on this but I don't feel we are getting
> anywhere so I really have no idea - obviously you will steamroll this in
> regardless so I don't think there is point to argue further.
>
> Regards,
>
> Tvrtko

> > +     if (unlikely(eb.gem_context->syncobj)) {
> > +             struct dma_fence *fence;
> > +
> > +             fence = drm_syncobj_fence_get(eb.gem_context->syncobj);
> > +             err = i915_request_await_dma_fence(eb.request, fence);
> > +             if (err)
> > +                     goto err_ext;
> > +             dma_fence_put(fence);
>
> I think put goes before the error bail.

Fixed locally.  It'll be in v3.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
