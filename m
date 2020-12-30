Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF282E7ACD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Dec 2020 16:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48138898EA;
	Wed, 30 Dec 2020 15:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292A6898EA;
 Wed, 30 Dec 2020 15:57:11 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23464848-1500050 for multiple; Wed, 30 Dec 2020 15:56:12 +0000
MIME-Version: 1.0
In-Reply-To: <20201230153928.456260-1-arnd@kernel.org>
References: <20201230153928.456260-1-arnd@kernel.org>
Subject: Re: [PATCH] i915: fix shift warning
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 30 Dec 2020 15:56:11 +0000
Message-ID: <160934377188.21284.5702573697011773996@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, José Roberto de Souza <jose.souza@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-12-30 15:39:14)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Randconfig builds on 32-bit machines show lots of warnings for
> the i915 driver for incorrect bit masks like:

mask is a u8.

VCS0 is 2, I915_MAX_VCS 4

(u8 & GENMASK(5, 2)) >> 2

> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2584:9: error: shift count >= width of type [-Werror,-Wshift-count-overflow]
>         return hweight64(VDBOX_MASK(&i915->gt));
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/asm-generic/bitops/const_hweight.h:29:49: note: expanded from macro 'hweight64'
>  #define hweight64(w) (__builtin_constant_p(w) ? __const_hweight64(w) : __arch_hweight64(w))

So it's upset by hweight64() on the unsigned long?
So hweight_long?

Or use a cast, hweight8((intel_engine_mask_t)VDMASK())?

static __always_inline int engine_count(intel_engine_mask_t mask)
{
	return sizeof(mask) == 1 ? hweight8(mask) :
		sizeof(mask) == 2 ? hweight16(mask) :
		sizeof(mask) == 4 ? hweight32(mask) :
		hweight64(mask);
}
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
