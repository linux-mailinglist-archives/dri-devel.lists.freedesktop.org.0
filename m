Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B14BB5BB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 10:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C1C10F154;
	Fri, 18 Feb 2022 09:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A1710F154
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:35:46 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 30a45a6b-909e-11ec-baa1-0050568c148b;
 Fri, 18 Feb 2022 09:36:03 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 57E25194B47;
 Fri, 18 Feb 2022 10:35:45 +0100 (CET)
Date: Fri, 18 Feb 2022 10:35:41 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] fbdev: Improve performance of sys_fillrect()
Message-ID: <Yg9obUp9f08zQUEf@ravnborg.org>
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217103405.26492-2-tzimmermann@suse.de>
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

On Thu, Feb 17, 2022 at 11:34:04AM +0100, Thomas Zimmermann wrote:
> Improve the performance of sys_fillrect() by using word-aligned
> 32/64-bit mov instructions. While the code tried to implement this,
> the compiler failed to create fast instructions. The resulting
> binary instructions were even slower than cfb_fillrect(), which
> uses the same algorithm, but operates on I/O memory.
> 
> A microbenchmark measures the average number of CPU cycles
> for sys_fillrect() after a stabilizing period of a few minutes
> (i7-4790, FullHD, simpledrm, kernel with debugging). The value
> for CFB is given as a reference.
> 
>   sys_fillrect(), new:  26586 cycles
>   sys_fillrect(), old: 166603 cycles
>   cfb_fillrect():       41012 cycles
> 
> In the optimized case, sys_fillrect() is now ~6x faster than before
> and ~1.5x faster than the CFB implementation.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Nice optimization.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/video/fbdev/core/sysfillrect.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
> index 33ee3d34f9d2..bcdcaeae6538 100644
> --- a/drivers/video/fbdev/core/sysfillrect.c
> +++ b/drivers/video/fbdev/core/sysfillrect.c
> @@ -50,19 +50,9 @@ bitfill_aligned(struct fb_info *p, unsigned long *dst, int dst_idx,
>  
>  		/* Main chunk */
>  		n /= bits;
> -		while (n >= 8) {
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			*dst++ = pat;
> -			n -= 8;
> -		}
> -		while (n--)
> -			*dst++ = pat;
> +		memset_l(dst, pat, n);
> +		dst += n;
> +
>  		/* Trailing bits */
>  		if (last)
>  			*dst = comp(pat, *dst, last);
> -- 
> 2.34.1
