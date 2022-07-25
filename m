Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6881D57FE73
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16B02A643;
	Mon, 25 Jul 2022 11:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1CB12AD22;
 Mon, 25 Jul 2022 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658748986; x=1690284986;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Jxxs1H9rP4afu7bcj0w3169eD78mP8ayIdGSgYrz6LA=;
 b=d6sDovnd4lTEYG/ItvJZ8h+sf/yN3bYHdJdxO896tjek0Cccpj/htUJw
 D9HiUxqGxZftTZVghMy16pqXMv3jP8HFrG1r7KMVBjV0RNoHs+UKErWP2
 FXNn1JvSFbyOdCNuwVdK4EIkxjsIu9/1xWYDQawYCufF/PJUqd4GdQX7Y
 sllSmwuwSZkxytich4jq4F5u+5o5Hl4G9700cKr9YdNIzJy0pd+KLfHwg
 Xu7rnxnWDsHoLtkx4fFbRlEJ4PdCoMUoXbxtEuvHbdboFrl4cx64JRwkj
 UlNc04qk685Lffl44XaHyOrO2fkrRfkfcAPC+rNb7Faf9n2cNbByNmZau A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="270711981"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="270711981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:36:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="632327858"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.13.24])
 ([10.213.13.24])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 04:36:19 -0700
Message-ID: <9c20e45e-1b51-68b9-7a23-a651ac59a2f7@intel.com>
Date: Mon, 25 Jul 2022 13:36:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm: Move and add a few utility macros
 into drm util header
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.07.2022 11:25, Gwan-gyeong Mun wrote:
> It moves overflows_type utility macro into drm util header from i915_utils
> header. The overflows_type can be used to catch the truncation between data
> types. And it adds safe_conversion() macro which performs a type conversion
> (cast) of an source value into a new variable, checking that the
> destination is large enough to hold the source value.
> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
> while compiling.
> 
> v3: Add is_type_unsigned() macro (Mauro)
>      Modify overflows_type() macro to consider signed data types (Mauro)
>      Fix the problem that safe_conversion() macro always returns true
> v4: Fix kernel-doc markups
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   drivers/gpu/drm/i915/i915_utils.h |  5 +-
>   include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..345e5b2dc1cd 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,7 @@
>   #include <linux/types.h>
>   #include <linux/workqueue.h>
>   #include <linux/sched/clock.h>
> +#include <drm/drm_util.h>
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
> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> index 79952d8c4bba..1de9ee5704fa 100644
> --- a/include/drm/drm_util.h
> +++ b/include/drm/drm_util.h
> @@ -62,6 +62,83 @@
>    */
>   #define for_each_if(condition) if (!(condition)) {} else
>   
> +/**
> + * is_type_unsigned - helper for checking data type which is an unsigned data
> + * type or not
> + * @x: The data type to check
> + *
> + * Returns:
> + * True if the data type is an unsigned data type, false otherwise.
> + */
> +#define is_type_unsigned(x) ((typeof(x))-1 >= (typeof(x))0)
> +
> +/**
> + * overflows_type - helper for checking the truncation between data types
> + * @x: Source for overflow type comparison
> + * @T: Destination for overflow type comparison
> + *
> + * It compares the values and size of each data type between the first and
> + * second argument to check whether truncation can occur when assigning the
> + * first argument to the variable of the second argument.
> + * Source and Destination can be used with or without sign bit.
> + * Composite data structures such as union and structure are not considered.
> + * Enum data types are not considered.
> + * Floating point data types are not considered.
> + *
> + * Returns:
> + * True if truncation can occur, false otherwise.
> + */
> +
> +#define overflows_type(x, T) \
> +	(is_type_unsigned(x) ? \
> +		is_type_unsigned(T) ? \
> +			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +			: (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : 0 \
> +	: is_type_unsigned(T) ? \
> +		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +		: (sizeof(x) > sizeof(T)) ? \
> +			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +			: 0)


It became quite big and hard to read. I wonder if we could not just 
check the effects of the conversion, sth like:
#define overflows_type(x, T) ((T)(x) != (x))

Regards
Andrzej


> +
> +/**
> + * exact_type - break compile if source type and destination value's type are
> + * not the same
> + * @T: Source type
> + * @n: Destination value
> + *
> + * It is a helper macro for a poor man's -Wconversion: only allow variables of
> + * an exact type. It determines whether the source type and destination value's
> + * type are the same while compiling, and it breaks compile if two types are
> + * not the same
> + */
> +#define exact_type(T, n) \
> +	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(T, typeof(n)))
> +
> +/**
> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
> + * @n: value to compare pgoff_t type
> + *
> + * It breaks compile if the argument value's type is not pgoff_t type.
> + */
> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
> +
> +/**
> + * safe_conversion - perform a type conversion (cast) of an source value into
> + * a new variable, checking that the destination is large enough to hold the
> + * source value.
> + * @ptr: Destination pointer address
> + * @value: Source value
> + *
> + * Returns:
> + * If the value would overflow the destination, it returns false.
> + */
> +#define safe_conversion(ptr, value) ({ \
> +	typeof(value) __v = (value); \
> +	typeof(ptr) __ptr = (ptr); \
> +	overflows_type(__v, *__ptr) ? 0 : ((*__ptr = (typeof(*__ptr))__v), 1); \
> +})
> +
>   /**
>    * drm_can_sleep - returns true if currently okay to sleep
>    *

