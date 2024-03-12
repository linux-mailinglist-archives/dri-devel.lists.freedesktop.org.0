Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A5F87953E
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:42:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046D310FBCA;
	Tue, 12 Mar 2024 13:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rVDSafJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9017810FBCA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Li85itgO0ita94ZvSSvDtFmxlVuDNF3anfUf5oqoxaI=; b=rVDSafJBsb1jTuT7W/HPsCRb0V
 6gTt8B2npoZ5WXgD1taceMW56q2mRj3JYvoz6DbrQCkDUU3I9koJnij0kylFnfxwYszvqt+bsuDGx
 AO4pTbF5Gb3zmXUs4mtTxcjPWSd9fuQsnoil/IeXWB5NeSoVs+9/uoY70gysSxWTBtPc5ILEFVb7s
 3P/3VxZ4NMkZnuKhCE6O1EzxYJm0aGZEanZJ9LcuNecwyY8n97njGRcZfYxSD63Fb1YI0L10bTVvO
 YGQsws6vh6LegrUCkcco7JVF8htejqEufxhtexpiaqUbNkap8kr7ZVRyofrk1gvWpVnFqNKnnSssr
 iP+E1U7Q==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rk2OE-009L1F-Ng; Tue, 12 Mar 2024 14:41:58 +0100
Message-ID: <d4f01931-6f9f-415c-999b-6f008b0d6431@igalia.com>
Date: Tue, 12 Mar 2024 13:41:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/v3d: Enable super pages
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240311100959.205545-1-mcanal@igalia.com>
 <20240311100959.205545-6-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240311100959.205545-6-mcanal@igalia.com>
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


Hi Maira,

On 11/03/2024 10:06, Maíra Canal wrote:
> The V3D MMU also supports 1MB pages, called super pages. In order to
> set a 1MB page in the MMU, we need to make sure that page table entries
> for all 4KB pages within a super page must be correctly configured.
> 
> Therefore, if the BO is larger than 2MB, we allocate it in a separate
> mountpoint that uses THP. This will allow us to create a contiguous
> memory region to create our super pages. In order to place the page
> table entries in the MMU, we iterate over the 256 4KB pages and insert
> the PTE.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_bo.c    | 19 +++++++++++++++++--
>   drivers/gpu/drm/v3d/v3d_drv.c   |  7 +++++++
>   drivers/gpu/drm/v3d/v3d_drv.h   |  6 ++++--
>   drivers/gpu/drm/v3d/v3d_gemfs.c |  6 ++++++
>   drivers/gpu/drm/v3d/v3d_mmu.c   | 24 ++++++++++++++++++++++--
>   5 files changed, 56 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index a07ede668cc1..cb8e49a33be7 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -94,6 +94,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
>   	struct v3d_bo *bo = to_v3d_bo(obj);
>   	struct sg_table *sgt;
> +	u64 align;
>   	int ret;
> 
>   	/* So far we pin the BO in the MMU for its lifetime, so use
> @@ -103,6 +104,9 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
> 
> +	bo->huge_pages = (obj->size >= SZ_2M && v3d->super_pages);
> +	align = bo->huge_pages ? SZ_1M : SZ_4K;
> +
>   	spin_lock(&v3d->mm_lock);
>   	/* Allocate the object's space in the GPU's page tables.
>   	 * Inserting PTEs will happen later, but the offset is for the
> @@ -110,7 +114,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	 */
>   	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
>   					 obj->size >> V3D_MMU_PAGE_SHIFT,
> -					 GMP_GRANULARITY >> V3D_MMU_PAGE_SHIFT, 0, 0);
> +					 align >> V3D_MMU_PAGE_SHIFT, 0, 0);
>   	spin_unlock(&v3d->mm_lock);
>   	if (ret)
>   		return ret;
> @@ -130,10 +134,21 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   			     size_t unaligned_size)
>   {
>   	struct drm_gem_shmem_object *shmem_obj;
> +	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	struct v3d_bo *bo;
> +	size_t size;
>   	int ret;
> 
> -	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +	size = PAGE_ALIGN(unaligned_size);
> +
> +	/* To avoid memory fragmentation, we only use THP if the BO is bigger
> +	 * than two Super Pages (1MB).
> +	 */
> +	if (size >= SZ_2M && v3d->super_pages)
> +		shmem_obj = drm_gem_shmem_create_with_mnt(dev, size, v3d->gemfs);
> +	else
> +		shmem_obj = drm_gem_shmem_create(dev, size);
> +
>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 3debf37e7d9b..96f4d8227407 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -36,6 +36,11 @@
>   #define DRIVER_MINOR 0
>   #define DRIVER_PATCHLEVEL 0
> 
> +static bool super_pages = true;
> +module_param_named(super_pages, super_pages, bool, 0400);
> +MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support. Note: \
> +			       To enable Super Pages, you need support to THP.");
> +
>   static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
>   			       struct drm_file *file_priv)
>   {
> @@ -308,6 +313,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	}
> 
> +	v3d->super_pages = super_pages;
> +
>   	ret = v3d_gem_init(drm);
>   	if (ret)
>   		goto dma_free;
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index d2ce8222771a..795087663739 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -17,9 +17,8 @@ struct clk;
>   struct platform_device;
>   struct reset_control;
> 
> -#define GMP_GRANULARITY (128 * 1024)
> -
>   #define V3D_MMU_PAGE_SHIFT 12
> +#define V3D_PAGE_FACTOR (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT)
> 
>   #define V3D_MAX_QUEUES (V3D_CPU + 1)
> 
> @@ -123,6 +122,7 @@ struct v3d_dev {
>   	 * tmpfs instance used for shmem backed objects
>   	 */
>   	struct vfsmount *gemfs;
> +	bool super_pages;

One not very important comment just in passing: Does v3d->super_pages == 
!!v3d->gemfs always holds at runtime? Thinking if you really need to add 
v3d->super_pages, or could just infer from v3d->gemfs, maybe via a 
wrapper or whatever pattern is used in v3d.

> 
>   	struct work_struct overflow_mem_work;
> 
> @@ -211,6 +211,8 @@ struct v3d_bo {
>   	struct list_head unref_head;
> 
>   	void *vaddr;
> +
> +	bool huge_pages;
>   };
> 
>   static inline struct v3d_bo *
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
> index 8518b7da6f73..bcde3138f555 100644
> --- a/drivers/gpu/drm/v3d/v3d_gemfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
> @@ -12,6 +12,10 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
>   	struct file_system_type *type;
>   	struct vfsmount *gemfs;
> 
> +	/* The user doesn't want support for Super Pages */
> +	if (!v3d->super_pages)
> +		goto err;
> +
>   	/*
>   	 * By creating our own shmemfs mountpoint, we can pass in
>   	 * mount flags that better match our usecase. However, we
> @@ -35,6 +39,8 @@ void v3d_gemfs_init(struct v3d_dev *v3d)
> 
>   err:
>   	v3d->gemfs = NULL;
> +	v3d->super_pages = false;
> +
>   	drm_notice(&v3d->drm,
>   		   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
>   }
> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c b/drivers/gpu/drm/v3d/v3d_mmu.c
> index 14f3af40d6f6..2f368dc2c0ca 100644
> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> @@ -89,6 +89,9 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
>   	u32 page = bo->node.start;
>   	u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
>   	struct sg_dma_page_iter dma_iter;
> +	int ctg_size = drm_prime_get_contiguous_size(shmem_obj->sgt);

Coming from the i915 background, this call looked suspicios to me. First 
of all the helper seems to be for prime import and secondly I don't know 
if v3d supports non-contigous DMA addresses even? Like can the IOMMU on 
the respective platform create such mappings? If it can not and does 
not, then the return value is just equal to object size.

Hmm no.. it cannot be mapping non-contiguous because then 
drm_prime_get_contiguous_size() could return you smaller than total 
object size and the loop below would underflow ctg_size.

So it looks it would dtrt just a bit misleading.

I also wonder if even before using THP there was no chance on this 
platform to get accidentally coalesced pages?

[Goes and looks.]

Donsn't seem so. V3d uses drm_gem_get_pages() right? And there it 
doesn't use page coalescing but just assigns them 1:1.

Maybe there is some scope to save some memory for all drivers which use 
the common helpers. See 0c40ce130e38 ("drm/i915: Trim the object sg 
table") for reference, and also code which compares the PFN as it builds 
the sg list in i915 shmem_sg_alloc_table. Although I suspect to make 
moving this approach into core drm I should really figure out a way to 
make without i915_sg_trim and allow building the sg list incrementally 
with some new scatterlist.h|c APIs.

Presumably when dma_map_sg is called on v3d platforms it also maps 1:1 
even if pages are neighbouring by chance? DMA API allows it but maybe 
platform does not?

A long digression.. to go back to original point.. Do you think you can 
just replace drm_prime_get_contiguous_size() with bo->base.size and 
everything keeps working as is, or I am missing something?

Regards,

Tvrtko

> +	u32 page_size = 0;
> +	u32 npages = 0;
> 
>   	for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
>   		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
> @@ -96,10 +99,27 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
>   		u32 pte = page_prot | page_address;
>   		u32 i;
> 
> -		BUG_ON(page_address + (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT) >=
> +		if (npages == 0) {
> +			if (ctg_size >= SZ_1M && bo->huge_pages) {
> +				page_size = SZ_1M;
> +				npages = 256;
> +			} else {
> +				page_size = SZ_4K;
> +				npages = V3D_PAGE_FACTOR;
> +			}
> +
> +			ctg_size -= npages * SZ_4K;
> +		}
> +
> +		if (page_size == SZ_1M)
> +			pte |= V3D_PTE_SUPERPAGE;
> +
> +		BUG_ON(page_address + V3D_PAGE_FACTOR >=
>   		       BIT(24));
> -		for (i = 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT; i++)
> +		for (i = 0; i < V3D_PAGE_FACTOR; i++)
>   			v3d->pt[page++] = pte + i;
> +
> +		npages -= V3D_PAGE_FACTOR;
>   	}
> 
>   	WARN_ON_ONCE(page - bo->node.start !=
> --
> 2.43.0
> 
> 
