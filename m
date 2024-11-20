Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC689D3A7F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42310E726;
	Wed, 20 Nov 2024 12:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pKQAb2m8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF10A10E726
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:15:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1514DA43003;
 Wed, 20 Nov 2024 12:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF7CC4CED1;
 Wed, 20 Nov 2024 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1732104954;
 bh=kVXKB5aLoD57P+eLktbLKXC4YFrRi7R7r32NgHrZYqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pKQAb2m87FdNFePvB39KeNKxRgG2lwz0yqq0rI0dHnDbBeE6d+s/mLOu8b5t3PLrc
 6ExsD7qPRLBElbtoLZ8skKROX/nx/FWiqDQiPpojJ1kUMjXLzutmxHZaYKRKoHx03Y
 XvqvNTopAsw8Ye6lbg9cJd0NcF1ssYMlX6OjvN60=
Date: Wed, 20 Nov 2024 13:15:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Paolo Perego <pperego@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Lee Jones <lee@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: Re: [PATCH 1/1] Remove hard-coded strings by using the helper
 functions str_true_false()
Message-ID: <2024112010-occupancy-viper-7c80@gregkh>
References: <20241120093020.6409-1-pperego@suse.de>
 <20241120093020.6409-2-pperego@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120093020.6409-2-pperego@suse.de>
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

On Wed, Nov 20, 2024 at 10:30:20AM +0100, Paolo Perego wrote:
> Signed-off-by: Paolo Perego <pperego@suse.de>
> ---
>  drivers/staging/fbtft/fb_ssd1351.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ssd1351.c b/drivers/staging/fbtft/fb_ssd1351.c
> index f6db2933ebba..6736b09b2f45 100644
> --- a/drivers/staging/fbtft/fb_ssd1351.c
> +++ b/drivers/staging/fbtft/fb_ssd1351.c
> @@ -6,6 +6,7 @@
>  #include <linux/init.h>
>  #include <linux/spi/spi.h>
>  #include <linux/delay.h>
> +#include <linux/string_choices.h>
>  
>  #include "fbtft.h"
>  
> @@ -162,7 +163,7 @@ static int set_gamma(struct fbtft_par *par, u32 *curves)
>  static int blank(struct fbtft_par *par, bool on)
>  {
>  	fbtft_par_dbg(DEBUG_BLANK, par, "(%s=%s)\n",
> -		      __func__, on ? "true" : "false");
> +		      __func__, str_true_false(on));
>  	if (on)
>  		write_reg(par, 0xAE);
>  	else
> -- 
> 2.47.0
> 
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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
