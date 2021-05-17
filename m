Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DF3383831
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 17:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474E56E095;
	Mon, 17 May 2021 15:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E386E095
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 15:51:22 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id w22so6881133oiw.9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RS3DL77rx8x0bDrqlU8tMTHG7LF42IFlyF4YWNMdVVQ=;
 b=F0l85BwYlvjJwYvmxf9kNm2m9Aq3Ytr2ZwuiwamYKVrK397qBh00X0ltYeLb20jm74
 jZM4vs+e5a14qe95OwbqPVKcbbVt3SvkizgCNT3oJoaypEyFLmnaIhBhULSKRgnw2kRw
 CtJtov3fA3VL9vlBSLNm2B82lo0J8S7gkl6eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RS3DL77rx8x0bDrqlU8tMTHG7LF42IFlyF4YWNMdVVQ=;
 b=sYQBoKa4fZ3J4bnMLnlosfKqjZwVOmYHTIe87yeatxfYj29qjzqLgcNQUSiXUKyV9E
 ldUCrbaudJpQfT3S5/6np4sYulbzqJfg/9NyZO/baFXL7TnnQNRmz72s8gm17MKq004r
 2GKd/crNRrQHtvJz2kJvxq27rycXKHYa3NLv38fE7bfhrqo4bvQyg7ReRcsTZ217a5lr
 gadz4OWT6BuuKJ4kOurfFzIz2iHKUnbx7quzvHs7+KtDg+eDaRSvBin7vH40D8bB8KK8
 EugA3HtcYK0QxoItaLTvYpMe6jPmfOALw7DSIg+E+6YjCokKeChjO0StaGwPv65RForj
 Gi/g==
X-Gm-Message-State: AOAM5306ljuPfYbHvroikO6UqSI7kSNxsOboVShBR1hwxzpvGHFDrVzn
 1455zhux63Mh2Jj6teWNax6lJJF/Rfz/yLH9vEUM9haUiZI=
X-Google-Smtp-Source: ABdhPJxab2oPUp6jiAKXVXCTUsu3MiHO6d+NsgSE+f2cVPWHe1sPPHdwX4FDnAKVJ79S2oLnxmz8ukzZS+PZJRJUs/Q=
X-Received: by 2002:aca:1b10:: with SMTP id b16mr352524oib.128.1621266681883; 
 Mon, 17 May 2021 08:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210507083521.2406201-1-tvrtko.ursulin@linux.intel.com>
 <YJlXeMkMG7Xt0zlA@phenom.ffwll.local>
 <9fbcff85-f36c-fc90-eeb6-aa58c85a920f@linux.intel.com>
 <YKKH1rRy2HN4Gnr8@phenom.ffwll.local>
 <596bdfdd-df65-2166-4839-86e6c3308772@linux.intel.com>
In-Reply-To: <596bdfdd-df65-2166-4839-86e6c3308772@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 17 May 2021 17:51:10 +0200
Message-ID: <CAKMK7uE9mUmROxMV=-2dxqpzVg2uJX++pMisyUz_UtmKv+Utdg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Stop propagating fence errors by default
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 intel-gfx <Intel-gfx@lists.freedesktop.org>,
 Marcin Slusarz <marcin.slusarz@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 5:33 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 17/05/2021 16:12, Daniel Vetter wrote:
> > On Tue, May 11, 2021 at 10:05:27AM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 10/05/2021 16:55, Daniel Vetter wrote:
> >>> On Fri, May 07, 2021 at 09:35:21AM +0100, Tvrtko Ursulin wrote:
> >>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>>
> >>>> This is an alternative proposed fix for the below references bug report
> >>>> where dma fence error propagation is causing undesirable change in
> >>>> behaviour post GPU hang/reset.
> >>>>
> >>>> Approach in this patch is to simply stop propagating all dma fence errors
> >>>> by default since that seems to be the upstream ask.
> >>>>
> >>>> To handle the case where i915 needs error propagation for security, I add
> >>>> a new dma fence flag DMA_FENCE_FLAG_PROPAGATE_ERROR and make use of it in
> >>>> the command parsing chain only.
> >>>>
> >>>> It sounds a plausible argument that fence propagation could be useful in
> >>>> which case a core flag to enable opt-in should be universally useful.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>>> Reported-by: Marcin Slusarz <marcin.slusarz@intel.com>
> >>>> Reported-by: Miroslav Bendik
> >>>> References: 9e31c1fe45d5 ("drm/i915: Propagate errors on awaiting already signaled fences")
> >>>> References: https://gitlab.freedesktop.org/drm/intel/-/issues/3080
> >>>> Cc: Jason Ekstrand <jason.ekstrand@intel.com>
> >>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>> ---
> >>>>    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 ++
> >>>>    drivers/gpu/drm/i915/i915_sw_fence.c           | 8 ++++----
> >>>>    drivers/gpu/drm/i915/i915_sw_fence.h           | 8 ++++++++
> >>>>    include/linux/dma-fence.h                      | 1 +
> >>>
> >>> I still don't like this, least because we still introduce the concept of
> >>> error propagation to dma-fence (but hey only in i915 code, which is
> >>> exactly the kind of not-really-upstream approach we got a major chiding
> >>> for).
> >>>
> >>> The only thing this does is make it explicitly opt-in instead opt-out,
> >>> like the first fix. The right approach is imo still to just throw it out,
> >>> and instead make the one error propagation we really need very, very
> >>> explicit. Instead of hiding it behind lots of magic.
> >>>
> >>> The one error propagation we need is when the cmd parser work fails, it
> >>> must cancel it's corresponding request to make sure the batchbuffer
> >>> doesn't run. This should require about 2 lines in total:
> >>>
> >>> - one line to store the request so that the cmd parser work can access it.
> >>>     No refcounting needed, because the the request cannot even start (much
> >>>     less get freed) before the cmd parser has singalled its fence
> >>>
> >>> - one line to kill the request if the parsing fails. Maybe 2 if you
> >>>     include the if condition. I have no idea how that's done since I'm
> >>>     honestly lost how the i915 scheduler decides whether to run a batch or
> >>>     not. I'm guessing we have a version of this for the ringbuffer and the
> >>>     execlist backend (if not maybe gen7 cmdparser is broken?)
> >>>
> >>> I don't see any need for magic behind-the-scenes propagation of such a
> >>> security critical error. Especially when that error propagation thing
> >>> caused security bugs of its own, is an i915-only feature, and not
> >>> motivated by any userspace/uapi requirements at all.
> >>
> >> I took this approach because to me propagating errors sounds more logical
> >> than ignoring them and I was arguing in the commit message that the
> >> infrastructure to enable that could be put in place as opt-in.
> >>
> >> I also do not see a lot of magic in this patch. Only thing, potentially the
> >> logic should be inverted so that the waiter marks itself as interested in
> >> receiving errors. That would probably make even more sense as a core
> >> concept.
> >>
> >> Has there been a wider discussion on this topic in the past? I am curious to
> >> know, even if propagation currently is i915 only, could other drivers be
> >> interested.
> >
> > There hasn't been. i915-gem team decided "this is a cool concept", which
> > resulted in a security bug. Now we're a few months in arguing whether a
> > cool-looking concept that leads to a security bug is maybe a good idea,
> > and whether we should sneak it in as a core concept to dma-buf.h without
> > any wider discussion on the concept.
> >
> >> Note that it adds almost nothing to the dma-buf common code about a single
> >> flag, and at some point (currently missing) documentation on the very flag.
> >
> > This is really not how upstream collaboration works, and it needs to stop.
> >
> > If you want this, start another thread arguing why this is a good idea,
> > fully decoupled from the security fix here.
>
> When I asked you whether you know there were past discussions on this
> topic, clearly the point of that was to figure out whether a new
> discussion needs to be started, or I need to go and read an existing one
> to get up to speed.
>
> I don't know how you interpreted that as an attempt to sneak anything
> in. And I don't know how I could have reliably figured out the answer to
> that question without asking. So colour me confused.
>
> To clarify on the security issue part - are you talking about
> https://gitlab.freedesktop.org/drm/intel/-/issues/3080, or the other
> security issue, the one which would be caused by simply reverting the
> error propagation in i915?

Both.

But what I really don't get is why we keep defending a "it's cool"
type of concept that accidentally caused a security bug as a
consequence that neither author nor reviewer managed to forsee.

If it accidentally causes a security bug and is otherwise not
justified by anything, it's not cool. There isn't anything left to
argue about here.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
