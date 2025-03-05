Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1382AA503C0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9AD10E690;
	Wed,  5 Mar 2025 15:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HK/FeeG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B66410E7C7;
 Wed,  5 Mar 2025 15:47:05 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2f9b91dff71so11423910a91.2; 
 Wed, 05 Mar 2025 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741189624; x=1741794424; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qbmBv9WPN2ltuxsgR8pg8jbB1hgd+dc954tuEUYQ9Iw=;
 b=HK/FeeG44eSchQ52BPeA+YuLuHDD+P8FbhMrfCZlcv00jwg/tykhbmYofXNXPHoar4
 7j1j0jDKGhPsfg7EdRNfZCXP3xin8EQ69f7PBueT25AVQjLItfHqGImTSexXD8MbAA2n
 fd+OHXd6ayYAof8iBjp9M21RU1lskltPQ6VrVySNZoDA1791p8Ju20rcFMzjaRqqwYqS
 lT4TJRKxHhQVXiJOHNZa2biEgyMy63xaEFIFbYY82jBfiSsswwOkQEUZFCbOq/2VdbSx
 0OG0wFjbigux+QGUW1JUjHI3kPHjG2h3E1L3Kq3Js4mDAvYhqG5mlsoeK5jsOcknsyg4
 a5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741189624; x=1741794424;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbmBv9WPN2ltuxsgR8pg8jbB1hgd+dc954tuEUYQ9Iw=;
 b=ALJcohb8Q9YQGZ3t1Kqzc00HqiFclLiR0b6yZk6PmVQ6Ekmta2KiUHG3Rah5mDPy9A
 dCw8+Z51BIEobUSFJPl1eKiuO3yB2ArWokNo4KjXvisUI5JVNDU7srjZN3eFuS5nXfUE
 qGHB8MLzztD5swpaer6vyh5M4Rsak+AyizE/qdBZgEVfgXezeis/BQtmIrdEjG60RPuf
 Awmnzmobq7nofp6k4Jq5Gbv3mpjqJZJIQdg3M9TFyVHWXH4WkMLUPalHBobw0loMfH7n
 qDvNVD5X7oI7K69qR1nkuGouwfv5FzhtkKwOFVGkrgT6fmMgyrOv/QrKObJ7A6tVQV7I
 8POg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbK4p70dzRZAVj7XZ2d9jSXj+WtpSK0HZRtKfB0JUebCbzEQNQImhO7ts5eiNEJkkkCvMKAoYI+u8=@lists.freedesktop.org,
 AJvYcCXnA/JAneejqP5SqBxLaoVss6TCSuSToB22F4k3QxAP+R1PpkFDlQpFbBYKVrCeW+VhwlKEXTw4AJnK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqthZC4Dkg0KyM+cfhDn/YelsPNqGujg6yIaQPQv//URwAu/tl
 bAyFP0INYu29DeOSlRO3Y3fZxmm9sSNUJR6ao4BuAgrzY2GEgu9Z
X-Gm-Gg: ASbGncsWXfosSU8T489JBa8niRF5gGKCkEvLQq2ulq0Bkew7MRzTdfAMdQBTWoHjl8X
 ruxK+sycJ4IXjkbDRkCVyO3/Fb9Jy09Usd96x2ZP+Ihc+yEqpa9xN+ebMeGpwZyzyImJd29yKq6
 wXS77aPCZNOQocNfgZLtDi4hpff4Y49kVCmwHLhCNC3/Ao6/ZzccEqG/ZI3gPaLGv2O9a4+6CAb
 As+73y8Z6Ad5iUVS3GUumf+28NPNRpSuUvC09nnqvlSHEtMA1ofJGdr3Hp+6cDWkM/vyJtdr954
 XBqX/kmJqdvsyZ7Pqz3Otf/BK3AzFh9L7PNFwBqycGn4
X-Google-Smtp-Source: AGHT+IH6GxbgpDkJALxCm31tn74sfA7iweXsWVkgkcuDtN2qWf9CiMByQx77ZiiaPQFQa+lPoaMXpQ==
X-Received: by 2002:a17:90b:48c7:b0:2fe:a0ac:5fcc with SMTP id
 98e67ed59e1d1-2ff497c57ccmr5005442a91.34.1741189622904; 
 Wed, 05 Mar 2025 07:47:02 -0800 (PST)
Received: from localhost ([216.228.125.131]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff4e7ff9f7sm1491518a91.33.2025.03.05.07.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:47:02 -0800 (PST)
Date: Wed, 5 Mar 2025 10:47:00 -0500
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
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z8hx9AaUX_GvYq_A@thinkpad>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
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

On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
> From: Yury Norov <yury.norov@gmail.com>
> 
> Add __GENMASK_t() which generalizes __GENMASK() to support different
> types, and implement fixed-types versions of GENMASK() based on it.
> The fixed-type version allows more strict checks to the min/max values
> accepted, which is useful for defining registers like implemented by
> i915 and xe drivers with their REG_GENMASK*() macros.
> 
> The strict checks rely on shift-count-overflow compiler check to fail
> the build if a number outside of the range allowed is passed.
> Example:
> 
> 	#define FOO_MASK GENMASK_U32(33, 4)
> 
> will generate a warning like:
> 
> 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> 	      |                               ^~
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

Co-developed-by?

> ---
> Changelog:
> 
>   v3 -> v4:
> 
>     - The v3 is one year old. Meanwhile people started using
>       __GENMASK() directly. So instead of generalizing __GENMASK() to
>       support different types, add a new GENMASK_t().
> 
>     - replace ~0ULL by ~_ULL(0). Otherwise, __GENMASK_t() would fail
>       in asm code.
> 
>     - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
>       v3, due to the integer promotion rules, these were returning a
>       signed integer. By casting these to unsigned int, at least the

This comment will disappear when I'll apply the patch. Can you comment
it in the code instead?

>       signedness is kept.
> ---
>  include/linux/bitops.h |  1 -
>  include/linux/bits.h   | 33 +++++++++++++++++++++++++++++----
>  2 files changed, 29 insertions(+), 5 deletions(-)
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
> index 5f68980a1b98d771426872c74d7b5c0f79e5e802..f202e46d2f4b7899c16d975120f3fa3ae41556ae 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -12,6 +12,7 @@
>  #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
>  #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
>  #define BITS_PER_BYTE		8
> +#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>  
>  /*
>   * Create a contiguous bitmask starting at bit position @l and ending at
> @@ -25,14 +26,38 @@
>  
>  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>  
> -#define GENMASK(h, l) \
> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> -#define GENMASK_ULL(h, l) \
> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
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
> +#define GENMASK_t(t, h, l)				\

Agree with Andy. This should be GENMASK_TYPE, or triple-underscored
___GENMASK() maybe. This _t thing looks misleading.

> +	(GENMASK_INPUT_CHECK(h, l) +			\
> +	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
> +	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))

Can you rebase it on top of -next? In this dev cycle I merge a patch
that reverts the __GENMASK() back to:

#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))

> +#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
> +#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)

This makes __GENMASK() and __GENMASK_ULL() unused in the kernel, other
than in uapi. Or I misunderstand it?

Having, in fact, different implementations of the same macro for kernel
and userspace is a source of problems. Can we move GENMASK_TYPE() to uapi,
and implement __GENMASK() on top of them? If not, I'd prefer to keep
GENMASK and GENMASK_ULL untouched.

Can you run bloat-o-meter and ensure there's no unwanted effects on
code generation?

>  /*
>   * Missing asm support
>   *
> + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm

And there's no __GENMASK_U*(), right?

> + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
> + * asm. Nethertheless, the concept of fixed width integers is a C thing which
> + * does not apply to assembly code.
> + */
> +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
> +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))

Typecast to the type that user provides explicitly?  And maybe do
in GENMASK_TYPE()

> +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
> +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)

OK, this looks good. But GENMASK_U128() becomes a special case now.
The 128-bit GENMASK is unsued, but it's exported in uapi. Is there any
simple way to end up with a common implementation for all fixed-type
GENMASKs?

> +
> +/*
>   * __GENMASK_U128() depends on _BIT128() which would not work
>   * in the asm code, as it shifts an 'unsigned __int128' data
>   * type instead of direct representation of 128 bit constants

This comment is duplicated by the previous one. Maybe just join them?
(Let's wait for a while for updates regarding GENMASK_U128 status before
doing it.)
