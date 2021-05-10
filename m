Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC4379641
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 19:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1366D6E4E8;
	Mon, 10 May 2021 17:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D476E4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 17:44:10 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 c8-20020a9d78480000b0290289e9d1b7bcso15179946otm.4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 10:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nu8gGLhsC1ELwFBZ+fEdAlQkxl31RURTyRImd+7th4k=;
 b=Q0F1qU6Xluk2u8YzHKKi7qLtzL2N8/Bi2nK7GqwYWgc0YPqpTKvB2KRJIFN0LTx2zO
 F/dMdl4zDv+0TDzQfIkSpxZOfRNzx8jHKvU5QPqU433NE0xrPN8CCaATUHvbvBADYs1A
 Ya8KCXP6s2yjqZl78Kcq+idM0202vju6aaOKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nu8gGLhsC1ELwFBZ+fEdAlQkxl31RURTyRImd+7th4k=;
 b=SibawXzq38EqfZFMPqCWA8P/T/K2Wd5cKwDshZbzL2u0A5B5twlsGzK2l1/2gwdrVP
 tnF2lwbF+ixsCYHdRx/mz5+KWsEOK01uL0QseKcxxR0q75ljIJxKCIkwStms1eXL8O+B
 MRRdDigBroJxc857IrC+k0HhexEoZ8z63UgJF0ANlI3FaKVrntuhB6xh83K6C73VbLGD
 jM4ej9jzV3/G9rpMj4z6F7d9N7COJqeHJWiAfWkFkVPwxhHrlGT/8SSxFYAYthNOignK
 fIvNrvtSl3G2AGYe+h7b/xtTdsjeVxeF8/7kFUIld56T5BxHWw6458R5OLr6mZo5hj51
 0XzQ==
X-Gm-Message-State: AOAM533dpaWdlJoZl65VTjuoJEgojxyuHKiZ9YW9eXS8GKf9li+7Vu+r
 03dYfENFPuwxSz9WfP/c8JWAKKBuXNnWhE/7Gp/7sf1LSdI=
X-Google-Smtp-Source: ABdhPJwVYxoiyebWDxNs4KKhHUYbY0IX1MPscuMmOw3PgNsgRBdaJjeDLCiMwpXA3gw4NGeeIIHvzPVHeacApUbo1ZI=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr4445891otq.303.1620668649607; 
 Mon, 10 May 2021 10:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 10 May 2021 19:43:58 +0200
Message-ID: <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > > mode" type displays, which is pointless and unnecessary.  Add an
> > > optional helper vfunc to determine if a plane is attached to a CRTC
> > > that actually needs dirtyfb, and skip over them.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > So this is a bit annoying because the idea of all these "remap legacy uapi
> > to atomic constructs" helpers is that they shouldn't need/use anything
> > beyond what userspace also has available. So adding hacks for them feels
> > really bad.
>
> I suppose the root problem is that userspace doesn't know if dirtyfb
> (or similar) is actually required or is a no-op.
>
> But it is perhaps less of a problem because this essentially boils
> down to "x11 vs wayland", and it seems like wayland compositors for
> non-vsync'd rendering just pageflips and throws away extra frames from
> the app?

Yeah it's about not adequately batching up rendering and syncing with
hw. bare metal x11 is just especially stupid about it :-)

> > Also I feel like it's not entirely the right thing to do here either.
> > We've had this problem already on the fbcon emulation side (which also
> > shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> > there was to have a worker which batches up all the updates and avoids any
> > stalls in bad places.
>
> I'm not too worried about fbcon not being able to render faster than
> vblank.  OTOH it is a pretty big problem for x11

That's why we'd let the worker get ahead at most one dirtyfb. We do
the same with fbcon, which trivially can get ahead of vblank otherwise
(if sometimes flushes each character, so you have to pile them up into
a single update if that's still pending).

> > Since this is for frontbuffer rendering userspace only we can probably get
> > away with assuming there's only a single fb, so the implementation becomes
> > pretty simple:
> >
> > - 1 worker, and we keep track of a single pending fb
> > - if there's already a dirty fb pending on a different fb, we stall for
> >   the worker to start processing that one already (i.e. the fb we track is
> >   reset to NULL)
> > - if it's pending on the same fb we just toss away all the updates and go
> >   with a full update, since merging the clip rects is too much work :-) I
> >   think there's helpers so you could be slightly more clever and just have
> >   an overall bounding box
>
> This doesn't really fix the problem, you still end up delaying sending
> the next back-buffer to mesa

With this the dirtyfb would never block. Also glorious frontbuffer
tracking corruption is possible, but that's not the kernel's problem.
So how would anything get held up in userspace.

> But we could re-work drm_framebuffer_funcs::dirty to operate on a
> per-crtc basis and hoist the loop and check if dirtyfb is needed out
> of drm_atomic_helper_dirtyfb()

That's still using information that userspace doesn't have, which is a
bit irky. We might as well go with your thing here then.
-Daniel

> BR,
> -R
>
> >
> > Could probably steal most of the implementation.
> >
> > This approach here feels a tad too much in the hacky area ...
> >
> > Thoughts?
> > -Daniel
> >
> > > ---
> > >  drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
> > >  include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
> > >  2 files changed, 22 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> > > index 3a4126dc2520..a0bed1a2c2dc 100644
> > > --- a/drivers/gpu/drm/drm_damage_helper.c
> > > +++ b/drivers/gpu/drm/drm_damage_helper.c
> > > @@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > >  retry:
> > >       drm_for_each_plane(plane, fb->dev) {
> > >               struct drm_plane_state *plane_state;
> > > +             struct drm_crtc *crtc;
> > >
> > >               ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> > >               if (ret)
> > > @@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > >                       continue;
> > >               }
> > >
> > > +             crtc = plane->state->crtc;
> > > +             if (crtc->helper_private->needs_dirtyfb &&
> > > +                             !crtc->helper_private->needs_dirtyfb(crtc)) {
> > > +                     drm_modeset_unlock(&plane->mutex);
> > > +                     continue;
> > > +             }
> > > +
> > >               plane_state = drm_atomic_get_plane_state(state, plane);
> > >               if (IS_ERR(plane_state)) {
> > >                       ret = PTR_ERR(plane_state);
> > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > index eb706342861d..afa8ec5754e7 100644
> > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > @@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
> > >                                    bool in_vblank_irq, int *vpos, int *hpos,
> > >                                    ktime_t *stime, ktime_t *etime,
> > >                                    const struct drm_display_mode *mode);
> > > +
> > > +     /**
> > > +      * @needs_dirtyfb
> > > +      *
> > > +      * Optional callback used by damage helpers to determine if fb_damage_clips
> > > +      * update is needed.
> > > +      *
> > > +      * Returns:
> > > +      *
> > > +      * True if fb_damage_clips update is needed to handle DIRTYFB, False
> > > +      * otherwise.  If this callback is not implemented, then True is
> > > +      * assumed.
> > > +      */
> > > +     bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> > >  };
> > >
> > >  /**
> > > --
> > > 2.30.2
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
