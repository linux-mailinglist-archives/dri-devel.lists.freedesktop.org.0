Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85DF78D614
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 15:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024DC10E13F;
	Wed, 30 Aug 2023 13:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3C50C10E13F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:17:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDF062F4;
 Wed, 30 Aug 2023 06:18:36 -0700 (PDT)
Received: from [10.57.92.7] (unknown [10.57.92.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F187E3F738;
 Wed, 30 Aug 2023 06:17:53 -0700 (PDT)
Message-ID: <1a556763-dc7e-e20b-071c-cc379b7c6f8d@arm.com>
Date: Wed, 30 Aug 2023 14:17:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/15] drm/panthor: Add the device logical block
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-5-boris.brezillon@collabora.com>
 <73cbc1ea-5e2e-b201-b717-4ceef37e490d@arm.com>
 <20230829160035.1992834b@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230829160035.1992834b@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 15:00, Boris Brezillon wrote:
> On Fri, 11 Aug 2023 16:47:56 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 09/08/2023 17:53, Boris Brezillon wrote:
>>> The panthor driver is designed in a modular way, where each logical
>>> block is dealing with a specific HW-block or software feature. In order
>>> for those blocks to communicate with each other, we need a central
>>> panthor_device collecting all the blocks, and exposing some common
>>> features, like interrupt handling, power management, reset, ...
>>>
>>> This what this panthor_device logical block is about.
>>>
>>> v2:
>>> - Rename the driver (pancsf -> panthor)
>>> - Change the license (GPL2 -> MIT + GPL2)
>>> - Split the driver addition commit
>>> - Add devfreq/PM support
>>> - Use drm_dev_{unplug,enter,exit}() to provide safe device removal
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_device.c | 479 +++++++++++++++++++++++
>>>  drivers/gpu/drm/panthor/panthor_device.h | 354 +++++++++++++++++
>>>  2 files changed, 833 insertions(+)
>>>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>>>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>>> new file mode 100644
>>> index 000000000000..15f102116fa0
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>>> @@ -0,0 +1,479 @@
>>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>>> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
>>> +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
>>> +/* Copyright 2023 Collabora ltd. */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/reset.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_domain.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/regulator/consumer.h>
>>> +
>>> +#include <drm/drm_drv.h>
>>> +#include <drm/drm_managed.h>
>>> +
>>> +#include "panthor_sched.h"
>>> +#include "panthor_device.h"
>>> +#include "panthor_devfreq.h"
>>> +#include "panthor_gpu.h"
>>> +#include "panthor_fw.h"
>>> +#include "panthor_mmu.h"
>>> +#include "panthor_regs.h"
>>> +
>>> +static int panthor_clk_init(struct panthor_device *ptdev)
>>> +{
>>> +	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
>>> +	if (IS_ERR(ptdev->clks.core)) {
>>> +		drm_err(&ptdev->base, "get 'core' clock failed %ld\n",
>>> +			PTR_ERR(ptdev->clks.core));  
>>
>> I suspect it would be a good idea to use dev_err_probe() here (and
>> below) as I believe devm_clk_get can return -EPROBE_DEFER.
> 
> Nice, didn't know there was a logging function that was silencing
> probe-defer errors.
> 
>>
>>> +		return PTR_ERR(ptdev->clks.core);
>>> +	}
>>> +
>>> +	ptdev->clks.stacks = devm_clk_get_optional(ptdev->base.dev, "stacks");
>>> +	if (IS_ERR(ptdev->clks.stacks)) {
>>> +		drm_err(&ptdev->base, "get 'stacks' clock failed %ld\n",
>>> +			PTR_ERR(ptdev->clks.stacks));
>>> +		return PTR_ERR(ptdev->clks.stacks);
>>> +	}
>>> +
>>> +	ptdev->clks.coregroup = devm_clk_get_optional(ptdev->base.dev, "coregroup");
>>> +	if (IS_ERR(ptdev->clks.coregroup)) {
>>> +		drm_err(&ptdev->base, "get 'coregroup' clock failed %ld\n",
>>> +			PTR_ERR(ptdev->clks.coregroup));
>>> +		return PTR_ERR(ptdev->clks.coregroup);
>>> +	}
>>> +
>>> +	drm_info(&ptdev->base, "clock rate = %lu\n", clk_get_rate(ptdev->clks.core));
>>> +	return 0;
>>> +}
>>> +
>>> +void panthor_device_unplug(struct panthor_device *ptdev)
>>> +{
>>> +	/* FIXME: This is racy. */  
>>
>> Can we fix this? From a quick look it seems like a sequence like below
>> should avoid the race.
>>
>> 	if (!drm_dev_enter())
>> 		/* Already unplugged */
>> 		return;
>> 	ptdev->base.unplugged = true;
>> 	drm_dev_exit();
>>
>> Although possibly that should be in the DRM core rather than open-coded
>> here.
> 
> Are you sure that's protecting us against two concurrent calls to
> drm_dev_unplug() (drm_dev_enter() is taking a read-lock)?

Well now I'm not sure ;) This was based on the implementations of
drm_dev_is_unplugged() and drm_dev_unplug(). drm_dev_is_unplugged()
simply tries to enter then exit. drm_dev_unplug() sets dev->unplugged
(without first taking any locks). So my naïve combination resulted in
the above.

The part I was missing is the synchronize_srcu() call in
drm_dev_unplug() is what matches up with the read lock in drm_dev_enter().

> And that's not
> the only thing I need actually. If there are 2 threads entering
> panthor_device_unplug(), I need to make sure the one who losts (arrived
> after unplugged was set to false) is waiting for all operations after
> the drm_dev_unplug() call to be done, otherwise we might return from
> platform_driver->remove() before the unplug cleanups are done, and
> there might still be threads/workqueues accessing device resources
> while/after they get released by the device-model.

I can't figure out how to do this other than adding a new atomic status
bit into panthor. So something like:

	if (!drm_dev_enter())
		/* Already unplugged */
		return;

	if (atomic_cmpxchg(&unplugging, false, true)) {
		/* Racing with another thread */
		drm_dev_exit();
		/* Wait for other threads to exit */
		synchronize_srcu(&drm_unplug_srcu);
		return;
	}

	panthor_xxx_unplug()

	drm_dev_exit();

Or at least I think that might work. The need to synchronize with
drm_unplug_srcu means this really needs a new helper in drm_drv.c.

>>
>>> +	if (drm_dev_is_unplugged(&ptdev->base))
>>> +		return;
>>> +
>>> +	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
>>> +
>>> +	/* Call drm_dev_unplug() so any access to HW block happening after
>>> +	 * that point get rejected.
>>> +	 */
>>> +	drm_dev_unplug(&ptdev->base);
>>> +
>>> +	/* Now, try to cleanly shutdown the GPU before the device resources
>>> +	 * get reclaimed.
>>> +	 */
>>> +	panthor_sched_unplug(ptdev);
>>> +	panthor_fw_unplug(ptdev);
>>> +	panthor_mmu_unplug(ptdev);
>>> +	panthor_gpu_unplug(ptdev);
>>> +
>>> +	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>>> +	pm_runtime_put_sync_suspend(ptdev->base.dev);
>>> +}
>>> +
>>> +static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
>>> +{
>>> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>>> +
>>> +	cancel_work_sync(&ptdev->reset.work);
>>> +	destroy_workqueue(ptdev->reset.wq);
>>> +}
>>> +
>>> +static void panthor_device_reset_work(struct work_struct *work)
>>> +{
>>> +	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
>>> +	int ret, cookie;
>>> +
>>> +	if (!drm_dev_enter(&ptdev->base, &cookie))
>>> +		return;
>>> +
>>> +	panthor_sched_pre_reset(ptdev);
>>> +	panthor_fw_pre_reset(ptdev, true);
>>> +	panthor_mmu_pre_reset(ptdev);
>>> +	panthor_gpu_soft_reset(ptdev);
>>> +	panthor_gpu_l2_power_on(ptdev);
>>> +	panthor_mmu_post_reset(ptdev);
>>> +	ret = panthor_fw_post_reset(ptdev);
>>> +	if (ret)
>>> +		goto out;
>>> +
>>> +	atomic_set(&ptdev->reset.pending, 0);
>>> +	panthor_sched_post_reset(ptdev);
>>> +	drm_dev_exit(cookie);
>>> +
>>> +out:
>>> +	if (ret) {  
>>
>> This looks like a race condition too - is there a need for a
>> drm_dev_exit_and_unplug() function?
> 
> drm_dev_exit() is just releasing the read-lock. drm_dev_unplug()
> waits for all readers to be done and sets the unplugged value to true.
> So we only get readers/writer synchronization here, but nothing doing
> writer/writer sync. I guess the drm core leaves that to drivers, given
> drm_dev_unplug() is usually called from xxx_driver->remove() hook, on
> which serialization is guaranteed by the device-model.
> 
> TLDR; yes, it's racy, but I don't think drm_dev_exit_and_unplug() would
> help solve the existing race.

Yeah, I hadn't really thought through the reader/writer locks.

> It's worth noting that we currently have only 2 paths calling
> panthor_device_unplug(): the platform_driver->remove() hook and the
> reset worker. Calling drm_dev_unplug() might not be the right thing to
> do, I just thought it was a good match to reflect the fact the device
> becomes inaccessible, without adding yet another kind of device-lost
> field.

I quite liked the unplugged approach, it hides the complexities of the
GPU breaking nicely.

However I do think this path needs fixing in some way, because of the
"goto out" we end up calling panthor_device_unplug() while in the
drm_dev_enter() section. Which, unless I'm mistaken, means
panthor_device_unplug() will call drm_dev_unplug() in that section -
which should produce a lockdep warning at the very least, if not an
actual deadlock.

Given it's only a read lock - I think simply moving drm_dev_exit() below
the "out:" label fixes the deadlock without making any races worse.
Whether the race here actually matters I'm not sure.

>>
>>> +		panthor_device_unplug(ptdev);
>>> +		drm_err(&ptdev->base, "Failed to boot MCU after reset, making device unusable.");
>>> +	}
>>> +}
>>> +
>>> +static bool panthor_device_is_initialized(struct panthor_device *ptdev)
>>> +{
>>> +	return !!ptdev->scheduler;
>>> +}
>>> +
>>> +static void panthor_device_free_page(struct drm_device *ddev, void *data)
>>> +{
>>> +	free_page((unsigned long)data);
>>> +}
>>> +
>>> +int panthor_device_init(struct panthor_device *ptdev)
>>> +{
>>> +	struct resource *res;
>>> +	struct page *p;
>>> +	int ret;
>>> +
>>> +	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
>>> +
>>> +	drmm_mutex_init(&ptdev->base, &ptdev->pm.lock);
>>> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
>>> +	p = alloc_page(GFP_KERNEL | __GFP_ZERO);
>>> +	if (!p)
>>> +		return -ENOMEM;
>>> +
>>> +	ptdev->pm.dummy_latest_flush = page_address(p);
>>> +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
>>> +				       ptdev->pm.dummy_latest_flush);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* Set the dummy page to the default LATEST_FLUSH value. This
>>> +	 * will be updated on the next suspend.
>>> +	 */
>>> +	*ptdev->pm.dummy_latest_flush = CSF_GPU_LATEST_FLUSH_ID_DEFAULT;  
>>
>> I see why this register default value was defined. Although I'm not sure
>> it has any benefit over just using zero... If the GPU is off when user
>> space reads the FLUSH_ID then the GPU's caches are definitely empty so
>> any flush ID is valid.
> 
> Zero means we'll force a cache flush for all CS that were created while
> the device was suspended, that's not ideal.
> 
>>
>> Interestingly looking at kbase it seems to use an initial value of 1
>> (POWER_DOWN_LATEST_FLUSH_VALUE). I guess zero is less ideal because
>> FLUSH_CACHE2 would then unconditionally do a flush.
> 
> I guess a value of 1 would work. It just means we'll get a spurious
> flush if the CS is submitted after 32 flushes happened, on the other
> hand we also a spurious flush on the first submitted CS when we use
> POWER_DOWN_LATEST_FLUSH_VALUE. I'll switch to 1, drop the default def,
> and update the comment accordingly.

Yeah, matching kbase is almost certainly the safest approach ;) Sorry, I
was reviewing the patches mostly in order and this looked really odd
until I started digging into it. Zero is clearly not the ideal value,
but the reset value is also just a weird value for hardware validation
(it enables easier checking of the wrap condition). Since kbase picks 1,
that must be a value which works well!

>>
>>> +
>>> +	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
>>> +	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
>>> +	if (!ptdev->reset.wq)
>>> +		return -ENOMEM;
>>> +
>>> +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = panthor_clk_init(ptdev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = panthor_devfreq_init(ptdev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
>>> +							      0, &res);
>>> +	if (IS_ERR(ptdev->iomem))
>>> +		return PTR_ERR(ptdev->iomem);
>>> +
>>> +	ptdev->phys_addr = res->start;
>>> +
>>> +	ret = devm_pm_runtime_enable(ptdev->base.dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = pm_runtime_resume_and_get(ptdev->base.dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret = panthor_gpu_init(ptdev);
>>> +	if (ret)
>>> +		goto err_rpm_put;
>>> +
>>> +	ret = panthor_mmu_init(ptdev);
>>> +	if (ret)
>>> +		goto err_rpm_put;
>>> +
>>> +	ret = panthor_fw_init(ptdev);
>>> +	if (ret)
>>> +		goto err_rpm_put;
>>> +
>>> +	ret = panthor_sched_init(ptdev);
>>> +	if (ret)
>>> +		goto err_rpm_put;
>>> +
>>> +	/* ~3 frames */
>>> +	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>>> +	pm_runtime_use_autosuspend(ptdev->base.dev);
>>> +	pm_runtime_put_autosuspend(ptdev->base.dev);
>>> +	return 0;
>>> +
>>> +err_rpm_put:
>>> +	pm_runtime_put_sync_suspend(ptdev->base.dev);
>>> +	return ret;
>>> +}
>>> +
>>> +#define PANTHOR_EXCEPTION(id) \
>>> +	[DRM_PANTHOR_EXCEPTION_ ## id] = { \
>>> +		.name = #id, \
>>> +	}
>>> +
>>> +struct panthor_exception_info {
>>> +	const char *name;
>>> +};
>>> +
>>> +static const struct panthor_exception_info panthor_exception_infos[] = {
>>> +	PANTHOR_EXCEPTION(OK),
>>> +	PANTHOR_EXCEPTION(TERMINATED),
>>> +	PANTHOR_EXCEPTION(KABOOM),
>>> +	PANTHOR_EXCEPTION(EUREKA),
>>> +	PANTHOR_EXCEPTION(ACTIVE),
>>> +	PANTHOR_EXCEPTION(CS_RES_TERM),
>>> +	PANTHOR_EXCEPTION(CS_CONFIG_FAULT),
>>> +	PANTHOR_EXCEPTION(CS_ENDPOINT_FAULT),
>>> +	PANTHOR_EXCEPTION(CS_BUS_FAULT),
>>> +	PANTHOR_EXCEPTION(CS_INSTR_INVALID),
>>> +	PANTHOR_EXCEPTION(CS_CALL_STACK_OVERFLOW),
>>> +	PANTHOR_EXCEPTION(CS_INHERIT_FAULT),
>>> +	PANTHOR_EXCEPTION(INSTR_INVALID_PC),
>>> +	PANTHOR_EXCEPTION(INSTR_INVALID_ENC),
>>> +	PANTHOR_EXCEPTION(INSTR_BARRIER_FAULT),
>>> +	PANTHOR_EXCEPTION(DATA_INVALID_FAULT),
>>> +	PANTHOR_EXCEPTION(TILE_RANGE_FAULT),
>>> +	PANTHOR_EXCEPTION(ADDR_RANGE_FAULT),
>>> +	PANTHOR_EXCEPTION(IMPRECISE_FAULT),
>>> +	PANTHOR_EXCEPTION(OOM),
>>> +	PANTHOR_EXCEPTION(CSF_FW_INTERNAL_ERROR),
>>> +	PANTHOR_EXCEPTION(CSF_RES_EVICTION_TIMEOUT),
>>> +	PANTHOR_EXCEPTION(GPU_BUS_FAULT),
>>> +	PANTHOR_EXCEPTION(GPU_SHAREABILITY_FAULT),
>>> +	PANTHOR_EXCEPTION(SYS_SHAREABILITY_FAULT),
>>> +	PANTHOR_EXCEPTION(GPU_CACHEABILITY_FAULT),
>>> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_0),
>>> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_1),
>>> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_2),
>>> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_3),
>>> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_4),
>>> +	PANTHOR_EXCEPTION(PERM_FAULT_0),
>>> +	PANTHOR_EXCEPTION(PERM_FAULT_1),
>>> +	PANTHOR_EXCEPTION(PERM_FAULT_2),
>>> +	PANTHOR_EXCEPTION(PERM_FAULT_3),
>>> +	PANTHOR_EXCEPTION(ACCESS_FLAG_1),
>>> +	PANTHOR_EXCEPTION(ACCESS_FLAG_2),
>>> +	PANTHOR_EXCEPTION(ACCESS_FLAG_3),
>>> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_IN),
>>> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT0),
>>> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT1),
>>> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT2),
>>> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT3),
>>> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_0),
>>> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_1),
>>> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_2),
>>> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_3),
>>> +};
>>> +
>>> +const char *panthor_exception_name(struct panthor_device *ptdev, u32 exception_code)
>>> +{
>>> +	if (drm_WARN_ON(&ptdev->base,  
>>
>> I'm not convinced this should be a WARN_ON as I suspect it's probably
>> possible to inject values from user space (although I'm not completely
>> sure on that).
> 
> Normally no (it's something returned by the FW), unless userspace gets
> access to the kernel <-> FW interface, which would be worrisome :-).

I've no idea if it's actually possible, but it feels like it should be
possible to create a firmware synchronisation object with an error code
chosen by the user and possibly then propagate that error code back to
the kernel. It's certainly not trivial though. Either way the WARN is
unnecessary.

>> It's certainly not a driver error as such if we can't
>> decode the value.
> 
> Ack on dropping the WARN_ON().
> 
>>
>>> +			exception_code >= ARRAY_SIZE(panthor_exception_infos) ||
>>> +			!panthor_exception_infos[exception_code].name))
>>> +		return "Unknown exception type";
>>> +
>>> +	return panthor_exception_infos[exception_code].name;
>>> +}
>>> +
>>> +static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
>>> +{
>>> +	struct vm_area_struct *vma = vmf->vma;
>>> +	struct panthor_device *ptdev = vma->vm_private_data;
>>> +	u64 id = vma->vm_pgoff << PAGE_SHIFT;
>>> +	unsigned long pfn;
>>> +	pgprot_t pgprot;
>>> +	vm_fault_t ret;
>>> +	bool active;
>>> +	int cookie;
>>> +
>>> +	if (!drm_dev_enter(&ptdev->base, &cookie))
>>> +		return VM_FAULT_SIGBUS;
>>> +
>>> +	mutex_lock(&ptdev->pm.lock);
>>> +	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
>>> +
>>> +	switch (id) {
>>> +	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
>>> +		if (active)
>>> +			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
>>> +		else
>>> +			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
>>> +		break;
>>> +
>>> +	default:
>>> +		ret = VM_FAULT_SIGBUS;
>>> +		goto out_unlock;
>>> +	}
>>> +
>>> +	pgprot = vma->vm_page_prot;
>>> +	if (active)
>>> +		pgprot = pgprot_noncached(pgprot);
>>> +
>>> +	ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
>>> +
>>> +out_unlock:
>>> +	mutex_unlock(&ptdev->pm.lock);
>>> +	drm_dev_exit(cookie);
>>> +	return ret;
>>> +}
>>> +
>>> +static const struct vm_operations_struct panthor_mmio_vm_ops = {
>>> +	.fault = panthor_mmio_vm_fault,
>>> +};
>>> +
>>> +int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *vma)
>>> +{
>>> +	u64 id = vma->vm_pgoff << PAGE_SHIFT;
>>> +
>>> +	switch (id) {
>>> +	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
>>> +		if (vma->vm_end - vma->vm_start != PAGE_SIZE ||
>>> +		    (vma->vm_flags & (VM_WRITE | VM_EXEC)))
>>> +			return -EINVAL;
>>> +
>>> +		break;
>>> +
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	/* Defer actual mapping to the fault handler. */
>>> +	vma->vm_private_data = ptdev;
>>> +	vma->vm_ops = &panthor_mmio_vm_ops;
>>> +	vm_flags_set(vma,
>>> +		     VM_IO | VM_DONTCOPY | VM_DONTEXPAND |
>>> +		     VM_NORESERVE | VM_DONTDUMP | VM_PFNMAP);
>>> +	return 0;
>>> +}
>>> +
>>> +#ifdef CONFIG_PM
>>> +int panthor_device_resume(struct device *dev)
>>> +{
>>> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
>>> +	int ret, cookie;
>>> +
>>> +	mutex_lock(&ptdev->pm.lock);
>>> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_RESUMING);
>>> +
>>> +	ret = clk_prepare_enable(ptdev->clks.core);
>>> +	if (ret)
>>> +		goto err_unlock;
>>> +
>>> +	ret = clk_prepare_enable(ptdev->clks.stacks);
>>> +	if (ret)
>>> +		goto err_disable_core_clk;
>>> +
>>> +	ret = clk_prepare_enable(ptdev->clks.coregroup);
>>> +	if (ret)
>>> +		goto err_disable_stacks_clk;
>>> +
>>> +	ret = panthor_devfreq_resume(ptdev);
>>> +	if (ret)
>>> +		goto err_disable_coregroup_clk;
>>> +
>>> +	if (panthor_device_is_initialized(ptdev) &&
>>> +	    drm_dev_enter(&ptdev->base, &cookie)) {
>>> +		panthor_gpu_resume(ptdev);
>>> +		panthor_mmu_resume(ptdev);
>>> +		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>>> +		if (!ret)
>>> +			panthor_sched_resume(ptdev);
>>> +
>>> +		drm_dev_exit(cookie);
>>> +
>>> +		if (ret)
>>> +			goto err_devfreq_suspend;
>>> +	}
>>> +
>>> +	/* Clear all IOMEM mappings pointing to this device after we've
>>> +	 * resumed. This way the fake mappings pointing to the dummy pages
>>> +	 * are removed and the real iomem mapping will be restored on next
>>> +	 * access.
>>> +	 */
>>> +	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
>>> +			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
>>> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);  
>>
>> Is the ordering here correct? I think we need to set ACTIVE before the
>> unmap_mapping_range otherwise there is a (very small) race where user
>> space could fault the page (and get the dummy mapping) before the
>> atomic_set.
> 
> We take the pm.lock in panthor_mmio_vm_fault().
> 
>>
>> Hmm, actually we have the pm.lock, so no this isn't racy. In which case
>> is there a good reason that you're using atomics? I can see two accesses
>> which aren't protected by pm.lock:
>>
>>   * the early out in panthor_device_suspend() - which could easily be
>> moved inside the lock.
> 
> When we're in suspend() we are the one in control of the pm.state, so
> no race expected here.
> 
>>
>>   * panthor_device_schedule_reset() - this looks racy (the power down
>> could happen immediately after the atomic_read()), so I suspect it would
>> be better moving the check into panthor_device_reset_work() and
>> performing it with the pm.lock held.
> 
> I think the main reason for it being an atomic is because I didn't
> have PM locking in the initial implementation, but I ended adding
> locking at some point because I didn't really have choice. I thought
> the race didn't exist because of the workqueue synchronization/work
> cancellation that happens in panthor_sched_suspend(), but I see now
> that it's not protecting us (thread queuing the job could be paused
> just after checking the PM state and resumed after the suspend
> happened). This being said, we might have a lock ordering issue if we
> take the PM lock in that path (I need to check that).

Yeah I didn't bother to check whether it would create ordering issues...
;) I'll leave you to figure out the fix - the whole atomic + mutex was
confusing and doesn't seem to have quite worked.

[...]

>>> +
>>> +/**
>>> + * PANTHOR_IRQ_HANDLER() - Define interrupt handlers and the interrupt
>>> + * registration function.
>>> + *
>>> + * The boiler-plate to gracefully deal with shared interrupts is
>>> + * auto-generated. All you have to do is call PANTHOR_IRQ_HANDLER()
>>> + * just after you actual handler. The handler prototype is:  
>> s/you/your/ or probably s/you/the/ since we don't expect people to be
>> adding more ;)
>>
>>> + *
>>> + * void (*handler)(struct panthor_device *, u32 status);
>>> + */
>>> +#define PANTHOR_IRQ_HANDLER(__name, __reg_prefix, __handler)					\
>>> +static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)			\
>>> +{												\
>>> +	struct panthor_irq *pirq = data;							\
>>> +	struct panthor_device *ptdev = pirq->ptdev;						\  
>>
>> Maybe I'm missing something, but I was expecting a check here for if the
>> irq has been suspended and to avoid the register reads if it was.
> 
> Thought the INT_MASK=0 + synchronize_irq() in panthor_xxx_irq_suspend()
> would guarantee that the handler can't be called after
> panthor_xxx_irq_suspend() was called.

If the IRQ is shared then Linux doesn't know which device caused the
interrupt, so another device's (shared) interrupt could cause our
handler to be run.

>> Otherwise I'm not entirely sure I follow what all this code is for.
> 
> Not entirely sure which code we're talking about. The reason we
> don't use the default raw IRQ handler is because it doesn't work if the
> irq line is shared. In that case, we need to mask all interrupts to
> make sure other handlers on the same irq line don't get spammed with
> our IRQs.

What I'm not following is why we need all this extra infrastructure for
IRQs. The 'setting the mask to 0' during suspend is simple enough and
could be included in code which now calls panthor_xxx_irq_suspend()
(equally for restoring the mask on resume). But there's a loads more
code here.

My initial thought when I looked at this was that you were trying to
solve the issue of a shared IRQ where Mali might get powered off, but
the IRQ is then triggered by another device. In that case touching the
Mali registers would be problematic, so I was expecting some code in
_irq_raw_handler() to check whether the IRQ couldn't possibly be for us
(i.e. mask==0) and early out with IRQ_NONE. kbase has a concept like
this "gpu_powered" for exactly this reason.

But I can't see anything in the code to handle that case. And the
"spamming" of other drivers during suspend shouldn't really happen
(there's something odd going on if the hardware is generating interrupts
when it's meant to be suspended).

But maybe I'm just missing something - it's a while since I've dealt
with interrupt code in Linux.

Steve

>>
>> Steve
>>
>>> +												\
>>> +	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
>>> +		return IRQ_NONE;								\
>>> +												\
>>> +	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
>>> +	return IRQ_WAKE_THREAD;									\
>>> +}												\
>>> +												\
>>> +static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *data)		\
>>> +{												\
>>> +	struct panthor_irq *pirq = data;							\
>>> +	struct panthor_device *ptdev = pirq->ptdev;						\
>>> +	irqreturn_t ret = IRQ_NONE;								\
>>> +												\
>>> +	while (true) {										\
>>> +		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
>>> +												\
>>> +		if (!status)									\
>>> +			break;									\
>>> +												\
>>> +		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
>>> +												\
>>> +		__handler(ptdev, status);							\
>>> +		ret = IRQ_HANDLED;								\
>>> +	}											\
>>> +												\
>>> +	if (!atomic_read(&pirq->suspended))							\
>>> +		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
>>> +												\
>>> +	return ret;										\
>>> +}												\
>>> +												\
>>> +static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
>>> +{												\
>>> +	int cookie;										\
>>> +												\
>>> +	atomic_set(&pirq->suspended, true);							\
>>> +												\
>>> +	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
>>> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
>>> +		synchronize_irq(pirq->irq);							\
>>> +		drm_dev_exit(cookie);								\
>>> +	}											\
>>> +												\
>>> +	pirq->mask = 0;										\
>>> +}												\
>>> +												\
>>> +static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
>>> +{												\
>>> +	int cookie;										\
>>> +												\
>>> +	atomic_set(&pirq->suspended, false);							\
>>> +	pirq->mask = mask;									\
>>> +												\
>>> +	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
>>> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);			\
>>> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
>>> +		drm_dev_exit(cookie);								\
>>> +	}											\
>>> +}												\
>>> +												\
>>> +static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>>> +					      struct panthor_irq *pirq,				\
>>> +					      int irq, u32 mask)				\
>>> +{												\
>>> +	pirq->ptdev = ptdev;									\
>>> +	pirq->irq = irq;									\
>>> +	panthor_ ## __name ## _irq_resume(pirq, mask);						\
>>> +												\
>>> +	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
>>> +					 panthor_ ## __name ## _irq_raw_handler,		\
>>> +					 panthor_ ## __name ## _irq_threaded_handler,		\
>>> +					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
>>> +					 pirq);							\
>>> +}
>>> +
>>> +extern struct workqueue_struct *panthor_cleanup_wq;
>>> +
>>> +#endif  
>>
> 

