Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7167D87001A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449EC10FFF9;
	Mon,  4 Mar 2024 11:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5wNRuRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C00010FFF9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709551002; x=1741087002;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=AQrOOWHGmfRbYvwpO+pjPTsk5el/uOh59X3PKshhoZI=;
 b=c5wNRuRw2Br9zWrDIxm2EDYf5alEfVQXN4uMCBb+N47mT17B62eW5jaY
 Kn34mmAEM6G1YJwjOtSnRaunW4aGoUstDBxgyQRPYxH6nsMDD3bJr5kh+
 CtT8Qh9AMbKen2yLgXgI6S4rpHzyr+sKUiYsIgTblHLtsKg88PMlT0TUA
 iak/UGrAdchKj9RPHz+x2ehvdfs7WhiOf+/PJhX99aJjxlrUqZy3jRZVc
 m5hMZwoA0bpPt04cM3qE9KSw0qXSmF+c21UCCKG6jwZqbx+pApjypz6bE
 2v1RLQPr94DfyLEK3NK+0NrIxbrmecoCeNi0Q+CfZHmgDMQhIx6ApGqIU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14680367"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14680367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9541582"
Received: from syakovle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.3])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 03:16:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 naresh.kamboju@linaro.org, deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] fbdev/chipsfb: Include <linux/backlight.h>
In-Reply-To: <20240304103820.16708-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240304103820.16708-1-tzimmermann@suse.de>
Date: Mon, 04 Mar 2024 13:16:26 +0200
Message-ID: <878r2y5jsl.fsf@intel.com>
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

On Mon, 04 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Fix builds with CONFIG_PMAC_BACKLIGHT=y. The include statement for
> the backlight header has recently been removed from <linux/fb.h>.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/dri-devel/CA+G9fYsAk5TbqqxFC2W4oHLGA0CbTHMxbeq8QayFXTU75YiueA@mail.gmail.com/
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11b4eedfc87d ("fbdev: Do not include <linux/backlight.h> in header")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

I would've added the include in arch/powerpc/include/asm/backlight.h
[1], but either way is fine by me.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


[1] https://lore.kernel.org/r/20240304095512.742348-1-jani.nikula@intel.com

> ---
>  drivers/video/fbdev/chipsfb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/chipsfb.c b/drivers/video/fbdev/chipsfb.c
> index b80711f13df8a..b16a905588fed 100644
> --- a/drivers/video/fbdev/chipsfb.c
> +++ b/drivers/video/fbdev/chipsfb.c
> @@ -15,6 +15,7 @@
>   */
>  
>  #include <linux/aperture.h>
> +#include <linux/backlight.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/errno.h>

-- 
Jani Nikula, Intel
