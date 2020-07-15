Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793722211F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 18:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315C6EBB6;
	Wed, 15 Jul 2020 16:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3EE6EBB8
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 16:08:56 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id c4so567020oou.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ek2CktfZvsKP09RHgr3hkeUDpZ0vfFQG33AqgQPgwNU=;
 b=Qi4SvbZKlfQrpT/19w6cyU6HhXZsXP7VZFEgePQMWzW7YY1u9SsyglIbdc+ThScElC
 Q/TYtcxvQEi66AB833WwoUwq3whxF8H0HBtrDmFpIeXFnJJFOSKm33CdJMy4R6uyegWk
 Jic4JeMp9QAYv+a44KiuVcFepaQkq6ctBnQkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ek2CktfZvsKP09RHgr3hkeUDpZ0vfFQG33AqgQPgwNU=;
 b=mH01KphywkmNoEvLQLzXegJ/gvV8n4HtQhNmIDnm7JrgOXit2I6kTDRxqo3LLnBJqQ
 qBQEeTGLjG7vCwsxVSVEYBqZl/MR8HIPv6kC+C1+XvayqyUgR3/S6CK7orOQ+geU4BVl
 S/qIf1a3QVd7y76K0a1dBtqcWmSAamgFw5A3uwFLPr2yqOVckZ35SNqtMMTecKAOvK7e
 2a4PMbxugrhIY60iDf7MTxtI28A/pe+SBu6ASSNSilbR+wu9daPEGFaUvJdEuOMNDfsW
 dTR1u1zcelXdd8HAoCxJspiOutAefwrorNO2cfR3Wk5AnDnGU0nfOGS9va31SnWnW/+l
 asUw==
X-Gm-Message-State: AOAM533p6FenxGEfOOKyDh4xJMPjq6yNrm7n8jvoWbxWm2iHFSHS6DzJ
 +yRRoZhIrw/b6+iB9eQtUswHfRP314LFMMWIELg6zQ==
X-Google-Smtp-Source: ABdhPJxfwmO5Ig2hEZeaj98SyUh2sev6NUkW9RTcLdCPD2rZmu4Phn97eFOD2HOac7uhoq6EMU4REkJtX5Juz7lS5BU=
X-Received: by 2002:a4a:bb8a:: with SMTP id h10mr9916623oop.28.1594829335378; 
 Wed, 15 Jul 2020 09:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200701153134.4187-1-realwakka@gmail.com>
 <20200702131355.GX3278063@phenom.ffwll.local>
 <20200710170533.xn2ar2cpekom6i2n@smtp.gmail.com>
 <20200713160621.GQ3278063@phenom.ffwll.local>
 <20200714102009.4qxgdq5bkpwhhhio@smtp.gmail.com>
 <CAJeY4oF9k--dGOYaC9qAXiVbx6aX2a6isXpfOg+JV2s+UskKGA@mail.gmail.com>
 <20200714140904.GF3278063@phenom.ffwll.local>
 <20200714183513.6zah7wqlo2bpalum@smtp.gmail.com>
 <CAKMK7uFF=CuuTQQJ+MSZD-7+gDzcN-jKB3Uojgps+hY0jdz1bg@mail.gmail.com>
 <20200715124337.GA18441@realwakka>
 <20200715155715.73zaveklxrakib37@smtp.gmail.com>
In-Reply-To: <20200715155715.73zaveklxrakib37@smtp.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jul 2020 18:08:44 +0200
Message-ID: <CAKMK7uFLwyLgP3tAmw3s-PC0m_1CaNKR1aLvO3ES1PrTAdX-6A@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
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
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 5:57 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> On 07/15, Sidong Yang wrote:
> > On Wed, Jul 15, 2020 at 10:17:56AM +0200, Daniel Vetter wrote:
> > > On Tue, Jul 14, 2020 at 9:01 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > >
> > > > On 07/14, Daniel Vetter wrote:
> > > > > On Tue, Jul 14, 2020 at 07:39:42AM -0300, Melissa Wen wrote:
> > > > > > On Tue, Jul 14, 2020 at 7:20 AM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > > > > >
> > > > > > > On 07/13, Daniel Vetter wrote:
> > > > > > > > On Fri, Jul 10, 2020 at 02:05:33PM -0300, Melissa Wen wrote:
> > > > > > > > > On 07/02, Daniel Vetter wrote:
> > > > > > > > > > On Wed, Jul 01, 2020 at 03:31:34PM +0000, Sidong Yang wrote:
> > > > > > > > > > > there is an error when igt test is run continuously. vkms_atomic_commit_tail()
> > > > > > > > > > > need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
> > > > > > > > > > > vblank events. without this code, next atomic commit will not enable vblank
> > > > > > > > > > > and raise timeout error.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> > > > > > > > > > >  1 file changed, 2 insertions(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > > index 1e8b2169d834..10b9be67a068 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > > > > > > @@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> > > > > > > > > > >                 flush_work(&vkms_state->composer_work);
> > > > > > > > > > >         }
> > > > > > > > > > >
> > > > > > > > > > > +       drm_atomic_helper_wait_for_vblanks(dev, old_state);
> > > > > > > > > >
> > > > > > > > > > Uh, we have a wait_for_flip_done right above, which should be doing
> > > > > > > > > > exactly the same, but more precisely: Instead of just waiting for any
> > > > > > > > > > vblank to happen, we wait for exactly the vblank corresponding to this
> > > > > > > > > > atomic commit. So no races possible. If this is papering over some issue,
> > > > > > > > > > then I think more debugging is needed.
> > > > > > > > > >
> > > > > > > > > > What exactly is going wrong here for you?
> > > > > > > > >
> > > > > > > > > Hi Daniel and Sidong,
> > > > > > > > >
> > > > > > > > > I noticed a similar issue when running the IGT test kms_cursor_crc. For
> > > > > > > > > example, a subtest that passes on the first run (alpha-opaque) fails on
> > > > > > > > > the second due to a kind of busy waiting in subtest preparation (the
> > > > > > > > > subtest fails before actually running).
> > > > > > > > >
> > > > > > > > > In addition, in the same test, the dpms subtest started to fail since
> > > > > > > > > the commit that change from wait_for_vblanks to wait_for_flip_done. By
> > > > > > > > > reverting this commit, the dpms subtest passes again and the sequential
> > > > > > > > > subtests return to normal.
> > > > > > > > >
> > > > > > > > > I am trying to figure out what's missing from using flip_done op on
> > > > > > > > > vkms, since I am also interested in solving this problem and I
> > > > > > > > > understand that the change for flip_done has been discussed in the past.
> > > > > > > > >
> > > > > > > > > Do you have any idea?
> > > > > > > >
> > > > > > > > Uh, not at all. This is indeed rather surprising ...
> > > > > > > >
> > > > > > > > What exactly is the failure mode when running a test the 2nd time? Full
> > > > > > > > igt logs might give me an idea. But yeah this is kinda surprising.
> > > > > > >
> > > > > > > Hi Daniel,
> > > > > > >
> > > > > > > This is the IGT log of the 2nd run of kms_cursor_crc/alpha-opaque:
> > > > > > >
> > > > > > > IGT-Version: 1.25-NO-GIT (x86_64) (Linux: 5.8.0-rc2-DRM+ x86_64)
> > > > > > > Force option used: Using driver vkms
> > > > > > > Starting subtest: pipe-A-cursor-alpha-opaque
> > > > > > > Timed out: Opening crc fd, and poll for first CRC.
> > > > > > > Subtest pipe-A-cursor-alpha-opaque failed.
> > > > > > > **** DEBUG ****
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: Virtual-1: set_pipe(A)
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: Virtual-1: Selecting pipe A
> > > > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=XR24(0x34325258), modifier=0x0, size=0)
> > > > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=4096)
> > > > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> > > > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=XR24(0x34325258), modifier=0x0, size=0)
> > > > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, pitch=4096)
> > > > > > > (kms_cursor_crc:2317) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: plane_set_fb(37)
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: plane_set_size (1024x768)
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: fb_set_size(1024x768)
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: commit {
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     Virtual-1: SetCrtc pipe A, fb 37, src (0, 0), mode 1024x768
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
> > > > > > > (kms_cursor_crc:2317) igt_kms-DEBUG: display: }
> > > > > > > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > > > > > > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > > > > > > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > > > > > > (kms_cursor_crc:2317) igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.
> > > > > > > ****  END  ****
> > > > > > > Subtest pipe-A-cursor-alpha-opaque: FAIL (10.017s)
> > > > > > >
> > > > > > > ---
> > > > > > >
> > > > > > > What I found was a timeout in the poll of
> > > > > > > igt_debugfs/igt_pipe_crc_start() that in turn is called in the
> > > > > > > prepare_crc() of kms_cursor_crc.
> > > > > > >
> > > > > > > Initially, I thought it was just a matter of timing for vblank and sent
> > > > > > > a patch to IGT that solved the problem by calling igt_wait_for_vblank()
> > > > > > > before the "start" op. But then I saw that the timeout also happens in a
> > > > > > > similar way in the dpms subtest, which before the change to flip_done
> > > > > > > was succeded.
> > > > > > >
> > > > > > > I still have doubts if it is or not a matter of timing...
> > > > > >
> > > > > > Just to complement, this is what I sent to IGT due to my first suspicion
> > > > > > (still not reviewed): https://patchwork.freedesktop.org/series/78813/
> > > > >
> > > > > Hm, so the first patch makes some sense I think, that would indeed be a
> > > > > test bug if we pile up the crc and leak the old one.
> > > > >
> > > > > The 2nd patch looks a bit like similar duct-tape like the kernel patch
> > > > > here, somehow forcing a full vblank wait instead of just waiting for the
> > > > > previos flip to complete fixes something. I'm just really confused what it
> > > > > could be.
> > > > >
> > > > > We don't have multiple crtc in vkms, so it's likely not that, but it could
> > > > > be that something goes wrong when we switch everything on. And after one
> > > > > vblank, things are in sync and working ...
> > > > >
> > > > > Maybe to test this theory, adding a drm_crtc_wait_one_vblank() to the
> > > > > crtc->enable function? If that fixes all these bugs, then we at least have
> > > > > a better idea where this vblank wait is needed, and can try to investigate
> > > > > a bit more focused why.
> > > >
> > > > Hey,
> > > >
> > > > I just checked this way (let me know if I made a mistake):
> > > >
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index ac85e17428f8..893d451fa966 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -212,6 +212,7 @@ static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >                                     struct drm_crtc_state *old_state)
> > > >  {
> > > >         drm_crtc_vblank_on(crtc);
> > > > +       drm_crtc_wait_one_vblank(crtc);
> > > >  }
> > > >
> > > > and yes, in the case of kms_cursor_crc, it solves the failure of the 2nd
> > > > run (ie, sequential run) and the failure of the cursor-dpms subtest.
> > > >
> > > > :)
> > > > >
> > > > > I don't think it's relevant for crtc->disable, since once the crtc is off,
> > > > > vblanks stop doing anything. And since steady-state seems to work (at
> > > > > least your igt patch only adds a vblank wait on setup), so I don't think
> > > > > we need it for all flips ...
> > > >
> > > > I'm not sure if it's also related: I noticed that the cursor-suspend
> > > > subtest has another pipe_crc_start that is also "requiring" another
> > > > igt_wait_for_vblank before it.
> > > >
> > > > Describing a little more, the cursor-dpms and cursor-suspend subtests
> > > > have the same setup structure [do_single_test()] besides the
> > > > prepare_crtc, but in the case of cursor-suspend, even applying any of
> > > > these "proposals" to wait for vblank, it still breaks due to timeout
> > > > issues in a last pipe_crc_start.  The cursor-suspend subtest only
> > > > completes when we add another igt_wait_for_vblank also here.
> > >
> > > Excellent debug work, that's some solid information that limits the
> > > scope of the bug. I think the next step would be to put a vblank wait
> > > into the vkms crc setup function. If that papers over all the bugs
> > > you've found, then that should give us pretty solid information about
> > > what's breaking. And hopefully only a little bit of code to further
> > > debug.
> > >
> > > Cheers, Daniel
> >
> > Hi, Daniel and Melissa.
> > I tested the code that Daniel said.
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 4af2f19480f4..f7309b54b86a 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -239,6 +239,7 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
> >         bool enabled = false;
> >         int ret = 0;
> >
> > +       //drm_crtc_wait_one_vblank(crtc);
> >         ret = vkms_crc_parse_source(src_name, &enabled);
> >
> >         spin_lock_irq(&out->lock);
> >
> > and It solves all problem. I traced this code and it enable vblank in set_crc_source
> >
> >  0)               |  vkms_set_crc_source [vkms]() {
> >  0)   1.687 us    |    vkms_enable_vblank [vkms]();
> >  0)   0.165 us    |    vkms_get_vblank_timestamp [vkms]();
> >
> > before this code, it enable vblank by drm_atomic_vblank_get() in crtc_atomic_flush.
> >
> >  0)               |  vkms_atomic_commit_tail [vkms]() {
> >  0)   0.574 us    |    vkms_crtc_atomic_begin [vkms]();
> >  0)   0.487 us    |    vkms_plane_atomic_update [vkms]();
> >  0)               |    vkms_crtc_atomic_flush [vkms]() {
> >  0)   1.934 us    |      vkms_enable_vblank [vkms]();
> >  0)   0.347 us    |      vkms_get_vblank_timestamp [vkms]();
> >  0)   0.379 us    |      vkms_get_vblank_timestamp [vkms]();
> >  0)   6.789 us    |    }
> >
> > I think there is some problem because wait_for_flip_done() wait for only affected crtc.
> > but kms_cursor_crc only set cursor call and maybe wait_for_flip_done() assumes this call
> > doesn't affact crtc.
>
> Hi,
>
> In addition to kms_cursor_crc, did you see this timeout problem in some
> other test?

Hm tbh I'm not running tests, just throwing ideas for figuring out
what's going on your way :-)

> I saw similar, but even more strange behavior in kms_pipe_crc_basic. In
> the case of this test, when I load the vkms module and run the first
> subtest related to crc capture (read-crc-pipe), the first execution is
> obstructed by this kind of timeout, but from then on everything goes
> back to normal. If I unload and load the vkms again, the weird situation
> repeats.
>
> I just noticed in dmesg that, as soon as we load the module, the
> first subtest that requires a vblank will trigger a warning - but that
> happens for any IGT test:
>
> [  892.520876] [drm] Initialized vkms 1.0.0 20180514 for vkms on minor 0
> [  897.209654] [IGT] kms_pipe_crc_basic: executing
> [  897.224316] [IGT] kms_pipe_crc_basic: starting subtest read-crc-pipe-A
> [  897.229659] ------------[ cut here ]------------
> [  897.229661] WARNING: CPU: 0 PID: 1339 at
> drivers/gpu/drm/vkms/vkms_crtc.c:91 vkms_get_vblank_timestamp+0x46/0x50
> [vkms]

If I'm looking at this correctly it's the below warning:

    if (WARN_ON(*vblank_time == vblank->time))
        return true;

It's not exactly line 91, so maybe I got something wrong, pls double
check, ping me on irc if you need help with decoding function
addresses and stuff like that.

So this would mean that for a given vblank interval we've already
updated vblank->time, but then somehow we process it again. From the
backtrace this happens when we enable the output, so another
indication that something in our vblank enabling is wrong.

A reasonable conjecture (but until we have a bugfix can't exclude it
fully yet) is that this might be caused by the same underlying issue
where somehow the very first crc is getting stuck. Here we have an
inconsistency with the very first vblank timestamp.

So something is fishy with how we are getting vblanks going. But not
really any idea what or why ... Maybe try to trace when/how
vblank->time is updated (with backtraces) and try to figure out why
that is causing the first crc capture to get stuck if we don't do a
vblank wait first.

Very interesting debug story, that's for sure :-)

Cheers, Daniel

> [  897.229661] Modules linked in: vkms drm_kms_helper syscopyarea
> sysfillrect sysimgblt fb_sys_fops cec drm backlight md4 cmac nls_utf8
> cifs libdes dns_resolver fscache libarc4 ppdev input_leds joydev
> parport_pc mousedev pcspkr serio_raw parport evdev qemu_fw_cfg intel_agp
> mac_hid intel_gtt agpgart ip_tables x_tables ext4 crc32c_generic crc16
> mbcache jbd2 sr_mod sd_mod cdrom ata_generic pata_acpi ata_piix psmouse
> atkbd libps2 libata scsi_mod e1000 i2c_piix4 floppy i8042 serio [last
> unloaded: syscopyarea]
> [  897.229679] CPU: 0 PID: 1339 Comm: kms_pipe_crc_ba Tainted: G        W         5.8.0-rc2-DRM-MISC+ #103
> [  897.229679] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1 04/01/2014
> [  897.229680] RIP: 0010:vkms_get_vblank_timestamp+0x46/0x50 [vkms]
> [  897.229681] Code: 19 00 00 48 c1 e0 05 48 03 86 48 03 00 00 48 89 0a
> 48 39 88 20 01 00 00 74 10 48 2b 8e 18 1a 00 00 b8 01 00 00 00 48 89 0a
> c3 <0f> 0b b8 01 00 00 00 c3 66 90 0f 1f 44 00 00 48 81 c7 f0 0a 00 00
> [  897.229681] RSP: 0018:ffffa83b80507af8 EFLAGS: 00010046
> [  897.229682] RAX: ffff96673bf59c28 RBX: ffffa83b80507b38 RCX: 0000000000000000
> [  897.229683] RDX: ffffa83b80507b38 RSI: ffff96673cb12000 RDI: ffff96673cb12ee8
> [  897.229684] RBP: ffff96673cb12000 R08: 00000000de89d0ca R09: 0000000000000000
> [  897.229684] R10: 0000000000080000 R11: 0000000000000000 R12: 0000000000000000
> [  897.229685] R13: 0000000000000000 R14: ffff96673cb12350 R15: ffff966733ebf5f0
> [  897.229685] FS:  00007f18c863f180(0000) GS:ffff96673ec00000(0000) knlGS:0000000000000000
> [  897.229686] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  897.229686] CR2: 00007f18c8357000 CR3: 000000003c9b0000 CR4: 00000000000006f0
> [  897.229687] Call Trace:
> [  897.229687]  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> [  897.229688]  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> [  897.229688]  drm_crtc_vblank_on+0x88/0x140 [drm]
> [  897.229689]  drm_atomic_helper_commit_modeset_enables+0x1d2/0x220 [drm_kms_helper]
> [  897.229689]  vkms_atomic_commit_tail+0x33/0xb0 [vkms]
> [  897.229690]  commit_tail+0x94/0x130 [drm_kms_helper]
> [  897.229690]  drm_atomic_helper_commit+0x132/0x160 [drm_kms_helper]
> [  897.229691]  drm_atomic_helper_set_config+0x70/0xb0 [drm_kms_helper]
> [  897.229691]  drm_mode_setcrtc+0x1dd/0x6d0 [drm]
> [  897.229692]  ? drm_mode_getcrtc+0x180/0x180 [drm]
> [  897.229692]  drm_ioctl_kernel+0xad/0x100 [drm]
> [  897.229693]  drm_ioctl+0x20c/0x3a0 [drm]
> [  897.229693]  ? drm_mode_getcrtc+0x180/0x180 [drm]
> [  897.229693]  ? __task_pid_nr_ns+0x6b/0xd0
> [  897.229694]  ksys_ioctl+0x87/0xc0
> [  897.229694]  __x64_sys_ioctl+0x16/0x20
> [  897.229695]  do_syscall_64+0x4d/0x90
> [  897.229695]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  897.229696] RIP: 0033:0x7f18ca3ed457
> [  897.229696] Code: Bad RIP value.
> [  897.229696] RSP: 002b:00007ffd96a276e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  897.229698] RAX: ffffffffffffffda RBX: 00007ffd96a27720 RCX: 00007f18ca3ed457
> [  897.229698] RDX: 00007ffd96a27720 RSI: 00000000c06864a2 RDI: 0000000000000003
> [  897.229699] RBP: 00000000c06864a2 R08: 0000000000000000 R09: 000055dec3bdb318
> [  897.229699] R10: 0000000000000000 R11: 0000000000000246 R12: 000055dec3bdb310
> [  897.229700] R13: 0000000000000003 R14: 000055dec3bd9780 R15: 0000000000000025
> [  897.229700] ---[ end trace e909a3abdb957d23 ]---
> [  907.222149] [IGT] kms_pipe_crc_basic: exiting, ret=98
> [  919.725223] [IGT] kms_pipe_crc_basic: executing
> [  919.756611] [IGT] kms_pipe_crc_basic: starting subtest read-crc-pipe-A
> [  919.949258] [IGT] kms_pipe_crc_basic: exiting, ret=0
> [  921.000821] [IGT] kms_pipe_crc_basic: executing
> [  921.014152] [IGT] kms_pipe_crc_basic: starting subtest read-crc-pipe-A
> [  921.181640] [IGT] kms_pipe_crc_basic: exiting, ret=0
> [  922.049606] [IGT] kms_pipe_crc_basic: executing
> [  922.073160] [IGT] kms_pipe_crc_basic: starting subtest read-crc-pipe-A
> [  922.247318] [IGT] kms_pipe_crc_basic: exiting, ret=0
> [  926.948820] [IGT] kms_pipe_crc_basic: executing
> [  926.961950] [IGT] kms_pipe_crc_basic: starting subtest read-crc-pipe-A
> [  927.127187] [IGT] kms_pipe_crc_basic: exiting, ret=0
>
> My point is this warning appears to "block" execution only in the case
> of kms_pipe_crc_basic. And then, with this drm_crtc_wait_one_vblank in
> set_crc, this problem stops happening also here.
>
> On the other hand, I also saw that wait_one_vblank changed the result of
> some kms_plane subtests (since they call igt_pipe_crc_start), but it
> does not affect kms_flip. I mean, I'm trying to understand all of this
> better, but it seems focused on this moment to start capturing of crc.
>
> Melissa
> >
> > I'll keep trace this problem.
> > Thanks.
> > -Sidong
> >
> > > >
> > > > >
> > > > > Stil confused what's going on here.
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > Thanks,
> > > > > > >
> > > > > > > Melissa
> > > > > > > >
> > > > > > > > Also happy to chat on irc for debugging ideas, that might be faster (I'm
> > > > > > > > danvet on #dri-devel on freenode).
> > > > > > > > -Daniel
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Melissa
> > > > > > > > >
> > > > > > > > > > -Daniel
> > > > > > > > > >
> > > > > > > > > > > +
> > > > > > > > > > >         drm_atomic_helper_cleanup_planes(dev, old_state);
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.17.1
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Daniel Vetter
> > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > http://blog.ffwll.ch
> > > > > > > > > > _______________________________________________
> > > > > > > > > > dri-devel mailing list
> > > > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
> > > > > > _______________________________________________
> > > > > > dri-devel mailing list
> > > > > > dri-devel@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
