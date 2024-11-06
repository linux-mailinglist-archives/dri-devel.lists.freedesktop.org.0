Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BD9BE7D8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 13:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D5510E6C5;
	Wed,  6 Nov 2024 12:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H/7suUUb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECB610E6C5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730895496;
 bh=fEF4yEvMgE9A1k++l4jmSOK0TOueceiJ9ZeW3MGyBpo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H/7suUUbrFg4P89M1+od3wkHr9qLd6zxoTTOBB/rbeoI001BUIkJ0/pfFLWh3snkM
 Ryw+Fiv+inbIfp6Gl2KNWqsl+RiPvKn8oUAMGN2qVfxPkYnZehy4YoALjFwctiL0Tl
 O1GUFoi+GpSR3nm64G4EyTP33FIjz7N+3OAcjWAQMA3y04Q4298qbPlz95TM6/wFv3
 csYU4AJN7X73cV6zyDNQTDn4wxfzOukF7YcMnULe3iylTzcrxXEVC7rguzuo1cjd6W
 5UlmKTAmagu6uyQ/zjjsmobrPq/Q1pJK9X3VAUvx7BIUbQelVoKJyz02SMmtTnsjIL
 rqyuf02cTyiTw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 059E417E1220;
 Wed,  6 Nov 2024 13:18:15 +0100 (CET)
Date: Wed, 6 Nov 2024 13:17:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
Message-ID: <20241106131753.6dbfc6da@collabora.com>
In-Reply-To: <20241106120748.290697-1-liviu.dudau@arm.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
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

On Wed,  6 Nov 2024 12:07:48 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Similar to cac075706f29 ("drm/panthor: Fix race when converting
> group handle to group object") we need to use the XArray's internal
> locking when retrieving a pointer from there for heap and vm.
> 
> Reported-by: Jann Horn <jannh@google.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Missing Fixes tag.

> ---
>  drivers/gpu/drm/panthor/panthor_heap.c | 15 +++++++++++++--
>  drivers/gpu/drm/panthor/panthor_mmu.c  |  2 ++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
> index 3796a9eb22af2..fe0bcb6837f74 100644
> --- a/drivers/gpu/drm/panthor/panthor_heap.c
> +++ b/drivers/gpu/drm/panthor/panthor_heap.c
> @@ -351,6 +351,17 @@ int panthor_heap_create(struct panthor_heap_pool *pool,
>  	return ret;
>  }
>  
> +static struct panthor_heap *panthor_heap_from_id(struct pathor_heap_pool *pool, u32 id)
> +{
> +	struct panthor_heap *heap;
> +
> +	xa_lock(&pool->xa);
> +	heap = xa_load(&pool->xa, id);
> +	xa_unlock(&pool->va);
> +
> +	return heap;
> +}
> +
>  /**
>   * panthor_heap_return_chunk() - Return an unused heap chunk
>   * @pool: The pool this heap belongs to.
> @@ -375,7 +386,7 @@ int panthor_heap_return_chunk(struct panthor_heap_pool *pool,
>  		return -EINVAL;
>  
>  	down_read(&pool->lock);
> -	heap = xa_load(&pool->xa, heap_id);
> +	heap = panthor_heap_from_id(pool, heap_id);
>  	if (!heap) {
>  		ret = -EINVAL;
>  		goto out_unlock;
> @@ -438,7 +449,7 @@ int panthor_heap_grow(struct panthor_heap_pool *pool,
>  		return -EINVAL;
>  
>  	down_read(&pool->lock);
> -	heap = xa_load(&pool->xa, heap_id);
> +	heap = panthor_heap_from_id(pool, heap_id);
>  	if (!heap) {
>  		ret = -EINVAL;
>  		goto out_unlock;
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 8ca85526491e6..8b5cda9d21768 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
>  {
>  	struct panthor_vm *vm;
>  
> +	xa_lock(&pool->xa);
>  	vm = panthor_vm_get(xa_load(&pool->xa, handle));
> +	xa_unlock(&pool->va);
>  
>  	return vm;
>  }

