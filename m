Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0B23420C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 11:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A9C6EA35;
	Fri, 31 Jul 2020 09:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6636F6EA35
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 09:08:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so27332459wrw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 02:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=xx3E2zFe3SjFUEBMV5KIOoONAaghqSbYsab+7FmwohE=;
 b=D2ts8DuUDhDw/3Ymi/qGyi8+xsmgV4DbrR+lg3y6/mgXi2Do9CDT/X/BHZJ73YPidg
 MgdzDOP2rF0s9wYuTRoq3uLJqVVGOZk+ZU/5PJ9OD7fZOnEe51foBDPCPIAxNai8RI8W
 54gvS86yH86W4qxp2PErFBaZhTUbH1azbYgAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=xx3E2zFe3SjFUEBMV5KIOoONAaghqSbYsab+7FmwohE=;
 b=EFq2SDhOVVAn410nR7f0/28MluedB+KQqb3mwfz3/V7m/MkIZsg0VGzfjt6wBeOafl
 UZGRQ6sQhtd5ArnDXobdjmbZTFbyS54ZmpQx1ub7j7QAiQTHjYVIEPpo+g1bLuLoKMF5
 0o24vTRU7RmpvxPwN7niZMZ5bmsmj6EAYG1VbQrDgQQgr2+ZWMyhB6OFNnaDHRjXzTcs
 zgBY0LfHSy0HOq7ly0220JELyOVqKLAc7xZJqekeU6+pEWDhfM939nj2WLnZGXfRiJkD
 A8B8e9XsPn4XYa3lRXj32TPHjXMZiSavLRd4WqGwCxL0cOIHNYgO6+6SoEWVvNQxSF23
 n6tw==
X-Gm-Message-State: AOAM533oELL2ofTvRNfvBGCK2MDWRXF4izLlECVLTh7NNOyBuFEnt0Vi
 mOB3GScq6lJBNd10WE07Smsnrg==
X-Google-Smtp-Source: ABdhPJzyYaQomEcynHMPpuRax4L9KrfHRM4/BxUiKHw8knAgsx4aB9gh1pAaUmyuR9UTJYlKuriLYg==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr2790193wrs.124.1596186517952; 
 Fri, 31 Jul 2020 02:08:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 3sm2152779wms.36.2020.07.31.02.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 02:08:37 -0700 (PDT)
Date: Fri, 31 Jul 2020 11:08:34 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200731090834.GR6419@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Sidong Yang <realwakka@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, twoerner@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-usp@googlegroups.com
References: <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
 <CAJeY4oGXbNbFQtBXSi8xo_mk48G1K7TOvxPqvRKFxGQxRnY=Wg@mail.gmail.com>
 <CAKMK7uEj=Se=cNwkapZtRLjrDAHpjJU_oOL7Y-2HyUaPn8vBnQ@mail.gmail.com>
 <20200730100901.daos4v6maqlcd2uj@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730100901.daos4v6maqlcd2uj@smtp.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 07:09:25AM -0300, Melissa Wen wrote:
> On 07/29, Daniel Vetter wrote:
> > On Wed, Jul 29, 2020 at 9:09 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > >
> > > Melissa Wen
> > >
> > > On Sat, Jul 25, 2020 at 3:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Sat, Jul 25, 2020 at 7:45 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > > >
> > > > > On 07/25, Daniel Vetter wrote:
> > > > > > On Sat, Jul 25, 2020 at 5:12 AM Sidong Yang <realwakka@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jul 22, 2020 at 05:17:05PM +0200, Daniel Vetter wrote:
> > > > > > > > On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On 07/22, daniel@ffwll.ch wrote:
> > > > > > > > > > On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> > > > > > > > > > > This patch adds a missing drm_crtc_vblank_put op to the pair
> > > > > > > > > > > drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> > > > > > > > > > >
> > > > > > > > > > > It clears the execution of the following kms_cursor_crc subtests:
> > > > > > > > > > > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> > > > > > > > > > >    random, fast-moving])] - successful when running individually.
> > > > > > > > > > > 2. pipe-A-cursor-dpms passes again
> > > > > > > > > > > 3. pipe-A-cursor-suspend also passes
> > > > > > > > > > >
> > > > > > > > > > > The issue was initially tracked in the sequential execution of IGT
> > > > > > > > > > > kms_cursor_crc subtest: when running the test sequence or one of its
> > > > > > > > > > > subtests twice, the odd execs complete and the pairs get stuck in an
> > > > > > > > > > > endless wait. In the IGT code, calling a wait_for_vblank before the start
> > > > > > > > > > > of CRC capture prevented the busy-wait. But the problem persisted in the
> > > > > > > > > > > pipe-A-cursor-dpms and -suspend subtests.
> > > > > > > > > > >
> > > > > > > > > > > Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> > > > > > > > > > > in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> > > > > > > > > > > wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> > > > > > > > > > > enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> > > > > > > > > > > blocking in the 2nd start of CRC capture, which may indicate that
> > > > > > > > > > > something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> > > > > > > > > > > the crc setup was able to sync things and free all kms_cursor_crc
> > > > > > > > > > > subtests.
> > > > > > > > > > >
> > > > > > > > > > > Tracing and comparing a clean run with a blocked one:
> > > > > > > > > > > - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> > > > > > > > > > > - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> > > > > > > > > > > started. Moreover, a series of vkms_vblank_simulate flow out until
> > > > > > > > > > > disabling vblanks.
> > > > > > > > > > > Also watching the steps of vkms_crtc_atomic_flush, when the very first
> > > > > > > > > > > drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> > > > > > > > > > > hand, when vblank_get succeeded, the subtest completed. Finally, checking
> > > > > > > > > > > the flush steps: it increases counter to hold a vblank reference (get),
> > > > > > > > > > > but there isn't a op to decreased it and release vblanks (put).
> > > > > > > > > > >
> > > > > > > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > > > > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > > > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > > > > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
> > > > > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > > > > > > > index ac85e17428f8..a99d6b4a92dd 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > > > > > > > @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > > > > > > > > > >
> > > > > > > > > > >             spin_unlock(&crtc->dev->event_lock);
> > > > > > > > > > >
> > > > > > > > > > > +           drm_crtc_vblank_put(crtc);
> > > > > > > > > >
> > > > > > > > > > Uh so I reviewed this a bit more carefully now, and I dont think this is
> > > > > > > > > > the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
> > > > > > > > > >
> > > > > > > > > >  * Caller must hold a vblank reference for the event @e acquired by a
> > > > > > > > > >  * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
> > > > > > > > > >
> > > > > > > > > > So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
> > > > > > > > > > for us. And that's the only case where we successfully acquired a vblank
> > > > > > > > > > interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
> > > > > > > > > > success for that function, failure negative error number) we directly send
> > > > > > > > > > out the event.
> > > > > > > > > >
> > > > > > > > > > So something else fishy is going on, and now I'm totally confused why this
> > > > > > > > > > even happens.
> > > > > > > > > >
> > > > > > > > > > We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
> > > > > > > > > > we don't underflow the refcount, so it's also not that I think (except if
> > > > > > > > > > this patch creates more WARNING backtraces).
> > > > > > > > > >
> > > > > > > > > > But clearly it changes behaviour somehow ... can you try to figure out
> > > > > > > > > > what changes? Maybe print out the vblank->refcount at various points in
> > > > > > > > > > the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
> > > > > > > > > > is enabled/disabled ...
> > > > > > > > >
> > > > > > > > > :(
> > > > > > > > >
> > > > > > > > > I can check these, but I also have other suspicions. When I place the
> > > > > > > > > drm_crct_vblank_put out of the if (at the end of flush), it not only solve
> > > > > > > > > the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
> > > > > > > > > doesn't appear anymore (a total cleanup). Just after:
> > > > > > > > >
> > > > > > > > > vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> > > > > > > > >
> > > > > > > > > looks like there is something stuck around here.
> > > > > > > >
> > > > > > > > Hm do you have the full WARNING for this? Maybe this gives me an idea
> > > > > > > > what's going wrong.
> > > > > > > >
> > > > > > > > > Besides, there is a lock at atomic_begin:
> > > > > > > > >
> > > > > > > > >   /* This lock is held across the atomic commit to block vblank timer
> > > > > > > > >    * from scheduling vkms_composer_worker until the composer is updated
> > > > > > > > >    */
> > > > > > > > >   spin_lock_irq(&vkms_output->lock);
> > > > > > > > >
> > > > > > > > > that seems to be released on atomic_flush and make me suspect something
> > > > > > > > > missing on the composer update.
> > > > > > > >
> > > > > > > > atomic_begin/atomic_flush are symmetric functions an always called
> > > > > > > > around all the plane updates. So having the spin_lock in _begin and
> > > > > > > > the spin_unlock in _flush should be symmetric and correct.
> > > > > > > >
> > > > > > > > If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
> > > > > > > > should immmediately give you a huge splat in dmesg if there's anything
> > > > > > > > unbalanced with locking.
> > > > > > > >
> > > > > > > > > I'll check all these things and come back with news (hope) :)
> > > > > > > >
> > > > > > > > Have fun chasing stuff :-)
> > > > > > > >
> > > > > > > > Cheers, Daniel
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > >
> > > > > > > > > Melissa
> > > > > > > > > >
> > > > > > > > > > I'm totally confused about what's going on here now.
> > > > > > > > > > -Daniel
> > > > > > >
> > > > > > > Hi Daniel, Melissa.
> > > > > > > I found something about this problem.
> > > > > > > I traced vblank->refcount that it's important in the problem.
> > > > > > > In normal case, first test run calls commit_tail() and enable vblank in
> > > > > > > atomic_flush(). in drm_vblank_get(), it enable vblank when refcount was zero.
> > > > > > >
> > > > > > > in first test run, it disable crtc for cleanup test. drm_crtc_vblank_off() was
> > > > > > > called by atomic_disable. in this function vblank's refcount was increased for
> > > > > > > prevent subsequent drm_vblank_get() from re-enabling the vblank interrupt.
> > > > > > > and refcount goes one not zero for next test run.
> > > > > > >
> > > > > > > and next test run, drm_vblank_get() was called but it didn't enable vblank
> > > > > > > because refcount was already one. drm_crtc_vblank_on() was called in next. but
> > > > > > > it didn't enable vblank but just increase refcount only.
> > > > > > >
> > > > > > > I think this is why this problem happen. don't know how to fix this correctly.
> > > > > > > should we force to enable vblank after enabling crtc?
> > > > > >
> > > > > > Hm, between drm_crtc_vblank_off and drm_crtc_vblank_on
> > > > > > drm_crtc_vblank_get should fail (and leave the refcount unchanged).
> > > > > > It's convoluted logic, but the check for vblank->enabled should catch
> > > > > > that and return -EINVAL for this case. Does that not happen?
> > > > > >
> > > > > > It would indeed explain the bug (I think, I've been wrong way too many
> > > > > > times with this).
> > > > > > -Daniel
> > > > > >
> > > > > Hi Daniel and Sidong,
> > > > >
> > > > > I don't know if it will be confusing, but I will try to explain in a
> > > > > little more detail (and newbie way) what I saw in this behavior of the
> > > > > refcount (similar to what Sidong evaluated).
> > > > >
> > > > > 1. Starting with the loading of vkms is:
> > > > > In vkms_init:
> > > > > After drm_vblank_init (refcount=0), it calls:
> > > > > vkms_modeset_init
> > > > > --> vkms_output_init
> > > > > ----> drm_mode_config_reset
> > > > > -------> vkms_atomic_crtc_reset
> > > > > (even more inside)--> drm_crtc_vblank_reset that bumps the refcount to
> > > > > prevent vblank_get to enable vblank (refcount=1)
> > > > >
> > > > > 2. So, when we start a subtest, vblank is still disabled and in
> > > > > commit_tail, commit_planes triggers a atomic_begin/flush->vblank_get that
> > > > > return -EINVAL because !vblank->enabled (refcount ends 1) and send_vblank;
> > > > > however the test fails before atomic_enable decrements refcount to 0 and
> > > > > reset timestamp.
> > > > > ** This warning also appears in this very first running:
> > > > > WARNING: CPU: 0 PID: 708 at drivers/gpu/drm/vkms/vkms_crtc.c:91 vkms_get_vblank_timestamp+0x41/0x50 [vkms]
> > > >
> > > > Hm yeah I guess that's something we should paper over a bit, but maybe
> > > > the bugfix will take care of that.
> > > >
> > > > > In the end, this sequence modeset_disable -> atomic_begin ->
> > > > > atomic_flush: refcount going from 0 to 1 and than drm_vblank_enable
> > > > > prepares to everything going well in the next subtest (because
> > > > > atomic_disable is not called).
> > > > >
> > > > > 3. It could be nice, but in the next subtest (with success), as refcount +
> > > > > vblank_enabled ok, after doind its job, it calls
> > > > > atomic_disable->vblank_off and here refcount ends 1 and vblank disabled
> > > > > (the problem returns).
> > > > > So, we have a kind of good turn and bad turn.
> > > > >
> > > > > I tried different things, but the only relatively stable result was
> > > > > putting the sequence modeset_disable + modeset_enables + commit_planes in
> > > > > the commit_tail. That didn't convince me and then I keep trying things.
> > > >
> > > > This actually sounds like a good idea, I had the same one. Doing it
> > > > this way should also resolve the WARNING you've pointed out I think?
> > >
> > > Hi Daniel,
> > >
> > > My uncertainty in this idea was related to a subtest, the cursor-suspend.
> > > Although the reordering solves most of the blocking in kms-cursor-crc, the
> > > suspend subtest fails because when vkms suspends, it disables vblank,
> > > and when it resumes, vblank is not enabled in time. In this subtest, there is
> > > a pipe-crc-start and adding a igt_wait_for_vblank solves... but again,
> > > I know it is not the real fix.
> > >
> > > Would be the case to develop a specific feature of suspend/resume in vkms?
> > > I mean, something to enable vblank when resume. I am trying to figure out how
> > > to develop it, but still without success.
> > 
> > Hm since it's all software I expected that the hrtimer will simply
> > continue to run as if nothing happened. For real hw we'd need to use
> > drm_mode_config_helper_suspend/resume, but for vkms I dont think
> > that's required. Is the vblank hrtimer not working after resume? Or is
> > it simply reporting a garbage timestamp and that's why the testcase
> > fails?
> 
> The testcase fails for the same timeout in waiting the first crc
> (already applying the change in the commit_tail sequence):
> 
> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: (power_dir = open("/sys/power", O_RDONLY)) >= 0
> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: get_supported_suspend_states(power_dir) & (1 << state)
> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: test == SUSPEND_TEST_NONE || faccessat(power_dir, "pm_test", R_OK | W_OK, 0) == 0
> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: !(state == SUSPEND_STATE_DISK && !intel_get_total_swap_mb())
> (kms_cursor_crc:732) igt_aux-DEBUG: Test requirement passed: ret == 0
> (kms_cursor_crc:732) igt_core-INFO: [cmd] rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jul 30 09:23:59 2020
> (kms_cursor_crc:732) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> (kms_cursor_crc:732) igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.
> 
> What I could check was, when suspend, vblanks are disabled (calling
> vkms_disable_vblank), and when resume, the testcase fails and only after
> the failure vblanks are enabled (vkms_enable_vblank) and
> hrtimer_init/starts.

Hm, what is disabling the vblank there? Can you grab a full backtrace for
that? I have no idea why that's even happening ...

> If I "force" enabling vblanks via testcase (adding a
> igt_wait_for_vblank before igt_pipe_crc_start), things work fine.
> This is why I thought about anticipating the restarting of activities by
> placing a vblank "wakeup" in a resume function. Or perhaps prevent vblank
> from being disabled when suspended, since that last attempt to place a
> vblank_put at the end of the flush made this test case (suspend) work,
> because it prevented the vblank from being disabled.
> 
> This failure in suspend subtest is so closer to the previous ones, that I
> was unsure if my attempt in fix by reordering commit_tail would be enough. 
> But maybe they are different situations that deserve different treats.
> Do you think restarting a vblank in resume can make sense for vkms?

tbh I'm just really confused what's going on :-/
-Daniel

> 
> Melissa
> > 
> > Not sure how to wire it up for fake drivers like vkms, but maybe doing
> > the suspend/resume like for real drivers helps. I think ideally we'd
> > try to attach a platform driver to our platform device we create (but
> > not sure how to do that).
> > -Daniel
> > 
> > >
> > > Melissa
> > > >
> > > > But I'm still wondering why after step 3 we don't get -EINVAL from
> > > > vblank_get() - after vblank_off() vblank->enabled should be false
> > > > again, getting us back to the same state as after 1. Is that not
> > > > happening?
> > > > -Daniel
> > > >
> > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > > -Sidong
> > > > > > >
> > > > > > > > > >
> > > > > > > > > > >             crtc->state->event = NULL;
> > > > > > > > > > >     }
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.27.0
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Daniel Vetter
> > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > http://blog.ffwll.ch
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
> > > > > > > > _______________________________________________
> > > > > > > > dri-devel mailing list
> > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > >
> > > >
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

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
