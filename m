Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF5A67FD2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 23:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3908825E;
	Tue, 18 Mar 2025 22:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ijDZHJQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B485210E4D4;
 Tue, 18 Mar 2025 22:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742337170; x=1773873170;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Zz2IldKLM9Obe+OrFKf035q1HtZbGiurWxoXFchIsvM=;
 b=ijDZHJQMhUsfLTg5NKOrqsbsB0HcScsfnFNdfBzSpQDJlLoGE6uh2K7v
 N4GXFrNN0fSs5Hd8ElXO07kAmhUQKoz1zOLWAr+cAOlz6Qc/79kGpZuG5
 ++ZPRCKrhkCG352k7PkSepMF5ybdI7enBCIjS7QX+ZwwhuGzPF0oIq/vg
 0zYFS6u1U5mBacKMzvDrM8npCxAVoBroD2/SUGzu+fxixwL0svYaHj4Qr
 dDI0MZnrOhhQglKKtqg9AWf/q29lpHa3DviIVa1PFm9jXQDQqoCRAUyn7
 CM3UwOkf0mHg4wfhN0Ri7vuBdfjf8nQ/AmIkTNMCBIrTEtOhVkxEZ2I+B w==;
X-CSE-ConnectionGUID: hdhzzDKhQ2mic6Caeo3y4g==
X-CSE-MsgGUID: 2UAWkcTRQEyRjhcq34H1hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="53718131"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="53718131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 15:32:50 -0700
X-CSE-ConnectionGUID: 3VarUKRaQL2DxkW/3ySj3Q==
X-CSE-MsgGUID: ugltZV4CQ/GrJMXqsIfxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="123324307"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 15:32:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>, mailhol.vincent@wanadoo.fr
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Andi
 Shyti <andi.shyti@linux.intel.com>, David Laight
 <David.Laight@aculab.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 4/7] drm/i915: Convert REG_GENMASK*() to fixed-width
 GENMASK_U*()
In-Reply-To: <Z9mqUZX4H-CzqbW4@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-4-f59315e73c29@wanadoo.fr>
 <Z9mqUZX4H-CzqbW4@thinkpad>
Date: Wed, 19 Mar 2025 00:32:40 +0200
Message-ID: <87ldt2c6lz.fsf@intel.com>
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

On Tue, 18 Mar 2025, Yury Norov <yury.norov@gmail.com> wrote:
> On Sat, Mar 08, 2025 at 01:48:51AM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Lucas De Marchi <lucas.demarchi@intel.com>
>> 
>> Now that include/linux/bits.h implements fixed-width GENMASK_U*(), use
>> them to implement the i915/xe specific macros. Converting each driver
>> to use the generic macros are left for later, when/if other
>> driver-specific macros are also generalized.
>> 
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>> ---
>> Changelog:
>> 
>>   v5 -> v6:
>> 
>>     - No changes.
>> 
>>   v4 -> v5:
>> 
>>     - Add braket to macro names in patch description,
>>       e.g. 'REG_GENMASK*' -> 'REG_GENMASK*()'
>> 
>>   v3 -> v4:
>> 
>>     - Remove the prefixes in macro parameters,
>>       e.g. 'REG_GENMASK(__high, __low)' -> 'REG_GENMASK(high, low)'
>> ---
>>  drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
>>  1 file changed, 11 insertions(+), 97 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index e251bcc0c89f5710125bc70f07851b2cb978c89c..39e5ed9511174b8757b9201bff735fa362651b34 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -9,76 +9,19 @@
>>  #include <linux/bitfield.h>
>>  #include <linux/bits.h>
>>  
>> -/**
>> - * REG_BIT() - Prepare a u32 bit value
>> - * @__n: 0-based bit number
>> - *
>> - * Local wrapper for BIT() to force u32, with compile time checks.
>> - *
>> - * @return: Value with bit @__n set.
>> +/*
>> + * Wrappers over the generic BIT_* and GENMASK_* implementations,
>> + * for compatibility reasons with previous implementation
>>   */
>> -#define REG_BIT(__n)							\
>> -	((u32)(BIT(__n) +						\
>> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
>> -				 ((__n) < 0 || (__n) > 31))))
>> +#define REG_GENMASK(high, low)		GENMASK_U32(high, low)
>> +#define REG_GENMASK64(high, low)	GENMASK_U64(high, low)
>> +#define REG_GENMASK16(high, low)	GENMASK_U16(high, low)
>> +#define REG_GENMASK8(high, low)		GENMASK_U8(high, low)
>
> Nit. Maybe just
>
>  #define REG_GENMASK		GENMASK_U32

Please just keep it as it is for clarity.

BR,
Jani.


-- 
Jani Nikula, Intel
