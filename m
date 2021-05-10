Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB86379490
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A486E8C5;
	Mon, 10 May 2021 16:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5986E8C5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:51:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso10020838wmc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vj82DQvWg391VDm1zJSxDbgIrEh76L9ZIZAnowRqXGQ=;
 b=gGoYE+hhb84BJBRxsSCnPggaZ/Ix5Gn6l8QEvHmsCyAHS8XNJokD9hZ/Km3Ge3WcSY
 o3SYApzWs+tzWK1zsn8kL7oZilDGG1X8Fe0iQIcsffxgUOsfpJQkEVEGc6mQi9nK+jOE
 dPdWezbX9yROlSOUDfFJk7Vyx74xYToaGjOv92FzG3F7hKJIyLeJdGkTg5iHnvYhMejr
 U4PBSgrnat5JAgUw8XyVnpB2qGB3AG0p1cTmaUYcHMs9/j/MQDVD74uOMBBTLFZP50dn
 ixXd9rtPO9rRsjUtXz5SkkaZ7xCEUwb86Pr/6jRr6KKb5Id2CfinYqjEWf3D8xJh/nfw
 10bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vj82DQvWg391VDm1zJSxDbgIrEh76L9ZIZAnowRqXGQ=;
 b=Epq7v41XgfQP5AtJfWqmkjI72h1R7Wn4iLByT3VFGY6XFQv5gPXB7ISwgvBRieQay5
 3MswBVSwYco6Z9Kb1QHjrLR5auxevjNPZBFQQu82RAzwDDgn6nygRbzeMGNZPDe+hR6M
 4kE1T9XqpQkAIGO7c75va2JvW3UzgyXcWcHA+Sfig1uOpw3DLlTsIZ87CPH88Ob5Pfzk
 atEx7+mey5lXg/J5tWv94BN6vFVm3UNXZhHGnHmXlwZ+UWUoQBtL4fDbr8XtaqQwmiR+
 fcMPIIx3Dpzmv0zpq965D7Er7S+PLbB3457V6Itduzx1C3h7KLAAVM+I4vmQQnc2G09C
 fOtA==
X-Gm-Message-State: AOAM530BMVeHTlpVNmnjpV/5jUsag//m9wwFrT5fe1ocovkRq35kuWb5
 KY0M9qwsFCgDm+xen5zYJG/Dm6rPbG1xM/Go8YCHPjvzLEY=
X-Google-Smtp-Source: ABdhPJydE0p3nCV4Jnaoqt8BOhaG8kUQeipThsmaq28Q7e38GoG5kt6v6kD4gQ1kE2NtqQC4kpI9rx0k9sp/WdAHhV0=
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr27297198wmj.175.1620665510955; 
 Mon, 10 May 2021 09:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
In-Reply-To: <YJlb3GO41hiu4pWw@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 10 May 2021 09:55:32 -0700
Message-ID: <CAF6AEGsGb1jZgRRUqDvf+j+E6pNEtSck=r3xh4VL7FmZMPszBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 open list <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > mode" type displays, which is pointless and unnecessary.  Add an
> > optional helper vfunc to determine if a plane is attached to a CRTC
> > that actually needs dirtyfb, and skip over them.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> So this is a bit annoying because the idea of all these "remap legacy uapi
> to atomic constructs" helpers is that they shouldn't need/use anything
> beyond what userspace also has available. So adding hacks for them feels
> really bad.

I suppose the root problem is that userspace doesn't know if dirtyfb
(or similar) is actually required or is a no-op.

But it is perhaps less of a problem because this essentially boils
down to "x11 vs wayland", and it seems like wayland compositors for
non-vsync'd rendering just pageflips and throws away extra frames from
the app?

> Also I feel like it's not entirely the right thing to do here either.
> We've had this problem already on the fbcon emulation side (which also
> shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> there was to have a worker which batches up all the updates and avoids any
> stalls in bad places.

I'm not too worried about fbcon not being able to render faster than
vblank.  OTOH it is a pretty big problem for x11

> Since this is for frontbuffer rendering userspace only we can probably get
> away with assuming there's only a single fb, so the implementation becomes
> pretty simple:
>
> - 1 worker, and we keep track of a single pending fb
> - if there's already a dirty fb pending on a different fb, we stall for
>   the worker to start processing that one already (i.e. the fb we track is
>   reset to NULL)
> - if it's pending on the same fb we just toss away all the updates and go
>   with a full update, since merging the clip rects is too much work :-) I
>   think there's helpers so you could be slightly more clever and just have
>   an overall bounding box

This doesn't really fix the problem, you still end up delaying sending
the next back-buffer to mesa

But we could re-work drm_framebuffer_funcs::dirty to operate on a
per-crtc basis and hoist the loop and check if dirtyfb is needed out
of drm_atomic_helper_dirtyfb()

BR,
-R

>
> Could probably steal most of the implementation.
>
> This approach here feels a tad too much in the hacky area ...
>
> Thoughts?
> -Daniel
>
> > ---
> >  drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
> >  include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> > index 3a4126dc2520..a0bed1a2c2dc 100644
> > --- a/drivers/gpu/drm/drm_damage_helper.c
> > +++ b/drivers/gpu/drm/drm_damage_helper.c
> > @@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> >  retry:
> >       drm_for_each_plane(plane, fb->dev) {
> >               struct drm_plane_state *plane_state;
> > +             struct drm_crtc *crtc;
> >
> >               ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> >               if (ret)
> > @@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> >                       continue;
> >               }
> >
> > +             crtc = plane->state->crtc;
> > +             if (crtc->helper_private->needs_dirtyfb &&
> > +                             !crtc->helper_private->needs_dirtyfb(crtc)) {
> > +                     drm_modeset_unlock(&plane->mutex);
> > +                     continue;
> > +             }
> > +
> >               plane_state = drm_atomic_get_plane_state(state, plane);
> >               if (IS_ERR(plane_state)) {
> >                       ret = PTR_ERR(plane_state);
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index eb706342861d..afa8ec5754e7 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
> >                                    bool in_vblank_irq, int *vpos, int *hpos,
> >                                    ktime_t *stime, ktime_t *etime,
> >                                    const struct drm_display_mode *mode);
> > +
> > +     /**
> > +      * @needs_dirtyfb
> > +      *
> > +      * Optional callback used by damage helpers to determine if fb_damage_clips
> > +      * update is needed.
> > +      *
> > +      * Returns:
> > +      *
> > +      * True if fb_damage_clips update is needed to handle DIRTYFB, False
> > +      * otherwise.  If this callback is not implemented, then True is
> > +      * assumed.
> > +      */
> > +     bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> >  };
> >
> >  /**
> > --
> > 2.30.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
