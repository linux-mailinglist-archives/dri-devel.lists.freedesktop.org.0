Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F528075DC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 17:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C9010E764;
	Wed,  6 Dec 2023 16:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00A3F10E764
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 16:55:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D978143D;
 Wed,  6 Dec 2023 08:56:27 -0800 (PST)
Received: from [10.57.74.196] (unknown [10.57.74.196])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D533F762;
 Wed,  6 Dec 2023 08:55:38 -0800 (PST)
Message-ID: <4d813208-39fe-4387-8415-4b0c17df42a4@arm.com>
Date: Wed, 6 Dec 2023 16:55:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] drm/panthor: Add the device logical block
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204173313.2098733-4-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 17:32, Boris Brezillon wrote:
> The panthor driver is designed in a modular way, where each logical
> block is dealing with a specific HW-block or software feature. In order
> for those blocks to communicate with each other, we need a central
> panthor_device collecting all the blocks, and exposing some common
> features, like interrupt handling, power management, reset, ...
> 
> This what this panthor_device logical block is about.
> 
> v3:
> - Add acks for the MIT+GPL2 relicensing
> - Fix 32-bit support
> - Shorten the sections protected by panthor_device::pm::mmio_lock to fix
>   lock ordering issues.
> - Rename panthor_device::pm::lock into panthor_device::pm::mmio_lock to
>   better reflect what this lock is protecting
> - Use dev_err_probe()
> - Make sure we call drm_dev_exit() when something fails half-way in
>   panthor_device_reset_work()
> - Replace CSF_GPU_LATEST_FLUSH_ID_DEFAULT with a constant '1' and a
>   comment to explain. Also remove setting the dummy flush ID on suspend.
> - Remove drm_WARN_ON() in panthor_exception_name()
> - Check pirq->suspended in panthor_xxx_irq_raw_handler()
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora

We still have the "FIXME: this is racy" and there's something wrong in
panthor_device_reset_work() (see below). But otherwise looks good.

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 497 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h | 381 +++++++++++++++++
>  2 files changed, 878 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> new file mode 100644
> index 000000000000..40038bac147a
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_device.c

<snip>

> +
> +static void panthor_device_reset_work(struct work_struct *work)
> +{
> +	struct panthor_device *ptdev = container_of(work, struct panthor_device, reset.work);
> +	int ret = 0, cookie;
> +
> +	if (atomic_read(&ptdev->pm.state) != PANTHOR_DEVICE_PM_STATE_ACTIVE) {
> +		/*
> +		 * No need for a reset as the device has been (or will be)
> +		 * powered down
> +		 */
> +		atomic_set(&ptdev->reset.pending, 0);
> +		return;
> +	}
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

If ret is true then we branch, so...

> +		goto out_dev_exit;
> +
> +	atomic_set(&ptdev->reset.pending, 0);
> +	panthor_sched_post_reset(ptdev);
> +
> +	if (ret) {

...this cannot ever be reached. I think the out_dev_exit label should be
earlier (and renamed?)

> +		panthor_device_unplug(ptdev);
> +		drm_err(&ptdev->base, "Failed to boot MCU after reset, making device unusable.");
> +	}
> +
> +out_dev_exit:
> +	drm_dev_exit(cookie);
> +}

Thanks,
Steve

