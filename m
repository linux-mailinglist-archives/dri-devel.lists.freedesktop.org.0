Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC46A178FB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 09:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A265010E0F1;
	Tue, 21 Jan 2025 08:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F1tQPv0S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2F010E0F0;
 Tue, 21 Jan 2025 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737446589; x=1768982589;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=4IlwIyOiNVaUb2wT21B1H5m3caBcaE3w6fBDrOeTH8w=;
 b=F1tQPv0SPIRDSUUxPKzj7VSqGTu5WMvyQW028ihta50ig7zYuAB0OWnv
 IEnrvHXHn1dvgwFqdk8lv8v91WnQPz2FezpQu21BLXXmM70SV6ZNpEqBe
 dmzQgdDCfNaI8teCAqcn3v9PEcKXUQ1/DpUdCaUp2bK6EfubYyXBxWcD7
 lOBcFKq29ofciMwdo2pXO63NFMiH2aeCsiYQRmTZgOoVnDr95skZfECaj
 EZeJJZMdvBVH5AYfKwZdmbJLaVNwvdyr5hoZBMwHEQNEok4T+vbKADqUo
 gWIZQ5kz5fMIV8h+nZfGwi7J9srDw9DGiQljRpuA4LDSzzpsNmWnzqzfW w==;
X-CSE-ConnectionGUID: 9z/3AhziTBaqm7WBZKpjzQ==
X-CSE-MsgGUID: pYGraMX/QVuWMGfOoy7O4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37955299"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37955299"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:03:08 -0800
X-CSE-ConnectionGUID: Y5KUXnF8Qk6bo2tYHN/krA==
X-CSE-MsgGUID: p57F4Wr1Qpq0+yr734Ra6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="106853390"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.186])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 00:03:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Guenter
 Roeck <linux@roeck-us.net>, Linus Torvalds
 <torvalds@linux-foundation.org>, David Laight
 <david.laight.linux@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] drm/i915/backlight: Return immediately when scale()
 finds invalid parameters
In-Reply-To: <20250121061746.2730572-1-linux@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250121061746.2730572-1-linux@roeck-us.net>
Date: Tue, 21 Jan 2025 10:03:00 +0200
Message-ID: <87o700ppaj.fsf@intel.com>
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

On Mon, 20 Jan 2025, Guenter Roeck <linux@roeck-us.net> wrote:
> The scale() functions detects invalid parameters, but continues
> its calculations anyway. This causes bad results if negative values
> are used for unsigned operations. Worst case, a division by 0 error
> will be seen if source_min == source_max.
>
> On top of that, after v6.13, the sequence of WARN_ON() followed by clamp()
> may result in a build error with gcc 13.x.
>
> drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
> include/linux/compiler_types.h:542:45: error:
> 	call to '__compiletime_assert_415' declared with attribute error:
> 	clamp() low limit source_min greater than high limit source_max
>
> This happens if the compiler decides to rearrange the code as follows.
>
>         if (source_min > source_max) {
>                 WARN(..);
>                 /* Do the clamp() knowing that source_min > source_max */
>                 source_val = clamp(source_val, source_min, source_max);
>         } else {
>                 /* Do the clamp knowing that source_min <= source_max */
>                 source_val = clamp(source_val, source_min, source_max);
>         }
>
> Fix the problem by evaluating the return values from WARN_ON and returning
> immediately after a warning. While at it, fix divide by zero error seen
> if source_min == source_max.

Thanks for the effort in tracking this down.

> Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Cc: David Laight <david.laight.linux@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 3f81a726cc7d..ad49bd4a1c12 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -40,8 +40,11 @@ static u32 scale(u32 source_val,
>  {
>  	u64 target_val;
>  
> -	WARN_ON(source_min > source_max);
> -	WARN_ON(target_min > target_max);
> +	if (WARN_ON(target_min > target_max))
> +		return target_min;
> +
> +	if (WARN_ON(source_min > source_max) || source_min == source_max)
> +		return target_min + (target_max - target_min) / 2;

There's really no need to be this fancy, though. Years down the line
someone's going to think that mean value calculation is something we
need to preserve, but we don't. I'd just return target_max everywhere.
And source_min == source_max could be a warn too.


BR,
Jani.


>  
>  	/* defensive */
>  	source_val = clamp(source_val, source_min, source_max);

-- 
Jani Nikula, Intel
