Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0F87ECFD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7433010E3FC;
	Mon, 18 Mar 2024 16:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5ECE10E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:08:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6BFBDA7;
 Mon, 18 Mar 2024 09:09:02 -0700 (PDT)
Received: from [10.57.12.69] (unknown [10.57.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FF7E3F67D;
 Mon, 18 Mar 2024 09:08:26 -0700 (PDT)
Message-ID: <3a5eff87-178c-4d23-a5f7-9a9516334c18@arm.com>
Date: Mon, 18 Mar 2024 16:08:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix the CONFIG_PM=n case
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
References: <20240318153117.1321544-1-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240318153117.1321544-1-boris.brezillon@collabora.com>
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

On 18/03/2024 15:31, Boris Brezillon wrote:
> Putting a hard dependency on CONFIG_PM is not possible because of a
> circular dependency issue, and it's actually not desirable either. In
> order to support this use case, we forcibly resume at init time, and
> suspend at unplug time.
> 
> v2:
> - Drop the #ifdef CONFIG_PM section around panthor_pm_ops's definition
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

(and compile tested this time!)

Thanks,

Steve

> ---
> Tested by faking CONFIG_PM=n in the driver (basically commenting
> all pm_runtime calls, and making the panthor_device_suspend/resume()
> calls unconditional in the panthor_device_unplug/init() path) since
> CONFIG_ARCH_ROCKCHIP selects CONFIG_PM. Seems to work fine, but I
> can't be 100% sure this will work correctly on a platform that has
> CONFIG_PM=n.
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 13 +++++++++++--
>  drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 69deb8e17778..ba7aedbb4931 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -87,6 +87,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>  	pm_runtime_put_sync_suspend(ptdev->base.dev);
>  
> +	/* If PM is disabled, we need to call the suspend handler manually. */
> +	if (!IS_ENABLED(CONFIG_PM))
> +		panthor_device_suspend(ptdev->base.dev);
> +
>  	/* Report the unplug operation as done to unblock concurrent
>  	 * panthor_device_unplug() callers.
>  	 */
> @@ -218,6 +222,13 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		return ret;
>  
> +	/* If PM is disabled, we need to call panthor_device_resume() manually. */
> +	if (!IS_ENABLED(CONFIG_PM)) {
> +		ret = panthor_device_resume(ptdev->base.dev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = panthor_gpu_init(ptdev);
>  	if (ret)
>  		goto err_rpm_put;
> @@ -402,7 +413,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
>  int panthor_device_resume(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> @@ -547,4 +557,3 @@ int panthor_device_suspend(struct device *dev)
>  	mutex_unlock(&ptdev->pm.mmio_lock);
>  	return ret;
>  }
> -#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ff484506229f..11b3ccd58f85 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1417,7 +1417,7 @@ static struct platform_driver panthor_driver = {
>  	.remove_new = panthor_remove,
>  	.driver = {
>  		.name = "panthor",
> -		.pm = &panthor_pm_ops,
> +		.pm = pm_ptr(&panthor_pm_ops),
>  		.of_match_table = dt_match,
>  	},
>  };

