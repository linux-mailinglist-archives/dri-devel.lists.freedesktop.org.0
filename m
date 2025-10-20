Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990ABF02C8
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 11:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A93D10E338;
	Mon, 20 Oct 2025 09:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Rf48OgoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151D10E338
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760952634;
 bh=/X7hroxlMZHltT+duFeeJsVmt3DSGvxeD6QGIKP/XRk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rf48OgoVx2w6kZ6mYxYIrIUIxXskEIzQd/1SxHQsiLhWdlgO/cfhb5sceP3pHI7NY
 +IpuL4HTB/Tq4dR4TeAfIRlZG3afxkHMYhjUSj1J83k7R0hv44pv1vGYBrw3Ykrhfc
 Zl/HIgFs2WSTJzeMDozHgfJ47jUCr3WSdzkmLqrdqV53+M8oCtY3kGp3qyQ3MEdvwT
 b+goATHgdcOKq2G77r1BBfTX4MEphITTephocJqtS5sFtCvqoPnzDAsw0GK16S2HMq
 XqjK9YmGL8jh/UElguL4l/Ft4hfh0P+/OakVdjBq52KQniBm+rOz4COvjdkXlFxFwZ
 6UrTAVEoKgksg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 73D5A17E0DB7;
 Mon, 20 Oct 2025 11:30:34 +0200 (CEST)
Date: Mon, 20 Oct 2025 11:30:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Fix potential memleak of vma structure
Message-ID: <20251020113029.1ec51806@fedora>
In-Reply-To: <20251020085914.1276090-1-akash.goel@arm.com>
References: <20251020085914.1276090-1-akash.goel@arm.com>
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

On Mon, 20 Oct 2025 09:59:14 +0100
Akash Goel <akash.goel@arm.com> wrote:

> This commit addresses a memleak issue of panthor_vma (or drm_gpuva)
> structure in Panthor driver, that can happen if the GPU page table
> update operation to map the pages fail.
> The issue is very unlikely to occur in practice.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Akash Goel <akash.goel@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 6dec4354e378..34a86f7b58d9 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2081,8 +2081,10 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
>  	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
>  				   op_ctx->map.sgt, op->map.gem.offset,
>  				   op->map.va.range);
> -	if (ret)
> +	if (ret) {
> +		kfree(vma);

Calling kfree() in this context is probably fine, but I think I'd
prefer if we were introducing a panthor_vm_op_ctx_return_vma() helper
returning the vma to the preallocated array, and letting the deferred
cleanup function free this up.

>  		return ret;
> +	}
>  
>  	/* Ref owned by the mapping now, clear the obj field so we don't release the
>  	 * pinning/obj ref behind GPUVA's back.

