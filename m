Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93652779375
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 17:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7675D10E6A9;
	Fri, 11 Aug 2023 15:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C382210E6AB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 15:48:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12FF113E;
 Fri, 11 Aug 2023 08:48:43 -0700 (PDT)
Received: from [10.1.30.25] (e122027.cambridge.arm.com [10.1.30.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8638E3F64C;
 Fri, 11 Aug 2023 08:47:58 -0700 (PDT)
Message-ID: <73cbc1ea-5e2e-b201-b717-4ceef37e490d@arm.com>
Date: Fri, 11 Aug 2023 16:47:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/15] drm/panthor: Add the device logical block
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230809165330.2451699-5-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/08/2023 17:53, Boris Brezillon wrote:
> The panthor driver is designed in a modular way, where each logical
> block is dealing with a specific HW-block or software feature. In order
> for those blocks to communicate with each other, we need a central
> panthor_device collecting all the blocks, and exposing some common
> features, like interrupt handling, power management, reset, ...
> 
> This what this panthor_device logical block is about.
> 
> v2:
> - Rename the driver (pancsf -> panthor)
> - Change the license (GPL2 -> MIT + GPL2)
> - Split the driver addition commit
> - Add devfreq/PM support
> - Use drm_dev_{unplug,enter,exit}() to provide safe device removal
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 479 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h | 354 +++++++++++++++++
>  2 files changed, 833 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> new file mode 100644
> index 000000000000..15f102116fa0
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2023 Collabora ltd. */
> +
> +#include <linux/clk.h>
> +#include <linux/reset.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +
> +#include "panthor_sched.h"
> +#include "panthor_device.h"
> +#include "panthor_devfreq.h"
> +#include "panthor_gpu.h"
> +#include "panthor_fw.h"
> +#include "panthor_mmu.h"
> +#include "panthor_regs.h"
> +
> +static int panthor_clk_init(struct panthor_device *ptdev)
> +{
> +	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
> +	if (IS_ERR(ptdev->clks.core)) {
> +		drm_err(&ptdev->base, "get 'core' clock failed %ld\n",
> +			PTR_ERR(ptdev->clks.core));

I suspect it would be a good idea to use dev_err_probe() here (and
below) as I believe devm_clk_get can return -EPROBE_DEFER.

> +		return PTR_ERR(ptdev->clks.core);
> +	}
> +
> +	ptdev->clks.stacks = devm_clk_get_optional(ptdev->base.dev, "stacks");
> +	if (IS_ERR(ptdev->clks.stacks)) {
> +		drm_err(&ptdev->base, "get 'stacks' clock failed %ld\n",
> +			PTR_ERR(ptdev->clks.stacks));
> +		return PTR_ERR(ptdev->clks.stacks);
> +	}
> +
> +	ptdev->clks.coregroup = devm_clk_get_optional(ptdev->base.dev, "coregroup");
> +	if (IS_ERR(ptdev->clks.coregroup)) {
> +		drm_err(&ptdev->base, "get 'coregroup' clock failed %ld\n",
> +			PTR_ERR(ptdev->clks.coregroup));
> +		return PTR_ERR(ptdev->clks.coregroup);
> +	}
> +
> +	drm_info(&ptdev->base, "clock rate = %lu\n", clk_get_rate(ptdev->clks.core));
> +	return 0;
> +}
> +
> +void panthor_device_unplug(struct panthor_device *ptdev)
> +{
> +	/* FIXME: This is racy. */

Can we fix this? From a quick look it seems like a sequence like below
should avoid the race.

	if (!drm_dev_enter())
		/* Already unplugged */
		return;
	ptdev->base.unplugged = true;
	drm_dev_exit();

Although possibly that should be in the DRM core rather than open-coded
here.

> +	if (drm_dev_is_unplugged(&ptdev->base))
> +		return;
> +
> +	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> +
> +	/* Call drm_dev_unplug() so any access to HW block happening after
> +	 * that point get rejected.
> +	 */
> +	drm_dev_unplug(&ptdev->base);
> +
> +	/* Now, try to cleanly shutdown the GPU before the device resources
> +	 * get reclaimed.
> +	 */
> +	panthor_sched_unplug(ptdev);
> +	panthor_fw_unplug(ptdev);
> +	panthor_mmu_unplug(ptdev);
> +	panthor_gpu_unplug(ptdev);
> +
> +	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +	pm_runtime_put_sync_suspend(ptdev->base.dev);
> +}
> +
> +static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
> +{
> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> +
> +	cancel_work_sync(&ptdev->reset.work);
> +	destroy_workqueue(ptdev->reset.wq);
> +}
> +
> +static void panthor_device_reset_work(struct work_struct *work)
> +{
> +	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
> +	int ret, cookie;
> +
> +	if (!drm_dev_enter(&ptdev->base, &cookie))
> +		return;
> +
> +	panthor_sched_pre_reset(ptdev);
> +	panthor_fw_pre_reset(ptdev, true);
> +	panthor_mmu_pre_reset(ptdev);
> +	panthor_gpu_soft_reset(ptdev);
> +	panthor_gpu_l2_power_on(ptdev);
> +	panthor_mmu_post_reset(ptdev);
> +	ret = panthor_fw_post_reset(ptdev);
> +	if (ret)
> +		goto out;
> +
> +	atomic_set(&ptdev->reset.pending, 0);
> +	panthor_sched_post_reset(ptdev);
> +	drm_dev_exit(cookie);
> +
> +out:
> +	if (ret) {

This looks like a race condition too - is there a need for a
drm_dev_exit_and_unplug() function?

> +		panthor_device_unplug(ptdev);
> +		drm_err(&ptdev->base, "Failed to boot MCU after reset, making device unusable.");
> +	}
> +}
> +
> +static bool panthor_device_is_initialized(struct panthor_device *ptdev)
> +{
> +	return !!ptdev->scheduler;
> +}
> +
> +static void panthor_device_free_page(struct drm_device *ddev, void *data)
> +{
> +	free_page((unsigned long)data);
> +}
> +
> +int panthor_device_init(struct panthor_device *ptdev)
> +{
> +	struct resource *res;
> +	struct page *p;
> +	int ret;
> +
> +	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> +
> +	drmm_mutex_init(&ptdev->base, &ptdev->pm.lock);
> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> +	p = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	ptdev->pm.dummy_latest_flush = page_address(p);
> +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
> +				       ptdev->pm.dummy_latest_flush);
> +	if (ret)
> +		return ret;
> +
> +	/* Set the dummy page to the default LATEST_FLUSH value. This
> +	 * will be updated on the next suspend.
> +	 */
> +	*ptdev->pm.dummy_latest_flush = CSF_GPU_LATEST_FLUSH_ID_DEFAULT;

I see why this register default value was defined. Although I'm not sure
it has any benefit over just using zero... If the GPU is off when user
space reads the FLUSH_ID then the GPU's caches are definitely empty so
any flush ID is valid.

Interestingly looking at kbase it seems to use an initial value of 1
(POWER_DOWN_LATEST_FLUSH_VALUE). I guess zero is less ideal because
FLUSH_CACHE2 would then unconditionally do a flush.

> +
> +	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
> +	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
> +	if (!ptdev->reset.wq)
> +		return -ENOMEM;
> +
> +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_clk_init(ptdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_devfreq_init(ptdev);
> +	if (ret)
> +		return ret;
> +
> +	ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
> +							      0, &res);
> +	if (IS_ERR(ptdev->iomem))
> +		return PTR_ERR(ptdev->iomem);
> +
> +	ptdev->phys_addr = res->start;
> +
> +	ret = devm_pm_runtime_enable(ptdev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_gpu_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = panthor_mmu_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = panthor_fw_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	ret = panthor_sched_init(ptdev);
> +	if (ret)
> +		goto err_rpm_put;
> +
> +	/* ~3 frames */
> +	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
> +	pm_runtime_use_autosuspend(ptdev->base.dev);
> +	pm_runtime_put_autosuspend(ptdev->base.dev);
> +	return 0;
> +
> +err_rpm_put:
> +	pm_runtime_put_sync_suspend(ptdev->base.dev);
> +	return ret;
> +}
> +
> +#define PANTHOR_EXCEPTION(id) \
> +	[DRM_PANTHOR_EXCEPTION_ ## id] = { \
> +		.name = #id, \
> +	}
> +
> +struct panthor_exception_info {
> +	const char *name;
> +};
> +
> +static const struct panthor_exception_info panthor_exception_infos[] = {
> +	PANTHOR_EXCEPTION(OK),
> +	PANTHOR_EXCEPTION(TERMINATED),
> +	PANTHOR_EXCEPTION(KABOOM),
> +	PANTHOR_EXCEPTION(EUREKA),
> +	PANTHOR_EXCEPTION(ACTIVE),
> +	PANTHOR_EXCEPTION(CS_RES_TERM),
> +	PANTHOR_EXCEPTION(CS_CONFIG_FAULT),
> +	PANTHOR_EXCEPTION(CS_ENDPOINT_FAULT),
> +	PANTHOR_EXCEPTION(CS_BUS_FAULT),
> +	PANTHOR_EXCEPTION(CS_INSTR_INVALID),
> +	PANTHOR_EXCEPTION(CS_CALL_STACK_OVERFLOW),
> +	PANTHOR_EXCEPTION(CS_INHERIT_FAULT),
> +	PANTHOR_EXCEPTION(INSTR_INVALID_PC),
> +	PANTHOR_EXCEPTION(INSTR_INVALID_ENC),
> +	PANTHOR_EXCEPTION(INSTR_BARRIER_FAULT),
> +	PANTHOR_EXCEPTION(DATA_INVALID_FAULT),
> +	PANTHOR_EXCEPTION(TILE_RANGE_FAULT),
> +	PANTHOR_EXCEPTION(ADDR_RANGE_FAULT),
> +	PANTHOR_EXCEPTION(IMPRECISE_FAULT),
> +	PANTHOR_EXCEPTION(OOM),
> +	PANTHOR_EXCEPTION(CSF_FW_INTERNAL_ERROR),
> +	PANTHOR_EXCEPTION(CSF_RES_EVICTION_TIMEOUT),
> +	PANTHOR_EXCEPTION(GPU_BUS_FAULT),
> +	PANTHOR_EXCEPTION(GPU_SHAREABILITY_FAULT),
> +	PANTHOR_EXCEPTION(SYS_SHAREABILITY_FAULT),
> +	PANTHOR_EXCEPTION(GPU_CACHEABILITY_FAULT),
> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_0),
> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_1),
> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_2),
> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_3),
> +	PANTHOR_EXCEPTION(TRANSLATION_FAULT_4),
> +	PANTHOR_EXCEPTION(PERM_FAULT_0),
> +	PANTHOR_EXCEPTION(PERM_FAULT_1),
> +	PANTHOR_EXCEPTION(PERM_FAULT_2),
> +	PANTHOR_EXCEPTION(PERM_FAULT_3),
> +	PANTHOR_EXCEPTION(ACCESS_FLAG_1),
> +	PANTHOR_EXCEPTION(ACCESS_FLAG_2),
> +	PANTHOR_EXCEPTION(ACCESS_FLAG_3),
> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_IN),
> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT0),
> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT1),
> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT2),
> +	PANTHOR_EXCEPTION(ADDR_SIZE_FAULT_OUT3),
> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_0),
> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_1),
> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_2),
> +	PANTHOR_EXCEPTION(MEM_ATTR_FAULT_3),
> +};
> +
> +const char *panthor_exception_name(struct panthor_device *ptdev, u32 exception_code)
> +{
> +	if (drm_WARN_ON(&ptdev->base,

I'm not convinced this should be a WARN_ON as I suspect it's probably
possible to inject values from user space (although I'm not completely
sure on that). It's certainly not a driver error as such if we can't
decode the value.

> +			exception_code >= ARRAY_SIZE(panthor_exception_infos) ||
> +			!panthor_exception_infos[exception_code].name))
> +		return "Unknown exception type";
> +
> +	return panthor_exception_infos[exception_code].name;
> +}
> +
> +static vm_fault_t panthor_mmio_vm_fault(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct panthor_device *ptdev = vma->vm_private_data;
> +	u64 id = vma->vm_pgoff << PAGE_SHIFT;
> +	unsigned long pfn;
> +	pgprot_t pgprot;
> +	vm_fault_t ret;
> +	bool active;
> +	int cookie;
> +
> +	if (!drm_dev_enter(&ptdev->base, &cookie))
> +		return VM_FAULT_SIGBUS;
> +
> +	mutex_lock(&ptdev->pm.lock);
> +	active = atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE;
> +
> +	switch (id) {
> +	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
> +		if (active)
> +			pfn = __phys_to_pfn(ptdev->phys_addr + CSF_GPU_LATEST_FLUSH_ID);
> +		else
> +			pfn = virt_to_pfn(ptdev->pm.dummy_latest_flush);
> +		break;
> +
> +	default:
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_unlock;
> +	}
> +
> +	pgprot = vma->vm_page_prot;
> +	if (active)
> +		pgprot = pgprot_noncached(pgprot);
> +
> +	ret = vmf_insert_pfn_prot(vma, vmf->address, pfn, pgprot);
> +
> +out_unlock:
> +	mutex_unlock(&ptdev->pm.lock);
> +	drm_dev_exit(cookie);
> +	return ret;
> +}
> +
> +static const struct vm_operations_struct panthor_mmio_vm_ops = {
> +	.fault = panthor_mmio_vm_fault,
> +};
> +
> +int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *vma)
> +{
> +	u64 id = vma->vm_pgoff << PAGE_SHIFT;
> +
> +	switch (id) {
> +	case DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET:
> +		if (vma->vm_end - vma->vm_start != PAGE_SIZE ||
> +		    (vma->vm_flags & (VM_WRITE | VM_EXEC)))
> +			return -EINVAL;
> +
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* Defer actual mapping to the fault handler. */
> +	vma->vm_private_data = ptdev;
> +	vma->vm_ops = &panthor_mmio_vm_ops;
> +	vm_flags_set(vma,
> +		     VM_IO | VM_DONTCOPY | VM_DONTEXPAND |
> +		     VM_NORESERVE | VM_DONTDUMP | VM_PFNMAP);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +int panthor_device_resume(struct device *dev)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +	int ret, cookie;
> +
> +	mutex_lock(&ptdev->pm.lock);
> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_RESUMING);
> +
> +	ret = clk_prepare_enable(ptdev->clks.core);
> +	if (ret)
> +		goto err_unlock;
> +
> +	ret = clk_prepare_enable(ptdev->clks.stacks);
> +	if (ret)
> +		goto err_disable_core_clk;
> +
> +	ret = clk_prepare_enable(ptdev->clks.coregroup);
> +	if (ret)
> +		goto err_disable_stacks_clk;
> +
> +	ret = panthor_devfreq_resume(ptdev);
> +	if (ret)
> +		goto err_disable_coregroup_clk;
> +
> +	if (panthor_device_is_initialized(ptdev) &&
> +	    drm_dev_enter(&ptdev->base, &cookie)) {
> +		panthor_gpu_resume(ptdev);
> +		panthor_mmu_resume(ptdev);
> +		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> +		if (!ret)
> +			panthor_sched_resume(ptdev);
> +
> +		drm_dev_exit(cookie);
> +
> +		if (ret)
> +			goto err_devfreq_suspend;
> +	}
> +
> +	/* Clear all IOMEM mappings pointing to this device after we've
> +	 * resumed. This way the fake mappings pointing to the dummy pages
> +	 * are removed and the real iomem mapping will be restored on next
> +	 * access.
> +	 */
> +	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
> +			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);

Is the ordering here correct? I think we need to set ACTIVE before the
unmap_mapping_range otherwise there is a (very small) race where user
space could fault the page (and get the dummy mapping) before the
atomic_set.

Hmm, actually we have the pm.lock, so no this isn't racy. In which case
is there a good reason that you're using atomics? I can see two accesses
which aren't protected by pm.lock:

  * the early out in panthor_device_suspend() - which could easily be
moved inside the lock.

  * panthor_device_schedule_reset() - this looks racy (the power down
could happen immediately after the atomic_read()), so I suspect it would
be better moving the check into panthor_device_reset_work() and
performing it with the pm.lock held.

> +	if (atomic_read(&ptdev->reset.pending))
> +		queue_work(ptdev->reset.wq, &ptdev->reset.work);
> +
> +	mutex_unlock(&ptdev->pm.lock);
> +	return 0;
> +
> +err_devfreq_suspend:
> +	panthor_devfreq_suspend(ptdev);
> +
> +err_disable_coregroup_clk:
> +	clk_disable_unprepare(ptdev->clks.coregroup);
> +
> +err_disable_stacks_clk:
> +	clk_disable_unprepare(ptdev->clks.stacks);
> +
> +err_disable_core_clk:
> +	clk_disable_unprepare(ptdev->clks.core);
> +
> +err_unlock:
> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> +	mutex_unlock(&ptdev->pm.lock);
> +	return ret;
> +}
> +
> +int panthor_device_suspend(struct device *dev)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +	int ret, cookie;
> +
> +	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE)
> +		return 0;
> +
> +	mutex_lock(&ptdev->pm.lock);
> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDING);
> +
> +	/* Clear all IOMEM mappings pointing to this device before we
> +	 * shutdown the power-domain and clocks. Failing to do that results
> +	 * in external aborts when the process accesses the iomem region.
> +	 */
> +	unmap_mapping_range(ptdev->base.anon_inode->i_mapping,
> +			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> +
> +	if (panthor_device_is_initialized(ptdev) &&
> +	    drm_dev_enter(&ptdev->base, &cookie)) {
> +		cancel_work_sync(&ptdev->reset.work);
> +
> +		/* We prepare everything as if we were resetting the GPU.
> +		 * The end of the reset will happen in the resume path though.
> +		 */
> +		panthor_sched_suspend(ptdev);
> +		panthor_fw_suspend(ptdev);
> +		panthor_mmu_suspend(ptdev);
> +		panthor_gpu_suspend(ptdev);
> +		drm_dev_exit(cookie);
> +	}
> +
> +	ret = panthor_devfreq_suspend(ptdev);
> +	if (ret) {
> +		if (panthor_device_is_initialized(ptdev) &&
> +		    drm_dev_enter(&ptdev->base, &cookie)) {
> +			panthor_gpu_resume(ptdev);
> +			panthor_mmu_resume(ptdev);
> +			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> +			panthor_sched_resume(ptdev);
> +			drm_dev_exit(cookie);
> +		}
> +
> +		atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
> +		goto out_unlock;
> +	}
> +
> +	/* Before we suspend, update the dummy_latest_flush page, so accesses
> +	 * to this dummy page return the value the HW would have returned.
> +	 */
> +	*ptdev->pm.dummy_latest_flush = gpu_read(ptdev, CSF_GPU_LATEST_FLUSH_ID);

As above, I don't believe it is important for user space to know the
value the HW would have returned during a suspend. Indeed if the
hardware was successfully suspended the flush ID is likely to be reset -
so this would be inaccurate. However any value should be safe if the
work was prepared while the GPU was off as the caches will be empty.

> +
> +	clk_disable_unprepare(ptdev->clks.coregroup);
> +	clk_disable_unprepare(ptdev->clks.stacks);
> +	clk_disable_unprepare(ptdev->clks.core);
> +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> +
> +out_unlock:
> +	mutex_unlock(&ptdev->pm.lock);
> +	return ret;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> new file mode 100644
> index 000000000000..e0e1be263eb9
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -0,0 +1,354 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> +/* Copyright 2023 Collabora ltd. */
> +
> +#ifndef __PANTHOR_DEVICE_H__
> +#define __PANTHOR_DEVICE_H__
> +
> +#include <linux/atomic.h>
> +#include <linux/io-pgtable.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/spinlock.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_mm.h>
> +#include <drm/gpu_scheduler.h>
> +#include <drm/panthor_drm.h>
> +
> +struct panthor_csf;
> +struct panthor_csf_ctx;
> +struct panthor_device;
> +struct panthor_gpu;
> +struct panthor_group_pool;
> +struct panthor_heap_pool;
> +struct panthor_job;
> +struct panthor_mmu;
> +struct panthor_fw;
> +struct panthor_perfcnt;
> +struct panthor_vm;
> +struct panthor_vm_pool;
> +
> +/**
> + * enum panthor_device_pm_state - PM state
> + */
> +enum panthor_device_pm_state {
> +	/** @PANTHOR_DEVICE_PM_STATE_SUSPENDED: Device is suspended. */
> +	PANTHOR_DEVICE_PM_STATE_SUSPENDED = 0,
> +
> +	/** @PANTHOR_DEVICE_PM_STATE_RESUMING: Device is being resumed. */
> +	PANTHOR_DEVICE_PM_STATE_RESUMING,
> +
> +	/** @PANTHOR_DEVICE_PM_STATE_ACTIVE: Device is active. */
> +	PANTHOR_DEVICE_PM_STATE_ACTIVE,
> +
> +	/** @PANTHOR_DEVICE_PM_STATE_SUSPENDING: Device is being suspended. */
> +	PANTHOR_DEVICE_PM_STATE_SUSPENDING,
> +};
> +
> +/**
> + * struct panthor_irq - IRQ data
> + *
> + * Used to automate IRQ handling for the 3 different IRQs we have in this driver.
> + */
> +struct panthor_irq {
> +	/** @ptdev: Panthor device */
> +	struct panthor_device *ptdev;
> +
> +	/** @irq: IRQ number. */
> +	int irq;
> +
> +	/** @mask: Current mask being applied to xxx_INT_MASK. */
> +	u32 mask;
> +
> +	/** @suspended: Set to true when the IRQ is suspended. */
> +	atomic_t suspended;
> +};
> +
> +/**
> + * struct panthor_device - Panthor device
> + */
> +struct panthor_device {
> +	/** @base: Base drm_device. */
> +	struct drm_device base;
> +
> +	/** @phys_addr: Physical address of the iomem region. */
> +	phys_addr_t phys_addr;
> +
> +	/** @iomem: CPU mapping of the IOMEM region. */
> +	void __iomem *iomem;
> +
> +	/** @clks: GPU clocks. */
> +	struct {
> +		/** @core: Core clock. */
> +		struct clk *core;
> +
> +		/** @stacks: Stacks clock. This clock is optional. */
> +		struct clk *stacks;
> +
> +		/** @coregroup: Core group clock. This clock is optional. */
> +		struct clk *coregroup;
> +	} clks;
> +
> +	/** @coherent: True if the CPU/GPU are memory coherent. */
> +	bool coherent;
> +
> +	/** @gpu_info: GPU information. */
> +	struct drm_panthor_gpu_info gpu_info;
> +
> +	/** @csif_info: Command stream interface information. */
> +	struct drm_panthor_csif_info csif_info;
> +
> +	/** @gpu: GPU management data. */
> +	struct panthor_gpu *gpu;
> +
> +	/** @fw: FW management data. */
> +	struct panthor_fw *fw;
> +
> +	/** @mmu: MMU management data. */
> +	struct panthor_mmu *mmu;
> +
> +	/** @scheduler: Scheduler management data. */
> +	struct panthor_scheduler *scheduler;
> +
> +	/** @devfreq: Device frequency scaling management data. */
> +	struct panthor_devfreq *devfreq;
> +
> +	/** @reset: Reset related fields. */
> +	struct {
> +		/** @wq: Ordered worqueud used to schedule reset operations. */
> +		struct workqueue_struct *wq;
> +
> +		/** @work: Reset work. */
> +		struct work_struct work;
> +
> +		/** @pending: Set to true if a reset is pending. */
> +		atomic_t pending;
> +	} reset;
> +
> +	/** @pm: Power management related data. */
> +	struct {
> +		/** @state: Power state, see panthor_device_pm_state. */
> +		atomic_t state;
> +
> +		/**
> +		 * @lock: Lock protecting the suspend/resume operations.
> +		 *
> +		 * This is needed to ensure we map the dummy IO pages when
> +		 * the device is being suspended, and the real IO pages when
> +		 * the device is being resumed. We can't just do with the
> +		 * state atomicity to deal with this race.
> +		 */
> +		struct mutex lock;
> +
> +		/**
> +		 * @dummy_latest_flush: Dummy LATEST_FLUSH page.
> +		 *
> +		 * Used to replace the real LATEST_FLUSH page when the GPU
> +		 * is suspended.
> +		 */
> +		u32 *dummy_latest_flush;
> +	} pm;
> +};
> +
> +/**
> + * struct panthor_file - Panthor file
> + */
> +struct panthor_file {
> +	/** @ptdev: Device attached to this file. */
> +	struct panthor_device *ptdev;
> +
> +	/** @vms: VM pool attached to this file. */
> +	struct panthor_vm_pool *vms;
> +
> +	/** @groups: Scheduling group pool attached to this file. */
> +	struct panthor_group_pool *groups;
> +};
> +
> +int panthor_device_init(struct panthor_device *ptdev);
> +void panthor_device_unplug(struct panthor_device *ptdev);
> +
> +/**
> + * panthor_device_schedule_reset() - Schedules a reset operation
> + */
> +static inline void panthor_device_schedule_reset(struct panthor_device *ptdev)
> +{
> +	if (atomic_read(&ptdev->pm.state) == PANTHOR_DEVICE_PM_STATE_ACTIVE &&

As above - this is a racy check. Although it might be safe because of
the cancel_work_sync() call in panthor_device_suspend(). But if we get
rid of this check we don't need the atomic variable.

> +	    !atomic_cmpxchg(&ptdev->reset.pending, 0, 1))
> +		queue_work(ptdev->reset.wq, &ptdev->reset.work);
> +}
> +
> +/**
> + * panthor_device_reset_is_pending() - Checks if a reset is pending.
> + *
> + * Return: true if a reset is pending, false otherwise.
> + */
> +static inline bool panthor_device_reset_is_pending(struct panthor_device *ptdev)
> +{
> +	return atomic_read(&ptdev->reset.pending) != 0;
> +}
> +
> +int panthor_device_mmap_io(struct panthor_device *ptdev,
> +			   struct vm_area_struct *vma);
> +
> +int panthor_device_resume(struct device *dev);
> +int panthor_device_suspend(struct device *dev);
> +
> +enum drm_panthor_exception_type {
> +	DRM_PANTHOR_EXCEPTION_OK = 0x00,
> +	DRM_PANTHOR_EXCEPTION_TERMINATED = 0x04,
> +	DRM_PANTHOR_EXCEPTION_KABOOM = 0x05,
> +	DRM_PANTHOR_EXCEPTION_EUREKA = 0x06,
> +	DRM_PANTHOR_EXCEPTION_ACTIVE = 0x08,
> +	DRM_PANTHOR_EXCEPTION_CS_RES_TERM = 0x0f,
> +	DRM_PANTHOR_EXCEPTION_MAX_NON_FAULT = 0x3f,
> +	DRM_PANTHOR_EXCEPTION_CS_CONFIG_FAULT = 0x40,
> +	DRM_PANTHOR_EXCEPTION_CS_ENDPOINT_FAULT = 0x44,
> +	DRM_PANTHOR_EXCEPTION_CS_BUS_FAULT = 0x48,
> +	DRM_PANTHOR_EXCEPTION_CS_INSTR_INVALID = 0x49,
> +	DRM_PANTHOR_EXCEPTION_CS_CALL_STACK_OVERFLOW = 0x4a,
> +	DRM_PANTHOR_EXCEPTION_CS_INHERIT_FAULT = 0x4b,
> +	DRM_PANTHOR_EXCEPTION_INSTR_INVALID_PC = 0x50,
> +	DRM_PANTHOR_EXCEPTION_INSTR_INVALID_ENC = 0x51,
> +	DRM_PANTHOR_EXCEPTION_INSTR_BARRIER_FAULT = 0x55,
> +	DRM_PANTHOR_EXCEPTION_DATA_INVALID_FAULT = 0x58,
> +	DRM_PANTHOR_EXCEPTION_TILE_RANGE_FAULT = 0x59,
> +	DRM_PANTHOR_EXCEPTION_ADDR_RANGE_FAULT = 0x5a,
> +	DRM_PANTHOR_EXCEPTION_IMPRECISE_FAULT = 0x5b,
> +	DRM_PANTHOR_EXCEPTION_OOM = 0x60,
> +	DRM_PANTHOR_EXCEPTION_CSF_FW_INTERNAL_ERROR = 0x68,
> +	DRM_PANTHOR_EXCEPTION_CSF_RES_EVICTION_TIMEOUT = 0x69,
> +	DRM_PANTHOR_EXCEPTION_GPU_BUS_FAULT = 0x80,
> +	DRM_PANTHOR_EXCEPTION_GPU_SHAREABILITY_FAULT = 0x88,
> +	DRM_PANTHOR_EXCEPTION_SYS_SHAREABILITY_FAULT = 0x89,
> +	DRM_PANTHOR_EXCEPTION_GPU_CACHEABILITY_FAULT = 0x8a,
> +	DRM_PANTHOR_EXCEPTION_TRANSLATION_FAULT_0 = 0xc0,
> +	DRM_PANTHOR_EXCEPTION_TRANSLATION_FAULT_1 = 0xc1,
> +	DRM_PANTHOR_EXCEPTION_TRANSLATION_FAULT_2 = 0xc2,
> +	DRM_PANTHOR_EXCEPTION_TRANSLATION_FAULT_3 = 0xc3,
> +	DRM_PANTHOR_EXCEPTION_TRANSLATION_FAULT_4 = 0xc4,
> +	DRM_PANTHOR_EXCEPTION_PERM_FAULT_0 = 0xc8,
> +	DRM_PANTHOR_EXCEPTION_PERM_FAULT_1 = 0xc9,
> +	DRM_PANTHOR_EXCEPTION_PERM_FAULT_2 = 0xca,
> +	DRM_PANTHOR_EXCEPTION_PERM_FAULT_3 = 0xcb,
> +	DRM_PANTHOR_EXCEPTION_ACCESS_FLAG_1 = 0xd9,
> +	DRM_PANTHOR_EXCEPTION_ACCESS_FLAG_2 = 0xda,
> +	DRM_PANTHOR_EXCEPTION_ACCESS_FLAG_3 = 0xdb,
> +	DRM_PANTHOR_EXCEPTION_ADDR_SIZE_FAULT_IN = 0xe0,
> +	DRM_PANTHOR_EXCEPTION_ADDR_SIZE_FAULT_OUT0 = 0xe4,
> +	DRM_PANTHOR_EXCEPTION_ADDR_SIZE_FAULT_OUT1 = 0xe5,
> +	DRM_PANTHOR_EXCEPTION_ADDR_SIZE_FAULT_OUT2 = 0xe6,
> +	DRM_PANTHOR_EXCEPTION_ADDR_SIZE_FAULT_OUT3 = 0xe7,
> +	DRM_PANTHOR_EXCEPTION_MEM_ATTR_FAULT_0 = 0xe8,
> +	DRM_PANTHOR_EXCEPTION_MEM_ATTR_FAULT_1 = 0xe9,
> +	DRM_PANTHOR_EXCEPTION_MEM_ATTR_FAULT_2 = 0xea,
> +	DRM_PANTHOR_EXCEPTION_MEM_ATTR_FAULT_3 = 0xeb,
> +};
> +
> +/**
> + * panthor_exception_is_fault() - Checks if an exception is a fault.
> + *
> + * Return: true if the exception is a fault, false otherwise.
> + */
> +static inline bool
> +panthor_exception_is_fault(u32 exception_code)
> +{
> +	return exception_code > DRM_PANTHOR_EXCEPTION_MAX_NON_FAULT;
> +}
> +
> +const char *panthor_exception_name(struct panthor_device *ptdev,
> +				   u32 exception_code);
> +
> +/**
> + * PANTHOR_IRQ_HANDLER() - Define interrupt handlers and the interrupt
> + * registration function.
> + *
> + * The boiler-plate to gracefully deal with shared interrupts is
> + * auto-generated. All you have to do is call PANTHOR_IRQ_HANDLER()
> + * just after you actual handler. The handler prototype is:
s/you/your/ or probably s/you/the/ since we don't expect people to be
adding more ;)

> + *
> + * void (*handler)(struct panthor_device *, u32 status);
> + */
> +#define PANTHOR_IRQ_HANDLER(__name, __reg_prefix, __handler)					\
> +static irqreturn_t panthor_ ## __name ## _irq_raw_handler(int irq, void *data)			\
> +{												\
> +	struct panthor_irq *pirq = data;							\
> +	struct panthor_device *ptdev = pirq->ptdev;						\

Maybe I'm missing something, but I was expecting a check here for if the
irq has been suspended and to avoid the register reads if it was.
Otherwise I'm not entirely sure I follow what all this code is for.

Steve

> +												\
> +	if (!gpu_read(ptdev, __reg_prefix ## _INT_STAT))					\
> +		return IRQ_NONE;								\
> +												\
> +	gpu_write(ptdev, __reg_prefix ## _INT_MASK, 0);						\
> +	return IRQ_WAKE_THREAD;									\
> +}												\
> +												\
> +static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *data)		\
> +{												\
> +	struct panthor_irq *pirq = data;							\
> +	struct panthor_device *ptdev = pirq->ptdev;						\
> +	irqreturn_t ret = IRQ_NONE;								\
> +												\
> +	while (true) {										\
> +		u32 status = gpu_read(ptdev, __reg_prefix ## _INT_RAWSTAT) & pirq->mask;	\
> +												\
> +		if (!status)									\
> +			break;									\
> +												\
> +		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
> +												\
> +		__handler(ptdev, status);							\
> +		ret = IRQ_HANDLED;								\
> +	}											\
> +												\
> +	if (!atomic_read(&pirq->suspended))							\
> +		gpu_write(ptdev, __reg_prefix ## _INT_MASK, pirq->mask);			\
> +												\
> +	return ret;										\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_suspend(struct panthor_irq *pirq)			\
> +{												\
> +	int cookie;										\
> +												\
> +	atomic_set(&pirq->suspended, true);							\
> +												\
> +	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, 0);				\
> +		synchronize_irq(pirq->irq);							\
> +		drm_dev_exit(cookie);								\
> +	}											\
> +												\
> +	pirq->mask = 0;										\
> +}												\
> +												\
> +static inline void panthor_ ## __name ## _irq_resume(struct panthor_irq *pirq, u32 mask)	\
> +{												\
> +	int cookie;										\
> +												\
> +	atomic_set(&pirq->suspended, false);							\
> +	pirq->mask = mask;									\
> +												\
> +	if (drm_dev_enter(&pirq->ptdev->base, &cookie)) {					\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_CLEAR, mask);			\
> +		gpu_write(pirq->ptdev, __reg_prefix ## _INT_MASK, mask);			\
> +		drm_dev_exit(cookie);								\
> +	}											\
> +}												\
> +												\
> +static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
> +					      struct panthor_irq *pirq,				\
> +					      int irq, u32 mask)				\
> +{												\
> +	pirq->ptdev = ptdev;									\
> +	pirq->irq = irq;									\
> +	panthor_ ## __name ## _irq_resume(pirq, mask);						\
> +												\
> +	return devm_request_threaded_irq(ptdev->base.dev, irq,					\
> +					 panthor_ ## __name ## _irq_raw_handler,		\
> +					 panthor_ ## __name ## _irq_threaded_handler,		\
> +					 IRQF_SHARED, KBUILD_MODNAME "-" # __name,		\
> +					 pirq);							\
> +}
> +
> +extern struct workqueue_struct *panthor_cleanup_wq;
> +
> +#endif

