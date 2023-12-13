Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89718112A2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 14:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32F810E283;
	Wed, 13 Dec 2023 13:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD27210E283
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 13:18:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A6FC15;
 Wed, 13 Dec 2023 05:19:28 -0800 (PST)
Received: from [10.57.86.164] (unknown [10.57.86.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EF7A3F762;
 Wed, 13 Dec 2023 05:18:39 -0800 (PST)
Message-ID: <8332142a-b224-4149-8748-a9445e4caee9@arm.com>
Date: Wed, 13 Dec 2023 13:18:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] drm/panthor: Allow driver compilation
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-13-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231204173313.2098733-13-boris.brezillon@collabora.com>
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

On 04/12/2023 17:33, Boris Brezillon wrote:
> Now that all blocks are available, we can add/update Kconfig/Makefile
> files to allow compilation.
> 
> v3:
> - Add a dep on DRM_GPUVM
> - Fix dependencies in Kconfig
> - Expand help text to (hopefully) describe which GPUs are to be
>   supported by this driver and which are for panfrost.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,Linaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 relicensing,Collabora

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/Kconfig          |  2 ++
>  drivers/gpu/drm/Makefile         |  1 +
>  drivers/gpu/drm/panthor/Kconfig  | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
>  4 files changed, 41 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>  create mode 100644 drivers/gpu/drm/panthor/Makefile
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b7abd436455f..9cc1e56d3eec 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -381,6 +381,8 @@ source "drivers/gpu/drm/lima/Kconfig"
>  
>  source "drivers/gpu/drm/panfrost/Kconfig"
>  
> +source "drivers/gpu/drm/panthor/Kconfig"
> +
>  source "drivers/gpu/drm/aspeed/Kconfig"
>  
>  source "drivers/gpu/drm/mcde/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index b4cb0835620a..b73abec60bbf 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -190,6 +190,7 @@ obj-$(CONFIG_DRM_XEN) += xen/
>  obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
>  obj-$(CONFIG_DRM_LIMA)  += lima/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/
> +obj-$(CONFIG_DRM_PANTHOR) += panthor/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>  obj-$(CONFIG_DRM_MCDE) += mcde/
>  obj-$(CONFIG_DRM_TIDSS) += tidss/
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> new file mode 100644
> index 000000000000..159845e51116
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0 or MIT
> +
> +config DRM_PANTHOR
> +	tristate "Panthor (DRM support for ARM Mali CSF-based GPUs)"
> +	depends on DRM
> +	depends on ARM || ARM64 || COMPILE_TEST
> +	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
> +	depends on MMU
> +	select DRM_GPUVM
> +	select DRM_EXEC
> +	select DRM_SCHED
> +	select IOMMU_SUPPORT
> +	select IOMMU_IO_PGTABLE_LPAE
> +	select DRM_GEM_SHMEM_HELPER
> +	select PM_DEVFREQ
> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	help
> +	  DRM driver for ARM Mali CSF-based GPUs.
> +
> +	  This driver is for Mali (or Immortalis) Valhall Gxxx GPUs.
> +
> +	  Note that the Mali-G68 and Mali-G78, while Valhall architecture, will
> +	  be supported with the panfrost driver as they are not CSF GPUs.
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

