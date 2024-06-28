Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDA91B9D2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 10:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F59910E0E8;
	Fri, 28 Jun 2024 08:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/YX3j5j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D844010E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719563362; x=1751099362;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FhnmmwRsgt7q9OpUqfd3kxwu+nTktaxW9bMtPJ2FQU4=;
 b=a/YX3j5jIaOPp8/3Px2OHxFwT9KMkHDn1Bm4tUEMMtk6tHvFxczZDffg
 QxLRVNSUb5g2NUE81aUHOW2h74da8orQO+w7N59fcEeR0Hk7e+mAznaVt
 iBhu54+GodW0NDQb3MtKduyu94jnIbD8ealXLCsRL9gUmtjA7HuUwx+2c
 2r7vKWrbd5it51IDnUEOKL7cSercvfbiPZ38hViZ391kQTbf3ZduyWFUy
 jQwOZjrp30YxjAWJLCgoVldsCV5Nb9jtMCN0cmN4IfnBfaL3q8pE9KNiX
 Ah4sLUbDUuDO0x7/0KIYtDGJAhCkYb8U7nDuIDiCKnTEFyrmLANWJa2Yq g==;
X-CSE-ConnectionGUID: cpT8rwCsShqG5K4v2EjPDw==
X-CSE-MsgGUID: vmApuENrTgeH/gIdz9N3RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16867419"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="16867419"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 01:29:21 -0700
X-CSE-ConnectionGUID: zrjDGM4cTFOB7XZjM3TJ0A==
X-CSE-MsgGUID: oy92/Yr/QYuzmi6T5Mdjuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="49580626"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.125.248.220])
 ([10.125.248.220])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 01:29:16 -0700
Message-ID: <1a62d729-878d-4c26-9619-43514c90aa35@linux.intel.com>
Date: Fri, 28 Jun 2024 16:29:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 15/21] iommu/vt-d: Add helper to allocate paging domain
To: Yi Liu <yi.l.liu@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-16-baolu.lu@linux.intel.com>
 <86dbf286-bb0b-4beb-b26f-a74562b0ace8@intel.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <86dbf286-bb0b-4beb-b26f-a74562b0ace8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2024/6/28 13:42, Yi Liu wrote:
> On 2024/6/10 16:55, Lu Baolu wrote:
>> The domain_alloc_user operation is currently implemented by allocating a
>> paging domain using iommu_domain_alloc(). This is because it needs to 
>> fully
>> initialize the domain before return. Add a helper to do this to avoid 
>> using
>> iommu_domain_alloc().
>>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c | 87 +++++++++++++++++++++++++++++++++----
>>   1 file changed, 78 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index 2e9811bf2a4e..ccde5f5972e4 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -3633,6 +3633,79 @@ static struct iommu_domain blocking_domain = {
>>       }
>>   };
>> +static int iommu_superpage_capability(struct intel_iommu *iommu, bool 
>> first_stage)
>> +{
>> +    if (!intel_iommu_superpage)
>> +        return 0;
>> +
>> +    if (first_stage)
>> +        return cap_fl1gp_support(iommu->cap) ? 2 : 1;
>> +
>> +    return fls(cap_super_page_val(iommu->cap));
>> +}
>> +
>> +static struct dmar_domain *paging_domain_alloc(struct device *dev, 
>> bool first_stage)
>> +{
>> +    struct device_domain_info *info = dev_iommu_priv_get(dev);
>> +    struct intel_iommu *iommu = info->iommu;
>> +    struct dmar_domain *domain;
>> +    int addr_width;
>> +
>> +    domain = kzalloc(sizeof(*domain), GFP_KERNEL);
>> +    if (!domain)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    INIT_LIST_HEAD(&domain->devices);
>> +    INIT_LIST_HEAD(&domain->dev_pasids);
>> +    INIT_LIST_HEAD(&domain->cache_tags);
>> +    spin_lock_init(&domain->lock);
>> +    spin_lock_init(&domain->cache_lock);
>> +    xa_init(&domain->iommu_array);
>> +
>> +    domain->nid = dev_to_node(dev);
>> +    domain->has_iotlb_device = info->ats_enabled;
>> +    domain->use_first_level = first_stage;
>> +
>> +    /* calculate the address width */
>> +    addr_width = agaw_to_width(iommu->agaw);
>> +    if (addr_width > cap_mgaw(iommu->cap))
>> +        addr_width = cap_mgaw(iommu->cap);
>> +    domain->gaw = addr_width;
>> +    domain->agaw = iommu->agaw;
>> +    domain->max_addr = __DOMAIN_MAX_ADDR(addr_width);
>> +
>> +    /* iommu memory access coherency */
>> +    domain->iommu_coherency = iommu_paging_structure_coherency(iommu);
>> +
>> +    /* pagesize bitmap */
>> +    domain->domain.pgsize_bitmap = SZ_4K;
>> +    domain->iommu_superpage = iommu_superpage_capability(iommu, 
>> first_stage);
>> +    domain->domain.pgsize_bitmap |= domain_super_pgsize_bitmap(domain);
>> +
>> +    /*
>> +     * IOVA aperture: First-level translation restricts the 
>> input-address
>> +     * to a canonical address (i.e., address bits 63:N have the same 
>> value
>> +     * as address bit [N-1], where N is 48-bits with 4-level paging and
>> +     * 57-bits with 5-level paging). Hence, skip bit [N-1].
>> +     */
>> +    domain->domain.geometry.force_aperture = true;
>> +    domain->domain.geometry.aperture_start = 0;
>> +    if (first_stage)
>> +        domain->domain.geometry.aperture_end = 
>> __DOMAIN_MAX_ADDR(domain->gaw - 1);
>> +    else
>> +        domain->domain.geometry.aperture_end = 
>> __DOMAIN_MAX_ADDR(domain->gaw);
>> +
>> +    /* always allocate the top pgd */
>> +    domain->pgd = iommu_alloc_page_node(domain->nid, GFP_KERNEL);
>> +    if (!domain->pgd) {
>> +        kfree(domain);
>> +        return ERR_PTR(-ENOMEM);
>> +    }
>> +    domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
>> +
>> +    return domain;
>> +}
>> +
>>   static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
>>   {
>>       struct dmar_domain *dmar_domain;
>> @@ -3695,15 +3768,11 @@ intel_iommu_domain_alloc_user(struct device 
>> *dev, u32 flags,
>>       if (user_data || (dirty_tracking && !ssads_supported(iommu)))
>>           return ERR_PTR(-EOPNOTSUPP);
>> -    /*
>> -     * domain_alloc_user op needs to fully initialize a domain before
>> -     * return, so uses iommu_domain_alloc() here for simple.
>> -     */
>> -    domain = iommu_domain_alloc(dev->bus);
>> -    if (!domain)
>> -        return ERR_PTR(-ENOMEM);
>> -
>> -    dmar_domain = to_dmar_domain(domain);
>> +    /* Do not use first stage for user domain translation. */
>> +    dmar_domain = paging_domain_alloc(dev, false);
> 
> this is not an apple-to-apple replacement yet. You need to set the type,
> owner and domain->ops as well.

Yes. You are right. I will add below lines.

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d51f840715e5..c5d9c2283977 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3732,6 +3732,9 @@ intel_iommu_domain_alloc_user(struct device *dev, 
u32 flags,
         if (IS_ERR(dmar_domain))
                 return ERR_CAST(dmar_domain);
         domain = &dmar_domain->domain;
+       domain->type = IOMMU_DOMAIN_UNMANAGED;
+       domain->owner = &intel_iommu_ops;
+       domain->ops = intel_iommu_ops.default_domain_ops;

         if (nested_parent) {
                 dmar_domain->nested_parent = true;

Best regards,
baolu
