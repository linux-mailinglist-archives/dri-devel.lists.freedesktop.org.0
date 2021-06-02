Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB61398889
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CB96E1E8;
	Wed,  2 Jun 2021 11:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963606EB85
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id EC0B73FB7D;
 Wed,  2 Jun 2021 13:44:48 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="bJE7ZBjA";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hye_oNiKSyDQ; Wed,  2 Jun 2021 13:44:48 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 981F93FB22;
 Wed,  2 Jun 2021 13:44:46 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 3878936012A;
 Wed,  2 Jun 2021 13:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622634286; bh=/1hzXPcDdzYVYguKGtRcqHC0h92lV5nuyFGMxYg5jGc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=bJE7ZBjAZfpAfqhxig4wCeVCXbTL1juWKP25Qw3sQuU+4liX6rr5ZRk1JImYtFCvw
 YsfOcf3uRGWvegg0yBldjl+mXHB9/IXaUlKCYkTo7Ly1cVCZeeOghaSaUMWHHEwoio
 paXJEyyDKHrCIOxoy9LnMRiSiw1M84z4uxgUNDOk=
Subject: Re: [PATCH 02/10] drm/ttm: flip over the range manager to self
 allocated nodes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <20210602100914.46246-2-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <9b01d58f-6474-70de-4364-6adad59717a5@shipmail.org>
Date: Wed, 2 Jun 2021 13:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602100914.46246-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 6/2/21 12:09 PM, Christian König wrote:
> Start with the range manager to make the resource object the base
> class for the allocated nodes.
>
> While at it cleanup a lot of the code around that.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 +
>   drivers/gpu/drm/drm_gem_vram_helper.c   |  2 +
>   drivers/gpu/drm/nouveau/nouveau_ttm.c   |  2 +
>   drivers/gpu/drm/qxl/qxl_ttm.c           |  1 +
>   drivers/gpu/drm/radeon/radeon_ttm.c     |  1 +
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 56 ++++++++++++++++++-------
>   drivers/gpu/drm/ttm/ttm_resource.c      | 26 ++++++++----
>   include/drm/ttm/ttm_bo_driver.h         | 26 ------------
>   include/drm/ttm/ttm_range_manager.h     | 43 +++++++++++++++++++
>   include/drm/ttm/ttm_resource.h          |  3 ++
>   10 files changed, 111 insertions(+), 50 deletions(-)
>   create mode 100644 include/drm/ttm/ttm_range_manager.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 69db89261650..df1f185faae9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -45,6 +45,7 @@
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_range_manager.h>
>   
>   #include <drm/amdgpu_drm.h>
>   
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 83e7258c7f90..17a4c5d47b6a 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -17,6 +17,8 @@
>   #include <drm/drm_prime.h>
>   #include <drm/drm_simple_kms_helper.h>
>   
> +#include <drm/ttm/ttm_range_manager.h>
> +
>   static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>   
>   /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 65430912ff72..b08b8efeefba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -26,6 +26,8 @@
>   #include <linux/limits.h>
>   #include <linux/swiotlb.h>
>   
> +#include <drm/ttm/ttm_range_manager.h>
> +
>   #include "nouveau_drv.h"
>   #include "nouveau_gem.h"
>   #include "nouveau_mem.h"
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 8aa87b8edb9c..19fd39d9a00c 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -32,6 +32,7 @@
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_range_manager.h>
>   
>   #include "qxl_drv.h"
>   #include "qxl_object.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index cdffa9b65108..ad2a5a791bba 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -45,6 +45,7 @@
>   #include <drm/ttm/ttm_bo_api.h>
>   #include <drm/ttm/ttm_bo_driver.h>
>   #include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_range_manager.h>
>   
>   #include "radeon_reg.h"
>   #include "radeon.h"
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index b9d5da6e6a81..ce5d07ca384c 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -29,12 +29,13 @@
>    * Authors: Thomas Hellstrom <thellstrom-at-vmware-dot-com>
>    */
>   
> -#include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
> +#include <drm/ttm/ttm_range_manager.h>
> +#include <drm/ttm/ttm_bo_api.h>
>   #include <drm/drm_mm.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> -#include <linux/module.h>
>   
>   /*
>    * Currently we use a spinlock for the lock, but a mutex *may* be
> @@ -60,8 +61,8 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   			       struct ttm_resource *mem)
>   {
>   	struct ttm_range_manager *rman = to_range_manager(man);
> +	struct ttm_range_mgr_node *node;
>   	struct drm_mm *mm = &rman->mm;
> -	struct drm_mm_node *node;
>   	enum drm_mm_insert_mode mode;
>   	unsigned long lpfn;
>   	int ret;
> @@ -70,7 +71,7 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
>   	if (!lpfn)
>   		lpfn = man->size;
>   
> -	node = kzalloc(sizeof(*node), GFP_KERNEL);
> +	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);

I'm still a bit confused  about the situation where a driver wants to 
attach private data to a struct ttm_resource without having to 
re-implement its own range manager?

Could be cached sg-tables, list of GPU bindings etc. Wouldn't work with 
the above unless we have a void *driver_private member on the struct 
ttm_resource. Is that the plan going forward here? Or that the driver 
actually does the re-implementation?

Thanks,

Thomas


