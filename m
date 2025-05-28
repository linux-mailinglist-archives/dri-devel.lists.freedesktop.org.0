Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83DAC7228
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 22:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1413510E66F;
	Wed, 28 May 2025 20:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="HE/Xy65E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kVe8VJqg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F89F10E6BF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 20:25:36 +0000 (UTC)
Date: Wed, 28 May 2025 22:25:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1748463926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjiMb4Q5y6Y1U24/A6lsu0hJaeOxplBCKBHXs1GFG/Y=;
 b=HE/Xy65ETPofJeCefcInmuueE1keY3WIh68k1jLkA2BIGad41C1sD91fp+/dkEcFO082HL
 61eAiOtxxz/pNhjPfQZYqvI/IQ6t8rJGziemzjJa4MlAMSkCNFBWBnkDHZtzn2tysrKTH0
 nFXz0VeteUaMmmy9S+FuehfYXCng3NurkzaszKw01gqfSFd5mje4qvNakNAUcWz2l5pnmG
 jFDayaNSBJPxWvZUT45RzjxOjOOsju4NS22Gp09UZ/igRvCbFZI9VqpPmWVNNAw5En6bGU
 vqfX3di5SXkGBf6LRfAS1ldBFqqT+SpoDql2Y+We5eJjgxxjmz3Xx99UiLF8YA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1748463926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IjiMb4Q5y6Y1U24/A6lsu0hJaeOxplBCKBHXs1GFG/Y=;
 b=kVe8VJqgmGMGy5sJq1ljbME2bF5bZhgirE2rR0i2XG7dO3meoX4TyAtch3qqVZer/RYCtr
 JtFOV0DFeRmC4vBQ==
From: Nam Cao <namcao@linutronix.de>
To: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add invert display parameter
Message-ID: <20250528202518.Kq5YuwFq@linutronix.de>
References: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528-ili9341-invert-dtb-v1-1-080202809332@openpixelsystems.org>
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

On Wed, May 28, 2025 at 05:42:30PM +0200, Bram Vlerick wrote:
> Add devicetree parameter to enable or disable the invert feature of the
> ili9341 display

Can't/shouldn't this be done by userspace application? Why would someone
want to invert the color by default.

Also, this driver is built on top of the deprecated framebuffer, it will
never get out of staging/. For new feature, you probably want to send it to
drivers/gpu/drm/panel/panel-ilitek-ili9341.c instead.

> Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
> ---
>  drivers/staging/fbtft/fb_ili9341.c | 3 +++
>  drivers/staging/fbtft/fbtft-core.c | 2 ++
>  drivers/staging/fbtft/fbtft.h      | 3 +++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9341.c b/drivers/staging/fbtft/fb_ili9341.c
> index 47e72b87d76d996111aaadcf5e56dfdfc1c331ab..a184f57df12b5ad6612a2e83b664a8911c7c79be 100644
> --- a/drivers/staging/fbtft/fb_ili9341.c
> +++ b/drivers/staging/fbtft/fb_ili9341.c
> @@ -103,6 +103,9 @@ static int set_var(struct fbtft_par *par)
>  		break;
>  	}
>  
> +	if (par->invert)
> +		write_reg(par, 0x21);

Use MIPI_DCS_ENTER_INVERT_MODE instead of the magic number.

Best regards,
Nam
