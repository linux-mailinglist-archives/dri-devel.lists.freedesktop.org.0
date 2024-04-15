Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC848A4D46
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266B9112489;
	Mon, 15 Apr 2024 11:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qBS9zh06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBA4112475
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8UeoaBPJ/IycLEqyUNwYB2ozawL8638hyzQZUc0AWto=; b=qBS9zh06hOebsJrnZCgmcl8Chk
 qG382JJ8GJwlpb7350AUNshdAmHC2eXsHYefz1kYSjMacBXqj+fwqzPLGtkAdVqrOdZdJ3YWQODvE
 POuEyFTBWQMJj7t9voO01ME+NB2yGD7F8+r8pseXul89oCXOEfaGGfK+evuv0tUH+Wl/E6l6lPSeF
 SeHREV78Yti7wkv8RccTrk/lp7KV3hCFRiu8pKJzQasJpsWa/T7fQokPdy/2mWuzMTpVCpZVNYK3f
 cq4mAvsOMSk5m8klH+IJW33qyuukT6fFlwqKtraKXKXi0JvVI3SuCcAmiJnM1Ib6ixSjuo/CwMx4D
 vECr62bQ==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwJiS-004iyM-Nh; Mon, 15 Apr 2024 12:37:36 +0200
Message-ID: <096295d3-72a0-4e2d-884f-eab5526e5dd6@igalia.com>
Date: Mon, 15 Apr 2024 11:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/v3d: Enable big and super pages
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240405201753.1176914-1-mcanal@igalia.com>
 <20240405201753.1176914-7-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240405201753.1176914-7-mcanal@igalia.com>
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


On 05/04/2024 19:29, Maíra Canal wrote:
> The V3D MMU also supports 64KB and 1MB pages, called big and super pages,
> respectively. In order to set a 64KB page or 1MB page in the MMU, we need
> to make sure that page table entries for all 4KB pages within a big/super
> page must be correctly configured.
> 
> In order to create a big/super page, we need a contiguous memory region.
> That's why we use a separate mountpoint with THP enabled. In order to
> place the page table entries in the MMU, we iterate over the 16 4KB pages
> (for big pages) or 256 4KB pages (for super pages) and insert the PTE.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_bo.c    | 21 +++++++++++++--
>   drivers/gpu/drm/v3d/v3d_drv.c   |  8 ++++++
>   drivers/gpu/drm/v3d/v3d_drv.h   |  2 ++
>   drivers/gpu/drm/v3d/v3d_gemfs.c |  6 +++++
>   drivers/gpu/drm/v3d/v3d_mmu.c   | 46 ++++++++++++++++++++++++++-------
>   5 files changed, 71 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 79e31c5299b1..cfe82232886a 100644
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
> @@ -103,6 +104,15 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
> 
> +	if (!v3d->super_pages)
> +		align = SZ_4K;
> +	else if (obj->size >= SZ_1M)
> +		align = SZ_1M;
> +	else if (obj->size >= SZ_64K)
> +		align = SZ_64K;
> +	else
> +		align = SZ_4K;
> +
>   	spin_lock(&v3d->mm_lock);
>   	/* Allocate the object's space in the GPU's page tables.
>   	 * Inserting PTEs will happen later, but the offset is for the
> @@ -110,7 +120,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	 */
>   	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
>   					 obj->size >> V3D_MMU_PAGE_SHIFT,
> -					 SZ_4K >> V3D_MMU_PAGE_SHIFT, 0, 0);
> +					 align >> V3D_MMU_PAGE_SHIFT, 0, 0);
>   	spin_unlock(&v3d->mm_lock);
>   	if (ret)
>   		return ret;
> @@ -130,10 +140,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   			     size_t unaligned_size)
>   {
>   	struct drm_gem_shmem_object *shmem_obj;
> +	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	struct v3d_bo *bo;
>   	int ret;
> 
> -	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +	/* Let the user opt out of allocating the BOs with THP */
> +	if (v3d->super_pages)
> +		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> +							  v3d->gemfs);
> +	else
> +		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +
>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 3debf37e7d9b..3dbd29560be4 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -36,6 +36,12 @@
>   #define DRIVER_MINOR 0
>   #define DRIVER_PATCHLEVEL 0
> 
> +static bool super_pages = true;
> +module_param_named(super_pages, super_pages, bool, 0400);
> +MODULE_PARM_DESC(super_pages, "Enable/Disable Super Pages support. Note: \
> +			       To enable Super Pages, you need support to \
> +			       enable THP.");

Maybe not expose the modparam unless CONFIG_TRANSPARENT_HUGEPAGE is 
enabled? Then you wouldn't have to explain the dependency in the 
description.

> +
>   static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
>   			       struct drm_file *file_priv)
>   {
> @@ -308,6 +314,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   	}
> 
> +	v3d->super_pages = super_pages;
> +
>   	ret = v3d_gem_init(drm);
>   	if (ret)
>   		goto dma_free;
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 17236ee23490..0a7aacf51164 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -18,6 +18,7 @@ struct platform_device;
>   struct reset_control;
> 
>   #define V3D_MMU_PAGE_SHIFT 12
> +#define V3D_PAGE_FACTOR (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT)
> 
>   #define V3D_MAX_QUEUES (V3D_CPU + 1)
> 
> @@ -121,6 +122,7 @@ struct v3d_dev {
>   	 * tmpfs instance used for shmem backed objects
>   	 */
>   	struct vfsmount *gemfs;
> +	bool super_pages;

You could probably get away with not having to add this new bool by 
basing the runtime checks of v3d->gemfs != NULL. In v3d_gemfs_init you 
would access the global module param variable directly, after the THP 
kconfig check. Unless you see a downside it always sounds attractive to 
me to add less.

> 
>   	struct work_struct overflow_mem_work;
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
> index 31cf5bd11e39..7ee55b32c36e 100644
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
> index 14f3af40d6f6..48a240c44a22 100644
> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
> @@ -25,9 +25,16 @@
>    * superpage bit set.
>    */
>   #define V3D_PTE_SUPERPAGE BIT(31)
> +#define V3D_PTE_BIGPAGE BIT(30)
>   #define V3D_PTE_WRITEABLE BIT(29)
>   #define V3D_PTE_VALID BIT(28)
> 
> +static bool v3d_mmu_is_aligned(u32 page, u32 pte, size_t alignment)
> +{
> +	return IS_ALIGNED(page, alignment >> V3D_MMU_PAGE_SHIFT) &&
> +		IS_ALIGNED(pte, alignment >> V3D_MMU_PAGE_SHIFT);
> +}
> +
>   static int v3d_mmu_flush_all(struct v3d_dev *v3d)
>   {
>   	int ret;
> @@ -88,18 +95,37 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
>   	struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
>   	u32 page = bo->node.start;

I had some thoughts whether 'page' could have a more descriptive name, 
so it is clear when reading the code what memory space is what. GPU VA 
vs DMA PA I mean. But then I figured out bo->node.start is a page frame, 
not an address, so I don't really now what naming to suggest.

>   	u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
> -	struct sg_dma_page_iter dma_iter;
> +	struct scatterlist *sgl;
> +	unsigned int count;
> 
> -	for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
> -		dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
> +	for_each_sgtable_dma_sg(shmem_obj->sgt, sgl, count) {
> +		dma_addr_t dma_addr = sg_dma_address(sgl);
>   		u32 page_address = dma_addr >> V3D_MMU_PAGE_SHIFT;

For this one I was wondering if variable name such as pfn would be more 
descriptive. Because address for me suggests byte units and then later 
when you have page_address++ I get startled. But maybe it is just me and 
maybe in v3d page_address is already established that can be page frame 
numbers. Up to you.

> -		u32 pte = page_prot | page_address;
> -		u32 i;
> -
> -		BUG_ON(page_address + (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT) >=
> -		       BIT(24));
> -		for (i = 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT; i++)
> -			v3d->pt[page++] = pte + i;
> +		size_t len = sg_dma_len(sgl);

Sg_dma_len appears to return unsigned int so you may want to align with 
that, *if* 64-bit builds are a thing for v3d at least.

> +		u32 i, page_size = 0;

And then I would make these two unsigned int too, it is just 
bikeshedding really but if like that then the below "len -= page_size" 
would be matching types and widths regardless of the 32- vs 64-bit build.

> +
> +		while (len > 0) {
> +			u32 pte = page_prot | page_address;
> +

Page_prot and page_size could be moved to this scope.

> +			BUG_ON(page_address + V3D_PAGE_FACTOR >= BIT(24));
> +
> +			if (len >= SZ_1M && v3d_mmu_is_aligned(page, pte, SZ_1M)) {
> +				page_size = SZ_1M;
> +				pte |= V3D_PTE_SUPERPAGE;
> +			} else if (len >= SZ_64K && v3d_mmu_is_aligned(page, pte, SZ_64K)) {
> +				page_size = SZ_64K;
> +				pte |= V3D_PTE_BIGPAGE;
> +			} else {
> +				page_size = SZ_4K;
> +			}

s/pte/page_address/? As it is it works fine, but just because I find it 
a bit confusing to check the PTE bits for alignment.

> +
> +			for (i = 0; i < page_size >> V3D_MMU_PAGE_SHIFT; i++) {
> +				v3d->pt[page++] = pte + i;
> +				page_address++;
> +			}
> +
> +			len -= page_size;
> +		}
>   	}
> 
>   	WARN_ON_ONCE(page - bo->node.start !=
> --
> 2.44.0
> 
> 

As you can see all my comments are either optional bike sheds or small 
tweaks we can discuss. The main logic and ideas look solid.

Oh there is one more thing to dicsuss.. strictly speaking you could 
split this patch into two. First one would just implement the 
v3d_mmu_insert_ptes and connected changes. Because theoretically some of 
the new code could be triggered by chance even without the 
THP/gemfs/alignment restrictions.

Then the last patch in the series would be the one which adds the BO 
creation and gemfs changes.

Or even three patches since you could split up the BO creation to be 
standalone, *if* the plan to just use v3d->gemfs as criteria works out, 
given that v3d->gemfs was added earlier in the series already.

To sum up, 6/6 could be replaced with:

6/8: Support big/super pages when writting out PTEs
7/8: Use gemfs/THP in BO creation if available
8/8: Add modparam for turning off super pages

Regards,

Tvrtko
