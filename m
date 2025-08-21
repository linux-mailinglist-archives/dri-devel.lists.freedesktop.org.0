Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FF7B2EFC2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 09:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605B310E892;
	Thu, 21 Aug 2025 07:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ifSpiX/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA5D10E892
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755761634;
 bh=eJjCN7EMFWhnfPQM50VED/b/QKoZDLR+Xl5LUqfGjJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ifSpiX/cojVUew0FzK+n4uESqVe4GDkXTKXPTcEN3OZSzH39afnVeFQW2pKjFp8Gy
 d9mt5lMGy7QGMSqVN5vPUU7wszBcsLTgvCK7tLCqVcb8Sc5hZAi255SLoFnL1G2xQK
 89owQ9xdgn4crmX/IIu2guVaNfyZEfM0zxQKzit6z0ASb3QyXmlSlRGxIV80EfpJFc
 w5z94R3d/stvj4Trs6G1BaZYuPvHdcvx5bEz5kCx7b8WVyhz8QkkzoR6FOpF6vfTRB
 WA3P8H7KdbyZjlnwIDpohr8Z2EnPbNWipk3Ax2rEll7rmyBlUqCXQSBj7Fa2BOh6lz
 27DEK/szECbdg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FF5417E01F5;
 Thu, 21 Aug 2025 09:33:54 +0200 (CEST)
Date: Thu, 21 Aug 2025 09:33:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 8/9] drm/panthor: check bo offset alignment in vm bind
Message-ID: <20250821093350.104c28a0@fedora>
In-Reply-To: <20250720000146.1405060-9-olvaffe@gmail.com>
References: <20250720000146.1405060-1-olvaffe@gmail.com>
 <20250720000146.1405060-9-olvaffe@gmail.com>
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

On Sat, 19 Jul 2025 17:01:45 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> Fail early from panthor_vm_bind_prepare_op_ctx instead of late from
> ops->map_pages.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

We can probably merge this one ahead of the coredump stuff.

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index a857a0dd1099..7862c99984b6 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1206,7 +1206,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) != DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)
>  		return -EINVAL;
>  
> -	/* Make sure the VA and size are aligned and in-bounds. */
> +	/* Make sure the VA and size are in-bounds. */
>  	if (size > bo->base.base.size || offset > bo->base.base.size - size)
>  		return -EINVAL;
>  
> @@ -2423,7 +2423,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
>  	int ret;
>  
>  	/* Aligned on page size. */
> -	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
> +	if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
>  		return -EINVAL;
>  
>  	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {

