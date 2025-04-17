Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF60A92084
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 16:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FED710EB48;
	Thu, 17 Apr 2025 14:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4569610EB55
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 14:58:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D9551515;
 Thu, 17 Apr 2025 07:58:34 -0700 (PDT)
Received: from [10.1.37.32] (e122027.cambridge.arm.com [10.1.37.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7C423F59E;
 Thu, 17 Apr 2025 07:58:35 -0700 (PDT)
Message-ID: <b22f9aea-bbc0-4eaa-a20a-83b92e3457ca@arm.com>
Date: Thu, 17 Apr 2025 15:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panthor: Fix the user MMIO offset logic for
 emulators
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250417100503.3478405-1-boris.brezillon@collabora.com>
 <20250417100503.3478405-3-boris.brezillon@collabora.com>
 <a7c6a9e3-1217-4dea-9b51-96d9962e0630@arm.com>
 <20250417141031.35b17c68@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250417141031.35b17c68@collabora.com>
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

On 17/04/2025 13:10, Boris Brezillon wrote:
> On Thu, 17 Apr 2025 11:41:18 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 17/04/2025 11:05, Boris Brezillon wrote:
>>> Currently, we pick the MMIO offset based on the size of the pgoff_t
>>> type seen by the process that manipulates the FD, such that a 32-bit
>>> process can always map the user MMIO ranges. But this approach doesn't
>>> work well for emulators like FEX, where the emulator is a 64-bit binary
>>> which might be executing 32-bit code. In that case, the kernel thinks
>>> it's the 64-bit process and assumes DRM_PANTHOR_USER_MMIO_OFFSET_64BIT
>>> is in use, but the UMD library expects DRM_PANTHOR_USER_MMIO_OFFSET_32BIT,
>>> because it can't mmap() anything above the pgoff_t size.  
>>
>> I'm not a fan of the FEX behaviour here. I know I won't be popular, but
>> can FEX not just handle this difference internally?
> 
> The only way it could do that is by intercepting the mmap() calls and
> adjusting the offset if the dev file is backed by a panthor device and
> the emulated arch is x86-32. Besides, every userspace emulator would
> have to do the same if they want to execute an x86-32 mesa lib, so it
> feels like the wrong place to address the problem.

Yeah, I've had that argument before - my view is that if you try to call
64 bit ioctls from code which thinks it's 32 bit then you get to keep
the pieces. Ultimately attempting to pass through x86-32 calls to arm64
is going to be painful. I'd much prefer there was some attempt to
virtualise devices in user space (i.e. x86 Mesa talks to a virtual GPU
implemented in arm64 code which uses arm64 Mesa to talk to the real GPU).

However I'll accept the MMIO offset is something that's bad uAPI in
panthor - I know I made the mistake of assuming 32 bit wasn't important
for a new driver. So let's see if we can improve things kernel side.

>>
>>> In order to solve that, we need a way to explicitly set the user MMIO
>>> offset from the UMD, such that the kernel doesn't have to guess it
>>> from the TIF_32BIT flag set on user thread. We keep the old behavior
>>> if DRM_PANTHOR_SET_USER_MMIO_OFFSET is never called.  
>>
>> Although I agree this is probably a better uAPI that we should have had
>> from the beginning (hindsight and all that!).
>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_device.h | 18 +++++++
>>>  drivers/gpu/drm/panthor/panthor_drv.c    | 60 +++++++++++++++++++-----
>>>  include/uapi/drm/panthor_drm.h           | 32 +++++++++++++
>>>  3 files changed, 97 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>>> index 4c27b6d85f46..b97aba89132a 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>>> @@ -10,6 +10,7 @@
>>>  #include <linux/io-pgtable.h>
>>>  #include <linux/regulator/consumer.h>
>>>  #include <linux/pm_runtime.h>
>>> +#include <linux/rwsem.h>
>>>  #include <linux/sched.h>
>>>  #include <linux/spinlock.h>
>>>  
>>> @@ -219,6 +220,23 @@ struct panthor_file {
>>>  	/** @ptdev: Device attached to this file. */
>>>  	struct panthor_device *ptdev;
>>>  
>>> +	/** @user_mmio: User MMIO related fields. */
>>> +	struct {
>>> +		/** @offset: Offset used for user MMIO mappings. */
>>> +		u64 offset;
>>> +
>>> +		/**
>>> +		 * @offset_immutable: True if the user MMIO offset became immutable.
>>> +		 *
>>> +		 * Set to true after the first mmap() targeting a page in the user MMIO range.
>>> +		 * After this point, the user MMIO offset can't be changed.
>>> +		 */
>>> +		bool offset_immutable;  
>>
>> Do we need this complexity? Does it really matter if user space confuses
>> itself by changing the offsets?
> 
> I initially thought we had a few
> 
> 		if (is_mmio_offset)
> 			do_something
> 		else
> 			do_something_else
> 
> conditionals happening after the mmap() call (like when we need to evict
> an mmio-mmap-ed region on suspend), but it turns out those are done with
> the fixed MMIO_OFFSET that's seen by the driver.
> 
> My main worry here is if we start introducing such tests, and userspace
> starts moving things behind our back, leading to potential invalid
> branching in kernel space, which we know is never good. That's the
> very reason I wanted this offset to be set in stone as soon as the first
> mmio mmap() is done (maybe it should even be the first mmap even). I
> guess if we make it very clear in the doc that no test should happen on
> this field apart from the one done in panthor_mmap(), and this test is
> done on a local variable with a READ_ONCE() to ensure we don't deref
> the field twice (once for the offset >= mmio_offset, and once for the
> offset adjustment), we can probably drop the lock and the immutable
> bool.

Personally I do see the MMIO region as a hack for mmap(). Ideally we'd
have a separate mmap-like function for doing the MMIO. But hiding mmap
behind an ioctl breaks things like valgrind, and having to have a whole
extra file descriptor just for (current) just one magic region would be
overkill. Hence we have a 'this is higher than you will need so we've
repurposed it' hack.

So if we allow user space to choose this "higher than you will need"
address we permit user space to shoot itself in the foot, but assuming
it knows what it's doing it can make use of it. So in this case we have
a 64 bit user space which is promising that it's only going to use 32
bit addresses.

I agree a comment explaining that this check should only happen in
panthor_mmap() would be good as a reminder our future selfs.

>>
>>> +
>>> +		/** @offset_lock: Lock used to protect offset changes. */
>>> +		struct rw_semaphore offset_lock;  
>>
>> Equally the lock seems slightly overkill - AFAICT user space can only
>> harm itself.
> 
> If we want to ensure things are not moving behind our back, we need the
> lock. Of course, if we drop offset_immutable and let userspace change
> the offset at any point, that's pointless.
> 
>>
>>> +	} user_mmio;
>>> +
>>>  	/** @vms: VM pool attached to this file. */
>>>  	struct panthor_vm_pool *vms;
>>>  
>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>> index 7cd131af340d..6a8931492536 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>> @@ -1336,6 +1336,29 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
>>>  	return 0;
>>>  }
>>>  
>>> +static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
>>> +					      void *data, struct drm_file *file)
>>> +{
>>> +	struct drm_panthor_set_user_mmio_offset *args = data;
>>> +	struct panthor_file *pfile = file->driver_priv;
>>> +	int ret;
>>> +
>>> +	if (args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_32BIT &&
>>> +	    args->offset != DRM_PANTHOR_USER_MMIO_OFFSET_64BIT)
>>> +		return -EINVAL;  
>>
>> Note we're not preventing a 32 bit client requesting to use 64 bit
>> offsets here.
> 
> I know. What's likely to happen is that the first mmap() on the MMIO
> region is going to fail or point to a user BO, which only hurts the
> client itself. I guess I can check the TIF bit here, but that won't
> prevent an emulated x86 binary setting a 64-bit offset, and there's
> no way I can ensure it's picking the right offset, which is why I
> strongly suggest users of this ioctl() to always pass
> DRM_PANTHOR_USER_MMIO_OFFSET, not
> DRM_PANTHOR_USER_MMIO_OFFSET_{32,64}BIT, in the doc.

Yep, I'm happy to allow a client to shoot itself in the foot - so no
need to check. It just seemed at odds with the other immutable checking
you were doing.

In this particular case of a 32 bit client wanting a 64 bit offset then
the effect is that it can never access the MMIO region - so breakage is
immediately obvious.

>>
>>> +
>>> +	down_write(&pfile->user_mmio.offset_lock);
>>> +	if (pfile->user_mmio.offset_immutable) {
>>> +		ret = pfile->user_mmio.offset != args->offset ? -EINVAL : 0;
>>> +	} else {
>>> +		pfile->user_mmio.offset = args->offset;
>>> +		ret = 0;
>>> +	}
>>> +	up_write(&pfile->user_mmio.offset_lock);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>  static int
>>>  panthor_open(struct drm_device *ddev, struct drm_file *file)
>>>  {
>>> @@ -1353,6 +1376,19 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>>>  	}
>>>  
>>>  	pfile->ptdev = ptdev;
>>> +	init_rwsem(&pfile->user_mmio.offset_lock);
>>> +	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
>>> +
>>> +#ifdef CONFIG_ARM64
>>> +	/*
>>> +	 * With 32-bit systems being limited by the 32-bit representation of
>>> +	 * mmap2's pgoffset field, we need to make the MMIO offset arch
>>> +	 * specific.
>>> +	 */
>>> +	if (test_tsk_thread_flag(current, TIF_32BIT))
>>> +		pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
>>> +#endif
>>> +
>>>  
>>>  	ret = panthor_vm_pool_create(pfile);
>>>  	if (ret)
>>> @@ -1405,6 +1441,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
>>>  	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
>>>  	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
>>>  	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
>>> +	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
>>>  };
>>>  
>>>  static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>>> @@ -1418,20 +1455,16 @@ static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
>>>  	if (!drm_dev_enter(file->minor->dev, &cookie))
>>>  		return -ENODEV;
>>>  
>>> -#ifdef CONFIG_ARM64
>>> -	/*
>>> -	 * With 32-bit systems being limited by the 32-bit representation of
>>> -	 * mmap2's pgoffset field, we need to make the MMIO offset arch
>>> -	 * specific. This converts a user MMIO offset into something the kernel
>>> -	 * driver understands.
>>> -	 */
>>> -	if (test_tsk_thread_flag(current, TIF_32BIT) &&
>>> -	    offset >= DRM_PANTHOR_USER_MMIO_OFFSET_32BIT) {
>>> -		offset += DRM_PANTHOR_USER_MMIO_OFFSET_64BIT -
>>> -			  DRM_PANTHOR_USER_MMIO_OFFSET_32BIT;
>>> +	/* Adjust the user MMIO to match the offset used kernel side. */
>>> +	down_read(&pfile->user_mmio.offset_lock);
>>> +	if (offset >= pfile->user_mmio.offset &&
>>> +	    pfile->user_mmio.offset != DRM_PANTHOR_USER_MMIO_OFFSET) {
>>> +		offset -= pfile->user_mmio.offset;
>>> +		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
>>>  		vma->vm_pgoff = offset >> PAGE_SHIFT;
>>> +		pfile->user_mmio.offset_immutable = true;
>>>  	}
>>> -#endif
>>> +	up_read(&pfile->user_mmio.offset_lock);  
>>
>> I can't help feeling we can just simplify this to:
>>
>> 	u64 mmio_offset = pfile->user_mmio.offset;
>>
>> 	if (offset >= mmio_offset) {
>> 		offset -= mmio_offset;
>> 		offset += DRM_PANTHOR_USER_MMIO_OFFSET;
>> 		vma->vm_pgoff = offset >> PAGE_SHIFT;
>>
>> 		ret = panthor_device_mmap_io(ptdev, vma);
>> 	} else {
>> 		ret = drm_gem_mmap(filp, vma);
>> 	}
>>
>> Or even go further and push the offset calculations into
>> panthor_device_mmap_io().
> 
> Sure, I can do that.

As you say in the follow up email there are some complexities in pushing
into panthor_device_mmap_io(). So don't worry if that doesn't work out.

>>
>>>  
>>>  	if (offset >= DRM_PANTHOR_USER_MMIO_OFFSET)
>>>  		ret = panthor_device_mmap_io(ptdev, vma);
>>> @@ -1514,6 +1547,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>>>   * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
>>>   *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
>>>   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
>>> + * - 1.4 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
>>>   */
>>>  static const struct drm_driver panthor_drm_driver = {
>>>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
>>> @@ -1527,7 +1561,7 @@ static const struct drm_driver panthor_drm_driver = {
>>>  	.name = "panthor",
>>>  	.desc = "Panthor DRM driver",
>>>  	.major = 1,
>>> -	.minor = 3,
>>> +	.minor = 4,
>>>  
>>>  	.gem_create_object = panthor_gem_create_object,
>>>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
>>> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
>>> index 1379a2d4548c..2a16ca86113c 100644
>>> --- a/include/uapi/drm/panthor_drm.h
>>> +++ b/include/uapi/drm/panthor_drm.h
>>> @@ -127,6 +127,20 @@ enum drm_panthor_ioctl_id {
>>>  
>>>  	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
>>>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
>>> +
>>> +	/**
>>> +	 * @DRM_PANTHOR_SET_USER_MMIO_OFFSET: Set the offset to use as the user MMIO offset.
>>> +	 *
>>> +	 * The default behavior is to pick the MMIO offset based on the size of the pgoff_t
>>> +	 * type seen by the process that manipulates the FD, such that a 32-bit process can
>>> +	 * always map the user MMIO ranges. But this approach doesn't work well for emulators
>>> +	 * like FEX, where the emulator is an 64-bit binary which might be executing 32-bit
>>> +	 * code. In that case, the kernel thinks it's the 64-bit process and assumes
>>> +	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT is in use, but the UMD library expects
>>> +	 * DRM_PANTHOR_USER_MMIO_OFFSET_32BIT, because it can't mmap() anything above the
>>> +	 * pgoff_t size.
>>> +	 */
>>> +	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
>>>  };
>>>  
>>>  /**
>>> @@ -989,6 +1003,22 @@ struct drm_panthor_tiler_heap_destroy {
>>>  	__u32 pad;
>>>  };
>>>  
>>> +/**
>>> + * struct drm_panthor_set_user_mmio_offset - Arguments passed to
>>> + * DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET
>>> + */
>>> +struct drm_panthor_set_user_mmio_offset {
>>> +	/**
>>> +	 * @offset: User MMIO offset to use.
>>> +	 *
>>> +	 * Must be either DRM_PANTHOR_USER_MMIO_OFFSET_32BIT or
>>> +	 * DRM_PANTHOR_USER_MMIO_OFFSET_64BIT. The common use case is to pass
>>> +	 * DRM_PANTHOR_USER_MMIO_OFFSET which picks the right value based on the size of
>>> +	 * pgoff_t (AKA unsigned long).  
>>
>> "The common use case" is not to call this ioctl ;).
> 
> Fair enough, I'll mention in the doc that this is mostly useful for
> emulators.
> 
>> Although if we were
>> designing this uAPI from scratch I'd just say require user space to
>> decide where it wants the MMIO region and not have two offsets to choose
>> from.
> 
> Actually we also need to make sure it doesn't overlap with the
> range reserved for GEM mappings
> [DRM_FILE_PAGE_OFFSET_START:DRM_FILE_PAGE_OFFSET_START+DRM_FILE_PAGE_OFFSET_SIZE],
> so at the time I just figured I'd assign fixed offsets that are high
> enough in the range covered by pgoff_t and fix that in stone. I'm not
> seeing any value in letting the user select the offset here, but maybe
> I'm missing something.

I don't think there's benefit in giving clients full control of the
offset at this time. With hindsight if we'd added something like
drm_panthor_set_user_mmio_offset from the beginning then the whole issue
with 32 bit could have been solved easily without the macro magic.

It might well have been sensible to restrict the values that the client
can choose to avoid them choosing bad values which cause hard to track
down bugs. What you've currently got forcing one of two values makes
sense from that point of view. I just wonder if we're going to see a
future loosening of this when another use case comes up. But we can
tackle that when we actually understand the new use case.

> BTW, I quite like the DRM_PANTHOR_USER_MMIO_OFFSET macro making this
> decision for the caller, because I can't think of any good reason for
> 64-bit userspace deciding to use DRM_PANTHOR_USER_MMIO_OFFSET_32BIT,
> and 32-bit userspace just can't use DRM_PANTHOR_USER_MMIO_OFFSET_64BIT
> as an offset, otherwise it won't be able to mmap() MMIO stuff. The only
> case where we'd want an explicit OFFSET_32/64BIT is if a 64bit/32bit
> lib/bin takes the decision for a lib that has a different instruction
> size.

Agreed it makes sense. Although you already know the "good reason" for
64 bit userspace wanting OFFSET_32BIT - where the 64 bit user space is
pretending to be 32 bit ;) But at least with FEX some of that "64 bit"
user space is being compiled with a 32 bit long.

Thanks,
Steve

