Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F6042ACBD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 20:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB19B89CE0;
	Tue, 12 Oct 2021 18:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF9689CE0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 18:57:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="290735417"
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="290735417"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 11:57:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,368,1624345200"; d="scan'208";a="715282661"
Received: from pmnk-mobl1.gar.corp.intel.com (HELO [10.249.254.42])
 ([10.249.254.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2021 11:57:40 -0700
Message-ID: <a0d82e4c-f762-e6c6-0f08-7f92e735e0c2@linux.intel.com>
Date: Tue, 12 Oct 2021 20:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 4/5] drm/vmwgfx: Introduce a new placement for MOB page
 tables
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: Martin Krastev <krastevm@vmware.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20211008173146.645127-1-zackr@vmware.com>
 <20211008173146.645127-5-zackr@vmware.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211008173146.645127-5-zackr@vmware.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/8/21 19:31, Zack Rusin wrote:
> For larger (bigger than a page) and noncontiguous mobs we have
> to create page tables that allow the host to find the memory.
> Those page tables just used regular system memory. Unfortunately
> in TTM those BO's are not allowed to be busy thus can't be
> fenced and we have to fence those bo's  because we don't want
> to destroy the page tables while the host is still executing
> the command buffers which might be accessing them.
>
> To solve it we introduce a new placement VMW_PL_SYSTEM which
> is very similar to TTM_PL_SYSTEM except that it allows
> fencing. This fixes kernel oops'es during unloading of the driver
> (and pci hot remove/add) which were caused by busy BO's in
> TTM_PL_SYSTEM being present in the delayed deletion list in
> TTM (TTM_PL_SYSTEM manager is destroyed before the delayed
> deletions are executed)
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

In general looks good to me. Some suggestions below:


> ---
>   drivers/gpu/drm/vmwgfx/Makefile               |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 14 ++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           | 12 ++-
>   .../gpu/drm/vmwgfx/vmwgfx_system_manager.c    | 90 +++++++++++++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    | 58 ++++++------
>   5 files changed, 138 insertions(+), 38 deletions(-)
>   create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
>
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
> index bc323f7d4032..0188a312c38c 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -9,7 +9,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
>   	    vmwgfx_cotable.o vmwgfx_so.o vmwgfx_binding.o vmwgfx_msg.o \
>   	    vmwgfx_simple_resource.o vmwgfx_va.o vmwgfx_blit.o \
>   	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
> -            vmwgfx_devcaps.o ttm_object.o ttm_memory.o
> +	    vmwgfx_devcaps.o ttm_object.o ttm_memory.o vmwgfx_system_manager.o
>   
>   vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) += vmwgfx_fb.o
>   vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 8d0b083ba267..daf65615308a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1071,6 +1071,12 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   				 "3D will be disabled.\n");
>   			dev_priv->has_mob = false;
>   		}
> +		if (vmw_sys_man_init(dev_priv) != 0) {
> +			drm_info(&dev_priv->drm,
> +				 "No MOB page table memory available. "
> +				 "3D will be disabled.\n");
> +			dev_priv->has_mob = false;
> +		}
>   	}
>   
>   	if (dev_priv->has_mob && (dev_priv->capabilities & SVGA_CAP_DX)) {
> @@ -1121,8 +1127,10 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>   	vmw_overlay_close(dev_priv);
>   	vmw_kms_close(dev_priv);
>   out_no_kms:
> -	if (dev_priv->has_mob)
> +	if (dev_priv->has_mob) {
>   		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
> +		vmw_sys_man_fini(dev_priv);
> +	}
>   	if (dev_priv->has_gmr)
>   		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
>   	vmw_devcaps_destroy(dev_priv);
> @@ -1172,8 +1180,10 @@ static void vmw_driver_unload(struct drm_device *dev)
>   		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
>   
>   	vmw_release_device_early(dev_priv);
> -	if (dev_priv->has_mob)
> +	if (dev_priv->has_mob) {
>   		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
> +		vmw_sys_man_fini(dev_priv);
> +	}
>   	vmw_devcaps_destroy(dev_priv);
>   	vmw_vram_manager_fini(dev_priv);
>   	ttm_device_fini(&dev_priv->bdev);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index a833751099b5..df19dfb3ce18 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -82,8 +82,9 @@
>   			VMWGFX_NUM_GB_SURFACE +\
>   			VMWGFX_NUM_GB_SCREEN_TARGET)
>   
> -#define VMW_PL_GMR (TTM_PL_PRIV + 0)
> -#define VMW_PL_MOB (TTM_PL_PRIV + 1)
> +#define VMW_PL_GMR      (TTM_PL_PRIV + 0)
> +#define VMW_PL_MOB      (TTM_PL_PRIV + 1)
> +#define VMW_PL_SYSTEM   (TTM_PL_PRIV + 2)
>   
>   #define VMW_RES_CONTEXT ttm_driver_type0
>   #define VMW_RES_SURFACE ttm_driver_type1
> @@ -1039,7 +1040,6 @@ extern struct ttm_placement vmw_vram_placement;
>   extern struct ttm_placement vmw_vram_sys_placement;
>   extern struct ttm_placement vmw_vram_gmr_placement;
>   extern struct ttm_placement vmw_sys_placement;
> -extern struct ttm_placement vmw_evictable_placement;
>   extern struct ttm_placement vmw_srf_placement;
>   extern struct ttm_placement vmw_mob_placement;
>   extern struct ttm_placement vmw_nonfixed_placement;
> @@ -1251,6 +1251,12 @@ int vmw_overlay_num_free_overlays(struct vmw_private *dev_priv);
>   int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type);
>   void vmw_gmrid_man_fini(struct vmw_private *dev_priv, int type);
>   
> +/**
> + * System memory manager
> + */
> +int vmw_sys_man_init(struct vmw_private *dev_priv);
> +void vmw_sys_man_fini(struct vmw_private *dev_priv);
> +
>   /**
>    * Prime - vmwgfx_prime.c
>    */
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> new file mode 100644
> index 000000000000..2b86e2d8aefe
> --- /dev/null
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_system_manager.c
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright 2021 VMware, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy,
> + * modify, merge, publish, distribute, sublicense, and/or sell copies
> + * of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + *
> + */
> +
> +#include "vmwgfx_drv.h"
> +
> +#include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_resource.h>
> +#include <linux/slab.h>
> +
> +
> +static int vmw_sys_man_alloc(struct ttm_resource_manager *man,
> +			     struct ttm_buffer_object *bo,
> +			     const struct ttm_place *place,
> +			     struct ttm_resource **res)
> +{
> +	*res = kzalloc(sizeof(**res), GFP_KERNEL);
> +	if (!*res)
> +		return -ENOMEM;
> +
> +	ttm_resource_init(bo, place, *res);
> +	return 0;
> +}
> +
> +static void vmw_sys_man_free(struct ttm_resource_manager *man,
> +			     struct ttm_resource *res)
> +{
> +	kfree(res);
> +}
> +
> +static const struct ttm_resource_manager_func vmw_sys_manager_func = {
> +	.alloc = vmw_sys_man_alloc,
> +	.free = vmw_sys_man_free,
> +};
> +
> +int vmw_sys_man_init(struct vmw_private *dev_priv)
> +{
> +	struct ttm_device *bdev = &dev_priv->bdev;
> +	struct ttm_resource_manager *man =
> +			kzalloc(sizeof(*man), GFP_KERNEL);
> +
> +	if (unlikely(!man))
> +		return -ENOMEM;
Nit: Branch prediction hints are typically not used in driver code. And 
here the potential benefit indeed appears small :)
> +
> +	man->use_tt = true;
> +	man->func = &vmw_sys_manager_func;
> +
> +	ttm_resource_manager_init(man, 0);
> +	ttm_set_driver_manager(bdev, VMW_PL_SYSTEM, man);
> +	ttm_resource_manager_set_used(man, true);
> +	return 0;
> +}
> +
> +void vmw_sys_man_fini(struct vmw_private *dev_priv)
> +{
> +	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev,
> +							    VMW_PL_SYSTEM);
> +
> +	ttm_resource_manager_evict_all(&dev_priv->bdev, man);
> +
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_resource_manager_cleanup(man);
> +
> +	ttm_set_driver_manager(&dev_priv->bdev, VMW_PL_SYSTEM, NULL);
> +	kfree(man);
> +}

I seem to recognize the general pattern here from the ttm_sys_manager, 
Any chance we could add what's needed to the ttm_sys_manager and make 
the code reusable? That's the _fini function and the memory type choice 
I guess. I figure i915 will need exactly the same.

/Thomas


