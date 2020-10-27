Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E829B789
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 16:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6607D6EB9F;
	Tue, 27 Oct 2020 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 173576EBC4;
 Tue, 27 Oct 2020 15:41:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43CD413D5;
 Tue, 27 Oct 2020 08:41:11 -0700 (PDT)
Received: from [10.57.50.191] (unknown [10.57.50.191])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB213F719;
 Tue, 27 Oct 2020 08:40:55 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/a6xx: Add support for using system cache on
 MMU500 based targets
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20201026185428.101443-1-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <dd760230-813a-31d1-799e-4be96148e560@arm.com>
Date: Tue, 27 Oct 2020 15:40:54 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201026185428.101443-1-jcrouse@codeaurora.org>
Content-Language: en-GB
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-10-26 18:54, Jordan Crouse wrote:
> This is an extension to the series [1] to enable the System Cache (LLC) for
> Adreno a6xx targets.
> 
> GPU targets with an MMU-500 attached have a slightly different process for
> enabling system cache. Use the compatible string on the IOMMU phandle
> to see if an MMU-500 is attached and modify the programming sequence
> accordingly.
> 
> [1] https://patchwork.freedesktop.org/series/83037/
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 46 +++++++++++++++++++++------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
>   2 files changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 95c98c642876..b7737732fbb6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1042,6 +1042,8 @@ static void a6xx_llc_deactivate(struct a6xx_gpu *a6xx_gpu)
>   
>   static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>   {
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
>   	u32 cntl1_regval = 0;
>   
>   	if (IS_ERR(a6xx_gpu->llc_mmio))
> @@ -1055,11 +1057,17 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>   			       (gpu_scid << 15) | (gpu_scid << 20);
>   	}
>   
> +	/*
> +	 * For targets with a MMU500, activate the slice but don't program the
> +	 * register.  The XBL will take care of that.
> +	 */
>   	if (!llcc_slice_activate(a6xx_gpu->htw_llc_slice)) {
> -		u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
> +		if (!a6xx_gpu->have_mmu500) {
> +			u32 gpuhtw_scid = llcc_get_slice_id(a6xx_gpu->htw_llc_slice);
>   
> -		gpuhtw_scid &= 0x1f;
> -		cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
> +			gpuhtw_scid &= 0x1f;
> +			cntl1_regval |= FIELD_PREP(GENMASK(29, 25), gpuhtw_scid);
> +		}
>   	}
>   
>   	if (cntl1_regval) {
> @@ -1067,13 +1075,20 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>   		 * Program the slice IDs for the various GPU blocks and GPU MMU
>   		 * pagetables
>   		 */
> -		a6xx_llc_write(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
> -
> -		/*
> -		 * Program cacheability overrides to not allocate cache lines on
> -		 * a write miss
> -		 */
> -		a6xx_llc_rmw(a6xx_gpu, REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
> +		if (a6xx_gpu->have_mmu500)
> +			gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL1, GENMASK(24, 0),
> +				cntl1_regval);
> +		else {
> +			a6xx_llc_write(a6xx_gpu,
> +				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_1, cntl1_regval);
> +
> +			/*
> +			 * Program cacheability overrides to not allocate cache
> +			 * lines on a write miss
> +			 */
> +			a6xx_llc_rmw(a6xx_gpu,
> +				REG_A6XX_CX_MISC_SYSTEM_CACHE_CNTL_0, 0xF, 0x03);
> +		}
>   	}
>   }
>   
> @@ -1086,10 +1101,21 @@ static void a6xx_llc_slices_destroy(struct a6xx_gpu *a6xx_gpu)
>   static void a6xx_llc_slices_init(struct platform_device *pdev,
>   		struct a6xx_gpu *a6xx_gpu)
>   {
> +	struct device_node *phandle;
> +
>   	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
>   	if (IS_ERR(a6xx_gpu->llc_mmio))
>   		return;
>   
> +	/*
> +	 * There is a different programming path for targets with an mmu500
> +	 * attached, so detect if that is the case
> +	 */
> +	phandle = of_parse_phandle(pdev->dev.of_node, "iommus", 0);
> +	a6xx_gpu->have_mmu500 = (phandle &&
> +		of_device_is_compatible(phandle, "arm,mmu500"));

Note that this should never match, since the compatible string defined 
by the binding is "arm,mmu-500" ;)

Robin.

> +	of_node_put(phandle);
> +
>   	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
>   	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
>   
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 9e6079af679c..e793d329e77b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -32,6 +32,7 @@ struct a6xx_gpu {
>   	void __iomem *llc_mmio;
>   	void *llc_slice;
>   	void *htw_llc_slice;
> +	bool have_mmu500;
>   };
>   
>   #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
