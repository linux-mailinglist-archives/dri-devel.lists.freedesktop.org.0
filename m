Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A652982DEE3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 19:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2A910E36E;
	Mon, 15 Jan 2024 18:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E4E10E374
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705342164;
 bh=+As4Mx/D5b1ZAwIruzvyXFAbJwiGEyR0dYDiT+8aTf4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wZi6vMP5QcTP7l+l5AasKXi1wuc3dsMrreNoU7eIrBVtR6kS27oKkDROnoaLH47bX
 RStRt63HeZWR8kbnPZcEnYgN6I/BHRSXu8HsxGaE6M8SwJw5d20HghdXhPn8hB/4Pk
 /FCO3hjA64a1ehQz9ZPStTwGQyXAtXzNOOJTw79ntlF/y3oMRJjVBJmYQsH2TVh3Hd
 iOv2hRWYZaeqEaR2+OECJC3jW6heggJjyo/6wIN/kHslMPcNG7F8rsJ0ypiYTQv0MU
 khhQMkrwvUTofB+Rn2TFBqTAkcWWmlxxHY6MPYYqORqgpGRBdt+yLz6oItCX6aEyP3
 +ArXiOunUTppA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id ACFDD37801C1;
 Mon, 15 Jan 2024 18:09:23 +0000 (UTC)
Date: Mon, 15 Jan 2024 19:09:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 07/14] drm/panthor: Add the MMU/VM logical block
Message-ID: <20240115190922.1fb23f15@collabora.com>
In-Reply-To: <20231204173313.2098733-8-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-8-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Dec 2023 18:33:00 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
> +				       void *priv)
> +{
> +	struct panthor_vma *unmap_vma = container_of(op->remap.unmap->va, struct panthor_vma, base);
> +	struct panthor_vm *vm = priv;
> +	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
> +	struct drm_gpuva *prev_va = NULL, *next_va = NULL;
> +	u64 unmap_start, unmap_range;
> +	int ret;
> +
> +	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
> +	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
> +	if (ret)
> +		return ret;
> +
> +	if (op->remap.prev) {
> +		panthor_vma_init(op_ctx->map.prev_vma, unmap_vma->flags);
> +		prev_va = &op_ctx->map.prev_vma->base;
> +	}
> +
> +	if (op->remap.next) {
> +		panthor_vma_init(op_ctx->map.next_vma, unmap_vma->flags);
> +		next_va = &op_ctx->map.next_vma->base;
> +	}
> +
> +	drm_gpuva_remap(prev_va, next_va, &op->remap);
> +
> +	if (prev_va) {
> +		panthor_vma_link(vm, op_ctx->map.prev_vma, op->remap.unmap->va->vm_bo);

panthor_vma_link() transfers the vm_bo ownership to the vma object, we
need to take a reference if we want to keep vm_bo's refcount balanced.

> +		op_ctx->map.prev_vma = NULL;
> +	}
> +
> +	if (next_va) {
> +		panthor_vma_link(vm, op_ctx->map.next_vma, op->remap.unmap->va->vm_bo);
> +		op_ctx->map.next_vma = NULL;
> +	}
> +
> +	panthor_vma_unlink(vm, unmap_vma);
> +	return 0;
> +}
