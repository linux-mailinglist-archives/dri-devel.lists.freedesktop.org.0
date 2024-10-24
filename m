Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49269AEABB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473E310E266;
	Thu, 24 Oct 2024 15:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZO+qScLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD2D10E266
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729784381;
 bh=rrJb1NqK5b8PbDzY+nU1vuLdPpt7Qi2yFThhEd+tOJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZO+qScLFjcOazkdNCqnmMUfPryTZa2hazbnX1qTg0qCLFKagn7CwchGBrrE2Syxi0
 BwQig7yMZ62cV+g/+XCBbWkXtdeEJJH3p+FnHEEvhgmQdKMPMdB6RlNes+fOlV2iC9
 FNdrFI5Z5N2DHdrVgSJyKsiwlDqQWHQ7vLoB74u8eeYPJbRvVG6zTmghnqZ3eLYKy3
 Aw4jlT7/P65fdICh0daRi86vMvl3tUpkmUyiLDOGBXuhuWChaARs82Y3LTMfwrAaIf
 si2LYiNSmKydVyvEyJk5FQY4xDwvfDpETambbYiq8DgmmILhvLVCoRXLtXqj8tKoqb
 D44A44PbENKGA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 620C717E3662;
 Thu, 24 Oct 2024 17:39:41 +0200 (CEST)
Date: Thu, 24 Oct 2024 17:39:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH 3/3] drm/panthor: Prevent potential overwrite of buffer
 objects
Message-ID: <20241024173935.6430159e@collabora.com>
In-Reply-To: <20241024145432.934086-4-akash.goel@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-4-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 24 Oct 2024 15:54:32 +0100
Akash Goel <akash.goel@arm.com> wrote:

> All CPU mappings are forced as uncached for Panthor buffer objects when
> system(IO) coherency is disabled. Physical backing for Panthor BOs is
> allocated by shmem, which clears the pages also after allocation. But
> there is no explicit cache flush done after the clearing of pages.
> So it could happen that there are dirty cachelines in the CPU cache
> for the BOs, when they are accessed from the CPU side through uncached
> CPU mapping, and the eviction of cachelines overwrites the data of BOs.

Hm, this looks like something that should be handled at the
drm_gem_shmem level when drm_gem_shmem_object::map_wc=true, as I
suspect other drivers can hit the same issue (I'm thinking of panfrost
and lima, but there might be others).

> 
> This commit tries to avoid the potential overwrite scenario.
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.h | 10 ++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.c |  5 +++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index e43021cf6d45..4b0f43f1edf1 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -46,6 +46,16 @@ struct panthor_gem_object {
>  
>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>  	u32 flags;
> +
> +	/**
> +	 * @cleaned: The buffer object pages have been cleaned.
> +	 *
> +	 * There could be dirty CPU cachelines for the pages of buffer object
> +	 * after allocation, as shmem will zero out the pages. The cachelines
> +	 * need to be cleaned if the pages are going to be accessed with an
> +	 * uncached CPU mapping.
> +	 */
> +	bool cleaned;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index f522a116c1b1..d8cc9e7d064e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1249,6 +1249,11 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  
>  	op_ctx->map.sgt = sgt;
>  
> +	if (bo->base.map_wc && !bo->cleaned) {
> +		dma_sync_sgtable_for_device(vm->ptdev->base.dev, sgt, DMA_TO_DEVICE);
> +		bo->cleaned = true;
> +	}
> +
>  	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
>  	if (!preallocated_vm_bo) {
>  		if (!bo->base.base.import_attach)

