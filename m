Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31E630E109
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 18:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E715E6E9E2;
	Wed,  3 Feb 2021 17:29:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0479D6E9E2;
 Wed,  3 Feb 2021 17:29:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id y187so425771wmd.3;
 Wed, 03 Feb 2021 09:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=uPH5OblyFFbedYn9+BQ26mKadiTtGkT9N+onb3xhOy0=;
 b=K7IF/1gBBgpBlOlysJowcvI5gConMGam7j5lBs6jvW5iYqlAy1gmVQioHW+423xm/+
 Xffo1lnixMCvC63Mrn8E1dktjlq2miahH5y2ca2eCn/MAZbALPdmms6/ULBU10EtZEvA
 WrqRZ+OLMqJTpv8FvNJx4J8zcbpGHbbebnm1lk6Q2EPjnAXO+8mrsT2FoFXn1J3wIoRG
 BQAHQEceY/fnF78a4argjeueeCVj8iksR7F/OohUXzqXdUOR3ime8ZsgJe47Hi67KNRr
 KrN7I/TLvo3pqO7UvvIWrDKtT8WT9PE5FfRgSvB6Lt6Ene/ZgGvBd9K7lOuG6VRTrurh
 CKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=uPH5OblyFFbedYn9+BQ26mKadiTtGkT9N+onb3xhOy0=;
 b=QAJ1kFk8WYypi/Kw174Y0eKPPRXe3dBQhojjRpcqsuU/hrpKoPc5M2FwNQURCH8BVA
 8a8iFM0KXVS8ZO5e0xwoUFqDUCmJu5ObJ2dnMm+3IDUoWrwNdXcraL/w8mCu72XAZ1dP
 ULhCBnwSBW4ZWksRr3AgsVIRfM1QcAiN/yopGag0dc76sqpbAO3e/OdIMKL2uS5OcXDO
 D6ZGRZ+A/AA6ekr8UvJFw+yko5q0Z18deoRGMqDVCKfx5Yu+3sDD8hdvQiCPMd2KmPPU
 2gndFC8754J83S3PToQEkqLK4BKbeyuzfSW4UqNyC3/p9pV4hx3OSoMWodBFecGAreC0
 wnCQ==
X-Gm-Message-State: AOAM531WugiGReqRExMPQUHNxXiMnwICWMpmODuKcs/Gd+TXca8/vvdg
 UFLQmypOVHm9miiBIQWcOWC3wO2Xbf/49Q7xaVI=
X-Google-Smtp-Source: ABdhPJyuP59odfKVpAoppRDyEDedpUtAuo6qlMEYp84tlozuyrhH0Wad4rt6OCQy5dw+aR5JaDJk5ZoeS3INPdPMwNA=
X-Received: by 2002:a1c:8002:: with SMTP id b2mr3887677wmd.94.1612373361611;
 Wed, 03 Feb 2021 09:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20210125234901.2730699-1-swboyd@chromium.org>
 <YBlz8Go2DseRWuOa@phenom.ffwll.local>
 <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
 <YBp2h2cVXrF6lBno@phenom.ffwll.local>
In-Reply-To: <YBp2h2cVXrF6lBno@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 3 Feb 2021 09:29:09 -0800
Message-ID: <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
To: Rob Clark <robdclark@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Krishna Manikandan <mkrishn@codeaurora.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 3, 2021 at 2:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> > On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > > Lockdep complains about an AA deadlock when rebooting the device.
> > > >
> > > > ============================================
> > > > WARNING: possible recursive locking detected
> > > > 5.4.91 #1 Not tainted
> > > > --------------------------------------------
> > > > reboot/5213 is trying to acquire lock:
> > > > ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> > > >
> > > > but task is already holding lock:
> > > > ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> > > >
> > > > other info that might help us debug this:
> > > > Possible unsafe locking scenario:
> > > >
> > > > CPU0
> > > > ----
> > > > lock(&kms->commit_lock[i]);
> > > > lock(&kms->commit_lock[i]);
> > > >
> > > > *** DEADLOCK ***
> > > >
> > > > May be due to missing lock nesting notation
> > > >
> > > > 6 locks held by reboot/5213:
> > > > __arm64_sys_reboot+0x148/0x2a0
> > > > device_shutdown+0x10c/0x2c4
> > > > drm_atomic_helper_shutdown+0x48/0xfc
> > > > modeset_lock+0x120/0x24c
> > > > lock_crtcs+0x60/0xa4
> > > >
> > > > stack backtrace:
> > > > CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
> > > > Hardware name: Google Pompom (rev1) with LTE (DT)
> > > > Call trace:
> > > > dump_backtrace+0x0/0x1dc
> > > > show_stack+0x24/0x30
> > > > dump_stack+0xfc/0x1a8
> > > > __lock_acquire+0xcd0/0x22b8
> > > > lock_acquire+0x1ec/0x240
> > > > __mutex_lock_common+0xe0/0xc84
> > > > mutex_lock_nested+0x48/0x58
> > > > lock_crtcs+0x60/0xa4
> > > > msm_atomic_commit_tail+0x348/0x570
> > > > commit_tail+0xdc/0x178
> > > > drm_atomic_helper_commit+0x160/0x168
> > > > drm_atomic_commit+0x68/0x80
> > > >
> > > > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > > > the same lock, when they actually aren't. That's because we call
> > > > mutex_init() in msm_kms_init() and that assigns on static key for every
> > > > lock initialized in this loop. Let's allocate a dynamic number of
> > > > lock_class_keys and assign them to each lock so that lockdep can figure
> > > > out an AA deadlock isn't possible here.
> > > >
> > > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > >
> > > This smells like throwing more bad after initial bad code ...
> > >
> > > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
>
> Some technical on the patch itself: I think you want
> mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locking
> classes hand-rolled. It's defacto the same, but much more obviously
> correct since self-documenting.

hmm, yeah, that is a bit cleaner.. but this patch is already on
msm-next, maybe I'll add a patch on top to change it

> > > Yes I know the locking you're doing here is correct, but that goes to the
> > > second issue: Why is this needed? atomic_async_update helpers are supposed
> > > to take care of ordering fun like this, if they're not, we need to address
> > > things there. The problem that
> >
> > Maybe a better solution would be helper awareness of hw that has
> > double-buffered state and flush bits.. ie. something that looks a bit
> > more like the internal kms fxn ptrs. Currently the locking is
> > protecting something that the atomic helpers are not aware of, ie.
> > we've already written previous cursor updates to hw and are just
> > waiting until close to vblank to write the flush bits
> >
> > But, we've been over this before. I'd tried various approaches.. the
> > current scheme replaces seanpaul's earlier attempts to do it the
> > "helper" way.  The current implementation does the best job of
> > avoiding fps drops when the legacy cursor uapi is in play.  (And yes,
> > legacy cursor + atomic ioctls is maybe not the greatest, but it is
> > what it is.)
>
> I didn't read enough of the context and got confused, the flush handling
> looks all reasonable and obviously needs some locks to avoid races with
> updates.
>
> It still looks a bit strange that you need multi-crtc locks for cursor
> (generally this stuff is supposed to be solved with ordering) and why the
> async helpers don't work since msm has something that's pretty close
> itself. Atomic+cursor is a bit nasty, but if every driver hacks this
> together themselves then there's not much chance of this ever really
> working well across the board. And aside from the flush bit instead of
> automatic double buffering (which you're just emulating) there's not
> really anything special with msm afaics. So pretty sure that if this
> doesn't work for msm, it doesn't work anywhere else.

I did dig out a hub/keyboard/mouse for the one mtk device I have to
see how it behaves with cursor updates.. the fps drops are pretty
bad.. roughly the same as they were with msm prior to the current
"defer the flush bits" scheme.  Maybe I'm just more picky than others.

Better helper support for this sort of hw would be useful, since I
think it is not uncommon.  (At least omap is similar, I didn't really
look at mtk/rockchip.)  If I had a clone to handle the display side of
things, my clone would work on that ;-)

BR,
-R

> -Daniel
>
> >
> > BR,
> > -R
> >
> > >
> > > commit b3d91800d9ac35014e0349292273a6fa7938d402
> > > Author: Krishna Manikandan <mkrishn@codeaurora.org>
> > > Date:   Fri Oct 16 19:40:43 2020 +0530
> > >
> > >     drm/msm: Fix race condition in msm driver with async layer updates
> > >
> > > is _the_ reason we have drm_crtc_commit to track stuff, and Maxime has
> > > recently rolled out a pile of changes to vc4 to use these things
> > > correctly. Hacking some glorious hand-rolled locking for synchronization
> > > of updates really should be the exception for kms drivers, not the rule.
> > > And this one here doesn't look like an exception by far (the one legit I
> > > know of is the locking issues amdgpu has between atomic_commit_tail and
> > > gpu reset, and that one is really nasty, so not going to get fixed in
> > > helpers, ever).
> > >
> > > Cheers, Daniel
> > >
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
> > > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > > > index d8151a89e163..4735251a394d 100644
> > > > --- a/drivers/gpu/drm/msm/msm_kms.h
> > > > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > > > @@ -157,6 +157,7 @@ struct msm_kms {
> > > >        * from the crtc's pending_timer close to end of the frame:
> > > >        */
> > > >       struct mutex commit_lock[MAX_CRTCS];
> > > > +     struct lock_class_key commit_lock_keys[MAX_CRTCS];
> > > >       unsigned pending_crtc_mask;
> > > >       struct msm_pending_timer pending_timers[MAX_CRTCS];
> > > >  };
> > > > @@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
> > > >  {
> > > >       unsigned i, ret;
> > > >
> > > > -     for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> > > > -             mutex_init(&kms->commit_lock[i]);
> > > > +     for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
> > > > +             lockdep_register_key(&kms->commit_lock_keys[i]);
> > > > +             __mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
> > > > +                          &kms->commit_lock_keys[i]);
> > > > +     }
> > > >
> > > >       kms->funcs = funcs;
> > > >
> > > >
> > > > base-commit: 19c329f6808995b142b3966301f217c831e7cf31
> > > > --
> > > > https://chromeos.dev
> > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
