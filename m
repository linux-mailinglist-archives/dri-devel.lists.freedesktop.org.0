Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8A220D32
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 14:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854D66E030;
	Wed, 15 Jul 2020 12:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AF96E030
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 12:43:51 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id f16so2915685pjt.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MEa5w74m42sydYqVt+jkUha8QcX3LpQeVlKRuUnOhw8=;
 b=FpamnAnSv0Ufyf57K4ENGfuzBkUA+0mjCLhfO3oeT8zVIYdUbhk5O+N9aCrDrk0XmD
 OYCL4Y2cNz6esebqkYRAUpbl0/9AcxglV/vwrDaGkUghf2hEj0lC9ckLzPbqx8e1IVMn
 cEAT8IvfWCS3w1fRu6SkvltqzDHjIThTRN3DdoMEU7kIiOu3iHLWiQh0Y7fF7rODl/SL
 BfmEBcVTf/tVKB5eT23AldBY5VPds3H/qQV2QaQOhZU9/5hWEnWxQ0RV0BJxLqJ/8NY5
 6sSG55+o09RjsQfiF+m1uEUt03NGKD0fIfskM7evX2D1po6Ch3j+3lZK58NOi9ALxyX5
 WpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MEa5w74m42sydYqVt+jkUha8QcX3LpQeVlKRuUnOhw8=;
 b=EvVjekl1RSXfF91IJ0qImF9DNFlmn32Zsohf4ou6rkLmQBWNceNtgCpe79Mh0ndMpr
 xBPRnDhnL9nOmzVcfCsDcE26aOB3b+pzvSK64fCWiLSDFVtDcNsVngYvadkvTgRkkghH
 IlyZr57UZdP5pr5JrWSa+864OjvpSUlW75HI746lOeaFo24FQDNyW0XURnCFXdMdKCvD
 HM7moU3Z4SEgwg58q+YB5oIvnD1jeldV6c36+x5NLPjwdXvMMqWaIorwdMY3mKjWVmNA
 Ml1QmFgeO43WfDMwykgL7rGOJfXEBwyoXpR7vNbOMoR4zcKqNTNpoUEBQaJrJc9r5iil
 oRlw==
X-Gm-Message-State: AOAM530Zme+9WQgvFkZVg0fZ88KIBbphzYwE/5OAIb6ljHv+I0jXkRIY
 cx3RKG2y+UjJTP7AVRl2bi4=
X-Google-Smtp-Source: ABdhPJzIW8f9uDmWqlTZwBppiDAbZt3owNfbhDhPwibvJzHHTRdjqtM5iMeP3fGGk4b2OCMZFvkkGw==
X-Received: by 2002:a17:90a:2683:: with SMTP id
 m3mr10474846pje.8.1594817031223; 
 Wed, 15 Jul 2020 05:43:51 -0700 (PDT)
Received: from realwakka ([61.83.141.141])
 by smtp.gmail.com with ESMTPSA id ia13sm2106924pjb.42.2020.07.15.05.43.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Jul 2020 05:43:50 -0700 (PDT)
Date: Wed, 15 Jul 2020 12:43:37 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200715124337.GA18441@realwakka>
References: <20200701153134.4187-1-realwakka@gmail.com>
 <20200702131355.GX3278063@phenom.ffwll.local>
 <20200710170533.xn2ar2cpekom6i2n@smtp.gmail.com>
 <20200713160621.GQ3278063@phenom.ffwll.local>
 <20200714102009.4qxgdq5bkpwhhhio@smtp.gmail.com>
 <CAJeY4oF9k--dGOYaC9qAXiVbx6aX2a6isXpfOg+JV2s+UskKGA@mail.gmail.com>
 <20200714140904.GF3278063@phenom.ffwll.local>
 <20200714183513.6zah7wqlo2bpalum@smtp.gmail.com>
 <CAKMK7uFF=CuuTQQJ+MSZD-7+gDzcN-jKB3Uojgps+hY0jdz1bg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFF=CuuTQQJ+MSZD-7+gDzcN-jKB3Uojgps+hY0jdz1bg@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 10:17:56AM +0200, Daniel Vetter wrote:
> On Tue, Jul 14, 2020 at 9:01 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 07/14, Daniel Vetter wrote:
> > > On Tue, Jul 14, 2020 at 07:39:42AM -0300, Melissa Wen wrote:
> > > > On Tue, Jul 14, 2020 at 7:20 AM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > > >
> > > > > On 07/13, Daniel Vetter wrote:
> > > > > > On Fri, Jul 10, 2020 at 02:05:33PM -0300, Melissa Wen wrote:
> > > > > > > On 07/02, Daniel Vetter wrote:
> > > > > > > > On Wed, Jul 01, 2020 at 03:31:34PM +0000, Sidong Yang wrote:
> > > > > > > > > there is an error when igt test is run continuously. vkms_atomic_commit_tail()
> > > > > > > > > need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
> > > > > > > > > vblank events. without this code, next atomic commit will not enable vblank
> > > > > > > > > and raise timeout error.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> > > > > > > > >  1 file changed, 2 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > index 1e8b2169d834..10b9be67a068 100644
> > > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > @@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> > > > > > > > >                 flush_work(&vkms_state->composer_work);
> > > > > > > > >         }
> > > > > > > > >
> > > > > > > > > +       drm_atomic_helper_wait_for_vblanks(dev, old_state);
> > > > > > > >
> > > > > > > > Uh, we have a wait_for_flip_done right above, which should be doing
> > > > > > > > exactly the same, but more precisely: Instead of just waiting for any
> > > > > > > > vblank to happen, we wait for exactly the vblank corresponding to this
> > > > > > > > atomic commit. So no races possible. If this is papering over some issue,
> > > > > > > > then I think more debugging is needed.
> > > > > > > >
> > > > > > > > What exactly is going wrong here for you?
> > > > > > >
> > > > > > > Hi Daniel and Sidong,
> > > > > > >
> > > > > > > I noticed a similar issue when running the IGT test kms_cursor_crc. For
> > > > > > > example, a subtest that passes on the first run (alpha-opaque) fails on
> > > > > > > the second due to a kind of busy waiting in subtest preparation (the
> > > > > > > subtest fails before actually running).
> > > > > > >
> > > > > > > In addition, in the same test, the dpms subtest started to fail since
> > > > > > > the commit that change from wait_for_vblanks to wait_for_flip_done. By
> > > > > > > reverting this commit, the dpms subtest passes again and the sequential
> > > > > > > subtests return to normal.
> > > > > > >
> > > > > > > I am trying to figure out what's missing from using flip_done op on
> > > > > > > vkms, since I am also interested in solving this problem and I
> > > > > > > understand that the change for flip_done has been discussed in the past.
> > > > > > >
> > > > > > > Do you have any idea?
> > > > > >
> > > > > > Uh, not at all. This is indeed rather surprising ...
> > > > > >
> > > > > > What exactly is the failure mode when running a test the 2nd time? Full
> > > > > > igt logs might give me an idea. But yeah this is kinda surprising.
> > > > >
> > > > > Hi Daniel,
> > > > >
> > > > > This is the IGT log of the 2nd run of kms_cursor_crc/alpha-opaque:
> > > > >
> > > > > IGT-Version: 1.25-NO-GIT (x86_64) (Linux: 5.8.0-rc2-DRM+ x86_64)
> > > > > Force option used: Using driver vkms
> > > > > Starting subtest: pipe-A-cursor-alpha-opaque
> > > > > Timed out: Opening crc fd, and poll for first CRC.
> > > > > Subtest pipe-A-cursor-alpha-opaque failed.
> > > > > **** DEBUG ****
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: Virtual-1: set_pipe(A)
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: Virtual-1: Selecting pipe A
> > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=XR24(0x34325258), modifier=0x0, size=0)
> > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=4096)
> > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=XR24(0x34325258), modifier=0x0, size=0)
> > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, pitch=4096)
> > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: plane_set_fb(37)
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: plane_set_size (1024x768)
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: fb_set_size(1024x768)
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: commit {
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     Virtual-1: SetCrtc pipe A, fb 37, src (0, 0), mode 1024x768
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
> > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: }
> > > > > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > > > > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > > > > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > > > > (kms_cursor_crc:2317) igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.
> > > > > ****  END  ****
> > > > > Subtest pipe-A-cursor-alpha-opaque: FAIL (10.017s)
> > > > >
> > > > > ---
> > > > >
> > > > > What I found was a timeout in the poll of
> > > > > igt_debugfs/igt_pipe_crc_start() that in turn is called in the
> > > > > prepare_crc() of kms_cursor_crc.
> > > > >
> > > > > Initially, I thought it was just a matter of timing for vblank and sent
> > > > > a patch to IGT that solved the problem by calling igt_wait_for_vblank()
> > > > > before the "start" op. But then I saw that the timeout also happens in a
> > > > > similar way in the dpms subtest, which before the change to flip_done
> > > > > was succeded.
> > > > >
> > > > > I still have doubts if it is or not a matter of timing...
> > > >
> > > > Just to complement, this is what I sent to IGT due to my first suspicion
> > > > (still not reviewed): https://patchwork.freedesktop.org/series/78813/
> > >
> > > Hm, so the first patch makes some sense I think, that would indeed be a
> > > test bug if we pile up the crc and leak the old one.
> > >
> > > The 2nd patch looks a bit like similar duct-tape like the kernel patch
> > > here, somehow forcing a full vblank wait instead of just waiting for the
> > > previos flip to complete fixes something. I'm just really confused what it
> > > could be.
> > >
> > > We don't have multiple crtc in vkms, so it's likely not that, but it could
> > > be that something goes wrong when we switch everything on. And after one
> > > vblank, things are in sync and working ...
> > >
> > > Maybe to test this theory, adding a drm_crtc_wait_one_vblank() to the
> > > crtc->enable function? If that fixes all these bugs, then we at least have
> > > a better idea where this vblank wait is needed, and can try to investigate
> > > a bit more focused why.
> >
> > Hey,
> >
> > I just checked this way (let me know if I made a mistake):
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index ac85e17428f8..893d451fa966 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -212,6 +212,7 @@ static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> >                                     struct drm_crtc_state *old_state)
> >  {
> >         drm_crtc_vblank_on(crtc);
> > +       drm_crtc_wait_one_vblank(crtc);
> >  }
> >
> > and yes, in the case of kms_cursor_crc, it solves the failure of the 2nd
> > run (ie, sequential run) and the failure of the cursor-dpms subtest.
> >
> > :)
> > >
> > > I don't think it's relevant for crtc->disable, since once the crtc is off,
> > > vblanks stop doing anything. And since steady-state seems to work (at
> > > least your igt patch only adds a vblank wait on setup), so I don't think
> > > we need it for all flips ...
> >
> > I'm not sure if it's also related: I noticed that the cursor-suspend
> > subtest has another pipe_crc_start that is also "requiring" another
> > igt_wait_for_vblank before it.
> >
> > Describing a little more, the cursor-dpms and cursor-suspend subtests
> > have the same setup structure [do_single_test()] besides the
> > prepare_crtc, but in the case of cursor-suspend, even applying any of
> > these "proposals" to wait for vblank, it still breaks due to timeout
> > issues in a last pipe_crc_start.  The cursor-suspend subtest only
> > completes when we add another igt_wait_for_vblank also here.
> 
> Excellent debug work, that's some solid information that limits the
> scope of the bug. I think the next step would be to put a vblank wait
> into the vkms crc setup function. If that papers over all the bugs
> you've found, then that should give us pretty solid information about
> what's breaking. And hopefully only a little bit of code to further
> debug.
> 
> Cheers, Daniel

Hi, Daniel and Melissa.
I tested the code that Daniel said.

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4af2f19480f4..f7309b54b86a 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -239,6 +239,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
        bool enabled = false;
        int ret = 0;
 
+       //drm_crtc_wait_one_vblank(crtc);
        ret = vkms_crc_parse_source(src_name, &enabled);
 
        spin_lock_irq(&out->lock);

and It solves all problem. I traced this code and it enable vblank in set_crc_source

 0)               |  vkms_set_crc_source [vkms]() {
 0)   1.687 us    |    vkms_enable_vblank [vkms]();
 0)   0.165 us    |    vkms_get_vblank_timestamp [vkms]();

before this code, it enable vblank by drm_atomic_vblank_get() in crtc_atomic_flush. 

 0)               |  vkms_atomic_commit_tail [vkms]() {
 0)   0.574 us    |    vkms_crtc_atomic_begin [vkms]();
 0)   0.487 us    |    vkms_plane_atomic_update [vkms]();
 0)               |    vkms_crtc_atomic_flush [vkms]() {
 0)   1.934 us    |      vkms_enable_vblank [vkms]();
 0)   0.347 us    |      vkms_get_vblank_timestamp [vkms]();
 0)   0.379 us    |      vkms_get_vblank_timestamp [vkms]();
 0)   6.789 us    |    }

I think there is some problem because wait_for_flip_done() wait for only affected crtc.
but kms_cursor_crc only set cursor call and maybe wait_for_flip_done() assumes this call
doesn't affact crtc.

I'll keep trace this problem.
Thanks.
-Sidong

> >
> > >
> > > Stil confused what's going on here.
> > > -Daniel
> > >
> > > >
> > > > >
> > > > >
> > > > > Thanks,
> > > > >
> > > > > Melissa
> > > > > >
> > > > > > Also happy to chat on irc for debugging ideas, that might be faster (I'm
> > > > > > danvet on #dri-devel on freenode).
> > > > > > -Daniel
> > > > > >
> > > > > > >
> > > > > > > Melissa
> > > > > > >
> > > > > > > > -Daniel
> > > > > > > >
> > > > > > > > > +
> > > > > > > > >         drm_atomic_helper_cleanup_planes(dev, old_state);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.17.1
> > > > > > > > >
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
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
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
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
