Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D971411BF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDAA6F8DF;
	Fri, 17 Jan 2020 19:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F6E6F8E7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 3402E80419;
 Fri, 17 Jan 2020 20:31:13 +0100 (CET)
Date: Fri, 17 Jan 2020 20:31:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/6] video: fbdev: controlfb: add COMPILE_TEST support
Message-ID: <20200117193112.GC24812@ravnborg.org>
References: <20200116140900.26363-1-b.zolnierkie@samsung.com>
 <CGME20200116140915eucas1p28dfeecf8a58cecb00262fe86fd19c4f5@eucas1p2.samsung.com>
 <20200116140900.26363-4-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116140900.26363-4-b.zolnierkie@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=e5mUnYsNAAAA:8 a=iGuPKJsMUmC7bJEyTWkA:9
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

Hi Bartlomiej

On Thu, Jan 16, 2020 at 03:08:57PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Add COMPILE_TEST support to controlfb driver for better compile
> testing coverage.

This is not a nice patch to add COMPILE_TEST support :-(
But I see why you do it.
I already spent too much time being side-tracked by this, but here are
some comments to consider.

With the comments considered:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> ---
>  drivers/video/fbdev/Kconfig     |  2 +-
>  drivers/video/fbdev/controlfb.c | 21 +++++++++++++++++++--
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index aa9541bf964b..91c872457863 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -472,7 +472,7 @@ config FB_OF
>  
>  config FB_CONTROL
>  	bool "Apple \"control\" display support"
> -	depends on (FB = y) && PPC_PMAC && PPC32
> +	depends on (FB = y) && ((PPC_PMAC && PPC32) || COMPILE_TEST)
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT
> diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
> index bd0f61d8bdb5..87cd817ad4c6 100644
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -47,12 +47,25 @@
>  #include <linux/nvram.h>
>  #include <linux/adb.h>
>  #include <linux/cuda.h>
> +#ifdef CONFIG_PPC_PMAC
>  #include <asm/prom.h>
>  #include <asm/btext.h>
> +#endif
>  
>  #include "macmodes.h"
>  #include "controlfb.h"
>  
> +#ifndef CONFIG_PPC_PMAC
> +#undef in_8
> +#undef out_8
> +#undef in_le32
> +#undef out_le32
> +#define in_8(addr)		0
> +#define out_8(addr, val)
> +#define in_le32(addr)		0
> +#define out_le32(addr, val)
> +#endif
> +
>  struct fb_par_control {
>  	int	vmode, cmode;
>  	int	xres, yres;
> @@ -278,7 +291,9 @@ static int controlfb_mmap(struct fb_info *info,
>  		vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>  	} else {
>  		/* framebuffer */
> +#ifdef CONFIG_PPC_PMAC
>  		vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
> +#endif

Add:
#define pgprot_cached_wthru(x) 0
in the CONFIG_PPC_PMAC block?

>  	}
>  
>  	return vm_iomap_memory(vma, start, len);
> @@ -582,13 +597,14 @@ static void __init find_vram_size(struct fb_info_control *p)
>  
>  	out_8(&p->frame_buffer[0x600000], 0xb3);
>  	out_8(&p->frame_buffer[0x600001], 0x71);
> +#ifdef CONFIG_PPC_PMAC
>  	asm volatile("eieio; dcbf 0,%0" : : "r" (&p->frame_buffer[0x600000])
>  					: "memory" );
>  	mb();
>  	asm volatile("eieio; dcbi 0,%0" : : "r" (&p->frame_buffer[0x600000])
>  					: "memory" );
>  	mb();
> -
> +#endif

The inline asm block could be written as:

static void invalid_vram_cache(void * addr)
{
	eieio();
	dcbf(addr);
	mb;
	eieio();
	dcbi(addr);
	mb();
}

And then this inline function could be in the CONFIG_PPC_PMAC block -
and a dummy in the else part.
The function name is just my best guess what the assembler does.

>  	bank2 = (in_8(&p->frame_buffer[0x600000]) == 0xb3)
>  		&& (in_8(&p->frame_buffer[0x600001]) == 0x71);
>  
> @@ -601,13 +617,14 @@ static void __init find_vram_size(struct fb_info_control *p)
>  
>  	out_8(&p->frame_buffer[0], 0x5a);
>  	out_8(&p->frame_buffer[1], 0xc7);
> +#ifdef CONFIG_PPC_PMAC
>  	asm volatile("eieio; dcbf 0,%0" : : "r" (&p->frame_buffer[0])
>  					: "memory" );
>  	mb();
>  	asm volatile("eieio; dcbi 0,%0" : : "r" (&p->frame_buffer[0])
>  					: "memory" );
>  	mb();
> -
> +#endif
Same here.

>  	bank1 = (in_8(&p->frame_buffer[0]) == 0x5a)
>  		&& (in_8(&p->frame_buffer[1]) == 0xc7);
>  
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
