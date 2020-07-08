Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F372190DA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 21:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7346E91A;
	Wed,  8 Jul 2020 19:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A876E91B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 19:36:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594236965; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=LC9f74TU7sRenomNvH9Jl50KN/ZMUzl3hwIz8duJSio=;
 b=FDcldE6d3bzjntXepzfTQ5fu21Xz0Ln8mzbkTa7N025B+WrqoiO02YQmdTubtoTDXOdW/YQF
 uWk9hc21dElbI62OqGkAqE73zmSntVZXyjAjfc/FYiAlkhofpmanQEYeTYPu8NCvsl1L8If0
 gQT+50fsG+7WqHd0aZlf+CkOQ8k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f062014a19992ac65744533 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 19:35:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D18F4C433CB; Wed,  8 Jul 2020 19:35:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 24DA9C433CB;
 Wed,  8 Jul 2020 19:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 24DA9C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Wed, 8 Jul 2020 13:35:41 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 4/6] drm/msm: Add support to create a local pagetable
Message-ID: <20200708193541.GB21059@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 John Stultz <john.stultz@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
References: <20200626200414.14382-1-jcrouse@codeaurora.org>
 <20200626200414.14382-5-jcrouse@codeaurora.org>
 <3feed674-5eb9-ca2f-76a7-f888f431c409@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3feed674-5eb9-ca2f-76a7-f888f431c409@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 12:36:42PM +0100, Robin Murphy wrote:
> On 2020-06-26 21:04, Jordan Crouse wrote:
> >Add support to create a io-pgtable for use by targets that support
> >per-instance pagetables.  In order to support per-instance pagetables the
> >GPU SMMU device needs to have the qcom,adreno-smmu compatible string and
> >split pagetables and auxiliary domains need to be supported and enabled.
> >
> >Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> >---
> >
> >  drivers/gpu/drm/msm/msm_gpummu.c |   2 +-
> >  drivers/gpu/drm/msm/msm_iommu.c  | 180 ++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/msm/msm_mmu.h    |  16 ++-
> >  3 files changed, 195 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/msm/msm_gpummu.c b/drivers/gpu/drm/msm/msm_gpummu.c
> >index 310a31b05faa..aab121f4beb7 100644
> >--- a/drivers/gpu/drm/msm/msm_gpummu.c
> >+++ b/drivers/gpu/drm/msm/msm_gpummu.c
> >@@ -102,7 +102,7 @@ struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu)
> >  	}
> >  	gpummu->gpu = gpu;
> >-	msm_mmu_init(&gpummu->base, dev, &funcs);
> >+	msm_mmu_init(&gpummu->base, dev, &funcs, MSM_MMU_GPUMMU);
> >  	return &gpummu->base;
> >  }
> >diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> >index 1b6635504069..f455c597f76d 100644
> >--- a/drivers/gpu/drm/msm/msm_iommu.c
> >+++ b/drivers/gpu/drm/msm/msm_iommu.c
> >@@ -4,15 +4,192 @@
> >   * Author: Rob Clark <robdclark@gmail.com>
> >   */
> >+#include <linux/io-pgtable.h>
> >  #include "msm_drv.h"
> >  #include "msm_mmu.h"
> >  struct msm_iommu {
> >  	struct msm_mmu base;
> >  	struct iommu_domain *domain;
> >+	struct iommu_domain *aux_domain;
> >  };
> >+
> >  #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
> >+struct msm_iommu_pagetable {
> >+	struct msm_mmu base;
> >+	struct msm_mmu *parent;
> >+	struct io_pgtable_ops *pgtbl_ops;
> >+	phys_addr_t ttbr;
> >+	u32 asid;
> >+};
> >+
> >+static struct msm_iommu_pagetable *to_pagetable(struct msm_mmu *mmu)
> >+{
> >+	return container_of(mmu, struct msm_iommu_pagetable, base);
> >+}
> >+
> >+static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
> >+		size_t size)
> >+{
> >+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> >+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> >+	size_t unmapped = 0;
> >+
> >+	/* Unmap the block one page at a time */
> >+	while (size) {
> >+		unmapped += ops->unmap(ops, iova, 4096, NULL);
> >+		iova += 4096;
> >+		size -= 4096;
> >+	}
> >+
> >+	iommu_flush_tlb_all(to_msm_iommu(pagetable->parent)->domain);
> >+
> >+	return (unmapped == size) ? 0 : -EINVAL;
> >+}
> 
> Remember in patch #1 when you said "Then 'domain' can be used like any other
> iommu domain to map and unmap iova addresses in the pagetable."?
> 
> This appears to be very much not that :/
 
The code changed but the commit log stayed the same.  I'll reword.

Jordan

> Robin.
> 
> >+
> >+static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
> >+		struct sg_table *sgt, size_t len, int prot)
> >+{
> >+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> >+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
> >+	struct scatterlist *sg;
> >+	size_t mapped = 0;
> >+	u64 addr = iova;
> >+	unsigned int i;
> >+
> >+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> >+		size_t size = sg->length;
> >+		phys_addr_t phys = sg_phys(sg);
> >+
> >+		/* Map the block one page at a time */
> >+		while (size) {
> >+			if (ops->map(ops, addr, phys, 4096, prot)) {
> >+				msm_iommu_pagetable_unmap(mmu, iova, mapped);
> >+				return -EINVAL;
> >+			}
> >+
> >+			phys += 4096;
> >+			addr += 4096;
> >+			size -= 4096;
> >+			mapped += 4096;
> >+		}
> >+	}
> >+
> >+	return 0;
> >+}
> >+
> >+static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
> >+{
> >+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
> >+
> >+	free_io_pgtable_ops(pagetable->pgtbl_ops);
> >+	kfree(pagetable);
> >+}
> >+
> >+/*
> >+ * Given a parent device, create and return an aux domain. This will enable the
> >+ * TTBR0 region
> >+ */
> >+static struct iommu_domain *msm_iommu_get_aux_domain(struct msm_mmu *parent)
> >+{
> >+	struct msm_iommu *iommu = to_msm_iommu(parent);
> >+	struct iommu_domain *domain;
> >+	int ret;
> >+
> >+	if (iommu->aux_domain)
> >+		return iommu->aux_domain;
> >+
> >+	if (!iommu_dev_has_feature(parent->dev, IOMMU_DEV_FEAT_AUX))
> >+		return ERR_PTR(-ENODEV);
> >+
> >+	domain = iommu_domain_alloc(&platform_bus_type);
> >+	if (!domain)
> >+		return ERR_PTR(-ENODEV);
> >+
> >+	ret = iommu_aux_attach_device(domain, parent->dev);
> >+	if (ret) {
> >+		iommu_domain_free(domain);
> >+		return ERR_PTR(ret);
> >+	}
> >+
> >+	iommu->aux_domain = domain;
> >+	return domain;
> >+}
> >+
> >+int msm_iommu_pagetable_params(struct msm_mmu *mmu,
> >+		phys_addr_t *ttbr, int *asid)
> >+{
> >+	struct msm_iommu_pagetable *pagetable;
> >+
> >+	if (mmu->type != MSM_MMU_IOMMU_PAGETABLE)
> >+		return -EINVAL;
> >+
> >+	pagetable = to_pagetable(mmu);
> >+
> >+	if (ttbr)
> >+		*ttbr = pagetable->ttbr;
> >+
> >+	if (asid)
> >+		*asid = pagetable->asid;
> >+
> >+	return 0;
> >+}
> >+
> >+static const struct msm_mmu_funcs pagetable_funcs = {
> >+		.map = msm_iommu_pagetable_map,
> >+		.unmap = msm_iommu_pagetable_unmap,
> >+		.destroy = msm_iommu_pagetable_destroy,
> >+};
> >+
> >+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
> >+{
> >+	static int next_asid = 16;
> >+	struct msm_iommu_pagetable *pagetable;
> >+	struct iommu_domain *aux_domain;
> >+	struct io_pgtable_cfg cfg;
> >+	int ret;
> >+
> >+	/* Make sure that the parent has a aux domain attached */
> >+	aux_domain = msm_iommu_get_aux_domain(parent);
> >+	if (IS_ERR(aux_domain))
> >+		return ERR_CAST(aux_domain);
> >+
> >+	/* Get the pagetable configuration from the aux domain */
> >+	ret = iommu_domain_get_attr(aux_domain, DOMAIN_ATTR_PGTABLE_CFG, &cfg);
> >+	if (ret)
> >+		return ERR_PTR(ret);
> >+
> >+	pagetable = kzalloc(sizeof(*pagetable), GFP_KERNEL);
> >+	if (!pagetable)
> >+		return ERR_PTR(-ENOMEM);
> >+
> >+	msm_mmu_init(&pagetable->base, parent->dev, &pagetable_funcs,
> >+		MSM_MMU_IOMMU_PAGETABLE);
> >+
> >+	cfg.tlb = NULL;
> >+
> >+	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
> >+		&cfg, aux_domain);
> >+
> >+	if (!pagetable->pgtbl_ops) {
> >+		kfree(pagetable);
> >+		return ERR_PTR(-ENOMEM);
> >+	}
> >+
> >+
> >+	/* Needed later for TLB flush */
> >+	pagetable->parent = parent;
> >+	pagetable->ttbr = cfg.arm_lpae_s1_cfg.ttbr;
> >+
> >+	pagetable->asid = next_asid;
> >+	next_asid = (next_asid + 1)  % 255;
> >+	if (next_asid < 16)
> >+		next_asid = 16;
> >+
> >+	return &pagetable->base;
> >+}
> >+
> >  static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >  		unsigned long iova, int flags, void *arg)
> >  {
> >@@ -40,6 +217,7 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
> >  	if (iova & BIT_ULL(48))
> >  		iova |= GENMASK_ULL(63, 49);
> >+
> >  	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
> >  	WARN_ON(!ret);
> >@@ -85,7 +263,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
> >  		return ERR_PTR(-ENOMEM);
> >  	iommu->domain = domain;
> >-	msm_mmu_init(&iommu->base, dev, &funcs);
> >+	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
> >  	iommu_set_fault_handler(domain, msm_fault_handler, iommu);
> >  	ret = iommu_attach_device(iommu->domain, dev);
> >diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> >index 3a534ee59bf6..61ade89d9e48 100644
> >--- a/drivers/gpu/drm/msm/msm_mmu.h
> >+++ b/drivers/gpu/drm/msm/msm_mmu.h
> >@@ -17,18 +17,26 @@ struct msm_mmu_funcs {
> >  	void (*destroy)(struct msm_mmu *mmu);
> >  };
> >+enum msm_mmu_type {
> >+	MSM_MMU_GPUMMU,
> >+	MSM_MMU_IOMMU,
> >+	MSM_MMU_IOMMU_PAGETABLE,
> >+};
> >+
> >  struct msm_mmu {
> >  	const struct msm_mmu_funcs *funcs;
> >  	struct device *dev;
> >  	int (*handler)(void *arg, unsigned long iova, int flags);
> >  	void *arg;
> >+	enum msm_mmu_type type;
> >  };
> >  static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
> >-		const struct msm_mmu_funcs *funcs)
> >+		const struct msm_mmu_funcs *funcs, enum msm_mmu_type type)
> >  {
> >  	mmu->dev = dev;
> >  	mmu->funcs = funcs;
> >+	mmu->type = type;
> >  }
> >  struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
> >@@ -41,7 +49,13 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> >  	mmu->handler = handler;
> >  }
> >+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
> >+
> >  void msm_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
> >  		dma_addr_t *tran_error);
> >+
> >+int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
> >+		int *asid);
> >+
> >  #endif /* __MSM_MMU_H__ */
> >

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
