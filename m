Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8134BB696
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A82910F149;
	Fri, 18 Feb 2022 10:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C10710F149
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 10:14:40 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 9fce41f1-90a3-11ec-b2df-0050568cd888;
 Fri, 18 Feb 2022 10:14:57 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id EB8D7194B18;
 Fri, 18 Feb 2022 11:14:38 +0100 (CET)
Date: Fri, 18 Feb 2022 11:14:35 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
Message-ID: <Yg9xizrlvaNZFkCM@ravnborg.org>
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217103405.26492-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Feb 17, 2022 at 11:34:05AM +0100, Thomas Zimmermann wrote:
> Improve the performance of sys_imageblit() by manually unrolling
> the inner blitting loop and moving some invariants out. The compiler
> failed to do this automatically. The resulting binary code was even
> slower than the cfb_imageblit() helper, which uses the same algorithm,
> but operates on I/O memory.

It would be super to have the same optimization done to cfb_imageblit(),
to prevent that the two codebases diverge more than necessary.
Also I think cfb_ version would also see a performance gain from this.

The actual implementation looks good.
So with or without the extra un-rolling the patch is:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

One small nit belwo.

	Sam

> 
> A microbenchmark measures the average number of CPU cycles
> for sys_imageblit() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging). The value
> for CFB is given as a reference.
> 
>   sys_imageblit(), new: 25934 cycles
>   sys_imageblit(), old: 35944 cycles
>   cfb_imageblit():      30566 cycles
> 
> In the optimized case, sys_imageblit() is now ~30% faster than before
> and ~20% faster than cfb_imageblit().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/fbdev/core/sysimgblt.c | 51 +++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
> index a4d05b1b17d7..d70d65af6fcb 100644
> --- a/drivers/video/fbdev/core/sysimgblt.c
> +++ b/drivers/video/fbdev/core/sysimgblt.c
> @@ -188,23 +188,32 @@ static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
>  {
>  	u32 fgx = fgcolor, bgx = bgcolor, bpp = p->var.bits_per_pixel;
>  	u32 ppw = 32/bpp, spitch = (image->width + 7)/8;
> -	u32 bit_mask, end_mask, eorx, shift;
> +	u32 bit_mask, eorx;
>  	const char *s = image->data, *src;
>  	u32 *dst;
> -	const u32 *tab = NULL;
> -	int i, j, k;
> +	const u32 *tab;
> +	size_t tablen;
> +	u32 colortab[16];
> +	int i, j, k, jdecr;
> +
> +	if ((uintptr_t)dst1 % 8)
> +		return;
This check is new - and should not trigger ever. Maybe add an unlikely
and a WARN_ON_ONCE()?


>  
>  	switch (bpp) {
>  	case 8:
>  		tab = fb_be_math(p) ? cfb_tab8_be : cfb_tab8_le;
> +		tablen = 16;
>  		break;
>  	case 16:
>  		tab = fb_be_math(p) ? cfb_tab16_be : cfb_tab16_le;
> +		tablen = 4;
>  		break;
>  	case 32:
> -	default:
>  		tab = cfb_tab32;
> +		tablen = 2;
>  		break;
> +	default:
> +		return;
>  	}
>  
>  	for (i = ppw-1; i--; ) {
> @@ -217,19 +226,37 @@ static void fast_imageblit(const struct fb_image *image, struct fb_info *p,
>  	bit_mask = (1 << ppw) - 1;
>  	eorx = fgx ^ bgx;
>  	k = image->width/ppw;
> +	jdecr = 8 / ppw;
> +
> +	for (i = 0; i < tablen; ++i)
> +		colortab[i] = (tab[i] & eorx) ^ bgx;
This code could have been embedded with the switch (bpp) {
That would have made some sense I think.
But both ways works, so this was just a small observation.

	Sam
