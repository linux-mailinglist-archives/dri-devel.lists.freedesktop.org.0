Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8555A654
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 05:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF01C10E2B6;
	Sat, 25 Jun 2022 03:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FB910E2B6;
 Sat, 25 Jun 2022 03:32:45 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e7so5438099wrc.13;
 Fri, 24 Jun 2022 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LKSco285r+LBQaMK3CEIw2Y2qyyLlRxk1QU/hwtaC7w=;
 b=pGbnH2iKlGn6nP41u7dMCmEWeVZTXyZSKKfbAPEqHgxJQEBNkUUfxz8QB8tfotERqO
 7g3bKs8R54D2UxsOeg7ziQQM9Oksyn1yEF9w0KBE2P7GgP8QdjFPTxE/LQ/0fIoK/Ci1
 YA4KyDAcRtVK/PLy5jcz3EwUVqY7pyS052CuTZGNZDoBXC+68SbFSgFOfcGw8l/n1dQP
 KO7chDVucEn5icBEv/yeYWFT3DAVns9rZmq9Gh4b3ozorLVK7BslOwmbRkgKOqRjcbhi
 Onb3eLGfq184O65NvaewS95eKbWjS5PVVE7/PVT+u47z5EmUs119b04LbKCkbwr2A9o1
 iHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LKSco285r+LBQaMK3CEIw2Y2qyyLlRxk1QU/hwtaC7w=;
 b=fWFF/QDP6q2cybc8kjP970KdUrzJuBiZhexf33KYdBgw9LrA6FHELmFb/Qy1AnZpQj
 tCUDIJ75CfYS2QQ6go/1GVP/evcGdFyNJOhOVcOHpnXC1oKfFqb8Pk1hoFok093RK0Bg
 iO3znggFckGgM4YTpGYnxrwSP5dzUsWskBWGF4QvG39qB52RKMY0SbBLDHXqiSd1jQfQ
 tlK/6MOLVBPbddWUNHYR41dN98imGY4mI8BY6unBuIdTf2+gW7iGU45BSQZneUFX1mkx
 uVhcu4C0+g54TF2j3PYtH62Er2KAEWEFI//e/NGS6HurPwxLRdLKgSMX79M5DpeL+FBb
 CDcg==
X-Gm-Message-State: AJIora/8zIqCJoRk9DlKwLYPRdOukrPX6BRnuFRpHkpg/o5g1iexLB8+
 V08KXzpoRyevlZax1STgB9y+R57bMKSM6YdnZFo=
X-Google-Smtp-Source: AGRyM1s7/4WbArtdYXdzQsrE61eW1zG66cSg/9SYyvW1Vr/b5J7u5RjICzNXTu+0WZziSzTzFzffhLTYZ8u/XYgr9VA=
X-Received: by 2002:a5d:4251:0:b0:21b:885b:2fcc with SMTP id
 s17-20020a5d4251000000b0021b885b2fccmr2065007wrr.52.1656127964050; Fri, 24
 Jun 2022 20:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220609174213.2265938-1-robdclark@gmail.com>
 <YrYjO1oSUqL8f4xV@phenom.ffwll.local>
In-Reply-To: <YrYjO1oSUqL8f4xV@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 24 Jun 2022 20:32:57 -0700
Message-ID: <CAF6AEGvB_uRAJG6YW4zFunHfigXLDdGV3R5Vp11vU4D5pzi0eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
To: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Chris Healy <cphealy@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>
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

On Fri, Jun 24, 2022 at 1:49 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Jun 09, 2022 at 10:42:11AM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
> > provide additional file ops, like show_fdinfo().
> >
> > v2: Split out DRM_GEM_FOPS instead of making DEFINE_DRM_GEM_FOPS
> >     varardic
> > v3: nits
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> We're at three drivers, maybe it'd be better if this is more standardized?
> I feel like we're opening a bit a can of worms here where everyone just
> has some good odl fashioned fun. It's at least much better documented than
> the old property proliferation :-)

yeah, we could have a standardized drm_show_fdinfo() fop plus
drm_driver callback.. at this point the drm core fxn would be rather
boring, ie. only printing dev->driver->name, so I didn't pursue that
approach (yet?).. but perhaps that changes over time.  I think we
chose the right approach here, focusing on the documentation first so
that userspace has a standardized experience.  The kernel side of
things, we are free to refactor at any time ;-)

BR,
-R

> -Daniel
>
> > ---
> >  include/drm/drm_gem.h | 26 ++++++++++++++++++--------
> >  1 file changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index 9d7c61a122dc..87cffc9efa85 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -314,6 +314,23 @@ struct drm_gem_object {
> >       const struct drm_gem_object_funcs *funcs;
> >  };
> >
> > +/**
> > + * DRM_GEM_FOPS - Default drm GEM file operations
> > + *
> > + * This macro provides a shorthand for setting the GEM file ops in the
> > + * &file_operations structure.  If all you need are the default ops, use
> > + * DEFINE_DRM_GEM_FOPS instead.
> > + */
> > +#define DRM_GEM_FOPS \
> > +     .open           = drm_open,\
> > +     .release        = drm_release,\
> > +     .unlocked_ioctl = drm_ioctl,\
> > +     .compat_ioctl   = drm_compat_ioctl,\
> > +     .poll           = drm_poll,\
> > +     .read           = drm_read,\
> > +     .llseek         = noop_llseek,\
> > +     .mmap           = drm_gem_mmap
> > +
> >  /**
> >   * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
> >   * @name: name for the generated structure
> > @@ -330,14 +347,7 @@ struct drm_gem_object {
> >  #define DEFINE_DRM_GEM_FOPS(name) \
> >       static const struct file_operations name = {\
> >               .owner          = THIS_MODULE,\
> > -             .open           = drm_open,\
> > -             .release        = drm_release,\
> > -             .unlocked_ioctl = drm_ioctl,\
> > -             .compat_ioctl   = drm_compat_ioctl,\
> > -             .poll           = drm_poll,\
> > -             .read           = drm_read,\
> > -             .llseek         = noop_llseek,\
> > -             .mmap           = drm_gem_mmap,\
> > +             DRM_GEM_FOPS,\
> >       }
> >
> >  void drm_gem_object_release(struct drm_gem_object *obj);
> > --
> > 2.36.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
