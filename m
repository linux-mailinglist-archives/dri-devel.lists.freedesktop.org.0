Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E26722D429
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 05:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64016EA59;
	Sat, 25 Jul 2020 03:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295106EA59
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 03:12:52 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z5so6452104pgb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9Sv+mpmEc9cecqKsmATo9ohfdalYjthMVIOv9E7m6Io=;
 b=d4wQYgf1IFR5UmOFS+vrgWLPi42iQgFG+veVH4SJ0TYVaxDC6HKWZWugkdoyv7W5Rx
 TaSIDuh/tq8zKW34oSDYh9SWZ86m+80Lx0HKmz2Z4omtnTv9cOk9qSq2PpC2FWWuqNyk
 /ZVPLKBstqFfb3AgHA9V7QoQ/R3DtE1GQxzaRxFijN3qURBqzidSEssNZHgRsxk5zWhd
 pO+e/yHZ1WhN9n0cvIyLCVEi5uF4/GUZS0MfBoNp2vRoYkcczz/NY5DVpEn+PKCY4Ltj
 mXFU9i9RwYjdQKRH7QklCQKfFU3PgxxKnbrfVMWE0REo/OAjduOg19W3dREWyx11EvYA
 Eq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9Sv+mpmEc9cecqKsmATo9ohfdalYjthMVIOv9E7m6Io=;
 b=Ab1E3xnkqFTp+ArMtVzYuFRU2cDYCR5AT5XpkDn6e2HoN5ftFAiutShZR+C5sN4Gnr
 3BWvPn96QaPn4OkTpELq+y7VZwK10QdW2J4p5sNWzbbROIz/w52WxYvtDCJ1T9+WF9ix
 XB04cwvu41G4ridgfyssH/Nhia+oLn3kjCoW78nd7YichNnpCJiWlEPNN17D/37YnrM9
 tFFaR/bwZQWO4ZmewuuqTY74y/p33HcdKHlxKRkE7n4517HR5FVsQpQoNxLltNnmfQO9
 0DgEmTo8HaHIZJDoc1/jvURyI4lw57iS4LSIEIvkd0vWCoxj78WCPRXleaaGL7KKlMBl
 k2sw==
X-Gm-Message-State: AOAM530V3VBqlhS2hAjHKwn7n0BkPmCg3O9nqMM8maFKGaoqJkUlN7iO
 DmJp5YZP4UKM52IqQ5V6ILk=
X-Google-Smtp-Source: ABdhPJxshuzT3nHNdT/e6Wx0P+I8jNX6uQWiYIdptXTIkrKI0CMtYr088XEw9xwISS7rmPMx7Jl8wQ==
X-Received: by 2002:aa7:9419:: with SMTP id x25mr11790741pfo.67.1595646771675; 
 Fri, 24 Jul 2020 20:12:51 -0700 (PDT)
Received: from realwakka ([168.126.185.84])
 by smtp.gmail.com with ESMTPSA id y7sm6817411pjp.47.2020.07.24.20.12.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 20:12:50 -0700 (PDT)
Date: Sat, 25 Jul 2020 01:17:37 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200725011737.GA2851@realwakka>
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 22, 2020 at 05:17:05PM +0200, Daniel Vetter wrote:
> On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 07/22, daniel@ffwll.ch wrote:
> > > On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> > > > This patch adds a missing drm_crtc_vblank_put op to the pair
> > > > drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> > > >
> > > > It clears the execution of the following kms_cursor_crc subtests:
> > > > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> > > >    random, fast-moving])] - successful when running individually.
> > > > 2. pipe-A-cursor-dpms passes again
> > > > 3. pipe-A-cursor-suspend also passes
> > > >
> > > > The issue was initially tracked in the sequential execution of IGT
> > > > kms_cursor_crc subtest: when running the test sequence or one of its
> > > > subtests twice, the odd execs complete and the pairs get stuck in an
> > > > endless wait. In the IGT code, calling a wait_for_vblank before the start
> > > > of CRC capture prevented the busy-wait. But the problem persisted in the
> > > > pipe-A-cursor-dpms and -suspend subtests.
> > > >
> > > > Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> > > > in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> > > > wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> > > > enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> > > > blocking in the 2nd start of CRC capture, which may indicate that
> > > > something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> > > > the crc setup was able to sync things and free all kms_cursor_crc
> > > > subtests.
> > > >
> > > > Tracing and comparing a clean run with a blocked one:
> > > > - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> > > > - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> > > > started. Moreover, a series of vkms_vblank_simulate flow out until
> > > > disabling vblanks.
> > > > Also watching the steps of vkms_crtc_atomic_flush, when the very first
> > > > drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> > > > hand, when vblank_get succeeded, the subtest completed. Finally, checking
> > > > the flush steps: it increases counter to hold a vblank reference (get),
> > > > but there isn't a op to decreased it and release vblanks (put).
> > > >
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index ac85e17428f8..a99d6b4a92dd 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > > >
> > > >             spin_unlock(&crtc->dev->event_lock);
> > > >
> > > > +           drm_crtc_vblank_put(crtc);
> > >
> > > Uh so I reviewed this a bit more carefully now, and I dont think this is
> > > the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
> > >
> > >  * Caller must hold a vblank reference for the event @e acquired by a
> > >  * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
> > >
> > > So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
> > > for us. And that's the only case where we successfully acquired a vblank
> > > interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
> > > success for that function, failure negative error number) we directly send
> > > out the event.
> > >
> > > So something else fishy is going on, and now I'm totally confused why this
> > > even happens.
> > >
> > > We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
> > > we don't underflow the refcount, so it's also not that I think (except if
> > > this patch creates more WARNING backtraces).
> > >
> > > But clearly it changes behaviour somehow ... can you try to figure out
> > > what changes? Maybe print out the vblank->refcount at various points in
> > > the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
> > > is enabled/disabled ...
> >
> > :(
> >
> > I can check these, but I also have other suspicions. When I place the
> > drm_crct_vblank_put out of the if (at the end of flush), it not only solve
> > the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
> > doesn't appear anymore (a total cleanup). Just after:
> >
> > vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> >
> > looks like there is something stuck around here.
> 
> Hm do you have the full WARNING for this? Maybe this gives me an idea
> what's going wrong.
> 
> > Besides, there is a lock at atomic_begin:
> >
> >   /* This lock is held across the atomic commit to block vblank timer
> >    * from scheduling vkms_composer_worker until the composer is updated
> >    */
> >   spin_lock_irq(&vkms_output->lock);
> >
> > that seems to be released on atomic_flush and make me suspect something
> > missing on the composer update.
> 
> atomic_begin/atomic_flush are symmetric functions an always called
> around all the plane updates. So having the spin_lock in _begin and
> the spin_unlock in _flush should be symmetric and correct.
> 
> If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
> should immmediately give you a huge splat in dmesg if there's anything
> unbalanced with locking.
> 
> > I'll check all these things and come back with news (hope) :)
> 
> Have fun chasing stuff :-)
> 
> Cheers, Daniel
> 
> 
> >
> > Thanks,
> >
> > Melissa
> > >
> > > I'm totally confused about what's going on here now.
> > > -Daniel

Hi Daniel, Melissa.
I found something about this problem.
I traced vblank->refcount that it's important in the problem.
In normal case, first test run calls commit_tail() and enable vblank in 
atomic_flush(). in drm_vblank_get(), it enable vblank when refcount was zero.

in first test run, it disable crtc for cleanup test. drm_crtc_vblank_off() was
called by atomic_disable. in this function vblank's refcount was increased for
prevent subsequent drm_vblank_get() from re-enabling the vblank interrupt.
and refcount goes one not zero for next test run.

and next test run, drm_vblank_get() was called but it didn't enable vblank
because refcount was already one. drm_crtc_vblank_on() was called in next. but
it didn't enable vblank but just increase refcount only.

I think this is why this problem happen. don't know how to fix this correctly.
should we force to enable vblank after enabling crtc?

Thanks
-Sidong

> > >
> > > >             crtc->state->event = NULL;
> > > >     }
> > > >
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
