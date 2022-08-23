Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A18A59DF95
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 14:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC2210EE4C;
	Tue, 23 Aug 2022 12:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E8A10EE4C;
 Tue, 23 Aug 2022 12:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661258144; x=1692794144;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y130stLTWwZlCH8lUt72ocd62b6FYVz3FBxolhtmBBs=;
 b=lAjvTI0AyD4uNQDHVrWsiZCYgdfFCNYLt9PgyC9Ob8E/lU1XvEffI4zp
 4GxAnBVER9/U+VIFB9SenN0tdw8Mgt0AaChatireCM3IWFXwNkNVyLfgJ
 RO+R9PGOfmMWBpyf7DfejyPA/cC9Fl0ZEQkfiujUW+2xzgvcwcTwaQzQx
 vEeiIh+r3SnsgVdrlYueRdqBaN9KZH4PGdeDMifiVG+zywIvHWIUjVcJg
 vyeg8tR1LCAZsGqtTYCi17HeFAL9CD4EbSe4OX68MqMO2ve293NHl4XE/
 P9sO4ju9gOr4ecBM4UsdQEHYck7I0tMK0CYTRHxl/HdN/nZNFKrammLxJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294957590"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="294957590"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:35:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="638638951"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.12.34])
 ([10.213.12.34])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:35:40 -0700
Message-ID: <44d2da7f-6632-8382-73c9-6df76b7eae0c@intel.com>
Date: Tue, 23 Aug 2022 14:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v8 1/8] overflow: Move and add few utility
 macros into overflow
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220823101729.2098841-1-gwan-gyeong.mun@intel.com>
 <20220823101729.2098841-2-gwan-gyeong.mun@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220823101729.2098841-2-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: thomas.hellstrom@linux.intel.com, keescook@chromium.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, intel-gfx-trybot@lists.freedesktop.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.08.2022 12:17, Gwan-gyeong Mun wrote:
> It moves overflows_type utility macro into overflow header from i915_utils
> header. The overflows_type can be used to catch the truncaion (overflow)
> between different data types. And it adds check_assign() macro which
> performs an assigning source value into destination ptr along with an
> overflow check. overflow_type macro has been improved to handle the signbit
> by gcc's built-in overflow check function. And it adds overflows_ptr()
> helper macro for checking the overflows between a value and a pointer
> type/value.
> 
> v3: Add is_type_unsigned() macro (Mauro)
>      Modify overflows_type() macro to consider signed data types (Mauro)
>      Fix the problem that safe_conversion() macro always returns true
> v4: Fix kernel-doc markups
> v6: Move macro addition location so that it can be used by other than drm
>      subsystem (Jani, Mauro, Andi)
>      Change is_type_unsigned to is_unsigned_type to have the same name form
>      as is_signed_type macro
> v8: Add check_assign() and remove safe_conversion() (Kees)
>      Fix overflows_type() to use gcc's built-in overflow function (Andrzej)
>      Add overflows_ptr() to allow overflow checking when assigning a value
>      into a pointer variable (G.G.)
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
> ---
>   drivers/gpu/drm/i915/i915_user_extensions.c |  2 +-
>   drivers/gpu/drm/i915/i915_utils.h           |  5 +-
>   include/linux/overflow.h                    | 67 +++++++++++++++++++++
>   3 files changed, 69 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c b/drivers/gpu/drm/i915/i915_user_extensions.c
> index c822d0aafd2d..0fb2fecbcaae 100644
> --- a/drivers/gpu/drm/i915/i915_user_extensions.c
> +++ b/drivers/gpu/drm/i915/i915_user_extensions.c
> @@ -51,7 +51,7 @@ int i915_user_extensions(struct i915_user_extension __user *ext,
>   			return err;
>   
>   		if (get_user(next, &ext->next_extension) ||
> -		    overflows_type(next, ext))
> +		    overflows_ptr(next, ext))
>   			return -EFAULT;
>   
>   		ext = u64_to_user_ptr(next);
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..eb0ded23fa9c 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,7 @@
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   #include <linux/sched/clock.h>
> +#include <linux/overflow.h>
>   
>   #ifdef CONFIG_X86
>   #include <asm/hypervisor.h>
> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>   #define range_overflows_end_t(type, start, size, max) \
>   	range_overflows_end((type)(start), (type)(size), (type)(max))
>   
> -/* Note we don't consider signbits :| */
> -#define overflows_type(x, T) \
> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> -
>   #define ptr_mask_bits(ptr, n) ({					\
>   	unsigned long __v = (unsigned long)(ptr);			\
>   	(typeof(ptr))(__v & -BIT(n));					\
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index f1221d11f8e5..4016f1378bcc 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -52,6 +52,73 @@ static inline bool __must_check __must_check_overflow(bool overflow)
>   	return unlikely(overflow);
>   }
>   
> +/**
> + * overflows_type - helper for checking the overflows between data types or
> + *                  values
> + *
> + * @x: Source value or data type for overflow check
> + * @T: Destination value or data type for overflow check
> + *
> + * It compares the values or data type between the first and second argument to
> + * check whether overflow can occur when assigning the first argument to the
> + * variable of the second argument. Source and Destination can be singned or
> + * unsigned data types.
> + *
> + * Returns:
> + * True if overflow can occur, false otherwise.
> + */
> +#define overflows_type(x, T) __must_check_overflow(({	\
> +	typeof(T) v = 0;				\
> +	__builtin_add_overflow_p((x), v, v);		\


Above works since gcc7, since gcc5 you can use:
	__builtin_add_overflow((x), v, &v);


> +}))
> +
> +/**
> + * overflows_ptr - helper for checking the overflows between a value and
> + *                 a pointer type/value
> + *
> + * @x: Source value for overflow check
> + * @T: Destination pointer type or value for overflow check
> + *
> + * gcc's built-in overflow check functions don't support checking between the
> + * pointer type and non-pointer type. Therefore it compares the values and
> + * size of each data type between the first and second argument to check whether
> + * truncation can occur when assigning the first argument to the variable of the
> + * second argument. It checks internally the ptr is a pointer type.
> + *
> + * Returns:
> + * True if overflow can occur, false otherwise.
> + */
> +#define overflows_ptr(x, T) __must_check_overflow(({	\
> +	typecheck_pointer(T);				\
> +	((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0; \
> +}))


Doesn't linux assume that all pointers have size of long int ?
Or at least all pointers have the same size.
In such case we can use:
#define overflows_ptr(x) overflows_type(x, unsigned long)

Regards
Andrzej

> +
> +/**
> + * check_assign - perform an assigning source value into destination ptr along
> + *                with an overflow check.
> + *
> + * @value: Source value
> + * @ptr: Destination pointer address, If the pointer type is not used,
> + *       a warning message is output during build.
> + *
> + * It checks internally the ptr is a pointer type. And it uses gcc's built-in
> + * overflow check function.
> + * It does not use the check_*() wrapper functions, but directly uses gcc's
> + * built-in overflow check function so that it can be used even when
> + * the type of value and the type pointed to by ptr are different without build
> + * warning messages.
> + *
> + * Returns:
> + * If the value would overflow the destination, it returns true. If not return
> + * false. When overflow does not occur, the assigning into ptr from value
> + * succeeds. It follows the return policy as other check_*_overflow() functions
> + * return non-zero as a failure.
> + */
> +#define check_assign(value, ptr) __must_check_overflow(({	\
> +	typecheck_pointer(ptr); 		\
> +	__builtin_add_overflow(0, value, ptr);	\
> +}))
> +
>   /*
>    * For simplicity and code hygiene, the fallback code below insists on
>    * a, b and *d having the same type (similar to the min() and max()

