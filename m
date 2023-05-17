Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A445770633B
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C431010E3C7;
	Wed, 17 May 2023 08:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58E110E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684313167; x=1715849167;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Esgsm3RTHSGvonHSP9mXXt4krUC+gmpYyDOTAsvlPgc=;
 b=L445b/MsErGzOty+lGu8F++CMC6uSPRVF4vENR4wzGVnxLrQMXvcq2c6
 BKI1OKWjWNWxcsW1Wt2WyTVlJSkwlVxwOdKdQWIj16e/2Yx7tvFnf6QPn
 uU1bPE3l8GUtw9T8W869WyYYKJjPIOLahC8Ygzo28olVdIGDvXsH2lhUU
 Xbya3MWPsw/B5RFgkwzjGOtMrxAgOqLdBkPhiHLUAUxxZz7geFh9IAV5p
 voeYbAXSRS7jj/ogj5WzAdAcs7alWuJvQ9Q3khrq3uU+TSZDsqHjDnEm1
 A+DlVWgl9m3lUswinFd2AGzxpAjsQ9eC4OEnz6E8JQkLuZuZ4EEwHCW7V Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379893885"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="379893885"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 01:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="948187140"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="948187140"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.207])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 01:46:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Antonino Daplas <adaplas@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: i810: include i810_main.h in i810_dvt.c
In-Reply-To: <20230516202814.561262-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230516202814.561262-1-arnd@kernel.org>
Date: Wed, 17 May 2023 11:46:00 +0300
Message-ID: <87lehngxbr.fsf@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 May 2023, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building with W=1 shows that a header needs to be included to
> make the prototypes visible:
>
> drivers/video/fbdev/i810/i810_dvt.c:194:6: error: no previous prototype for 'round_off_xres' [-Werror=missing-prototypes]
> drivers/video/fbdev/i810/i810_dvt.c:233:6: error: no previous prototype for 'i810fb_encode_registers' [-Werror=missing-prototypes]
> drivers/video/fbdev/i810/i810_dvt.c:245:6: error: no previous prototype for 'i810fb_fill_var_timings' [-Werror=missing-prototypes]
> drivers/video/fbdev/i810/i810_dvt.c:279:5: error: no previous prototype for 'i810_get_watermark' [-Werror=missing-prototypes]
>
> Adding the header leads to another warning from a mismatched
> prototype, so fix this as well:
>
> drivers/video/fbdev/i810/i810_dvt.c:280:5: error: conflicting types for 'i810_get_watermark'; have 'u32(struct fb_var_screeninfo *,

Changes here look fine,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

but I think you should try CONFIG_FB_I810_GTF=y to get the same
mismatched prototype error for i810_get_watermark() in i810_gtf.c, and
add the const there while at it. R-b stands for that addition as well.

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/video/fbdev/i810/i810_dvt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/i810/i810_dvt.c b/drivers/video/fbdev/i810/i810_dvt.c
> index b4b3670667ab..2082b5c92e8f 100644
> --- a/drivers/video/fbdev/i810/i810_dvt.c
> +++ b/drivers/video/fbdev/i810/i810_dvt.c
> @@ -14,6 +14,7 @@
>  
>  #include "i810_regs.h"
>  #include "i810.h"
> +#include "i810_main.h"
>  
>  struct mode_registers std_modes[] = {
>  	/* 640x480 @ 60Hz */
> @@ -276,7 +277,7 @@ void i810fb_fill_var_timings(struct fb_var_screeninfo *var)
>  	var->upper_margin = total - (yres + var->lower_margin + var->vsync_len);
>  }
>  
> -u32 i810_get_watermark(struct fb_var_screeninfo *var,
> +u32 i810_get_watermark(const struct fb_var_screeninfo *var,
>  		       struct i810fb_par *par)
>  {
>  	struct mode_registers *params = &par->regs;

-- 
Jani Nikula, Intel Open Source Graphics Center
