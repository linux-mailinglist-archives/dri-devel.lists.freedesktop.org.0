Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035087ED18
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 17:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986F010F0B2;
	Mon, 18 Mar 2024 16:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eQs+GjUG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAAB10F0B2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710778307;
 bh=kPlYGEQu74PvUp1/tZo6hwoYhmbphKRB0Kc0zbXjSP8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eQs+GjUG2FOVZosLcMPsnMjQuHbWeHng0qA4pbPZ2yDms8fD7SWpOynFdOnA3XvNF
 nIJ9jceYg39BN37qA/NUHwIOQoycFe1+iJxsAKBFrtTDMfQggfZUIT85Q2sgpo9BR2
 T+qcddu7926oPQh9X454zmmqpJHaO+sgfHm1r80LBVlAjfw7Tj3VEnB32cy9DfIzwa
 3A140cgIINuO3rPUBRTKxbeIeRYDm2FIzl503Y6oq+2vD0zXjLlFnE4UtH1tJ8vUYD
 4wZtcO5sl3S6O/BeSXSXEOX0PcAWRBAdsgxleL57M4/A/Wb1fei12OP4/qIpehUX5o
 +rUxc+c59Tu2Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A74D03782033;
 Mon, 18 Mar 2024 16:11:46 +0000 (UTC)
Message-ID: <f065367e-2097-4f6f-866f-2113780ee8bb@collabora.com>
Date: Mon, 18 Mar 2024 17:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix the CONFIG_PM=n case
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
References: <20240318153117.1321544-1-boris.brezillon@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240318153117.1321544-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 18/03/24 16:31, Boris Brezillon ha scritto:
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Tested by faking CONFIG_PM=n in the driver (basically commenting
> all pm_runtime calls, and making the panthor_device_suspend/resume()
> calls unconditional in the panthor_device_unplug/init() path) since
> CONFIG_ARCH_ROCKCHIP selects CONFIG_PM. Seems to work fine, but I
> can't be 100% sure this will work correctly on a platform that has
> CONFIG_PM=n.
> ---
>   drivers/gpu/drm/panthor/panthor_device.c | 13 +++++++++++--
>   drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 69deb8e17778..ba7aedbb4931 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -87,6 +87,10 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>   	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>   	pm_runtime_put_sync_suspend(ptdev->base.dev);
>   
> +	/* If PM is disabled, we need to call the suspend handler manually. */
> +	if (!IS_ENABLED(CONFIG_PM))
> +		panthor_device_suspend(ptdev->base.dev);
> +
>   	/* Report the unplug operation as done to unblock concurrent
>   	 * panthor_device_unplug() callers.
>   	 */
> @@ -218,6 +222,13 @@ int panthor_device_init(struct panthor_device *ptdev)
>   	if (ret)
>   		return ret;
>   
> +	/* If PM is disabled, we need to call panthor_device_resume() manually. */
> +	if (!IS_ENABLED(CONFIG_PM)) {
> +		ret = panthor_device_resume(ptdev->base.dev);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	ret = panthor_gpu_init(ptdev);
>   	if (ret)
>   		goto err_rpm_put;
> @@ -402,7 +413,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>   	return 0;
>   }
>   
> -#ifdef CONFIG_PM
>   int panthor_device_resume(struct device *dev)
>   {
>   	struct panthor_device *ptdev = dev_get_drvdata(dev);
> @@ -547,4 +557,3 @@ int panthor_device_suspend(struct device *dev)
>   	mutex_unlock(&ptdev->pm.mmio_lock);
>   	return ret;
>   }
> -#endif
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index ff484506229f..11b3ccd58f85 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1417,7 +1417,7 @@ static struct platform_driver panthor_driver = {
>   	.remove_new = panthor_remove,
>   	.driver = {
>   		.name = "panthor",
> -		.pm = &panthor_pm_ops,
> +		.pm = pm_ptr(&panthor_pm_ops),
>   		.of_match_table = dt_match,
>   	},
>   };

