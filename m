Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4810677951
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ED910E472;
	Mon, 23 Jan 2023 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3260410E1E4;
 Mon, 23 Jan 2023 10:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674470313; x=1706006313;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Bqf/SY3iWd4utRuCTYdmb6VJSfaljBv0Lsav/cvjMUI=;
 b=bKqEuUoA9yhG2P+PkarO7B9/naX676nFMsuBVftsllFV/LHsOitZ89Hi
 jvjeNT564X4KaYKI4qJFn9xm6t2nZd5n6QjFBPWCB7klVeBSbP16ztIL3
 0J4SNQfiPa7GvF1VJngdXTD7vn2vYkzhujuQMsGZGSZvHv6eJOG3te+wS
 8oE9utkNnBr5sgcteN0c3EVYSTHlQVNTP5makre3+adknKzRqSB41S5Fn
 jh/N1nA6Eb6IXVV5TvQ+jdpIAoIwvixzkc7t6WipX72A8fcpjHn/erbiV
 2UkOqsUJO57n/qDdo7FSWwrrEx2Z/WgaQQDe9wgHobTDbljSImVQrpQDJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="313908030"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="313908030"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 02:38:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="750270960"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; d="scan'208";a="750270960"
Received: from possola-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.125])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 02:38:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/i915: Add _PICK_EVEN_2RANGES()
In-Reply-To: <20230120193457.3295977-2-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230120193457.3295977-1-lucas.demarchi@intel.com>
 <20230120193457.3295977-2-lucas.demarchi@intel.com>
Date: Mon, 23 Jan 2023 12:38:28 +0200
Message-ID: <87lelt8riz.fsf@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Jan 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> It's a constant pattern in the driver to need to use 2 ranges of MMIOs
> based on port, phy, pll, etc. When that happens, instead of using
> _PICK_EVEN(), _PICK() needs to be used.  Using _PICK() is discouraged
> due to some reasons like:
>
> 1) It increases the code size since the array is declared
>    in each call site

Would be interesting to see what this does, and whether the compiler has
the smarts to combine these within each file:

-#define _PICK(__index, ...) (((const u32 []){ __VA_ARGS__ })[__index])
+#define _PICK(__index, ...) (((static const u32 []){ __VA_ARGS__ })[__index])

> 2) Developers need to be careful not to incur an
>    out-of-bounds array access
> 3) Developers need to be careful that the indexes match the
>    table. For that it may be that the table needs to contain
>    holes, making (1) even worse.
>
> Add a variant of _PICK_EVEN() that works with 2 ranges and selects which
> one to use depending on the index value.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index be43580a6979..b7ec87464d69 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -119,6 +119,34 @@
>   */
>  #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
>  
> +/*
> + * Like _PICK_EVEN(), but supports 2 ranges of evenly spaced address offsets.
> + * The first range is used for indexes below @__c_index, and the second
> + * range is used for anything above it. Example::

I'd like this to be clear about which range is used for index ==
__c_index, instead of saying "below" and "above".

No need for the double colon :: because this isn't a kernel-doc comment.

> + *
> + * #define _FOO_A			0xf000
> + * #define _FOO_B			0xf004
> + * #define _FOO_C			0xf008
> + * #define _SUPER_FOO_A			0xa000
> + * #define _SUPER_FOO_B			0xa100
> + * #define FOO(x)			_MMIO(_PICK_EVEN_RANGES(x, 3,		\

The example uses a different name for the macro.

> + *					      _FOO_A, _FOO_B,			\
> + *					      _SUPER_FOO_A, _SUPER_FOO_B))
> + *
> + * This expands to:
> + *	0: 0xf000,
> + *	1: 0xf004,
> + *	2: 0xf008,
> + *	3: 0xa100,

With the above definitions, this would be 3: 0xa000.

> + *	4: 0xa200,
> + *	5: 0xa300,
> + *	...
> + */
> +#define _PICK_EVEN_2RANGES(__index, __c_index, __a, __b, __c, __d)		\
> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__c_index)) +			\
> +	 ((__index) < (__c_index) ? _PICK_EVEN(__index, __a, __b) :		\
> +				   _PICK_EVEN((__index) - (__c_index), __c, __d)))
> +
>  /*
>   * Given the arbitrary numbers in varargs, pick the 0-based __index'th number.
>   *

-- 
Jani Nikula, Intel Open Source Graphics Center
