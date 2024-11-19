Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6989D2F62
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 21:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182FB10E008;
	Tue, 19 Nov 2024 20:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="JDxsZznj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5798 seconds by postgrey-1.36 at gabe;
 Tue, 19 Nov 2024 20:20:29 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE9910E008
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 20:20:29 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AJIhgR53940163
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2024 12:43:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1732041822;
 bh=UuK3p+uvjZvx0HNezvGzX9HUjU835mI4PLZS0cKZ5GI=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=JDxsZznjAeiVuc3iO528f+gil5Dwm/iVAHoV0AYU+B/MEtqtiSp1NB+5TcnCfwi59
 OOD/qT2xs46tshVVkx57znNNQPdLNgbZ/ftRwwKJr5NlRuXnEXF5svsvnpmAG0EW1W
 9mukOz6QBaZ9SC8gk86caBKojEu6A4vB5Y5gYYPg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AJIhgVr059033
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Nov 2024 12:43:42 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Nov 2024 12:43:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Nov 2024 12:43:41 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AJIhe7m084569;
 Tue, 19 Nov 2024 12:43:41 -0600
Message-ID: <2cbfe287-d05f-4c7a-9512-deb9b84050f9@ti.com>
Date: Tue, 19 Nov 2024 12:43:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/21] drm/imagination: Add
 device_memory_force_cpu_cached override
To: Matt Coster <matt.coster@imgtec.com>, Frank Binns <frank.binns@imgtec.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-19-3fd45d9fb0cf@imgtec.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-19-3fd45d9fb0cf@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

On 11/18/24 7:02 AM, Matt Coster wrote:
> The TI k3-j721s2 platform has a bug relating to cache snooping on the AXI

Well we don't really know it is the bug on our side until we root cause it..

Anyway, why do need such a complex work around here? GEM buffer objects
only need to be coherent, cached or uncached is not a concern for userspace.
For a device marked dma-coherent, both uncached and cached memory is coherent.

So, you could skip remapping these buffers as writecombine always when the
device is marked dma-coherent. Nothing J721s2 specific to that, and you
could drop all this PVR_HAS_OVERRIDE stuff here and in the previous patch.

Andrew

> ACE-Lite interface. Disabling cache snooping altogether would also resolve
> the issue, but is considered more of a performance hit.
> 
> Given the platform is dma-coherent, forcing all device-accessible memory
> allocations through the CPU cache is the preferred solution.
> 
> Implement this workaround so that it can later be enabled for the TI
> k3-j721s2 platform.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v2:
> - None
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-19-4ed30e865892@imgtec.com
> ---
>   drivers/gpu/drm/imagination/pvr_device.c | 11 ++++++++++-
>   drivers/gpu/drm/imagination/pvr_device.h | 11 +++++++++++
>   drivers/gpu/drm/imagination/pvr_drv.c    |  2 +-
>   drivers/gpu/drm/imagination/pvr_gem.c    |  3 +++
>   drivers/gpu/drm/imagination/pvr_gem.h    |  7 +++++--
>   drivers/gpu/drm/imagination/pvr_mmu.c    |  7 ++++++-
>   6 files changed, 36 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
> index 2ce46b9a8ab7609faebeeb4e7820751b00047806..ffc177c383c1be16061eff0290c347918b0991f7 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -24,6 +24,7 @@
>   #include <linux/gfp.h>
>   #include <linux/interrupt.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/slab.h>
>   #include <linux/stddef.h>
> @@ -635,6 +636,7 @@ bool
>   pvr_device_overrides_validate(struct pvr_device *pvr_dev,
>   			      const struct pvr_device_overrides *overrides)
>   {
> +	struct drm_device *drm_dev = from_pvr_device(pvr_dev);
>   	bool ret = true;
>   
>   	/*
> @@ -643,7 +645,14 @@ pvr_device_overrides_validate(struct pvr_device *pvr_dev,
>   	 *
>   	 * Note that this function may be called early during device initialization
>   	 * so it should not be assumed that @pvr_dev is ready for normal use yet.
> -	 */
> +	*/
> +
> +	if (overrides->device_memory_force_cpu_cached &&
> +	    device_get_dma_attr(drm_dev->dev) != DEV_DMA_COHERENT) {
> +		drm_err(drm_dev,
> +			"Specifying device_memory_force_cpu_cached override without dma-coherent attribute is unsupported.");
> +		ret = false;
> +	}
>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
> index ad0a02a37154099542247dfc62f411c10f4e41f4..7ae14899db24f4c747e8cf4d61d252eb403713f4 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -60,8 +60,19 @@ struct pvr_fw_version {
>   /**
>    * struct pvr_device_overrides - Hardware-level overrides loaded from
>    * MODULE_DEVICE_TABLE() or similar.
> + *
> + * @device_memory_force_cpu_cached: By default, all device memory buffer objects
> + * are mapped write-combined on the CPU (see %PVR_BO_CPU_CACHED) including MMU
> + * page table backing pages which do not use the regular device memory objects.
> + * This override forces all CPU mappings to be mapped cached instead. Since this
> + * could require additional cache maintenance operations to be performed,
> + * pvr_device_overrides_validate() ensures that the dma-coherent attribute is
> + * set when this override is specified. Required on some TI platforms where a
> + * bug causes device-to-cpu cache snooping to behave incorrectly when
> + * interacting with cpu-uncached memory.
>    */
>   struct pvr_device_overrides {
> +	bool device_memory_force_cpu_cached;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
> index b56ee2cda9b54c4388a6eef38b0ff81acdb05874..e074cfb0d2055b5387dbb142ca972108977f9854 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1490,7 +1490,7 @@ static void pvr_remove(struct platform_device *plat_dev)
>   	pvr_power_domains_fini(pvr_dev);
>   }
>   
> -static const struct pvr_device_overrides pvr_device_overrides_default = {};
> +static const struct pvr_device_overrides pvr_device_overrides_default = { 0 };
>   
>   /*
>    * Always specify &pvr_device_overrides_default instead of %NULL for &struct of_device_id->data so
> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
> index 6a8c81fe8c1e85c2130a4fe90fce35b6a2be35aa..c67c30518f89af3de2e617a9b65e5cd78870fa2c 100644
> --- a/drivers/gpu/drm/imagination/pvr_gem.c
> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
> @@ -345,6 +345,9 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
>   	if (size == 0 || !pvr_gem_object_flags_validate(flags))
>   		return ERR_PTR(-EINVAL);
>   
> +	if (PVR_HAS_OVERRIDE(pvr_dev, device_memory_force_cpu_cached))
> +		flags |= PVR_BO_CPU_CACHED;
> +
>   	shmem_obj = drm_gem_shmem_create(from_pvr_device(pvr_dev), size);
>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
> diff --git a/drivers/gpu/drm/imagination/pvr_gem.h b/drivers/gpu/drm/imagination/pvr_gem.h
> index e0e5ea509a2e88a437b8d241ea13c7bab2220f56..9b3cbcbe48dfbbc8be211a8a409699a43452e178 100644
> --- a/drivers/gpu/drm/imagination/pvr_gem.h
> +++ b/drivers/gpu/drm/imagination/pvr_gem.h
> @@ -44,8 +44,11 @@ struct pvr_file;
>    * Bits not defined anywhere are "undefined".
>    *
>    * CPU mapping options
> - *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set this
> - *       flag to override this behaviour and map the object cached.
> + *    :PVR_BO_CPU_CACHED: By default, all GEM objects are mapped write-combined on the CPU. Set
> + *       this flag to override this behaviour and map the object cached. If
> + *       &struct pvr_device_overrides->device_memory_force_cpu_cached is specified, all allocations
> + *       will be mapped as if this flag was set. This does not require any additional consideration
> + *       at allocation time since the override is only valid if the dma-coherent attribute is set.
>    *
>    * Firmware options
>    *    :PVR_BO_FW_NO_CLEAR_ON_RESET: By default, all FW objects are cleared and reinitialised on hard
> diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
> index 4fe70610ed94cf707e631f8148af081a94f97327..7c7deb29b735308eaed26900f2f54a838382c255 100644
> --- a/drivers/gpu/drm/imagination/pvr_mmu.c
> +++ b/drivers/gpu/drm/imagination/pvr_mmu.c
> @@ -259,6 +259,7 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
>   	struct device *dev = from_pvr_device(pvr_dev)->dev;
>   
>   	struct page *raw_page;
> +	pgprot_t prot;
>   	int err;
>   
>   	dma_addr_t dma_addr;
> @@ -268,7 +269,11 @@ pvr_mmu_backing_page_init(struct pvr_mmu_backing_page *page,
>   	if (!raw_page)
>   		return -ENOMEM;
>   
> -	host_ptr = vmap(&raw_page, 1, VM_MAP, pgprot_writecombine(PAGE_KERNEL));
> +	prot = PAGE_KERNEL;
> +	if (!PVR_HAS_OVERRIDE(pvr_dev, device_memory_force_cpu_cached))
> +		prot = pgprot_writecombine(prot);
> +
> +	host_ptr = vmap(&raw_page, 1, VM_MAP, prot);
>   	if (!host_ptr) {
>   		err = -ENOMEM;
>   		goto err_free_page;
> 
