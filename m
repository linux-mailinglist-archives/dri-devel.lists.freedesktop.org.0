Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C2667C500
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 08:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38D910E10A;
	Thu, 26 Jan 2023 07:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6484D10E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:43:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9E7BB81D0C;
 Thu, 26 Jan 2023 07:43:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054B8C433EF;
 Thu, 26 Jan 2023 07:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1674718985;
 bh=qLBAZG/gbjpAF8cRofsMaVMSoAZk99jH0vp77Yjg1EQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CCVJ9OZWp+IbuYSxY4Rhn4YdBs9okdhqwDqtpOVy68+MBd+rq1Ubx7+xi1unGSH32
 5g4HSticgDfxZovx6bVoysxu6rzPSUFHNBgRONw3LjBp88gaW7vco2RyJD0AJp5+6T
 2urMSXVL/wHFwqqo8juti32pvP4KMRGktnoitvv4=
Date: Thu, 26 Jan 2023 08:43:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH] fbcon: Check font dimension limits
Message-ID: <Y9IvBoAbmh27xl4B@kroah.com>
References: <20230126004911.869923511@ens-lyon.org>
 <20230126004921.616264824@ens-lyon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126004921.616264824@ens-lyon.org>
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
Cc: linux-fbdev@vger.kernel.org, Sanan Hasanov <sanan.hasanov@knights.ucf.edu>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 01:49:12AM +0100, Samuel Thibault wrote:
> blit_x and blit_y are uint32_t, so fbcon currently cannot support fonts
> larger than 32x32.

"u32" you mean, right?

> The 32x32 case also needs shifting an unsigned int, to properly set bit
> 31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
> as reported on
> 
> http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com

Odd blank line?


> Kernel Branch: 6.2.0-rc5-next-20230124
> Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
> Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing

What are all of these lines for?

> 
> Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

What commit id does this fix?  Should it go to stable kernels?

> 
> Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
> ===================================================================
> --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
> +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
> @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
>  	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
>  		return -EINVAL;
>  
> +	if (font->width > 32 || font->height > 32)
> +		return -EINVAL;
> +
>  	/* Make sure drawing engine can handle the font */
> -	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
> -	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
> +	if (!(info->pixmap.blit_x & (1U << (font->width - 1))) ||
> +	    !(info->pixmap.blit_y & (1U << (font->height - 1))))

Are you sure this is still needed with the above check added?  If so,
why?  What is the difference in the compiled code?

thanks,

greg k-h
