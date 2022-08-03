Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAAA588E3D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 16:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73E62AE6F;
	Wed,  3 Aug 2022 14:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2392AB20;
 Wed,  3 Aug 2022 14:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659535560; x=1691071560;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=34VL+dhIeVMzhLZ89miUYPbPdIYYdh9192LOywXQAJs=;
 b=hgdsAsAAMnGgX84X8Mi/yLNH/qSM8ZL89cCM1yMF1GI4H8hDJWHFGLqs
 wXZXES9+jmowzwLjT/Bgq/i8n1t3GZnMHIqWPNXVSrAF3/U1ksnEr4ZQf
 08DLBmpTJ5VlYUPTgvOEOtRrXm51hrg2GY9+2m23z+vcW9zJGtvM5ZQxl
 qKetmVP6TaGBDvKilcd7srfK6IydYTDbdz5vlnqJxLqhuGqHlxkLC0U8y
 37zFj8crWXmLNX8SnY0yHj6chnpunjW5aekskYSNH83NwJPKqqWH2VUXk
 iyROM5IG/S/ZRtUmNx/jpFHb57eU3yJp5bZWawdbakEi4BRvBdtERf9Hf g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="289689983"
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="289689983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 07:05:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,214,1654585200"; d="scan'208";a="631161030"
Received: from ns1-mobl.gar.corp.intel.com (HELO localhost) ([10.252.59.244])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:05:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Gwan-gyeong Mun
 <gwan-gyeong.mun@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 1/7] drm: Move and add a few utility
 macros into drm util header
In-Reply-To: <YuESy0q5X9pksg9M@alfio.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-2-gwan-gyeong.mun@intel.com>
 <YuESy0q5X9pksg9M@alfio.lan>
Date: Wed, 03 Aug 2022 17:05:41 +0300
Message-ID: <875yj9qv62.fsf@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Jul 2022, Andi Shyti <andi.shyti@linux.intel.com> wrote:
> Hi,
>
> On Mon, Jul 25, 2022 at 12:25:22PM +0300, Gwan-gyeong Mun wrote:
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
>>  2 files changed, 78 insertions(+), 4 deletions(-)
>
> Jani and Mauro suggested to have this macro in
> include/drm/drm_util.h.

I can't recall suggesting such a thing. The macros in question have
nothing specifically to do with i915 *or* drm. They are generic, and
should be in generic kernel headers.

We must stop piling up generic and generally useful stuff in our own
headers.

I thought I've been clear about this all along.


BR,
Jani.




>
> Can I please have an ack from one of the drm maintainers so that
> I can go ahead an apply this series?
>
> Thanks,
> Andi
>
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

--=20
Jani Nikula, Intel Open Source Graphics Center
