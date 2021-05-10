Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F407A379756
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 21:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E709A89F6E;
	Mon, 10 May 2021 19:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8589F6E
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 19:02:24 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso9636355wmn.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4WHP173ml/IvV38Ii24FlwHTvigSpfq09dlZuPkiS4=;
 b=kxU/6Cetf8Jp9p1vtNEP21W8Vh9oXZMaTvM3J6yDfbfzwSRb2VaI72nqY2aCpckEHr
 kze3q4ghadRqOS2+rfuGfWI/felw/cbpuSdTX+EyMAmQIi9jWBwvZCNzzD075oTs8AQP
 FijOGeDY1+s/umdlSBjaM6PKf6x9endfGo7ov9K5heleejekl7Hv/KjKf2J8K9nykD6N
 NmsBj3NyLWLsD35hCpthQcXQ1iocnvFBVYhWztGcNYHktiJd5GfEz/MW9sMhLU8jpPdB
 KbBDFEDfUKJxUpHnXVHTW6+9x2hHsXMFA2fJhLP7OhBCp1MH73KE/oe7DaCpxZwLMi/V
 YwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4WHP173ml/IvV38Ii24FlwHTvigSpfq09dlZuPkiS4=;
 b=h7xQMCRWOkWI+sQPHloDvR5VlbZYgF4/F/fr0YfX9aGqGCdzaQsWPnoMv3+RAwO+bC
 95SD4H5HZtEChfEU+D+7fIgwLlQW9mz74MKRqG9QTMEaSJCP8F7VKmoI7xQEFIUtQQsr
 TBhEE+VdbQa67qQ1HL8RvAUGfykOTNW88VQlRZejRcNNFhn98uepFqzc2vmsn0vk+R24
 M+fU2VdAYT3/6Poqf6WF0ZqmvVF9yiwBLllMeu3ysIPIwgyjLzZT1Cu3XwsjCupUpZUb
 ZmZC1wkrOonQnIciPeX8RnBKPxf5HrfSXc1qN1bP1I+1oyA3XYzt81YIoKK0SvaAx1uD
 dxng==
X-Gm-Message-State: AOAM533TGEelCkg58HKawV8KpqVpkpiynLNeB1jcaE+zKFN82ob74urI
 ZlCtXprPdJq2Kiq6QLDDFsLyzLP4/1U7RO7qERW4nBMy
X-Google-Smtp-Source: ABdhPJyedLosMi9DTMI3cZe6mklv8C/MjfcGEGtOrgVxrZtw0BXTtOsdhgOaWKk6a1s7FQ1D+WVIw9GXsgQ9Mw5lmwU=
X-Received: by 2002:a7b:c012:: with SMTP id c18mr713621wmb.94.1620673343572;
 Mon, 10 May 2021 12:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
 <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
 <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
In-Reply-To: <CAKMK7uGPGbOPRtJaiG5oNCDhYQ27+V3bO5Wcgv7C9fqdyp8LeA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 May 2021 12:06:05 -0700
Message-ID: <CAF6AEGto1PQcEbYeWfXqMatK0z3dW-mpLNVh=VJb=9gwrPfCWg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
To: Daniel Vetter <daniel@ffwll.ch>
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

On Mon, May 10, 2021 at 10:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 10, 2021 at 6:51 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > > > mode" type displays, which is pointless and unnecessary.  Add an
> > > > optional helper vfunc to determine if a plane is attached to a CRTC
> > > > that actually needs dirtyfb, and skip over them.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > >
> > > So this is a bit annoying because the idea of all these "remap legacy uapi
> > > to atomic constructs" helpers is that they shouldn't need/use anything
> > > beyond what userspace also has available. So adding hacks for them feels
> > > really bad.
> >
> > I suppose the root problem is that userspace doesn't know if dirtyfb
> > (or similar) is actually required or is a no-op.
> >
> > But it is perhaps less of a problem because this essentially boils
> > down to "x11 vs wayland", and it seems like wayland compositors for
> > non-vsync'd rendering just pageflips and throws away extra frames from
> > the app?
>
> Yeah it's about not adequately batching up rendering and syncing with
> hw. bare metal x11 is just especially stupid about it :-)
>
> > > Also I feel like it's not entirely the right thing to do here either.
> > > We've had this problem already on the fbcon emulation side (which also
> > > shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> > > there was to have a worker which batches up all the updates and avoids any
> > > stalls in bad places.
> >
> > I'm not too worried about fbcon not being able to render faster than
> > vblank.  OTOH it is a pretty big problem for x11
>
> That's why we'd let the worker get ahead at most one dirtyfb. We do
> the same with fbcon, which trivially can get ahead of vblank otherwise
> (if sometimes flushes each character, so you have to pile them up into
> a single update if that's still pending).
>
> > > Since this is for frontbuffer rendering userspace only we can probably get
> > > away with assuming there's only a single fb, so the implementation becomes
> > > pretty simple:
> > >
> > > - 1 worker, and we keep track of a single pending fb
> > > - if there's already a dirty fb pending on a different fb, we stall for
> > >   the worker to start processing that one already (i.e. the fb we track is
> > >   reset to NULL)
> > > - if it's pending on the same fb we just toss away all the updates and go
> > >   with a full update, since merging the clip rects is too much work :-) I
> > >   think there's helpers so you could be slightly more clever and just have
> > >   an overall bounding box
> >
> > This doesn't really fix the problem, you still end up delaying sending
> > the next back-buffer to mesa
>
> With this the dirtyfb would never block. Also glorious frontbuffer
> tracking corruption is possible, but that's not the kernel's problem.
> So how would anything get held up in userspace.

the part about stalling if a dirtyfb is pending was what I was worried
about.. but I suppose you meant the worker stalling, rather than
userspace stalling (where I had interpreted it the other way around).
As soon as userspace needs to stall, you're losing again.

> > But we could re-work drm_framebuffer_funcs::dirty to operate on a
> > per-crtc basis and hoist the loop and check if dirtyfb is needed out
> > of drm_atomic_helper_dirtyfb()
>
> That's still using information that userspace doesn't have, which is a
> bit irky. We might as well go with your thing here then.

arguably, this is something we should expose to userspace.. for DSI
command-mode panels, you probably want to make a different decision
with regard to how many buffers in your flip-chain..

Possibly we should add/remove the fb_damage_clips property depending
on the display type (ie. video/pull vs cmd/push mode)?

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
> > >
> > > Could probably steal most of the implementation.
> > >
> > > This approach here feels a tad too much in the hacky area ...
> > >
> > > Thoughts?
> > > -Daniel
> > >
> > > > ---
> > > >  drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
> > > >  include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
> > > >  2 files changed, 22 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> > > > index 3a4126dc2520..a0bed1a2c2dc 100644
> > > > --- a/drivers/gpu/drm/drm_damage_helper.c
> > > > +++ b/drivers/gpu/drm/drm_damage_helper.c
> > > > @@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > > >  retry:
> > > >       drm_for_each_plane(plane, fb->dev) {
> > > >               struct drm_plane_state *plane_state;
> > > > +             struct drm_crtc *crtc;
> > > >
> > > >               ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> > > >               if (ret)
> > > > @@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> > > >                       continue;
> > > >               }
> > > >
> > > > +             crtc = plane->state->crtc;
> > > > +             if (crtc->helper_private->needs_dirtyfb &&
> > > > +                             !crtc->helper_private->needs_dirtyfb(crtc)) {
> > > > +                     drm_modeset_unlock(&plane->mutex);
> > > > +                     continue;
> > > > +             }
> > > > +
> > > >               plane_state = drm_atomic_get_plane_state(state, plane);
> > > >               if (IS_ERR(plane_state)) {
> > > >                       ret = PTR_ERR(plane_state);
> > > > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > > > index eb706342861d..afa8ec5754e7 100644
> > > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > > @@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
> > > >                                    bool in_vblank_irq, int *vpos, int *hpos,
> > > >                                    ktime_t *stime, ktime_t *etime,
> > > >                                    const struct drm_display_mode *mode);
> > > > +
> > > > +     /**
> > > > +      * @needs_dirtyfb
> > > > +      *
> > > > +      * Optional callback used by damage helpers to determine if fb_damage_clips
> > > > +      * update is needed.
> > > > +      *
> > > > +      * Returns:
> > > > +      *
> > > > +      * True if fb_damage_clips update is needed to handle DIRTYFB, False
> > > > +      * otherwise.  If this callback is not implemented, then True is
> > > > +      * assumed.
> > > > +      */
> > > > +     bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> > > >  };
> > > >
> > > >  /**
> > > > --
> > > > 2.30.2
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
