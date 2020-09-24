Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15244276B5C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 10:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B700A8941E;
	Thu, 24 Sep 2020 08:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A668941E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 08:04:24 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 95so2288387ota.13
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 01:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ck/d9PCn4a087JKvugChEa6rFjUKei4lwSoGB/P2TG4=;
 b=S6n6IVVQT7DVUZCclA0N2RKaNybO2BaF4pLRUzNUQNQkCV60aSfaW98nfMFZcSQGtB
 0cfzohBuTyu+0Mr9i3TaOQafmElf+s16AcJk3NFv/oGof85RNNqzpD6eNUDX3UzBI13m
 knqd/xR/abYIWwXyxjPMdbbAxIZBLXBcneElo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ck/d9PCn4a087JKvugChEa6rFjUKei4lwSoGB/P2TG4=;
 b=RZMBlR/y1eSySPpzqM2ppuVodyT/38q4KHI1Z/JPqwnIn2iJT6K8NHTyPXeYfW4lk5
 I6jHl4kwT+gNmAbHfZLieouHH9YPMIRuJaqGoRqZ67NK0X/tFR7ByOy0RkCPotSl/1lf
 4ot0oDdsgJcJLCvtzJzXzo08zLpIugiCR3875h1l3CNdWRM4F5TBq+4soHDUYPlGTuZC
 GOD2YfSekR8+NPDFvmBwrR+hSXQDCW3VRZG6DicGJ/2a+WA5JyQYVsEBJl5QvHhM1SYv
 3la214ivt+A/DMHu2jtOSl0HBB8oi+ixWWRMBGtK9WEP0jVUyx6+4sVRc4ZAjFz2PQFG
 d+6g==
X-Gm-Message-State: AOAM532ZDwgHK82HuopPuZKYv12l8ROlcpIhNY/2dG5KQocTrb/ctgrL
 to88nCZxhTxmKh40vNuM4njvxJ51Rh5nPhQJRfgfXw==
X-Google-Smtp-Source: ABdhPJxYfgeRgQfVGpMn54jxZqMVY1A09OoBmHGwWTxC+P0pac3xqBtLSJHGHVxzr9AKJ/dDyO2z39i3U9aPvZOtvoc=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr2404340otf.281.1600934663409; 
 Thu, 24 Sep 2020 01:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
 <20200923191724.GA62596@xpredator>
 <CAKMK7uH0WiEPP1H1DZPdE4mJdStTTtnZJQN5rjnkG_6va_1Tdg@mail.gmail.com>
 <20200924104101.63be1c13@eldfell>
In-Reply-To: <20200924104101.63be1c13@eldfell>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 24 Sep 2020 10:04:12 +0200
Message-ID: <CAKMK7uHwU0r7Z699qw3Y2HPuvzL3-B12fw3gDbdrxOX1V6iK2w@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: document and enforce rules around "spurious"
 EBUSY
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marius Vlad <marius.vlad@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 9:41 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Wed, 23 Sep 2020 22:01:25 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> > On Wed, Sep 23, 2020 at 9:17 PM Marius Vlad <marius.vlad@collabora.com> wrote:
> > >
> > > On Wed, Sep 23, 2020 at 05:18:52PM +0200, Daniel Vetter wrote:
> > > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > reconfiguring global resources).
>
> ...
>
> > > > @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> > > >               }
> > > >       }
> > > >
> > > > +     for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> > > > +             affected_crtc |= drm_crtc_mask(crtc);
> > > > +
> > > > +     /*
> > > > +      * For commits that allow modesets drivers can add other CRTCs to the
> > > > +      * atomic commit, e.g. when they need to reallocate global resources.
> > > > +      * This can cause spurious EBUSY, which robs compositors of a very
> > > > +      * effective sanity check for their drawing loop. Therefor only allow
> > > > +      * drivers to add unrelated CRTC states for modeset commits.
> > > > +      *
> > > > +      * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> > > > +      * so compositors know what's going on.
> > > > +      */
> > > > +     if (affected_crtc != requested_crtc) {
> > > > +             DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> > > > +                              requested_crtc, affected_crtc);
> > > > +             WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
> > > > +                  requested_crtc, affected_crtc);
> > > Previous patch had the warn on state->allow_modeset now is
> > > !state->allow_modeset. Is that correct?
> >
> > We need to fire a warning when allow_modeset is _not_ set. An earlier
> > version got that wrong, and yes that would have caused a _ton_ of
> > warnings on any fairly new intel platform.
> >
> > > I haven't followed the entire thread on this matter, but I guess the idea
> > > is that somehow the kernel would pass to userspace a CRTC mask of
> > > affected_crtc (somehow, we don't know how atm) and with it, userspace
> > > can then issue a new commit (this commit blocking) with those?
> >
> > Either that, or just use that to track all the in-flight drm events.
> > Userspace will get events for all the crtc, not just the one it asked
> > to update.
>
> Wait, does that happen already? Getting CRTC events for CRTCs userspace
> didn't include in the atomic commit?

Yeah I'm pretty sure. With the affected_crtc mask you could update
your internal book-keeping to catch these, which should also prevent
all the spurious EBUSY. But I'm not entirely sure, I just read the
code, haven't tested.

> That could explain why Weston freaks out in
> https://gitlab.freedesktop.org/wayland/weston/-/issues/435

Hm it's strange that you first get an EBUSY, and only on the next
modeset get the spurious event. You should get one already on the
first modeset.
-Daniel

>
>
> Thanks,
> pq
>
>
> > If that's easier to do by re-issuing the commit with the
> > full set of crtc, then I guess that's an option. But not required (I
> > think at least, would need to test that to make sure).
> > -Daniel
> >
> > > > +     }
> > > > +
> > > >       return 0;
> > > >  }
> > > >  EXPORT_SYMBOL(drm_atomic_check_only);



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
