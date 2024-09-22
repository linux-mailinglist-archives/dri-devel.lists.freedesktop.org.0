Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7069297E3C3
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 23:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CD810E0E9;
	Sun, 22 Sep 2024 21:59:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="FCmkTmTM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="krBTyNcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E4210E0E9
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 21:59:44 +0000 (UTC)
Date: Sun, 22 Sep 2024 23:59:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1727042381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8CzBtSpmKY0LITH8CnwZJd9nllEbE1TmmkKW21npGE=;
 b=FCmkTmTMnJphEXNgPa0rAUar1zqXJXb/qg/w+BBklSYP5CIx5ISc0634MFHeSV4NVyb9gO
 JuPvPMEmvtZlya29Ugo1AHp5wjowBslJalGqGB+lE5hxCHHHpz/a7k7yqyTqQKkCS+sTFN
 avI+vuPjp38GnmS1ZoQmbcwCpKZZlxxDK4DAwZovd6WvCu28WP7sMxxgHNyZEY+0wUlRIm
 sF+QKR1FCTkIRyRlqfIt9WPyqLqmTmfwvhYtpIHK0c6Z03faFrSD3IKPHT5n3ZF0dSqNGJ
 jhWXSIRhChe5i6wiw1uzyMA1P3ZmRGKgVarFFKYQkoWLLErO3A7o0JFQWesDkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1727042381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T8CzBtSpmKY0LITH8CnwZJd9nllEbE1TmmkKW21npGE=;
 b=krBTyNcLkt7xieiSiS4soCD9ln6A6nCjQuYL2IZyhi3e5/0oNflcMyIZQLFQAK31fZYOMe
 MT9twMOwBDondnDw==
From: Nam Cao <namcao@linutronix.de>
To: Fabio <joakobar2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org
Subject: Re: [PATCH] staging: fbtft: Changed calls to udelays() functions for
 usleep_range()
Message-ID: <20240922215914.uK2pDGCw@linutronix.de>
References: <20240922121213.4260-1-joakobar2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240922121213.4260-1-joakobar2000@gmail.com>
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

On Sun, Sep 22, 2024 at 09:12:13AM -0300, Fabio wrote:
> Replaced two lines of calling  udelays by usleep_range() functions, adding
> more efficiency due to the need of long-lasting delays of more than 10us.
> 
> Signed-off-by: Fabio Bareiro <joakobar2000@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ra8875.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
> index 0ab1de6647d0..edd467c6bf1a 100644
> --- a/drivers/staging/fbtft/fb_ra8875.c
> +++ b/drivers/staging/fbtft/fb_ra8875.c
> @@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
>  	}
>  	len--;
>  
> -	udelay(100);
> +	usleep_range(100, 150);
>  
>  	if (len) {
>  		buf = (u8 *)par->buf;
> @@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
>  
>  	/* restore user spi-speed */
>  	par->fbtftops.write = fbtft_write_spi;
> -	udelay(100);
> +	usleep_range(100, 150);
>  }

Are you sure that these changes are safe to make? If this write_reg8_bus8()
function is ever called in atomic context, this patch would break the
driver.

Unless it can be verified with hardware, I wouldn't make this kind of
changes.

Best regards,
Nam
