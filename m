Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610056903C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 19:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BEB11A70A;
	Wed,  6 Jul 2022 17:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1864D11A70A;
 Wed,  6 Jul 2022 17:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657127121; x=1688663121;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D6oRJugJMsdPnOsTCDFsAgCqLEy6PYXErv0bTQqOdnY=;
 b=HbHIhzAmCCA1wVk1hXvdqJIFh3fYabHunAM2verRUBOztLr+kivrPAgg
 RIWDCwyWhah/YbqeJVRI+XzivpJwkMRT8aExLZQ0lx8x8c2QAVbYa0ya6
 DCohhkYpYznWZ80CwGP+uVx5TvP9vB9s9YC6dyuzoB6xkLI490ptgNyxw
 PK1miAyvtG5v1Cr+2axUWYoVWE+IdAE/jCDjqAh3mAQeTuy3Pao4CWf+I
 A0nRoxCN1Hf5A0uIrFir/ABEKReTzVnmboWUs5E75tNfF4T64Qzi4GY/6
 5PJyJMomzvw2W5ZVk0+tjJDVy9fGZ0WAk2StEKUWZ0lEVIkRaeecqYO9I Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="284936068"
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="284936068"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 10:05:19 -0700
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="650756560"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.249.32.242])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 10:05:16 -0700
Date: Wed, 6 Jul 2022 19:05:13 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 1/7] drm: Move and add a few utility macros into drm
 util header
Message-ID: <20220706190513.38bf0be0@maurocar-mobl2>
In-Reply-To: <2da2f40a-cf5e-ed3d-fee7-877910f377bb@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-2-gwan-gyeong.mun@intel.com>
 <20220705162320.3f64e203@maurocar-mobl2>
 <2da2f40a-cf5e-ed3d-fee7-877910f377bb@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 18:04:20 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> On 7/5/22 5:23 PM, Mauro Carvalho Chehab wrote:
> > On Tue,  5 Jul 2022 15:24:49 +0300
> > Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:
> >  =20
> >> It moves overflows_type utility macro into drm util header from i915_u=
tils
> >> header. The overflows_type can be used to catch the truncation between=
 data
> >> types. And it adds safe_conversion() macro which performs a type conve=
rsion
> >> (cast) of an source value into a new variable, checking that the
> >> destination is large enough to hold the source value.
> >> And it adds exact_type and exactly_pgoff_t macro to catch type mis-mat=
ch
> >> while compiling.
> >>
> >> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> >> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >> Cc: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Nirmoy Das <nirmoy.das@intel.com>
> >> Cc: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>   drivers/gpu/drm/i915/i915_utils.h |  5 +--
> >>   include/drm/drm_util.h            | 54 +++++++++++++++++++++++++++++=
++
> >>   2 files changed, 55 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/=
i915_utils.h
> >> index c10d68cdc3ca..345e5b2dc1cd 100644
> >> --- a/drivers/gpu/drm/i915/i915_utils.h
> >> +++ b/drivers/gpu/drm/i915/i915_utils.h
> >> @@ -32,6 +32,7 @@
> >>   #include <linux/types.h>
> >>   #include <linux/workqueue.h>
> >>   #include <linux/sched/clock.h>
> >> +#include <drm/drm_util.h>
> >>  =20
> >>   #ifdef CONFIG_X86
> >>   #include <asm/hypervisor.h>
> >> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
> >>   #define range_overflows_end_t(type, start, size, max) \
> >>   	range_overflows_end((type)(start), (type)(size), (type)(max))
> >>  =20
> >> -/* Note we don't consider signbits :| */
> >> -#define overflows_type(x, T) \
> >> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> >> -
> >>   #define ptr_mask_bits(ptr, n) ({					\
> >>   	unsigned long __v =3D (unsigned long)(ptr);			\
> >>   	(typeof(ptr))(__v & -BIT(n));					\
> >> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> >> index 79952d8c4bba..c56230e39e37 100644
> >> --- a/include/drm/drm_util.h
> >> +++ b/include/drm/drm_util.h
> >> @@ -62,6 +62,60 @@
> >>    */
> >>   #define for_each_if(condition) if (!(condition)) {} else
> >>  =20
> >> +/**
> >> + * overflows_type - helper for checking the truncation between data t=
ypes
> >> + * @x: Source for overflow type comparison
> >> + * @T: Destination for overflow type comparison
> >> + *
> >> + * It compares the values and size of each data type between the firs=
t and
> >> + * second argument to check whether truncation can occur when assigni=
ng the
> >> + * first argument to the variable of the second argument.
> >> + * It does't consider signbits.
> >> + *
> >> + * Returns:
> >> + * True if truncation can occur, false otherwise.
> >> + */
> >> +#define overflows_type(x, T) \
> >> +	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))=20
> >=20
> > As pointed on its description, this macro only works if both types
> > are either signed or unsigned. However, the macro itself doesn't check
> > it.
> >=20
> > It probably worth adding something there to ensure that both types are
> > either signed or unsigned. I would add this ancillary macro probably on
> > on a generic kernel header - as this can be useful outside drm:
> >=20
> > 	#define sign_matches(x, y) \
> > 	        (!((typeof(x))-1 >=3D 0) ^ ((typeof(y))-1 >=3D 0))
> >=20
> > And then include use it at overflows_type:
> >=20
> > 	BUILD_BUG_ON(!sign_matches(x, T))
> >  =20
> Hi Mauro, thanks for checking it.
>=20
> What you commented here (sign_matches macro) is to check whether the=20
> sign bits of two types are the same,  but the purpose of the=20
> overflows_type() macro checks overflows while assigning a variable with=20
> a large data size (BITS_PER_TYPE is large) to a variable with a small=20
> data size (BITS_PER_TYPE is small).

True, but the problem is that such macro just assumes that either both
are signed or unsigned without actually checking it.

Basically, if one tries to store for instance a s32 value on an u64 var,
the value won't be stored correctly, due to an underflow. As the hole
idea of this macro is to exactly detect if the "container" variable
is big enough to properly represent the measure, it sounds incomplete
to not handle the integer signal.

Btw, after reviewing all patches, using BUILD_BUG_ON() is not needed
here, as such macro (or similar) is already used at the callers code.

So, I would just return false if the signals are incompatible, e. g.=20
if the type of the source value is signed and the type of the=20
destination value is unsigned.

So:

#define overflows_type(x, T) \
	(!signal_matches(x,T) || (sizeof(x) > sizeof(T)))

Should do the trick[1].=20

[1] using BITS_PER_TYPE() macro is not really needed, as this is
    defined as:

	#define BITS_PER_BYTE              8
	#define BITS_PER_TYPE(type)      (sizeof(type) * BITS_PER_BYTE)

    So, checking if sizeof(x) > sizeof(T) is enough. Btw, the check
    there seems to be inverted, making the macro to always return zero!

Yet, strictly speaking, it is possible to store an unsigned value on a=20
signed type, if the signed type is bigger than the size of unsigned
(so, a s64 int can store u32, but a s32 can't store u32).

Adding a check that would consider this should be like:

	#define is_type_unsigned(x) ((typeof(x))-1 >=3D 0)=20
	#define is_type_signed(x) (!is_type_unsigned(x))=20
	#define overflows_type(x, T)							 \
	(										 \
		(is_type_signed(x) && is_type_unsigned(T)) ||				 \
		(is_type_unsigned(x) && is_type_signed(T) && (sizeof(x) =3D=3D sizeof(T))=
) ||\
		(sizeof(x) > sizeof(T))							 \
	) =09

This should be generic enough to be used anywhere.

> we can check the additional sign bit by adding sign_matches() to the=20
> overflows_type() macro, but in the current scenario, it is used only=20
> when the sign bit is the same.

Yeah, but "current scenarios" can easily be extended to something
else, quickly going sideways specially on a subsystem-wide macro.=20
Also, getting this right is particularly tricky when comparing typedef
integers. So, I would be more comfortable if the logic will also
check the signal at the destination variable.

> Should the macro be extended even for cases where the sign bit is=20
> different in the current state? (If yes, I'll updated it as v3)
>=20
> In addition, the place where this macro is currently used is only in the=
=20
> i915 driver, so it has been moved to the header of the drm subsystem.
> IMHO, moving the macro location so that it can be used by multiple=20
> subsystems of linux would be a good idea when there is a use case for=20
> this macro. What do you think?

Good point. Yeah, it can stay there while not needed outside drm.

Btw, in order to get it right, I suggest double-checking in userspace
how each macros are evaluated, like using the code below.

It helps to check if the logic is doing what's expected or not.

----

#include <stdio.h>
#include <stdint.h>

// Kernel definitions from bits.h and bitops.h
#define BITS_PER_BYTE              8
#define BITS_PER_TYPE(type)      (sizeof(type) * BITS_PER_BYTE)

#define sign_matches(x, y) \
	(!((typeof(x))-1 >=3D 0) ^ ((typeof(y))-1 >=3D 0))

#define is_type_unsigned(x) ((typeof(x))-1 >=3D 0)
#define is_type_signed(x) (!is_type_unsigned(x))

#define overflows_type(x, T)								 \
	(										 \
		(is_type_signed(x) && is_type_unsigned(T)) ||				 \
		(is_type_unsigned(x) && is_type_signed(T) && (sizeof(x) =3D=3D sizeof(T))=
) ||\
		(sizeof(x) > sizeof(T))							 \
	) ? "OVERFLOW" : "don't overflow"

int main(void)
{
	uint32_t	u32_1 =3D 0, u32_2 =3D 0;
	int32_t		s32_1 =3D 0, s32_2 =3D 0;
	uint64_t	u64_1 =3D 0, u64_2 =3D 0;
	int64_t		s64_1 =3D 0, s64_2 =3D 0;

	printf("u32 stored into u32: %s\n", overflows_type(u32_1, u32_2));
	printf("u64 stored into u32: %s\n", overflows_type(u64_1, u32_2));
	printf("s32 stored into u32: %s\n", overflows_type(s32_1, u32_2));
	printf("s64 stored into u32: %s\n", overflows_type(s64_1, u32_2));

	printf("u32 stored into s32: %s\n", overflows_type(u32_1, s32_2));
	printf("u64 stored into s32: %s\n", overflows_type(u64_1, s32_2));
	printf("s32 stored into s32: %s\n", overflows_type(s32_1, s32_2));
	printf("s64 stored into s32: %s\n", overflows_type(s64_1, s32_2));

	printf("u32 stored into u64: %s\n", overflows_type(u32_1, u64_2));
	printf("u64 stored into u64: %s\n", overflows_type(u64_1, u64_2));
	printf("s32 stored into u64: %s\n", overflows_type(s32_1, u64_2));
	printf("s64 stored into u64: %s\n", overflows_type(s64_1, u64_2));

	printf("u32 stored into s64: %s\n", overflows_type(u32_1, s64_2));
	printf("u64 stored into s64: %s\n", overflows_type(u64_1, s64_2));
	printf("s32 stored into u64: %s\n", overflows_type(s32_1, u64_2));
	printf("s64 stored into u64: %s\n", overflows_type(s64_1, u64_2));

	// Shutup warnings
	s64_1 =3D u32_1 + u32_2 + s64_2 + s32_1 + s32_2 + u64_1 + u64_2;

	return 0;
}
