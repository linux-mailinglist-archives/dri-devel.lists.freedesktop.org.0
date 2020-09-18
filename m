Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08E26FFE5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 16:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0AF6ECF2;
	Fri, 18 Sep 2020 14:30:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEC16ECF2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 14:30:46 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200918143044euoutp018c792db6aa7fb519f2b1aeaa1be90271~15zIY8NTn2791727917euoutp01K
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 14:30:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200918143044euoutp018c792db6aa7fb519f2b1aeaa1be90271~15zIY8NTn2791727917euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1600439444;
 bh=hBsrcWrylENiA8CJpWNFRm9tt7ldEyWWLZ99Wa3oth0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ch7jKqv2zJ1ELTA4j/aRagvEfbPcWM+tUtkwRKtvigz3oPyqwKFfnA1OSIwycU5eh
 JBULj9C7jum100LztS1Ja6VkjhMajdp9Dcl6/0hotTGqzfh7enTj+3HXSd6coc7SDF
 fbONobvqr7LL10DrCVQVzuHSD7cFJuczxbDbcORg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200918143044eucas1p101a3ad6b5e567d0beab4f394cae4c434~15zIKi1751587415874eucas1p1f;
 Fri, 18 Sep 2020 14:30:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id D0.2C.05997.494C46F5; Fri, 18
 Sep 2020 15:30:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200918143044eucas1p1f4222956eedd5de37fc1b0d414ecf7a3~15zHtxi621598415984eucas1p1W;
 Fri, 18 Sep 2020 14:30:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200918143044eusmtrp157a348edac28e951be0e5ac55b21972b~15zHstcg-0635606356eusmtrp1S;
 Fri, 18 Sep 2020 14:30:44 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-76-5f64c494f79c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C4.CB.06314.494C46F5; Fri, 18
 Sep 2020 15:30:44 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200918143042eusmtip10564a3bded8ed69494e7eb26cf282a86~15zGTRKp20404904049eusmtip1I;
 Fri, 18 Sep 2020 14:30:42 +0000 (GMT)
Subject: Re: [PATCH 14/18] drm/exynos: Consolidate IOMMU mapping code
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <f08cda6b-980f-94da-5f8f-6ba5603bc52d@samsung.com>
Date: Fri, 18 Sep 2020 16:30:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8b4a21e4f1b4d6da086371ee213c654b10fcf946.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjedy7fOXTWHaqTN865pYm3JcKc2nwLjuyeo+HHov8wit16gghU
 0wM4zBawMNd2pYGWZVC0OoJBuXipDl0HVOpGo7UgsCAaFBmdzku9QlRslu1wduHf87zP8+Z9
 ni8fT+su4vl8rrlQspiN+XqsYdp7nvUtr/nZlP2mz7OY9I4/Z0gkeI8hLQ/HEfl18j4m++rd
 iBxu+YUi7tEqhhwIppMKbwND7PXHOBK13uWIvbqRI/7xIZZUB6McGQzsxcR57AeWDJb3I1Lb
 10UR+4QXk9C3nYhcb4ljYq1YSbofxFjSOdXFklrPLUwaf7dh8izgY4ircz2pGFlNRt0nmHcX
 irFuHyW2+lqRODjUT4vV0eXij96rnFhvq2NFf7MdiyNDHVgc/SZMiScaS0XPcBMSf7pchsWK
 c0FGrCy/h0XXyWYkhodPUZ8kZ2nWmKT83GLJkpaxRbPVd+eDHY8r0eeutt1cGXIVOhDPg7AK
 bvZlOZCG1wmHEPSHvqZUMoGg4ZqfUcljBIEbbbQDJU1vOA97aFVoQpDomsQquY/AejbCKq45
 wkcQueCmFDxX2ARTpxOcYqKFDhbK3KOMImBhBTjiDqxgrZABw6EOVgnFCIvgTvlaZfyysBl6
 zv/GqJZkOFcXm8ZJwkYYOVs5vUoLr8Gp+F5axSlwJbZ/ugMI+5PAVt/DqrE/hMS1EKfiOXA7
 fPIfvAAiHiejLpQjGOtt41TiRDBorUWqKx1Geqewko4WlsHRQJo6fg8cZ5QyykvOhuF4shpi
 Nrjbv6PVsRZse3SqezF4w0f+O9t9cYCuQnrvjGreGXW8M+p4/797ADHNKEUqkgtyJPkts7Qz
 VTYWyEXmnNTPthf40d//PPJneOI0CiQ+DSGBR/pZ2j98pmwdayyWSwpCCHhaP1f7fjSyWac1
 GUt2SZbt2ZaifEkOoVd4Rp+iXdlwa5NOyDEWSnmStEOy/KtSfNL8MrTryTZbxpnXb39/PLrv
 LvWlrtf6RQsKJ4JV5O08R/J5V6Zhwn5o2Wr78SP+mi2zntZZ32m2p5eMxQw3DI6sgXZaE3G+
 MLYh9aWDPQb51XkGfMksPUc1pQPj4YY9afGvhvIWLM1dx2UWl65b+OLNnUvSJrnIw4Tp0dOr
 Hz8ytK7tNukZeatxxRu0RTb+BToMGt7jAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH8+t99PLovBQIv8Dmli7+ocS6S3kcfHTLzJJrQnTRf1QEbOgd
 kNFWey9MCYko/YN20EmZi7ZaiEIQiorg1DGwo3sQVjrC0AYNBBGMOK2PWP8AjLEVlvDfJ+d8
 P+fkJIchlDNUKlNmlASzUVeuomNJ/9uhqY0//qEv+sw7Fgv/zC6R4Pc+I8HzchbB7dfPaTjn
 ciDo8PwpA8f0SRJavFvA4jxPgtXVLYfAiadysDa2yqFnNkhBozcgh/G+szTUd/9MwXjtGILT
 o7dkYA07afCdGkBw3xOi4YRFA4Mv5igYWLxFwemmxzS0PqyjYaHPTYJ9YDdYJrNg2tFLfrGW
 nxt0y/gudxfix4NjBN8Y2Mj/4pyS8666MxTf02ml+clgP81Pfz8k43tbj/FNE+2I//VuDc1b
 hr0k31D7jObt1zoRPzRxQ/Z1wn71VrOpQhI+KTWJ0jZVPgcZai4X1BmZuWpOk1OwOSNLtUm7
 VS+Ul1UK5k3ag+pS95Pth141oCP2S8flNcgu2VAMg9lMXN/RRERZybYhHP7t8+X6h3j4pxpq
 mRPxm6CNtqHYSCaEcLM1/F5IZL/C/hGHLMpJbAEOt3voKBNsP4XbQqnLwiTCHn8zijZolsO2
 kO19SMFq8YSvP7KBYUh2HX5SuyNaTmYL8Uj9/EokAQ+fmSOjHMPm48nfG1bmZ2N37wyxzB/j
 G6GzK5yC7801y04ipXOV7lylOFcpzlVKCyI7UZJQIRpKDCKnFnUGscJYoi42GXpQ5L2u/7XQ
 exP9e3WPD7EMUsUr5t36IiWlqxSPGnwIM4QqSfFlwF+oVOh1R6sEs6nIXFEuiD6UFbmtkUhN
 LjZFntUoFXFZXA7kcjmaHE02qFIUdezgASVbopOEbwXhkGD+35MxMak16EjISTwq31ec9983
 H1XvDWvXHIaYq1rD7N8D1+Pk0oO+p1zid5k3/a8Ld925GF7M7NG3jf5g1+jvGLVxRP6VT8tG
 uMOXk0/l7wy6dHHNowfzLsSbwvWVDQ5v9fHAlvXpjvTbqg8KvDva2Zmlx3lpS+YESap1FVbF
 yxdmLG5Gm6YixVIdt4Ewi7p3ERmwXnQDAAA=
X-CMS-MailID: 20200918143044eucas1p1f4222956eedd5de37fc1b0d414ecf7a3
X-Msg-Generator: CA
X-RootMTR: 20200820150951eucas1p1d6fa70c2470cf5ce0d3c52af5fdbb40c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200820150951eucas1p1d6fa70c2470cf5ce0d3c52af5fdbb40c
References: <cover.1597931875.git.robin.murphy@arm.com>
 <CGME20200820150951eucas1p1d6fa70c2470cf5ce0d3c52af5fdbb40c@eucas1p1.samsung.com>
 <8b4a21e4f1b4d6da086371ee213c654b10fcf946.1597931876.git.robin.murphy@arm.com>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 kyungmin.park@samsung.com, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On 20.08.2020 17:08, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma, we can
> consolidate the shared mapping code onto the generic IOMMU API version,
> and retire the arch-specific implementation.
>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>
> ---
> This is a cheeky revert of 07dc3678bacc ("drm/exynos: Fix cleanup of
> IOMMU related objects"), plus removal of the remaining arm_iommu_*
> references on top.

I have one more suggestion to this patch. Please rename 
exynos_drm_private->mapping to exynos_drm_private->domain and change its 
type from "void *" to "struct iommu_domain *". The "void *" was there to 
support both old-ARM and ARM64 IOMMU/DMA-mapping frameworks, but now we 
can use the proper pointer types.

> ---
>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +-
>   drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +-
>   drivers/gpu/drm/exynos/exynos_drm_dma.c       | 61 +++----------------
>   drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +-
>   drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +-
>   drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +-
>   drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +-
>   drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +-
>   drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +-
>   drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +-
>   drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +--
>   11 files changed, 29 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> index 1f79bc2a881e..8428ae12dfa5 100644
> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
> @@ -55,7 +55,6 @@ static const char * const decon_clks_name[] = {
>   struct decon_context {
>   	struct device			*dev;
>   	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>   	struct exynos_drm_crtc		*crtc;
>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -645,7 +644,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
>   
>   	decon_clear_channels(ctx->crtc);
>   
> -	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, dev);
>   }
>   
>   static void decon_unbind(struct device *dev, struct device *master, void *data)
> @@ -655,7 +654,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
>   	decon_atomic_disable(ctx->crtc);
>   
>   	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>   }
>   
>   static const struct component_ops decon_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> index f2d87a7445c7..e7b58097ccdc 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -40,7 +40,6 @@
>   struct decon_context {
>   	struct device			*dev;
>   	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>   	struct exynos_drm_crtc		*crtc;
>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -128,13 +127,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
>   
>   	decon_clear_channels(ctx->crtc);
>   
> -	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, ctx->dev);
>   }
>   
>   static void decon_ctx_remove(struct decon_context *ctx)
>   {
>   	/* detach this sub driver from iommu mapping if supported. */
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>   }
>   
>   static u32 decon_calc_clkdiv(struct decon_context *ctx,
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> index 58b89ec11b0e..fd5f9bcf1857 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
> @@ -14,19 +14,6 @@
>   
>   #include "exynos_drm_drv.h"
>   
> -#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> -#include <asm/dma-iommu.h>
> -#else
> -#define arm_iommu_create_mapping(...)	({ NULL; })
> -#define arm_iommu_attach_device(...)	({ -ENODEV; })
> -#define arm_iommu_release_mapping(...)	({ })
> -#define arm_iommu_detach_device(...)	({ })
> -#define to_dma_iommu_mapping(dev) NULL
> -#endif
> -
> -#if !defined(CONFIG_IOMMU_DMA)
> -#define iommu_dma_init_domain(...) ({ -EINVAL; })
> -#endif
>   
>   #define EXYNOS_DEV_ADDR_START	0x20000000
>   #define EXYNOS_DEV_ADDR_SIZE	0x40000000
> @@ -58,7 +45,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
>    * mapping.
>    */
>   static int drm_iommu_attach_device(struct drm_device *drm_dev,
> -				struct device *subdrv_dev, void **dma_priv)
> +				struct device *subdrv_dev)
>   {
>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>   	int ret = 0;
> @@ -73,22 +60,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>   	if (ret)
>   		return ret;
>   
> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		/*
> -		 * Keep the original DMA mapping of the sub-device and
> -		 * restore it on Exynos DRM detach, otherwise the DMA
> -		 * framework considers it as IOMMU-less during the next
> -		 * probe (in case of deferred probe or modular build)
> -		 */
> -		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
> -		if (*dma_priv)
> -			arm_iommu_detach_device(subdrv_dev);
> -
> -		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
> -	} else if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
> -		ret = iommu_attach_device(priv->mapping, subdrv_dev);
> -	}
> -
> +	ret = iommu_attach_device(priv->mapping, subdrv_dev);
>   	if (ret)
>   		clear_dma_max_seg_size(subdrv_dev);
>   
> @@ -105,21 +77,15 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
>    * mapping
>    */
>   static void drm_iommu_detach_device(struct drm_device *drm_dev,
> -				    struct device *subdrv_dev, void **dma_priv)
> +				struct device *subdrv_dev)
>   {
>   	struct exynos_drm_private *priv = drm_dev->dev_private;
>   
> -	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> -		arm_iommu_detach_device(subdrv_dev);
> -		arm_iommu_attach_device(subdrv_dev, *dma_priv);
> -	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> -		iommu_detach_device(priv->mapping, subdrv_dev);
> -
> +	iommu_detach_device(priv->mapping, subdrv_dev);
>   	clear_dma_max_seg_size(subdrv_dev);
>   }
>   
> -int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> -			    void **dma_priv)
> +int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
>   {
>   	struct exynos_drm_private *priv = drm->dev_private;
>   
> @@ -133,27 +99,20 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
>   		return 0;
>   
>   	if (!priv->mapping) {
> -		void *mapping;
> -
> -		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
> -			mapping = arm_iommu_create_mapping(&platform_bus_type,
> -				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
> -		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
> -			mapping = iommu_get_domain_for_dev(priv->dma_dev);
> +		void *mapping = iommu_get_domain_for_dev(priv->dma_dev);
>   
>   		if (IS_ERR(mapping))
>   			return PTR_ERR(mapping);
>   		priv->mapping = mapping;
>   	}
>   
> -	return drm_iommu_attach_device(drm, dev, dma_priv);
> +	return drm_iommu_attach_device(drm, dev);
>   }
>   
> -void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
> -			       void **dma_priv)
> +void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev)
>   {
>   	if (IS_ENABLED(CONFIG_EXYNOS_IOMMU))
> -		drm_iommu_detach_device(drm, dev, dma_priv);
> +		drm_iommu_detach_device(drm, dev);
>   }
>   
>   void exynos_drm_cleanup_dma(struct drm_device *drm)
> @@ -163,7 +122,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
>   	if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
>   		return;
>   
> -	arm_iommu_release_mapping(priv->mapping);
> -	priv->mapping = NULL;
>   	priv->dma_dev = NULL;
>   }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index 6ae9056e7a18..d4d21d8cfb90 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -223,10 +223,8 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
>   	return priv->mapping ? true : false;
>   }
>   
> -int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
> -			    void **dma_priv);
> -void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
> -			       void **dma_priv);
> +int exynos_drm_register_dma(struct drm_device *drm, struct device *dev);
> +void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev);
>   void exynos_drm_cleanup_dma(struct drm_device *drm);
>   
>   #ifdef CONFIG_DRM_EXYNOS_DPI
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 29ab8be8604c..8ea2e1d77802 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -97,7 +97,6 @@ struct fimc_scaler {
>   struct fimc_context {
>   	struct exynos_drm_ipp ipp;
>   	struct drm_device *drm_dev;
> -	void		*dma_priv;
>   	struct device	*dev;
>   	struct exynos_drm_ipp_task	*task;
>   	struct exynos_drm_ipp_formats	*formats;
> @@ -1134,7 +1133,7 @@ static int fimc_bind(struct device *dev, struct device *master, void *data)
>   
>   	ctx->drm_dev = drm_dev;
>   	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -1154,7 +1153,7 @@ static void fimc_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &ctx->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(drm_dev, dev);
>   }
>   
>   static const struct component_ops fimc_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index bb67cad8371f..21aec38702fc 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -167,7 +167,6 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
>   struct fimd_context {
>   	struct device			*dev;
>   	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>   	struct exynos_drm_crtc		*crtc;
>   	struct exynos_drm_plane		planes[WINDOWS_NR];
>   	struct exynos_drm_plane_config	configs[WINDOWS_NR];
> @@ -1091,7 +1090,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>   	if (is_drm_iommu_supported(drm_dev))
>   		fimd_clear_channels(ctx->crtc);
>   
> -	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, dev);
>   }
>   
>   static void fimd_unbind(struct device *dev, struct device *master,
> @@ -1101,7 +1100,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
>   
>   	fimd_atomic_disable(ctx->crtc);
>   
> -	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
>   
>   	if (ctx->encoder)
>   		exynos_dpi_remove(ctx->encoder);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index 03be31427181..256ceafd9945 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -232,7 +232,6 @@ struct g2d_runqueue_node {
>   
>   struct g2d_data {
>   	struct device			*dev;
> -	void				*dma_priv;
>   	struct clk			*gate_clk;
>   	void __iomem			*regs;
>   	int				irq;
> @@ -1410,7 +1409,7 @@ static int g2d_bind(struct device *dev, struct device *master, void *data)
>   		return ret;
>   	}
>   
> -	ret = exynos_drm_register_dma(drm_dev, dev, &g2d->dma_priv);
> +	ret = exynos_drm_register_dma(drm_dev, dev);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to enable iommu.\n");
>   		g2d_fini_cmdlist(g2d);
> @@ -1435,7 +1434,7 @@ static void g2d_unbind(struct device *dev, struct device *master, void *data)
>   	priv->g2d_dev = NULL;
>   
>   	cancel_work_sync(&g2d->runqueue_work);
> -	exynos_drm_unregister_dma(g2d->drm_dev, dev, &g2d->dma_priv);
> +	exynos_drm_unregister_dma(g2d->drm_dev, dev);
>   }
>   
>   static const struct component_ops g2d_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 45e9aee8366a..88b6fcaa20be 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -97,7 +97,6 @@ struct gsc_scaler {
>   struct gsc_context {
>   	struct exynos_drm_ipp ipp;
>   	struct drm_device *drm_dev;
> -	void		*dma_priv;
>   	struct device	*dev;
>   	struct exynos_drm_ipp_task	*task;
>   	struct exynos_drm_ipp_formats	*formats;
> @@ -1170,7 +1169,7 @@ static int gsc_bind(struct device *dev, struct device *master, void *data)
>   
>   	ctx->drm_dev = drm_dev;
>   	ctx->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -1190,7 +1189,7 @@ static void gsc_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &ctx->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
> +	exynos_drm_unregister_dma(drm_dev, dev);
>   }
>   
>   static const struct component_ops gsc_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index 2d94afba031e..f22fa0d2621a 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -56,7 +56,6 @@ struct rot_variant {
>   struct rot_context {
>   	struct exynos_drm_ipp ipp;
>   	struct drm_device *drm_dev;
> -	void		*dma_priv;
>   	struct device	*dev;
>   	void __iomem	*regs;
>   	struct clk	*clock;
> @@ -244,7 +243,7 @@ static int rotator_bind(struct device *dev, struct device *master, void *data)
>   
>   	rot->drm_dev = drm_dev;
>   	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &rot->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE,
> @@ -262,7 +261,7 @@ static void rotator_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &rot->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(rot->drm_dev, rot->dev, &rot->dma_priv);
> +	exynos_drm_unregister_dma(rot->drm_dev, rot->dev);
>   }
>   
>   static const struct component_ops rotator_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> index ce1857138f89..0c560566bd2e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
> @@ -39,7 +39,6 @@ struct scaler_data {
>   struct scaler_context {
>   	struct exynos_drm_ipp		ipp;
>   	struct drm_device		*drm_dev;
> -	void				*dma_priv;
>   	struct device			*dev;
>   	void __iomem			*regs;
>   	struct clk			*clock[SCALER_MAX_CLK];
> @@ -451,7 +450,7 @@ static int scaler_bind(struct device *dev, struct device *master, void *data)
>   
>   	scaler->drm_dev = drm_dev;
>   	ipp->drm_dev = drm_dev;
> -	exynos_drm_register_dma(drm_dev, dev, &scaler->dma_priv);
> +	exynos_drm_register_dma(drm_dev, dev);
>   
>   	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
>   			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> @@ -471,8 +470,7 @@ static void scaler_unbind(struct device *dev, struct device *master,
>   	struct exynos_drm_ipp *ipp = &scaler->ipp;
>   
>   	exynos_drm_ipp_unregister(dev, ipp);
> -	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev,
> -				  &scaler->dma_priv);
> +	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev);
>   }
>   
>   static const struct component_ops scaler_component_ops = {
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
> index af192e5a16ef..18972e605c5d 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -94,7 +94,6 @@ struct mixer_context {
>   	struct platform_device *pdev;
>   	struct device		*dev;
>   	struct drm_device	*drm_dev;
> -	void			*dma_priv;
>   	struct exynos_drm_crtc	*crtc;
>   	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>   	unsigned long		flags;
> @@ -895,14 +894,12 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
>   		}
>   	}
>   
> -	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev,
> -				       &mixer_ctx->dma_priv);
> +	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev);
>   }
>   
>   static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
>   {
> -	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev,
> -				  &mixer_ctx->dma_priv);
> +	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev);
>   }
>   
>   static int mixer_enable_vblank(struct exynos_drm_crtc *crtc)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
