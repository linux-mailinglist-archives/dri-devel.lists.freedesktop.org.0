Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFEC70DDE3
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 15:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFE510E0A1;
	Tue, 23 May 2023 13:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E14810E0A1;
 Tue, 23 May 2023 13:49:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CAD562C11;
 Tue, 23 May 2023 13:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71F3C433D2;
 Tue, 23 May 2023 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684849739;
 bh=NTXNAEYRC729bO09Athl6/NXyhWGp0b1YxIqNLFCfKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s1GnXgYwXOPH9hJGCEDmGxo1RLtnRrKDRKAaHV0I7pS09+AaDfItwvZhDrZMK43zT
 wmsr0yeyepMxuaGGuwABAC+TAbX17jzmS63xaIexMyTm4t4cbbL9fafXLiTNhVf0DK
 boGxcEvTVkAZbvHvR5S7bloIkEsChED96znIJ8D4OmxPo0Gztw9TVAdZyJm+W5TYWv
 g/4C0sCLSJGw86nOGbB7bBDXdRxCrvzpemMUaIOO88mINcYFXajM9xxuiRPXqRHD7t
 XKZk4wvd5wamtd0bxy/H84cL9Efo/asn+ojc7bzqd1QAXfLcqgLsIo/hmj9J70RdrB
 SG2qZ06hbEf0A==
Date: Tue, 23 May 2023 08:48:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
 with coherent SMMU
Message-ID: <7omqnqomhvyqu6md4pqcj74nuh6btrsua4od66hx245fyc2477@rdpvskytxmud>
References: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410185226.3240336-1-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 David Heidelberg <david@ixit.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 09:52:26PM +0300, Dmitry Baryshkov wrote:
> If the Adreno SMMU is dma-coherent, allocation will fail unless we
> disable IO_PGTABLE_QUIRK_ARM_OUTER_WBWA. Skip setting this quirk for the
> coherent SMMUs (like we have on sm8350 platform).
> 
> Fixes: 54af0ceb7595 ("arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes")
> Reported-by: David Heidelberg <david@ixit.cz>

I don't see this patch in linux-next yet, would it be possible to get it
picked up? I ran into this on sc8280xp as well.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 2942d2548ce6..f74495dcbd96 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1793,7 +1793,8 @@ a6xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
>  	 * This allows GPU to set the bus attributes required to use system
>  	 * cache on behalf of the iommu page table walker.
>  	 */
> -	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
> +	if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice) &&
> +	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_CACHE_COHERENCY))
>  		quirks |= IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
>  
>  	return adreno_iommu_create_address_space(gpu, pdev, quirks);
> -- 
> 2.39.2
> 
