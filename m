Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94A1BE75E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AFB6E0C5;
	Wed, 29 Apr 2020 19:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394DC6E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:28:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8AF0C804D0;
 Wed, 29 Apr 2020 21:28:46 +0200 (CEST)
Date: Wed, 29 Apr 2020 21:28:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] video: fbdev: controlfb: fix build for COMPILE_TEST=y
 && PPC_PMAC=y && PPC32=n
Message-ID: <20200429192840.GA1022@ravnborg.org>
References: <CGME20200429104825eucas1p16bf37b71a3ab3a768d1eff6c48eb61dd@eucas1p1.samsung.com>
 <fe520316-3863-e6c4-9581-5d709f49e906@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe520316-3863-e6c4-9581-5d709f49e906@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=rOUgymgbAAAA:8 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=r0KyO4OkOOGdkHu8Tb4A:9 a=CjuIK1q_8ugA:10
 a=MP9ZtiD8KjrkvI0BhSjB:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 kbuild test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bartlomiej

On Wed, Apr 29, 2020 at 12:48:24PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> powerpc allyesconfig fails like this:
> 
> drivers/video/fbdev/controlfb.c: In function 'controlfb_mmap':
> drivers/video/fbdev/controlfb.c:756:23: error: implicit declaration of function 'pgprot_cached_wthru'; did you mean 'pgprot_cached'? [-Werror=implicit-function-declaration]
>   756 |   vma->vm_page_prot = pgprot_cached_wthru(vma->vm_page_prot);
>       |                       ^~~~~~~~~~~~~~~~~~~
>       |                       pgprot_cached
> drivers/video/fbdev/controlfb.c:756:23: error: incompatible types when assigning to type 'pgprot_t' {aka 'struct <anonymous>'} from type 'int'
> 
> Fix it by adding missing PPC32 dependency.
> 
> Fixes: a07a63b0e24d ("video: fbdev: controlfb: add COMPILE_TEST support")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

I've updated my build script to include a few popwerpc 32 bit configs.
Patch looked correct, and my builds was OK.
So applied to drm-misc-next and pushed out.

If my prodding of Christoph will result in anything only time will tell.

	Sam

> ---
> v2: fix implicit btext_update_display() function declaration error
> 
>  drivers/video/fbdev/controlfb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: b/drivers/video/fbdev/controlfb.c
> ===================================================================
> --- a/drivers/video/fbdev/controlfb.c
> +++ b/drivers/video/fbdev/controlfb.c
> @@ -55,7 +55,7 @@
>  #include "macmodes.h"
>  #include "controlfb.h"
>  
> -#ifndef CONFIG_PPC_PMAC
> +#if !defined(CONFIG_PPC_PMAC) || !defined(CONFIG_PPC32)
>  #define invalid_vram_cache(addr)
>  #undef in_8
>  #undef out_8
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
