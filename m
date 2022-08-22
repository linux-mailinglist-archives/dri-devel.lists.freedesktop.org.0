Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E659C103
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 15:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53BE8ED38;
	Mon, 22 Aug 2022 13:53:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3911D8ECE2;
 Mon, 22 Aug 2022 13:53:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E704812FC;
 Mon, 22 Aug 2022 06:53:06 -0700 (PDT)
Received: from [10.57.15.77] (unknown [10.57.15.77])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5E9A3F70D;
 Mon, 22 Aug 2022 06:53:01 -0700 (PDT)
Message-ID: <c8543ace-65cd-b8a8-499c-1b051867366b@arm.com>
Date: Mon, 22 Aug 2022 14:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/5] drm/msm: Use separate ASID for each set of pgtables
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220821181917.1188021-1-robdclark@gmail.com>
 <20220821181917.1188021-5-robdclark@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220821181917.1188021-5-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-21 19:19, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Optimize TLB invalidation by using different ASID for each set of
> pgtables.  There can be scenarios where multiple processes end up
> with the same ASID (such as >256 processes using the GPU), but this
> is harmless, it will only result in some over-invalidation (but
> less over-invalidation compared to using ASID=0 for all processes)

Um, if you're still relying on the GPU doing an invalidate-all-by-ASID 
whenever it switches a TTBR, then there's only ever one ASID live in the 
TLBs at once, so it really doesn't matter whether its value stays the 
same or changes. This seems like a whole chunk of complexity to achieve 
nothing :/

If you could actually use multiple ASIDs in a meaningful way to avoid 
any invalidations, you'd need to do considerably more work to keep track 
of reuse, and those races would probably be a lot less benign.

Robin.

.> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index a54ed354578b..94c8c09980d1 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -33,6 +33,8 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
>   		size_t size)
>   {
>   	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct adreno_smmu_priv *adreno_smmu =
> +		dev_get_drvdata(pagetable->parent->dev);
>   	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
>   	size_t unmapped = 0;
>   
> @@ -43,7 +45,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
>   		size -= 4096;
>   	}
>   
> -	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
> +	adreno_smmu->tlb_inv_by_id(adreno_smmu->cookie, pagetable->asid);
>   
>   	return (unmapped == size) ? 0 : -EINVAL;
>   }
> @@ -147,6 +149,7 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>   
>   struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>   {
> +	static atomic_t asid = ATOMIC_INIT(1);
>   	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
>   	struct msm_iommu *iommu = to_msm_iommu(parent);
>   	struct msm_iommu_pagetable *pagetable;
> @@ -210,12 +213,14 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
>   	pagetable->ttbr = ttbr0_cfg.arm_lpae_s1_cfg.ttbr;
>   
>   	/*
> -	 * TODO we would like each set of page tables to have a unique ASID
> -	 * to optimize TLB invalidation.  But iommu_flush_iotlb_all() will
> -	 * end up flushing the ASID used for TTBR1 pagetables, which is not
> -	 * what we want.  So for now just use the same ASID as TTBR1.
> +	 * ASID 0 is used for kernel mapped buffers in TTBR1, which we
> +	 * do not need to invalidate when unmapping from TTBR0 pgtables.
> +	 * The hw ASID is at *least* 8b, but can be 16b.  We just assume
> +	 * the worst:
>   	 */
>   	pagetable->asid = 0;
> +	while (!pagetable->asid)
> +		pagetable->asid = atomic_inc_return(&asid) & 0xff;
>   
>   	return &pagetable->base;
>   }
