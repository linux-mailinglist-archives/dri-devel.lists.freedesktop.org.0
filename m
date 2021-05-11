Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30337AD01
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2016EA95;
	Tue, 11 May 2021 17:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046A6EA90
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 17:21:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id n25so23813573edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=zk/PQYLI6r98lI1cdIyu8CLft4Ubu+MP3PrXG4cBFsw=;
 b=Wqg/TMarC8uFHtzYy49P8GuLvbfhexnaq9tiTRNUd4yECPAm2dHallyjBW060syeb2
 bYjEQKah/7MPSWDzUtNUS26fIGXGC0UJcg6W3QmSgEpNIEcopmXwyRFO+BsIFdhPyehk
 4YcVGOjsTRIuMG2LkmPuJiE4F28gmq35g9Tsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=zk/PQYLI6r98lI1cdIyu8CLft4Ubu+MP3PrXG4cBFsw=;
 b=P4Yiqb2Le+wh1J8nNiPz079xG8GGZyALdi4NXWJIEqBSy0KyZW1HsYuB5sr7D11dIj
 ZKVo//j3BichsyWYcL8G8kaNU32y2qNwEVofHPQ05UWUv6Ao1jux3YsZJpL1z58Sd+sF
 jcLtktBeaPxNjRdXQDHenYlzrfXm+HG41nFw1LChmLRWttOWHoNswcC6E15AM+sTPsDC
 4EYALYyiq7rf1AyIKhdMUCdDUL3ElWoxu3Mbk0FHnfCFVmSZdCuz27K4pNty/LtWaWUA
 cB4Q0nc4CmzqItbCSDP1eE2ou2jrqRLAdF0ZUicgWlrGGzgH5q0YCX6P8cNdbHo/Mve5
 2r7w==
X-Gm-Message-State: AOAM532sloi3LqLztpyTu9aKD8J/GVC0Usst4XGGuobB7bQIE6C9KeJ8
 /Lz12tRdsuGhcUuCz6q38vBneA==
X-Google-Smtp-Source: ABdhPJyaLnMp7T8up/rfe339I6KE+L9Mz+/UbIqYNm2cqyXkl/ZUPleqkgC7gPzADhv7O3u+4s2dlw==
X-Received: by 2002:a05:6402:702:: with SMTP id
 w2mr23113078edx.85.1620753718264; 
 Tue, 11 May 2021 10:21:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y8sm2980266edo.90.2021.05.11.10.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 10:21:57 -0700 (PDT)
Date: Tue, 11 May 2021 19:21:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
Message-ID: <YJq9M71yiASVKPtJ@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
 <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
 <YJq0YVi4O4zGkb3j@phenom.ffwll.local>
 <CAF6AEGsMk-wO=3iYbW9rS0FJ7760P++vpPgVMFHR9+Q8sWsXQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsMk-wO=3iYbW9rS0FJ7760P++vpPgVMFHR9+Q8sWsXQQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 10:19:57AM -0700, Rob Clark wrote:
> On Tue, May 11, 2021 at 9:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, May 10, 2021 at 12:06:05PM -0700, Rob Clark wrote:
> > > On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> > > > >
> > > > > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >
> > > > > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > > > > > > mode" type displays, which is pointless and unnecessary.  Add an
> > > > > > > optional helper vfunc to determine if a plane is attached to a CRTC
> > > > > > > that actually needs dirtyfb, and skip over them.
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > So this is a bit annoying because the idea of all these "remap legacy uapi
> > > > > > to atomic constructs" helpers is that they shouldn't need/use anything
> > > > > > beyond what userspace also has available. So adding hacks for them feels
> > > > > > really bad.
> > > > >
> > > > > I suppose the root problem is that userspace doesn't know if dirtyfb
> > > > > (or similar) is actually required or is a no-op.
> > > > >
> > > > > But it is perhaps less of a problem because this essentially boils
> > > > > down to "x11 vs wayland", and it seems like wayland compositors for
> > > > > non-vsync'd rendering just pageflips and throws away extra frames from
> > > > > the app?
> > > >
> > > > Yeah it's about not adequately batching up rendering and syncing with
> > > > hw. bare metal x11 is just especially stupid about it :-)
> > > >
> > > > > > Also I feel like it's not entirely the right thing to do here either.
> > > > > > We've had this problem already on the fbcon emulation side (which also
> > > > > > shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> > > > > > there was to have a worker which batches up all the updates and avoids any
> > > > > > stalls in bad places.
> > > > >
> > > > > I'm not too worried about fbcon not being able to render faster than
> > > > > vblank.  OTOH it is a pretty big problem for x11
> > > >
> > > > That's why we'd let the worker get ahead at most one dirtyfb. We do
> > > > the same with fbcon, which trivially can get ahead of vblank otherwise
> > > > (if sometimes flushes each character, so you have to pile them up into
> > > > a single update if that's still pending).
> > > >
> > > > > > Since this is for frontbuffer rendering userspace only we can probably get
> > > > > > away with assuming there's only a single fb, so the implementation becomes
> > > > > > pretty simple:
> > > > > >
> > > > > > - 1 worker, and we keep track of a single pending fb
> > > > > > - if there's already a dirty fb pending on a different fb, we stall for
> > > > > >   the worker to start processing that one already (i.e. the fb we track is
> > > > > >   reset to NULL)
> > > > > > - if it's pending on the same fb we just toss away all the updates and go
> > > > > >   with a full update, since merging the clip rects is too much work :-) I
> > > > > >   think there's helpers so you could be slightly more clever and just have
> > > > > >   an overall bounding box
> > > > >
> > > > > This doesn't really fix the problem, you still end up delaying sending
> > > > > the next back-buffer to mesa
> > > >
> > > > With this the dirtyfb would never block. Also glorious frontbuffer
> > > > tracking corruption is possible, but that's not the kernel's problem.
> > > > So how would anything get held up in userspace.
> > >
> > > the part about stalling if a dirtyfb is pending was what I was worried
> > > about.. but I suppose you meant the worker stalling, rather than
> > > userspace stalling (where I had interpreted it the other way around).
> > > As soon as userspace needs to stall, you're losing again.
> >
> > Nah, I did mean userspace stalling, so we can't pile up unlimited amounts
> > of dirtyfb request in the kernel.
> >
> > But also I never expect userspace that uses dirtyfb to actually hit this
> > stall point (otherwise we'd need to look at this again). It would really
> > be only there as defense against abuse.
> 
> I don't believe modesetting ddx throttles dirtyfb, it (indirectly)
> calls this from it's BlockHandler.. so if you do end up blocking after
> the N'th dirtyfb, you are still going to end up stalling for vblank,
> you are just deferring that for a frame or two..

Nope, that's not what I mean.

By default we pile up the updates, so you _never_ stall. The worker then
takes the entire update every time it runs and batches them up.

We _only_ stall when we get a dirtyfb with a different fb. Because that's
much harder to pile up, plus frontbuffer rendering userspace uses a single
fb across all screens anyway.

So really I don't expect X to ever stall in it's BlockHandler with this.

> The thing is, for a push style panel, you don't necessarily have to
> wait for "vblank" (because "vblank" isn't necessarily a real thing),
> so in that scenario dirtyfb could in theory be fast.  What you want to
> do is fundamentally different for push vs pull style displays.

Yeah, but we'd only stall if userspace does a modeset (which means
different fb) and at that point you'll stall anyway a bit. So shouldn't
hurt.

Well you can do frontbuffer rendering even with atomic ioctl. Just don't
use dirtyfb.

But also you really shouldn't use frontbuffer rendering right now, since
we don't have the interfaces right now to tell userspace whether it's
cmd-mode or something else and what kind of corruption (if any) to expect
when they do that.

> > > > > But we could re-work drm_framebuffer_funcs::dirty to operate on a
> > > > > per-crtc basis and hoist the loop and check if dirtyfb is needed out
> > > > > of drm_atomic_helper_dirtyfb()
> > > >
> > > > That's still using information that userspace doesn't have, which is a
> > > > bit irky. We might as well go with your thing here then.
> > >
> > > arguably, this is something we should expose to userspace.. for DSI
> > > command-mode panels, you probably want to make a different decision
> > > with regard to how many buffers in your flip-chain..
> > >
> > > Possibly we should add/remove the fb_damage_clips property depending
> > > on the display type (ie. video/pull vs cmd/push mode)?
> >
> > I'm not sure whether atomic actually needs this exposed:
> > - clients will do full flips for every frame anyway, I've not heard of
> >   anyone seriously doing frontbuffer rendering.
> 
> Frontbuffer rendering is actually a thing, for ex. to reduce latency
> for stylus (android and CrOS do this.. fortunately AFAICT CrOS never
> uses the dirtyfb ioctl.. but as soon as someone has the nice idea to
> add that we'd be running into the same problem)
> 
> Possibly one idea is to treat dirty-clip updates similarly to cursor
> updates, and let the driver accumulate the updates and then wait until
> vblank to apply them

Yeah that's what I mean. Except implemented cheaper. fbcon code already
does it. I think we're seriously talking past each another.
-Daniel

> 
> BR,
> -R
> 
> > - transporting the cliprects around and then tossing them if the driver
> >   doesn't need them in their flip is probably not a measurable win
> >
> > But yeah if I'm wrong and we have a need here and it's useful, then
> > exposing this to userspace should be done. Meanwhile I think a "offload to
> > worker like fbcon" trick for this legacy interface is probabyl the best
> > option. Plus it will fix things not just for the case where you don't need
> > dirty uploading, it will also fix things for the case where you _do_ need
> > dirty uploading (since right now we stall in a few bad places for that I
> > think).
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > > > -Daniel
> > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > >
> > > > > > Could probably steal most of the implementation.
> > > > > >
> > > > > > This approach here feels a tad too much in the hacky area ...
> > > > > >
> > > > > > Thoughts?
> > > > > > -Daniel
> > > > > >
> > > > > > > ---
> > > > > > >  drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
> > > > > > >  include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
> > > > > > >  2 files changed, 22 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> > > > > > > index 3a4126dc2520..a0bed1a2c2dc 100644
> > > > > > > --- a/drivers/gpu/drm/drm_damage_helper.c
> > > > > > > +++ b/drivers/gpu/drm/drm_damage_helper.c
> > > > > > > @@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > > > > > >  retry:
> > > > > > >       drm_for_each_plane(plane, fb->dev) {
> > > > > > >               struct drm_plane_state *plane_state;
> > > > > > > +             struct drm_crtc *crtc;
> > > > > > >
> > > > > > >               ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> > > > > > >               if (ret)
> > > > > > > @@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > > > > > >                       continue;
> > > > > > >               }
> > > > > > >
> > > > > > > +             crtc = plane->state->crtc;
> > > > > > > +             if (crtc->helper_private->needs_dirtyfb &&
> > > > > > > +                             !crtc->helper_private->needs_dirtyfb(crtc)) {
> > > > > > > +                     drm_modeset_unlock(&plane->mutex);
> > > > > > > +                     continue;
> > > > > > > +             }
> > > > > > > +
> > > > > > >               plane_state = drm_atomic_get_plane_state(state, plane);
> > > > > > >               if (IS_ERR(plane_state)) {
> > > > > > >                       ret = PTR_ERR(plane_state);
> > > > > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > index eb706342861d..afa8ec5754e7 100644
> > > > > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > > > > @@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
> > > > > > >                                    bool in_vblank_irq, int *vpos, int *hpos,
> > > > > > >                                    ktime_t *stime, ktime_t *etime,
> > > > > > >                                    const struct drm_display_mode *mode);
> > > > > > > +
> > > > > > > +     /**
> > > > > > > +      * @needs_dirtyfb
> > > > > > > +      *
> > > > > > > +      * Optional callback used by damage helpers to determine if fb_damage_clips
> > > > > > > +      * update is needed.
> > > > > > > +      *
> > > > > > > +      * Returns:
> > > > > > > +      *
> > > > > > > +      * True if fb_damage_clips update is needed to handle DIRTYFB, False
> > > > > > > +      * otherwise.  If this callback is not implemented, then True is
> > > > > > > +      * assumed.
> > > > > > > +      */
> > > > > > > +     bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> > > > > > >  };
> > > > > > >
> > > > > > >  /**
> > > > > > > --
> > > > > > > 2.30.2
> > > > > > >
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
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
