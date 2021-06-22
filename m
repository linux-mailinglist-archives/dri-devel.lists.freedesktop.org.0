Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215F3B0E85
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 22:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236286E0BF;
	Tue, 22 Jun 2021 20:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359236E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 20:20:38 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 6-20020a9d07860000b02903e83bf8f8fcso22423129oto.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMlr66F72TbzNauuh4Pdip0CvBgsz0hPJLp6pFiN0as=;
 b=RaNcjHNqM/gmFoIPh6NlTSgfJrWUu4Y7nPn0HA6nSq7yVrBELUCnFFzaR+Pgrm2B7m
 zEe0weNkwvQJWIXKyitx7bHRAUD4h+cHmUkZFd8RiV3HOKXRBGIdBMCGRfhYm1bnyG9c
 53gDiuhUtMtE1VEdMlqXx/pu9A72KnCU1vAxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMlr66F72TbzNauuh4Pdip0CvBgsz0hPJLp6pFiN0as=;
 b=LYZB+j0fNUwCCVA9LHS5tZZUU3kUP2yCRIQEUxCDvKkPJasHYExyGRzvV/FfxSYXbp
 sbpd6b41+rfH2ySRpUPMKtzBhMpdI1adp1yl14Gh6VXrmUfLJLTO8/MDE1m0m7bzokMp
 c0NgY1Sc6MetV/zjSCKgzQWKHG3vC3WnshCF17ncyn0874U+LiWGTGHsqh4byTO7uY9+
 TmCfuazkW7+EooQk+GLra429agUNXjo0aN+EWznI07hgJegOOR9jmfwIeVl5dkILHl8N
 zIeCs2u3bce1DaD7BoanGTZd97aqNU1Qo1ZljAXxSfEsr1rrQOT3CU03CtxfzVPXsN1D
 g0NA==
X-Gm-Message-State: AOAM530M19eVf95eKmULrt+LJw3HnjafrabKnXJRpMURvDUIBFegq8qa
 i7HAHFMLueXEPkNy24ejdfHAxXlGwjRtNZGBVF4b/A==
X-Google-Smtp-Source: ABdhPJyVfrepcO8BWGNSfVHy2Dye6HB0YCUhH6vbdDids8lhE3tGBLIK11etQyU1vkLrxMSptxnqWjWM4lO2pLl2+aM=
X-Received: by 2002:a05:6830:2370:: with SMTP id
 r16mr4618662oth.188.1624393238272; 
 Tue, 22 Jun 2021 13:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-8-daniel.vetter@ffwll.ch>
 <YNI1i1D88TWZU1vR@ravnborg.org>
In-Reply-To: <YNI1i1D88TWZU1vR@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Jun 2021 22:20:27 +0200
Message-ID: <CAKMK7uGXvpLz=NxR9FB2YAA2DrAkC42OpnDy8Qr9NJdKMcvQLw@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/atomic-helper: make
 drm_gem_plane_helper_prepare_fb the default
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 9:10 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Daniel,
>
> On Tue, Jun 22, 2021 at 06:55:03PM +0200, Daniel Vetter wrote:
> > There's a bunch of atomic drivers who don't do this quite correctly,
> > luckily most of them aren't in wide use or people would have noticed
> > the tearing.
> >
> > By making this the default we avoid the constant audit pain and can
> > additionally remove a ton of lines from vfuncs for a bit more clarity
> > in smaller drivers.
> >
> > While at it complain if there's a cleanup_fb hook but no prepare_fb
> > hook, because that makes no sense. I haven't found any driver which
> > violates this, but better safe than sorry.
> >
> > Subsequent patches will reap the benefits.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c      | 10 ++++++++++
> >  drivers/gpu/drm/drm_gem_atomic_helper.c  |  3 +++
> >  include/drm/drm_modeset_helper_vtables.h |  7 +++++--
> >  3 files changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 531f2374b072..9f6c5f21c4d6 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -35,6 +35,7 @@
> >  #include <drm/drm_damage_helper.h>
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_gem_atomic_helper.h>
> >  #include <drm/drm_plane_helper.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_self_refresh_helper.h>
> > @@ -2408,6 +2409,15 @@ int drm_atomic_helper_prepare_planes(struct drm_device *dev,
> >                       ret = funcs->prepare_fb(plane, new_plane_state);
> >                       if (ret)
> >                               goto fail;
> > +             } else {
> > +                     WARN_ON_ONCE(funcs->cleanup_fb);
> > +
> > +                     if (!drm_core_check_feature(dev, DRIVER_GEM))
> > +                             continue;
> > +
> > +                     ret = drm_gem_plane_helper_prepare_fb(plane, new_plane_state);
> > +                     if (ret)
> > +                             goto fail;
> >               }
> >       }
> >
> > diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> > index a27135084ae5..bc9396f2a0ed 100644
> > --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> > @@ -135,6 +135,9 @@
> >   * GEM based framebuffer drivers which have their buffers always pinned in
> >   * memory.
> >   *
> > + * This function is the default implementation for GEM drivers of
> > + * &drm_plane_helper_funcs.prepare_fb if no callback is provided.
> > + *
> >   * See drm_atomic_set_fence_for_plane() for a discussion of implicit and
> >   * explicit fencing in atomic modeset updates.
> >   */
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index f3a4b47b3986..4e727261dca5 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -1178,8 +1178,11 @@ struct drm_plane_helper_funcs {
> >        * equivalent functionality should be implemented through private
> >        * members in the plane structure.
> >        *
> > -      * Drivers which always have their buffers pinned should use
> > -      * drm_gem_plane_helper_prepare_fb() for this hook.
> > +      * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
> s/not/nor/ ??

Yup.

> > +      * set drm_gem_plane_helper_prepare_fb() is called automatically to
>               ^add comma?
> > +      * implement this.
>
>
> Leave cleanup_fb out of the description to make it more readable.

With the not->nor typo fixed, why does this make it more readable?
Afaiui neither ... nor ... is fairly standard English, and I really
want to make this the default only if you specify absolutely no plane
fb handling of your own.

> In the description of cleanup_fb you can document that it is wrong to
> have it without a matcching prepare_fb if you feel for it.

So the reason I didn't document things that way is that imo the
"cleanup_fb  but not prepare_fb" case is just nonsense. But I also
didn't want to accidentally paper over bugs where people set only
cleanup_fb and forget to hook up the other one, hence the warning. But
if you think we should explain that in docs, I guess I can shuffle it
around. Just feel like specifying everything in the comments doesn't
help the readability of the docs.
-Daniel

>
>         Sam
>
>
>          * Other drivers which need additional plane processing
> > +      * can call drm_gem_plane_helper_prepare_fb() from their @prepare_fb
> > +      * hook.
> >        *
> >        * The helpers will call @cleanup_fb with matching arguments for every
> >        * successful call to this hook.
> > --
> > 2.32.0.rc2



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
