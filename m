Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 082E19AEB0D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7098910E2A8;
	Thu, 24 Oct 2024 15:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bfwEEwSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D3D10E976
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729784989;
 bh=+r7PFQxCeGpmi1up4Fbly4LPrmk1HCWZowpXp5Vr+Uc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bfwEEwSsDrHBVjL9JElSpgFrtK8WsWUzxFbswhKJh6Bjz89fbNXtQp3UPLTDexoIl
 xty2FNOgwX9j1JYnse11HPVD6cKJU5WtBbrHsT4jtyQcZv2CKInHV0RsHWhxRPEm+g
 hwOsph71Zs4eHsIXPs1jlawsQgsZdW/zPio4z0Kpqv4T0VnRKAWdQWxN/g0thOMRUZ
 Qc94KvEEq7qJB8i0l0uERpQzTh90sM1oa88QSomvNZma4M5Pu66j/QCSmpz6J4fyyI
 VKMWNxJhWVoMf3PDCo+8o+AV34hYCCXd0KaBREDhpNCCITsuqEh3VYqb5TJKUFffqw
 v6FoRXCcstJIQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C42BA17E3664;
 Thu, 24 Oct 2024 17:49:48 +0200 (CEST)
Date: Thu, 24 Oct 2024 17:49:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH 1/3] drm/panthor: Update memattr programing to align
 with GPU spec
Message-ID: <20241024174944.4e811816@collabora.com>
In-Reply-To: <20241024145432.934086-2-akash.goel@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
 <20241024145432.934086-2-akash.goel@arm.com>
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

+Robin for the MMU details

On Thu, 24 Oct 2024 15:54:30 +0100
Akash Goel <akash.goel@arm.com> wrote:

> Mali GPU Arch spec forbids the GPU PTEs to indicate Inner or Outer
> shareability when no_coherency protocol is selected. Doing so results in
> unexpected or undesired snooping of the CPU caches on some platforms,
> such as Juno FPGA, causing functional issues. For example the boot of
> MCU firmware fails as GPU ends up reading stale data for the FW memory
> pages from the CPU's cache. The FW memory pages are initialized with
> uncached mapping when the device is not reported to be dma-coherent.
> The shareability bits are set to inner-shareable when IOMMU_CACHE flag
> is passed to map_pages() callback and IOMMU_CACHE flag is passed by
> Panthor driver when memory needs to be mapped as cached on the GPU side.
> 
> IOMMU_CACHE seems to imply cache coherent and is probably not fit for
> purpose for the memory that is mapped as cached on GPU side but doesn't
> need to remain coherent with the CPU.

Yeah, IIRC I've been abusing the _CACHE flag to mean GPU-cached, not
cache-coherent. I think it be good to sit down with Rob and add the
necessary IOMMU_ flags so we can express all the shareability and
cacheability variants we have with the "Mali" MMU. For instance, I
think the shareability between MCU/GPU can be expressed properly at the
moment, and we unconditionally map things uncached because of that.

> 
> This commit updates the programming of MEMATTR register to use
> MIDGARD_INNER instead of CPU_INNER when coherency is disabled. That way
> the inner-shareability specified in the GPU PTEs would map to Mali's
> internal-shareable mode, which is always supported by the GPU regardless
> of the coherency protocal and is required by the Userspace driver to
> ensure coherency between the shader cores.
> 
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index f3ee5d2753f1..f522a116c1b1 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1927,7 +1927,7 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>  	return pool;
>  }
>  
> -static u64 mair_to_memattr(u64 mair)
> +static u64 mair_to_memattr(u64 mair, bool coherent)
>  {
>  	u64 memattr = 0;
>  	u32 i;
> @@ -1946,14 +1946,21 @@ static u64 mair_to_memattr(u64 mair)
>  				   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER |
>  				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(false, false);
>  		} else {
> -			/* Use SH_CPU_INNER mode so SH_IS, which is used when
> -			 * IOMMU_CACHE is set, actually maps to the standard
> -			 * definition of inner-shareable and not Mali's
> -			 * internal-shareable mode.
> -			 */
>  			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_WB |
> -				   AS_MEMATTR_AARCH64_SH_CPU_INNER |
>  				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(inner & 1, inner & 2);
> +			/* Use SH_MIDGARD_INNER mode when device isn't coherent,
> +			 * so SH_IS, which is used when IOMMU_CACHE is set, maps
> +			 * to Mali's internal-shareable mode. As per the Mali
> +			 * Spec, inner and outer-shareable modes aren't allowed
> +			 * for WB memory when coherency is disabled.
> +			 * Use SH_CPU_INNER mode when coherency is enabled, so
> +			 * that SH_IS actually maps to the standard definition of
> +			 * inner-shareable.
> +			 */
> +			if (!coherent)
> +				out_attr |= AS_MEMATTR_AARCH64_SH_MIDGARD_INNER;
> +			else
> +				out_attr |= AS_MEMATTR_AARCH64_SH_CPU_INNER;
>  		}
>  
>  		memattr |= (u64)out_attr << (8 * i);
> @@ -2325,7 +2332,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
>  		goto err_sched_fini;
>  
>  	mair = io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg.arm_lpae_s1_cfg.mair;
> -	vm->memattr = mair_to_memattr(mair);
> +	vm->memattr = mair_to_memattr(mair, ptdev->coherent);
>  
>  	mutex_lock(&ptdev->mmu->vm.lock);
>  	list_add_tail(&vm->node, &ptdev->mmu->vm.list);

