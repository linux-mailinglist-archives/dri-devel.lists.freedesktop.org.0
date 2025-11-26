Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA79EC891CC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3185010E58D;
	Wed, 26 Nov 2025 09:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="guzeQBhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C08010E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764150744;
 bh=p2d6tWiC7zJzhOcMVqKqokGiR5sva9dnTCaqBmrZg6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=guzeQBhYYJS6oLt8RemQSyjvUDmqWMMxZVveDxXXqA2oX2ywGomIoTcG4+7kNvvCO
 TqV8TWYVXNPbyqHLmydv+A52hlan6YIk2Xd8FEg5dBTXkX/BafdSv+wreb/80Vg38z
 ZFF2Z3ZIPCPiejulD0apQ39ierN4+vyOJOXnSS/6KYCKoblvTPfwfvlhGx0EHCpI4n
 VUXgmPYVJNVEihuxKi2f20wEYvCIpcE2JK7aXD4dh8e1ta3Ep/v1xakvketfi5jAGa
 PMTqTQ0dqZRBX55SlFOTNA0WCtUVBy/+ozktek0RIezCsUnslQJbd//cdEHjuQV1Jy
 zMeyRXJmufxzg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 72B1117E04D6;
 Wed, 26 Nov 2025 10:52:24 +0100 (CET)
Date: Wed, 26 Nov 2025 10:52:19 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2] drm/panthor: Avoid adding of kernel BOs to extobj list
Message-ID: <20251126105219.3a51430c@fedora>
In-Reply-To: <20251120172118.2741724-1-akash.goel@arm.com>
References: <20251120172118.2741724-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Thu, 20 Nov 2025 17:21:18 +0000
Akash Goel <akash.goel@arm.com> wrote:

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
> v2: Add R-bs and fixes tags
> 
> Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Queued to drm-misc-next.

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

