Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C240FD26609
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 18:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219B510E1E2;
	Thu, 15 Jan 2026 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XfxgNj4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45CB10E1E2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768498024;
 bh=kUH0ce+Mq8n07mVvJ4N3jOUpCHY/MU0cG42HYzymmWA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XfxgNj4OwbPT5itlvg1HyNK63Q1UfUHYkHUx+kVwdq3zKUDgzMxB0Ch4LFyJD7TPr
 sD25qfEEYh6x3H0Jloxg8J9Pi9XA1YdAwT/bpBHoWgi49dCE0P4r/NwTgoRw1vrR35
 v2FMwPITkVz7Rh7YNjY4+TZnhFs9vZ32mt02iKn/a5XExwkEDTuYBJ21bJ7s+AAJbq
 H0s5f5OOb6qvjmw80RB6tpto2Ig/SyDqHE87SIksl9ijr9ZpknAz4X73rr5j1TNvTz
 BVHDScyoYrfzUGUC2PEIsLJ+f1TIUSGoy5XQwoQTm6bhKdMqEPvu3gk+UYgy1Fx91H
 s1CygNgUt2Hxg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A85FB17E10F8;
 Thu, 15 Jan 2026 18:27:03 +0100 (CET)
Date: Thu, 15 Jan 2026 18:27:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Akash Goel
 <akash.goel@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul
 <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen
 <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com
Subject: Re: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Message-ID: <20260115182700.05c21ec3@fedora>
In-Reply-To: <aWkbE6BLd4wutXet@e142607>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-6-boris.brezillon@collabora.com>
 <aWkbE6BLd4wutXet@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 15 Jan 2026 16:51:31 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Fri, Jan 09, 2026 at 02:07:57PM +0100, Boris Brezillon wrote:
> > While drm_gem_shmem_object does most of the job we need it to do, the
> > way sub-resources (pages, sgt, vmap) are handled and their lifetimes
> > gets in the way of BO reclaim. There has been attempts to address
> > that [1], but in the meantime, new gem_shmem users were introduced
> > (accel drivers), and some of them manually free some of these resources.
> > This makes things harder to control/sanitize/validate.
> > 
> > Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
> > and forcing gem_shmem users to go through new gem_shmem helpers when they
> > need manual control of some sort, and I believe this is a dead end if
> > we don't force users to follow some stricter rules through carefully
> > designed helpers, because there will always be one user doing crazy things
> > with gem_shmem_object internals, which ends up tripping out the common
> > helpers when they are called.
> > 
> > The consensus we reached was that we would be better off forking
> > gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
> > current transition tries to minimize the changes, but there are still
> > some aspects that are different, the main one being that we no longer
> > have a pages_use_count, and pages stays around until the GEM object is
> > destroyed (or when evicted once we've added a shrinker). The sgt also
> > no longer retains pages. This is losely based on how msm does things by
> > the way.
> > 
> > If there's any interest in sharing code (probably with msm, since the
> > panthor shrinker is going to be losely based on the msm implementation),
> > we can always change gears and do that once we have everything
> > working/merged.
> > 
> > [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/Kconfig         |   1 -
> >  drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
> >  drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
> >  drivers/gpu/drm/panthor/panthor_gem.c   | 696 ++++++++++++++++++++----
> >  drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
> >  drivers/gpu/drm/panthor/panthor_mmu.c   |  49 +-
> >  drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
> >  7 files changed, 666 insertions(+), 174 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> > index 55b40ad07f3b..911e7f4810c3 100644
> > --- a/drivers/gpu/drm/panthor/Kconfig
> > +++ b/drivers/gpu/drm/panthor/Kconfig
> > @@ -8,7 +8,6 @@ config DRM_PANTHOR
> >  	depends on MMU
> >  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> >  	select DRM_EXEC
> > -	select DRM_GEM_SHMEM_HELPER
> >  	select DRM_GPUVM
> >  	select DRM_SCHED
> >  	select IOMMU_IO_PGTABLE_LPAE
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index 52c27a60c84a..90e9abc22d9e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -19,6 +19,7 @@
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_exec.h>
> > +#include <drm/drm_file.h>
> >  #include <drm/drm_ioctl.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_syncobj.h>
> > @@ -1457,7 +1458,7 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
> >  	args->create_flags = bo->flags;
> >  
> >  	args->extra_flags = 0;
> > -	if (drm_gem_is_imported(&bo->base.base))
> > +	if (drm_gem_is_imported(&bo->base))
> >  		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
> >  
> >  	drm_gem_object_put(obj);
> > @@ -1671,8 +1672,7 @@ static const struct drm_driver panthor_drm_driver = {
> >  	.major = 1,
> >  	.minor = 7,
> >  
> > -	.gem_create_object = panthor_gem_create_object,
> > -	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > +	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
> >  	.gem_prime_import = panthor_gem_prime_import,
> >  #ifdef CONFIG_DEBUG_FS
> >  	.debugfs_init = panthor_debugfs_init,
> > @@ -1822,3 +1822,4 @@ module_exit(panthor_exit);
> >  MODULE_AUTHOR("Panthor Project Developers");
> >  MODULE_DESCRIPTION("Panthor DRM Driver");
> >  MODULE_LICENSE("Dual MIT/GPL");
> > +MODULE_IMPORT_NS("DMA_BUF");
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index a64ec8756bed..f135cf2130b8 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -627,7 +627,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
> >  		struct panthor_gem_object *bo;
> >  		u32 vm_map_flags = 0;
> > -		struct sg_table *sgt;
> >  		u64 va = hdr.va.start;
> >  
> >  		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
> > @@ -665,11 +664,12 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >  		panthor_fw_init_section_mem(ptdev, section);
> >  
> >  		bo = to_panthor_bo(section->mem->obj);
> > -		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> > -		if (IS_ERR(sgt))
> > -			return PTR_ERR(sgt);
> >  
> > -		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> > +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> > +		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
> > +			return -EINVAL;
> > +
> > +		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
> >  	}
> >  
> >  	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
> > @@ -729,8 +729,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
> >  			continue;
> >  
> >  		panthor_fw_init_section_mem(ptdev, section);
> > -		sgt = drm_gem_shmem_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
> > -		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
> > +
> > +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */  
> 
> I know these comments are helping us now when reviewing, but I feel that they are not adding
> actual information, specially as we do a WARN_ON anyway on it.

Well, it helps the person hitting the WARN_ON() and checking the code
understand what the expectations are, which I think the WARN_ON() alone
doesn't really help with.

> 
> > +		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
> > +		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
> >  			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> >  	}
> >  }
> > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> > index 4b3d82f001d8..0e52c7a07c87 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > @@ -8,9 +8,11 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/err.h>
> >  #include <linux/slab.h>
> > +#include <linux/vmalloc.h>
> >  
> >  #include <drm/drm_debugfs.h>
> >  #include <drm/drm_file.h>
> > +#include <drm/drm_prime.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/panthor_drm.h>
> >  
> > @@ -44,7 +46,7 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
> >  
> >  static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> >  {
> > -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> > +	struct panthor_device *ptdev = container_of(bo->base.dev,
> >  						    struct panthor_device, base);
> >  
> >  	bo->debugfs.creator.tgid = current->group_leader->pid;
> > @@ -57,7 +59,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> >  
> >  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> >  {
> > -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> > +	struct panthor_device *ptdev = container_of(bo->base.dev,
> >  						    struct panthor_device, base);
> >  
> >  	if (list_empty(&bo->debugfs.node))
> > @@ -80,9 +82,9 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> >  #endif
> >  
> >  static bool
> > -should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
> > +should_map_wc(struct panthor_gem_object *bo)
> >  {
> > -	struct panthor_device *ptdev = container_of(bo->base.base.dev, struct panthor_device, base);
> > +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
> >  
> >  	/* We can't do uncached mappings if the device is coherent,
> >  	 * because the zeroing done by the shmem layer at page allocation
> > @@ -112,6 +114,208 @@ should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
> >  	return true;
> >  }
> >  
> > +static void
> > +panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
> > +{
> > +	if (!bo->backing.pages)
> > +		return;
> > +
> > +	drm_gem_put_pages(&bo->base, bo->backing.pages, true, false);
> > +	bo->backing.pages = NULL;
> > +}
> > +
> > +static int
> > +panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
> > +{
> > +	dma_resv_assert_held(bo->base.resv);
> > +
> > +	if (bo->backing.pages)
> > +		return 0;
> > +
> > +	bo->backing.pages = drm_gem_get_pages(&bo->base);
> > +	if (IS_ERR(bo->backing.pages)) {
> > +		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
> > +			    bo->backing.pages);
> > +		return PTR_ERR(bo->backing.pages);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
> > +{
> > +	int ret;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
> > +
> > +	if (refcount_inc_not_zero(&bo->backing.pin_count))
> > +		return 0;
> > +
> > +	ret = panthor_gem_backing_get_pages_locked(bo);
> > +	if (!ret)
> > +		refcount_set(&bo->backing.pin_count, 1);
> > +
> > +	return ret;
> > +}
> > +
> > +static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *bo)
> > +{
> > +	dma_resv_assert_held(bo->base.resv);
> > +	drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
> > +
> > +	/* We don't release anything when pin_count drops to zero.
> > +	 * Pages stay there until an explicit cleanup is requested.
> > +	 */
> > +	if (!refcount_dec_not_one(&bo->backing.pin_count))
> > +		refcount_set(&bo->backing.pin_count, 0);
> > +}
> > +
> > +static void
> > +panthor_gem_dev_map_cleanup(struct panthor_gem_object *bo)
> > +{
> > +	if (!bo->dmap.sgt)
> > +		return;
> > +
> > +	dma_unmap_sgtable(drm_dev_dma_dev(bo->base.dev), bo->dmap.sgt, DMA_BIDIRECTIONAL, 0);
> > +	sg_free_table(bo->dmap.sgt);
> > +	kfree(bo->dmap.sgt);
> > +	bo->dmap.sgt = NULL;
> > +}
> > +
> > +static struct sg_table *
> > +panthor_gem_dev_map_get_sgt_locked(struct panthor_gem_object *bo)
> > +{
> > +	struct sg_table *sgt;
> > +	int ret;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +
> > +	if (bo->dmap.sgt)
> > +		return bo->dmap.sgt;
> > +
> > +	if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	/* Pages stay around after they've been allocated. At least that stands
> > +	 * until we add a shrinker.
> > +	 */
> > +	ret = panthor_gem_backing_get_pages_locked(bo);
> > +	if (ret)
> > +		return ERR_PTR(ret);
> > +
> > +	sgt = drm_prime_pages_to_sg(bo->base.dev, bo->backing.pages,
> > +				    bo->base.size >> PAGE_SHIFT);
> > +	if (IS_ERR(sgt))
> > +		return sgt;
> > +
> > +	/* Map the pages for use by the h/w. */
> > +	ret = dma_map_sgtable(drm_dev_dma_dev(bo->base.dev), sgt, DMA_BIDIRECTIONAL, 0);
> > +	if (ret)
> > +		goto err_free_sgt;
> > +
> > +	bo->dmap.sgt = sgt;
> > +	return sgt;
> > +
> > +err_free_sgt:
> > +	sg_free_table(sgt);
> > +	kfree(sgt);
> > +	return ERR_PTR(ret);
> > +}
> > +
> > +struct sg_table *
> > +panthor_gem_get_dev_sgt(struct panthor_gem_object *bo)
> > +{
> > +	struct sg_table *sgt;
> > +
> > +	dma_resv_lock(bo->base.resv, NULL);
> > +	sgt = panthor_gem_dev_map_get_sgt_locked(bo);
> > +	dma_resv_unlock(bo->base.resv);
> > +
> > +	return sgt;
> > +}
> > +
> > +static void
> > +panthor_gem_vmap_cleanup(struct panthor_gem_object *bo)  
> 
> As it was already discussed, either this function name needs _locked or
> we need to acquire the reservation lock inside it.

Yep, already done in the v2 I'm cooking.

> 
> > +{
> > +	if (!bo->cmap.vaddr)
> > +		return;
> > +
> > +	vunmap(bo->cmap.vaddr);
> > +	bo->cmap.vaddr = NULL;
> > +	panthor_gem_backing_unpin_locked(bo);
> > +}
> > +

[...]

> > +static void *
> > +panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
> > +{
> > +	pgprot_t prot = PAGE_KERNEL;
> > +	void *vaddr;
> > +	int ret;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +
> > +	if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
> > +		drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);  
> 
> Is this drm_WARN_ON_ONCE() necessary? I can't see how we can ever trigger it.

I know it's not supposed to happen, but isn't WARN_ON() exactly about
catching unexpected situations? :p

> 
> > +		return bo->cmap.vaddr;
> > +	}

[...]

> > +
> > +static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct drm_gem_object *obj = vma->vm_private_data;
> > +	struct panthor_gem_object *bo = to_panthor_bo(vma->vm_private_data);
> > +	loff_t num_pages = obj->size >> PAGE_SHIFT;
> > +	vm_fault_t ret;
> > +	pgoff_t page_offset;
> > +	unsigned long pfn;
> > +
> > +	/* Offset to faulty address in the VMA. */
> > +	page_offset = vmf->pgoff - vma->vm_pgoff;  
> 
> You're missing a shift right by PAGE_SHIFT here for the rest of the code
> to make sense.

Pretty sure I picked that from drm_gem_shmem_helper.c, so if it's buggy
here, it's buggy there too. I believe the pgoff values are in pages not
bytes, so I'd say we're good.

> 
> With that fixed,
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
