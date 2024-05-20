Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E58C99F1
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 10:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A9610E0C1;
	Mon, 20 May 2024 08:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5f+0oqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3986510E0C1;
 Mon, 20 May 2024 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716194946; x=1747730946;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VeCkoFL8Vx/YZSEbvNVZZlATFTbysr5tLY6dJRKYuaY=;
 b=a5f+0oqGjJSCjgIm/EWjPYIk/irWnnl1BMRwCyYZP/Q7GA6yH9v0OSe6
 6eFPZmxgUTvoc2GMVLuw2mfauQaMwCXq9Hw/0yu8+M9J4KuoxI8jYqIeY
 mp+PACzF2t5FPBnG0abpnqXUXHZv/6P9CNaArSkbTCGUo/IUnzsixo+OU
 mGfK5MePbKevHZicgclEQsIyBaXcZ+3eYVKPz/KU87NL7PgF9XMp1moXe
 cINsWbzOmXeUAAuTRu5EMIHFfwYGMETm4WyEJMbNfil8EmdNVSVsANC/E
 Kmlkd/lnVxCIkTcKoO57ft6f+FGtM5ocWMNPHqlUVR13TqebHWOBnfoRO w==;
X-CSE-ConnectionGUID: g+2Xxy0lShGrZBDlNMXJyA==
X-CSE-MsgGUID: NFln2QEWTuS72Y26+Tma+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12108628"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="12108628"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 01:49:05 -0700
X-CSE-ConnectionGUID: RxIT3kDjSTW+7xbBdT/xyw==
X-CSE-MsgGUID: zj6sEMBLQd6EffDNd+eV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; d="scan'208";a="63688284"
Received: from unknown (HELO localhost) ([10.245.246.99])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 01:49:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/3] drm/print: Add generic drm dev printk function
In-Reply-To: <20240517163406.2348-2-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240517163406.2348-1-michal.wajdeczko@intel.com>
 <20240517163406.2348-2-michal.wajdeczko@intel.com>
Date: Mon, 20 May 2024 11:48:59 +0300
Message-ID: <87ed9wvpfo.fsf@intel.com>
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
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
> v2: make it static, keep it simple and use braces (Jani)
> ---
>  drivers/gpu/drm/drm_print.c | 52 +++++++++++++++++++++----------------
>  1 file changed, 30 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf2efb44722c..41892491a12c 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -176,6 +176,32 @@ void __drm_printfn_seq_file(struct drm_printer *p, struct va_format *vaf)
>  }
>  EXPORT_SYMBOL(__drm_printfn_seq_file);
>  
> +static void __drm_dev_vprintk(const struct device *dev, const char *level,
> +			      const void *origin, const char *prefix,
> +			      struct va_format *vaf)
> +{
> +	const char *prefix_pad = prefix ? " " : "";
> +
> +	if (!prefix)
> +		prefix = "";
> +
> +	if (dev) {
> +		if (origin)
> +			dev_printk(level, dev, "[" DRM_NAME ":%ps]%s%s %pV",
> +				   origin, prefix_pad, prefix, vaf);
> +		else
> +			dev_printk(level, dev, "[" DRM_NAME "]%s%s %pV",
> +				   prefix_pad, prefix, vaf);
> +	} else {
> +		if (origin)
> +			printk("%s" "[" DRM_NAME ":%ps]%s%s %pV",
> +			       level, origin, prefix_pad, prefix, vaf);
> +		else
> +			printk("%s" "[" DRM_NAME "]%s%s %pV",
> +			       level, prefix_pad, prefix, vaf);
> +	}
> +}
> +
>  void __drm_printfn_info(struct drm_printer *p, struct va_format *vaf)
>  {
>  	dev_info(p->arg, "[" DRM_NAME "] %pV", vaf);
> @@ -187,19 +213,12 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
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
> @@ -287,12 +306,7 @@ void drm_dev_printk(const struct device *dev, const char *level,
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
> @@ -312,12 +326,7 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
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
> @@ -351,8 +360,7 @@ void __drm_err(const char *format, ...)
>  	vaf.fmt = format;
>  	vaf.va = &args;
>  
> -	printk(KERN_ERR "[" DRM_NAME ":%ps] *ERROR* %pV",
> -	       __builtin_return_address(0), &vaf);
> +	__drm_dev_vprintk(NULL, KERN_ERR, __builtin_return_address(0), "*ERROR*", &vaf);
>  
>  	va_end(args);
>  }

-- 
Jani Nikula, Intel
