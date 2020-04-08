Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9FD1A1C99
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2276A6E056;
	Wed,  8 Apr 2020 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D645E6E056;
 Wed,  8 Apr 2020 07:27:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EA25780512;
 Wed,  8 Apr 2020 09:27:02 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:27:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 14/44] drm/v3d: Delete v3d_dev->pdev
Message-ID: <20200408072701.GI14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-15-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-15-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=-VAfIpHNAAAA:8 a=e5mUnYsNAAAA:8 a=AK0yhmGKWhJIuLkF4NUA:9
 a=CjuIK1q_8ugA:10 a=srlwD-8ojaedGGhPAyx8:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Fri, Apr 03, 2020 at 03:57:58PM +0200, Daniel Vetter wrote:
> We already have it in v3d_dev->drm.dev with zero additional pointer
> chasing. Personally I don't like duplicated pointers like this
> because:
> - reviewers need to check whether the pointer is for the same or
> different objects if there's multiple
> - compilers have an easier time too
> 
> To avoid having to pull in some big headers I implemented the casting
> function as a macro instead of a static inline.
Hmm...

> Typechecking thanks to
> container_of still assured.
> 
> But also a bit a bikeshed, so feel free to ignore.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net>

This and patch 13 has same subject - confusing.

	Sam

> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 3 +--
>  drivers/gpu/drm/v3d/v3d_drv.h | 3 ++-
>  drivers/gpu/drm/v3d/v3d_irq.c | 8 +++++---
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 37cb880f2826..82a7dfdd14c2 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -235,7 +235,7 @@ static int
>  map_regs(struct v3d_dev *v3d, void __iomem **regs, const char *name)
>  {
>  	struct resource *res =
> -		platform_get_resource_byname(v3d->pdev, IORESOURCE_MEM, name);
> +		platform_get_resource_byname(v3d_to_pdev(v3d), IORESOURCE_MEM, name);
>  
>  	*regs = devm_ioremap_resource(v3d->drm.dev, res);
>  	return PTR_ERR_OR_ZERO(*regs);
> @@ -255,7 +255,6 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>  	if (IS_ERR(v3d))
>  		return PTR_ERR(v3d);
>  
> -	v3d->pdev = pdev;
>  	drm = &v3d->drm;
>  
>  	platform_set_drvdata(pdev, drm);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 4d2d1f2fe1af..935f23b524b2 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -46,7 +46,6 @@ struct v3d_dev {
>  	int ver;
>  	bool single_irq_line;
>  
> -	struct platform_device *pdev;
>  	void __iomem *hub_regs;
>  	void __iomem *core_regs[3];
>  	void __iomem *bridge_regs;
> @@ -128,6 +127,8 @@ v3d_has_csd(struct v3d_dev *v3d)
>  	return v3d->ver >= 41;
>  }
>  
> +#define v3d_to_pdev(v3d) to_platform_device(v3d->drm.dev)
> +
>  /* The per-fd struct, which tracks the MMU mappings. */
>  struct v3d_file_priv {
>  	struct v3d_dev *v3d;
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index f4ce6d057c90..51b65263c657 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -217,7 +217,7 @@ v3d_irq_init(struct v3d_dev *v3d)
>  		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS);
>  	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS);
>  
> -	irq1 = platform_get_irq(v3d->pdev, 1);
> +	irq1 = platform_get_irq(v3d_to_pdev(v3d), 1);
>  	if (irq1 == -EPROBE_DEFER)
>  		return irq1;
>  	if (irq1 > 0) {
> @@ -226,7 +226,8 @@ v3d_irq_init(struct v3d_dev *v3d)
>  				       "v3d_core0", v3d);
>  		if (ret)
>  			goto fail;
> -		ret = devm_request_irq(v3d->drm.dev, platform_get_irq(v3d->pdev, 0),
> +		ret = devm_request_irq(v3d->drm.dev,
> +				       platform_get_irq(v3d_to_pdev(v3d), 0),
>  				       v3d_hub_irq, IRQF_SHARED,
>  				       "v3d_hub", v3d);
>  		if (ret)
> @@ -234,7 +235,8 @@ v3d_irq_init(struct v3d_dev *v3d)
>  	} else {
>  		v3d->single_irq_line = true;
>  
> -		ret = devm_request_irq(v3d->drm.dev, platform_get_irq(v3d->pdev, 0),
> +		ret = devm_request_irq(v3d->drm.dev,
> +				       platform_get_irq(v3d_to_pdev(v3d), 0),
>  				       v3d_irq, IRQF_SHARED,
>  				       "v3d", v3d);
>  		if (ret)
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
