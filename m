Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5F078F646
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 02:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4810E705;
	Fri,  1 Sep 2023 00:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143CE10E703;
 Fri,  1 Sep 2023 00:03:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A0B96607292;
 Fri,  1 Sep 2023 01:03:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693526606;
 bh=iCUSPizh14+ZkYRUCdzmM024pzOBDxZURBI9Ri9QyoY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YrO+9EVV6EdpWk/HvJqwQgVAhmb9GIx4svRbHwiFWWSZBLEJbHi1ERe4oKMhz8ZJZ
 dHmwIDlo8araVKAm7sTfCl2Yu0o0Kbng0XBadT7JhaEPhug+PfqJh91vk9m0SbP3e+
 857OB6IYPhnAwSZQj0/OAlVvrieVT0ozzqBYJ/Cfu8rwDOttmvKdlRVdBiiZOdr7xj
 vN+iiiLgY+yF6l/Ss/V6meXVNeMIxqwZzxraPxqVAfA6/zrV01375vU5OG13JwAoJ7
 OvfpgqK9VEFrwCqtoSYLJ2Kj+k6Uk6+y5FYU4+Tn9d99vbEMbxBFvMUaPTpzhfoYjL
 h16vE/wRhVnrA==
Date: Fri, 1 Sep 2023 01:03:23 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 5/6] drm/panfrost: Implement generic DRM object RSS
 reporting function
Message-ID: <jev3jdwfkdoqbdhdgapfyb2fghpmw4lzhozi6m2ylfvsofwstv@4uj624i74i3e>
References: <20230824013604.466224-1-adrian.larumbe@collabora.com>
 <20230824013604.466224-6-adrian.larumbe@collabora.com>
 <20230830125210.3d1172db@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230830125210.3d1172db@collabora.com>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30.08.2023 12:52, Boris Brezillon wrote:
>On Thu, 24 Aug 2023 02:34:48 +0100
>Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
>> BO's RSS is updated every time new pages are allocated and mapped for the
>> object, either in its entirety at creation time for non-heap buffers, or
>> else on demand for heap buffers at GPU page fault's IRQ handler.
>> 
>> Same calculations had to be done for imported PRIME objects, since backing
>> storage for it might have already been allocated by the exporting driver.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_gem.c | 22 ++++++++++++++++++++++
>>  drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +++++
>>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 16 +++++++++++-----
>>  3 files changed, 38 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
>> index aea16b0e4dda..c6bd1f16a6d4 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
>> @@ -206,6 +206,17 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
>>  
>>  	return res;
>>  }
>> +
>> +size_t panfrost_gem_rss(struct drm_gem_object *obj)
>> +{
>> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
>> +
>> +	if (!bo->base.pages)
>> +		return 0;
>> +
>> +	return bo->rss_size;
>> +}
>> +
>>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>>  	.free = panfrost_gem_free_object,
>>  	.open = panfrost_gem_open,
>> @@ -218,6 +229,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>>  	.vunmap = drm_gem_shmem_object_vunmap,
>>  	.mmap = drm_gem_shmem_object_mmap,
>>  	.status = panfrost_gem_status,
>> +	.rss = panfrost_gem_rss,
>>  	.vm_ops = &drm_gem_shmem_vm_ops,
>>  };
>>  
>> @@ -274,13 +286,23 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
>>  {
>>  	struct drm_gem_object *obj;
>>  	struct panfrost_gem_object *bo;
>> +	struct scatterlist *sgl;
>> +	unsigned int count;
>> +	size_t total = 0;
>>  
>>  	obj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
>>  	if (IS_ERR(obj))
>>  		return ERR_CAST(obj);
>>  
>> +	for_each_sgtable_dma_sg(sgt, sgl, count) {
>> +		size_t len = sg_dma_len(sgl);
>> +
>> +		total += len;
>> +	}
>
>Why not simply have bo->rss_size = obj->size here? Not sure I see a
>reason to not trust dma_buf?

Can PRIME-imported BO's ever be heap objects?

>> +
>>  	bo = to_panfrost_bo(obj);
>>  	bo->noexec = true;
>> +	bo->rss_size = total;
>>  
>>  	return obj;
>>  }
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> index e06f7ceb8f73..e2a7c46403c7 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> @@ -36,6 +36,11 @@ struct panfrost_gem_object {
>>  	 */
>>  	atomic_t gpu_usecount;
>>  
>> +	/*
>> +	 * Object chunk size currently mapped onto physical memory
>> +	 */
>> +	size_t rss_size;
>> +
>>  	bool noexec		:1;
>>  	bool is_heap		:1;
>>  	bool is_purgable	:1;
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index c0123d09f699..e03a5a9da06f 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -285,17 +285,19 @@ static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
>>  	pm_runtime_put_autosuspend(pfdev->dev);
>>  }
>>  
>> -static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
>> +static size_t mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
>>  		      u64 iova, int prot, struct sg_table *sgt)
>>  {
>>  	unsigned int count;
>>  	struct scatterlist *sgl;
>>  	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
>>  	u64 start_iova = iova;
>> +	size_t total = 0;
>>  
>>  	for_each_sgtable_dma_sg(sgt, sgl, count) {
>>  		unsigned long paddr = sg_dma_address(sgl);
>>  		size_t len = sg_dma_len(sgl);
>> +		total += len;
>>  
>>  		dev_dbg(pfdev->dev, "map: as=%d, iova=%llx, paddr=%lx, len=%zx", mmu->as, iova, paddr, len);
>>  
>> @@ -315,7 +317,7 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
>>  
>>  	panfrost_mmu_flush_range(pfdev, mmu, start_iova, iova - start_iova);
>>  
>> -	return 0;
>> +	return total;
>>  }
>>  
>>  int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>> @@ -326,6 +328,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>>  	struct sg_table *sgt;
>>  	int prot = IOMMU_READ | IOMMU_WRITE;
>> +	size_t mapped_size;
>>  
>>  	if (WARN_ON(mapping->active))
>>  		return 0;
>> @@ -337,9 +340,10 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>>  	if (WARN_ON(IS_ERR(sgt)))
>>  		return PTR_ERR(sgt);
>>  
>> -	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
>> +	mapped_size = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
>>  		   prot, sgt);
>>  	mapping->active = true;
>> +	bo->rss_size += mapped_size;
>
>Actually, the GEM might be resident even before panfrost_mmu_map() is
>called: as soon as drm_gem_shmem_get_pages[_locked]() is called, it's
>resident (might get evicted after that point though). That means any
>mmap coming from userspace will make the buffer resident too. I know
>we're automatically mapping GEMs to the GPU VM in panfrost_gem_open(),
>so it makes no difference, but I think I'd prefer if we keep ->rss_size
>for heap BOs only (we probably want to rename it heap_rss_size) and
>then have
>
>
>	if (bo->is_heap)
>		return bo->heap_rss_size;
>	else if (bo->base.pages)
>		return bo->base.base.size;
>	else
>		return 0;
>
>in panfrost_gem_rss().
>
>>  
>>  	return 0;
>>  }
>> @@ -447,6 +451,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>>  	pgoff_t page_offset;
>>  	struct sg_table *sgt;
>>  	struct page **pages;
>> +	size_t mapped_size;
>>  
>>  	bomapping = addr_to_mapping(pfdev, as, addr);
>>  	if (!bomapping)
>> @@ -518,10 +523,11 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>>  	if (ret)
>>  		goto err_map;
>>  
>> -	mmu_map_sg(pfdev, bomapping->mmu, addr,
>> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
>> +	mapped_size = mmu_map_sg(pfdev, bomapping->mmu, addr,
>> +				 IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
>>  
>>  	bomapping->active = true;
>> +	bo->rss_size += mapped_size;
>>  
>>  	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
