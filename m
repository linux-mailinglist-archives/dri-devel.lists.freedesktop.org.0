Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED6A34DFB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 19:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C4410EB77;
	Thu, 13 Feb 2025 18:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R8SYI67B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A786410EB77
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739472492; x=1771008492;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=t2j9sCGbQIRyHgbP76ZlMlLU9OQTCcx8w8sYQUuOJXo=;
 b=R8SYI67BWp1pzINSTfty6pvgiUwv0DY1P3njPTiHYvg4eUP0g1M4yN8n
 26ykSy5gygR0E7DWcvFgLeIAR41EGaNwUIDMKxjNYwSvpYPaLp6BvMWKC
 BizqG67hBeMkw23ibqHwqeARQ3juYexUBdo3ylE2pt9r7e+1TJcWHUeu6
 ATDZbiH7gYOShnT7QNoWtMm2BLNnclDrnwI18v6BUs220h5lQocGcxD14
 0p/XR85Ra7QpHRtvWOwDWx55rn4GCRvM88IgsM/MEGTpLOYYvmhDrYILT
 DY30UZ6uGJZnvrr5br7V9z5Wvv2IuS9Dfk6AwLjxgJZITRejzTFR/pye9 A==;
X-CSE-ConnectionGUID: DjmbSVOgSmC2rmVcmf4ifQ==
X-CSE-MsgGUID: 4zFNcr63S16ETRp0QM6xKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="43964350"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="43964350"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:48:12 -0800
X-CSE-ConnectionGUID: QEsi/t42T6GRXflvKDGtTw==
X-CSE-MsgGUID: 1qeSg+lTToahOc2h8flgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="112974156"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.30])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 10:48:07 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Alexandru Ardelean
 <aardelean@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 1/2] drm: Move for_each_if() to util_macros.h for
 wider use
In-Reply-To: <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
 <20250213182527.3092371-2-andriy.shevchenko@linux.intel.com>
Date: Thu, 13 Feb 2025 20:48:02 +0200
Message-ID: <87msepy93x.fsf@intel.com>
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

On Thu, 13 Feb 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Other subsystem(s) may want to reuse the for_each_if() macro.
> Move it to util_macros.h to make it globally available.
>
> Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yay!

Acked-by: Jani Nikula <jani.nikula@intel.com>

If you want to go down the memory lane, see [1]. ;)


[1] https://lore.kernel.org/r/20180709083650.23549-1-daniel.vetter@ffwll.ch

> ---
>  include/drm/drm_util.h      | 16 +---------------
>  include/linux/util_macros.h | 15 +++++++++++++++
>  2 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> index 79952d8c4bba..440199618620 100644
> --- a/include/drm/drm_util.h
> +++ b/include/drm/drm_util.h
> @@ -36,6 +36,7 @@
>  #include <linux/kgdb.h>
>  #include <linux/preempt.h>
>  #include <linux/smp.h>
> +#include <linux/util_macros.h>
>  
>  /*
>   * Use EXPORT_SYMBOL_FOR_TESTS_ONLY() for functions that shall
> @@ -47,21 +48,6 @@
>  #define EXPORT_SYMBOL_FOR_TESTS_ONLY(x)
>  #endif
>  
> -/**
> - * for_each_if - helper for handling conditionals in various for_each macros
> - * @condition: The condition to check
> - *
> - * Typical use::
> - *
> - *	#define for_each_foo_bar(x, y) \'
> - *		list_for_each_entry(x, y->list, head) \'
> - *			for_each_if(x->something == SOMETHING)
> - *
> - * The for_each_if() macro makes the use of for_each_foo_bar() less error
> - * prone.
> - */
> -#define for_each_if(condition) if (!(condition)) {} else
> -
>  /**
>   * drm_can_sleep - returns true if currently okay to sleep
>   *
> diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
> index 825487fb66fa..3b570b765b75 100644
> --- a/include/linux/util_macros.h
> +++ b/include/linux/util_macros.h
> @@ -4,6 +4,21 @@
>  
>  #include <linux/math.h>
>  
> +/**
> + * for_each_if - helper for handling conditionals in various for_each macros
> + * @condition: The condition to check
> + *
> + * Typical use::
> + *
> + *	#define for_each_foo_bar(x, y) \'
> + *		list_for_each_entry(x, y->list, head) \'
> + *			for_each_if(x->something == SOMETHING)
> + *
> + * The for_each_if() macro makes the use of for_each_foo_bar() less error
> + * prone.
> + */
> +#define for_each_if(condition) if (!(condition)) {} else
> +
>  /**
>   * find_closest - locate the closest element in a sorted array
>   * @x: The reference value.

-- 
Jani Nikula, Intel
