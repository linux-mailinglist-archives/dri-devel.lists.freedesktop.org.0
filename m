Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4CC86CBE2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 15:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860C810E38C;
	Thu, 29 Feb 2024 14:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx4DrTWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4B210E34F;
 Thu, 29 Feb 2024 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709217974; x=1740753974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3oJedtpUCDtslx7gH0XWE1db//lVWLZiW0moWQs5pns=;
 b=Nx4DrTWhVC49Th+tSpQVjHaVueYcYd/zpj2fiTuktm4IzKhEjVXuQAif
 VhSlWhQEbV7ZnfhOFwY3Hz4Q/E93ryVOI7Dj+STxAbSN0Nw7gUK09bPNZ
 2ldyst25rw59deXTuLJcDa+f5fqMcZB5m9eAu+gR6aQpmNPJERx0BTCpc
 RhaKi6gNqk+uyB00FJl7ozysAf/L3aON3qW6KnsNWQktzrta/Y7CWSgEf
 W6mAGZ27g5BMF/5lPEiLnshykFCixpd7lT9uet2bkDM7rI7DjGTzLZkwS
 55pqB0JhgZEcJXXrPP6AgnjVdnuyNgrQK0JNI6nXv20suYU5C36tHnTvZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14398436"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14398436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 06:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8080548"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 06:46:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Save a few bytes of memory in
 intel_backlight_device_register()
In-Reply-To: <ecfdb3af5005e05131e2fb93fd870830f39a8c29.1708708142.git.christophe.jaillet@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ecfdb3af5005e05131e2fb93fd870830f39a8c29.1708708142.git.christophe.jaillet@wanadoo.fr>
Date: Thu, 29 Feb 2024 16:46:07 +0200
Message-ID: <8734tb8h1s.fsf@intel.com>
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

On Fri, 23 Feb 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 'name' may still be "intel_backlight" when backlight_device_register() is
> called.
> In such a case, using kstrdup_const() saves a memory duplication when
> dev_set_name() is called in backlight_device_register().
>
> Use kfree_const() accordingly.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, pushed to drm-intel-next.

BR,
Jani.

> ---
> Compile tested only
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 1946d7fb3c2e..9e4a9d4f1585 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -949,7 +949,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  	else
>  		props.power = FB_BLANK_POWERDOWN;
>  
> -	name = kstrdup("intel_backlight", GFP_KERNEL);
> +	name = kstrdup_const("intel_backlight", GFP_KERNEL);
>  	if (!name)
>  		return -ENOMEM;
>  
> @@ -963,7 +963,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  		 * compatibility. Use unique names for subsequent backlight devices as a
>  		 * fallback when the default name already exists.
>  		 */
> -		kfree(name);
> +		kfree_const(name);
>  		name = kasprintf(GFP_KERNEL, "card%d-%s-backlight",
>  				 i915->drm.primary->index, connector->base.name);
>  		if (!name)
> @@ -987,7 +987,7 @@ int intel_backlight_device_register(struct intel_connector *connector)
>  		    connector->base.base.id, connector->base.name, name);
>  
>  out:
> -	kfree(name);
> +	kfree_const(name);
>  
>  	return ret;
>  }

-- 
Jani Nikula, Intel
