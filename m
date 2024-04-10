Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB9D89ECE0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 09:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A1910FBF1;
	Wed, 10 Apr 2024 07:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="iWWWL3Q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0941110E860
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 07:59:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-34666e92263so134727f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1712735948; x=1713340748; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BXtpJT8gVnxPbr35v5TpSnYgkRp/b5qXAzfMQ7cooH0=;
 b=iWWWL3Q3PoI/8/WrLjuNgMWHh51KzWtrpTXOaimtW1w68Hl2VXfU7+DrmHvehkUi0o
 t38s4kHsPKfKJAdV2TSYSfXg5NFy/5GoiFI2ankFPXkm11FH3sEdAfyo1XjopKRnXPUb
 Uvpw42WMCyu5vAEUWDQvpFY0NMN8yzpBIQ9yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712735948; x=1713340748;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXtpJT8gVnxPbr35v5TpSnYgkRp/b5qXAzfMQ7cooH0=;
 b=IUNBK5DtoXdR3yRnwgcbDpk1lZKJM0LzKjRRJ4mKR5ctg+dQIyXwy620QlJ9AQVv+p
 nlkjKuxQirr9o3kDqANebCWV2d4kwyGNbvejFMwhW3WKmTm3q/MND8RCXK48Pbbz3hzq
 BzoCpnq15+zOrqgjoqGMAgtRyVLdoVNE6hARgW07TsCZjVB3tV3IrtkSfKpOKOVBhV1U
 7Rxg6ssEQ7XMK5ZbXgPYjuw+XEPoUySjf53EM+ujQT20rQEvzuxaP396ubccftfu07AK
 /aAE7en7EepdYEa2/xBucIkGYxzG8wYiskgKiYjPcvXa6IiGL6w3mHNCojSKpWZTczsO
 yF+A==
X-Gm-Message-State: AOJu0YyZrVAVzldXPzqxJiz8hfsY77ndtEzrANSDRbkFoeNRr1IgVPwn
 rI6eJLYoUwep/7q5QwZrgIpsQFmID4I9TxQs4RjdM+BHG0dbyyWc4vgfdUWQVlM=
X-Google-Smtp-Source: AGHT+IEafISOd9AhBe3pmBcQwF1j/WdxcMrOIPgrRlaQXUDN5W//ga39hpbktkwWnuMjtnbgJ4DwsA==
X-Received: by 2002:a05:600c:1c89:b0:416:3de5:1367 with SMTP id
 k9-20020a05600c1c8900b004163de51367mr1383631wms.3.1712735947666; 
 Wed, 10 Apr 2024 00:59:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gw9-20020a05600c850900b00416c990d650sm1481655wmb.28.2024.04.10.00.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 00:59:07 -0700 (PDT)
Date: Wed, 10 Apr 2024 09:59:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev, gpiccoli@igalia.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Lukas Wunner <lukas@wunner.de>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v12 1/9] drm/panic: Add drm panic locking
Message-ID: <ZhZGyOtmNkRFDFOR@phenom.ffwll.local>
References: <20240409163432.352518-1-jfalempe@redhat.com>
 <20240409163432.352518-2-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409163432.352518-2-jfalempe@redhat.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Tue, Apr 09, 2024 at 06:30:40PM +0200, Jocelyn Falempe wrote:
> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Rough sketch for the locking of drm panic printing code. The upshot of
> this approach is that we can pretty much entirely rely on the atomic
> commit flow, with the pair of raw_spin_lock/unlock providing any
> barriers we need, without having to create really big critical
> sections in code.
> 
> This also avoids the need that drivers must explicitly update the
> panic handler state, which they might forget to do, or not do
> consistently, and then we blow up in the worst possible times.
> 
> It is somewhat racy against a concurrent atomic update, and we might
> write into a buffer which the hardware will never display. But there's
> fundamentally no way to avoid that - if we do the panic state update
> explicitly after writing to the hardware, we might instead write to an
> old buffer that the user will barely ever see.
> 
> Note that an rcu protected deference of plane->state would give us the
> the same guarantees, but it has the downside that we then need to
> protect the plane state freeing functions with call_rcu too. Which
> would very widely impact a lot of code and therefore doesn't seem
> worth the complexity compared to a raw spinlock with very tiny
> critical sections. Plus rcu cannot be used to protect access to
> peek/poke registers anyway, so we'd still need it for those cases.
> 
> Peek/poke registers for vram access (or a gart pte reserved just for
> panic code) are also the reason I've gone with a per-device and not
> per-plane spinlock, since usually these things are global for the
> entire display. Going with per-plane locks would mean drivers for such
> hardware would need additional locks, which we don't want, since it
> deviates from the per-console takeoverlocks design.
> 
> Longer term it might be useful if the panic notifiers grow a bit more
> structure than just the absolute bare
> EXPORT_SYMBOL(panic_notifier_list) - somewhat aside, why is that not
> EXPORT_SYMBOL_GPL ... If panic notifiers would be more like console
> drivers with proper register/unregister interfaces we could perhaps
> reuse the very fancy console lock with all it's check and takeover
> semantics that John Ogness is developing to fix the console_lock mess.
> But for the initial cut of a drm panic printing support I don't think
> we need that, because the critical sections are extremely small and
> only happen once per display refresh. So generally just 60 tiny locked
> sections per second, which is nothing compared to a serial console
> running a 115kbaud doing really slow mmio writes for each byte. So for
> now the raw spintrylock in drm panic notifier callback should be good
> enough.
> 
> Another benefit of making panic notifiers more like full blown
> consoles (that are used in panics only) would be that we get the two
> stage design, where first all the safe outputs are used. And then the
> dangerous takeover tricks are deployed (where for display drivers we
> also might try to intercept any in-flight display buffer flips, which
> if we race and misprogram fifos and watermarks can hang the memory
> controller on some hw).
> 
> For context the actual implementation on the drm side is by Jocelyn
> and this patch is meant to be combined with the overall approach in
> v7 (v8 is a bit less flexible, which I think is the wrong direction):
> 
> https://lore.kernel.org/dri-devel/20240104160301.185915-1-jfalempe@redhat.com/
> 
> Note that the locking is very much not correct there, hence this
> separate rfc.
> 
> v2:
> - fix authorship, this was all my typing
> - some typo oopsies
> - link to the drm panic work by Jocelyn for context

Please annotate that v10 and later is your work, credit where credit is
due and all that :-)

> v10:
> - Use spinlock_irqsave/restore (John Ogness)
> 
> v11:
> - Use macro instead of inline functions for drm_panic_lock/unlock (John Ogness)
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c |   4 ++
>  drivers/gpu/drm/drm_drv.c           |   1 +
>  include/drm/drm_mode_config.h       |  10 +++
>  include/drm/drm_panic.h             | 100 ++++++++++++++++++++++++++++
>  4 files changed, 115 insertions(+)
>  create mode 100644 include/drm/drm_panic.h
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 39ef0a6addeb..fb97b51b38f1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_panic.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_self_refresh_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -3016,6 +3017,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  				  bool stall)
>  {
>  	int i, ret;
> +	unsigned long flags;
>  	struct drm_connector *connector;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
>  	struct drm_crtc *crtc;
> @@ -3099,6 +3101,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  		}
>  	}
>  
> +	drm_panic_lock(state->dev, flags);
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		WARN_ON(plane->state != old_plane_state);
>  
> @@ -3108,6 +3111,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  		state->planes[i].state = old_plane_state;
>  		plane->state = new_plane_state;
>  	}
> +	drm_panic_unlock(state->dev, flags);
>  
>  	for_each_oldnew_private_obj_in_state(state, obj, old_obj_state, new_obj_state, i) {
>  		WARN_ON(obj->state != old_obj_state);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..c157500b3135 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -638,6 +638,7 @@ static int drm_dev_init(struct drm_device *dev,
>  	mutex_init(&dev->filelist_mutex);
>  	mutex_init(&dev->clientlist_mutex);
>  	mutex_init(&dev->master_mutex);
> +	raw_spin_lock_init(&dev->mode_config.panic_lock);
>  
>  	ret = drmm_add_action_or_reset(dev, drm_dev_init_release, NULL);
>  	if (ret)
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 973119a9176b..e79f1a557a22 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -505,6 +505,16 @@ struct drm_mode_config {
>  	 */
>  	struct list_head plane_list;
>  
> +	/**
> +	 * @panic_lock:
> +	 *
> +	 * Raw spinlock used to protect critical sections of code that access
> +	 * the display hardware or modeset software state, which the panic
> +	 * printing code must be protected against. See drm_panic_trylock(),
> +	 * drm_panic_lock() and drm_panic_unlock().
> +	 */
> +	struct raw_spinlock panic_lock;
> +
>  	/**
>  	 * @num_crtc:
>  	 *
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> new file mode 100644
> index 000000000000..68f57710d2d1
> --- /dev/null
> +++ b/include/drm/drm_panic.h
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +#ifndef __DRM_PANIC_H__
> +#define __DRM_PANIC_H__
> +
> +#include <drm/drm_device.h>
> +/*
> + * Copyright (c) 2024 Intel
> + */
> +
> +/**
> + * drm_panic_trylock - try to enter the panic printing critical section
> + * @dev: struct drm_device
> + * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> + *
> + * This function must be called by any panic printing code. The panic printing
> + * attempt must be aborted if the trylock fails.
> + *
> + * Panic printing code can make the following assumptions while holding the
> + * panic lock:
> + *
> + * - Anything protected by drm_panic_lock() and drm_panic_unlock() pairs is safe
> + *   to access.
> + *
> + * - Furthermore the panic printing code only registers in drm_dev_unregister()
> + *   and gets removed in drm_dev_unregister(). This allows the panic code to
> + *   safely access any state which is invariant in between these two function
> + *   calls, like the list of planes drm_mode_config.plane_list or most of the

                                       &drm_mode_config.plane_list

so that the hyperlinks work. Maybe double-check the generated html for
everything at the end of the series to make sure all the hyperlinks do
work and there's no typos.

> + *   struct drm_plane structure.
> + *
> + * Specifically thanks to the protection around plane updates in
> + * drm_atomic_helper_swap_state() the following additional guarantees hold:
> + *
> + * - It is safe to deference the drm_plane.state pointer.
> + *
> + * - Anything in struct drm_plane_state or the driver's subclass thereof which
> + *   stays invariant after the atomic check code has finished is safe to access.
> + *   Specifically this includes the reference counted pointers to framebuffer
> + *   and buffer objects.
> + *
> + * - Anything set up by drm_plane_helper_funcs.fb_prepare and cleaned up
> + *   drm_plane_helper_funcs.fb_cleanup is safe to access, as long as it stays
> + *   invariant between these two calls. This also means that for drivers using
> + *   dynamic buffer management the framebuffer is pinned, and therefer all
> + *   relevant datastructures can be accessed without taking any further locks
> + *   (which would be impossible in panic context anyway).
> + *
> + * - Importantly, software and hardware state set up by
> + *   drm_plane_helper_funcs.begin_fb_access and
> + *   drm_plane_helper_funcs.end_fb_access is not safe to access.
> + *
> + * Drivers must not make any assumptions about the actual state of the hardware,
> + * unless they explicitly protected these hardware access with drm_panic_lock()
> + * and drm_panic_unlock().
> + *
> + * Returns:
> + *
> + * 0 when failing to acquire the raw spinlock, nonzero on success.
> + */
> +#define drm_panic_trylock(dev, flags) \
> +	raw_spin_trylock_irqsave(&dev->mode_config.panic_lock, flags)
> +
> +/**
> + * drm_panic_lock - protect panic printing relevant state
> + * @dev: struct drm_device
> + * @flags: unsigned long irq flags you need to pass to the unlock() counterpart
> + *
> + * This function must be called to protect software and hardware state that the
> + * panic printing code must be able to rely on. The protected sections must be
> + * as small as possible. It uses the irqsave/irqrestore variant, and can be
> + * called from irq handler. Examples include:
> + *
> + * - Access to peek/poke or other similar registers, if that is the way the
> + *   driver prints the pixels into the scanout buffer at panic time.
> + *
> + * - Updates to pointers like drm_plane.state, allowing the panic handler to
> + *   safely deference these. This is done in drm_atomic_helper_swap_state().
> + *
> + * - An state that isn't invariant and that the driver must be able to access
> + *   during panic printing.
> + *
> + * Returns:
> + *
> + * The irqflags needed to call drm_panic_unlock().

I think the Returns section should be deleted here, that was for v10?

Otherwise Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch> on your changes
here.
-Sima


> + */
> +
> +#define drm_panic_lock(dev, flags) \
> +	raw_spin_lock_irqsave(&dev->mode_config.panic_lock, flags)
> +
> +/**
> + * drm_panic_unlock - end of the panic printing critical section
> + * @dev: struct drm_device
> + * @flags: irq flags that were returned when acquiring the lock
> + *
> + * Unlocks the raw spinlock acquired by either drm_panic_lock() or
> + * drm_panic_trylock().
> + */
> +#define drm_panic_unlock(dev, flags) \
> +	raw_spin_unlock_irqrestore(&dev->mode_config.panic_lock, flags)
> +
> +#endif /* __DRM_PANIC_H__ */
> -- 
> 2.44.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
