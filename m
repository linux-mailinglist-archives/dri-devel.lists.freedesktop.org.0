Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E93216BB5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 13:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42A6C6E0FA;
	Tue,  7 Jul 2020 11:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A2FA6E0F5;
 Tue,  7 Jul 2020 11:36:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 353A41FB;
 Tue,  7 Jul 2020 04:36:46 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 889143F71E;
 Tue,  7 Jul 2020 04:36:44 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] drm/msm: Add support to create a local pagetable
To: Jordan Crouse <jcrouse@codeaurora.org>, linux-arm-msm@vger.kernel.org
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-5-jcrouse@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3feed674-5eb9-ca2f-76a7-f888f431c409@arm.com>
Date: Tue, 7 Jul 2020 12:36:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200626200414.14382-5-jcrouse@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-26 21:04, Jordan Crouse wrote:
> Add support to create a io-pgtable for use by targets that support
> per-instance pagetables.  In order to support per-instance pagetables the
> GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
> split pagetables and auxiliary domains need to be supported and enabled.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>   drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
>   drivers/gpu/drm/msm/msm_iommu.c  | 180 ++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
>   3 files changed, 195 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> index 310a31b05faa..aab121f4beb7 100644
> --- a/drivers/gpu/drm/msm/msm_gpummu.c
> +++ b/drivers/gpu/drm/msm/msm_gpummu.c
> @@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
>   	}
>   
>   	gpummu->gpu = gpu;
> -	msm_mmu_init(&gpummu->base, dev, &funcs);
> +	msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
>   
>   	return &gpummu->base;
>   }
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 1b6635504069..f455c597f76d 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -4,15 +4,192 @@
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
>   
> +#include <linux/io-pgtable.h>
>   #include "msm_drv.h"
>   #include "msm_mmu.h"
>   
>   struct msm_iommu {
>   	struct msm_mmu base;
>   	struct iommu_domain *domain;
> +	struct iommu_domain *aux_domain;
>   };
> +
>   #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
>   
> +struct msm_iommu_pagetable {
> +	struct msm_mmu base;
> +	struct msm_mmu *parent;
> +	struct io_pgtable_ops *pgtbl_ops;
> +	phys_addr_t ttbr;
> +	u32 asid;
> +};
> +
> +static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> +{
> +	return container_of(mmu, struct msm_iommu_pagetable, base);
> +}
> +
> +static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> +		size_t size)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +	size_t unmapped = 0;
> +
> +	/* Unmap the block one page at a time */
> +	while (size) {
> +		unmapped += ops->unmap(ops, iova, 4096, NULL);
> +		iova += 4096;
> +		size -= 4096;
> +	}
> +
> +	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> +
> +	return (unmapped == size) ? 0 : -EINVAL;
> +}

Remember in patch #1 when you said "Then 'domain' can be used like any 
other iommu domain to map and unmap iova addresses in the pagetable."?

This appears to be very much not that :/

Robin.

> +
> +static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> +		struct sg_table *sgt, size_t len, int prot)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> +	struct scatterlist *sg;
> +	size_t mapped = 0;
> +	u64 addr = iova;
> +	unsigned int i;
> +
> +	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +		size_t size = sg->length;
> +		phys_addr_t phys = sg_phys(sg);
> +
> +		/* Map the block one page at a time */
> +		while (size) {
> +			if (ops->map(ops, addr, phys, 4096, prot)) {
> +				msm_iommu_pagetable_unmap(mmu, iova, mapped);
> +				return -EINVAL;
> +			}
> +
> +			phys += 4096;
> +			addr += 4096;
> +			size -= 4096;
> +			mapped += 4096;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
> +{
> +	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> +
> +	free_io_pgtable_ops(pagetable->pgtbl_ops);
> +	kfree(pagetable);
> +}
> +
> +/*
> + * Given a parent device, create and return an aux domain. This will enable the
> + * TTBR0 region
> + */
> +static struct iommu_domain *msm_iommu_get_aux_domain(struct msm_mmu *parent)
> +{
> +	struct msm_iommu *iommu = to_msm_iommu(parent);
> +	struct iommu_domain *domain;
> +	int ret;
> +
> +	if (iommu->aux_domain)
> +		return iommu->aux_domain;
> +
> +	if (!iommu_dev_has_feature(parent->dev, IOMMU_DEV_FEAT_AUX))
> +		return ERR_PTR(-ENODEV);
> +
> +	domain = iommu_domain_alloc(&platform_bus_type);
> +	if (!domain)
> +		return ERR_PTR(-ENODEV);
> +
> +	ret = iommu_aux_attach_device(domain, parent->dev);
> +	if (ret) {
> +		iommu_domain_free(domain);
> +		return ERR_PTR(ret);
> +	}
> +
> +	iommu->aux_domain = domain;
> +	return domain;
> +}
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu,
> +		phys_addr_t *ttbr, int *asid)
> +{
> +	struct msm_iommu_pagetable *pagetable;
> +
> +	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> +		return -EINVAL;
> +
> +	pagetable = to_pagetable(mmu);
> +
> +	if (ttbr)
> +		*ttbr = pagetable->ttbr;
> +
> +	if (asid)
> +		*asid = pagetable->asid;
> +
> +	return 0;
> +}
> +
> +static const struct msm_mmu_funcs pagetable_funcs = {
> +		.map = msm_iommu_pagetable_map,
> +		.unmap = msm_iommu_pagetable_unmap,
> +		.destroy = msm_iommu_pagetable_destroy,
> +};
> +
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> +{
> +	static int next_asid = 16;
> +	struct msm_iommu_pagetable *pagetable;
> +	struct iommu_domain *aux_domain;
> +	struct io_pgtable_cfg cfg;
> +	int ret;
> +
> +	/* Make sure that the parent has a aux domain attached */
> +	aux_domain = msm_iommu_get_aux_domain(parent);
> +	if (IS_ERR(aux_domain))
> +		return ERR_CAST(aux_domain);
> +
> +	/* Get the pagetable configuration from the aux domain */
> +	ret = iommu_domain_get_attr(aux_domain, DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
> +	if (!pagetable)
> +		return ERR_PTR(-ENOMEM);
> +
> +	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
> +		MSM_MMU_IOMMU_PAGETABLE);
> +
> +	cfg.tlb = NULL;
> +
> +	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
> +		&cfg, aux_domain);
> +
> +	if (!pagetable->pgtbl_ops) {
> +		kfree(pagetable);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +
> +	/* Needed later for TLB flush */
> +	pagetable->parent = parent;
> +	pagetable->ttbr = cfg.arm_lpae_s1_cfg.ttbr;
> +
> +	pagetable->asid = next_asid;
> +	next_asid = (next_asid + 1)  % 255;
> +	if (next_asid < 16)
> +		next_asid = 16;
> +
> +	return &pagetable->base;
> +}
> +
>   static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>   		unsigned long iova, int flags, void *arg)
>   {
> @@ -40,6 +217,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
>   	if (iova & BIT_ULL(48))
>   		iova |= GENMASK_ULL(63, 49);
>   
> +
>   	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
>   	WARN_ON(!ret);
>   
> @@ -85,7 +263,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
>   		return ERR_PTR(-ENOMEM);
>   
>   	iommu->domain = domain;
> -	msm_mmu_init(&iommu->base, dev, &funcs);
> +	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
>   	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
>   
>   	ret = iommu_attach_device(iommu->domain, dev);
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 3a534ee59bf6..61ade89d9e48 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -17,18 +17,26 @@ struct msm_mmu_funcs {
>   	void (*destroy)(struct msm_mmu *mmu);
>   };
>   
> +enum msm_mmu_type {
> +	MSM_MMU_GPUMMU,
> +	MSM_MMU_IOMMU,
> +	MSM_MMU_IOMMU_PAGETABLE,
> +};
> +
>   struct msm_mmu {
>   	const struct msm_mmu_funcs *funcs;
>   	struct device *dev;
>   	int (*handler)(void *arg, unsigned long iova, int flags);
>   	void *arg;
> +	enum msm_mmu_type type;
>   };
>   
>   static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> -		const struct msm_mmu_funcs *funcs)
> +		const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
>   {
>   	mmu->dev = dev;
>   	mmu->funcs = funcs;
> +	mmu->type = type;
>   }
>   
>   struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> @@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
>   	mmu->handler = handler;
>   }
>   
> +struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> +
>   void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
>   		dma_addr_t *tran_error);
>   
> +
> +int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> +		int *asid);
> +
>   #endif /* __MSM_MMU_H__ */
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
