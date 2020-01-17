Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 244F6141143
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 19:57:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2278D6F8C4;
	Fri, 17 Jan 2020 18:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7B36F8C4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 18:57:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6195F20028;
 Fri, 17 Jan 2020 19:57:38 +0100 (CET)
Date: Fri, 17 Jan 2020 19:57:37 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] video: fbdev: w100fb: fix sparse warnings
Message-ID: <20200117185737.GB24508@ravnborg.org>
References: <CGME20200116145320eucas1p188ed7bed08623bc2c2ba6b863ff223d8@eucas1p1.samsung.com>
 <d438108a-e569-a14a-a9b1-3fefd88fcadc@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d438108a-e569-a14a-a9b1-3fefd88fcadc@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=jGXlrUAzkbCyByQ0p6wA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 03:53:20PM +0100, Bartlomiej Zolnierkiewicz wrote:
> * Add missing __iomem annotations where needed.
> * Make w100fb_probe() static.
> * Return NULL pointer (instead of using plain integer) in
>   w100_get_xtal_tabl().
> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/fbdev/w100fb.c |   18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> Index: b/drivers/video/fbdev/w100fb.c
> ===================================================================
> --- a/drivers/video/fbdev/w100fb.c
> +++ b/drivers/video/fbdev/w100fb.c
> @@ -61,9 +61,9 @@ struct w100_pll_info *w100_get_xtal_tabl
>  #define BITS_PER_PIXEL    16
>  
>  /* Remapped addresses for base cfg, memmapped regs and the frame buffer itself */
> -static void *remapped_base;
> -static void *remapped_regs;
> -static void *remapped_fbuf;
> +static void __iomem *remapped_base;
> +static void __iomem *remapped_regs;
> +static void __iomem *remapped_fbuf;
>  
>  #define REMAPPED_FB_LEN   0x15ffff
>  
> @@ -635,7 +635,7 @@ static int w100fb_resume(struct platform
>  #endif
>  
>  
> -int w100fb_probe(struct platform_device *pdev)
> +static int w100fb_probe(struct platform_device *pdev)
>  {
>  	int err = -EIO;
>  	struct w100fb_mach_info *inf;
> @@ -807,10 +807,11 @@ static int w100fb_remove(struct platform
>  
>  static void w100_soft_reset(void)
>  {
> -	u16 val = readw((u16 *) remapped_base + cfgSTATUS);
> -	writew(val | 0x08, (u16 *) remapped_base + cfgSTATUS);
> +	u16 val = readw((u16 __iomem *)remapped_base + cfgSTATUS);
> +
> +	writew(val | 0x08, (u16 __iomem *)remapped_base + cfgSTATUS);
>  	udelay(100);
> -	writew(0x00, (u16 *) remapped_base + cfgSTATUS);
> +	writew(0x00, (u16 __iomem *)remapped_base + cfgSTATUS);
>  	udelay(100);
>  }
>  
> @@ -1022,7 +1023,8 @@ struct w100_pll_info *w100_get_xtal_tabl
>  			return pll_entry->pll_table;
>  		pll_entry++;
>  	} while (pll_entry->xtal_freq);
> -	return 0;
> +
> +	return NULL;
>  }
>  
>  
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
