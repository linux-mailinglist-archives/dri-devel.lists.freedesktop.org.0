Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4822D89A
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 17:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7106E26F;
	Sat, 25 Jul 2020 15:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51636E26F
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 15:58:09 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id l27so2096557oti.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 08:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eMTeRctRE65sgGGEJ5FRo/hySDzTmJpJ4TGTKDrwgxs=;
 b=Yt7HaEgSQp8Wf85TszOP8/4HCHkOH9JPDy0kYTFyuuR89vnhlG/EfPVFmUvIvJAoQV
 XnKjWG27b0mWHz8wNpSruxWbBaH/TwAi7uSfdfD49c3L/93+fqDYlMvAXXItZXh1MwPT
 dbSLkHU+vbrSl3OSmmNpb4vMDYTWI0ehB0i1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eMTeRctRE65sgGGEJ5FRo/hySDzTmJpJ4TGTKDrwgxs=;
 b=UnAExl+zuzPN7+Ag6zvQPGPdhzE2JJ+3S0dzDAwlsf5G2PYmEXhWucl57ANgLPr90j
 4/ASiD0hfazlJsYSAIVlUiJbOHmpVbpuoAvVKVwS0vXUt51rYDeMT+uUAaOCbLXkRQVa
 ngx+wToKZUa71u6bHEzY+II/GEpFt9a132bExVQC1vm0PUyiuDlukH8oqGtzZLxRdTfe
 acrPcBBNzAnv1G9I6Iq31aHhLM/bQL/vuomwkKLFVqsd0WCsmYZajZhoj6SKQi3QOW41
 hkiT2s3R9fAfgypnxNDhFQ29LWM2TMSZ6P6pr1A8UwxIVMB74t/BErXIl+vf4chqhrtx
 K/kQ==
X-Gm-Message-State: AOAM532iZ8mE8sprXxP5II7CkbKNjuHzoIK7oJAgS+JNOelPL5EEDqNZ
 XRtVuwbj9LCoTREYG2J2HRIyPCubMhQ1v8ZV084oEQ==
X-Google-Smtp-Source: ABdhPJyXMLpNtufgbd1Zb5G1Ld1PbT33HGQa8aXs5e3QXYJHVRvWLUGTqDR7z+3bJtE8KDVaGcRgBk/xHAIZFUV+Mh4=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr13129583otr.303.1595692688776; 
 Sat, 25 Jul 2020 08:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
In-Reply-To: <20200725011737.GA2851@realwakka>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 25 Jul 2020 17:57:57 +0200
Message-ID: <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
To: Sidong Yang <realwakka@gmail.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 25, 2020 at 5:12 AM Sidong Yang <realwakka@gmail.com> wrote:
>
> On Wed, Jul 22, 2020 at 05:17:05PM +0200, Daniel Vetter wrote:
> > On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > >
> > > On 07/22, daniel@ffwll.ch wrote:
> > > > On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> > > > > This patch adds a missing drm_crtc_vblank_put op to the pair
> > > > > drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> > > > >
> > > > > It clears the execution of the following kms_cursor_crc subtests:
> > > > > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> > > > >    random, fast-moving])] - successful when running individually.
> > > > > 2. pipe-A-cursor-dpms passes again
> > > > > 3. pipe-A-cursor-suspend also passes
> > > > >
> > > > > The issue was initially tracked in the sequential execution of IGT
> > > > > kms_cursor_crc subtest: when running the test sequence or one of its
> > > > > subtests twice, the odd execs complete and the pairs get stuck in an
> > > > > endless wait. In the IGT code, calling a wait_for_vblank before the start
> > > > > of CRC capture prevented the busy-wait. But the problem persisted in the
> > > > > pipe-A-cursor-dpms and -suspend subtests.
> > > > >
> > > > > Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> > > > > in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> > > > > wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> > > > > enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> > > > > blocking in the 2nd start of CRC capture, which may indicate that
> > > > > something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> > > > > the crc setup was able to sync things and free all kms_cursor_crc
> > > > > subtests.
> > > > >
> > > > > Tracing and comparing a clean run with a blocked one:
> > > > > - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> > > > > - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> > > > > started. Moreover, a series of vkms_vblank_simulate flow out until
> > > > > disabling vblanks.
> > > > > Also watching the steps of vkms_crtc_atomic_flush, when the very first
> > > > > drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> > > > > hand, when vblank_get succeeded, the subtest completed. Finally, checking
> > > > > the flush steps: it increases counter to hold a vblank reference (get),
> > > > > but there isn't a op to decreased it and release vblanks (put).
> > > > >
> > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > index ac85e17428f8..a99d6b4a92dd 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > > > >
> > > > >             spin_unlock(&crtc->dev->event_lock);
> > > > >
> > > > > +           drm_crtc_vblank_put(crtc);
> > > >
> > > > Uh so I reviewed this a bit more carefully now, and I dont think this is
> > > > the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
> > > >
> > > >  * Caller must hold a vblank reference for the event @e acquired by a
> > > >  * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
> > > >
> > > > So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
> > > > for us. And that's the only case where we successfully acquired a vblank
> > > > interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
> > > > success for that function, failure negative error number) we directly send
> > > > out the event.
> > > >
> > > > So something else fishy is going on, and now I'm totally confused why this
> > > > even happens.
> > > >
> > > > We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
> > > > we don't underflow the refcount, so it's also not that I think (except if
> > > > this patch creates more WARNING backtraces).
> > > >
> > > > But clearly it changes behaviour somehow ... can you try to figure out
> > > > what changes? Maybe print out the vblank->refcount at various points in
> > > > the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
> > > > is enabled/disabled ...
> > >
> > > :(
> > >
> > > I can check these, but I also have other suspicions. When I place the
> > > drm_crct_vblank_put out of the if (at the end of flush), it not only solve
> > > the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
> > > doesn't appear anymore (a total cleanup). Just after:
> > >
> > > vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> > >
> > > looks like there is something stuck around here.
> >
> > Hm do you have the full WARNING for this? Maybe this gives me an idea
> > what's going wrong.
> >
> > > Besides, there is a lock at atomic_begin:
> > >
> > >   /* This lock is held across the atomic commit to block vblank timer
> > >    * from scheduling vkms_composer_worker until the composer is updated
> > >    */
> > >   spin_lock_irq(&vkms_output->lock);
> > >
> > > that seems to be released on atomic_flush and make me suspect something
> > > missing on the composer update.
> >
> > atomic_begin/atomic_flush are symmetric functions an always called
> > around all the plane updates. So having the spin_lock in _begin and
> > the spin_unlock in _flush should be symmetric and correct.
> >
> > If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
> > should immmediately give you a huge splat in dmesg if there's anything
> > unbalanced with locking.
> >
> > > I'll check all these things and come back with news (hope) :)
> >
> > Have fun chasing stuff :-)
> >
> > Cheers, Daniel
> >
> >
> > >
> > > Thanks,
> > >
> > > Melissa
> > > >
> > > > I'm totally confused about what's going on here now.
> > > > -Daniel
>
> Hi Daniel, Melissa.
> I found something about this problem.
> I traced vblank->refcount that it's important in the problem.
> In normal case, first test run calls commit_tail() and enable vblank in
> atomic_flush(). in drm_vblank_get(), it enable vblank when refcount was zero.
>
> in first test run, it disable crtc for cleanup test. drm_crtc_vblank_off() was
> called by atomic_disable. in this function vblank's refcount was increased for
> prevent subsequent drm_vblank_get() from re-enabling the vblank interrupt.
> and refcount goes one not zero for next test run.
>
> and next test run, drm_vblank_get() was called but it didn't enable vblank
> because refcount was already one. drm_crtc_vblank_on() was called in next. but
> it didn't enable vblank but just increase refcount only.
>
> I think this is why this problem happen. don't know how to fix this correctly.
> should we force to enable vblank after enabling crtc?

Hm, between drm_crtc_vblank_off and drm_crtc_vblank_on
drm_crtc_vblank_get should fail (and leave the refcount unchanged).
It's convoluted logic, but the check for vblank->enabled should catch
that and return -EINVAL for this case. Does that not happen?

It would indeed explain the bug (I think, I've been wrong way too many
times with this).
-Daniel

>
> Thanks
> -Sidong
>
> > > >
> > > > >             crtc->state->event = NULL;
> > > > >     }
> > > > >
> > > > > --
> > > > > 2.27.0
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
