Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5851708297
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 15:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725C210E0A1;
	Thu, 18 May 2023 13:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FF0810E0A1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 13:25:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F2041FB;
 Thu, 18 May 2023 06:25:45 -0700 (PDT)
Received: from [10.57.82.163] (unknown [10.57.82.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CFDC3F7BD;
 Thu, 18 May 2023 06:24:57 -0700 (PDT)
Message-ID: <33cf3d3e-1f3c-0f92-aff1-2441e4bfb793@arm.com>
Date: Thu, 18 May 2023 14:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/7] drm/apu: Add support of IOMMU
Content-Language: en-GB
To: Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-5-abailon@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230517145237.295461-5-abailon@baylibre.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-17 15:52, Alexandre Bailon wrote:
> Some APU devices are behind an IOMMU.
> For some of these devices, we can't use DMA API because
> they use static addresses so we have to manually use
> IOMMU API to correctly map the buffers.

Except you still need to use the DMA for the sake of cache coherency and 
any other aspects :(

> This adds support of IOMMU.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> ---
>   drivers/gpu/drm/apu/apu_drv.c      |   4 +
>   drivers/gpu/drm/apu/apu_gem.c      | 174 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/apu/apu_internal.h |  16 +++
>   drivers/gpu/drm/apu/apu_sched.c    |  28 +++++
>   include/uapi/drm/apu_drm.h         |  12 +-
>   5 files changed, 233 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/apu/apu_drv.c b/drivers/gpu/drm/apu/apu_drv.c
> index b6bd340b2bc8..a0dce785a02a 100644
> --- a/drivers/gpu/drm/apu/apu_drv.c
> +++ b/drivers/gpu/drm/apu/apu_drv.c
> @@ -23,6 +23,10 @@ static const struct drm_ioctl_desc ioctls[] = {
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(APU_GEM_DEQUEUE, ioctl_gem_dequeue,
>   			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(APU_GEM_IOMMU_MAP, ioctl_gem_iommu_map,
> +			  DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(APU_GEM_IOMMU_UNMAP, ioctl_gem_iommu_unmap,
> +			  DRM_RENDER_ALLOW),
>   };
>   
>   DEFINE_DRM_GEM_DMA_FOPS(apu_drm_ops);
> diff --git a/drivers/gpu/drm/apu/apu_gem.c b/drivers/gpu/drm/apu/apu_gem.c
> index 0e7b3b27942c..0a91363754c5 100644
> --- a/drivers/gpu/drm/apu/apu_gem.c
> +++ b/drivers/gpu/drm/apu/apu_gem.c
> @@ -2,6 +2,9 @@
>   //
>   // Copyright 2020 BayLibre SAS
>   
> +#include <linux/iommu.h>
> +#include <linux/iova.h>
> +
>   #include <drm/drm_gem_dma_helper.h>
>   
>   #include <uapi/drm/apu_drm.h>
> @@ -42,6 +45,7 @@ int ioctl_gem_new(struct drm_device *dev, void *data,
>   	 */
>   	apu_obj->size = args->size;
>   	apu_obj->offset = 0;
> +	apu_obj->iommu_refcount = 0;
>   	mutex_init(&apu_obj->mutex);
>   
>   	ret = drm_gem_handle_create(file_priv, gem_obj, &args->handle);
> @@ -54,3 +58,173 @@ int ioctl_gem_new(struct drm_device *dev, void *data,
>   
>   	return 0;
>   }
> +
> +void apu_bo_iommu_unmap(struct apu_drm *apu_drm, struct apu_gem_object *obj)
> +{
> +	int iova_pfn;
> +	int i;
> +
> +	if (!obj->iommu_sgt)
> +		return;
> +
> +	mutex_lock(&obj->mutex);
> +	obj->iommu_refcount--;
> +	if (obj->iommu_refcount) {
> +		mutex_unlock(&obj->mutex);
> +		return;
> +	}
> +
> +	iova_pfn = PHYS_PFN(obj->iova);

Using mm layer operations on IOVAs looks wrong. In practice I don't 
think it's ultimately harmful, other than potentially making less 
efficient use of IOVA space if the CPU page size is larger than the 
IOMMU page size, but it's still a bad code smell when you're using an 
IOVA abstraction that is deliberately decoupled from CPU pages.

> +	for (i = 0; i < obj->iommu_sgt->nents; i++) {
> +		iommu_unmap(apu_drm->domain, PFN_PHYS(iova_pfn),
> +			    PAGE_ALIGN(obj->iommu_sgt->sgl[i].length));
> +		iova_pfn += PHYS_PFN(PAGE_ALIGN(obj->iommu_sgt->sgl[i].length));

You can unmap a set of IOVA-contiguous mappings as a single range with 
one call.

> +	}
> +
> +	sg_free_table(obj->iommu_sgt);
> +	kfree(obj->iommu_sgt);
> +
> +	free_iova(&apu_drm->iovad, PHYS_PFN(obj->iova));
> +	mutex_unlock(&obj->mutex);
> +}
> +
> +static struct sg_table *apu_get_sg_table(struct drm_gem_object *obj)
> +{
> +	if (obj->funcs)
> +		return obj->funcs->get_sg_table(obj);
> +	return NULL;
> +}
> +
> +int apu_bo_iommu_map(struct apu_drm *apu_drm, struct drm_gem_object *obj)
> +{
> +	struct apu_gem_object *apu_obj = to_apu_bo(obj);
> +	struct scatterlist *sgl;
> +	phys_addr_t phys;
> +	int total_buf_space;
> +	int iova_pfn;
> +	int iova;
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&apu_obj->mutex);
> +	apu_obj->iommu_refcount++;
> +	if (apu_obj->iommu_refcount != 1) {
> +		mutex_unlock(&apu_obj->mutex);
> +		return 0;
> +	}
> +
> +	apu_obj->iommu_sgt = apu_get_sg_table(obj);
> +	if (IS_ERR(apu_obj->iommu_sgt)) {
> +		mutex_unlock(&apu_obj->mutex);
> +		return PTR_ERR(apu_obj->iommu_sgt);
> +	}
> +
> +	total_buf_space = obj->size;
> +	iova_pfn = alloc_iova_fast(&apu_drm->iovad,
> +				   total_buf_space >> PAGE_SHIFT,
> +				   apu_drm->iova_limit_pfn, true);

If you need things mapped at specific addresses like the commit message 
claims, the DMA IOVA allocator is a terrible tool for the job. DRM 
already has its own more flexible abstraction for address space 
management in the form of drm_mm, so as a DRM driver it would seem a lot 
more sensible to use one of those.

And even if you could justify using this allocator, I can't imagine 
there's any way you'd need the _fast version (further illustrated by the 
fact that you're freeing the IOVAs wrongly for that).

> +	apu_obj->iova = PFN_PHYS(iova_pfn);
> +
> +	if (!iova_pfn) {
> +		dev_err(apu_drm->dev, "Failed to allocate iova address\n");
> +		mutex_unlock(&apu_obj->mutex);
> +		return -ENOMEM;
> +	}
> +
> +	iova = apu_obj->iova;
> +	sgl = apu_obj->iommu_sgt->sgl;
> +	for (i = 0; i < apu_obj->iommu_sgt->nents; i++) {
> +		phys = page_to_phys(sg_page(&sgl[i]));
> +		ret =
> +		    iommu_map(apu_drm->domain, PFN_PHYS(iova_pfn), phys,
> +			      PAGE_ALIGN(sgl[i].length), IOMMU_READ | IOMMU_WRITE,
> +			      GFP_KERNEL);
> +		if (ret) {
> +			dev_err(apu_drm->dev, "Failed to iommu map\n");
> +			free_iova(&apu_drm->iovad, iova_pfn);
> +			mutex_unlock(&apu_obj->mutex);
> +			return ret;
> +		}
> +		iova += sgl[i].offset + sgl[i].length;
> +		iova_pfn += PHYS_PFN(PAGE_ALIGN(sgl[i].length));

This looks a lot like it should just be iommu_map_sg(). Also it makes me 
suspicious of the relationship between obj->size and the sgtable - if 
the size is already pre-calculated to include any required padding then 
why can't the caller just provide aligned SG segments in the first 
place? Conversely if it's the original un-padded size, then any padding 
you *do* add at this point means you're going to overrun the allocated 
IOVA space.

> +	}
> +	mutex_unlock(&apu_obj->mutex);
> +
> +	return 0;
> +}
> +
> +int ioctl_gem_iommu_map(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv)
> +{
> +	struct apu_drm *apu_drm = dev->dev_private;
> +	struct drm_apu_gem_iommu_map *args = data;
> +	struct drm_gem_object **bos;
> +	void __user *bo_handles;
> +	u64 *das;
> +	int ret;
> +	int i;
> +
> +	if (!apu_drm->domain)
> +		return -ENODEV;
> +
> +	das = kvmalloc_array(args->bo_handle_count, sizeof(*das), GFP_KERNEL);

Does anything prevent userspace passing random numbers and being able to 
cause arbitrarily large allocations of unaccounted kernel memory here?

> +	if (!das)
> +		return -ENOMEM;
> +
> +	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
> +	ret = drm_gem_objects_lookup(file_priv, bo_handles,
> +				     args->bo_handle_count, &bos);
> +	if (ret) {
> +		kvfree(das);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < args->bo_handle_count; i++) {
> +		ret = apu_bo_iommu_map(apu_drm, bos[i]);
> +		if (ret) {
> +			/* TODO: handle error */

Yes, that would be a good thing to do.

> +			break;
> +		}
> +		das[i] = to_apu_bo(bos[i])->iova + to_apu_bo(bos[i])->offset;
> +	}
> +
> +	if (copy_to_user((void *)args->bo_device_addresses, das,
> +			 args->bo_handle_count * sizeof(u64))) {
> +		ret = -EFAULT;
> +		DRM_DEBUG("Failed to copy device addresses\n");
> +		goto out;
> +	}
> +
> +out:
> +	kvfree(das);
> +	kvfree(bos);
> +
> +	return 0;
> +}
> +
> +int ioctl_gem_iommu_unmap(struct drm_device *dev, void *data,
> +			  struct drm_file *file_priv)
> +{
> +	struct apu_drm *apu_drm = dev->dev_private;
> +	struct drm_apu_gem_iommu_map *args = data;
> +	struct drm_gem_object **bos;
> +	void __user *bo_handles;
> +	int ret;
> +	int i;
> +
> +	if (!apu_drm->domain)
> +		return -ENODEV;
> +
> +	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
> +	ret = drm_gem_objects_lookup(file_priv, bo_handles,
> +				     args->bo_handle_count, &bos);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < args->bo_handle_count; i++)
> +		apu_bo_iommu_unmap(apu_drm, to_apu_bo(bos[i]));
> +
> +	kvfree(bos);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/apu/apu_internal.h b/drivers/gpu/drm/apu/apu_internal.h
> index 021a3efdedf2..ea4183f3fb15 100644
> --- a/drivers/gpu/drm/apu/apu_internal.h
> +++ b/drivers/gpu/drm/apu/apu_internal.h
> @@ -2,6 +2,9 @@
>   #ifndef __APU_INTERNAL_H__
>   #define __APU_INTERNAL_H__
>   
> +#include <linux/iommu.h>
> +#include <linux/iova.h>
> +
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_dma_helper.h>
>   #include <drm/gpu_scheduler.h>
> @@ -9,7 +12,10 @@
>   struct apu_gem_object {
>   	struct drm_gem_dma_object base;
>   	struct mutex mutex;
> +	struct sg_table *iommu_sgt;
> +	int iommu_refcount;
>   	size_t size;
> +	u32 iova;

Really? "Common infrastructure that could be re-used to support many 
accelerators", in 2023, that still assumes 32-bit addressing?

>   	u32 offset;
>   };
>   
> @@ -35,6 +41,10 @@ struct apu_drm {
>   	struct drm_device base;
>   	struct device *dev;
>   
> +	struct iommu_domain *domain;

Oh, nothing ever allocates this domain or attaches to it, so this is all 
dead code :(

> +	struct iova_domain iovad;
> +	int iova_limit_pfn;

(and nothing initialises these either)

> +
>   	struct list_head cores;
>   	struct list_head node;
>   
> @@ -165,12 +175,18 @@ struct apu_gem_object *to_apu_bo(struct drm_gem_object *obj);
>   struct drm_gem_object *apu_gem_create_object(struct drm_device *dev,
>   					     size_t size);
>   
> +int apu_bo_iommu_map(struct apu_drm *apu_drm, struct drm_gem_object *obj);
> +void apu_bo_iommu_unmap(struct apu_drm *apu_drm, struct apu_gem_object *obj);
>   int ioctl_gem_new(struct drm_device *dev, void *data,
>   		  struct drm_file *file_priv);
>   int ioctl_gem_user_new(struct drm_device *dev, void *data,
>   		       struct drm_file *file_priv);
>   struct dma_buf *apu_gem_prime_export(struct drm_gem_object *gem,
>   				     int flags);
> +int ioctl_gem_iommu_map(struct drm_device *dev, void *data,
> +			struct drm_file *file_priv);
> +int ioctl_gem_iommu_unmap(struct drm_device *dev, void *data,
> +			  struct drm_file *file_priv);
>   int ioctl_gem_queue(struct drm_device *dev, void *data,
>   		    struct drm_file *file_priv);
>   int ioctl_gem_dequeue(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/apu/apu_sched.c b/drivers/gpu/drm/apu/apu_sched.c
> index 13b6fbd00bd8..716d4b7f2d55 100644
> --- a/drivers/gpu/drm/apu/apu_sched.c
> +++ b/drivers/gpu/drm/apu/apu_sched.c
> @@ -117,6 +117,8 @@ static void apu_job_cleanup(struct kref *ref)
>   			struct apu_gem_object *apu_obj;
>   
>   			apu_obj = to_apu_bo(job->bos[i]);
> +			if (job->apu->domain)
> +				apu_bo_iommu_unmap(job->apu, apu_obj);
>   			drm_gem_object_put(job->bos[i]);
>   		}
>   
> @@ -397,6 +399,7 @@ static int apu_lookup_bos(struct drm_device *dev, struct drm_file *file_priv,
>   			  struct drm_apu_gem_queue *args, struct apu_job *job)
>   {
>   	void __user *bo_handles;
> +	unsigned int i;
>   	int ret;
>   
>   	job->bo_count = args->bo_handle_count;
> @@ -413,6 +416,31 @@ static int apu_lookup_bos(struct drm_device *dev, struct drm_file *file_priv,
>   	bo_handles = (void __user *)(uintptr_t) args->bo_handles;
>   	ret = drm_gem_objects_lookup(file_priv, bo_handles,
>   				     job->bo_count, &job->bos);
> +	if (ret)
> +		return ret;
> +
> +	if (!job->apu->domain)
> +		return 0;
> +
> +	for (i = 0; i < job->bo_count; i++) {
> +		ret = apu_bo_iommu_map(job->apu, job->bos[i]);
> +		if (ret)
> +			goto err_iommu_map;
> +	}
> +
> +	return ret;
> +
> +err_iommu_map:
> +	kvfree(job->implicit_fences);
> +	for (i = 0; i < job->bo_count; i++) {
> +		struct apu_gem_object *apu_obj;
> +
> +		apu_obj = to_apu_bo(job->bos[i]);
> +		if (job->apu->domain)

If the domain *did* ever exist, but could suddenly disappear at any 
point after you've decided to go ahead and start mapping things into it, 
then there is a heck of a lot of sychronisation missing from this whole 
infrastructure.

Thanks,
Robin.

> +			apu_bo_iommu_unmap(job->apu, apu_obj);
> +		drm_gem_object_put(job->bos[i]);
> +	}
> +	kvfree(job->bos);
>   
>   	return ret;
>   }
> diff --git a/include/uapi/drm/apu_drm.h b/include/uapi/drm/apu_drm.h
> index c47000097040..0ecc739d8aed 100644
> --- a/include/uapi/drm/apu_drm.h
> +++ b/include/uapi/drm/apu_drm.h
> @@ -41,6 +41,12 @@ struct drm_apu_gem_dequeue {
>   	__u64 data;
>   };
>   
> +struct drm_apu_gem_iommu_map {
> +	__u64 bo_handles;
> +	__u32 bo_handle_count;
> +	__u64 bo_device_addresses;
> +};
> +
>   struct apu_job_event {
>   	struct drm_event base;
>   	__u32 out_sync;
> @@ -57,12 +63,16 @@ struct drm_apu_state {
>   #define DRM_APU_GEM_NEW			0x01
>   #define DRM_APU_GEM_QUEUE		0x02
>   #define DRM_APU_GEM_DEQUEUE		0x03
> -#define DRM_APU_NUM_IOCTLS		0x04
> +#define DRM_APU_GEM_IOMMU_MAP		0x04
> +#define DRM_APU_GEM_IOMMU_UNMAP		0x05
> +#define DRM_APU_NUM_IOCTLS		0x06
>   
>   #define DRM_IOCTL_APU_STATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_STATE, struct drm_apu_state)
>   #define DRM_IOCTL_APU_GEM_NEW		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_NEW, struct drm_apu_gem_new)
>   #define DRM_IOCTL_APU_GEM_QUEUE		DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_QUEUE, struct drm_apu_gem_queue)
>   #define DRM_IOCTL_APU_GEM_DEQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_DEQUEUE, struct drm_apu_gem_dequeue)
> +#define DRM_IOCTL_APU_GEM_IOMMU_MAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_IOMMU_MAP, struct drm_apu_gem_iommu_map)
> +#define DRM_IOCTL_APU_GEM_IOMMU_UNMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_APU_GEM_IOMMU_UNMAP, struct drm_apu_gem_iommu_map)
>   
>   #if defined(__cplusplus)
>   }
