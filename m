Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE4D87BE80
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 15:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9F10E429;
	Thu, 14 Mar 2024 14:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="geUrobTt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D680110F91B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 14:09:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-33e972c8b67so263265f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1710425349; x=1711030149; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MTds7Ku0Y0zvROnkAd1fx4mLoDwEPxMJou4VP4zGo0A=;
 b=geUrobTtbtEHNs41RwG5Qdgu1XXUkdhckCCEyp/kvwGleQmJf6XcassZ4LfXKlmJ3m
 a0qqQMUL0oa2/V45F8MgAHz7xWKxcT46RZLdcXc8bxHM2lrmXnKlxCakglGZAD44XKxZ
 LD3REpLDI+bj7hyzRqEgVFKaP9nerzJut/ZPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710425349; x=1711030149;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MTds7Ku0Y0zvROnkAd1fx4mLoDwEPxMJou4VP4zGo0A=;
 b=R+4HUz4m7Y2wUFsjxaEsuvQtP2TwR5unXj+Qqq7u1CX5IT6bYUa5A0/18f3yOgOEh6
 CIpzRpTNIRbr3cHAPJCnnkK7BZk5voy2RM3iiRV9eBYP0hnDt0jxHqjMxZHgK1+CVWs1
 inlnqw0FtOtZqicdIQUlAFjHza6L1spj3J5Fkf8g+ByIdgEawCy/BqyyUeeNfYJMVHLF
 jK0hUtFrLbk4qMm1vRas9p2ktlX3xAInSp4GJPoV2DlRMjUWAlOX1PhoA0DyTyXA7JuG
 C853EoJlJImf+AG+qxq/ozXGEeON4DCktCwclh3f9gRxxBSQShn9mW4MpADTE3WVKq9x
 5cjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+PZ7KCxlQdKtPASaz72OtFQr4ihOiQkr+QEPJ0rrHCfEgLpUxix/s8q+mc4kB7DMMX2d0YdRFyeqDH3PeAFewpvDf2Ea3SYhV7vNzlPl6
X-Gm-Message-State: AOJu0YyLgCMLarUyNC2EZDzMHiUOsVdsdQpglSJNxcMreaH2sZZ1rK2r
 1ISEPgK+q1JUOD/SwBCZ1+BpENzN6Tqc+s1WocLvXncjgUvhHq/K3eSq1acLTU8=
X-Google-Smtp-Source: AGHT+IEkDOQeLZzZYiLsR9q8/J5l47gcQmwzXWbQB4zXmpD6uvYlhNv+7u2b8F5SkGubDSvpWP1QDw==
X-Received: by 2002:a05:600c:1e0a:b0:413:2ab0:873e with SMTP id
 ay10-20020a05600c1e0a00b004132ab0873emr26408wmb.3.1710425349040; 
 Thu, 14 Mar 2024 07:09:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600016cf00b0033dc931eb06sm944331wrf.0.2024.03.14.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 07:09:08 -0700 (PDT)
Date: Thu, 14 Mar 2024 15:09:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC] drm/panic: Add drm panic locking
Message-ID: <ZfMFAse426sG8OEA@phenom.ffwll.local>
Mail-Followup-To: Jocelyn Falempe <jfalempe@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
References: <20240301100516.2516297-1-daniel.vetter@ffwll.ch>
 <20240301103903.2538083-1-daniel.vetter@ffwll.ch>
 <78087e9b-533a-4d74-9ffe-8e4eb36e448a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78087e9b-533a-4d74-9ffe-8e4eb36e448a@redhat.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Fri, Mar 01, 2024 at 02:03:12PM +0100, Jocelyn Falempe wrote:
> Thanks for the patch.
> 
> I think it misses to initialize the lock, so we need to add a
> raw_spin_lock_init() in the drm device initialization.
> 
> Also I'm wondering if it make sense to put that under the CONFIG_DRM_PANIC
> flag, so that if you don't enable it, panic_lock() and panic_unlock() would
> be no-op.
> But that may not work if the driver uses this lock to protect some register
> access.

If we get drivers to use this for some of their own locking we have to
keep it enabled unconditionally. Also I think locking that's only
conditional on Kconfig is just a bit too suprising to be a good idea
irrespective of this specific case.
-Sima

> 
> Best regards,
> 
> -- 
> 
> Jocelyn
> 
> On 01/03/2024 11:39, Daniel Vetter wrote:
> > Rough sketch for the locking of drm panic printing code. The upshot of
> > this approach is that we can pretty much entirely rely on the atomic
> > commit flow, with the pair of raw_spin_lock/unlock providing any
> > barriers we need, without having to create really big critical
> > sections in code.
> > 
> > This also avoids the need that drivers must explicitly update the
> > panic handler state, which they might forget to do, or not do
> > consistently, and then we blow up in the worst possible times.
> > 
> > It is somewhat racy against a concurrent atomic update, and we might
> > write into a buffer which the hardware will never display. But there's
> > fundamentally no way to avoid that - if we do the panic state update
> > explicitly after writing to the hardware, we might instead write to an
> > old buffer that the user will barely ever see.
> > 
> > Note that an rcu protected deference of plane->state would give us the
> > the same guarantees, but it has the downside that we then need to
> > protect the plane state freeing functions with call_rcu too. Which
> > would very widely impact a lot of code and therefore doesn't seem
> > worth the complexity compared to a raw spinlock with very tiny
> > critical sections. Plus rcu cannot be used to protect access to
> > peek/poke registers anyway, so we'd still need it for those cases.
> > 
> > Peek/poke registers for vram access (or a gart pte reserved just for
> > panic code) are also the reason I've gone with a per-device and not
> > per-plane spinlock, since usually these things are global for the
> > entire display. Going with per-plane locks would mean drivers for such
> > hardware would need additional locks, which we don't want, since it
> > deviates from the per-console takeoverlocks design.
> > 
> > Longer term it might be useful if the panic notifiers grow a bit more
> > structure than just the absolute bare
> > EXPORT_SYMBOL(panic_notifier_list) - somewhat aside, why is that not
> > EXPORT_SYMBOL_GPL ... If panic notifiers would be more like console
> > drivers with proper register/unregister interfaces we could perhaps
> > reuse the very fancy console lock with all it's check and takeover
> > semantics that John Ogness is developing to fix the console_lock mess.
> > But for the initial cut of a drm panic printing support I don't think
> > we need that, because the critical sections are extremely small and
> > only happen once per display refresh. So generally just 60 tiny locked
> > sections per second, which is nothing compared to a serial console
> > running a 115kbaud doing really slow mmio writes for each byte. So for
> > now the raw spintrylock in drm panic notifier callback should be good
> > enough.
> > 
> > Another benefit of making panic notifiers more like full blown
> > consoles (that are used in panics only) would be that we get the two
> > stage design, where first all the safe outputs are used. And then the
> > dangerous takeover tricks are deployed (where for display drivers we
> > also might try to intercept any in-flight display buffer flips, which
> > if we race and misprogram fifos and watermarks can hang the memory
> > controller on some hw).
> > 
> > For context the actual implementation on the drm side is by Jocelyn
> > and this patch is meant to be combined with the overall approach in
> > v7 (v8 is a bit less flexible, which I think is the wrong direction):
> > 
> > https://lore.kernel.org/dri-devel/20240104160301.185915-1-jfalempe@redhat.com/
> > 
> > Note that the locking is very much not correct there, hence this
> > separate rfc.
> > 
> > v2:
> > - fix authorship, this was all my typing
> > - some typo oopsies
> > - link to the drm panic work by Jocelyn for context
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jocelyn Falempe <jfalempe@redhat.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: John Ogness <john.ogness@linutronix.de>
> > Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >   drivers/gpu/drm/drm_atomic_helper.c |  3 +
> >   include/drm/drm_mode_config.h       | 10 +++
> >   include/drm/drm_panic.h             | 99 +++++++++++++++++++++++++++++
> >   3 files changed, 112 insertions(+)
> >   create mode 100644 include/drm/drm_panic.h
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 40c2bd3e62e8..5a908c186037 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -38,6 +38,7 @@
> >   #include <drm/drm_drv.h>
> >   #include <drm/drm_framebuffer.h>
> >   #include <drm/drm_gem_atomic_helper.h>
> > +#include <drm/drm_panic.h>
> >   #include <drm/drm_print.h>
> >   #include <drm/drm_self_refresh_helper.h>
> >   #include <drm/drm_vblank.h>
> > @@ -3086,6 +3087,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
> >   		}
> >   	}
> > +	drm_panic_lock(state->dev);
> >   	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> >   		WARN_ON(plane->state != old_plane_state);
> > @@ -3095,6 +3097,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
> >   		state->planes[i].state = old_plane_state;
> >   		plane->state = new_plane_state;
> >   	}
> > +	drm_panic_unlock(state->dev);
> >   	for_each_oldnew_private_obj_in_state(state, obj, old_obj_state, new_obj_state, i) {
> >   		WARN_ON(obj->state != old_obj_state);
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > index 973119a9176b..e79f1a557a22 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -505,6 +505,16 @@ struct drm_mode_config {
> >   	 */
> >   	struct list_head plane_list;
> > +	/**
> > +	 * @panic_lock:
> > +	 *
> > +	 * Raw spinlock used to protect critical sections of code that access
> > +	 * the display hardware or modeset software state, which the panic
> > +	 * printing code must be protected against. See drm_panic_trylock(),
> > +	 * drm_panic_lock() and drm_panic_unlock().
> > +	 */
> > +	struct raw_spinlock panic_lock;
> > +
> >   	/**
> >   	 * @num_crtc:
> >   	 *
> > diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> > new file mode 100644
> > index 000000000000..f2135d03f1eb
> > --- /dev/null
> > +++ b/include/drm/drm_panic.h
> > @@ -0,0 +1,99 @@
> > +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> > +#ifndef __DRM_PANIC_H__
> > +#define __DRM_PANIC_H__
> > +
> > +#include <drm/drm_device.h>
> > +/*
> > + * Copyright (c) 2024 Intel
> > + */
> > +
> > +/**
> > + * drm_panic_trylock - try to enter the panic printing critical section
> > + * @dev: struct drm_device
> > + *
> > + * This function must be called by any panic printing code. The panic printing
> > + * attempt must be aborted if the trylock fails.
> > + *
> > + * Panic printing code can make the following assumptions while holding the
> > + * panic lock:
> > + *
> > + * - Anything protected by drm_panic_lock() and drm_panic_unlock() pairs is safe
> > + *   to access.
> > + *
> > + * - Furthermore the panic printing code only registers in drm_dev_unregister()
> > + *   and gets removed in drm_dev_unregister(). This allows the panic code to
> > + *   safely access any state which is invariant in between these two function
> > + *   calls, like the list of planes drm_mode_config.plane_list or most of the
> > + *   struct drm_plane structure.
> > + *
> > + * Specifically thanks to the protection around plane updates in
> > + * drm_atomic_helper_swap_state() the following additional guarantees hold:
> > + *
> > + * - It is safe to deference the drm_plane.state pointer.
> > + *
> > + * - Anything in struct drm_plane_state or the driver's subclass thereof which
> > + *   stays invariant after the atomic check code has finished is safe to access.
> > + *   Specifically this includes the reference counted pointers to framebuffer
> > + *   and buffer objects.
> > + *
> > + * - Anything set up by drm_plane_helper_funcs.fb_prepare and cleaned up
> > + *   drm_plane_helper_funcs.fb_cleanup is safe to access, as long as it stays
> > + *   invariant between these two calls. This also means that for drivers using
> > + *   dynamic buffer management the framebuffer is pinned, and therefer all
> > + *   relevant datastructures can be accessed without taking any further locks
> > + *   (which would be impossible in panic context anyway).
> > + *
> > + * - Importantly, software and hardware state set up by
> > + *   drm_plane_helper_funcs.begin_fb_access and
> > + *   drm_plane_helper_funcs.end_fb_access is not safe to access.
> > + *
> > + * Drivers must not make any assumptions about the actual state of the hardware,
> > + * unless they explicitly protected these hardware access with drm_panic_lock()
> > + * and drm_panic_unlock().
> > + *
> > + * Returns:
> > + *
> > + * 0 when failing to acquire the raw spinlock, nonzero on success.
> > + */
> > +static inline int drm_panic_trylock(struct drm_device *dev)
> > +{
> > +	return raw_spin_trylock(&dev->mode_config.panic_lock);
> > +}
> > +
> > +/**
> > + * drm_panic_lock - protect panic printing relevant state
> > + * @dev: struct drm_device
> > + *
> > + * This function must be called to protect software and hardware state that the
> > + * panic printing code must be able to rely on. The protected sections must be
> > + * as small as possible. Examples include:
> > + *
> > + * - Access to peek/poke or other similar registers, if that is the way the
> > + *   driver prints the pixels into the scanout buffer at panic time.
> > + *
> > + * - Updates to pointers like drm_plane.state, allowing the panic handler to
> > + *   safely deference these. This is done in drm_atomic_helper_swap_state().
> > + *
> > + * - An state that isn't invariant and that the driver must be able to access
> > + *   during panic printing.
> > + *
> > + * Call drm_panic_unlock() to unlock the locked spinlock.
> > + */
> > +static inline void drm_panic_lock(struct drm_device *dev)
> > +{
> > +	return raw_spin_lock(&dev->mode_config.panic_lock);
> > +}
> > +
> > +/**
> > + * drm_panic_unlock - end of the panic printing critical section
> > + * @dev: struct drm_device
> > + *
> > + * Unlocks the raw spinlock acquired by either drm_panic_lock() or
> > + * drm_panic_trylock().
> > + */
> > +static inline void drm_panic_unlock(struct drm_device *dev)
> > +{
> > +	raw_spin_unlock(&dev->mode_config.panic_lock);
> > +}
> > +
> > +#endif /* __DRM_PANIC_H__ */
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
