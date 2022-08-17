Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E288B5979F4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 01:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811D897B98;
	Wed, 17 Aug 2022 23:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48950ABF5B;
 Wed, 17 Aug 2022 23:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660777678; x=1692313678;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=B2ku+g2Lh8nIXn85bLhrd9BVVlmmBEonw0oahk7ctWU=;
 b=RiA94dSeQ3p3LodjOQ7Gex0wbvvgk2jA7hDyGrasaxsLNOaJzPqMvJ0P
 UltQbx9wFooCgh1Rq2/FdgyWHPWNXZTLSJrwuTJMR436isg66JEqIDOws
 6RFCApN0SBsUllyVFjhJq+n+jZg4mGQU+dlWBx/9SIO0ca73GisDeV5Ez
 sb9ly5gIhR3yaS0DSKFqEoo3QE5HZzArUkYpUmI2MlC3XIR0KEBj5/i5O
 fq1Gu304e9Vwrr/z3rAwLdlHNlsdmSkiGcktaRXzWGXfSvRbuXOjmHBHV
 0/oFseBmll6vWd/YjmvDSExG0H/w9cZqfTzZ3mDETA7RezGTraKao64t2 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="291375120"
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="291375120"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 16:07:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,244,1654585200"; d="scan'208";a="636570504"
Received: from zivlevy-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.51.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 16:07:53 -0700
Date: Thu, 18 Aug 2022 01:07:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v7 1/8] overflow: Move and add few utility macros into
 overflow
Message-ID: <Yv10sQADwdZrIV42@alfio.lan>
References: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
 <20220816093525.184940-2-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220816093525.184940-2-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, andi.shyti@linux.intel.com,
 Kees Cook <keescook@chromium.org>, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 andrzej.hajda@intel.com, linux-hardening@vger.kernel.org,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kees,

would you mind taking a look at this patch?

Thanks,
Andi

On Tue, Aug 16, 2022 at 06:35:18PM +0900, Gwan-gyeong Mun wrote:
> It moves overflows_type utility macro into overflow header from i915_utils
> header. The overflows_type can be used to catch the truncation between data
> types. And it adds safe_conversion() macro which performs a type conversion
> (cast) of an source value into a new variable, checking that the
> destination is large enough to hold the source value. And the functionality
> of overflows_type has been improved to handle the signbit.
> The is_unsigned_type macro has been added to check the sign bit of the
> built-in type.
> 
> v3: Add is_type_unsigned() macro (Mauro)
>     Modify overflows_type() macro to consider signed data types (Mauro)
>     Fix the problem that safe_conversion() macro always returns true
> v4: Fix kernel-doc markups
> v6: Move macro addition location so that it can be used by other than drm
>     subsystem (Jani, Mauro, Andi)
>     Change is_type_unsigned to is_unsigned_type to have the same name form
>     as is_signed_type macro
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
> ---
>  drivers/gpu/drm/i915/i915_utils.h |  5 +--
>  include/linux/overflow.h          | 54 +++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..eb0ded23fa9c 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,7 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <linux/sched/clock.h>
> +#include <linux/overflow.h>
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
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index f1221d11f8e5..462a03454377 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -35,6 +35,60 @@
>  #define type_max(T) ((T)((__type_half_max(T) - 1) + __type_half_max(T)))
>  #define type_min(T) ((T)((T)-type_max(T)-(T)1))
>  
> +/**
> + * is_unsigned_type - helper for checking data type which is an unsigned data
> + * type or not
> + * @x: The data type to check
> + *
> + * Returns:
> + * True if the data type is an unsigned data type, false otherwise.
> + */
> +#define is_unsigned_type(x) ((typeof(x))-1 >= (typeof(x))0)
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
> +#define overflows_type(x, T) \
> +	(is_unsigned_type(x) ? \
> +		is_unsigned_type(T) ? \
> +			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +			: (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : 0 \
> +	: is_unsigned_type(T) ? \
> +		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +		: (sizeof(x) > sizeof(T)) ? \
> +			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +			: 0)
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
>  /*
>   * Avoids triggering -Wtype-limits compilation warning,
>   * while using unsigned data types to check a < 0.
> -- 
> 2.37.1
