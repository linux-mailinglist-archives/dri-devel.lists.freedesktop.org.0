Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539BF89DF9F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D1910E1A5;
	Tue,  9 Apr 2024 15:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sYVQGSAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7389B10FAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:49:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDEEC61886;
 Tue,  9 Apr 2024 15:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092C0C43390;
 Tue,  9 Apr 2024 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712677768;
 bh=uwl+DYO34osnS4Se+9oQAPTyhZwBq5JpKEjFYv+yrok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYVQGSAKJJEWvkbsD7b+ll3+gutvTtk8gmvhpGDd60ykr3R5MXLBPQ5G/D+eIso/c
 bPWVuDRsCe2zxTDges9Bx99qGzo1+Rp84OvsRYy0QUYI8YOvZPFR6jr3HomhpTUFU9
 MXQE6P+sKPn2f1Evf4SmSSMsvQTYVw7mVV1HO7Ao=
Date: Tue, 9 Apr 2024 17:49:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: purofle <purofle@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Message-ID: <2024040935-naturist-skimmer-391f@gregkh>
References: <20240405165747.93377-1-purofle@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405165747.93377-1-purofle@gmail.com>
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

On Sat, Apr 06, 2024 at 12:57:47AM +0800, purofle wrote:
> Some screen sizes using st7789v chips are different from 240x320,
> and offsets need to be set to display all images properly.
> 
> Signed-off-by: purofle <purofle@gmail.com>

We need a semi-real name here please.

> ---
>  drivers/staging/fbtft/fb_st7789v.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index 861a15414..d47ab4262 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -30,6 +30,12 @@
>  
>  #define HSD20_IPS 1
>  
> +#define WIDTH 240
> +#define HEIGHT 320

So you are now hard-coding the size?

> +
> +#define LEFT_OFFSET 0
> +#define TOP_OFFSET 0

Is this always going to be 0, if so, why need it at all?


thanks,

greg k-h
