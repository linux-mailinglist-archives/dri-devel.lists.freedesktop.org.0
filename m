Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC9874C5D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 11:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12D511374D;
	Thu,  7 Mar 2024 10:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="zdq5LB51";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0k0+4sUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D6310F390
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 10:28:01 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1709807279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvpQaRqkZ5EvxmbyEZYAfOs3FUMfWI2eXPxEPYp6c6E=;
 b=zdq5LB51dhn+hYSKCPGswihDZA/5/9oJJFevWxNr5BNRodutKjRX9htnxjmr/iWUrS3R7n
 p0j548tAOKY/OhVdzucVuVThG0Qm6250hCiCNayPc4G5k1tbIlQAPWnshfkuNTgyc4DmPj
 90Qsau/3q2mGLJzj59i6bWxKwsq7muwZk7VcBRgHBJV4gF5oqwxX1oghHixPTB6yD8gjKt
 O0n02WcGquZc2z2mMmP5GrXTBWR2XwQUf+qFkcDP/l5rN7lZKWKd4w+pzZyElMad7LcOBZ
 41T1EqTaUxsQXGtXtPrP8WcJ9F44wsi/4rmZmN0hHBLxogul61Kj+QU2EwfsAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1709807279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pvpQaRqkZ5EvxmbyEZYAfOs3FUMfWI2eXPxEPYp6c6E=;
 b=0k0+4sUjPNfIuNKWzC7LcOwtpAas0NqdmXh/bBAKdwM0q0dOfTPWNlBBElLDwsDOpvZY4Y
 SV//kvbTkPKMdhDA==
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com, Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel
 Vetter <daniel.vetter@intel.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Lukas Wunner <lukas@wunner.de>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v9 1/9] drm/panic: Add drm panic locking
In-Reply-To: <20240307091936.576689-2-jfalempe@redhat.com>
References: <20240307091936.576689-1-jfalempe@redhat.com>
 <20240307091936.576689-2-jfalempe@redhat.com>
Date: Thu, 07 Mar 2024 11:33:21 +0106
Message-ID: <87r0gmmj5i.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

On 2024-03-07, Jocelyn Falempe <jfalempe@redhat.com> wrote:
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 39ef0a6addeb..c0bb91312fb2 100644
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
> @@ -3099,6 +3100,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  		}
>  	}
>  
> +	drm_panic_lock(state->dev);
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		WARN_ON(plane->state != old_plane_state);
>  
> @@ -3108,6 +3110,7 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
>  		state->planes[i].state = old_plane_state;
>  		plane->state = new_plane_state;
>  	}
> +	drm_panic_unlock(state->dev);

Is there a reason irqsave/irqrestore variants are not used? Maybe this
code path is too hot?

By leaving interrupts enabled, there is the risk that a panic from
within any interrupt handler may block the drm panic handler.

John Ogness
