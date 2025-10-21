Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C196BF5013
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:41:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357D010E57B;
	Tue, 21 Oct 2025 07:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SXiC5qZ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1763E10E57B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761032491;
 bh=DK3PRwZpBq1od1VedcTebPWw4rDrTPz/ZDSqWv21YEA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SXiC5qZ4XSjTTVhbMOCbm/N7jOl41DRnFhqfoOM9cr+gB88A/DW5LbjqYpIagSX2C
 o+PWTpaD+JR84KOl4ew03e8XF+/l5PVWSx7IZGoy/KMIzxnrbsZwaJgp4igMHC0AuC
 2XEyOutMUEmhJlCGDhLB3+go7Jn9uMIfim5YU7J0GH1Wo7mmqpkJeqAL0m16i/I0ii
 JY/5Y6mI/1c92Jb4pqHHA07zpcTiWoyC3051+boT7wxftgBSmME6L1ikRwOWaF2Aoa
 x2T28+jd3lD5iGN/IvyVPLuHio9cr8TEWz+suHBYJ9Hk7AseWyGj6kBuyj86bSMa6M
 FKN0n21Vyllcg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 38ABD17E081A;
 Tue, 21 Oct 2025 09:41:31 +0200 (CEST)
Date: Tue, 21 Oct 2025 09:41:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH v2] drm/panthor: Fix potential memleak of vma structure
Message-ID: <20251021094125.7be19764@fedora>
In-Reply-To: <20251020200243.1324045-1-akash.goel@arm.com>
References: <20251020200243.1324045-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Mon, 20 Oct 2025 21:02:43 +0100
Akash Goel <akash.goel@arm.com> wrote:

> This commit addresses a memleak issue of panthor_vma (or drm_gpuva)
> structure in Panthor driver, that can happen if the GPU page table
> update operation to map the pages fail.
> The issue is very unlikely to occur in practice.
> 
> v2: Add panthor_vm_op_ctx_return_vma() helper (Boris)
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Just one minor thing below, but the patch is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

regardless.

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 6dec4354e378..63af8ee89b08 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1146,6 +1146,18 @@ static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	}
>  }
>  
> +static void
> +panthor_vm_op_ctx_return_vma(struct panthor_vm_op_ctx *op_ctx,
> +			     struct panthor_vma *vma)
> +{
> +	for (u32 i = 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++) {
> +		if (!op_ctx->preallocated_vmas[i]) {
> +			op_ctx->preallocated_vmas[i] = vma;
> +			return;
> +		}
> +	}

Maybe add a WARN_ON_ONCE() here.

> +}
> +
>  static struct panthor_vma *
>  panthor_vm_op_ctx_get_vma(struct panthor_vm_op_ctx *op_ctx)
>  {
> @@ -2081,8 +2093,10 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>  	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
>  				   op_ctx->map.sgt, op->map.gem.offset,
>  				   op->map.va.range);
> -	if (ret)
> +	if (ret) {
> +		panthor_vm_op_ctx_return_vma(op_ctx, vma);
>  		return ret;
> +	}
>  
>  	/* Ref owned by the mapping now, clear the obj field so we don't release the
>  	 * pinning/obj ref behind GPUVA's back.

