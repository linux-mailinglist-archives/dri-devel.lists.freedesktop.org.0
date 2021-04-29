Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75936ED89
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 17:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666126F383;
	Thu, 29 Apr 2021 15:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE45F6F384
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 15:42:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id c22so15473376edn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDRjGIHZMZgWp5Z8wohiAu8P1nor4E2k7VYyEcFFUMQ=;
 b=OpIiyoaYrHZUP77u0S50dQ41e6oClfBB5uaE4DMt1SFHYjNxGJQkbBNxRlVZ3rNflI
 5aOcfVJFQ4n756ROyDSRf1wYo2Rv9kak6nj2jgAJaYBsenOifonhB/76+iRJl/niwlYf
 SOW6X/Jay2isIQTvwvXWX6AGjZrBEIOxgk/KIPMCJT90KEo4/P/0S7ZP7HXazSpaPl0B
 NSQ7/D9Px/VDwGeGz+69DTy+JqiQfzRGooC6aTAZUCgrS8i5kZFAILa6TH2QqkSueQwm
 pgyevzgjPwJ2TWwr7syqEJjuiBzFscm/WZBVZYNv/QGr6VOBTI1V/cHYH85waKlum7v+
 GJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDRjGIHZMZgWp5Z8wohiAu8P1nor4E2k7VYyEcFFUMQ=;
 b=AM03XcshtFh1jVaqXZCiMbCPdBUHBWE5MvujwEtOiBQQtFVMQhuasXwJoQ2ULkx4KZ
 Jqr33uT5AlTWNZA46Lou0hPXAs0p6kGSwVGYsXVE1HhNyEIXsg9z0tNSHkzRDpdb2TSa
 q4+mr85XkPnwr3ICDbnv1ak014OGc0rqaRd3wRwjVBY4Kc2zUilwGAGldXHi+KSS4OAd
 1wPpym5J8+rkRZxKcj14PWn2ER9I4T2A5yCeOdVXbI1lk1fcJhdgK6A9mYn5rewp7Zi/
 nUmaPNEwgfF5ilobpDpUcrlE/3Ea6pIwgfvsxjhCOEyf23y5LxZyRpHTgJKRMRI9NuCT
 xJLA==
X-Gm-Message-State: AOAM5321rs3Uot2a+z1Z6HtWTA8Kmo5eIn1ZS3/fTToiBHuoBHSd+5Up
 Phn1407I5/WaX1NLoLrCsezdlGdsmk0xFXaSt3zM6g==
X-Google-Smtp-Source: ABdhPJzRqClbsP8A94lHsTUJD6yqOebqwHZbL7aVgp6MZ5Kxu3BzF8Ho3X9c5lA/Kwwb3oXBiFsqcw0hjAh3dxqSqpI=
X-Received: by 2002:aa7:c049:: with SMTP id k9mr251146edo.56.1619710919513;
 Thu, 29 Apr 2021 08:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-9-jason@jlekstrand.net>
 <5d32114c-ff06-7ad3-3deb-b843ede7c89d@linux.intel.com>
 <YIqllu5RxC1di+yq@phenom.ffwll.local>
 <9681e7cc-b56e-f894-6384-85a23f47b4aa@linux.intel.com>
In-Reply-To: <9681e7cc-b56e-f894-6384-85a23f47b4aa@linux.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 10:41:47 -0500
Message-ID: <CAOFGe94gnnD7KyR00frfPs9BezaYK1OS5-kFJZzPzZWmbNdUoQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 08/21] drm/i915/gem: Disallow bonding of
 virtual engines
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

On Thu, Apr 29, 2021 at 7:54 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 29/04/2021 13:24, Daniel Vetter wrote:
> > On Wed, Apr 28, 2021 at 04:51:19PM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 23/04/2021 23:31, Jason Ekstrand wrote:
> >>> This adds a bunch of complexity which the media driver has never
> >>> actually used.  The media driver does technically bond a balanced engine
> >>> to another engine but the balanced engine only has one engine in the
> >>> sibling set.  This doesn't actually result in a virtual engine.
> >>
> >> For historical reference, this is not because uapi was over-engineered but
> >> because certain SKUs never materialized.
> >
> > Jason said that for SKU with lots of media engines media-driver sets up a
> > set of ctx in userspace with all the pairings (and I guess then load
> > balances in userspace or something like that). Tony Ye also seems to have
> > confirmed that. So I'm not clear on which SKU this is?
>
> Not sure if I should disclose it here. But anyway, platform which is
> currently in upstream and was supposed to be the first to use this uapi
> was supposed to have at least 4 vcs engines initially, or even 8 vcs + 4
> vecs at some point. That was the requirement uapi was designed for. For
> that kind of platform there were supposed to be two virtual engines
> created, with bonding, for instance parent = [vcs0, vcs2], child =
> [vcs1, vcs3]; bonds = [vcs0 - vcs1, vcs2 - vcs3]. With more engines the
> merrier.

I've added the following to the commit message:

    This functionality was originally added to handle cases where we may
    have more than two video engines and media might want to load-balance
    their bonded submits by, for instance, submitting to a balanced vcs0-1
    as the primary and then vcs2-3 as the secondary.  However, no such
    hardware has shipped thus far and, if we ever want to enable such
    use-cases in the future, we'll use the up-and-coming parallel submit API
    which targets GuC submission.

--Jason

> Userspace load balancing, from memory, came into the picture only as a
> consequence of balancing between two types of media pipelines which was
> either working around the rcs contention or lack of sfc, or both. Along
> the lines of - one stage of a media pipeline can be done either as GPGPU
> work, or on the media engine, and so userspace was deciding to spawn "a
> bit of these and a bit of those" to utilise all the GPU blocks. Not
> really about frame split virtual engines and bonding, but completely
> different load balancing, between gpgpu and fixed pipeline.

> > Or maybe the real deal is only future platforms, and there we have GuC
> > scheduler backend.
>
> Yes, because SKUs never materialised.
>
> > Not against adding a bit more context to the commit message, but we need
> > to make sure what we put there is actually correct. Maybe best to ask
> > Tony/Carl as part of getting an ack from them.
>
> I think there is no need - fact uapi was designed for way more engines
> than we got to have is straight forward enough.
>
> Only unasked for flexibility in the uapi was the fact bonding can
> express any dependency and not only N consecutive engines as media fixed
> function needed at the time. I say "at the time" because in fact the
> "consecutive" engines requirement also got more complicated / broken in
> a following gen (via fusing and logical instance remapping), proving the
> point having the uapi disassociated from the hw limitations of the _day_
> was a good call.
>
> Regards,
>
> Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
