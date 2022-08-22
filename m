Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B459BE0B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 13:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A93112A5F;
	Mon, 22 Aug 2022 11:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E145112A0B;
 Mon, 22 Aug 2022 11:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661166135; x=1692702135;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZDyXoOKFLsJWDZrI4atkglbvrUUdtWkTh1x2BJ1kAgI=;
 b=m3j/Q/s8YSjSoWE4GQWGRfJ1QXNpGe3d5O13W9dkfXVyfc1E5bycU+pd
 0w3KiVYaAZBJOP5CTIA1NakFh5cPqO8yU/NZTBYGjdr1j4JaiIP7RLMGJ
 lk/a1/6RECquWXQ/XziltZFLE1nMkzBxoPh0H/nln3deNWPGc2w/OSz4s
 2vG7jhLfVdErjkpz+sJCXJdONIf22RiPrxI0BwLR4nOvZaS9xmqS2k8+1
 NVXPea2Tc/x0ErmIfAKLIYhMjjXFUk1shWU5wiqj8aY4D56u+oHPQZlw0
 UhLy9jIiCRUxsQZlfQp2e6Jl3CO3MFqjdV47WDecuOuFo3j49I+K32Uo1 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10446"; a="290939887"
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="290939887"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 04:02:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,254,1654585200"; d="scan'208";a="669489583"
Received: from trangnek-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.50.159])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 04:02:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kees Cook <keescook@chromium.org>, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v7 1/8] overflow: Move and add few utility macros into
 overflow
In-Reply-To: <202208171657.63AE7AC@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220816093525.184940-1-gwan-gyeong.mun@intel.com>
 <20220816093525.184940-2-gwan-gyeong.mun@intel.com>
 <Yv10sQADwdZrIV42@alfio.lan> <202208171657.63AE7AC@keescook>
Date: Mon, 22 Aug 2022 14:02:01 +0300
Message-ID: <87r118mthy.fsf@intel.com>
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
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, andrzej.hajda@intel.com,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, linux-hardening@vger.kernel.org,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Aug 2022, Kees Cook <keescook@chromium.org> wrote:
> On Thu, Aug 18, 2022 at 01:07:29AM +0200, Andi Shyti wrote:
>> Hi Kees,
>>=20
>> would you mind taking a look at this patch?
>
> Hi! Thanks for the heads-up!

Thanks for your review. This actually reaffirms my belief that we need
to get these macros out of i915_utils.h and into the common headers,
where we can get more eyes on them.

BR,
Jani.


>
>>=20
>> Thanks,
>> Andi
>>=20
>> On Tue, Aug 16, 2022 at 06:35:18PM +0900, Gwan-gyeong Mun wrote:
>> > It moves overflows_type utility macro into overflow header from i915_u=
tils
>> > header. The overflows_type can be used to catch the truncation between=
 data
>> > types. And it adds safe_conversion() macro which performs a type conve=
rsion
>> > (cast) of an source value into a new variable, checking that the
>> > destination is large enough to hold the source value. And the function=
ality
>> > of overflows_type has been improved to handle the signbit.
>> > The is_unsigned_type macro has been added to check the sign bit of the
>> > built-in type.
>> >=20
>> > v3: Add is_type_unsigned() macro (Mauro)
>> >     Modify overflows_type() macro to consider signed data types (Mauro)
>> >     Fix the problem that safe_conversion() macro always returns true
>> > v4: Fix kernel-doc markups
>> > v6: Move macro addition location so that it can be used by other than =
drm
>> >     subsystem (Jani, Mauro, Andi)
>> >     Change is_type_unsigned to is_unsigned_type to have the same name =
form
>> >     as is_signed_type macro
>> >=20
>> > Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> > Cc: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Nirmoy Das <nirmoy.das@intel.com>
>> > Cc: Jani Nikula <jani.nikula@intel.com>
>> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> > Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>> > ---
>> >  drivers/gpu/drm/i915/i915_utils.h |  5 +--
>> >  include/linux/overflow.h          | 54 +++++++++++++++++++++++++++++++
>> >  2 files changed, 55 insertions(+), 4 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/=
i915_utils.h
>> > index c10d68cdc3ca..eb0ded23fa9c 100644
>> > --- a/drivers/gpu/drm/i915/i915_utils.h
>> > +++ b/drivers/gpu/drm/i915/i915_utils.h
>> > @@ -32,6 +32,7 @@
>> >  #include <linux/types.h>
>> >  #include <linux/workqueue.h>
>> >  #include <linux/sched/clock.h>
>> > +#include <linux/overflow.h>
>> >=20=20
>> >  #ifdef CONFIG_X86
>> >  #include <asm/hypervisor.h>
>> > @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>> >  #define range_overflows_end_t(type, start, size, max) \
>> >  	range_overflows_end((type)(start), (type)(size), (type)(max))
>> >=20=20
>> > -/* Note we don't consider signbits :| */
>> > -#define overflows_type(x, T) \
>> > -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> > -
>> >  #define ptr_mask_bits(ptr, n) ({					\
>> >  	unsigned long __v =3D (unsigned long)(ptr);			\
>> >  	(typeof(ptr))(__v & -BIT(n));					\
>> > diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>> > index f1221d11f8e5..462a03454377 100644
>> > --- a/include/linux/overflow.h
>> > +++ b/include/linux/overflow.h
>> > @@ -35,6 +35,60 @@
>> >  #define type_max(T) ((T)((__type_half_max(T) - 1) + __type_half_max(T=
)))
>> >  #define type_min(T) ((T)((T)-type_max(T)-(T)1))
>> >=20=20
>> > +/**
>> > + * is_unsigned_type - helper for checking data type which is an unsig=
ned data
>> > + * type or not
>> > + * @x: The data type to check
>> > + *
>> > + * Returns:
>> > + * True if the data type is an unsigned data type, false otherwise.
>> > + */
>> > +#define is_unsigned_type(x) ((typeof(x))-1 >=3D (typeof(x))0)
>
> I'd rather not have separate logic for this. Instead, I'd like it to be:
>
> #define is_unsigned_type(x) (!is_signed_type(x))
>
>> > +
>> > +/**
>> > + * overflows_type - helper for checking the truncation between data t=
ypes
>> > + * @x: Source for overflow type comparison
>> > + * @T: Destination for overflow type comparison
>> > + *
>> > + * It compares the values and size of each data type between the firs=
t and
>> > + * second argument to check whether truncation can occur when assigni=
ng the
>> > + * first argument to the variable of the second argument.
>> > + * Source and Destination can be used with or without sign bit.
>> > + * Composite data structures such as union and structure are not cons=
idered.
>> > + * Enum data types are not considered.
>> > + * Floating point data types are not considered.
>> > + *
>> > + * Returns:
>> > + * True if truncation can occur, false otherwise.
>> > + */
>> > +#define overflows_type(x, T) \
>> > +	(is_unsigned_type(x) ? \
>> > +		is_unsigned_type(T) ? \
>> > +			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> > +			: (sizeof(x) >=3D sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 =
: 0 \
>> > +	: is_unsigned_type(T) ? \
>> > +		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) =
? 1 : 0 \
>> > +		: (sizeof(x) > sizeof(T)) ? \
>> > +			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> > +				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
>> > +			: 0)
>
> Like the other, I'd much rather this was rephrased in terms of the
> existing macros (e.g. type_min()/type_max().)
>
>> > +
>> > +/**
>> > + * safe_conversion - perform a type conversion (cast) of an source va=
lue into
>> > + * a new variable, checking that the destination is large enough to h=
old the
>> > + * source value.
>> > + * @ptr: Destination pointer address
>> > + * @value: Source value
>> > + *
>> > + * Returns:
>> > + * If the value would overflow the destination, it returns false.
>> > + */
>> > +#define safe_conversion(ptr, value) ({ \
>> > +	typeof(value) __v =3D (value); \
>> > +	typeof(ptr) __ptr =3D (ptr); \
>> > +	overflows_type(__v, *__ptr) ? 0 : ((*__ptr =3D (typeof(*__ptr))__v),=
 1); \
>> > +})
>
> I try to avoid "safe" as an adjective for interface names, since it
> doesn't really answer "safe from what?" This looks more like "assign, but
> zero when out of bounds". And it can be built from existing macros here:
>
> 	if (check_add_overflow(0, value, ptr))
> 		*ptr =3D 0;
>
> I actually want to push back on this a bit, because there can still be
> logic bugs built around this kind of primitive. Shouldn't out-of-bounds
> assignments be seen as a direct failure? I would think this would be
> sufficient:
>
> #define check_assign(value, ptr)	check_add_overflow(0, value, ptr)
>
> And callers would do:
>
> 	if (check_assign(value, &var))
> 		return -EINVAL;
>
> etc.

--=20
Jani Nikula, Intel Open Source Graphics Center
