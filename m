Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD65670E2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4837811B353;
	Tue,  5 Jul 2022 14:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D355711B353;
 Tue,  5 Jul 2022 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657031006; x=1688567006;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zMWPsiEJ2GbI03vGZvabnrCgYvLd5H8NtWY2zusK7Io=;
 b=gpYORfCZ41vbNoK2uAZCu6pDhc7zHbVc0P7fURqQ1BJ9PRpwEyaeaRT3
 BlDSWxplYr9HtNG2nA67oNEpIuGP2PnXcx3pI+Xx5ZayocXMA8BEUY5Ru
 y059gKDeHezIojyotqPQCGFFKFZrAplLiahbtcZB+yEuKNeLGcL0A2xOk
 rWM5AI72JQlJYhnoU4Qt9AJTU5TOI0WhIyVGxuWfT2zSQXR6SjhQafcMp
 sYnTFatQNUUuUramYEgz89P8EHHp+SsEKV3SJtcjkDFPJMFvWIUXupkef
 BAzHzh2hcksvESdj17jsb9UNSydutQR5/4wQrkQ2ufd1Jt3igbuYVJ83R g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="345047332"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="345047332"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:23:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="650171006"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.206])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 07:23:23 -0700
Date: Tue, 5 Jul 2022 16:23:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v2 1/7] drm: Move and add a few utility macros into drm
 util header
Message-ID: <20220705162320.3f64e203@maurocar-mobl2>
In-Reply-To: <20220705122455.3866745-2-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
 <20220705122455.3866745-2-gwan-gyeong.mun@intel.com>
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

On Tue,  5 Jul 2022 15:24:49 +0300
Gwan-gyeong Mun <gwan-gyeong.mun@intel.com> wrote:

> It moves overflows_type utility macro into drm util header from i915_utils
> header. The overflows_type can be used to catch the truncation between da=
ta
> types. And it adds safe_conversion() macro which performs a type conversi=
on
> (cast) of an source value into a new variable, checking that the
> destination is large enough to hold the source value.
> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
> while compiling.
>=20
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_utils.h |  5 +--
>  include/drm/drm_util.h            | 54 +++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i91=
5_utils.h
> index c10d68cdc3ca..345e5b2dc1cd 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,7 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <linux/sched/clock.h>
> +#include <drm/drm_util.h>
> =20
>  #ifdef CONFIG_X86
>  #include <asm/hypervisor.h>
> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>  #define range_overflows_end_t(type, start, size, max) \
>  	range_overflows_end((type)(start), (type)(size), (type)(max))
> =20
> -/* Note we don't consider signbits :| */
> -#define overflows_type(x, T) \
> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> -
>  #define ptr_mask_bits(ptr, n) ({					\
>  	unsigned long __v =3D (unsigned long)(ptr);			\
>  	(typeof(ptr))(__v & -BIT(n));					\
> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> index 79952d8c4bba..c56230e39e37 100644
> --- a/include/drm/drm_util.h
> +++ b/include/drm/drm_util.h
> @@ -62,6 +62,60 @@
>   */
>  #define for_each_if(condition) if (!(condition)) {} else
> =20
> +/**
> + * overflows_type - helper for checking the truncation between data types
> + * @x: Source for overflow type comparison
> + * @T: Destination for overflow type comparison
> + *
> + * It compares the values and size of each data type between the first a=
nd
> + * second argument to check whether truncation can occur when assigning =
the
> + * first argument to the variable of the second argument.
> + * It does't consider signbits.
> + *
> + * Returns:
> + * True if truncation can occur, false otherwise.
> + */
> +#define overflows_type(x, T) \
> +	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))

As pointed on its description, this macro only works if both types
are either signed or unsigned. However, the macro itself doesn't check
it.

It probably worth adding something there to ensure that both types are=20
either signed or unsigned. I would add this ancillary macro probably on
on a generic kernel header - as this can be useful outside drm:

	#define sign_matches(x, y) \
	        (!((typeof(x))-1 >=3D 0) ^ ((typeof(y))-1 >=3D 0))

And then include use it at overflows_type:

	BUILD_BUG_ON(!sign_matches(x, T))

> +
> +/**
> + * exact_type - break compile if source type and destination value's typ=
e are
> + * not the same
> + * @T: Source type
> + * @n: Destination value
> + *
> + * It is a helper macro for a poor man's -Wconversion: only allow variab=
les of
> + * an exact type. It determines whether the source type and destination =
value's
> + * type are the same while compiling, and it breaks compile if two types=
 are
> + * not the same
> + */
> +#define exact_type(T, n) \
> +	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(=
T, typeof(n)))
> +
> +/**
> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
> + * @n: value to compare pgoff_t type
> + *
> + * It breaks compile if the argument value's type is not pgoff_t type.
> + */
> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
> +
> +/*
> + * safe_conversion - perform a type conversion (cast) of an source value=
 into
> + * a new variable, checking that the destination is large enough to hold=
 the
> + * source value.
> + * @ptr: Destination pointer address
> + * @value: Source value
> + *
> + * Returns:
> + * If the value would overflow the destination, it returns false.
> + */
> +#define safe_conversion(ptr, value) ({ \
> +	typeof(value) __v =3D (value); \
> +	typeof(ptr) __ptr =3D (ptr); \
> +	overflows_type(__v, *__ptr) ? 0 : (*__ptr =3D (typeof(*__ptr))__v), 1; \
> +})
> +
>  /**
>   * drm_can_sleep - returns true if currently okay to sleep
>   *
