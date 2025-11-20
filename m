Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265FEC74E95
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 16:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AC310E771;
	Thu, 20 Nov 2025 15:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8798C10E771
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 15:25:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C59A339;
 Thu, 20 Nov 2025 07:24:55 -0800 (PST)
Received: from [10.1.32.17] (unknown [10.1.32.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A763F66E;
 Thu, 20 Nov 2025 07:25:00 -0800 (PST)
Message-ID: <949604fd-08fd-47f5-a0b0-60087c033d41@arm.com>
Date: Thu, 20 Nov 2025 15:24:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Avoid adding of kernel BOs to extobj list
To: Akash Goel <akash.goel@arm.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
References: <20251113184544.1832461-1-akash.goel@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251113184544.1832461-1-akash.goel@arm.com>
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

On 13/11/2025 18:45, Akash Goel wrote:
> The kernel BOs unnecessarily got added to the external objects list
> of drm_gpuvm, when mapping to GPU, which would have resulted in few
> extra CPU cycles being spent at the time of job submission as
> drm_exec_until_all_locked() loop iterates over all external objects.
> 
> Kernel BOs are private to a VM and so they share the dma_resv object of
> the dummy GEM object created for a VM. Use of DRM_EXEC_IGNORE_DUPLICATES
> flag ensured the recursive locking of the dummy GEM object was ignored.
> Also no extra space got allocated to add fences to the dma_resv object
> of dummy GEM object. So no other impact apart from few extra CPU cycles.
> 
> This commit sets the pointer to dma_resv object of GEM object of
> kernel BOs before they are mapped to GPU, to prevent them from
> being added to external objects list.
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

As Boris says it would be good to have a Fixes tag - can you dig out an
appropriate commit then I can merge?

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index f369cc3e2a5f..10d255cccc09 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -145,6 +145,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  	bo = to_panthor_bo(&obj->base);
>  	kbo->obj = &obj->base;
>  	bo->flags = bo_flags;
> +	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
> +	drm_gem_object_get(bo->exclusive_vm_root_gem);
> +	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
>  
>  	if (vm == panthor_fw_vm(ptdev))
>  		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
> @@ -168,9 +171,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
>  		goto err_free_va;
>  
>  	kbo->vm = panthor_vm_get(vm);
> -	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
> -	drm_gem_object_get(bo->exclusive_vm_root_gem);
> -	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
>  	return kbo;
>  
>  err_free_va:

