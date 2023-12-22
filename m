Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7381CB16
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 15:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D870410E78D;
	Fri, 22 Dec 2023 14:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9892F10E78D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1703253899;
 bh=7ZneKH0x4seuK4jTaMWVx5m0/PrCuT3VKYQziOA9o0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GZwhGkGfE/w5CZw9VuUMDJeJwUJEeoFy+AfdKK1YVk0cjGDmdhgSvW2N13a8KuGfH
 7oDkQ4reqzYZyraq8jjkkeAZh1fSmbrSQWUEy1h6A8+cVgktPYXnWfqrbE8nsnQ5bh
 vZagP8dHx4x3PRyRSjViKxMdD8VaY82S/4eIhqq7d93Vx5c7VSKR5dmtTJetAasgtq
 aDJGJ2x/+wKK4OSjr0kkPgl6F1PMPSfOefXt0natIWMbclysbDTGboqoKY0Rpx1ARX
 FVYc4luRDXIpu7PZzzvhfqTYdsLnFlQhB4f/4nmDWip+AElIIvqCxXE6PvNDxAPSAa
 Ge050L57niYWQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 48D2037804B2;
 Fri, 22 Dec 2023 14:04:58 +0000 (UTC)
Date: Fri, 22 Dec 2023 15:04:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3 03/14] drm/panthor: Add the device logical block
Message-ID: <20231222150456.0fca9d73@collabora.com>
In-Reply-To: <ZYWOfhMa2ljntUJW@e110455-lin.cambridge.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-4-boris.brezillon@collabora.com>
 <ZYWOfhMa2ljntUJW@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Dec 2023 13:26:22 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> Hi Boris,
> 
> On Mon, Dec 04, 2023 at 06:32:56PM +0100, Boris Brezillon wrote:
> > The panthor driver is designed in a modular way, where each logical
> > block is dealing with a specific HW-block or software feature. In order
> > for those blocks to communicate with each other, we need a central
> > panthor_device collecting all the blocks, and exposing some common
> > features, like interrupt handling, power management, reset, ...
> > 
> > This what this panthor_device logical block is about.
> > 
> > v3:
> > - Add acks for the MIT+GPL2 relicensing
> > - Fix 32-bit support
> > - Shorten the sections protected by panthor_device::pm::mmio_lock to fix
> >   lock ordering issues.
> > - Rename panthor_device::pm::lock into panthor_device::pm::mmio_lock to
> >   better reflect what this lock is protecting
> > - Use dev_err_probe()
> > - Make sure we call drm_dev_exit() when something fails half-way in
> >   panthor_device_reset_work()
> > - Replace CSF_GPU_LATEST_FLUSH_ID_DEFAULT with a constant '1' and a
> >   comment to explain. Also remove setting the dummy flush ID on suspend.
> > - Remove drm_WARN_ON() in panthor_exception_name()
> > - Check pirq->suspended in panthor_xxx_irq_raw_handler()
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> > Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> > Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c | 497 +++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_device.h | 381 +++++++++++++++++
> >  2 files changed, 878 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > new file mode 100644
> > index 000000000000..40038bac147a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -0,0 +1,497 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> > +/* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
> > +/* Copyright 2023 Collabora ltd. */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/reset.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regulator/consumer.h>
> > +
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_managed.h>
> > +
> > +#include "panthor_sched.h"
> > +#include "panthor_device.h"
> > +#include "panthor_devfreq.h"
> > +#include "panthor_gpu.h"
> > +#include "panthor_fw.h"
> > +#include "panthor_mmu.h"
> > +#include "panthor_regs.h"
> > +
> > +static int panthor_clk_init(struct panthor_device *ptdev)
> > +{
> > +	ptdev->clks.core = devm_clk_get(ptdev->base.dev, NULL);
> > +	if (IS_ERR(ptdev->clks.core))
> > +		return dev_err_probe(ptdev->base.dev,
> > +				     PTR_ERR(ptdev->clks.core),
> > +				     "get 'core' clock failed");
> > +
> > +	ptdev->clks.stacks = devm_clk_get_optional(ptdev->base.dev, "stacks");
> > +	if (IS_ERR(ptdev->clks.stacks))
> > +		return dev_err_probe(ptdev->base.dev,
> > +				     PTR_ERR(ptdev->clks.stacks),
> > +				     "get 'stacks' clock failed");
> > +
> > +	ptdev->clks.coregroup = devm_clk_get_optional(ptdev->base.dev, "coregroup");
> > +	if (IS_ERR(ptdev->clks.coregroup))
> > +		return dev_err_probe(ptdev->base.dev,
> > +				     PTR_ERR(ptdev->clks.coregroup),
> > +				     "get 'coregroup' clock failed");
> > +
> > +	drm_info(&ptdev->base, "clock rate = %lu\n", clk_get_rate(ptdev->clks.core));
> > +	return 0;
> > +}
> > +
> > +void panthor_device_unplug(struct panthor_device *ptdev)
> > +{
> > +	/* FIXME: This is racy. */
> > +	if (drm_dev_is_unplugged(&ptdev->base))
> > +		return;
> > +
> > +	drm_WARN_ON(&ptdev->base, pm_runtime_get_sync(ptdev->base.dev) < 0);
> > +
> > +	/* Call drm_dev_unplug() so any access to HW block happening after
> > +	 * that point get rejected.
> > +	 */
> > +	drm_dev_unplug(&ptdev->base);
> > +
> > +	/* Now, try to cleanly shutdown the GPU before the device resources
> > +	 * get reclaimed.
> > +	 */
> > +	panthor_sched_unplug(ptdev);
> > +	panthor_fw_unplug(ptdev);
> > +	panthor_mmu_unplug(ptdev);
> > +	panthor_gpu_unplug(ptdev);
> > +
> > +	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> > +	pm_runtime_put_sync_suspend(ptdev->base.dev);
> > +}
> > +
> > +static void panthor_device_reset_cleanup(struct drm_device *ddev, void *data)
> > +{
> > +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
> > +
> > +	cancel_work_sync(&ptdev->reset.work);
> > +	destroy_workqueue(ptdev->reset.wq);
> > +}
> > +
> > +static void panthor_device_reset_work(struct work_struct *work)
> > +{
> > +	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
> > +	int ret = 0, cookie;
> > +
> > +	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE) {
> > +		/*
> > +		 * No need for a reset as the device has been (or will be)
> > +		 * powered down
> > +		 */
> > +		atomic_set(&ptdev->reset.pending, 0);
> > +		return;
> > +	}
> > +
> > +	if (!drm_dev_enter(&ptdev->base, &cookie))
> > +		return;
> > +
> > +	panthor_sched_pre_reset(ptdev);
> > +	panthor_fw_pre_reset(ptdev, true);
> > +	panthor_mmu_pre_reset(ptdev);
> > +	panthor_gpu_soft_reset(ptdev);
> > +	panthor_gpu_l2_power_on(ptdev);
> > +	panthor_mmu_post_reset(ptdev);
> > +	ret = panthor_fw_post_reset(ptdev);
> > +	if (ret)
> > +		goto out_dev_exit;
> > +
> > +	atomic_set(&ptdev->reset.pending, 0);
> > +	panthor_sched_post_reset(ptdev);
> > +
> > +	if (ret) {
> > +		panthor_device_unplug(ptdev);
> > +		drm_err(&ptdev->base, "Failed to boot MCU after reset, making device unusable.");
> > +	}
> > +
> > +out_dev_exit:
> > +	drm_dev_exit(cookie);
> > +}
> > +
> > +static bool panthor_device_is_initialized(struct panthor_device *ptdev)
> > +{
> > +	return !!ptdev->scheduler;
> > +}
> > +
> > +static void panthor_device_free_page(struct drm_device *ddev, void *data)
> > +{
> > +	free_page((unsigned long)data);
> > +}
> > +
> > +int panthor_device_init(struct panthor_device *ptdev)
> > +{
> > +	struct resource *res;
> > +	struct page *p;
> > +	int ret;
> > +
> > +	ptdev->coherent = device_get_dma_attr(ptdev->base.dev) == DEV_DMA_COHERENT;
> > +
> > +	drmm_mutex_init(&ptdev->base, &ptdev->pm.mmio_lock);
> > +	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> > +	p = alloc_page(GFP_KERNEL | __GFP_ZERO);
> > +	if (!p)
> > +		return -ENOMEM;
> > +
> > +	ptdev->pm.dummy_latest_flush = page_address(p);
> > +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_free_page,
> > +				       ptdev->pm.dummy_latest_flush);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Set the dummy page holding the latest flush to 1. This will cause the
> > +	 * flush to avoided as we know it isn't necessary if the submission
> > +	 * happens while the dummy page is mapped. Zero cannot be used because
> > +	 * that means 'always flush'.
> > +	 */
> > +	*ptdev->pm.dummy_latest_flush = 1;
> > +
> > +	INIT_WORK(&ptdev->reset.work, panthor_device_reset_work);
> > +	ptdev->reset.wq = alloc_ordered_workqueue("panthor-reset-wq", 0);
> > +	if (!ptdev->reset.wq)
> > +		return -ENOMEM;
> > +
> > +	ret = drmm_add_action_or_reset(&ptdev->base, panthor_device_reset_cleanup, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = panthor_clk_init(ptdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = panthor_devfreq_init(ptdev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ptdev->iomem = devm_platform_get_and_ioremap_resource(to_platform_device(ptdev->base.dev),
> > +							      0, &res);
> > +	if (IS_ERR(ptdev->iomem))
> > +		return PTR_ERR(ptdev->iomem);
> > +
> > +	ptdev->phys_addr = res->start;
> > +
> > +	ret = devm_pm_runtime_enable(ptdev->base.dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = panthor_gpu_init(ptdev);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = panthor_mmu_init(ptdev);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = panthor_fw_init(ptdev);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	ret = panthor_sched_init(ptdev);
> > +	if (ret)
> > +		goto err_rpm_put;
> > +
> > +	/* ~3 frames */
> > +	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
> > +	pm_runtime_use_autosuspend(ptdev->base.dev);
> > +	pm_runtime_put_autosuspend(ptdev->base.dev);
> > +	return 0;
> > +
> > +err_rpm_put:
> > +	pm_runtime_put_sync_suspend(ptdev->base.dev);  
> 
> I'm afraid this is not enough to cleanup the driver if firmware fails to load
> or if panthor_sched_init() fails. I was playing with another device that's
> based on RK3588 and forgot to move the firmware to the new location. I've got
> a kernel crash with an SError due to failure to load the firmware. It was in
> panthor_mmu_irq_raw_handler() which fired because the MMU was not unplugged.

Uh, right. I hate the fact we have to explicitly call the unplug()
functions in that case, but I also don't have a better solution...

> 
> My local fix was:
> 
> -- >8 --------------------------------------------------------------  
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 834b828fc1b59..d8374f8b9333a 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -224,15 +224,15 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  	ret = panthor_mmu_init(ptdev);
>  	if (ret)
> -		goto err_rpm_put;
> +		goto err_mmu_init;

All the label names encode the unwind operation they're taking care of,
so s/err_mmu_init/err_unplug_gpu/.

>  
>  	ret = panthor_fw_init(ptdev);
>  	if (ret)
> -		goto err_rpm_put;
> +		goto err_fw_init;
>  
>  	ret = panthor_sched_init(ptdev);
>  	if (ret)
> -		goto err_rpm_put;
> +		goto err_sched_init;
>  
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
> @@ -240,6 +240,12 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	pm_runtime_put_autosuspend(ptdev->base.dev);
>  	return 0;
>  
> +err_sched_init:
> +	panthor_fw_unplug(ptdev);
> +err_fw_init:
> +	panthor_mmu_unplug(ptdev);
> +err_mmu_init:
> +	panthor_gpu_unplug(ptdev);
>  err_rpm_put:
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
>  	return ret;
> 
> -- >8 -------------------------------------------------------------  
> 
> I can send a fully formed patch if you agree with the fix.

I'll take care of send when preparing v4. Thanks for the offer.
