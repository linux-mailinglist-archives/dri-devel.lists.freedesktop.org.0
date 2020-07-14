Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9668D21F37F
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 16:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C106E149;
	Tue, 14 Jul 2020 14:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740966E149
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 14:09:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z15so21861990wrl.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=y9rGgqdm6Oatxfd/0jGAlEMuG5eUaf8RBwlTo5mrHR0=;
 b=WuLthqJjHJU27T9F+7bB+4Nu084U/76ZXGtXpSjyEWEAH4DEUTdw94h6UucZqg7qBy
 v2zfcpRJcwS9gTuF3EByekOi23mPvpANsHnxbi6La5OxrU938GWezcCZiQl/miYqkM7Z
 Brt9bFUQHzIwmHvwDNoLQYhyO1e8Dv2mgVPkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=y9rGgqdm6Oatxfd/0jGAlEMuG5eUaf8RBwlTo5mrHR0=;
 b=HoUYWmNc+PoiE1LwWg8ENwfiZlSjKXFRVPvwh9hvSbXgXdcTZiH1BT/BX/tCrbUxGP
 wQpZa5G3B01LYoyOWm6i4MGMZGnt2Mi8pTRK69SNeyY4iZ/e6d0imBU8OVn0OMJ497+i
 NgKWDnoU3/Os3xvlAl7z+0KAA02aXSeBR64f2uauCzQoLOgl2ZBmS5R+8IBhtDNQdO6a
 IkFI3DLjADtnOSbbgPan9tQMZwZYatFWx8Ho4KkbaSMyypRRRCaCYZZbvhdNXRgGMoX8
 m0t/17iE7ybbNB5q1tHDPhEQneUZmHO6brBkTloO6ZjWtY96zYXy9yFmouPHeOz+xiQI
 aFMA==
X-Gm-Message-State: AOAM531L265MZi7+HVaihZAK5m6l+CiH1uY4W47Vb+fZHd2cAF8iHDmh
 zEc6+DvQsTu/0Y6oc1W5h9kh9w==
X-Google-Smtp-Source: ABdhPJwRoO2cqSfiIyELK6qa+Af82dhca8i8fo5HxOp/mekP2QVhbTUZxnyxq8ZaahBRZGpMXF9DbQ==
X-Received: by 2002:adf:fa8b:: with SMTP id h11mr5818082wrr.391.1594735747960; 
 Tue, 14 Jul 2020 07:09:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 33sm31372511wri.16.2020.07.14.07.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 07:09:06 -0700 (PDT)
Date: Tue, 14 Jul 2020 16:09:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200714140904.GF3278063@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Sidong Yang <realwakka@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200701153134.4187-1-realwakka@gmail.com>
 <20200702131355.GX3278063@phenom.ffwll.local>
 <20200710170533.xn2ar2cpekom6i2n@smtp.gmail.com>
 <20200713160621.GQ3278063@phenom.ffwll.local>
 <20200714102009.4qxgdq5bkpwhhhio@smtp.gmail.com>
 <CAJeY4oF9k--dGOYaC9qAXiVbx6aX2a6isXpfOg+JV2s+UskKGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJeY4oF9k--dGOYaC9qAXiVbx6aX2a6isXpfOg+JV2s+UskKGA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 07:39:42AM -0300, Melissa Wen wrote:
> On Tue, Jul 14, 2020 at 7:20 AM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 07/13, Daniel Vetter wrote:
> > > On Fri, Jul 10, 2020 at 02:05:33PM -0300, Melissa Wen wrote:
> > > > On 07/02, Daniel Vetter wrote:
> > > > > On Wed, Jul 01, 2020 at 03:31:34PM +0000, Sidong Yang wrote:
> > > > > > there is an error when igt test is run continuously. vkms_atomic_commit_tail()
> > > > > > need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
> > > > > > vblank events. without this code, next atomic commit will not enable vblank
> > > > > > and raise timeout error.
> > > > > >
> > > > > > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > index 1e8b2169d834..10b9be67a068 100644
> > > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > > > > @@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> > > > > >                 flush_work(&vkms_state->composer_work);
> > > > > >         }
> > > > > >
> > > > > > +       drm_atomic_helper_wait_for_vblanks(dev, old_state);
> > > > >
> > > > > Uh, we have a wait_for_flip_done right above, which should be doing
> > > > > exactly the same, but more precisely: Instead of just waiting for any
> > > > > vblank to happen, we wait for exactly the vblank corresponding to this
> > > > > atomic commit. So no races possible. If this is papering over some issue,
> > > > > then I think more debugging is needed.
> > > > >
> > > > > What exactly is going wrong here for you?
> > > >
> > > > Hi Daniel and Sidong,
> > > >
> > > > I noticed a similar issue when running the IGT test kms_cursor_crc. For
> > > > example, a subtest that passes on the first run (alpha-opaque) fails on
> > > > the second due to a kind of busy waiting in subtest preparation (the
> > > > subtest fails before actually running).
> > > >
> > > > In addition, in the same test, the dpms subtest started to fail since
> > > > the commit that change from wait_for_vblanks to wait_for_flip_done. By
> > > > reverting this commit, the dpms subtest passes again and the sequential
> > > > subtests return to normal.
> > > >
> > > > I am trying to figure out what's missing from using flip_done op on
> > > > vkms, since I am also interested in solving this problem and I
> > > > understand that the change for flip_done has been discussed in the past.
> > > >
> > > > Do you have any idea?
> > >
> > > Uh, not at all. This is indeed rather surprising ...
> > >
> > > What exactly is the failure mode when running a test the 2nd time? Full
> > > igt logs might give me an idea. But yeah this is kinda surprising.
> >
> > Hi Daniel,
> >
> > This is the IGT log of the 2nd run of kms_cursor_crc/alpha-opaque:
> >
> > IGT-Version: 1.25-NO-GIT (x86_64) (Linux: 5.8.0-rc2-DRM+ x86_64)
> > Force option used: Using driver vkms
> > Starting subtest: pipe-A-cursor-alpha-opaque
> > Timed out: Opening crc fd, and poll for first CRC.
> > Subtest pipe-A-cursor-alpha-opaque failed.
> > **** DEBUG ****
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: Virtual-1: set_pipe(A)
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: Virtual-1: Selecting pipe A
> > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=XR24(0x34325258), modifier=0x0, size=0)
> > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=1, pitch=4096)
> > (kms_cursor_crc:2317) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(width=1024, height=768, format=XR24(0x34325258), modifier=0x0, size=0)
> > (kms_cursor_crc:2317) igt_fb-DEBUG: igt_create_fb_with_bo_size(handle=2, pitch=4096)
> > (kms_cursor_crc:2317) igt_fb-DEBUG: Test requirement passed: cairo_surface_status(fb->cairo_surface) == CAIRO_STATUS_SUCCESS
> > (kms_cursor_crc:2317) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > (kms_cursor_crc:2317) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && plane_idx < pipe->n_planes
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: plane_set_fb(37)
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: plane_set_size (1024x768)
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: A.0: fb_set_size(1024x768)
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: commit {
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     Virtual-1: SetCrtc pipe A, fb 37, src (0, 0), mode 1024x768
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     SetCursor pipe A, disabling
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display:     MoveCursor pipe A, (0, 0)
> > (kms_cursor_crc:2317) igt_kms-DEBUG: display: }
> > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > (kms_cursor_crc:2317) igt_debugfs-DEBUG: Opening debugfs directory '/sys/kernel/debug/dri/0'
> > (kms_cursor_crc:2317) igt_core-INFO: Timed out: Opening crc fd, and poll for first CRC.
> > ****  END  ****
> > Subtest pipe-A-cursor-alpha-opaque: FAIL (10.017s)
> >
> > ---
> >
> > What I found was a timeout in the poll of
> > igt_debugfs/igt_pipe_crc_start() that in turn is called in the
> > prepare_crc() of kms_cursor_crc.
> >
> > Initially, I thought it was just a matter of timing for vblank and sent
> > a patch to IGT that solved the problem by calling igt_wait_for_vblank()
> > before the "start" op. But then I saw that the timeout also happens in a
> > similar way in the dpms subtest, which before the change to flip_done
> > was succeded.
> >
> > I still have doubts if it is or not a matter of timing...
> 
> Just to complement, this is what I sent to IGT due to my first suspicion
> (still not reviewed): https://patchwork.freedesktop.org/series/78813/

Hm, so the first patch makes some sense I think, that would indeed be a
test bug if we pile up the crc and leak the old one.

The 2nd patch looks a bit like similar duct-tape like the kernel patch
here, somehow forcing a full vblank wait instead of just waiting for the
previos flip to complete fixes something. I'm just really confused what it
could be.

We don't have multiple crtc in vkms, so it's likely not that, but it could
be that something goes wrong when we switch everything on. And after one
vblank, things are in sync and working ...

Maybe to test this theory, adding a drm_crtc_wait_one_vblank() to the
crtc->enable function? If that fixes all these bugs, then we at least have
a better idea where this vblank wait is needed, and can try to investigate
a bit more focused why.

I don't think it's relevant for crtc->disable, since once the crtc is off,
vblanks stop doing anything. And since steady-state seems to work (at
least your igt patch only adds a vblank wait on setup), so I don't think
we need it for all flips ...

Stil confused what's going on here.
-Daniel

> 
> >
> >
> > Thanks,
> >
> > Melissa
> > >
> > > Also happy to chat on irc for debugging ideas, that might be faster (I'm
> > > danvet on #dri-devel on freenode).
> > > -Daniel
> > >
> > > >
> > > > Melissa
> > > >
> > > > > -Daniel
> > > > >
> > > > > > +
> > > > > >         drm_atomic_helper_cleanup_planes(dev, old_state);
> > > > > >  }
> > > > > >
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
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
