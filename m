Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C8D10BE4
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 07:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C37110E2D0;
	Mon, 12 Jan 2026 06:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E0MqTb92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA1B10E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:48:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2B6B260179;
 Mon, 12 Jan 2026 06:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCF8C116D0;
 Mon, 12 Jan 2026 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768200531;
 bh=RNib0EuBZYi++8R6o4o9D8KU0E/Nyxj2LsjkwYkLG/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0MqTb92g+7ItbPjo8WUsy/d5DokbcsDwExsAxuAx7clQFAXIhhP4H/aWxwrJSiTD
 uKimlBGWgUW26vAQXvlx+mUQn4llAFRIXsRkx9Cnt0yZzvJJW9drL6eLW5Q37RRH6e
 RMRsWSeB4V6+K45t7URmmgCxriHCasW0ZXJMhUYo=
Date: Mon, 12 Jan 2026 07:48:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 andy@kernel.org, deller@gmx.de, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <2026011233-little-gratified-1079@gregkh>
References: <20260112010740.186248-1-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112010740.186248-1-chintanlike@gmail.com>
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

On Sun, Jan 11, 2026 at 05:07:39PM -0800, Chintan Patel wrote:
> This fixes commit
> a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> 
> from my previous v4 series:
> https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.528624-1-chintanlike@gmail.com/
> 
> All direct accesses to info->dev or fb_info->dev are replaced with
> dev_of_fbinfo() helper, improving readability and ensuring 
> compilation succeeds when CONFIG_FB_DEVICE=n.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8a5ccc8ae0a1..309e81d7d208 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>  {
>  	unsigned int val;
>  	int ret = 1;
> +	struct device *dev = dev_of_fbinfo(info);
>  
> -	dev_dbg(info->dev,
> +	dev_dbg(dev,
>  		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
>  		__func__, regno, red, green, blue, transp);
>  
> @@ -389,9 +390,10 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
>  static int fbtft_fb_blank(int blank, struct fb_info *info)
>  {
>  	struct fbtft_par *par = info->par;
> +	struct device *dev = dev_of_fbinfo(info);
>  	int ret = -EINVAL;
>  
> -	dev_dbg(info->dev, "%s(blank=%d)\n",
> +	dev_dbg(dev, "%s(blank=%d)\n",
>  		__func__, blank);
>  
>  	if (!par->fbtftops.blank)
> @@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>  	char text2[50] = "";
>  	struct fbtft_par *par = fb_info->par;
>  	struct spi_device *spi = par->spi;
> +	struct device *dev = dev_of_fbinfo(fb_info);
>  
>  	/* sanity checks */
>  	if (!par->fbtftops.init_display) {
> @@ -793,7 +796,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
>  	if (spi)
>  		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
>  			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
> -	dev_info(fb_info->dev,
> +	dev_info(dev,
>  		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
>  		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
>  		 fb_info->fix.smem_len >> 10, text1,
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
