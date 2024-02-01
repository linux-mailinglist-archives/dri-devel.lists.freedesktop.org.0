Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F078454BF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 11:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5725A10E4E8;
	Thu,  1 Feb 2024 10:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9BD10E484
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706781841; x=1738317841;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/6GAHSLsbRsu7ttcJNlM/3SSJlg6wlpPIJ8gRwHmcNQ=;
 b=EDgXVr7QFKi2eVZu8xtNUNSMwxctxtyddCppE9YJkCb0ZVdbkAueYZn6
 K/WDAmE6lwdfBKY4x1HaS0WZ1gJZt+KmSPM0KWiBx0f32m2lJ467hQqUD
 vjlJIKVpFe6aEYBaJD2Tiz34aoAs7+n4q+o6vuOddia7cbA9OpqkPvQs/
 O6JSddoODXtU1DXc4IhErUbZA5+4isekfYZB5Z/qqhFw/Yazn8jyjhGJn
 nxiJNQX/RFPHt3xYBAEQjLzxyfuHQgNGMrhuoNuamCt2PI3RlRw8VpQMx
 ajpFzNg6kCzuRCAbqVSDnVDMEX9jC3ME7HtYZEJRm6ZeP0qePidWj7Y0S A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11229731"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="11229731"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:04:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="908194780"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="908194780"
Received: from aragners-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.43.111])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:03:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Cong Liu <liucong2@kylinos.cn>, Daniel Vetter <daniel@ffwll.ch>, Helge
 Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev/core: Replace deprecated simple_strtol with kstrtol
In-Reply-To: <20240201070216.3291999-1-liucong2@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240201070216.3291999-1-liucong2@kylinos.cn>
Date: Thu, 01 Feb 2024 12:03:53 +0200
Message-ID: <87cytgh56e.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Cong Liu <liucong2@kylinos.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Feb 2024, Cong Liu <liucong2@kylinos.cn> wrote:
> This patch replaces the use of the deprecated simple_strtol [1] function
> in the modedb.c file with the recommended kstrtol function. This change
> improves error handling and boundary checks.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull
>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>

This is completely wrong, and obviously not tested at all.

The recommended replacements are *not* drop-in replacements. Look into
the documentation of the functions.

BR,
Jani.


> ---
>  drivers/video/fbdev/core/modedb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
> index 7196b055f2bd..eebbbc7e2aa3 100644
> --- a/drivers/video/fbdev/core/modedb.c
> +++ b/drivers/video/fbdev/core/modedb.c
> @@ -661,7 +661,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
>  				namelen = i;
>  				if (!refresh_specified && !bpp_specified &&
>  				    !yres_specified) {
> -					refresh = simple_strtol(&name[i+1], NULL,
> +					refresh = kstrtol(&name[i+1], NULL,
>  								10);
>  					refresh_specified = 1;
>  					if (cvt || rb)
> @@ -672,7 +672,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
>  			case '-':
>  				namelen = i;
>  				if (!bpp_specified && !yres_specified) {
> -					bpp = simple_strtol(&name[i+1], NULL,
> +					bpp = kstrtol(&name[i+1], NULL,
>  							    10);
>  					bpp_specified = 1;
>  					if (cvt || rb)
> @@ -682,7 +682,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
>  				break;
>  			case 'x':
>  				if (!yres_specified) {
> -					yres = simple_strtol(&name[i+1], NULL,
> +					yres = kstrtol(&name[i+1], NULL,
>  							     10);
>  					yres_specified = 1;
>  				} else
> @@ -719,7 +719,7 @@ int fb_find_mode(struct fb_var_screeninfo *var,
>  			}
>  		}
>  		if (i < 0 && yres_specified) {
> -			xres = simple_strtol(name, NULL, 10);
> +			xres = kstrtol(name, NULL, 10);
>  			res_specified = 1;
>  		}
>  done:

-- 
Jani Nikula, Intel
