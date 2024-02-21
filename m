Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E8785DFCA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3130D10E76C;
	Wed, 21 Feb 2024 14:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF4410E76D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:34:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2550067"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2550067"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:34:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="913315045"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="913315045"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:34:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andy@kernel.org>) id 1rcnfk-00000006N6c-41vp;
 Wed, 21 Feb 2024 16:34:08 +0200
Date: Wed, 21 Feb 2024 16:34:08 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, robin@protonic.nl, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 01/10] backlight: Match backlight device against
 struct fb_info.bl_dev
Message-ID: <ZdYJ4FhJ9vhzUeiW@smile.fi.intel.com>
References: <20240221094324.27436-1-tzimmermann@suse.de>
 <20240221094324.27436-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221094324.27436-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Feb 21, 2024 at 10:41:28AM +0100, Thomas Zimmermann wrote:
> Framebuffer drivers for devices with dedicated backlight are supposed
> to set struct fb_info.bl_dev to the backlight's respective device. Use
> the value to match backlight and framebuffer in the backlight core code.

...

>  	if (!bd->ops)
>  		goto out;
> -	if (bd->ops->check_fb && !bd->ops->check_fb(bd, evdata->info))
> +	else if (bd->ops->check_fb && !bd->ops->check_fb(bd, info))

What's the point of adding redundant 'else'?

>  		goto out;
> +#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
> +	else if (info->bl_dev && info->bl_dev != bd)

Ditto.

> +		goto out;
> +#endif

-- 
With Best Regards,
Andy Shevchenko


