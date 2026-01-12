Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31485D13DE8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 17:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4510E409;
	Mon, 12 Jan 2026 16:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BCEF10E409
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 16:03:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51905497;
 Mon, 12 Jan 2026 08:03:16 -0800 (PST)
Received: from [10.57.11.182] (unknown [10.57.11.182])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D07413F59E;
 Mon, 12 Jan 2026 08:03:19 -0800 (PST)
Message-ID: <00c89251-5d2e-4a50-a99b-cf09cde85264@arm.com>
Date: Mon, 12 Jan 2026 16:03:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-6-boris.brezillon@collabora.com>
 <f55ecaa7-0695-4cdc-94f4-4769e1b72bb0@arm.com>
 <20260112151714.4461d045@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260112151714.4461d045@fedora>
Content-Type: text/plain; charset=UTF-8
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

On 12/01/2026 14:17, Boris Brezillon wrote:
> On Mon, 12 Jan 2026 12:06:17 +0000
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 09/01/2026 13:07, Boris Brezillon wrote:
>>> While drm_gem_shmem_object does most of the job we need it to do, the
>>> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
>>> gets in the way of BO reclaim. There has been attempts to address
>>> that [1], but in the meantime, new gem_shmem users were introduced
>>> (accel drivers), and some of them manually free some of these resources.
>>> This makes things harder to control/sanitize/validate.
>>>
>>> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
>>> and forcing gem_shmem users to go through new gem_shmem helpers when they
>>> need manual control of some sort, and I believe this is a dead end if
>>> we don't force users to follow some stricter rules through carefully
>>> designed helpers, because there will always be one user doing crazy things
>>> with gem_shmem_object internals, which ends up tripping out the common
>>> helpers when they are called.
>>>
>>> The consensus we reached was that we would be better off forking
>>> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
>>> current transition tries to minimize the changes, but there are still
>>> some aspects that are different, the main one being that we no longer
>>> have a pages_use_count, and pages stays around until the GEM object is
>>> destroyed (or when evicted once we've added a shrinker). The sgt also
>>> no longer retains pages. This is losely based on how msm does things by
>>> the way.  
>>
>> From a reviewing perspective it's a little tricky trying to match up the
>> implementation to shmem because of these changes. I don't know how
>> difficult it would be to split the changes to a patch which literally
>> copies (with renames) from shmem, followed by simplifying out the parts
>> we don't want.
> 
> It's a bit annoying as the new implementation is not based on shmem at
> all, but if you think it helps the review, I can try what you're
> suggesting. I mean, I'm not convinced it will be significantly easier
> to review with this extra step, since the new logic is different enough
> (especially when it comes to resource refcounting) that it needs a
> careful review anyway (which you started doing here).

I wasn't sure how much you had originally based it on shmem. I noticed
some comments were copied over and in some places it was easy to match
up. But in others it's much less clear.

If you haven't actually started from a direct copy of shmem then it's
probably not going to be much clearer doing that as an extra step. It's
just in places it looked like you had.

>>
>> Of course the main issue is going to be getting some proper testing of
>> this (especially with the shrinker added).
> 
> For the shrinker, the best I can propose for now is extending the
> IGT tests I've added. For close-to-real-usecases testing of the shmem ->
> custom transition (this commit), making sure the g610 jobs we have in
> mesa CI still passes is a start. If you have other ideas, I'd be happy
> to give them a try.

Sadly I don't have any good suggestions. I haven't found the time to
work on improving my own test setup.

>>
>>>
>>> If there's any interest in sharing code (probably with msm, since the
>>> panthor shrinker is going to be losely based on the msm implementation),
>>> we can always change gears and do that once we have everything
>>> working/merged.
>>>
>>> [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panthor/Kconfig         |   1 -
>>>  drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
>>>  drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
>>>  drivers/gpu/drm/panthor/panthor_gem.c   | 696 ++++++++++++++++++++----
>>>  drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
>>>  drivers/gpu/drm/panthor/panthor_mmu.c   |  49 +-
>>>  drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
>>>  7 files changed, 666 insertions(+), 174 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
>>> index 55b40ad07f3b..911e7f4810c3 100644
>>> --- a/drivers/gpu/drm/panthor/Kconfig
>>> +++ b/drivers/gpu/drm/panthor/Kconfig
>>> @@ -8,7 +8,6 @@ config DRM_PANTHOR
>>>  	depends on MMU
>>>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>>>  	select DRM_EXEC
>>> -	select DRM_GEM_SHMEM_HELPER
>>>  	select DRM_GPUVM
>>>  	select DRM_SCHED
>>>  	select IOMMU_IO_PGTABLE_LPAE
>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 52c27a60c84a..90e9abc22d9e 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -19,6 +19,7 @@
>>>  #include <drm/drm_debugfs.h>
>>>  #include <drm/drm_drv.h>
>>>  #include <drm/drm_exec.h>
>>> +#include <drm/drm_file.h>
>>>  #include <drm/drm_ioctl.h>
>>>  #include <drm/drm_print.h>
>>>  #include <drm/drm_syncobj.h>
>>> @@ -1457,7 +1458,7 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
>>>  	args->create_flags = bo->flags;
>>>  
>>>  	args->extra_flags = 0;
>>> -	if (drm_gem_is_imported(&bo->base.base))
>>> +	if (drm_gem_is_imported(&bo->base))
>>>  		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
>>>  
>>>  	drm_gem_object_put(obj);
>>> @@ -1671,8 +1672,7 @@ static const struct drm_driver panthor_drm_driver = {
>>>  	.major = 1,
>>>  	.minor = 7,
>>>  
>>> -	.gem_create_object = panthor_gem_create_object,
>>> -	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>>> +	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
>>>  	.gem_prime_import = panthor_gem_prime_import,
>>>  #ifdef CONFIG_DEBUG_FS
>>>  	.debugfs_init = panthor_debugfs_init,
>>> @@ -1822,3 +1822,4 @@ module_exit(panthor_exit);
>>>  MODULE_AUTHOR("Panthor Project Developers");
>>>  MODULE_DESCRIPTION("Panthor DRM Driver");
>>>  MODULE_LICENSE("Dual MIT/GPL");
>>> +MODULE_IMPORT_NS("DMA_BUF");
>>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>>> index a64ec8756bed..f135cf2130b8 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>>> @@ -627,7 +627,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>>>  		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
>>>  		struct panthor_gem_object *bo;
>>>  		u32 vm_map_flags = 0;
>>> -		struct sg_table *sgt;
>>>  		u64 va = hdr.va.start;
>>>  
>>>  		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
>>> @@ -665,11 +664,12 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>>>  		panthor_fw_init_section_mem(ptdev, section);
>>>  
>>>  		bo = to_panthor_bo(section->mem->obj);
>>> -		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>>> -		if (IS_ERR(sgt))
>>> -			return PTR_ERR(sgt);
>>>  
>>> -		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>>> +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
>>> +		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
>>> +			return -EINVAL;
>>> +
>>> +		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
>>>  	}
>>>  
>>>  	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
>>> @@ -729,8 +729,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>>>  			continue;
>>>  
>>>  		panthor_fw_init_section_mem(ptdev, section);
>>> -		sgt = drm_gem_shmem_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
>>> -		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
>>> +
>>> +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
>>> +		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
>>> +		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
>>>  			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>>>  	}
>>>  }
>>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
>>> index 4b3d82f001d8..0e52c7a07c87 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
>>> @@ -8,9 +8,11 @@
>>>  #include <linux/dma-mapping.h>
>>>  #include <linux/err.h>
>>>  #include <linux/slab.h>
>>> +#include <linux/vmalloc.h>
>>>  
>>>  #include <drm/drm_debugfs.h>
>>>  #include <drm/drm_file.h>
>>> +#include <drm/drm_prime.h>
>>>  #include <drm/drm_print.h>
>>>  #include <drm/panthor_drm.h>
>>>  
>>> @@ -44,7 +46,7 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
>>>  
>>>  static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>>>  {
>>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev,
>>>  						    struct panthor_device, base);
>>>  
>>>  	bo->debugfs.creator.tgid = current->group_leader->pid;
>>> @@ -57,7 +59,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>>>  
>>>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
>>>  {
>>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev,
>>>  						    struct panthor_device, base);
>>>  
>>>  	if (list_empty(&bo->debugfs.node))
>>> @@ -80,9 +82,9 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
>>>  #endif
>>>  
>>>  static bool
>>> -should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
>>> +should_map_wc(struct panthor_gem_object *bo)
>>>  {
>>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev, struct panthor_device, base);
>>> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
>>>  
>>>  	/* We can't do uncached mappings if the device is coherent,
>>>  	 * because the zeroing done by the shmem layer at page allocation
>>> @@ -112,6 +114,208 @@ should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
>>>  	return true;
>>>  }
>>>  
>>> +static void
>>> +panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
>>> +{
>>> +	if (!bo->backing.pages)
>>> +		return;
>>> +
>>> +	drm_gem_put_pages(&bo->base, bo->backing.pages, true, false);
>>> +	bo->backing.pages = NULL;
>>> +}
>>> +
>>> +static int
>>> +panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +
>>> +	if (bo->backing.pages)
>>> +		return 0;
>>> +
>>> +	bo->backing.pages = drm_gem_get_pages(&bo->base);
>>> +	if (IS_ERR(bo->backing.pages)) {
>>> +		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
>>> +			    bo->backing.pages);
>>> +		return PTR_ERR(bo->backing.pages);  
>>
>> This leaves bo->backing.pages set to the error value, which means a
>> future call to panthor_gem_backing_get_pages_locked() for the same
>> object will return success. Unless there's some 'poisoning' that I
>> haven't spotted this looks like a bug.
> 
> That's a bug, I'll fix it.
> 
>>
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	int ret;
>>> +
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
>>> +
>>> +	if (refcount_inc_not_zero(&bo->backing.pin_count))
>>> +		return 0;
>>> +
>>> +	ret = panthor_gem_backing_get_pages_locked(bo);
>>> +	if (!ret)
>>> +		refcount_set(&bo->backing.pin_count, 1);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
>>> +
>>> +	/* We don't release anything when pin_count drops to zero.
>>> +	 * Pages stay there until an explicit cleanup is requested.
>>> +	 */
>>> +	if (!refcount_dec_not_one(&bo->backing.pin_count))
>>> +		refcount_set(&bo->backing.pin_count, 0);  
>>
>> Why not just refcount_dec()?
> 
> Because refcount_dec() complains when it's passed a value that's less
> than 2. The rational being that you need to do something special
> (release resources) when you reach zero. In our case we don't, because
> pages are lazily reclaimed, so we just set the counter back to zero.

Ah, yes I'd misread the "old <= 1" check as "old < 1". Hmm, I dislike it
because it's breaking the atomicity - if another thread does a increment
between the two operations then we lose a reference count.

It does make me think that perhaps the refcount APIs are not designed
for this case and perhaps we should just use atomics directly.

>>
>>> +}
>>> +
>>> +static void
>>> +panthor_gem_dev_map_cleanup(struct panthor_gem_object *bo)
>>> +{
>>> +	if (!bo->dmap.sgt)
>>> +		return;
>>> +
>>> +	dma_unmap_sgtable(drm_dev_dma_dev(bo->base.dev), bo->dmap.sgt, DMA_BIDIRECTIONAL, 0);
>>> +	sg_free_table(bo->dmap.sgt);
>>> +	kfree(bo->dmap.sgt);
>>> +	bo->dmap.sgt = NULL;
>>> +}
>>> +
>>> +static struct sg_table *
>>> +panthor_gem_dev_map_get_sgt_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	struct sg_table *sgt;
>>> +	int ret;
>>> +
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +
>>> +	if (bo->dmap.sgt)
>>> +		return bo->dmap.sgt;
>>> +
>>> +	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	/* Pages stay around after they've been allocated. At least that stands
>>> +	 * until we add a shrinker.
>>> +	 */
>>> +	ret = panthor_gem_backing_get_pages_locked(bo);
>>> +	if (ret)
>>> +		return ERR_PTR(ret);
>>> +
>>> +	sgt = drm_prime_pages_to_sg(bo->base.dev, bo->backing.pages,
>>> +				    bo->base.size >> PAGE_SHIFT);
>>> +	if (IS_ERR(sgt))
>>> +		return sgt;
>>> +
>>> +	/* Map the pages for use by the h/w. */
>>> +	ret = dma_map_sgtable(drm_dev_dma_dev(bo->base.dev), sgt, DMA_BIDIRECTIONAL, 0);
>>> +	if (ret)
>>> +		goto err_free_sgt;
>>> +
>>> +	bo->dmap.sgt = sgt;
>>> +	return sgt;
>>> +
>>> +err_free_sgt:
>>> +	sg_free_table(sgt);
>>> +	kfree(sgt);
>>> +	return ERR_PTR(ret);
>>> +}
>>> +
>>> +struct sg_table *
>>> +panthor_gem_get_dev_sgt(struct panthor_gem_object *bo)
>>> +{
>>> +	struct sg_table *sgt;
>>> +
>>> +	dma_resv_lock(bo->base.resv, NULL);
>>> +	sgt = panthor_gem_dev_map_get_sgt_locked(bo);
>>> +	dma_resv_unlock(bo->base.resv);
>>> +
>>> +	return sgt;
>>> +}
>>> +
>>> +static void
>>> +panthor_gem_vmap_cleanup(struct panthor_gem_object *bo)
>>> +{
>>> +	if (!bo->cmap.vaddr)
>>> +		return;
>>> +
>>> +	vunmap(bo->cmap.vaddr);
>>> +	bo->cmap.vaddr = NULL;
>>> +	panthor_gem_backing_unpin_locked(bo);
>>> +}
>>> +
>>> +static int
>>> +panthor_gem_prep_for_cpu_map_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	if (should_map_wc(bo)) {
>>> +		struct sg_table *sgt;
>>> +
>>> +		sgt = panthor_gem_dev_map_get_sgt_locked(bo);
>>> +		if (IS_ERR(sgt))
>>> +			return PTR_ERR(sgt);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void *
>>> +panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	pgprot_t prot = PAGE_KERNEL;
>>> +	void *vaddr;
>>> +	int ret;
>>> +
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +
>>> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
>>> +		drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);
>>> +		return bo->cmap.vaddr;
>>> +	}
>>> +
>>> +	ret = panthor_gem_backing_pin_locked(bo);
>>> +	if (ret)
>>> +		return ERR_PTR(ret);
>>> +
>>> +	ret = panthor_gem_prep_for_cpu_map_locked(bo);
>>> +	if (ret)
>>> +		return ERR_PTR(ret);
>>> +
>>> +	if (should_map_wc(bo))
>>> +		prot = pgprot_writecombine(prot);
>>> +
>>> +	vaddr = vmap(bo->backing.pages, bo->base.size >> PAGE_SHIFT, VM_MAP, prot);
>>> +	if (!vaddr) {
>>> +		ret = -ENOMEM;
>>> +		goto err_unpin;
>>> +	}
>>> +
>>> +	bo->cmap.vaddr = vaddr;
>>> +	refcount_set(&bo->cmap.vaddr_use_count, 1);
>>> +	return vaddr;
>>> +
>>> +err_unpin:
>>> +	panthor_gem_backing_unpin_locked(bo);
>>> +	return ERR_PTR(ret);
>>> +}
>>> +
>>> +static void
>>> +panthor_gem_vmap_put_locked(struct panthor_gem_object *bo)
>>> +{
>>> +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
>>> +		return;
>>> +
>>> +	if (refcount_dec_not_one(&bo->cmap.vaddr_use_count))
>>> +		return;
>>> +
>>> +	refcount_set(&bo->cmap.vaddr_use_count, 0);
>>> +	panthor_gem_vmap_cleanup(bo);
>>> +}
>>> +
>>>  static void panthor_gem_free_object(struct drm_gem_object *obj)
>>>  {
>>>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> @@ -127,8 +331,17 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>>>  
>>>  	mutex_destroy(&bo->label.lock);
>>>  
>>> -	drm_gem_free_mmap_offset(&bo->base.base);
>>> -	drm_gem_shmem_free(&bo->base);
>>> +	if (drm_gem_is_imported(obj)) {
>>> +		drm_prime_gem_destroy(obj, bo->dmap.sgt);
>>> +	} else {
>>> +		panthor_gem_vmap_cleanup(bo);  
>>
>> panthor_gem_vmap_cleanup() calls panthor_gem_backing_unpin_locked()
>> which expects the reservation lock to be held.
> 
> Good catch! I think we need to rename panthor_gem_vmap_cleanup() into
> panthor_gem_vmap_cleanup_locked(), take the resv lock before calling
> panthor_gem_vmap_cleanup_locked() and release it after calling
> panthor_gem_backing_cleanup_locked().
> 
>>
>>> +		panthor_gem_dev_map_cleanup(bo);
> 
> We should probably suffix that one with _locked() too, with the extra
> resv_held() annotations in the code.
> 
>>> +		panthor_gem_backing_cleanup(bo);
>>> +	}
>>> +
>>> +	drm_gem_object_release(obj);
>>> +
>>> +	kfree(bo);
>>>  	drm_gem_object_put(vm_root_gem);
>>>  }
>>>  
>>> @@ -159,15 +372,15 @@ panthor_gem_prime_begin_cpu_access(struct dma_buf *dma_buf,
>>>  {
>>>  	struct drm_gem_object *obj = dma_buf->priv;
>>>  	struct drm_device *dev = obj->dev;
>>> -	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>>  	struct dma_buf_attachment *attach;
>>>  
>>>  	dma_resv_lock(obj->resv, NULL);
>>> -	if (shmem->sgt)
>>> -		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
>>> +	if (bo->dmap.sgt)
>>> +		dma_sync_sgtable_for_cpu(drm_dev_dma_dev(dev), bo->dmap.sgt, dir);
>>>  
>>> -	if (shmem->vaddr)
>>> -		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
>>> +	if (bo->cmap.vaddr)
>>> +		invalidate_kernel_vmap_range(bo->cmap.vaddr, bo->base.size);
>>>  
>>>  	list_for_each_entry(attach, &dma_buf->attachments, node) {
>>>  		struct sg_table *sgt = attach->priv;
>>> @@ -186,7 +399,7 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
>>>  {
>>>  	struct drm_gem_object *obj = dma_buf->priv;
>>>  	struct drm_device *dev = obj->dev;
>>> -	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>>  	struct dma_buf_attachment *attach;
>>>  
>>>  	dma_resv_lock(obj->resv, NULL);
>>> @@ -197,11 +410,11 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_buf,
>>>  			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
>>>  	}
>>>  
>>> -	if (shmem->vaddr)
>>> -		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
>>> +	if (bo->cmap.vaddr)
>>> +		flush_kernel_vmap_range(bo->cmap.vaddr, bo->base.size);
>>>  
>>> -	if (shmem->sgt)
>>> -		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
>>> +	if (bo->dmap.sgt)
>>> +		dma_sync_sgtable_for_device(drm_dev_dma_dev(dev), bo->dmap.sgt, dir);
>>>  
>>>  	dma_resv_unlock(obj->resv);
>>>  	return 0;
>>> @@ -258,53 +471,339 @@ panthor_gem_prime_import(struct drm_device *dev,
>>>  	return drm_gem_prime_import(dev, dma_buf);
>>>  }
>>>  
>>> +static void panthor_gem_print_info(struct drm_printer *p, unsigned int indent,
>>> +				   const struct drm_gem_object *obj)
>>> +{
>>> +	const struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> +
>>> +	if (drm_gem_is_imported(&bo->base))
>>> +		return;
>>> +
>>> +	drm_printf_indent(p, indent, "resident=%s\n", str_true_false(bo->backing.pages));
>>> +	drm_printf_indent(p, indent, "pages_pin_count=%u\n", refcount_read(&bo->backing.pin_count));
>>> +	drm_printf_indent(p, indent, "vmap_use_count=%u\n",
>>> +			  refcount_read(&bo->cmap.vaddr_use_count));
>>> +	drm_printf_indent(p, indent, "vaddr=%p\n", bo->cmap.vaddr);
>>> +}
>>> +
>>> +static int panthor_gem_pin_locked(struct drm_gem_object *obj)
>>> +{
>>> +	if (drm_gem_is_imported(obj))
>>> +		return 0;
>>> +
>>> +	return panthor_gem_backing_pin_locked(to_panthor_bo(obj));
>>> +}
>>> +
>>> +static void panthor_gem_unpin_locked(struct drm_gem_object *obj)
>>> +{
>>> +	if (!drm_gem_is_imported(obj))
>>> +		panthor_gem_backing_unpin_locked(to_panthor_bo(obj));
>>> +}
>>> +
>>> +int panthor_gem_pin(struct panthor_gem_object *bo)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	if (drm_gem_is_imported(&bo->base))
>>> +		return 0;
>>> +
>>> +	if (refcount_inc_not_zero(&bo->backing.pin_count))
>>> +		return 0;
>>> +
>>> +	dma_resv_lock(bo->base.resv, NULL);
>>> +	ret = panthor_gem_pin_locked(&bo->base);  
>>
>> We might as well call panthor_gem_backing_pin_locked() since we know
>> it's not imported.
> 
> Fair enough.
> 
>>
>>> +	dma_resv_unlock(bo->base.resv);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +void panthor_gem_unpin(struct panthor_gem_object *bo)
>>> +{
>>> +	if (drm_gem_is_imported(&bo->base))
>>> +		return;
>>> +
>>> +	if (refcount_dec_not_one(&bo->backing.pin_count))
>>> +		return;
>>> +
>>> +	dma_resv_lock(bo->base.resv, NULL);
>>> +	panthor_gem_unpin_locked(&bo->base);  
>>
>> Same here.
> 
> Will do.
> 
>>
>>> +	dma_resv_unlock(bo->base.resv);
>>> +}
>>> +
>>> +static struct sg_table *panthor_gem_get_sg_table(struct drm_gem_object *obj)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> +
>>> +	drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj));
>>> +	drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages);
>>> +	drm_WARN_ON_ONCE(obj->dev, !refcount_read(&bo->backing.pin_count));
>>> +
>>> +	return drm_prime_pages_to_sg(obj->dev, bo->backing.pages, obj->size >> PAGE_SHIFT);
>>> +}
>>> +
>>> +static int panthor_gem_vmap_locked(struct drm_gem_object *obj,
>>> +				   struct iosys_map *map)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> +	void *vaddr;
>>> +
>>> +	dma_resv_assert_held(obj->resv);
>>> +
>>> +	if (drm_gem_is_imported(obj))
>>> +		return dma_buf_vmap(obj->import_attach->dmabuf, map);
>>> +
>>> +	vaddr = panthor_gem_vmap_get_locked(bo);
>>> +	if (IS_ERR(vaddr))
>>> +		return PTR_ERR(vaddr);
>>> +
>>> +	iosys_map_set_vaddr(map, vaddr);
>>> +	return 0;
>>> +}
>>> +
>>> +static void panthor_gem_vunmap_locked(struct drm_gem_object *obj,
>>> +				      struct iosys_map *map)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> +
>>> +	dma_resv_assert_held(obj->resv);
>>> +
>>> +	if (drm_gem_is_imported(obj)) {
>>> +		dma_buf_vunmap(obj->import_attach->dmabuf, map);
>>> +	} else {
>>> +		drm_WARN_ON_ONCE(obj->dev, bo->cmap.vaddr != map->vaddr);
>>> +		panthor_gem_vmap_put_locked(bo);
>>> +	}
>>> +}
>>> +
>>> +static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>> +	int ret;
>>> +
>>> +	if (drm_gem_is_imported(obj)) {
>>> +		/* Reset both vm_ops and vm_private_data, so we don't end up with
>>> +		 * vm_ops pointing to our implementation if the dma-buf backend
>>> +		 * doesn't set those fields.
>>> +		 */
>>> +		vma->vm_private_data = NULL;
>>> +		vma->vm_ops = NULL;
>>> +
>>> +		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
>>> +
>>> +		/* Drop the reference drm_gem_mmap_obj() acquired.*/
>>> +		if (!ret)
>>> +			drm_gem_object_put(obj);
>>> +
>>> +		return ret;
>>> +	}
>>> +
>>> +	if (is_cow_mapping(vma->vm_flags))
>>> +		return -EINVAL;
>>> +
>>> +	dma_resv_lock(obj->resv, NULL);
>>> +	ret = panthor_gem_backing_get_pages_locked(bo);
>>> +	if (!ret)
>>> +		ret = panthor_gem_prep_for_cpu_map_locked(bo);
>>> +	dma_resv_unlock(obj->resv);
>>> +
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>>> +	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
>>> +	if (should_map_wc(bo))
>>> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
>>>  {
>>>  	struct panthor_gem_object *bo = to_panthor_bo(obj);
>>>  	enum drm_gem_object_status res = 0;
>>>  
>>> -	if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
>>> +	if (drm_gem_is_imported(&bo->base) || bo->backing.pages)
>>>  		res |= DRM_GEM_OBJECT_RESIDENT;
>>>  
>>>  	return res;
>>>  }
>>>  
>>> -static const struct drm_gem_object_funcs panthor_gem_funcs = {
>>> -	.free = panthor_gem_free_object,
>>> -	.print_info = drm_gem_shmem_object_print_info,
>>> -	.pin = drm_gem_shmem_object_pin,
>>> -	.unpin = drm_gem_shmem_object_unpin,
>>> -	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>>> -	.vmap = drm_gem_shmem_object_vmap,
>>> -	.vunmap = drm_gem_shmem_object_vunmap,
>>> -	.mmap = drm_gem_shmem_object_mmap,
>>> -	.status = panthor_gem_status,
>>> -	.export = panthor_gem_prime_export,
>>> -	.vm_ops = &drm_gem_shmem_vm_ops,
>>> +static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct page *page)
>>> +{
>>> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
>>> +	unsigned long pfn = page_to_pfn(page);
>>> +	unsigned long paddr = pfn << PAGE_SHIFT;
>>> +	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
>>> +
>>> +	if (aligned &&
>>> +	    pmd_none(*vmf->pmd) &&
>>> +	    folio_test_pmd_mappable(page_folio(page))) {
>>> +		pfn &= PMD_MASK >> PAGE_SHIFT;
>>> +		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
>>> +			return true;
>>> +	}
>>> +#endif
>>> +
>>> +	return false;
>>> +}
>>> +
>>> +static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
>>> +{
>>> +	struct vm_area_struct *vma = vmf->vma;
>>> +	struct drm_gem_object *obj = vma->vm_private_data;
>>> +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
>>> +	loff_t num_pages = obj->size >> PAGE_SHIFT;
>>> +	vm_fault_t ret;
>>> +	pgoff_t page_offset;
>>> +	unsigned long pfn;
>>> +
>>> +	/* Offset to faulty address in the VMA. */
>>> +	page_offset = vmf->pgoff - vma->vm_pgoff;
>>> +
>>> +	dma_resv_lock(bo->base.resv, NULL);
>>> +
>>> +	if (page_offset >= num_pages ||
>>> +	    drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages)) {
>>> +		ret = VM_FAULT_SIGBUS;
>>> +		goto out;
>>> +	}
>>> +
>>> +	if (try_map_pmd(vmf, vmf->address, bo->backing.pages[page_offset])) {
>>> +		ret = VM_FAULT_NOPAGE;
>>> +		goto out;
>>> +	}
>>> +
>>> +	pfn = page_to_pfn(bo->backing.pages[page_offset]);
>>> +	ret = vmf_insert_pfn(vma, vmf->address, pfn);
>>> +
>>> + out:
>>> +	dma_resv_unlock(bo->base.resv);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static void panthor_gem_vm_open(struct vm_area_struct *vma)
>>> +{
>>> +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
>>> +
>>> +	drm_WARN_ON(bo->base.dev, drm_gem_is_imported(&bo->base));
>>> +
>>> +	dma_resv_lock(bo->base.resv, NULL);
>>> +
>>> +	/* We should have already pinned the pages when the buffer was first
>>> +	 * mmap'd, vm_open() just grabs an additional reference for the new
>>> +	 * mm the vma is getting copied into (ie. on fork()).
>>> +	 */
>>> +	drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages);
>>> +
>>> +	dma_resv_unlock(bo->base.resv);
>>> +
>>> +	drm_gem_vm_open(vma);
>>> +}
>>> +
>>> +const struct vm_operations_struct panthor_gem_vm_ops = {
>>> +	.fault = panthor_gem_fault,
>>> +	.open = panthor_gem_vm_open,
>>> +	.close = drm_gem_vm_close,
>>>  };
>>>  
>>> -/**
>>> - * panthor_gem_create_object - Implementation of driver->gem_create_object.
>>> - * @ddev: DRM device
>>> - * @size: Size in bytes of the memory the object will reference
>>> - *
>>> - * This lets the GEM helpers allocate object structs for us, and keep
>>> - * our BO stats correct.
>>> - */
>>> -struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t size)
>>> -{
>>> -	struct panthor_gem_object *obj;
>>> +static const struct drm_gem_object_funcs panthor_gem_funcs = {
>>> +	.free = panthor_gem_free_object,
>>> +	.print_info = panthor_gem_print_info,
>>> +	.pin = panthor_gem_pin_locked,
>>> +	.unpin = panthor_gem_unpin_locked,
>>> +	.get_sg_table = panthor_gem_get_sg_table,
>>> +	.vmap = panthor_gem_vmap_locked,
>>> +	.vunmap = panthor_gem_vunmap_locked,
>>> +	.mmap = panthor_gem_mmap,
>>> +	.status = panthor_gem_status,
>>> +	.export = panthor_gem_prime_export,
>>> +	.vm_ops = &panthor_gem_vm_ops,
>>> +};
>>>  
>>> -	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>>> -	if (!obj)
>>> +static struct panthor_gem_object *
>>> +panthor_gem_alloc_object(uint32_t flags)
>>> +{
>>> +	struct panthor_gem_object *bo;
>>> +
>>> +	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>>> +	if (!bo)
>>>  		return ERR_PTR(-ENOMEM);
>>>  
>>> -	obj->base.base.funcs = &panthor_gem_funcs;
>>> -	mutex_init(&obj->label.lock);
>>> +	bo->base.funcs = &panthor_gem_funcs;
>>> +	bo->flags = flags;
>>> +	mutex_init(&bo->label.lock);
>>> +	panthor_gem_debugfs_bo_init(bo);
>>> +	return bo;
>>> +}
>>>  
>>> -	panthor_gem_debugfs_bo_init(obj);
>>> +static struct panthor_gem_object *
>>> +panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
>>> +		   struct panthor_vm *exclusive_vm, u32 usage_flags)
>>> +{
>>> +	struct panthor_gem_object *bo;
>>> +	int ret;
>>>  
>>> -	return &obj->base.base;
>>> +	bo = panthor_gem_alloc_object(flags);
>>> +	if (IS_ERR(bo))
>>> +		return bo;
>>> +
>>> +	size = PAGE_ALIGN(size);
>>> +	ret = drm_gem_object_init(dev, &bo->base, size);
>>> +	if (ret)
>>> +		goto err_put;
>>> +
>>> +	/* Our buffers are kept pinned, so allocating them
>>> +	 * from the MOVABLE zone is a really bad idea, and
>>> +	 * conflicts with CMA. See comments above new_inode()
>>> +	 * why this is required _and_ expected if you're
>>> +	 * going to pin these pages.
>>> +	 */
>>> +	mapping_set_gfp_mask(bo->base.filp->f_mapping,
>>> +			     GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>>> +
>>> +	ret = drm_gem_create_mmap_offset(&bo->base);
>>> +	if (ret)
>>> +		goto err_put;
>>> +
>>> +	if (exclusive_vm) {
>>> +		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
>>> +		drm_gem_object_get(bo->exclusive_vm_root_gem);
>>> +		bo->base.resv = bo->exclusive_vm_root_gem->resv;
>>> +	}
>>> +
>>> +	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
>>> +	return bo;
>>> +
>>> +err_put:
>>> +	drm_gem_object_put(&bo->base);  
>>
>> Is this call to _put() correct? I see the __drm_gem_shmem_init()
>> function uses drm_gem_object_release() instead.
> 
> I think it is okay, as long as:
> 
> - the GEM object is zeroed at alloc time (all pointers set to NULL,
>   vma_node unallocated, ...)
> - the GEM funcs are set early (done in panthor_gem_alloc_object())
> - the drm_gem_object is initialized (done as part
>   of drm_gem_object_init(), early enough to guarantee that nothing
>   fails before this is done)
> - the gem->funcs.free() function treats any NULL pointer as a "partially
>   initialized object" case instead of "invalid object", and that we do
>   in panthor_gem_free_object(), I think, just like
>   drm_gem_object_release() does.
> 
> I'd really prefer to keep this _put() instead of adding new
> err_<undo_x> labels for each of the steps that might have taken place
> between drm_gem_object_init() and the failing call, unless there's a
> proof this is unsafe (might have missed something you spotted).

So the difference that I saw is that drm_gem_object_put() decrements the
reference count, whereas drm_gem_object_release() doesn't. I wasn't
really sure whether that actually made any real difference. The refcount
should be known to be 1 at this point.

I'm happy for this to stay as _put().

>>
>>> +	return ERR_PTR(ret);
>>> +}
>>> +
>>> +struct drm_gem_object *
>>> +panthor_gem_prime_import_sg_table(struct drm_device *dev,
>>> +				  struct dma_buf_attachment *attach,
>>> +				  struct sg_table *sgt)
>>> +{
>>> +	struct panthor_gem_object *bo;
>>> +	int ret;
>>> +
>>> +	bo = panthor_gem_alloc_object(0);
>>> +	if (IS_ERR(bo))
>>> +		return &bo->base;  
>>
>> bo->base is invalid here. I think you want ERR_CAST(bo).
> 
> Absolutely. Will fix that.
> 
>>
>>> +
>>> +	drm_gem_private_object_init(dev, &bo->base, attach->dmabuf->size);
>>> +
>>> +	ret = drm_gem_create_mmap_offset(&bo->base);
>>> +	if (ret)
>>> +		goto err_put;
>>> +
>>> +	bo->dmap.sgt = sgt;
>>> +	return &bo->base;
>>> +
>>> +err_put:
>>> +	drm_gem_object_put(&bo->base);  
>>
>> Again I'm not convinced _put does the right thing here.
> 
> Hm, we probably have to re-order the bo->dmap.sgt assignment so it
> happens just after drm_gem_private_object_init() and there's no NULL
> deref in the panthor_gem_free_object() path, but otherwise I think it's
> safe to call panthor_gem_free_object() after the non-fallible
> initialization took place. Am I missing something?

I think with the reordering it should be fine.

Thanks,
Steve

