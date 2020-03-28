Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98E196456
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 08:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562B36EAB4;
	Sat, 28 Mar 2020 07:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4C26EAB4;
 Sat, 28 Mar 2020 07:58:58 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20721407-1500050 for multiple; Sat, 28 Mar 2020 07:58:46 +0000
MIME-Version: 1.0
In-Reply-To: <20200328000422.98978-1-Jason@zx2c4.com>
References: <20200328000422.98978-1-Jason@zx2c4.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: check to see if the FPU is available before
 using it
Message-ID: <158538232569.25292.15795048542441478192@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Sat, 28 Mar 2020 07:58:45 +0000
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jason A. Donenfeld (2020-03-28 00:04:22)
> It's not safe to just grab the FPU willy nilly without first checking to
> see if it's available. This patch adds the usual call to may_use_simd()
> and falls back to boring memcpy if it's not available.
 
These instructions do not use the fpu, nor are these registers aliased
over the fpu stack. This description and the may_use_simd() do not
look like they express the right granularity as to which simd state are
included

> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/gpu/drm/i915/i915_memcpy.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_memcpy.c b/drivers/gpu/drm/i915/i915_memcpy.c
> index fdd550405fd3..7c0e022586bc 100644
> --- a/drivers/gpu/drm/i915/i915_memcpy.c
> +++ b/drivers/gpu/drm/i915/i915_memcpy.c
> @@ -24,6 +24,7 @@
>  
>  #include <linux/kernel.h>
>  #include <asm/fpu/api.h>
> +#include <asm/simd.h>
>  
>  #include "i915_memcpy.h"
>  
> @@ -38,6 +39,12 @@ static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
>  #ifdef CONFIG_AS_MOVNTDQA
>  static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
>  {
> +       if (unlikely(!may_use_simd())) {
> +               memcpy(dst, src, len);
> +               return;

Look at caller, return the error and let them decide if they can avoid
the read from WC, which quite often they can. And no, this is not done
from interrupt context, we would be crucified if we did.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
