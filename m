Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E31A679FE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 17:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F5C10E222;
	Tue, 18 Mar 2025 16:45:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uqu9h02u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1AE10E1F3;
 Tue, 18 Mar 2025 16:45:33 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2241053582dso16136065ad.1; 
 Tue, 18 Mar 2025 09:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742316330; x=1742921130; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zXmFAGpWhU+jGQxea1D54Lg56ApGGJjtidCnAmzD5IQ=;
 b=Uqu9h02urPSKAfHH8I332PPIivPFCQ6kU7JTI8nDBPVRf1y7n+T+OXJkXJbKyLz0eN
 DjjCw+Ev1FtnKt1mgp+Zr9PslyhbSp7rI/G3YxCgXk6zaLEfi0lDQuZNcVs60xblNy2x
 Qa/3LtkgEREp8QdTUwWQ8PIy+h7IpgwBVjCIcQaqgneHzyeF92+B1CWlKEwf269NiBLU
 BdsKdJSfuJJQrlVATClt/AZ/ln6GCxrV7XYrxm+Ud8obqo8HM53FFbWDvkBO/3q44JNm
 HJUjCJgrTJCPzkVBEPypFWwnLR/cR5fdhRUsieEy7U5RCBv6THL3oz7w89bX4rCF2lRd
 wM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742316330; x=1742921130;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXmFAGpWhU+jGQxea1D54Lg56ApGGJjtidCnAmzD5IQ=;
 b=jO7jOOvyNZr4+3r18qnHIDmMU3QV47bvUpQT9zd8So1UwU8eACkmUZDYxwtbRfO3bh
 xxOhk5IxJB+fBKQTcFqCgrjduCJ0yFp3xanjHRvhK5vm9UyBVnp8MJCojXxgcjJHTHLJ
 DkFsIn83yQSnMkuvrJMrYwWvjZWRqiG+nXRFuOVpYMjqys6NQ6KxumgyR1kTeDtYkKkn
 W1I5NXoyv4ZRCGyaQZtAyxjzE5/b79ckdChKO/SJXnZHAzvu6arsgbrVF+R81VaiJwFi
 /eQhNmTG66WWJvKQIglQ93KUKLg1WHdL+sRKzjQl1K5hT/JJ1fsFJvBMMnKKLfvagiwr
 i/0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrGMcV0j6k7CopjzwjnUb614UE7eOMsmLdfDnajpoXVuClFm6uBJj1jnNl/JU7Qep4kRGg/wO9ipI=@lists.freedesktop.org,
 AJvYcCXG6zyriINPlOZXpQekKl6tVmV5RPapdobbNWOKQ7m284xvIWxdkR24ziJarO8vvX2EoQzgJtXJuLFc@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuXyZwBy55ypWkUGU3roFcMtmP9NTudogfkJ9HUjvYgF3xq2Nj
 pVq1ekGrQEyGKcIlTIf6Eshu0fMTLA3nBA0hmQG0JRipMcKh0YEJ
X-Gm-Gg: ASbGncvNh50tEd1K5X4ldaV9y8/Syd6+Xo6JeIvQT+IFNONEGFHPTo3yiMYyA9Laves
 vAkyyUGhAwJ/N/ogkLm+esOAIoDyf9iygiXJMo+tja72QffwP8Bip8C5++EYaQiPEtAXM0GmWgk
 SbqUdOf7be5VMNOD4Bumg1CChs3/5oWcr0dSaiuYdqAb8P0ShRPsncovEwT/kspJ6wS1UzS8Zyj
 Nbcjf0evniOUeMMrChAhjmUrovzOOWYXIdOuIOZ1GjJOil63PnEWaoDPCJi43nY6bp/YX7Fx2FN
 p3upq9m+TvMxtpBr/TrEGdEHrghxsF2kLJJuGC6NDPqMe01enoUWb/X1Hd8ou5U1Yawy
X-Google-Smtp-Source: AGHT+IHCxAIWfvRZL39c//ZSCAbKfEdVL95M2CO4F3JUYMCR0tKZOs+seM5sZPP1v97nJ2K2V93M/g==
X-Received: by 2002:a17:902:f785:b0:221:7b4a:475a with SMTP id
 d9443c01a7336-225e0b62d31mr227139965ad.52.1742316329526; 
 Tue, 18 Mar 2025 09:45:29 -0700 (PDT)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-737116af372sm9796545b3a.160.2025.03.18.09.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:45:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 12:45:27 -0400
From: Yury Norov <yury.norov@gmail.com>
To: mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v6 2/7] bits: introduce fixed-type genmasks
Message-ID: <Z9mjJ3gJoqLwjIFX@thinkpad>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
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

On Sat, Mar 08, 2025 at 01:48:49AM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Yury Norov <yury.norov@gmail.com>
> 
> Add GENMASK_TYPE() which generalizes __GENMASK() to support different
> types, and implement fixed-types versions of GENMASK() based on it.
> The fixed-type version allows more strict checks to the min/max values
> accepted, which is useful for defining registers like implemented by
> i915 and xe drivers with their REG_GENMASK*() macros.
> 
> The strict checks rely on shift-count-overflow compiler check to fail
> the build if a number outside of the range allowed is passed.
> Example:
> 
>   #define FOO_MASK GENMASK_U32(33, 4)
> 
> will generate a warning like:
> 
>   include/linux/bits.h:51:27: error: right shift count >= width of type [-Werror=shift-count-overflow]
>      51 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
>         |                           ^~
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Co-developed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
> Changelog:
> 
>   v5 -> v6:
> 
>     - No changes.
> 
>   v4 -> v5:
> 
>     - Rename GENMASK_t() to GENMASK_TYPE().
> 
>     - Fix typo in patch description.
> 
>     - Use tab indentations instead of single space to separate the
>       macro name from its body.
> 
>     - s/__GENMASK_U*()/GENMASK_U*()/g in the comment.
> 
>     - Add a tag to credit myself as Co-developer. Keep Yury as the
>       main author.
> 
>     - Modify GENMASK_TYPE() to match the changes made to __GENMASK()
>       in: https://github.com/norov/linux/commit/1e7933a575ed
> 
>     - Replace (t)~_ULL(0) with type_max(t). This is OK because
>       GENMASK_TYPE() is not available in asm.
> 
>     - linux/const.h and asm/bitsperlong.h are not used anymore. Remove
>       them.
> 
>     - Apply GENMASK_TYPE() to GENMASK_U128().
> 
>     - Remove the unsigned int cast for the U8 and U16 variants. Cast
>       to the target type instead. Do that cast directly in
>       GENMASK_TYPE().
> 
>   v3 -> v4:
> 
>     - The v3 is one year old. Meanwhile people started using
>       __GENMASK() directly. So instead of generalizing __GENMASK() to
>       support different types, add a new GENMASK_t().
> 
>     - replace ~0ULL by ~_ULL(0). Otherwise, GENMASK_t() would fail in
>       asm code.
> 
>     - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
>       v3, due to the integer promotion rules, these were returning a
>       signed integer. By casting these to unsigned int, at least the
>       signedness is kept.
> ---
>  include/linux/bitops.h |  1 -
>  include/linux/bits.h   | 55 ++++++++++++++++++++++++++++++++------------------
>  2 files changed, 35 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index c1cb53cf2f0f8662ed3e324578f74330e63f935d..9be2d50da09a417966b3d11c84092bb2f4cd0bef 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -8,7 +8,6 @@
>  
>  #include <uapi/linux/kernel.h>
>  
> -#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>  #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
>  #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
>  #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index 9c1c7ce0bba6bb09490d891904c143a5394fd512..b690611c769be61ab2b5ced43c8302ba5693308b 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -2,16 +2,15 @@
>  #ifndef __LINUX_BITS_H
>  #define __LINUX_BITS_H
>  
> -#include <linux/const.h>
>  #include <vdso/bits.h>
>  #include <uapi/linux/bits.h>
> -#include <asm/bitsperlong.h>
>  
>  #define BIT_MASK(nr)		(UL(1) << ((nr) % BITS_PER_LONG))
>  #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
>  #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
>  #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
>  #define BITS_PER_BYTE		8
> +#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>  
>  /*
>   * Create a contiguous bitmask starting at bit position @l and ending at
> @@ -20,28 +19,44 @@
>   */
>  #if !defined(__ASSEMBLY__)
>  
> -#include <linux/build_bug.h>
> -#include <linux/compiler.h>
> -
> -#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> -
> -#define GENMASK(h, l) \
> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> -#define GENMASK_ULL(h, l) \
> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
> -
>  /*
>   * Missing asm support
>   *
> - * __GENMASK_U128() depends on _BIT128() which would not work
> - * in the asm code, as it shifts an 'unsigned __int128' data
> - * type instead of direct representation of 128 bit constants
> - * such as long and unsigned long. The fundamental problem is
> - * that a 128 bit constant will get silently truncated by the
> - * gcc compiler.
> + * GENMASK_U*() depends on BITS_PER_TYPE() which relies on sizeof(),
> + * something not available in asm. Nethertheless, fixed width integers
> + * is a C concept. Assembly code can rely on the long and long long
> + * versions instead.
>   */
> -#define GENMASK_U128(h, l) \
> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U128(h, l))
> +
> +#include <linux/build_bug.h>
> +#include <linux/compiler.h>
> +#include <linux/overflow.h>
> +
> +#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
> +
> +/*
> + * Generate a mask for the specified type @t. Additional checks are made to
> + * guarantee the value returned fits in that type, relying on
> + * shift-count-overflow compiler check to detect incompatible arguments.
> + * For example, all these create build errors or warnings:
> + *
> + * - GENMASK(15, 20): wrong argument order
> + * - GENMASK(72, 15): doesn't fit unsigned long
> + * - GENMASK_U32(33, 15): doesn't fit in a u32
> + */
> +#define GENMASK_TYPE(t, h, l)					\
> +	((t)(GENMASK_INPUT_CHECK(h, l) +			\
> +	     (type_max(t) << (l) &				\
> +	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
> +
> +#define GENMASK(h, l)		GENMASK_TYPE(unsigned long,  h, l)
> +#define GENMASK_ULL(h, l)	GENMASK_TYPE(unsigned long long, h, l)

I like everything except this part. We switch GENMASK() from a well
tested implementation, including an asm code, and we split uapi and
non-uapi users, with no functionality changes.

Unification is a solid point, however.

Let's make it a 2-step procedure? Adding fixed-width GENMASKs is a
non-questionable improvement. Switching an existing API from one
implementation to another should be a separate patch, and probably
even a separate series. And we should be very clear that __GENMASK()
is uapi-only thing from now.

If we decide to switch GENMASK() in a separate series, we'll have some
extra time to think about unification...

> +#define GENMASK_U8(h, l)	GENMASK_TYPE(u8, h, l)
> +#define GENMASK_U16(h, l)	GENMASK_TYPE(u16, h, l)
> +#define GENMASK_U32(h, l)	GENMASK_TYPE(u32, h, l)
> +#define GENMASK_U64(h, l)	GENMASK_TYPE(u64, h, l)
> +#define GENMASK_U128(h, l)	GENMASK_TYPE(u128, h, l)
>  
>  #else /* defined(__ASSEMBLY__) */
>  
> 
> -- 
> 2.45.3
> 
