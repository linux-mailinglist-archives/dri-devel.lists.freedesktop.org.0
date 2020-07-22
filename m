Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E84229B1D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 17:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7608E6E822;
	Wed, 22 Jul 2020 15:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38756E822
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 15:17:17 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id t18so2022594otq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GFIb9RkIl/5PngvU9D0g83i5c49gu3ClHdgFBkg+KM8=;
 b=RXUSEw8qJFw8zLM/pCnMRbbGAaNGa6zJKqY2tKmsL3PX1BCaa3s3lIOXS2gBkQs1UB
 dfezQ5FiOvR54RgsynRvuMmNUJqxnTxnC8kS3N1z5b7efvEqVJ7/2vT9mF4SDvhmnzDg
 efRMbUpNZ1UUrXfwqg3k4U7dyLaEdiKBtaY0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GFIb9RkIl/5PngvU9D0g83i5c49gu3ClHdgFBkg+KM8=;
 b=Kq6aNOJbT9t2RNQGaGL8vYHK0Ezkp5r2NEUAQF6/OH9h0G57t0XT6GecND167JpGjw
 MUaSYClbpd5z/nUjRb1+napGKgMlvlawpuLzR0jYeS4RlNAzGwdTx8YrXwup+AMhFakc
 Ex9wZ3OYX8Ej010vxUHfR06Ix4Hk/wM4AwUFo7LPZOg6ernlwokJ/OPULpt3qOTPyY9j
 xi68saiplQ2FYQYPvBlufV25SGmDAUAFdHk15Xk6ru4hlzvPqPDuiftOmoOdiO1+NYif
 9w3XdIm/KuJfywT1vrzAL0j0xP7aevpIWsrUZZxKVmOPslLeZJaGH0ODhJ0st7v7q4+A
 qqzg==
X-Gm-Message-State: AOAM531fnRnJOxbryxUYbU61kkkdMXIHtADuyxCXuXJb2NoP/q3rJxVL
 KJpCd6BQ3DIIkLZlN2v2/rWy+BFuBYZ0JMCGYi+n8Q==
X-Google-Smtp-Source: ABdhPJwq097xNK22VXYcucjcITK4+EiOAQwRfLVk02HO2+jzyTqyuSkROCzJkE/yY+59ufwNy6k+Z3mUhliCdhF0J+c=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr366916otr.303.1595431036827; 
 Wed, 22 Jul 2020 08:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
In-Reply-To: <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 22 Jul 2020 17:17:05 +0200
Message-ID: <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
To: Melissa Wen <melissa.srw@gmail.com>
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

On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> On 07/22, daniel@ffwll.ch wrote:
> > On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> > > This patch adds a missing drm_crtc_vblank_put op to the pair
> > > drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> > >
> > > It clears the execution of the following kms_cursor_crc subtests:
> > > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> > >    random, fast-moving])] - successful when running individually.
> > > 2. pipe-A-cursor-dpms passes again
> > > 3. pipe-A-cursor-suspend also passes
> > >
> > > The issue was initially tracked in the sequential execution of IGT
> > > kms_cursor_crc subtest: when running the test sequence or one of its
> > > subtests twice, the odd execs complete and the pairs get stuck in an
> > > endless wait. In the IGT code, calling a wait_for_vblank before the start
> > > of CRC capture prevented the busy-wait. But the problem persisted in the
> > > pipe-A-cursor-dpms and -suspend subtests.
> > >
> > > Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> > > in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> > > wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> > > enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> > > blocking in the 2nd start of CRC capture, which may indicate that
> > > something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> > > the crc setup was able to sync things and free all kms_cursor_crc
> > > subtests.
> > >
> > > Tracing and comparing a clean run with a blocked one:
> > > - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> > > - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> > > started. Moreover, a series of vkms_vblank_simulate flow out until
> > > disabling vblanks.
> > > Also watching the steps of vkms_crtc_atomic_flush, when the very first
> > > drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> > > hand, when vblank_get succeeded, the subtest completed. Finally, checking
> > > the flush steps: it increases counter to hold a vblank reference (get),
> > > but there isn't a op to decreased it and release vblanks (put).
> > >
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > index ac85e17428f8..a99d6b4a92dd 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > >
> > >             spin_unlock(&crtc->dev->event_lock);
> > >
> > > +           drm_crtc_vblank_put(crtc);
> >
> > Uh so I reviewed this a bit more carefully now, and I dont think this is
> > the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
> >
> >  * Caller must hold a vblank reference for the event @e acquired by a
> >  * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
> >
> > So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
> > for us. And that's the only case where we successfully acquired a vblank
> > interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
> > success for that function, failure negative error number) we directly send
> > out the event.
> >
> > So something else fishy is going on, and now I'm totally confused why this
> > even happens.
> >
> > We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
> > we don't underflow the refcount, so it's also not that I think (except if
> > this patch creates more WARNING backtraces).
> >
> > But clearly it changes behaviour somehow ... can you try to figure out
> > what changes? Maybe print out the vblank->refcount at various points in
> > the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
> > is enabled/disabled ...
>
> :(
>
> I can check these, but I also have other suspicions. When I place the
> drm_crct_vblank_put out of the if (at the end of flush), it not only solve
> the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
> doesn't appear anymore (a total cleanup). Just after:
>
> vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
>
> looks like there is something stuck around here.

Hm do you have the full WARNING for this? Maybe this gives me an idea
what's going wrong.

> Besides, there is a lock at atomic_begin:
>
>   /* This lock is held across the atomic commit to block vblank timer
>    * from scheduling vkms_composer_worker until the composer is updated
>    */
>   spin_lock_irq(&vkms_output->lock);
>
> that seems to be released on atomic_flush and make me suspect something
> missing on the composer update.

atomic_begin/atomic_flush are symmetric functions an always called
around all the plane updates. So having the spin_lock in _begin and
the spin_unlock in _flush should be symmetric and correct.

If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
should immmediately give you a huge splat in dmesg if there's anything
unbalanced with locking.

> I'll check all these things and come back with news (hope) :)

Have fun chasing stuff :-)

Cheers, Daniel


>
> Thanks,
>
> Melissa
> >
> > I'm totally confused about what's going on here now.
> > -Daniel
> >
> > >             crtc->state->event = NULL;
> > >     }
> > >
> > > --
> > > 2.27.0
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
