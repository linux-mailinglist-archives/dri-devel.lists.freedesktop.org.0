Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8CA799A0B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 18:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D5510E165;
	Sat,  9 Sep 2023 16:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3D110E0BE;
 Sat,  9 Sep 2023 16:42:06 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3E59F66071A3;
 Sat,  9 Sep 2023 17:42:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694277725;
 bh=JwzW/m/z8rwilzFPxcgN9AGZ5tDx+AMNanx6fNhBaLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kTxzHEZn/VJNNJrdRKUZ0dbKEZmO4X0GfGH6iI9Amdsw0WbUq1OqQjsiEJeHGJWqv
 mg5ON2QRvL5n0LovX51Jj9AM6uyTboO8tlObFP94cDqlBMciG90eTb2qdoUnh6Pd4F
 idYQAqVKdzNX9sJHUC41N0df6ri4R++JaV3DNsV9SG+XaEFBeqeEOSQxmISGcQvXoO
 psNGrbFXFaFFr6z8+GtHnpu6DR6WVdL5P9WhQQKAGMaahR1O3lKl0lQRBVervtJX0F
 fawlZ9W1z8LHY/Qg63hWAPgdRnU5tMaafw1VucH1Egna2rU5sg1i2hCx3iqF7uoo8G
 3hjnp1y14WY+Q==
Date: Sat, 9 Sep 2023 17:42:02 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 7/8] drm/panfrost: Implement generic DRM object RSS
 reporting function
Message-ID: <vullvbu3eepdci5dzotppoydeoyfwebpf7e6wle3ubwf6sdrg6@v6luzft4no4r>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
 <20230905184533.959171-8-adrian.larumbe@collabora.com>
 <20230906100130.530c4e4a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230906100130.530c4e4a@collabora.com>
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

On 06.09.2023 10:01, Boris Brezillon wrote:
>On Tue,  5 Sep 2023 19:45:23 +0100
>Adrián Larumbe <adrian.larumbe@collabora.com> wrote:
>
>> BO's RSS is updated every time new pages are allocated on demand and mapped
>> for the object at GPU page fault's IRQ handler, but only for heap buffers.
>> The reason this is unnecessary for non-heap buffers is that they are mapped
>> onto the GPU's VA space and backed by physical memory in their entirety at
>> BO creation time.
>> 
>> This calculation is unnecessary for imported PRIME objects, since heap
>> buffers cannot be exported by our driver, and the actual BO RSS size is the
>> one reported in its attached dmabuf structure.
>> 
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> ---
>>  drivers/gpu/drm/panfrost/panfrost_gem.c | 14 ++++++++++++++
>>  drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +++++
>>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 12 ++++++++----
>>  3 files changed, 27 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
>> index 7d8f83d20539..cb92c0ed7615 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
>> @@ -208,6 +208,19 @@ static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj
>>  	return res;
>>  }
>>  
>> +static size_t panfrost_gem_rss(struct drm_gem_object *obj)
>> +{
>> +	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
>> +
>> +	if (bo->is_heap)
>> +		return bo->heap_rss_size;
>> +	else if (bo->base.pages) {
>> +		WARN_ON(bo->heap_rss_size);
>> +		return bo->base.base.size;
>> +	} else
>> +		return 0;
>
>Nit: please add brackets on all conditional blocks, even if only the
>second one needs it.
>
>> +}
>> +
>>  static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>>  	.free = panfrost_gem_free_object,
>>  	.open = panfrost_gem_open,
>> @@ -220,6 +233,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
>>  	.vunmap = drm_gem_shmem_object_vunmap,
>>  	.mmap = drm_gem_shmem_object_mmap,
>>  	.status = panfrost_gem_status,
>> +	.rss = panfrost_gem_rss,
>>  	.vm_ops = &drm_gem_shmem_vm_ops,
>>  };
>>  
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> index ad2877eeeccd..13c0a8149c3a 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> @@ -36,6 +36,11 @@ struct panfrost_gem_object {
>>  	 */
>>  	atomic_t gpu_usecount;
>>  
>> +	/*
>> +	 * Object chunk size currently mapped onto physical memory
>> +	 */
>> +	size_t heap_rss_size;
>> +
>>  	bool noexec		:1;
>>  	bool is_heap		:1;
>>  };
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index d54d4e7b2195..67c206124781 100644
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
>> @@ -447,6 +449,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>>  	pgoff_t page_offset;
>>  	struct sg_table *sgt;
>>  	struct page **pages;
>> +	size_t mapped_size;
>>  
>>  	bomapping = addr_to_mapping(pfdev, as, addr);
>>  	if (!bomapping)
>> @@ -518,10 +521,11 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>>  	if (ret)
>>  		goto err_map;
>>  
>> -	mmu_map_sg(pfdev, bomapping->mmu, addr,
>> -		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
>> +	mapped_size = mmu_map_sg(pfdev, bomapping->mmu, addr,
>> +				 IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
>>  
>>  	bomapping->active = true;
>> +	bo->heap_rss_size += mapped_size;
>
>The alloc-on-fault granularity is set static (2MB), so no need to
>make mmu_map_sg() return the mapped size, we can just do += SZ_2M if
>things worked.

At the moment mmu_map_sg is treated as though it always succeeds in mapping the
page. Would it be alright if I changed it so that we take into account the
unlikely case that ops->map_pages might fail?
Something like this: https://gitlab.collabora.com/-/snippets/323

>>  
>>  	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
>>  
