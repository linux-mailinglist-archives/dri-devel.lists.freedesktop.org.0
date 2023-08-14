Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D86477BA71
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 15:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1831810E1FC;
	Mon, 14 Aug 2023 13:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8415B10E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 13:45:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2564B1063;
 Mon, 14 Aug 2023 06:45:49 -0700 (PDT)
Received: from [10.57.34.244] (unknown [10.57.34.244])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74873F64C;
 Mon, 14 Aug 2023 06:45:04 -0700 (PDT)
Message-ID: <ed2938d7-600c-2d03-85d9-7844bd2d45bc@arm.com>
Date: Mon, 14 Aug 2023 14:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/15] drm/panthor: Add the devfreq logical block
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-8-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230809165330.2451699-8-boris.brezillon@collabora.com>
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
> Every thing related to devfreq in placed in panthor_devfreq.c, and
> helpers that can be called by other logical blocks are exposed through
> panthor_devfreq.h.
> 
> This implementation is loosely based on the panfrost implementation,
> the only difference being that we don't count device users, because
> the idle/active state will be managed by the scheduler logic.
> 
> v2:
> - Added in v2
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 281 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  25 ++
>  2 files changed, 306 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> new file mode 100644
> index 000000000000..500ce34cccc2
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2019 Collabora ltd. */
> +
> +#include <linux/clk.h>
> +#include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_devfreq.h"
> +
> +/**
> + * struct panthor_devfreq - Device frequency management
> + */
> +struct panthor_devfreq {
> +	/** @devfreq: devfreq device. */
> +	struct devfreq *devfreq;
> +
> +	/** @gov_data: Governor data. */
> +	struct devfreq_simple_ondemand_data gov_data;
> +
> +	/** @busy_time: Busy time. */
> +	ktime_t busy_time;
> +
> +	/** @idle_time: Idle time. */
> +	ktime_t idle_time;
> +
> +	/** @time_last_update: Last update time. */
> +	ktime_t time_last_update;
> +
> +	/** @last_busy_state: True if the GPU was busy last time we updated the state. */
> +	bool last_busy_state;
> +
> +	/*
> +	 * Protect busy_time, idle_time, time_last_update and last_busy_state
> +	 * because these can be accessed concurrently by panthor_devfreq_get_dev_status()
> +	 * and panthor_devfreq_record_{busy,idle}().
> +	 */
> +	spinlock_t lock;
> +};
> +
> +static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
> +{
> +	ktime_t now, last;
> +
> +	now = ktime_get();
> +	last = pdevfreq->time_last_update;
> +
> +	if (pdevfreq->last_busy_state)
> +		pdevfreq->busy_time += ktime_sub(now, last);
> +	else
> +		pdevfreq->idle_time += ktime_sub(now, last);
> +
> +	pdevfreq->time_last_update = now;
> +}
> +
> +static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
> +				  u32 flags)
> +{
> +	struct dev_pm_opp *opp;
> +
> +	opp = devfreq_recommended_opp(dev, freq, flags);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	dev_pm_opp_put(opp);
> +
> +	return dev_pm_opp_set_rate(dev, *freq);
> +}
> +
> +static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
> +{
> +	pdevfreq->busy_time = 0;
> +	pdevfreq->idle_time = 0;
> +	pdevfreq->time_last_update = ktime_get();
> +}
> +
> +static int panthor_devfreq_get_dev_status(struct device *dev,
> +					  struct devfreq_dev_status *status)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +	unsigned long irqflags;
> +
> +	status->current_frequency = clk_get_rate(ptdev->clks.core);
> +
> +	spin_lock_irqsave(&pdevfreq->lock, irqflags);
> +
> +	panthor_devfreq_update_utilization(pdevfreq);
> +
> +	status->total_time = ktime_to_ns(ktime_add(pdevfreq->busy_time,
> +						   pdevfreq->idle_time));
> +
> +	status->busy_time = ktime_to_ns(pdevfreq->busy_time);
> +
> +	panthor_devfreq_reset(pdevfreq);
> +
> +	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
> +
> +	drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
> +		status->busy_time, status->total_time,
> +		status->busy_time / (status->total_time / 100),
> +		status->current_frequency / 1000 / 1000);
> +
> +	return 0;
> +}
> +
> +static struct devfreq_dev_profile panthor_devfreq_profile = {
> +	.timer = DEVFREQ_TIMER_DELAYED,
> +	.polling_ms = 50, /* ~3 frames */
> +	.target = panthor_devfreq_target,
> +	.get_dev_status = panthor_devfreq_get_dev_status,
> +};
> +
> +int panthor_devfreq_init(struct panthor_device *ptdev)
> +{
> +	/* There's actually 2 regulators (mali and sram), but the OPP core only
> +	 * supports one.
> +	 *
> +	 * We assume the sram regulator is coupled with the mali one and let
> +	 * the coupling logic deal with voltage updates.
> +	 */
> +	static const char *reg_names[] = { "mali", NULL };
> +	struct thermal_cooling_device *cooling;
> +	struct device *dev = ptdev->base.dev;
> +	struct panthor_devfreq *pdevfreq;
> +	struct dev_pm_opp *opp;
> +	unsigned long cur_freq;
> +	int ret;
> +
> +	pdevfreq = drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KERNEL);
> +	if (!pdevfreq)
> +		return -ENOMEM;
> +
> +	ptdev->devfreq = pdevfreq;
> +
> +	ret = devm_pm_opp_set_regulators(dev, reg_names);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
> +
> +		return ret;
> +	}
> +
> +	ret = devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return ret;
> +
> +	spin_lock_init(&pdevfreq->lock);
> +
> +	panthor_devfreq_reset(pdevfreq);
> +
> +	cur_freq = clk_get_rate(ptdev->clks.core);
> +
> +	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	panthor_devfreq_profile.initial_freq = cur_freq;
> +
> +	/* Regulator coupling only takes care of synchronizing/balancing voltage
> +	 * updates, but the coupled regulator needs to be enabled manually.
> +	 *
> +	 * We use devm_regulator_get_enable_optional() and keep the sram supply
> +	 * enabled until the device is removed, just like we do for the mali
> +	 * supply, which is enabled when dev_pm_opp_set_opp(dev, opp) is called,
> +	 * and disabled when the opp_table is torn down, using the devm action.
> +	 *
> +	 * If we really care about disabling regulators on suspend, we should:
> +	 * - use devm_regulator_get_optional() here
> +	 * - call dev_pm_opp_set_opp(dev, NULL) before leaving this function
> +	 *   (this disables the regulator passed to the OPP layer)
> +	 * - call dev_pm_opp_set_opp(dev, NULL) and
> +	 *   regulator_disable(ptdev->regulators.sram) in
> +	 *   panthor_devfreq_suspend()
> +	 * - call dev_pm_opp_set_opp(dev, default_opp) and
> +	 *   regulator_enable(ptdev->regulators.sram) in
> +	 *   panthor_devfreq_resume()
> +	 *
> +	 * But without knowing if it's beneficial or not (in term of power
> +	 * consumption), or how much it slows down the suspend/resume steps,
> +	 * let's just keep regulators enabled for the device lifetime.
> +	 */
> +	ret = devm_regulator_get_enable_optional(dev, "sram");
> +	if (ret && ret != -ENODEV) {
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram supply\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * Set the recommend OPP this will enable and configure the regulator
> +	 * if any and will avoid a switch off by regulator_late_cleanup()
> +	 */
> +	ret = dev_pm_opp_set_opp(dev, opp);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> +		return ret;
> +	}
> +
> +	dev_pm_opp_put(opp);
> +
> +	/*
> +	 * Setup default thresholds for the simple_ondemand governor.
> +	 * The values are chosen based on experiments.
> +	 */
> +	pdevfreq->gov_data.upthreshold = 45;
> +	pdevfreq->gov_data.downdifferential = 5;
> +
> +	pdevfreq->devfreq = devm_devfreq_add_device(dev, &panthor_devfreq_profile,
> +						    DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +						    &pdevfreq->gov_data);
> +	if (IS_ERR(pdevfreq->devfreq)) {
> +		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
> +		ret = PTR_ERR(pdevfreq->devfreq);
> +		pdevfreq->devfreq = NULL;
> +		return ret;
> +	}
> +
> +	cooling = devfreq_cooling_em_register(pdevfreq->devfreq, NULL);
> +	if (IS_ERR(cooling))
> +		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> +
> +	return 0;
> +}
> +
> +int panthor_devfreq_resume(struct panthor_device *ptdev)
> +{
> +	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +
> +	if (!pdevfreq->devfreq)
> +		return 0;
> +
> +	panthor_devfreq_reset(pdevfreq);
> +
> +	return devfreq_resume_device(pdevfreq->devfreq);
> +}
> +
> +int panthor_devfreq_suspend(struct panthor_device *ptdev)
> +{
> +	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +
> +	if (!pdevfreq->devfreq)
> +		return 0;
> +
> +	return devfreq_suspend_device(pdevfreq->devfreq);
> +}
> +
> +void panthor_devfreq_record_busy(struct panthor_device *ptdev)
> +{
> +	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +	unsigned long irqflags;
> +
> +	if (!pdevfreq->devfreq)
> +		return;
> +
> +	spin_lock_irqsave(&pdevfreq->lock, irqflags);
> +
> +	panthor_devfreq_update_utilization(pdevfreq);
> +	pdevfreq->last_busy_state = true;
> +
> +	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
> +}
> +
> +void panthor_devfreq_record_idle(struct panthor_device *ptdev)
> +{
> +	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +	unsigned long irqflags;
> +
> +	if (!pdevfreq->devfreq)
> +		return;
> +
> +	spin_lock_irqsave(&pdevfreq->lock, irqflags);
> +
> +	panthor_devfreq_update_utilization(pdevfreq);
> +	pdevfreq->last_busy_state = false;
> +
> +	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> new file mode 100644
> index 000000000000..875fbb5a1c1b
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2019 Collabora ltd. */
> +
> +#ifndef __PANTHOR_DEVFREQ_H__
> +#define __PANTHOR_DEVFREQ_H__
> +
> +#include <linux/devfreq.h>
> +#include <linux/spinlock.h>
> +#include <linux/ktime.h>
> +
> +struct devfreq;
> +struct thermal_cooling_device;
> +
> +struct panthor_device;
> +struct panthor_devfreq;
> +
> +int panthor_devfreq_init(struct panthor_device *ptdev);
> +
> +int panthor_devfreq_resume(struct panthor_device *ptdev);
> +int panthor_devfreq_suspend(struct panthor_device *ptdev);
> +
> +void panthor_devfreq_record_busy(struct panthor_device *ptdev);
> +void panthor_devfreq_record_idle(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_DEVFREQ_H__ */

