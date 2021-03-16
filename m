Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8A33E0A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 22:35:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8FE89ADC;
	Tue, 16 Mar 2021 21:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3923C89ABA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 21:35:21 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x135so35154621oia.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0V6idEL2dFI31HGEklwz+KMTTdsvOPV4u4MC4yyGBoQ=;
 b=GQyBZZlOulBULlPkFu8YUvGbL4LjSZ3WNRAzkU19wL8cnQPu9Q+o+acohfo2Kmw33W
 7UBNQpLi1kKPZrazDJk69LcMt6OGPPc3OO85Vqq7C62uUgUCmEmRtS/MZrqmdJszBA3z
 4BVwmVWHnwcyT4Zi4u99jE6fnoHoySBimZJ9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0V6idEL2dFI31HGEklwz+KMTTdsvOPV4u4MC4yyGBoQ=;
 b=F5VUPeu2sydMnK6SFEYF3BGVtDZWxxig9cvAfuJFLl3Vbq01qS8VR2Ph2adc8DbuS8
 0uFSIZKL48dPneEbJS9s4Ea7lpG6F96ulW+oWzJPH3AieNnhjxBNNdL9ZcvMFOdeIeaK
 zSYYMb2e88nK61h4f+MJz3SC8+Pi5VVZmT5acic6pu/kut5m0MEteuKRtPnZZA9wZuf+
 Fn71EEI00pRckbXHaE23aP8DIYgSpjfVMamLVISNPshQejdCueD/PCzKQ4aL/ghyyK4O
 /HxPis4t3zvHOV4tLpbyoqwInTjxm5lHPz+YRnGCPMtqTcrDdoqMwZo18QyTg0gY3oSJ
 +6/A==
X-Gm-Message-State: AOAM530VSz7bBuaNuWxjsICebjXjjB8r0fEADhnihW7yZr7icPGd3WJJ
 mmc53VZBmSPfRB8C7pB5VzDr81mswwFQmASqC1qtmA==
X-Google-Smtp-Source: ABdhPJx6N6GuqvBdFRheECM/ouRNeas4liEj9qHDhewi1HE+AShbur0xbPq//EQtgLQQIttvg8h9Ns3oIBfTqtPxe7c=
X-Received: by 2002:aca:eb56:: with SMTP id j83mr509128oih.14.1615930520470;
 Tue, 16 Mar 2021 14:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210302204132.12058-1-manasi.d.navare@intel.com>
 <20210303104744.2c064f09@eldfell> <20210303204433.GA15819@labuser-Z97X-UD5H>
 <20210304104223.6b3490bc@eldfell> <20210309005252.GA27491@labuser-Z97X-UD5H>
 <20210309111350.3be0543f@eldfell>
In-Reply-To: <20210309111350.3be0543f@eldfell>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 16 Mar 2021 22:35:09 +0100
Message-ID: <CAKMK7uEak_2YNDZpyho5bBhhYCvoXh6MoPNL6FmV9sU8oELGPA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic: Add the crtc to affected crtc only if
 uapi.enable = true
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
Cc: "Navare, Manasi" <manasi.d.navare@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Stone <daniels@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 9, 2021 at 10:14 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Mon, 8 Mar 2021 16:52:58 -0800
> "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
>
> > On Thu, Mar 04, 2021 at 10:42:23AM +0200, Pekka Paalanen wrote:
> > > On Wed, 3 Mar 2021 12:44:33 -0800
> > > "Navare, Manasi" <manasi.d.navare@intel.com> wrote:
> > >
> > > > On Wed, Mar 03, 2021 at 10:47:44AM +0200, Pekka Paalanen wrote:
> > > > > On Tue,  2 Mar 2021 12:41:32 -0800
> > > > > Manasi Navare <manasi.d.navare@intel.com> wrote:
> > > > >
> > > > > > In case of a modeset where a mode gets split across mutiple CRTCs
> > > > > > in the driver specific implementation (bigjoiner in i915) we wrongly count
> > > > > > the affected CRTCs based on the drm_crtc_mask and indicate the stolen CRTC as
> > > > > > an affected CRTC in atomic_check_only().
> > > > > > This triggers a warning since affected CRTCs doent match requested CRTC.
> > > > > >
> > > > > > To fix this in such bigjoiner configurations, we should only
> > > > > > increment affected crtcs if that CRTC is enabled in UAPI not
> > > > > > if it is just used internally in the driver to split the mode.
> > > > >
> > > > > Hi,
> > > > >
> > > > > I think that makes sense to me. Stealing CRTCs that are not currently
> > > > > used by the userspace (display server) should be ok, as long as that
> > > > > is completely invisible to userspace: meaning that it does not cause
> > > > > userspace to unexpectedly e.g. receive or miss per-crtc atomic
> > > > > completion events.
> > > >
> > > > Yes since we are only doing atomic_check_only() here, the stolen
> > >
> > > But the real not-test-only commit will follow if this test-only commit
> > > succeeds, and keeping the guarantees for the real commit are important.
> >
> > Hmm well after the actual real commit, since the second crtc is stolen
> > even though it is not being used for the display output, it is
> > used for joiner so the uapi.enable will be true after the real commit.
> >
> > so actually the assertion would fail in this case.
> >
> > @Ville @Danvet any suggestions here in that case?

That is very bad. We can't frob uapi state like that. I think that
calls for even more checks to make sure kms drivers who try to play
clever games don't get it wrong, so we probably need to check uapi
enable and active state in another mask before/after ->atomic_check
too. Or something like that.

> Hi,
>
> that is not what I was talking about, but sounds like you found a
> different problem. It seems like the problem you are talking about
> would be guaranteed to be hit if bigjoiner was used. Have you not
> tested this?
>
> However, I was talking about the real commit itself, not what happens
> on commits after it, see below.
>
> > > > crtc is completely invisible to the userspace and hence that is
> > > > indicated by uapi.enable which is not true for this stolen
> > > > crtc. However if allow modeset flag set, then it will do a full
> > > > modeset and indicate the uapi.enable for this stolen crtc as well
> > > > since that cannot be used for other modeset requested by userspace.
> > > >
> > > > >
> > > > > Can that also be asserted somehow, or does this already do that?
> > > >
> > > > Not clear what you want the assertion for? Could you elaborate
> > >
> > > As assertion that when the real atomic commit happens and then
> > > completion events are fired, they match exactly the affected crtcs mask.
>
> This is my concern and a question, although like I say below, only
> tangential to this patch.
>
> However, as this patch aims to allow bigjoiner usage, naturally the
> question will arise whether the completion events then match what
> userspace expects or not. Userspace does not expect completion events
> referring to the stolen CRTCs.

Yeah we also must make sure that we don't send out events for these
additional crtc in bigjoiner usage. Sounds like igt testing didn't
catch this, I think we need a lot more igts here to make sure all
these surprises don't happen.

Plus maybe triple-checking that drm_atomic_uapi.c makes sure we can't
send out events for stuff that userspace didn't ask for.
-Daniel

>
> > > I understand this may be off-topic for this particular patch, but since
> > > we are discussing the topic, such checks would be really nice. I'm
> > > curious if such checks already exist.
>
>
> Thanks,
> pq
>
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_atomic.c | 6 ++++--
> > > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > > > > index 5b4547e0f775..d7acd6bbd97e 100644
> > > > > > --- a/drivers/gpu/drm/drm_atomic.c
> > > > > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > @@ -1358,8 +1358,10 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> > > > > >               }
> > > > > >       }
> > > > > >
> > > > > > -     for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > > > > -             affected_crtc |= drm_crtc_mask(crtc);
> > > > > > +     for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > > > > > +             if (new_crtc_state->enable)
> > > > > > +                     affected_crtc |= drm_crtc_mask(crtc);
> > > > > > +     }
> > > > > >
> > > > > >       /*
> > > > > >        * For commits that allow modesets drivers can add other CRTCs to the
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
