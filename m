Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E698894CB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 09:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431B910E23A;
	Mon, 25 Mar 2024 08:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LJZspI5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 415C110E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 08:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711354115;
 bh=HkSzMzT1a9MKNSTRFQ6QW+sQ3WXCIfThwayUt4RV8t8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LJZspI5HNl86FEQ1z57V9YwMBEWCxMjv+0ngHfSJug7e/MUWwEKN4wXtWRTUDigQU
 nxEXhuOYanq49EpkyO1JPEiprIkvfDpco34yv8zZk9nha7csjiy3S6SfHtp2ww8gFR
 V0Z0Sh7pJ1UFFzfcAwzUDXXYmExpn1H9uwaZLZhZJK5Ypqrk2ntigcc2cBKzG3VmLu
 FHeEj5ZIXEnbEJHo3t+tV6+7+XG/zXp63k7cQGDtzrAdktcwndZmoAcCkgpUTyFpng
 BxM7QoWSgoyxK5gC6Tt7FAjnU8F/bLMUg8e3AITfPKZcDkxEfGPN8bgRDm5LD5nyE6
 RuPrBNmAaRiAA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C8D033781013;
 Mon, 25 Mar 2024 08:08:34 +0000 (UTC)
Date: Mon, 25 Mar 2024 09:08:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/panthor: Fix the CONFIG_PM=n case
Message-ID: <20240325090832.20fef595@collabora.com>
In-Reply-To: <20240318153117.1321544-1-boris.brezillon@collabora.com>
References: <20240318153117.1321544-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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

On Mon, 18 Mar 2024 16:31:17 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

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

Queued to drm-misc-next.

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

