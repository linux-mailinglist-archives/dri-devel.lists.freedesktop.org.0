Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F31B7BE5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 18:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF5E6EAAF;
	Fri, 24 Apr 2020 16:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6666EAAF;
 Fri, 24 Apr 2020 16:43:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A27C420031;
 Fri, 24 Apr 2020 18:43:11 +0200 (CEST)
Date: Fri, 24 Apr 2020 18:43:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 39/59] drm/arcpgu: Switch to devm_drm_dev_alloc
Message-ID: <20200424164310.GC3822@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-40-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-40-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=jIQo8A4GAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=vXbG647_IWB6OH6jFB4A:9 a=CjuIK1q_8ugA:10
 a=Lf5xNeLK5dgiOs8hzIjU:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Apr 15, 2020 at 09:40:14AM +0200, Daniel Vetter wrote:
> - Need to embedded the drm_device, but for now we keep the usual
>   pointer chasing.
> - No more devm_kzalloc, which fixes a lifetime issues on driver
>   remove.
> - No more drm_dev_put, that's done by devm_ now.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>

Subject needs a small adjustment:

    drm/arc: arcgpu: Switch to devm_drm_dev_alloc

There is no driver named arcgpu - so it should
not be used like in thins patch.
With this detail fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>



> ---
>  drivers/gpu/drm/arc/arcpgu.h     |  1 +
>  drivers/gpu/drm/arc/arcpgu_drv.c | 33 +++++++++++++-------------------
>  2 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> index 6aac44b953ad..cd9e932f501e 100644
> --- a/drivers/gpu/drm/arc/arcpgu.h
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -9,6 +9,7 @@
>  #define _ARCPGU_H_
>  
>  struct arcpgu_drm_private {
> +	struct drm_device	drm;
>  	void __iomem		*regs;
>  	struct clk		*clk;
>  	struct drm_framebuffer	*fb;
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index c05d001163e0..bbd7acb150f3 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -42,18 +42,14 @@ static void arcpgu_setup_mode_config(struct drm_device *drm)
>  
>  DEFINE_DRM_GEM_CMA_FOPS(arcpgu_drm_ops);
>  
> -static int arcpgu_load(struct drm_device *drm)
> +static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
>  {
> -	struct platform_device *pdev = to_platform_device(drm->dev);
> -	struct arcpgu_drm_private *arcpgu;
> +	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
>  	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
> +	struct drm_device *drm = &arcpgu->drm;
>  	struct resource *res;
>  	int ret;
>  
> -	arcpgu = devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
> -	if (arcpgu == NULL)
> -		return -ENOMEM;
> -
>  	drm->dev_private = arcpgu;
>  
>  	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
> @@ -172,30 +168,28 @@ static struct drm_driver arcpgu_drm_driver = {
>  
>  static int arcpgu_probe(struct platform_device *pdev)
>  {
> -	struct drm_device *drm;
> +	struct arcpgu_drm_private *arcpgu;
>  	int ret;
>  
> -	drm = drm_dev_alloc(&arcpgu_drm_driver, &pdev->dev);
> -	if (IS_ERR(drm))
> -		return PTR_ERR(drm);
> +	arcpgu = devm_drm_dev_alloc(&pdev->dev, &arcpgu_drm_driver,
> +				    struct arcpgu_drm_private, drm);
> +	if (IS_ERR(arcpgu))
> +		return PTR_ERR(arcpgu);
>  
> -	ret = arcpgu_load(drm);
> +	ret = arcpgu_load(arcpgu);
>  	if (ret)
> -		goto err_unref;
> +		return ret;
>  
> -	ret = drm_dev_register(drm, 0);
> +	ret = drm_dev_register(&arcpgu->drm, 0);
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(drm, 16);
> +	drm_fbdev_generic_setup(&arcpgu->drm, 16);
>  
>  	return 0;
>  
>  err_unload:
> -	arcpgu_unload(drm);
> -
> -err_unref:
> -	drm_dev_put(drm);
> +	arcpgu_unload(&arcpgu->drm);
>  
>  	return ret;
>  }
> @@ -206,7 +200,6 @@ static int arcpgu_remove(struct platform_device *pdev)
>  
>  	drm_dev_unregister(drm);
>  	arcpgu_unload(drm);
> -	drm_dev_put(drm);
>  
>  	return 0;
>  }
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
