Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A8866E62
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 10:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A035510EFDF;
	Mon, 26 Feb 2024 09:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+b5dLDl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7714110EFDD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708939710; x=1740475710;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Wz4SoLxzTswpch9tgCM4x5EOC43eeKmpBEQj+YZz5+s=;
 b=T+b5dLDli/pkMK+JL5A83wZJ10bnvlEWVz0KLQvTS8lPvd1bprzo91Y4
 wAIKFyv/SIsBB0J/Eaiq6zHkaqPoZ5cYkhKPcTXIdLrDUL/pxrJtZc8zW
 A9XyorGyIsRs6mR/pUCXmrFDYCZgPANCIMaIicQkVA7UtcKHjzO84wCGB
 lHIcEQ6VhmYUQbS4nYDpmmCQaF23mRs9k+TsOoHy9zk27h6U5uqvKqpyd
 Dyz5I+16AKLeYDCU4Rx543n8dqg+FIXK2Ik7jVW1Eg7j4Pn8Ocdq7GnC9
 HVUhTyBJ3SEhZBpS20oQ6GtDCDt4LLA3IMiO0OAVjjim8wBqglrnlABBP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="7029309"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7029309"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:28:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="11169213"
Received: from hibeid-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.46.254])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:28:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Laight <David.Laight@ACULAB.COM>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, 'Linus Torvalds'
 <torvalds@linux-foundation.org>, 'Netdev' <netdev@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Cc: 'Jens Axboe' <axboe@kernel.dk>, "'Matthew Wilcox (Oracle)'"
 <willy@infradead.org>, 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>, 'Andrew
 Morton' <akpm@linux-foundation.org>, 'Andy Shevchenko'
 <andriy.shevchenko@linux.intel.com>, "'David S . Miller'"
 <davem@davemloft.net>, 'Dan Carpenter' <dan.carpenter@linaro.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH next v2 02/11] minmax: Use _Static_assert() instead of
 static_assert()
In-Reply-To: <8059bc04da1a45bc810ac339a1129a4c@AcuMS.aculab.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <0fff52305e584036a777f440b5f474da@AcuMS.aculab.com>
 <8059bc04da1a45bc810ac339a1129a4c@AcuMS.aculab.com>
Date: Mon, 26 Feb 2024 11:28:21 +0200
Message-ID: <87v86bo9qi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, 25 Feb 2024, David Laight <David.Laight@ACULAB.COM> wrote:
> The wrapper just adds two more lines of error output when the test fails.

There are only a handful of places in kernel code that use
_Static_assert() directly. Nearly 900 instances of static_assert().

Are we now saying it's fine to use _Static_assert() directly all over
the place? People will copy-paste and cargo cult.

BR,
Jani.

>
> Signed-off-by: David Laight <david.laight@aculab.com>
> ---
>  include/linux/minmax.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> Changes for v2:
> - Typographical and spelling corrections to the commit messages.
>   Patches unchanged.
>
> diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> index 63c45865b48a..900eec7a28e5 100644
> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -48,7 +48,7 @@
>  #define __cmp_once(op, x, y, unique_x, unique_y) ({	\
>  	typeof(x) unique_x = (x);			\
>  	typeof(y) unique_y = (y);			\
> -	static_assert(__types_ok(x, y),			\
> +	_Static_assert(__types_ok(x, y),			\
>  		#op "(" #x ", " #y ") signedness error, fix types or consider u" #op "() before " #op "_t()"); \
>  	__cmp(op, unique_x, unique_y); })
>  
> @@ -137,11 +137,11 @@
>  	typeof(val) unique_val = (val);						\
>  	typeof(lo) unique_lo = (lo);						\
>  	typeof(hi) unique_hi = (hi);						\
> -	static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)),	\
> +	_Static_assert(__builtin_choose_expr(__is_constexpr((lo) > (hi)),	\
>  			(lo) <= (hi), true),					\
>  		"clamp() low limit " #lo " greater than high limit " #hi);	\
> -	static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");	\
> -	static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");	\
> +	_Static_assert(__types_ok(val, lo), "clamp() 'lo' signedness error");	\
> +	_Static_assert(__types_ok(val, hi), "clamp() 'hi' signedness error");	\
>  	__clamp(unique_val, unique_lo, unique_hi); })
>  
>  #define __careful_clamp(val, lo, hi) ({					\

-- 
Jani Nikula, Intel
