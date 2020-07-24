Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F1822C1A9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D456E3EC;
	Fri, 24 Jul 2020 09:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B64F6E3EC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:07:33 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id t198so7444666oie.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nqvO1S2mG20BJ09Eb0nAEicifTic6hOyt1/icCs+NPk=;
 b=GRXMjKgdg7mt6BihO7pC5jSY0d59lolU7wU6duJe7TZOmaeOGxj1S0kpZuP4mASFhX
 RfVgywMKuL4nKcG5HwSMhpBnMIATUI2MHzr6+EvEgKoU3XATwqbPtHHABf6KRdo2CVHK
 /tiuWW3vw0c+s0344T/yFkVlwtjxup5BJ86Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nqvO1S2mG20BJ09Eb0nAEicifTic6hOyt1/icCs+NPk=;
 b=SUA8Za6JYjOuRWAWpSd8GNNnbyj5a9uUnkxjaiTehfesfP/Jy7ToNIGG/cyeGMUddS
 B7l3G7deGTnybxocnL6sVn+2H06hmA2cwW462zeAgYzIfXjo3tkcC6I+EB7kTqcJ9e5W
 uedOFYiIWaXvaOUpz7waFDeV4G/tMiZNwOjYSLAVxXGWS+VdUbTFAsWu/60qFPWFZ4vX
 TOAH/17BJFl4h5x9wbcGu/A9sz9ujykFcGBk/D5IZkW/tql9BbvKcHO3yRnwVmds6xYM
 iEN/gR8d1SV+E5Up3l/E3+H3ScBW1srwNKI6WhWA4nyjkX9MOkDxYGm0v+hb5YiNownG
 Bkkw==
X-Gm-Message-State: AOAM533CmE95mRTwM4z2vLfjORB2RRsi4uidWfZhmit8C1ngjQglT+Bc
 xhViPsisSL3a92VASEOwTWVmv8nZ8yw5z8Y9jX+sXw==
X-Google-Smtp-Source: ABdhPJw2UlFdhLObdeQMUYIlzLACED/9arqmywrZ6UUki6YeIipXPVltZUYCcehWAdgDEksWvR0rEejxcmhwwpq0yEo=
X-Received: by 2002:a05:6808:88:: with SMTP id
 s8mr6790182oic.101.1595581652330; 
 Fri, 24 Jul 2020 02:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200723145614.18459-1-p.zabel@pengutronix.de>
 <cfffabc0edc59c33f2c0a77276bee20cafe11220.camel@pengutronix.de>
In-Reply-To: <cfffabc0edc59c33f2c0a77276bee20cafe11220.camel@pengutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 24 Jul 2020 11:07:20 +0200
Message-ID: <CAKMK7uGaAtk4AY5y=jbC7nDduRYFBfLSdHE8wykJ602Lk-3n+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm: add drmm_encoder_init()
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Sascha Hauer <kernel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 24, 2020 at 10:49 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Thu, 2020-07-23 at 16:56 +0200, Philipp Zabel wrote:
> > Add a drm_encoder_init() variant that allocates an encoder with
> > drmm_kzalloc() and registers drm_encoder_cleanup() with
> > drmm_add_action_or_reset().
> >
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks for doing this!

> > ---
> > New in v2
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 101 ++++++++++++++++++++++++++--------
> >  include/drm/drm_encoder.h     |  30 ++++++++++
> >  2 files changed, 108 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index e555281f43d4..91184f67333c 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -26,6 +26,7 @@
> >  #include <drm/drm_device.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_encoder.h>
> > +#include <drm/drm_managed.h>
> >
> >  #include "drm_crtc_internal.h"
> >
> > @@ -91,25 +92,10 @@ void drm_encoder_unregister_all(struct drm_device *dev)
> >       }
> >  }
> >
> > -/**
> > - * drm_encoder_init - Init a preallocated encoder
> > - * @dev: drm device
> > - * @encoder: the encoder to init
> > - * @funcs: callbacks for this encoder
> > - * @encoder_type: user visible type of the encoder
> > - * @name: printf style format string for the encoder name, or NULL for default name
> > - *
> > - * Initialises a preallocated encoder. Encoder should be subclassed as part of
> > - * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > - * called from the driver's &drm_encoder_funcs.destroy hook.
> > - *
> > - * Returns:
> > - * Zero on success, error code on failure.
> > - */
> > -int drm_encoder_init(struct drm_device *dev,
> > -                  struct drm_encoder *encoder,
> > -                  const struct drm_encoder_funcs *funcs,
> > -                  int encoder_type, const char *name, ...)
> > +static int __drm_encoder_init(struct drm_device *dev,
> > +                           struct drm_encoder *encoder,
> > +                           const struct drm_encoder_funcs *funcs,
> > +                           int encoder_type, const char *name, va_list ap)
> >  {
> >       int ret;
> >
> > @@ -125,11 +111,7 @@ int drm_encoder_init(struct drm_device *dev,
> >       encoder->encoder_type = encoder_type;
> >       encoder->funcs = funcs;
> >       if (name) {
> > -             va_list ap;
> > -
> > -             va_start(ap, name);
> >               encoder->name = kvasprintf(GFP_KERNEL, name, ap);
> > -             va_end(ap);
> >       } else {
> >               encoder->name = kasprintf(GFP_KERNEL, "%s-%d",
> >                                         drm_encoder_enum_list[encoder_type].name,
> > @@ -150,6 +132,38 @@ int drm_encoder_init(struct drm_device *dev,
> >
> >       return ret;
> >  }
> > +
> > +/**
> > + * drm_encoder_init - Init a preallocated encoder
> > + * @dev: drm device
> > + * @encoder: the encoder to init
> > + * @funcs: callbacks for this encoder
> > + * @encoder_type: user visible type of the encoder
> > + * @name: printf style format string for the encoder name, or NULL for default name
> > + *
> > + * Initialises a preallocated encoder. Encoder should be subclassed as part of
> > + * driver encoder objects. At driver unload time drm_encoder_cleanup() should be
> > + * called from the driver's &drm_encoder_funcs.destroy hook.
> > + *
> > + * Returns:
> > + * Zero on success, error code on failure.
> > + */
> > +int drm_encoder_init(struct drm_device *dev,
> > +                  struct drm_encoder *encoder,
> > +                  const struct drm_encoder_funcs *funcs,
> > +                  int encoder_type, const char *name, ...)
> > +{
> > +     va_list ap;
> > +     int ret;
> > +
> > +     if (name)
> > +             va_start(ap, name);
> > +     ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > +     if (name)
> > +             va_end(ap);
> > +
> > +     return ret;
> > +}
> >  EXPORT_SYMBOL(drm_encoder_init);
> >
> >  /**
> > @@ -181,6 +195,47 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  }
> >  EXPORT_SYMBOL(drm_encoder_cleanup);
> >
> > +void drmm_encoder_init_release(struct drm_device *dev, void *ptr)
> > +{
> > +     struct drm_encoder *encoder = ptr;
>
> I'll add
>
>         if (WARN_ON(!encoder->dev))
>                 return;
>
> here.
>
> > +     drm_encoder_cleanup(encoder);
> > +}
> > +
> > +void *__drmm_encoder_init(struct drm_device *dev, size_t size, size_t offset,
> > +                       const struct drm_encoder_funcs *funcs,
> > +                       int encoder_type, const char *name, ...)
> > +{
> > +     void *container;
> > +     struct drm_encoder *encoder;
> > +     va_list ap;
> > +     int ret;
> > +
> > +     if (WARN_ON(!funcs || funcs->destroy))
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     container = drmm_kzalloc(dev, size, GFP_KERNEL);
> > +     if (!container)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     encoder = container + offset;
> > +
> > +     if (name)
> > +             va_start(ap, name);
> > +     ret = __drm_encoder_init(dev, encoder, funcs, encoder_type, name, ap);
> > +     if (name)
> > +             va_end(ap);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     ret = drmm_add_action_or_reset(dev, drmm_encoder_init_release, encoder);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return container;
> > +}
> > +EXPORT_SYMBOL(__drmm_encoder_init);
> > +
> >  static struct drm_crtc *drm_encoder_get_crtc(struct drm_encoder *encoder)
> >  {
> >       struct drm_connector *connector;
> > diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> > index a60f5f1555ac..54b82554ee88 100644
> > --- a/include/drm/drm_encoder.h
> > +++ b/include/drm/drm_encoder.h
> > @@ -195,6 +195,36 @@ int drm_encoder_init(struct drm_device *dev,
> >                    const struct drm_encoder_funcs *funcs,
> >                    int encoder_type, const char *name, ...);
> >
> > +__printf(6, 7)
> > +void *__drmm_encoder_init(struct drm_device *dev,
> > +                       size_t size, size_t offset,
> > +                       const struct drm_encoder_funcs *funcs,
> > +                       int encoder_type,
> > +                       const char *name, ...);
> > +
> > +/**
> > + * drmm_encoder_init - Allocate and initialize an encoder
> > + * @dev: drm device
> > + * @type: the type of the struct which contains struct &drm_encoder
> > + * @member: the name of the &drm_encoder within @type.
> > + * @funcs: callbacks for this encoder
> > + * @encoder_type: user visible type of the encoder
> > + * @name: printf style format string for the encoder name, or NULL for default name
> > + *
> > + * Allocates and initializes an encoder. Encoder should be subclassed as part of
> > + * driver encoder objects. Cleanup is automatically handled through registering
> > + * drm_encoder_cleanup() with drmm_add_action().
> > + *
> > + * The @drm_encoder_funcs.destroy hook must be NULL.
> > + *
> > + * Returns:
> > + * Pointer to new encoder, or ERR_PTR on failure.
> > + */
> > +#define drmm_encoder_init(dev, type, member, funcs, encoder_type, name, ...) \
> > +     ((type *) __drmm_encoder_init(dev, sizeof(type), \
> > +                                   offsetof(type, member), funcs, \
> > +                                   encoder_type, name, ##__VA_ARGS__))
> > +
>
> Should this be called drmm_encoder_alloc instead?

Yes. Same for the internal helper for consistency. Also see my other
reply, if the _alloc() variant is all that's needed that makes me
happy, since then we don't need to code up the drmm_assert_managed
check for the _init() variants to make sure drivers dont give it
something stupid like a devm_kzalloc range :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
