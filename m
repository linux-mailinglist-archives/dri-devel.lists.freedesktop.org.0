Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB29D16C7F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 07:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9097E10E2B7;
	Tue, 13 Jan 2026 06:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JJryPwid";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60E810E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 06:16:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3485940B71;
 Tue, 13 Jan 2026 06:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8003C116C6;
 Tue, 13 Jan 2026 06:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768284991;
 bh=jRMVjozmrdQCTTvXiuILz4cV5NAVBhq0PGBRvJNSeL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJryPwideb+8+v6o1na3r6++k2j7iNMn68b+ljXvz+nqeUGAEfl98r8nx+9tEtC3k
 mW/k6JjjShSfoQTnKwrON9pG+a2d8U2Wr7hs8d3moBx6hoXshPLSdLOjakXPqxKuPT
 uJC8JpQhKhvdfBDU+0ExZxKhxhOnTFBrDnuYl29o=
Date: Tue, 13 Jan 2026 07:16:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
Message-ID: <2026011341-chomp-protegee-6be5@gregkh>
References: <20260113045909.336931-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113045909.336931-1-chintanlike@gmail.com>
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

On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
> Replace direct accesses to info->dev with fb_dbg() and fb_info()
> helpers to avoid build failures when CONFIG_FB_DEVICE=n.

Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
should be used instead.

> Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

Is this really a bug?

> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> 
> Changes in v6:
> - Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
> - Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
>   handle the debug/info context.
> - Drop __func__ usage per review feedback(suggested by greg k-h)
> - Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
>   (suggested by Andy Shevchenko)
> 
> Changes in v5:
> - Initial attempt to replace info->dev accesses using
>   dev_of_fbinfo() helper
> ---

The changelog stuff goes below the --- line.

>  drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..1b3b62950205 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>  	unsigned int val;
>  	int ret = 1;
>  
> -	dev_dbg(info->dev,
> -		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
> -		__func__, regno, red, green, blue, transp);
> +	fb_dbg(info,
> +	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
> +	       regno, red, green, blue, transp);

I dont understand what is wrong with the existing dev_dbg() line (with
the exception that __func__ should not be in it.

>  
>  	switch (info->fix.visual) {
>  	case FB_VISUAL_TRUECOLOR:
> @@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
>  	struct fbtft_par *par = info->par;
>  	int ret = -EINVAL;
>  
> -	dev_dbg(info->dev, "%s(blank=%d)\n",
> -		__func__, blank);
> +	fb_dbg(info, "blank=%d\n", blank);

Same here, what's wrong with dev_dbg()?


>  
>  	if (!par->fbtftops.blank)
>  		return ret;
> @@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>  	if (spi)
>  		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>  			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
> -	dev_info(fb_info->dev,
> -		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> -		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> -		 fb_info->fix.smem_len >> 10, text1,
> -		 HZ / fb_info->fbdefio->delay, text2);
> +	fb_info(fb_info,
> +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> +		fb_info->fix.smem_len >> 10, text1,
> +		HZ / fb_info->fbdefio->delay, text2);

When drivers work properly, they are quiet.  Why is this needed at all
except as a debug message?

thanks,

greg k-h
