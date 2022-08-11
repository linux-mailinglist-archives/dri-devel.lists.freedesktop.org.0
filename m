Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9A85906E3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 21:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA911AA19;
	Thu, 11 Aug 2022 19:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F055112435;
 Thu, 11 Aug 2022 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660245170; x=1691781170;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8iSsT7EaFc8R1veWXmJB833B+GYxD0O/KxflnS0rOwg=;
 b=goM9VrtDXFLjI8YAxYh9IJg69lRGWZeZXPAJ0NMf/ZO9P+d+6Az1qH6Q
 zux6C+5XwriHnOSfYFv0tjjtJ7m6jFAWUqjW2W8yWqFUCHj9qH1Pvwmnj
 CkpkJpB+ybGvClVQ4z6ojEUpc1gV+Qb3pLgR7OtuVqcA/LPTll82L2Csw
 UVoZozMWxiYy/fgeLMlBGAGY2UlwUiwq4coTtIedKAnidagKK4+UfA0zu
 pwv+ereGXk7lYEa7Y8hEimGDfaAv3tYElcqeXgW5KDO3ouFAriYPjDm97
 CNr5fQhXrwRKJlQev/E5CMXngLX7uw6DN73tYxgB52CzVZN6KTTT8GqVY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="289008559"
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="289008559"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 12:12:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,230,1654585200"; d="scan'208";a="665509406"
Received: from gdogaru-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.102])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2022 12:12:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Gwan-gyeong Mun
 <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v4 1/7] drm: Move and add a few utility macros into drm
 util header
In-Reply-To: <YvUuh2Ua7nuRNfr7@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
 <20220719140424.430572-2-gwan-gyeong.mun@intel.com>
 <YvUuh2Ua7nuRNfr7@phenom.ffwll.local>
Date: Thu, 11 Aug 2022 22:12:43 +0300
Message-ID: <87fsi2tx04.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, matthew.auld@intel.com, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Aug 2022, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Tue, Jul 19, 2022 at 05:04:18PM +0300, Gwan-gyeong Mun wrote:
>> It moves overflows_type utility macro into drm util header from i915_uti=
ls
>> header. The overflows_type can be used to catch the truncation between d=
ata
>> types. And it adds safe_conversion() macro which performs a type convers=
ion
>> (cast) of an source value into a new variable, checking that the
>> destination is large enough to hold the source value.
>> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
>> while compiling.
>>=20
>> v3: Add is_type_unsigned() macro (Mauro)
>>     Modify overflows_type() macro to consider signed data types (Mauro)
>>     Fix the problem that safe_conversion() macro always returns true
>> v4: Fix kernel-doc markups
>>=20
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>> ---
>>  drivers/gpu/drm/i915/i915_utils.h |  5 +-
>>  include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++
>
> It's nice that there's less random piling into i915_utils.h, but pushing
> them into drm_util.h isn't really better. These should all be in
> include/linux/ somewhere, so that we have as consistent code as possible.
>
> drm_util.h should only be a fallback if we get nacks for a more general
> place and still think it's the right thing to do.
>
> i915_util.h has frankyl gone completely bonkers and should die.

Agreed [1].

BR,
Jani.


[1] https://lore.kernel.org/r/875yj9qv62.fsf@intel.com


> -Daniel
>
>>  2 files changed, 78 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i9=
15_utils.h
>> index c10d68cdc3ca..345e5b2dc1cd 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -32,6 +32,7 @@
>>  #include <linux/types.h>
>>  #include <linux/workqueue.h>
>>  #include <linux/sched/clock.h>
>> +#include <drm/drm_util.h>
>>=20=20
>>  #ifdef CONFIG_X86
>>  #include <asm/hypervisor.h>
>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>  #define range_overflows_end_t(type, start, size, max) \
>>  	range_overflows_end((type)(start), (type)(size), (type)(max))
>>=20=20
>> -/* Note we don't consider signbits :| */
>> -#define overflows_type(x, T) \
>> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> -
>>  #define ptr_mask_bits(ptr, n) ({					\
>>  	unsigned long __v =3D (unsigned long)(ptr);			\
>>  	(typeof(ptr))(__v & -BIT(n));					\
>> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
>> index 79952d8c4bba..1de9ee5704fa 100644
>> --- a/include/drm/drm_util.h
>> +++ b/include/drm/drm_util.h
>> @@ -62,6 +62,83 @@
>>   */
>>  #define for_each_if(condition) if (!(condition)) {} else
>>=20=20
>> +/**
>> + * is_type_unsigned - helper for checking data type which is an unsigne=
d data
>> + * type or not
>> + * @x: The data type to check
>> + *
>> + * Returns:
>> + * True if the data type is an unsigned data type, false otherwise.
>> + */
>> +#define is_type_unsigned(x) ((typeof(x))-1 >=3D (typeof(x))0)
>> +
>> +/**
>> + * overflows_type - helper for checking the truncation between data typ=
es
>> + * @x: Source for overflow type comparison
>> + * @T: Destination for overflow type comparison
>> + *
>> + * It compares the values and size of each data type between the first =
and
>> + * second argument to check whether truncation can occur when assigning=
 the
>> + * first argument to the variable of the second argument.
>> + * Source and Destination can be used with or without sign bit.
>> + * Composite data structures such as union and structure are not consid=
ered.
>> + * Enum data types are not considered.
>> + * Floating point data types are not considered.
>> + *
>> + * Returns:
>> + * True if truncation can occur, false otherwise.
>> + */
>> +
>> +#define overflows_type(x, T) \
>> +	(is_type_unsigned(x) ? \
>> +		is_type_unsigned(T) ? \
>> +			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +			: (sizeof(x) >=3D sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : =
0 \
>> +	: is_type_unsigned(T) ? \
>> +		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? =
1 : 0 \
>> +		: (sizeof(x) > sizeof(T)) ? \
>> +			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> +			: 0)
>> +
>> +/**
>> + * exact_type - break compile if source type and destination value's ty=
pe are
>> + * not the same
>> + * @T: Source type
>> + * @n: Destination value
>> + *
>> + * It is a helper macro for a poor man's -Wconversion: only allow varia=
bles of
>> + * an exact type. It determines whether the source type and destination=
 value's
>> + * type are the same while compiling, and it breaks compile if two type=
s are
>> + * not the same
>> + */
>> +#define exact_type(T, n) \
>> +	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p=
(T, typeof(n)))
>> +
>> +/**
>> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
>> + * @n: value to compare pgoff_t type
>> + *
>> + * It breaks compile if the argument value's type is not pgoff_t type.
>> + */
>> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
>> +
>> +/**
>> + * safe_conversion - perform a type conversion (cast) of an source valu=
e into
>> + * a new variable, checking that the destination is large enough to hol=
d the
>> + * source value.
>> + * @ptr: Destination pointer address
>> + * @value: Source value
>> + *
>> + * Returns:
>> + * If the value would overflow the destination, it returns false.
>> + */
>> +#define safe_conversion(ptr, value) ({ \
>> +	typeof(value) __v =3D (value); \
>> +	typeof(ptr) __ptr =3D (ptr); \
>> +	overflows_type(__v, *__ptr) ? 0 : ((*__ptr =3D (typeof(*__ptr))__v), 1=
); \
>> +})
>> +
>>  /**
>>   * drm_can_sleep - returns true if currently okay to sleep
>>   *
>> --=20
>> 2.34.1
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
