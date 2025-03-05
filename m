Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D46A50356
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 16:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E1A89EFF;
	Wed,  5 Mar 2025 15:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DKBQ3PHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FEB89EFF;
 Wed,  5 Mar 2025 15:22:48 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2234daaf269so13700025ad.3; 
 Wed, 05 Mar 2025 07:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741188168; x=1741792968; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mrrWcWF0YU7DOHeensr3xXw8xMJox0I/sU8mMGZ4O/8=;
 b=DKBQ3PHmK9iu2QydEw7SJUHixJ1nRZEPfSNlCE7NGRavAhx5aOfqhKFS5OLaLEXg1X
 36neGxu1L5LjrZ1hNIap4Z1Xg4QFqb4T0K1s5inPZsTIYqPpbcuOJmuc1bserw66nH3B
 +H0DNLdEXeFRqLztrpeiif6YTvGNnFfD5nBsMtl+k9q3uNlj6f6a49wFCkgP/Vc86PTx
 Tp5x8AIn4Bvhs+XHhNrmNcmoGJQzZ5Rh6+QnkU0a2XmojQ+L3Rii4qC+Qw1egCIfBK04
 j57U/yYtQTjSh9DFiMgUHoAcFscTksjZwq5R1dXO/Qdglg/Bp5mtqUAWoBFqYdWG778k
 RZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741188168; x=1741792968;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrrWcWF0YU7DOHeensr3xXw8xMJox0I/sU8mMGZ4O/8=;
 b=DIoEqU6lGHkfiag0CJ5A+bxgkupOsZFMxDuJmNBJGI5zRRKQRdLZHAWO7u6jAPn660
 2cV44frt+4majv7j6d/K6zAvUVptUCwvJHKolnRzYKhybcaxX0kosjcr/b0oKKCdFMqH
 wG0m7x7SVlq99xkuTM5jiPAdqgRmSr0QSEf+r4q7cVJ8KqS8vi3D2fXvUqr5S4/kLuaR
 vdQG1Glre1gj0gRcZy6AduPv/cwl2vvf7zuKh1zB0RtGexot0LFqNRenixrmPw/qWpte
 rORuMgYvzLaBQfEK5u9g9xOhDy2z74sGGRYO5Xyd7syg9ma8dizWQS8gvAsbMpRdPDVm
 6GzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwpf+07yozRf/2XgesmL85CY+jrw79NavfigcJQObRUHG70eKaw26HVHTknDL+bOX+Og/fHtTMn+c=@lists.freedesktop.org,
 AJvYcCWaT6g7H0pQk7dfZdnEzy9I73tpMPNj68LdrjbgnvuPQwkyA4N0Vf3sU+jTJ2GWlZRmeYS8IvdL8Bt+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyiwxk7rGMb5YFO59gmbJCNpEEGQ35YsHR5q99XlSBm/4W9gl+N
 YZ/Yf0R/l+qOJrkLWi3I5aMo/RPAMFQOoE02r6vS7Qi5qghaqLpZ
X-Gm-Gg: ASbGncumcGAaEDOqiK9uLnDTFCBWXxaCPyp3c9UU0a6DE4vWmyoj57sgjBPGB6Wu2Y7
 nN7IfiDre/T4wqiKapf3PMHOmL1Zw4Zb36M0KODCl8fgdHT9C+gqWzVYyTMRM+kBubY5sQfbH0a
 UtrCZ7CMHgnRV0Gdq3KW6c3eliWbwM4fYngkbmDKXEd3LDteaRNgV3iTHYzimayTtitKIP9zJ6z
 wk6cltWl1ZurObB7WFD7m3zEf3iJUS30cya3ro4UprljEWPczaTh+WB2UzeW3lVcAemfkd9GW1C
 CX2Ulb/fejaoFMZHa23YiMbiwEaf5ibvTCRSp75DmrG+
X-Google-Smtp-Source: AGHT+IE5Y9x6OMXLQ/Mj+bXe5afzgdLR0y3DfUUZhaNnHvvvOh27pCh2tcKmZ4JZ8zVAr2Ay/rOQxg==
X-Received: by 2002:a17:902:dac9:b0:223:6254:79b8 with SMTP id
 d9443c01a7336-223f1d4bf89mr53156905ad.47.1741188167525; 
 Wed, 05 Mar 2025 07:22:47 -0800 (PST)
Received: from localhost ([216.228.125.131]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7349fe6cfd9sm13044953b3a.76.2025.03.05.07.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 07:22:46 -0800 (PST)
Date: Wed, 5 Mar 2025 10:22:44 -0500
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
 Jani Nikula <jani.nikula@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
Message-ID: <Z8hsRJvpjYoqh9RG@thinkpad>
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

+ Anshuman Khandual <anshuman.khandual@arm.com>

Anshuman,

I merged your GENMASK_U128() because you said it's important for your
projects, and that it will get used in the kernel soon.

Now it's in the kernel for more than 6 month, but no users were added.
Can you clarify if you still need it, and if so why it's not used?

As you see, people add another fixed-types GENMASK() macros, and their
implementation differ from GENMASK_U128().

My second concern is that __GENMASK_U128() is declared in uapi, while
the general understanding for other fixed-type genmasks is that they
are not exported to users. Do you need this macro to be exported to
userspace? Can you show how and where it is used there?

Thanks,
Yury


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
> +	(GENMASK_INPUT_CHECK(h, l) +			\
> +	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
> +	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))
> +
> +#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
> +#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)
>  
>  /*
>   * Missing asm support
>   *
> + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
> + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
> + * asm. Nethertheless, the concept of fixed width integers is a C thing which
> + * does not apply to assembly code.
> + */
> +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
> +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
> +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
> +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)
> +
> +/*
>   * __GENMASK_U128() depends on _BIT128() which would not work
>   * in the asm code, as it shifts an 'unsigned __int128' data
>   * type instead of direct representation of 128 bit constants
> 
> -- 
> 2.45.3
> 
