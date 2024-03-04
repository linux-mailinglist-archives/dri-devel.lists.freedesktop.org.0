Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79EB870155
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66601120CF;
	Mon,  4 Mar 2024 12:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8C481120CE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 12:31:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EA131FB;
 Mon,  4 Mar 2024 04:31:52 -0800 (PST)
Received: from [10.57.13.242] (unknown [10.57.13.242])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994DC3F738;
 Mon,  4 Mar 2024 04:31:13 -0800 (PST)
Message-ID: <cb78e264-0746-4902-8087-ccf0fe8ef544@arm.com>
Date: Mon, 4 Mar 2024 12:31:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 kernel test robot <lkp@intel.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240304090812.3941084-4-boris.brezillon@collabora.com>
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

On 04/03/2024 09:08, Boris Brezillon wrote:
> panthor_device_resume/suspend() are only compiled when CONFIG_PM is
> enabled but panthro_drv.c doesn't use the pm_ptr() macro to conditionally
> discard resume/suspend assignments, which causes undefined symbol
> errors at link time when !PM.
> 
> We could fix that by using pm_ptr(), but supporting the !PM case makes
> little sense (the whole point of these embedded GPUs is to be low power,
> so proper PM is a basic requirement in that case). So let's just enforce
> the presence of CONFIG_PM with a Kconfig dependency instead.
> 
> If someone needs to relax this dependency, it can be done in a follow-up.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403031944.EOimQ8WK-lkp@intel.com/
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Seems reasonable, it should be easy to relax the CONFIG_PM condition in
the future if anyone has an actual need.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/Kconfig          | 1 +
>  drivers/gpu/drm/panthor/panthor_device.c | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> index 55b40ad07f3b..fdce7c1b2310 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -6,6 +6,7 @@ config DRM_PANTHOR
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
>  	depends on MMU
> +	depends on PM
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 68e467ee458a..efea29143a54 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -403,7 +403,6 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM
>  int panthor_device_resume(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> @@ -548,4 +547,3 @@ int panthor_device_suspend(struct device *dev)
>  	mutex_unlock(&ptdev->pm.mmio_lock);
>  	return ret;
>  }
> -#endif

