Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4E1E47C9
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA0F6E32F;
	Wed, 27 May 2020 15:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A616E32F;
 Wed, 27 May 2020 15:42:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21311271-1500050 for multiple; Wed, 27 May 2020 16:42:05 +0100
MIME-Version: 1.0
In-Reply-To: <20200527140526.1458215-1-arnd@arndb.de>
References: <20200527140526.1458215-1-arnd@arndb.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/pmu: avoid an maybe-uninitialized warning
Message-ID: <159059412490.30979.15190382623249962766@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 27 May 2020 16:42:04 +0100
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
Cc: Andi Shyti <andi.shyti@intel.com>, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Michał Winiarski <michal.winiarski@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-05-27 15:05:08)
> Conditional spinlocks make it hard for gcc and for lockdep to
> follow the code flow. This one causes a warning with at least
> gcc-9 and higher:
> 
> In file included from include/linux/irq.h:14,
>                  from drivers/gpu/drm/i915/i915_pmu.c:7:
> drivers/gpu/drm/i915/i915_pmu.c: In function 'i915_sample':
> include/linux/spinlock.h:289:3: error: 'flags' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>   289 |   _raw_spin_unlock_irqrestore(lock, flags); \
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/i915_pmu.c:288:17: note: 'flags' was declared here
>   288 |   unsigned long flags;
>       |                 ^~~~~
> 
> Split out the part between the locks into a separate function
> for readability and to let the compiler figure out what the
> logic actually is.
> 
> Fixes: d79e1bd676f0 ("drm/i915/pmu: Only use exclusive mmio access for gen7")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have no idea why I see three separate issues like this pop up in i915,
> there are not a lot of them elsewhere.

gcc v8:
add/remove: 1/0 grow/shrink: 0/1 up/down: 99/-164 (-65)
Function                                     old     new   delta
engine_sample                                  -      99     +99
i915_sample                                  871     707    -164

Which is compelling. Is gcc 9 simliar?

Given the above reduction, I find it hard to argue with.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
