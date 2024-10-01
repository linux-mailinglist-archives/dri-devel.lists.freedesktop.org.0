Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF48798C3B1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 18:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA8510E1A2;
	Tue,  1 Oct 2024 16:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="p05Ea++y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3414210E1A2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727801057;
 bh=jfAYEmnOijFS/s4Jm2r8EK1tyEYmd3kcfBwd9kIn7qk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p05Ea++yY06w6+IbTyxputKyxCVLOg/6SYIxBg8AEyb80Iee9yqgXrB5eavvwAzsk
 P70LG/39A15r5DiiLVq6TTX4YVDgxqttM/zMfl10HF9LOEr6SPNt4A35BKcej+vITg
 Vn5qudjIqXnAWnaL4HT2G4wZIpBvlijynvzgUtcAAFy0splKTLDbcwMqsWmXS2Cbud
 G8D5ZJlro1nmz4CFVaQiZEZ+DVFW+RP/l926ZHIIu1y3qK46qaYwW6QHrL6EO4o/x/
 5GUAaetIIzNhzsTjRwZYFSwBg3PgrW/K88WJTmVjk0z3cAy53oTOw3TSj7NPjCMWBG
 Xz7bEFGrDYI8g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ABF8A17E1060;
 Tue,  1 Oct 2024 18:44:17 +0200 (CEST)
Date: Tue, 1 Oct 2024 18:44:12 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRy?=
 =?UTF-8?B?acOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH] drm/panthor: Lock the VM resv before calling
 drm_gpuvm_bo_obtain_prealloc()
Message-ID: <20241001184412.7403c784@collabora.com>
In-Reply-To: <20240913112722.492144-1-boris.brezillon@collabora.com>
References: <20240913112722.492144-1-boris.brezillon@collabora.com>
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

On Fri, 13 Sep 2024 13:27:22 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
> pre-allocated BO if the <BO,VM> association exists. Given we
> only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
> be called immediately, and we have to hold the VM resv lock when
> calling this function.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Queued to drm-misc-fixes.

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 37f1885c54c7..aa12ed2acfcf 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1251,9 +1251,17 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  		goto err_cleanup;
>  	}
>  
> +	/* drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
> +	 * pre-allocated BO if the <BO,VM> association exists. Given we
> +	 * only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
> +	 * be called immediately, and we have to hold the VM resv lock when
> +	 * calling this function.
> +	 */
> +	dma_resv_lock(panthor_vm_resv(vm), NULL);
>  	mutex_lock(&bo->gpuva_list_lock);
>  	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
>  	mutex_unlock(&bo->gpuva_list_lock);
> +	dma_resv_unlock(panthor_vm_resv(vm));
>  
>  	/* If the a vm_bo for this <VM,BO> combination exists, it already
>  	 * retains a pin ref, and we can release the one we took earlier.

