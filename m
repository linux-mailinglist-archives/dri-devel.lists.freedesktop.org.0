Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954D9B4273F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 18:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFFC10E1A5;
	Wed,  3 Sep 2025 16:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="NouMMXaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A88210E1A5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756918008;
 bh=CgFF97qUmIIM4QQUSZ1m8s2Y2qHyO5S2SV0vSEqfck8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NouMMXaJeRchlBIyaaEHNxjadOSAOmDUXxXWRiiG6pUoTpoweCwINtvRjBppRGYQ4
 jNm72dVQ7Isob4wWVilEjqyAIwW9zophiDouR6qLCazriJqxZpnXIshGGAxR3V22zC
 E9KwEL128tO+8KNoNuFQqiMfMhtWSI75TO77mjDBNixYxeli0Y/nS9XQ0zt6CGYXLe
 IQ9NiJ47vF3jjQks0Lhu4bmbLOiiCdZaSm2xXe6GdzShLERFVFBkdZt19/b78aevIk
 dBoB1gjxoeM8S+vBzqv/fVz3NliznwHT5VIayB/stwCwuzNDXY0ScTd2zHmencpx+x
 KbkmvHk/kcAsw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4308A17E0579;
 Wed,  3 Sep 2025 18:46:48 +0200 (CEST)
Date: Wed, 3 Sep 2025 18:46:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: check bo offset alignment in vm bind
Message-ID: <20250903184642.62183125@fedora>
In-Reply-To: <20250828200116.3532255-1-olvaffe@gmail.com>
References: <20250828200116.3532255-1-olvaffe@gmail.com>
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

On Thu, 28 Aug 2025 13:01:16 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> Fail early from panthor_vm_bind_prepare_op_ctx instead of late from
> ops->map_pages.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index bad720f23eb70..6dec4354e3789 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1222,7 +1222,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) != DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)
>  		return -EINVAL;
>  
> -	/* Make sure the VA and size are aligned and in-bounds. */
> +	/* Make sure the VA and size are in-bounds. */
>  	if (size > bo->base.base.size || offset > bo->base.base.size - size)
>  		return -EINVAL;
>  
> @@ -2447,7 +2447,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *file,
>  	int ret;
>  
>  	/* Aligned on page size. */
> -	if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
> +	if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
>  		return -EINVAL;

Now that I look at this, I think we'd be better moving this alignment
check to panthor_vm_prepare_[un]map_op_ctx() to cover the in-kernel
users.

>  
>  	switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {

