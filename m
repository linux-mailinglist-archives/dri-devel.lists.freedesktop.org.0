Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712ED782962
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 14:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F04010E0A5;
	Mon, 21 Aug 2023 12:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A50810E0A5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 12:47:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DF342F4;
 Mon, 21 Aug 2023 05:47:51 -0700 (PDT)
Received: from [10.57.34.4] (unknown [10.57.34.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 332443F762;
 Mon, 21 Aug 2023 05:47:08 -0700 (PDT)
Message-ID: <7dbf0524-7c5d-77ac-85f2-b3d01de80682@arm.com>
Date: Mon, 21 Aug 2023 13:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 13/15] drm/panthor: Allow driver compilation
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-14-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230809165330.2451699-14-boris.brezillon@collabora.com>
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
> Now that all blocks are available, we can add/update Kconfig/Makefile
> files to allow compilation.
> 
> v2:
> - Rename the driver (pancsf -> panthor)
> - Change the license (GPL2 -> MIT + GPL2)
> - Split the driver addition commit
> - Add new dependencies on GPUVA and DRM_SCHED
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/Kconfig          |  2 ++
>  drivers/gpu/drm/Makefile         |  1 +
>  drivers/gpu/drm/panthor/Kconfig  | 16 ++++++++++++++++
>  drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
>  4 files changed, 34 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>  create mode 100644 drivers/gpu/drm/panthor/Makefile
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2a44b9419d4d..bddfbdb2ffee 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -358,6 +358,8 @@ source "drivers/gpu/drm/lima/Kconfig"
>  
>  source "drivers/gpu/drm/panfrost/Kconfig"
>  
> +source "drivers/gpu/drm/panthor/Kconfig"
> +
>  source "drivers/gpu/drm/aspeed/Kconfig"
>  
>  source "drivers/gpu/drm/mcde/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 215e78e79125..0a260727505f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -188,6 +188,7 @@ obj-$(CONFIG_DRM_TVE200) += tve200/
>  obj-$(CONFIG_DRM_XEN) += xen/
>  obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
>  obj-$(CONFIG_DRM_LIMA)  += lima/
> +obj-$(CONFIG_DRM_PANTHOR) += panthor/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/

NIT: Here panthor is before panfrost, above (in the kconfig 'source')
they are the other way around. Although both lists seem to be in an
arbitrary order.

>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> new file mode 100644
> index 000000000000..a9d17b1bbb75
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +config DRM_PANTHOR
> +	tristate "Panthor (DRM support for ARM Mali CSF-based GPUs)"
> +	depends on DRM
> +	depends on ARM || ARM64 || (COMPILE_TEST && !GENERIC_ATOMIC64)

This is technically wrong. There are ARM configurations that do select
GENERIC_ATOMIC64 and will cause the "select IOMMU_IO_PGTABLE_LPAE" to
conflict with the depends of that option.

Splitting it onto two lines, like panfrost does, matches the iommu
config and I think is easier to read:

        depends on ARM || ARM64 || COMPILE_TEST
        depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE

Steve

> +	depends on MMU
> +	select DRM_EXEC
> +	select DRM_SCHED
> +	select IOMMU_SUPPORT
> +	select IOMMU_IO_PGTABLE_LPAE
> +	select DRM_GEM_SHMEM_HELPER
> +	select PM_DEVFREQ
> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	help
> +	  DRM driver for ARM Mali CSF-based GPUs.

It might be worth expanding this to mention Valhall and/or Mali-Gxxx.

Steve

> diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
> new file mode 100644
> index 000000000000..64193a484879
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +panthor-y := \
> +	panthor_devfreq.o \
> +	panthor_device.o \
> +	panthor_drv.o \
> +	panthor_gem.o \
> +	panthor_gpu.o \
> +	panthor_heap.o \
> +	panthor_heap.o \
> +	panthor_fw.o \
> +	panthor_mmu.o \
> +	panthor_sched.o
> +
> +obj-$(CONFIG_DRM_PANTHOR) += panthor.o

