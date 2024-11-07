Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB579BFF76
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 08:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD5810E7B2;
	Thu,  7 Nov 2024 07:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HybzMa06";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9F910E7B2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1730966367;
 bh=aI1Gn3wfvYIU7Ie1yMvVPfIc5l4MzgNxCYAI6UHRYME=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HybzMa06wlpVsA/FuzUXrFhnpDNIzaj2Kup3/lRz+TlU+E3mzf7VohaNn87AqzVHZ
 b4BmZ4yk6pXk7sbeIvlNNHzii17UTH5pxjfnirK3+tS4bFNzUK40vEBbuMbGjc3zCj
 C952MVVR0P0c8ROS+jNWMjTp+aMmVFBhCaEB9pqY++3pjUCyVjSDSIVnGut0b+n2wZ
 /wIEtpo2Dd1KgUeBwoK3i0Tx8dHIjdEt6/D2jXbJkLwAjSKRiyNq3wpHQfP5fPopGv
 dY/h7/6mKK51KOvZ64hgAiQ9aqM1McWUtIRY1oMvHXQiZ/Kz6G8eWxL00N9BUJz89I
 Uf3HznadwIzpw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A27D17E121E;
 Thu,  7 Nov 2024 08:59:27 +0100 (CET)
Date: Thu, 7 Nov 2024 08:59:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2] drm/panthor: Lock XArray when getting entries for
 the VM
Message-ID: <20241107085923.06707a10@collabora.com>
In-Reply-To: <20241106185806.389089-1-liviu.dudau@arm.com>
References: <20241106185806.389089-1-liviu.dudau@arm.com>
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

On Wed,  6 Nov 2024 18:58:06 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> Similar to cac075706f29 ("drm/panthor: Fix race when converting
> group handle to group object") we need to use the XArray's internal
> locking when retrieving a vm pointer from there.
> 
> v2: Removed part of the patch that was trying to protect fetching
> the heap pointer from XArray, as that operation is protected by
> the @pool->lock.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Reported-by: Jann Horn <jannh@google.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 8ca85526491e6..46b84a557d9cc 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1580,7 +1580,9 @@ panthor_vm_pool_get_vm(struct panthor_vm_pool *pool, u32 handle)
>  {
>  	struct panthor_vm *vm;
>  
> +	xa_lock(&pool->xa);
>  	vm = panthor_vm_get(xa_load(&pool->xa, handle));
> +	xa_unlock(&pool->xa);
>  
>  	return vm;
>  }

