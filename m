Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ECA4B127A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 17:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B422F10E8A6;
	Thu, 10 Feb 2022 16:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97610E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644509775; x=1676045775;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5BB2cUCZK0X3Qp7u/1cTOmI/FxAeIW6gGXvd1jK9un8=;
 b=Uas45R94fBN8VfmCWJIK2KVXE6cuDMDprxTYfyYpnTJ2miwHLvbZlL7Z
 1IQ32YGKGYV7uVbqTHC+o/fUroekwWURQXAnZUF7RWiDATwyElXDHO9BL
 DznoVXWNf84locyhuLpyr6yJnBRc1RBSsvV4zdr6Vf0dfaFP6PH1JOMnh
 UyfEQxmpUyjcl0ziaeikBBuFHezGQxn8vZI4mXCeHmF7AbF2SD+nnFmjX
 u+MEffl91Fth2o5V0ZYBItGmA2VfQDJrbbOmQF4KQgblslN90SUEcPW2/
 NfZdbOVtiGl6+EiTDkdd1DSTO/iladjH6bnFXA6zaxbOtalRNPCOWZicT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="312812129"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="312812129"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 08:16:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="586005671"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 08:16:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nIC6B-0032lx-6G; Thu, 10 Feb 2022 18:15:11 +0200
Date: Thu, 10 Feb 2022 18:15:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Don't sort deferred-I/O pages by default
Message-ID: <YgU6Djy/aFrI1PGI@smile.fi.intel.com>
References: <20220210141111.5231-1-tzimmermann@suse.de>
 <20220210141111.5231-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210141111.5231-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, linux-staging@lists.linux.dev,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, bernie@plugable.com,
 noralf@tronnes.org, jayalk@intworks.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 03:11:13PM +0100, Thomas Zimmermann wrote:
> Fbdev's deferred I/O sorts all dirty pages by default, which incurs a
> significant overhead. Make the sorting step optional and update the few
> drivers that require it. Use a FIFO list by default.
> 
> Sorting pages by memory offset for deferred I/O performs an implicit
> bubble-sort step on the list of dirty pages. The algorithm goes through
> the list of dirty pages and inserts each new page according to its
> index field. Even worse, list traversal always starts at the first
> entry. As video memory is most likely updated scanline by scanline, the
> algorithm traverses through the complete list for each updated page.
> 
> For example, with 1024x768x32bpp a page covers exactly one scanline.
> Writing a single screen update from top to bottom requires updating
> 768 pages. With an average list length of 384 entries, a screen update
> creates (768 * 384 =) 294912 compare operation.
> 
> Fix this by making the sorting step opt-in and update the few drivers
> that require it. All other drivers work with unsorted page lists. Pages
> are appended to the list. Therefore, in the common case of writing the
> framebuffer top to bottom, pages are still sorted by offset, which may
> have a positive effect on performance.
> 
> Playing a video [1] in mplayer's benchmark mode shows the difference
> (i7-4790, FullHD, simpledrm, kernel with debugging).
> 
>   mplayer -benchmark -nosound -vo fbdev ./big_buck_bunny_720p_stereo.ogg
> 
> With sorted page lists:
> 
>   BENCHMARKs: VC:  32.960s VO:  73.068s A:   0.000s Sys:   2.413s =  108.441s
>   BENCHMARK%: VC: 30.3947% VO: 67.3802% A:  0.0000% Sys:  2.2251% = 100.0000%
> 
> With unsorted page lists:
> 
>   BENCHMARKs: VC:  31.005s VO:  42.889s A:   0.000s Sys:   2.256s =   76.150s
>   BENCHMARK%: VC: 40.7156% VO: 56.3219% A:  0.0000% Sys:  2.9625% = 100.0000%
> 
> VC shows the overhead of video decoding, VO shows the overhead of the
> video output. Using unsorted page lists reduces the benchmark's run time
> by ~32s/~25%.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
from fbtft perspective, thanks!

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_stereo.ogg # [1]
> ---
>  drivers/staging/fbtft/fbtft-core.c  |  1 +
>  drivers/video/fbdev/broadsheetfb.c  |  1 +
>  drivers/video/fbdev/core/fb_defio.c | 19 ++++++++++++-------
>  drivers/video/fbdev/metronomefb.c   |  1 +
>  drivers/video/fbdev/udlfb.c         |  1 +
>  include/linux/fb.h                  |  1 +
>  6 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index f2684d2d6851..4a35347b3020 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -654,6 +654,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  	fbops->fb_blank     =      fbtft_fb_blank;
>  
>  	fbdefio->delay =           HZ / fps;
> +	fbdefio->sort_pagelist =   true;
>  	fbdefio->deferred_io =     fbtft_deferred_io;
>  	fb_deferred_io_init(info);
>  
> diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
> index fd66f4d4a621..b9054f658838 100644
> --- a/drivers/video/fbdev/broadsheetfb.c
> +++ b/drivers/video/fbdev/broadsheetfb.c
> @@ -1059,6 +1059,7 @@ static const struct fb_ops broadsheetfb_ops = {
>  
>  static struct fb_deferred_io broadsheetfb_defio = {
>  	.delay		= HZ/4,
> +	.sort_pagelist	= true,
>  	.deferred_io	= broadsheetfb_dpy_deferred_io,
>  };
>  
> diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
> index 3727b1ca87b1..1f672cf253b2 100644
> --- a/drivers/video/fbdev/core/fb_defio.c
> +++ b/drivers/video/fbdev/core/fb_defio.c
> @@ -132,15 +132,20 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
>  	if (!list_empty(&page->lru))
>  		goto page_already_added;
>  
> -	/* we loop through the pagelist before adding in order
> -	to keep the pagelist sorted */
> -	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> -		if (cur->index > page->index)
> -			break;
> +	if (fbdefio->sort_pagelist) {
> +		/*
> +		 * We loop through the pagelist before adding in order
> +		 * to keep the pagelist sorted.
> +		 */
> +		list_for_each_entry(cur, &fbdefio->pagelist, lru) {
> +			if (cur->index > page->index)
> +				break;
> +		}
> +		list_add_tail(&page->lru, &cur->lru);
> +	} else {
> +		list_add_tail(&page->lru, &fbdefio->pagelist);
>  	}
>  
> -	list_add_tail(&page->lru, &cur->lru);
> -
>  page_already_added:
>  	mutex_unlock(&fbdefio->lock);
>  
> diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
> index 952826557a0c..af858dd23ea6 100644
> --- a/drivers/video/fbdev/metronomefb.c
> +++ b/drivers/video/fbdev/metronomefb.c
> @@ -568,6 +568,7 @@ static const struct fb_ops metronomefb_ops = {
>  
>  static struct fb_deferred_io metronomefb_defio = {
>  	.delay		= HZ,
> +	.sort_pagelist	= true,
>  	.deferred_io	= metronomefb_dpy_deferred_io,
>  };
>  
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index b9cdd02c1000..184bb8433b78 100644
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -980,6 +980,7 @@ static int dlfb_ops_open(struct fb_info *info, int user)
>  
>  		if (fbdefio) {
>  			fbdefio->delay = DL_DEFIO_WRITE_DELAY;
> +			fbdefio->sort_pagelist = true;
>  			fbdefio->deferred_io = dlfb_dpy_deferred_io;
>  		}
>  
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 3d7306c9a706..9a77ab615c36 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -204,6 +204,7 @@ struct fb_pixmap {
>  struct fb_deferred_io {
>  	/* delay between mkwrite and deferred handler */
>  	unsigned long delay;
> +	bool sort_pagelist; /* sort pagelist by offset */
>  	struct mutex lock; /* mutex that protects the page list */
>  	struct list_head pagelist; /* list of touched pages */
>  	/* callback */
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


