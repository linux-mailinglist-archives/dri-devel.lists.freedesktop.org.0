Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865247794BE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B399610E6BE;
	Fri, 11 Aug 2023 16:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7CC5310E6BD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:35:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65757113E;
 Fri, 11 Aug 2023 09:36:33 -0700 (PDT)
Received: from [10.57.1.174] (unknown [10.57.1.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F37D73F64C;
 Fri, 11 Aug 2023 09:35:48 -0700 (PDT)
Message-ID: <abed970e-db59-9eef-c4b6-dee49718f582@arm.com>
Date: Fri, 11 Aug 2023 17:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 13/15] drm/panthor: Allow driver compilation
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-14-boris.brezillon@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230809165330.2451699-14-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-09 17:53, Boris Brezillon wrote:
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
>   drivers/gpu/drm/Kconfig          |  2 ++
>   drivers/gpu/drm/Makefile         |  1 +
>   drivers/gpu/drm/panthor/Kconfig  | 16 ++++++++++++++++
>   drivers/gpu/drm/panthor/Makefile | 15 +++++++++++++++
>   4 files changed, 34 insertions(+)
>   create mode 100644 drivers/gpu/drm/panthor/Kconfig
>   create mode 100644 drivers/gpu/drm/panthor/Makefile
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 2a44b9419d4d..bddfbdb2ffee 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -358,6 +358,8 @@ source "drivers/gpu/drm/lima/Kconfig"
>   
>   source "drivers/gpu/drm/panfrost/Kconfig"
>   
> +source "drivers/gpu/drm/panthor/Kconfig"
> +
>   source "drivers/gpu/drm/aspeed/Kconfig"
>   
>   source "drivers/gpu/drm/mcde/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 215e78e79125..0a260727505f 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -188,6 +188,7 @@ obj-$(CONFIG_DRM_TVE200) += tve200/
>   obj-$(CONFIG_DRM_XEN) += xen/
>   obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
>   obj-$(CONFIG_DRM_LIMA)  += lima/
> +obj-$(CONFIG_DRM_PANTHOR) += panthor/
>   obj-$(CONFIG_DRM_PANFROST) += panfrost/
>   obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
>   obj-$(CONFIG_DRM_MCDE) += mcde/
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

FWIW I still think it would be nice to have a minor 
directory/Kconfig/Makefile reshuffle and a trivial bit of extra 
registration glue to build both drivers into a single module. It seems 
like it could be a perpetual source of confusion to end users where Mesa 
"panfrost" is the right option but kernel "panfrost" is the wrong one. 
Especially when pretty much every other GPU driver is also just one big 
top-level module to load for many different generations of hardware. 
Plus it would mean that if someone did want to have a go at 
deduplicating the resource-wrangling boilerplate for OPPs etc. in 
future, there's more chance of being able to do so meaningfully.

Cheers,
Robin.
