Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B54831AD7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 14:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C74910E7E0;
	Thu, 18 Jan 2024 13:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A7610E7E0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 13:52:52 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-557678c50feso3149010a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1705585911; x=1706190711; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4tPP+r9+ezY9j82nhlqzDTEXBrtRUDJFmXSpgQNxqeU=;
 b=RA2QGpivbVGPjepYzgwQRXUY617zjUNAtCRbEPKkBxE7A8Pfc8V85TwObzWFvUkKjW
 U7iz6B0ub+7yMhG6XtYIqe1/uOoGvx9JWEUjLGpG0KVDhOeiOWT3nYKe0adXOBnfsVi8
 a52W5T89wC3Ant7QtVA0Wwgfyey8AZRY7Hvdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705585911; x=1706190711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4tPP+r9+ezY9j82nhlqzDTEXBrtRUDJFmXSpgQNxqeU=;
 b=q+U5p3XTEQJepjYGE/43qQuC0sUMwkxhO5MjPc0/O4Rde10MKX2+Eu5w9giX+6HbZr
 NHEVqkVdBZR0qI/4zVHfNR+RkXAoiba2LzZ778mu8ccA9xwkGbkvGndP0TmHST4XWxAS
 Nn7A7oBNYGm+exkfGT08Nn7GdzIXQmWoDBsMlTnh3ejpQtKo/6cchAhRjeHb+l8vNhQg
 KfLPLYBkWItPCWIIxxhIi0Lqg2UJbvs921ssHLTD6BptZyRmJb2CAL9LNe+fCMCruORK
 xD1xzB43u9e9HT+GiAo4aS8BjfCruxgUdpYf4dak1/eU/XazU2ECiQ32EBihuqrtPzqS
 hggQ==
X-Gm-Message-State: AOJu0YyFIdVyuN8xj7qT6qCsTnouOpCOd2wSw/G8m1gqQqfscpWyUZMO
 vpHxcs4mn1/STfDp/3OE41xbUis0/HlIIAYMB6vNxyC1wuy0Z8zYeya0SNMs2hg=
X-Google-Smtp-Source: AGHT+IFSjoAM75BSdKckIXa+s+fg1kjIuThVAvDgdh5fI24XR/UsCfAn8Hv7kEp1awQEcdAgCpbSYw==
X-Received: by 2002:a50:fa96:0:b0:559:c036:8456 with SMTP id
 w22-20020a50fa96000000b00559c0368456mr1235959edr.4.1705585911217; 
 Thu, 18 Jan 2024 05:51:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 7-20020a0564021f4700b00557de30e1f1sm9409397edz.74.2024.01.18.05.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 05:51:50 -0800 (PST)
Date: Thu, 18 Jan 2024 14:51:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Message-ID: <Zaks9AYf05XIARdd@phenom.ffwll.local>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
 <ZaFBofhe217zCmWN@phenom.ffwll.local>
 <e4f14ab3-cb16-43fa-9201-16e132871225@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4f14ab3-cb16-43fa-9201-16e132871225@redhat.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: bluescreen_avenger@verizon.net, Daniel Vetter <daniel@ffwll.ch>,
 javierm@redhat.com, mripard@kernel.org, gpiccoli@igalia.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 17, 2024 at 03:28:09PM +0100, Jocelyn Falempe wrote:
> 
> 
> On 12/01/2024 14:41, Daniel Vetter wrote:
> > On Thu, Jan 04, 2024 at 05:00:49PM +0100, Jocelyn Falempe wrote:
> > > This was initialy done for imx6, but should work on most drivers
> > > using drm_fb_dma_helper.
> > > 
> > > Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> > > ---
> > >   drivers/gpu/drm/drm_fb_dma_helper.c | 55 +++++++++++++++++++++++++++++
> > >   include/drm/drm_fb_dma_helper.h     |  4 +++
> > >   2 files changed, 59 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
> > > index 3b535ad1b07c..caed2935df4f 100644
> > > --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> > > +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> > > @@ -15,6 +15,7 @@
> > >   #include <drm/drm_framebuffer.h>
> > >   #include <drm/drm_gem_dma_helper.h>
> > >   #include <drm/drm_gem_framebuffer_helper.h>
> > > +#include <drm/drm_panic.h>
> > >   #include <drm/drm_plane.h>
> > >   #include <linux/dma-mapping.h>
> > >   #include <linux/module.h>
> > > @@ -148,3 +149,57 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
> > >   	}
> > >   }
> > >   EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
> > > +
> > > +#if defined(CONFIG_DRM_PANIC)
> > > +/**
> > > + * @dev: DRM device
> > > + * @drm_scanout_buffer: scanout buffer for the panic handler
> > > + * Returns: 0 or negative error code
> > > + *
> > > + * Generic get_scanout_buffer() implementation, for drivers that uses the
> > > + * drm_fb_dma_helper.
> > > + */
> > > +int drm_panic_gem_get_scanout_buffer(struct drm_device *dev,
> > > +				     struct drm_scanout_buffer *sb)
> > > +{
> > > +	struct drm_plane *plane;
> > > +	struct drm_gem_dma_object *dma_obj;
> > > +	struct drm_framebuffer *fb;
> > > +
> > > +	drm_for_each_primary_visible_plane(plane, dev) {
> > 
> > Ok that's not enough locking by far. You can't just hope that nothing
> > disappears while you're in a panic handler. We've been there and ended up
> > reliably oopsing in the panic handler itself. So you _have_ to follow the
> > full set of locking rules for all drm structures, or things will just get
> > worse at the worst possible moment.
> > 
> > But also, you're not allowed to do anything else than trylock, because a
> > panic handler might run from nmi context, and so you cannot even acquire
> > irq-safe spinlocks reliably.
> > 
> > Which means:
> > 
> > - You need to be safe against concurrent drm_dev_unregister. Using the
> >    atomic panic notifier directly for each device should take care of that
> >    (but maybe that stuff is still not nmi safe, not sure).
> > 
> > - You _have_ to use all the locks. Luckily iterating over the plane list
> >    doesn't need one, but you have to trylock the plane's modeset lock.
> >    Which means your nice iterator macro is already toast, because that
> >    already looks at state it's not allowed to look at without a lock. Or
> >    well, the plane->state pointer is no-go already.
> 
> mutex_trylock() shouldn't be called from interrupt context, and as the panic
> may occurs in irq, I can't use that.

Yeah I learned that later that day too, disappointing :-/

What's worse, spin_trylock is also no-go, because on r-t kernel they're
essentially sleeping locks. And so spin_trylock can retry in a loop, and
if we interrupt another thread at /just/ the right moment where the
spinlock is in an inconsistent state, the spin_trylock in the panic
handler will loop forever.

> But the panic context should guarantee that only one CPU is still running:
> https://elixir.bootlin.com/linux/latest/source/kernel/panic.c#L310

Uh no, panics can nest so you might panic while a panic is going on and
interrupt it in the middle. So just making sure no other code is running
isn't enough unfortunately.

Also the ipi stuff that should ensure the other cpu is stopped might not
work, afaiui in nmi panic context you cannot send around ipi.

> So I think using mutex_is_locked() should be safe:
> https://elixir.bootlin.com/linux/latest/source/include/linux/mutex.h#L128
> 
> This will only check if the lock is not taken, but as it's not possible for
> another task to run at the same time, I think that should be good enough ?
> 
> The drawback, is if we want to test without crashing the kernel, then we
> need to take the locks with trylock(), (and it's safe this time), but the
> code path would be slightly different.

So I think this predates some of irc chat, and I haven't typed up what I
designed together with John Ogness. Haven't done the patch yet, but rought
sketch:

- we use a raw_spin_lock. That's the _only_ lock type where trylock is ok

- we protect the drm_plane->state update with that lock. That's an
  extremely tiny section of code, so should be fine.

- For just that pointer update we could also use rcu, but using a spinlock
  has the advantage that drivers with peek/poke mmio support (for
  accessing unmapping vram or similar) could wrap these mmio access with
  that spinlock, and so would be able to use peek/poke in their panic
  handler. As soon as we need to protect against mmio we really need a
  lock.

- Because the lock also provides a barrier there's a lot of things you can
  safely assume, and so don't need additional locking for that in the
  panic handler:

  - Anything that's invariant over the lifetime of a drm_device (as
    delineated by drm_dev_register/unregister) is safe to access, like the
    plane list or plane structure

  - Anything in drm_plane_state that's only computed in atomic_check and
    not touched in atomic_commit code anymore is safe to access. This
    means we can get at the bo and everything else without any locks, and
    anything that is invariant for the lifetime of the bo like vaddr for
    dma-helper bo is also fine.

  - Furthermore because ->prepare_fb is called _before_ this point, and we
    stall at the right places before we call ->cleanup_fb. Unfortunately
    the same isn't true for ->begin/end_fb_access (by design), so we
    cannot rely on everything, but we can rely on the fact that the
    framebuffer is correctly pinned for drivers using dynamic buffer
    managers. The kernel vmap might not be around though, I need to think
    more how we best solve that issue. But that's a problem for when we
    add panic support to the first such driver.

I think with this design we'd cover 95% of all cases by simply doing the
raw_spin_trylock before we call into the driver's callback.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
