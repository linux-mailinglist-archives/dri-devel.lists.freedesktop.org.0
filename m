Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5214D149D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E23010E26B;
	Tue,  8 Mar 2022 10:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5D910E26B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646734754; x=1678270754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xF+r8ZNHE9MnTYvem0p9ys5ZewguArXpAyRAIBUOibg=;
 b=EYBSk+2khcj3adwBv1DJ4rhQmHJRC+gq8gqXstZbsmGU+Z5I2uJp2vsn
 ULlwmeyBpsUhmLVyjjmuYIH8JTOr77+qr297ndc0CmTwSKtyNGzXrNTDn
 Fchvu1qV/C2Yr7OCQRnfmrl2CMXhQLLz0gNUF+x0t65SkHg7rGf0pbaBr
 N/r1HyRC65w4SQQ/x4792qNUTO8iLek0Y40j0O22Sgt1pXqlIWBVTuDFQ
 igoEnVMPUPoUYfCHm+4KBu/W5oo78n9YmbvlM51cqD0tUJOuIwJkJ8hIX
 7+nrCq/e9oBJbJDZi2z3Cpo+cKEGUNfYNfWN/HpAArav6ULe+keDmtBFP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="279362057"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="279362057"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:19:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="643608952"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:19:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nRWvB-00DIEg-BO; Tue, 08 Mar 2022 12:18:25 +0200
Date: Tue, 8 Mar 2022 12:18:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] staging: fbtft: Consider type of init sequence
 values in fbtft_init_display()
Message-ID: <Yictcf0BCvveVT+V@smile.fi.intel.com>
References: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304193414.88006-1-andriy.shevchenko@linux.intel.com>
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Cc: Helge

Maybe you can pick this up?

On Fri, Mar 04, 2022 at 09:34:14PM +0200, Andy Shevchenko wrote:
> In the fbtft_init_display() the init sequence is printed for
> the debug purposes. Unfortunately the current code doesn't take
> into account that values in the buffer are of the s16 type.
> 
> Consider that and replace the printing code with fbtft_par_dbg_hex()
> call.
> 
> Fixes: b888897014a9 ("staging/fbtft: Remove all strcpy() uses")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 4a35347b3020..b28a059ad3b4 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -1035,10 +1035,9 @@ int fbtft_init_display(struct fbtft_par *par)
>  			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++)
>  				;
>  
> -			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
> -				      "init: write(0x%02X) %*ph\n",
> -				      par->init_sequence[i], j,
> -				      &par->init_sequence[i + 1]);
> +			fbtft_par_dbg_hex(DEBUG_INIT_DISPLAY, par, par->info->device,
> +					  s16, &par->init_sequence[i + 1], j,
> +					  "init: write(0x%02X)", par->init_sequence[i]);
>  
>  			/* Write */
>  			j = 0;
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


