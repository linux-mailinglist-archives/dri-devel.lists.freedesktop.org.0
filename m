Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADA1CA8C5
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 12:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B086EADE;
	Fri,  8 May 2020 10:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C126EADE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 10:55:01 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id l25so793063vso.6
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 03:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77ryQa29UcFg6iNsEwPfsvaiEV74Qd+8UCA5SqqAQ50=;
 b=vaHX8n2TBOCRXnrzq5O/Xg8OMnPodtQQMNq2pDSkp14tpcd2Rhgt8U2mVh2uABZgay
 KyErAwvIwIC+2KZHRdw4fUwR7zW6z5Sn/V0Zn1uBEE6nM+rSRlt3bdcJPtH5y7OISaqe
 0rjb/pNtpW63A5Ivx68e1c/RA1LDswk0JtUQ0noCVUQstp8kpKfWKjVroEfkVTZr9nCb
 G/3R0YJJdoGHoP0XSeCafNq/8jzaK5/8jaFLWNKLjuYde7dc3g9WXTzbNE73Dh0gV6z2
 lYqNzCOXHAWKxZG4dkp0IeDzg5NV6pUCr5TX9Sl8q65INLG36HJRpmuCKTAs+QmqyjdP
 Cr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77ryQa29UcFg6iNsEwPfsvaiEV74Qd+8UCA5SqqAQ50=;
 b=hu646ZsCKpUSlimQv4XplMDm7g87WK/kgJ+xbIS9Q0kes4rGsgPH9zQd819YBAeAuV
 BQ0LzRF2ACjtN36ypbWKQz8Jg60bi04G+T93dduvLpIorkzzfwyupDVzUcw9w2O3ugWG
 pAFVTd6+CdGuctwy46+EGv+hzGjnbuuoArWBSeM+XZ32isp70ArYl8u9FR6xhQrFhiJe
 ZHsBqmAf6DnduFkZ1oIojod+sU+n3DKVEVKASREHZxMXkYWCLvUQ8Fa7zjLsf3pHgv+p
 //wisR8En2f61zs9aRCjnmc4+Z1Hwad6xhLWDj0sjn8GKGKmjHwvuYjR7Sydr/VAFUUQ
 wWTQ==
X-Gm-Message-State: AGi0Pubn0B0UT59iQ3Rm4tEymUDqItuFEZxbX2F0QFiG+G+eqIzvXkwZ
 8OnvDc6lnj+KKgFZxvwac+JyZ9hLB5+DRC5xFx0=
X-Google-Smtp-Source: APiQypJVlumqlB1EGozpt89kZplHq+w/ovDz8O+M6NmvyVkiOrV+lWxO0HqYzBNd3ALnnEAhCMuaEmlK21X1M0p7wzU=
X-Received: by 2002:a67:b91a:: with SMTP id q26mr1279185vsn.118.1588935300079; 
 Fri, 08 May 2020 03:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-10-emil.l.velikov@gmail.com>
 <20200508064343.GC1383626@phenom.ffwll.local>
In-Reply-To: <20200508064343.GC1383626@phenom.ffwll.local>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 8 May 2020 11:52:28 +0100
Message-ID: <CACvgo52ZHM-K0wPDMN8h0OG6tuurK35W84aAWWG=8m45+4Rpcw@mail.gmail.com>
Subject: Re: [PATCH 09/36] drm/gem: fold drm_gem_object_put_unlocked and
 __drm_gem_object_put()
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 May 2020 at 07:43, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, May 07, 2020 at 04:07:55PM +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > With earlier patch we removed the normal overhead so now we can lift
> > the helper to the header, folding it __drm_object_put.
> >
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c                  | 19 -------------------
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 +-
> >  include/drm/drm_gem.h                      | 17 ++++-------------
> >  3 files changed, 5 insertions(+), 33 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index dab8763b2e73..599d5ff53b73 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -982,25 +982,6 @@ drm_gem_object_free(struct kref *kref)
> >  }
> >  EXPORT_SYMBOL(drm_gem_object_free);
> >
> > -/**
> > - * drm_gem_object_put_unlocked - drop a GEM buffer object reference
> > - * @obj: GEM buffer object
> > - *
> > - * This releases a reference to @obj. Callers must not hold the
> > - * &drm_device.struct_mutex lock when calling this function.
> > - *
> > - * See also __drm_gem_object_put().
> > - */
> > -void
> > -drm_gem_object_put_unlocked(struct drm_gem_object *obj)
> > -{
> > -     if (!obj)
> > -             return;
> > -
> > -     kref_put(&obj->refcount, drm_gem_object_free);
> > -}
> > -EXPORT_SYMBOL(drm_gem_object_put_unlocked);
> > -
> >  /**
> >   * drm_gem_object_put - release a GEM buffer object reference
> >   * @obj: GEM buffer object
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index 2faa481cc18f..41351cbf31b5 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -105,7 +105,7 @@ __attribute__((nonnull))
> >  static inline void
> >  i915_gem_object_put(struct drm_i915_gem_object *obj)
> >  {
> > -     __drm_gem_object_put(&obj->base);
> > +     drm_gem_object_put_unlocked(&obj->base);
> >  }
> >
> >  #define assert_object_held(obj) dma_resv_assert_held((obj)->base.resv)
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index ec2d24a60a76..7c877bea7b3a 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -364,27 +364,18 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
> >  }
> >
> >  /**
> > - * __drm_gem_object_put - raw function to release a GEM buffer object reference
> > + * drm_gem_object_put_unlocked - drop a GEM buffer object reference
> >   * @obj: GEM buffer object
> >   *
> > - * This function is meant to be used by drivers which are not encumbered with
> > - * &drm_device.struct_mutex legacy locking and which are using the
> > - * gem_free_object_unlocked callback. It avoids all the locking checks and
> > - * locking overhead of drm_gem_object_put() and drm_gem_object_put_unlocked().
> > - *
> > - * Drivers should never call this directly in their code. Instead they should
> > - * wrap it up into a ``driver_gem_object_put(struct driver_gem_object *obj)``
> > - * wrapper function, and use that. Shared code should never call this, to
> > - * avoid breaking drivers by accident which still depend upon
> > - * &drm_device.struct_mutex locking.
> > + * This releases a reference to @obj. Callers must not hold the
> > + * &drm_device.struct_mutex lock when calling this function.
>
> 2nd sentence talking about struct_mutex isn't true anymore, since nothing
> in here calls mutex_lock(obj->dev->struct_mutex); With your cleanup here
> we officially don't care about struct_mutex in the drm core!
>
> Aside from that lgtm, with that sentence removed:
>
Seems like I've forgot another reference in the documentation for
"gem_free_object_unlocked"

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Thanks
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
