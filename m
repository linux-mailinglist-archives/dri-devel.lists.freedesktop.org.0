Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8EC9C0A0E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 16:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2271710E87D;
	Thu,  7 Nov 2024 15:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 332FA10E27C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 15:26:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 431E7497;
 Thu,  7 Nov 2024 07:26:55 -0800 (PST)
Received: from [10.1.30.33] (e122027.cambridge.arm.com [10.1.30.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 988043F66E;
 Thu,  7 Nov 2024 07:26:23 -0800 (PST)
Message-ID: <695172f7-4ccb-488a-b49f-605caae99cc2@arm.com>
Date: Thu, 7 Nov 2024 15:26:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Lock XArray when getting entries for the
 VM
To: Liviu Dudau <liviu.dudau@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
References: <20241106185806.389089-1-liviu.dudau@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241106185806.389089-1-liviu.dudau@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 06/11/2024 18:58, Liviu Dudau wrote:
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
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>

Pushed to drm-misc-fixes.

Thanks,
Steve

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

