Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA40A91D48
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 15:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AE810E2C3;
	Thu, 17 Apr 2025 13:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D25710E2C3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 13:06:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B6411515
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 06:05:59 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 761693F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 06:06:01 -0700 (PDT)
Date: Thu, 17 Apr 2025 14:05:57 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Fix the user MMIO offset logic for
 emulators
Message-ID: <aAD8tY2fJ6AvGR7v@e110455-lin.cambridge.arm.com>
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
 <20250417100503.3478405-3-boris.brezillon@collabora.com>
 <a7c6a9e3-1217-4dea-9b51-96d9962e0630@arm.com>
 <aADm7dDHm2oOWKCA@e110455-lin.cambridge.arm.com>
 <20250417141611.32033ff0@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417141611.32033ff0@collabora.com>
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

On Thu, Apr 17, 2025 at 02:16:11PM +0200, Boris Brezillon wrote:
> On Thu, 17 Apr 2025 12:33:01 +0100
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > On Thu, Apr 17, 2025 at 11:41:18AM +0100, Steven Price wrote:
> > > On 17/04/2025 11:05, Boris Brezillon wrote:  
> > > > Currently, we pick the MMIO offset based on the size of the pgoff_t
> > > > type seen by the process that manipulates the FD, such that a 32-bit
> > > > process can always map the user MMIO ranges. But this approach doesn't
> > > > work well for emulators like FEX, where the emulator is a 64-bit binary
> > > > which might be executing 32-bit code. In that case, the kernel thinks
> > > > it's the 64-bit process and assumes DRM_PANTHOR_USER_MMIO_OFFSET_64BIT
> > > > is in use, but the UMD library expects DRM_PANTHOR_USER_MMIO_OFFSET_32BIT,
> > > > because it can't mmap() anything above the pgoff_t size.  
> > > 
> > > I'm not a fan of the FEX behaviour here. I know I won't be popular, but
> > > can FEX not just handle this difference internally?
> > >   
> > > > In order to solve that, we need a way to explicitly set the user MMIO
> > > > offset from the UMD, such that the kernel doesn't have to guess it
> > > > from the TIF_32BIT flag set on user thread. We keep the old behavior
> > > > if DRM_PANTHOR_SET_USER_MMIO_OFFSET is never called.  
> > > 
> > > Although I agree this is probably a better uAPI that we should have had
> > > from the beginning (hindsight and all that!).
> > >   
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/panthor/panthor_device.h | 18 +++++++
> > > >  drivers/gpu/drm/panthor/panthor_drv.c    | 60 +++++++++++++++++++-----
> > > >  include/uapi/drm/panthor_drm.h           | 32 +++++++++++++
> > > >  3 files changed, 97 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > > > index 4c27b6d85f46..b97aba89132a 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > > > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > > > @@ -10,6 +10,7 @@
> > > >  #include <linux/io-pgtable.h>
> > > >  #include <linux/regulator/consumer.h>
> > > >  #include <linux/pm_runtime.h>
> > > > +#include <linux/rwsem.h>
> > > >  #include <linux/sched.h>
> > > >  #include <linux/spinlock.h>
> > > >  
> > > > @@ -219,6 +220,23 @@ struct panthor_file {
> > > >  	/** @ptdev: Device attached to this file. */
> > > >  	struct panthor_device *ptdev;
> > > >  
> > > > +	/** @user_mmio: User MMIO related fields. */
> > > > +	struct {
> > > > +		/** @offset: Offset used for user MMIO mappings. */
> > > > +		u64 offset;
> > > > +
> > > > +		/**
> > > > +		 * @offset_immutable: True if the user MMIO offset became immutable.
> > > > +		 *
> > > > +		 * Set to true after the first mmap() targeting a page in the user MMIO range.
> > > > +		 * After this point, the user MMIO offset can't be changed.
> > > > +		 */
> > > > +		bool offset_immutable;  
> > > 
> > > Do we need this complexity? Does it really matter if user space confuses
> > > itself by changing the offsets?
> > >   
> > > > +
> > > > +		/** @offset_lock: Lock used to protect offset changes. */
> > > > +		struct rw_semaphore offset_lock;  
> > > 
> > > Equally the lock seems slightly overkill - AFAICT user space can only
> > > harm itself.
> > >   
> > > > +	} user_mmio;
> > > > +
> > > >  	/** @vms: VM pool attached to this file. */
> > > >  	struct panthor_vm_pool *vms;
> > > >  
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > > > index 7cd131af340d..6a8931492536 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > > > @@ -1336,6 +1336,29 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
> > > > +					      void *data, struct drm_file *file)
> > > > +{
> > > > +	struct drm_panthor_set_user_mmio_offset *args = data;
> > > > +	struct panthor_file *pfile = file->driver_priv;
> > > > +	int ret;
> > > > +
> > > > +	if (args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_32BIT &&
> > > > +	    args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_64BIT)
> > > > +		return -EINVAL;  
> > > 
> > > Note we're not preventing a 32 bit client requesting to use 64 bit
> > > offsets here.
> > >   
> > > > +
> > > > +	down_write(&pfile->user_mmio.offset_lock);
> > > > +	if (pfile->user_mmio.offset_immutable) {
> > > > +		ret = pfile->user_mmio.offset != args->offset ? -EINVAL : 0;
> > > > +	} else {
> > > > +		pfile->user_mmio.offset = args->offset;
> > > > +		ret = 0;
> > > > +	}
> > > > +	up_write(&pfile->user_mmio.offset_lock);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static int
> > > >  panthor_open(struct drm_device *ddev, struct drm_file *file)
> > > >  {
> > > > @@ -1353,6 +1376,19 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
> > > >  	}
> > > >  
> > > >  	pfile->ptdev = ptdev;
> > > > +	init_rwsem(&pfile->user_mmio.offset_lock);
> > > > +	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
> > > > +
> > > > +#ifdef CONFIG_ARM64
> > > > +	/*
> > > > +	 * With 32-bit systems being limited by the 32-bit representation of
> > > > +	 * mmap2's pgoffset field, we need to make the MMIO offset arch
> > > > +	 * specific.
> > > > +	 */
> > > > +	if (test_tsk_thread_flag(current, TIF_32BIT))
> > > > +		pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
> > > > +#endif
> > > > +
> > > >  
> > > >  	ret = panthor_vm_pool_create(pfile);
> > > >  	if (ret)
> > > > @@ -1405,6 +1441,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> > > >  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
> > > >  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
> > > >  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
> > > > +	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
> > > >  };
> > > >  
> > > >  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> > > > @@ -1418,20 +1455,16 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
> > > >  	if (!drm_dev_enter(file->minor->dev, &cookie))
> > > >  		return -ENODEV;
> > > >  
> > > > -#ifdef CONFIG_ARM64
> > > > -	/*
> > > > -	 * With 32-bit systems being limited by the 32-bit representation of
> > > > -	 * mmap2's pgoffset field, we need to make the MMIO offset arch
> > > > -	 * specific. This converts a user MMIO offset into something the kernel
> > > > -	 * driver understands.
> > > > -	 */
> > > > -	if (test_tsk_thread_flag(current, TIF_32BIT) &&
> > > > -	    offset >= DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
> > > > -		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
> > > > -			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
> > > > +	/* Adjust the user MMIO to match the offset used kernel side. */
> > > > +	down_read(&pfile->user_mmio.offset_lock);
> > > > +	if (offset >= pfile->user_mmio.offset &&
> > > > +	    pfile->user_mmio.offset != DRM_PANTHOR_USER_MMIO_OFFSET) {
> > > > +		offset -= pfile->user_mmio.offset;
> > > > +		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
> > > >  		vma->vm_pgoff = offset >> PAGE_SHIFT;
> > > > +		pfile->user_mmio.offset_immutable = true;
> > > >  	}
> > > > -#endif
> > > > +	up_read(&pfile->user_mmio.offset_lock);  
> > > 
> > > I can't help feeling we can just simplify this to:
> > > 
> > > 	u64 mmio_offset = pfile->user_mmio.offset;
> > > 
> > > 	if (offset >= mmio_offset) {
> > > 		offset -= mmio_offset;
> > > 		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
> > > 		vma->vm_pgoff = offset >> PAGE_SHIFT;
> > > 
> > > 		ret = panthor_device_mmap_io(ptdev, vma);
> > > 	} else {
> > > 		ret = drm_gem_mmap(filp, vma);
> > > 	}
> > > 
> > > Or even go further and push the offset calculations into
> > > panthor_device_mmap_io().
> > >   
> > > >  
> > > >  	if (offset >= DRM_PANTHOR_USER_MMIO_OFFSET)
> > > >  		ret = panthor_device_mmap_io(ptdev, vma);
> > > > @@ -1514,6 +1547,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
> > > >   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
> > > >   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
> > > >   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> > > > + * - 1.4 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> > > >   */
> > > >  static const struct drm_driver panthor_drm_driver = {
> > > >  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > > > @@ -1527,7 +1561,7 @@ static const struct drm_driver panthor_drm_driver = {
> > > >  	.name = "panthor",
> > > >  	.desc = "Panthor DRM driver",
> > > >  	.major = 1,
> > > > -	.minor = 3,
> > > > +	.minor = 4,
> > > >  
> > > >  	.gem_create_object = panthor_gem_create_object,
> > > >  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > > > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > > > index 1379a2d4548c..2a16ca86113c 100644
> > > > --- a/include/uapi/drm/panthor_drm.h
> > > > +++ b/include/uapi/drm/panthor_drm.h
> > > > @@ -127,6 +127,20 @@ enum drm_panthor_ioctl_id {
> > > >  
> > > >  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
> > > >  	DRM_PANTHOR_TILER_HEAP_DESTROY,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_PANTHOR_SET_USER_MMIO_OFFSET: Set the offset to use as the user MMIO offset.
> > > > +	 *
> > > > +	 * The default behavior is to pick the MMIO offset based on the size of the pgoff_t
> > > > +	 * type seen by the process that manipulates the FD, such that a 32-bit process can
> > > > +	 * always map the user MMIO ranges. But this approach doesn't work well for emulators
> > > > +	 * like FEX, where the emulator is an 64-bit binary which might be executing 32-bit
> > > > +	 * code. In that case, the kernel thinks it's the 64-bit process and assumes
> > > > +	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT is in use, but the UMD library expects
> > > > +	 * DRM_PANTHOR_USER_MMIO_OFFSET_32BIT, because it can't mmap() anything above the
> > > > +	 * pgoff_t size.
> > > > +	 */
> > > > +	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
> > > >  };
> > > >  
> > > >  /**
> > > > @@ -989,6 +1003,22 @@ struct drm_panthor_tiler_heap_destroy {
> > > >  	__u32 pad;
> > > >  };
> > > >  
> > > > +/**
> > > > + * struct drm_panthor_set_user_mmio_offset - Arguments passed to
> > > > + * DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET
> > > > + */
> > > > +struct drm_panthor_set_user_mmio_offset {
> > > > +	/**
> > > > +	 * @offset: User MMIO offset to use.
> > > > +	 *
> > > > +	 * Must be either DRM_PANTHOR_USER_MMIO_OFFSET_32BIT or
> > > > +	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT. The common use case is to pass
> > > > +	 * DRM_PANTHOR_USER_MMIO_OFFSET which picks the right value based on the size of
> > > > +	 * pgoff_t (AKA unsigned long).  
> > > 
> > > "The common use case" is not to call this ioctl ;) Although if we were
> > > designing this uAPI from scratch I'd just say require user space to
> > > decide where it wants the MMIO region and not have two offsets to choose
> > > from.  
> > 
> > I have to say that I'm with Steve here. Can we not actually change the IOCTL to userspace
> > passing an offset mask so that we can restrict the offset range? We don't need all the
> > locking or to let the user space decide the offsets.
> 
> For the reasons explained in my reply to Steve, I think I'd prefer to
> have very restrictive constraints first and relax them once we have a
> need for random MMIO offsets. I mean, once that need arises, we'll
> have to update userspace binaries anyway, and bumping the KMD version
> is pretty trivial, so, better safe than sorry.

Sorry, I've linked myself to the wrong part of the reply from Steve.

What I'm trying to say is that I would change the whole patch into adding a new IOCTL that
sets a mask for the offsets returned by DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET if they are in the
user MMIO range.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
