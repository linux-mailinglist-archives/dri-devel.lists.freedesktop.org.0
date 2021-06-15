Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9B3A8344
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06B16E332;
	Tue, 15 Jun 2021 14:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658266E32F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 14:52:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623768741; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=BKeI94pJdhp1kZiKiTT+31bMktvd/IDTua5hgNL62c0=;
 b=k6FEUFZ+CJ+yqWY+I1XXV0NgpnVeu3BWECzIyDOZBU2ppl/uSMKujdOdhibD+uyC0h0DIC+M
 kCjG78qlGlOekLwS+CACBTxGEyzYIOoJL/tgDHzLvDkcSc/c0efKicSjlrjX8E83iufxzxLa
 LNciCbxHybWIyrsADnjpjzWauKo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60c8be8fed59bf69cc5e0554 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 14:51:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 62018C433F1; Tue, 15 Jun 2021 14:51:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.105] (unknown [117.211.33.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D94D5C43460
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 14:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D94D5C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
To: dri-devel@lists.freedesktop.org
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-4-robdclark@gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <172f92ca-7a50-c19d-bf4d-e06c1502336c@codeaurora.org>
Date: Tue, 15 Jun 2021 20:21:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210610214431.539029-4-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/11/2021 3:14 AM, Rob Clark wrote:
> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Use the new adreno-smmu-priv fault info function to get more SMMU
> debug registers and print the current TTBR0 to debug per-instance
> pagetables and figure out which GPU block generated the request.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
>   drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
>   4 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index f46562c12022..eb030b00bff4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1075,7 +1075,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   	return true;
>   }
>   
> -static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>   {
>   	struct msm_gpu *gpu = arg;
>   	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> @@ -1085,7 +1085,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
>   			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
>   			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
>   
> -	return -EFAULT;
> +	return 0;
Shall we return -ENOSYS here to let the smmu handler print the fault 
debugging info? Due to the change here: iommu/arm-smmu: Add support for 
driver IOMMU fault handlers - arm_smmu_context_fault()

>   }
>   
>   static void a5xx_cp_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c7f0ddb12d8f..fc19db10bff1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1032,18 +1032,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
>   	msm_gpu_hw_init(gpu);
>   }
>   
> -static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
> +{
> +	static const char *uche_clients[7] = {
> +		"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
> +	};
> +	u32 val;
> +
> +	if (mid < 1 || mid > 3)
> +		return "UNKNOWN";
> +
> +	/*
> +	 * The source of the data depends on the mid ID read from FSYNR1.
> +	 * and the client ID read from the UCHE block
> +	 */
> +	val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
Are you sure gx rail is up at this point?

> +
> +	/* mid = 3 is most precise and refers to only one block per client */
> +	if (mid == 3)
> +		return uche_clients[val & 7];
> +
> +	/* For mid=2 the source is TP or VFD except when the client id is 0 */
> +	if (mid == 2)
> +		return ((val & 7) == 0) ? "TP" : "TP|VFD";
> +
> +	/* For mid=1 just return "UCHE" as a catchall for everything else */
> +	return "UCHE";
> +}
UCHE decoding scheme is different for a660. I am not sure who should 
handle that. Jonathan?

> +
> +static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
> +{
> +	if (id == 0)
> +		return "CP";
> +	else if (id == 4)
> +		return "CCU";
> +	else if (id == 6)
> +		return "CDP Prefetch";
I guess id == 7 is not possible here.

> +
> +	return a6xx_uche_fault_block(gpu, id);
> +}
> +
> +#define ARM_SMMU_FSR_TF                 BIT(1)
> +#define ARM_SMMU_FSR_PF			BIT(3)
> +#define ARM_SMMU_FSR_EF			BIT(4)
> +
> +static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>   {
>   	struct msm_gpu *gpu = arg;
> +	struct adreno_smmu_fault_info *info = data;
> +	const char *type = "UNKNOWN";
>   
> -	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> +	/*
> +	 * Print a default message if we couldn't get the data from the
> +	 * adreno-smmu-priv
> +	 */
> +	if (!info) {
> +		pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
>   			iova, flags,
>   			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
>   			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
>   			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
>   			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
>   
> -	return -EFAULT;
> +		return 0;
return -ENOSYS here so that the smmu driver prints some extra debug data?
> +	}
> +
> +	if (info->fsr & ARM_SMMU_FSR_TF)
> +		type = "TRANSLATION";
> +	else if (info->fsr & ARM_SMMU_FSR_PF)
> +		type = "PERMISSION";
> +	else if (info->fsr & ARM_SMMU_FSR_EF)
> +		type = "EXTERNAL";
> +
> +	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
> +			info->ttbr0, iova,
> +			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> +			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
> +
> +	return 0;
>   }
>   
>   static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 50d881794758..6975b95c3c29 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>   		unsigned long iova, int flags, void *arg)
>   {
>   	struct msm_iommu *iommu = arg;
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> +	struct adreno_smmu_fault_info info, *ptr = NULL;
> +
> +	if (adreno_smmu->get_fault_info) {
> +		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
> +		ptr = &info;
> +	}
> +
>   	if (iommu->base.handler)
> -		return iommu->base.handler(iommu->base.arg, iova, flags);
> +		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>   	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 61ade89d9e48..a88f44c3268d 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -26,7 +26,7 @@ enum msm_mmu_type {
>   struct msm_mmu {
>   	const struct msm_mmu_funcs *funcs;
>   	struct device *dev;
> -	int (*handler)(void *arg, unsigned long iova, int flags);
> +	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
>   	void *arg;
>   	enum msm_mmu_type type;
>   };
> @@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
>   struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>   
>   static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> -		int (*handler)(void *arg, unsigned long iova, int flags))
> +		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
Just curious, why hide the datatype of 'data' using 'void *' here?
>   {
>   	mmu->arg = arg;
>   	mmu->handler = handler;
> 

