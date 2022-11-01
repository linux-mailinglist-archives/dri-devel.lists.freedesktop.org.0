Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED42614809
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6BB10E378;
	Tue,  1 Nov 2022 10:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35ED10E378;
 Tue,  1 Nov 2022 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667300298; x=1698836298;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=0KjFrSr8sn7NcSjl6h9HOrPk/V+yjjIEf3GqsOMo5m0=;
 b=CvqC32PNbjF9huAp7JPJoiu5+ichiRQadz4I2X08pMxSHK53ghMVq1am
 BSf6VQAPNIrh1khlzKghEdi2T/za2Md2XiUO6dTGc7Q3ZmU+YTmLV8fYd
 Ji8sLicLZloLMpeTlNEVOEOrWssY3yrcXGNTYLlH8xLnbkKObwZXCIVE5
 bbrcPvtdWKYMgwOgflDWWvcxnimSMx+vwlUPvfY6EHQgWdnzNVcL36XIU
 FL6AKWefc89v+FLv5mM00VHBF3qpvS9ZndLCeCON2BM5zdcjA7FoMA9SO
 uGHKJ7pGoulq53LPUdbe9pTfQtTE7Zl63cpMU90+hyYaZGSHXca4h5MP4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="371192062"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="371192062"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 03:58:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="739290738"
X-IronPort-AV: E=Sophos;i="5.95,230,1661842800"; d="scan'208";a="739290738"
Received: from rsimofi-mobl.ger.corp.intel.com (HELO localhost) ([10.252.30.2])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 03:58:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/hwmon: Don't use FIELD_PREP
In-Reply-To: <20221031172655.606165-1-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221031172655.606165-1-ashutosh.dixit@intel.com>
Date: Tue, 01 Nov 2022 12:58:13 +0200
Message-ID: <87cza77xh6.fsf@intel.com>
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
Cc: ndesaulniers@google.com, llvm@lists.linux.dev,
 Andi Shyti <andi.shyti@intel.com>, dri-devel@lists.freedesktop.org,
 gwan-gyeong.mun@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 31 Oct 2022, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
> FIELD_PREP and REG_FIELD_PREP have checks requiring a compile time constant
> mask. When the mask comes in as the argument of a function these checks can
> can fail depending on the compiler (gcc vs clang), optimization level,
> etc. Use a simpler version of FIELD_PREP which skips these checks. The
> checks are not needed because the mask is formed using REG_GENMASK (so is
> actually a compile time constant).
>
> v2: Split REG_FIELD_PREP into a macro with checks and one without and use
>     the one without checks in i915_hwmon.c (Gwan-gyeong Mun)

I frankly think you're solving the wrong problem here. See [1].

BR,
Jani.

[1] https://lore.kernel.org/r/87leov7yix.fsf@intel.com

>
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7354
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c    |  2 +-
>  drivers/gpu/drm/i915/i915_reg_defs.h | 17 +++++++++++------
>  2 files changed, 12 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 9e97814930254..ae435b035229a 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -112,7 +112,7 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
>  	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
>  
>  	bits_to_clear = field_msk;
> -	bits_to_set = FIELD_PREP(field_msk, nval);
> +	bits_to_set = __REG_FIELD_PREP(field_msk, nval);
>  
>  	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
>  					    bits_to_clear, bits_to_set);
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index f1859046a9c48..dddacc8d48928 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -67,12 +67,17 @@
>   *
>   * @return: @__val masked and shifted into the field defined by @__mask.
>   */
> -#define REG_FIELD_PREP(__mask, __val)						\
> -	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
> -	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
> -	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
> -	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
> -	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
> +#define __REG_FIELD_PREP_CHK(__mask, __val) \
> +	(BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) + \
> +	 BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) + \
> +	 BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
> +	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0)))
> +
> +#define __REG_FIELD_PREP(__mask, __val) \
> +	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask))))
> +
> +#define REG_FIELD_PREP(__mask, __val) \
> +	(__REG_FIELD_PREP(__mask, __val) + __REG_FIELD_PREP_CHK(__mask, __val))
>  
>  /**
>   * REG_FIELD_GET() - Extract a u32 bitfield value

-- 
Jani Nikula, Intel Open Source Graphics Center
