Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD48C873F
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 15:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC3610EEB0;
	Fri, 17 May 2024 13:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2c9JW8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0651F10E2AA;
 Fri, 17 May 2024 13:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715952812; x=1747488812;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=I07ffOVuEjRadzTn8ypx5vGfikcBwiyrSgsROlIBVf0=;
 b=n2c9JW8tBp4C6GOJq5NkavTR1FtbEgZpN12mFgRkB0YUrXf0XAnrQ/lc
 deWRlqTHM8XdrXH07qCB/42kPIOIHseXEdR/PTN4ixKt9lkXrQd+V0rON
 TwU07rbme26JZPDt4LIM0Uh6+fGSXTrVMB4X+8pLxv9ZKJxfyYz8YSrwA
 yHCNe046qxC8fusn/Pem1PlN2Xq9P+cjayU3DAoDFa86eTmSyGeBiUHGv
 X+HksUfGfUJEchCYBOkMcGULbS+B90wRJSmVNd8iqG+iTBTa6qmNdDs2C
 pZvJ6K/OT36E5G8WYyiz6bm3OgafDpf4ZFk/vttf5+gyCN/oqEiM+urdn A==;
X-CSE-ConnectionGUID: Yna8s0T5RrGjKdaU4CeKZg==
X-CSE-MsgGUID: /INWda2pSB+irx2RRgUfqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12237883"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="12237883"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 06:33:31 -0700
X-CSE-ConnectionGUID: pHt3urpkTUC0U7XNoNpZBQ==
X-CSE-MsgGUID: MzmMOIiLSKyWHW+DkwsW/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="31934610"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 06:33:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 1/3] drm/print: Add generic drm dev printk function
In-Reply-To: <20240517125730.2304-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240517125730.2304-1-michal.wajdeczko@intel.com>
 <20240517125730.2304-2-michal.wajdeczko@intel.com>
Date: Fri, 17 May 2024 16:33:24 +0300
Message-ID: <87seyga7h7.fsf@intel.com>
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

On Fri, 17 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> We already have some drm printk functions that need to duplicate
> a code to get a similar format of the final result, for example:
>
>   [ ] 0000:00:00.0: [drm:foo] bar
>   [ ] 0000:00:00.0: [drm] foo bar
>   [ ] 0000:00:00.0: [drm] *ERROR* foo
>
> Add a generic __drm_dev_vprintk() function that can format the
> final message like all other existing function do and allows us
> to keep the formatting code in one place.

Nice idea!

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_print.c | 49 ++++++++++++++++++++-----------------
>  include/drm/drm_print.h     |  3 +++
>  2 files changed, 30 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf2efb44722c..a2b60c8245a1 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -187,19 +187,12 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
>  	const struct drm_device *drm = p->arg;
>  	const struct device *dev = drm ? drm->dev : NULL;
>  	enum drm_debug_category category = p->category;
> -	const char *prefix = p->prefix ?: "";
> -	const char *prefix_pad = p->prefix ? " " : "";
>  
>  	if (!__drm_debug_enabled(category))
>  		return;
>  
>  	/* Note: __builtin_return_address(0) is useless here. */
> -	if (dev)
> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME "]%s%s %pV",
> -			   prefix_pad, prefix, vaf);
> -	else
> -		printk(KERN_DEBUG "[" DRM_NAME "]%s%s %pV",
> -		       prefix_pad, prefix, vaf);
> +	__drm_dev_vprintk(dev, KERN_DEBUG, NULL, p->prefix, vaf);
>  }
>  EXPORT_SYMBOL(__drm_printfn_dbg);
>  
> @@ -277,6 +270,29 @@ void drm_print_bits(struct drm_printer *p, unsigned long value,
>  }
>  EXPORT_SYMBOL(drm_print_bits);
>  
> +void __drm_dev_vprintk(const struct device *dev, const char *level,
> +		       const void *origin, const char *prefix,
> +		       struct va_format *vaf)
> +{
> +	const char *prefix_pad = prefix ? " " : (prefix = "");

Too clever, please just keep it simple:

	const char *prefix_pad = prefix ? " " : "";

	if (!prefix)
		prefix = "";

> +
> +	if (dev)
> +		if (origin)
> +			dev_printk(level, dev, "[" DRM_NAME ":%ps]%s%s %pV",
> +				   origin, prefix_pad, prefix, vaf);
> +		else
> +			dev_printk(level, dev, "[" DRM_NAME "]%s%s %pV",
> +				   prefix_pad, prefix, vaf);
> +	else
> +		if (origin)
> +			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",
> +			       level, origin, prefix_pad, prefix, vaf);
> +		else
> +			printk("%s" "[" DRM_NAME "]%s%s %pV",
> +			       level, prefix_pad, prefix, vaf);

I'd sprinkle a few curly braces around the top level if-else blocks.

Side note, feels like using DRM_NAME makes things harder, not
easier. But that's for another patch.

> +}
> +EXPORT_SYMBOL(__drm_dev_vprintk);

AFAICT this could be a non-exported static function. And probably moved
earlier in the file to not require a declaration.

BR,
Jani.

> +
>  void drm_dev_printk(const struct device *dev, const char *level,
>  		    const char *format, ...)
>  {
> @@ -287,12 +303,7 @@ void drm_dev_printk(const struct device *dev, const char *level,
>  	vaf.fmt = format;
>  	vaf.va = &args;
>  
> -	if (dev)
> -		dev_printk(level, dev, "[" DRM_NAME ":%ps] %pV",
> -			   __builtin_return_address(0), &vaf);
> -	else
> -		printk("%s" "[" DRM_NAME ":%ps] %pV",
> -		       level, __builtin_return_address(0), &vaf);
> +	__drm_dev_vprintk(dev, level, __builtin_return_address(0), NULL, &vaf);
>  
>  	va_end(args);
>  }
> @@ -312,12 +323,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  	vaf.fmt = format;
>  	vaf.va = &args;
>  
> -	if (dev)
> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> -			   __builtin_return_address(0), &vaf);
> -	else
> -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -		       __builtin_return_address(0), &vaf);
> +	__drm_dev_vprintk(dev, KERN_DEBUG, __builtin_return_address(0), NULL, &vaf);
>  
>  	va_end(args);
>  }
> @@ -351,8 +357,7 @@ void __drm_err(const char *format, ...)
>  	vaf.fmt = format;
>  	vaf.va = &args;
>  
> -	printk(KERN_ERR "[" DRM_NAME ":%ps] *ERROR* %pV",
> -	       __builtin_return_address(0), &vaf);
> +	__drm_dev_vprintk(NULL, KERN_ERR, __builtin_return_address(0), "*ERROR*", &vaf);
>  
>  	va_end(args);
>  }
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 089950ad8681..bb1801c58544 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -366,6 +366,9 @@ static inline struct drm_printer drm_err_printer(struct drm_device *drm,
>  __printf(3, 4)
>  void drm_dev_printk(const struct device *dev, const char *level,
>  		    const char *format, ...);
> +void __drm_dev_vprintk(const struct device *dev, const char *level,
> +		       const void *origin, const char *prefix,
> +		       struct va_format *vaf);
>  struct _ddebug;
>  __printf(4, 5)
>  void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,

-- 
Jani Nikula, Intel
