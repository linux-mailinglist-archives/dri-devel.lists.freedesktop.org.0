Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC7D7ADE17
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F66210E2C2;
	Mon, 25 Sep 2023 17:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AF9C810E2C0;
 Mon, 25 Sep 2023 17:54:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E3BDA7;
 Mon, 25 Sep 2023 10:55:31 -0700 (PDT)
Received: from [10.57.0.188] (unknown [10.57.0.188])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 909AF3F59C;
 Mon, 25 Sep 2023 10:54:51 -0700 (PDT)
Message-ID: <b1434fe7-3128-f390-7b13-3d460378e231@arm.com>
Date: Mon, 25 Sep 2023 18:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>,
 Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-10 19:52, Dmitry Baryshkov wrote:
> If the Adreno SMMU is dma-coherent, allocation will fail unless we
> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> coherent SMMUs (like we have on sm8350 platform).

Hmm, but is it right that it should fail in the first place? The fact is 
that if the SMMU is coherent then walks *will* be outer-WBWA, so I 
honestly can't see why the io-pgtable code is going out of its way to 
explicitly reject a request to give them the same attribute it's already 
giving then anyway :/

Even if the original intent was for the quirk to have an over-specific 
implication of representing inner-NC as well, that hardly seems useful 
if what we've ended up with in practice is a nonsensical-looking check 
in one place and then a weird hacky bodge in another purely to work 
around it.

Does anyone know a good reason why this is the way it is?

[ just came across this code in the tree while trying to figure out what 
to do with iommu_set_pgtable_quirks()... ]

Thanks,
Robin.

> Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
> Reported-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2942d2548ce6..f74495dcbd96 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>   	 * This allows GPU to set the bus attributes required to use system
>   	 * cache on behalf of the iommu page table walker.
>   	 */
> -	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
> +	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
>   		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>   
>   	return adreno_iommu_create_address_space(gpu, pdev, quirks);
