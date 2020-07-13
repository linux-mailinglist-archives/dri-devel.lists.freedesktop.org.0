Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1EA21DB22
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 18:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDE96E1E6;
	Mon, 13 Jul 2020 16:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5E96E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 16:03:45 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B8047804F2;
 Mon, 13 Jul 2020 18:03:43 +0200 (CEST)
Date: Mon, 13 Jul 2020 18:03:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: gem: Fix sparse warning
Message-ID: <20200713160342.GB1223330@ravnborg.org>
References: <CGME20200713070718eucas1p2e717879ea21a6cc8a8945d1b0b766b6c@eucas1p2.samsung.com>
 <20200713070708.30828-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713070708.30828-1-m.szyprowski@samsung.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=hD80L64hAAAA:8
 a=e5mUnYsNAAAA:8 a=ZMP1pjZxzPjGEdM3V3EA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 09:07:08AM +0200, Marek Szyprowski wrote:
> kvaddr element of the exynos_gem object points to a memory buffer, thus
> it should not have a __iomem annotation. Then, to avoid a warning or
> casting on assignment to fbi structure, the screen_buffer element of the
> union should be used instead of the screen_base.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I expect one of the exynos maintianers (Inki?) to pick it up.

	Sam

> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_drm_gem.h   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 56a2b47e1af7..5147f5929be7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -92,7 +92,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  	offset = fbi->var.xoffset * fb->format->cpp[0];
>  	offset += fbi->var.yoffset * fb->pitches[0];
>  
> -	fbi->screen_base = exynos_gem->kvaddr + offset;
> +	fbi->screen_buffer = exynos_gem->kvaddr + offset;
>  	fbi->screen_size = size;
>  	fbi->fix.smem_len = size;
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index 7445748288da..74e926abeff0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -40,7 +40,7 @@ struct exynos_drm_gem {
>  	unsigned int		flags;
>  	unsigned long		size;
>  	void			*cookie;
> -	void __iomem		*kvaddr;
> +	void			*kvaddr;
>  	dma_addr_t		dma_addr;
>  	unsigned long		dma_attrs;
>  	struct sg_table		*sgt;
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
