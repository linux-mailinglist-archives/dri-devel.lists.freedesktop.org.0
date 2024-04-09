Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203789E330
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 21:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AC4112F02;
	Tue,  9 Apr 2024 19:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="c9lRsjF9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gnB65wRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6D9112F02
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 19:21:41 +0000 (UTC)
Date: Tue, 9 Apr 2024 21:21:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1712690498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbYDuH8UvmmedQECl/5+GU9kJDM7MRwKRcu5e0t3/LY=;
 b=c9lRsjF9sB0XHQEcUJwP63q3auV+7aEk0/kF2y4JfemP33gcyTbtsAVC5refyNKkTQBSa0
 F8tt39/m8OCPxnpTd6ATJImnVodNVVSPuqaKHAEWn2fqLQn4HLXHiRcig3xXMz/imXOH2V
 oo0WqUh9LuzHabmzKDREQk1EH+K5nP3IR8rCXRwcjiBpKariJc7Y2DvEg6Ssl2EZWNUy3R
 qQJG1RsCOcEXxxJhMQziL0sMV4UHFTji6zIKm2QS1LBrlmgKQc11b8JnPXEzXGnEUJi+h4
 ZiVe0OHwo4B7hUoPs8+SpIeUE7erzIyLW+WnGbwtp9AiOuPdUIBCapHzV/ODAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1712690498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NbYDuH8UvmmedQECl/5+GU9kJDM7MRwKRcu5e0t3/LY=;
 b=gnB65wRcdTieOc9VSdQ5MJUTJ+PaYqf5ECEvJAqtHVDSOGyiTwtX1bF4K2+dnqxkj3BwU2
 RmkpTtUeUtn09ODw==
From: Nam Cao <namcao@linutronix.de>
To: Yuguo Pei <purofle@gmail.com>
Cc: gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: fbtft: fb_st7789v: support setting offset
Message-ID: <20240409212135.72cbac3a@namcao>
In-Reply-To: <20240409180900.31347-2-purofle@gmail.com>
References: <20240409180900.31347-2-purofle@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On 10/Apr/2024 Yuguo Pei wrote:
> Some screen sizes using st7789v chips are different from 240x320,
> and offsets need to be set to display all images properly.
> 
> For those who use screens with offset, they only need to modify the values
> of size and offset, and do not need to a new set_addr_win function.

If I understand the patch correctly, you are adding a new feature so that
people can change the screen offset? And from the patch, I think users
are supposed change the values of macros LEFT_OFFSET and TOP_OFFSET?

I hope I don't misunderstand anything, because I would be against this
approach. Asking users to modify the source code doesn't sound like a
good idea. If this is really needed, I suggest adding new device tree
properties instead.

> Signed-off-by: Yuguo Pei <purofle@gmail.com>
> ---
> v2: modify Signed-off-by, fix explanation of changes
> 
>  drivers/staging/fbtft/fb_st7789v.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index 861a154144e6..d47ab4262374 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -30,6 +30,12 @@
>  
>  #define HSD20_IPS 1
>  
> +#define WIDTH 240
> +#define HEIGHT 320
> +
> +#define LEFT_OFFSET 0
> +#define TOP_OFFSET 0
> +
>  /**
>   * enum st7789v_command - ST7789V display controller commands
>   *
> @@ -349,6 +355,21 @@ static int set_gamma(struct fbtft_par *par, u32 *curves)
>  	return 0;
>  }
>  
> +static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
> +{
> +	unsigned int x = xs + TOP_OFFSET, y = xe + TOP_OFFSET;
> +
> +	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS, (x >> 8) & 0xFF, xs & 0xFF,
                                                                     ^ should be x?
> +		  (y >> 8) & 0xFF, xe & 0xFF);
                                   ^ should be y?

As noted above, I don't think this is correct. The spec says this register should
be written with:
	- upper 8 bit of SC
	- lower 8 bit of SC
	- upper 8 bit of EC
	- lower 8 bit of EC
...and I don't think the code does that correctly.

> +	x = ys + LEFT_OFFSET, y = ye + LEFT_OFFSET;
> +
> +	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS, (x >> 8) & 0xFF, ys & 0xFF,
> +		  (y >> 8) & 0xFF, ye & 0xFF);

Same problem as above?

> +	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
> +}
> +
>  /**
>   * blank() - blank the display
>   *
> @@ -379,6 +400,7 @@ static struct fbtft_display display = {
>  		.set_var = set_var,
>  		.set_gamma = set_gamma,
>  		.blank = blank,
> +		.set_addr_win = set_addr_win,
>  	},
>  };
>

Because I don't think the implementation is correct, as pointed out above,
I have to ask: has this patch been tested with hardware? Is there
really a use case here? I wouldn't like to add code that is not really
used..

Best regards,
Nam


