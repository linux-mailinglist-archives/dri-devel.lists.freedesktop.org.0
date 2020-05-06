Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 925DD1C794C
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 20:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EF76E8C4;
	Wed,  6 May 2020 18:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1006E8C4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 18:23:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 96C608050C;
 Wed,  6 May 2020 20:23:24 +0200 (CEST)
Date: Wed, 6 May 2020 20:23:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH V2] video: fbdev: w100fb: Fix a potential double free.
Message-ID: <20200506182318.GA8712@ravnborg.org>
References: <20200506181902.193290-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506181902.193290-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=-sM3sDvmAAAA:8 a=p1g2r8j9AAAA:8 a=hD80L64hAAAA:8
 a=VwQbUJbxAAAA:8 a=lUMsOl5nhcu_R7_EiuIA:9 a=CjuIK1q_8ugA:10
 a=LUHx1oGsa4U61Z4w8267:22 a=GEd6vGEn79KL1p3bDQhq:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rpurdie@rpsys.net, stable@vger.kernel.org,
 adaplas@pol.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe
On Wed, May 06, 2020 at 08:19:02PM +0200, Christophe JAILLET wrote:
> Some memory is vmalloc'ed in the 'w100fb_save_vidmem' function and freed in
> the 'w100fb_restore_vidmem' function. (these functions are called
> respectively from the 'suspend' and the 'resume' functions)
> 
> However, it is also freed in the 'remove' function.
> 
> In order to avoid a potential double free, set the corresponding pointer
> to NULL once freed in the 'w100fb_restore_vidmem' function.
> 
> Fixes: aac51f09d96a ("[PATCH] w100fb: Rewrite for platform independence")
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Antonino Daplas <adaplas@pol.net>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: <stable@vger.kernel.org> # v2.6.14+
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks for the quick v2.
Applied to drm-misc-next.

	Sam

> ---
> v2: - Add Cc: tags
>     - Reword the commit message to give the names of the functions that
>       allocate and free the memory. These functions are called from the
>       suspend and resume function.
> ---
>  drivers/video/fbdev/w100fb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/video/fbdev/w100fb.c b/drivers/video/fbdev/w100fb.c
> index 2d6e2738b792..d96ab28f8ce4 100644
> --- a/drivers/video/fbdev/w100fb.c
> +++ b/drivers/video/fbdev/w100fb.c
> @@ -588,6 +588,7 @@ static void w100fb_restore_vidmem(struct w100fb_par *par)
>  		memsize=par->mach->mem->size;
>  		memcpy_toio(remapped_fbuf + (W100_FB_BASE-MEM_WINDOW_BASE), par->saved_extmem, memsize);
>  		vfree(par->saved_extmem);
> +		par->saved_extmem = NULL;
>  	}
>  	if (par->saved_intmem) {
>  		memsize=MEM_INT_SIZE;
> @@ -596,6 +597,7 @@ static void w100fb_restore_vidmem(struct w100fb_par *par)
>  		else
>  			memcpy_toio(remapped_fbuf + (W100_FB_BASE-MEM_WINDOW_BASE), par->saved_intmem, memsize);
>  		vfree(par->saved_intmem);
> +		par->saved_intmem = NULL;
>  	}
>  }
>  
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
