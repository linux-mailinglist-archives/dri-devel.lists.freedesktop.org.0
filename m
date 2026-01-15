Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CBD23516
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 10:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51210E1A0;
	Thu, 15 Jan 2026 09:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vorLa2sM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6D110E1A0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 09:00:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2EEB340186;
 Thu, 15 Jan 2026 09:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74A4C116D0;
 Thu, 15 Jan 2026 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768467603;
 bh=w6ixnRCagNUi0vz0wh0mts+qkQG/hqAzSYNIgtIJX1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vorLa2sMqoLzUPZkGxiGzqqQc0c/2c/knsdiNq3WKJA5ZCqAGE51rL3cln2ZDBGGz
 tc6DZsZB7z67uWWYy4oF+SpWisyfhJZ/Y33lK2cVy5eByRVMKIytjvp5zOpi7JHoW+
 EkMA06qIryktCpXf1FTBrYCift0KL21KVKJ5vQFA=
Date: Thu, 15 Jan 2026 09:59:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: WooYoung Jeon <chococookieman1@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: replace udelay with usleep_range
Message-ID: <2026011528-campfire-disparate-c7f6@gregkh>
References: <20260115084019.28574-1-chococookieman1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115084019.28574-1-chococookieman1@gmail.com>
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

On Thu, Jan 15, 2026 at 05:40:19PM +0900, WooYoung Jeon wrote:
> In the fb_ra8875 driver, udelay(100) is used for delay which
> causes busy-waiting. Replacing it with usleep_range(100, 120)
> allows the CPU to sleep during the delay, improving system
> resource efficiency.
> 
> This change was suggested by checkpatch.pl.
> 
> Signed-off-by: WooYoung Jeon <chococookieman1@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ra8875.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
> index 0ab1de664..92c9e4e03 100644
> --- a/drivers/staging/fbtft/fb_ra8875.c
> +++ b/drivers/staging/fbtft/fb_ra8875.c
> @@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
>  	}
>  	len--;
>  
> -	udelay(100);
> +	usleep_range(100, 120);
>  
>  	if (len) {
>  		buf = (u8 *)par->buf;
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

- You sent a patch that has been sent multiple times in the past and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
