Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D4582444
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 12:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660B11BD32;
	Wed, 27 Jul 2022 10:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379DBC3789;
 Wed, 27 Jul 2022 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658917675; x=1690453675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RAxfJBN9n4CWOpgXIybmmcng3L781asp7yixKNjuixc=;
 b=NQQDd4hmGj6KW3hHrH8EXr2WtEjhWxP8D0LuoHwNWnfPH5dD5L21H+O7
 YJZKsVVwth7dZ5XuaaYwRFGPV+DwhBoNQVQq1u+fFq3ZHwYBuD3bD+6xW
 w5IYzfvv6/bCzsZAuP0JZH1MEjZ/0R6CMEc9o6XtTBg8QmG3WWXWl6J7f
 XyOszb5JWiaX2aXO1mt88H2W/kVzSqO3m7DlrpSIyqk1vkXPfe4xiiq4G
 OqXV5HKPFNLG+cbLe7HVTb0i/L6oX0/6vDvUD/nydgyArutpZ9b4S7kYH
 /ESABDcymlZ6PaI/beSL5geMv1csvCyKFvpHLJZOlpD1wTEGWpKKsuYZw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="271238528"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="271238528"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 03:27:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; d="scan'208";a="659139668"
Received: from cene1-mobl.ger.corp.intel.com (HELO intel.com) ([10.252.44.151])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 03:27:50 -0700
Date: Wed, 27 Jul 2022 12:26:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm: Move and add a few utility
 macros into drm util header
Message-ID: <YuESy0q5X9pksg9M@alfio.lan>
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 25, 2022 at 12:25:22PM +0300, Gwan-gyeong Mun wrote:
> It moves overflows_type utility macro into drm util header from i915_utils
> header. The overflows_type can be used to catch the truncation between data
> types. And it adds safe_conversion() macro which performs a type conversion
> (cast) of an source value into a new variable, checking that the
> destination is large enough to hold the source value.
> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
> while compiling.
> 
> v3: Add is_type_unsigned() macro (Mauro)
>     Modify overflows_type() macro to consider signed data types (Mauro)
>     Fix the problem that safe_conversion() macro always returns true
> v4: Fix kernel-doc markups
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/gpu/drm/i915/i915_utils.h |  5 +-
>  include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 4 deletions(-)

Jani and Mauro suggested to have this macro in
include/drm/drm_util.h.

Can I please have an ack from one of the drm maintainers so that
I can go ahead an apply this series?

Thanks,
Andi

> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..345e5b2dc1cd 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,7 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <linux/sched/clock.h>
> +#include <drm/drm_util.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/hypervisor.h>
> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>  #define range_overflows_end_t(type, start, size, max) \
>  	range_overflows_end((type)(start), (type)(size), (type)(max))
>  
> -/* Note we don't consider signbits :| */
> -#define overflows_type(x, T) \
> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> -
>  #define ptr_mask_bits(ptr, n) ({					\
>  	unsigned long __v = (unsigned long)(ptr);			\
>  	(typeof(ptr))(__v & -BIT(n));					\
> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> index 79952d8c4bba..1de9ee5704fa 100644
> --- a/include/drm/drm_util.h
> +++ b/include/drm/drm_util.h
> @@ -62,6 +62,83 @@
>   */
>  #define for_each_if(condition) if (!(condition)) {} else
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
>  /**
>   * drm_can_sleep - returns true if currently okay to sleep
>   *
> -- 
> 2.34.1
