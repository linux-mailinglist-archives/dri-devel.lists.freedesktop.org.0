Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D68B1113
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A42113CD7;
	Wed, 24 Apr 2024 17:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 545EE113CD6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 17:34:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F338B1063
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 10:35:09 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00E653F7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 10:34:41 -0700 (PDT)
Date: Wed, 24 Apr 2024 18:34:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/panthor: Enable fdinfo for memory stats
Message-ID: <ZilCqPlJiTLfNQcG@e110455-lin.cambridge.arm.com>
References: <20240423213240.91412-1-adrian.larumbe@collabora.com>
 <20240423213240.91412-4-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423213240.91412-4-adrian.larumbe@collabora.com>
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

Hello,

On Tue, Apr 23, 2024 at 10:32:36PM +0100, Adrián Larumbe wrote:
> When vm-binding an already-created BO, the entirety of its virtual size is
> then backed by system memory, so its RSS is always the same as its virtual
> size.

How is that relevant to this patch? Or to put it differently: how are your
words describing your code change here?

> 
> Also, we consider a PRIME imported BO to be resident if its matching
> dma_buf has an open attachment, which means its backing storage had already
> been allocated.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index d6483266d0c2..386c0dfeeb5f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -143,6 +143,17 @@ panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
>  	return drm_gem_prime_export(obj, flags);
>  }
>  
> +static enum drm_gem_object_status panthor_gem_status(struct drm_gem_object *obj)
> +{
> +	struct panthor_gem_object *bo = to_panthor_bo(obj);
> +	enum drm_gem_object_status res = 0;
> +
> +	if (bo->base.base.import_attach || bo->base.pages)
> +		res |= DRM_GEM_OBJECT_RESIDENT;
> +
> +	return res;
> +}
> +
>  static const struct drm_gem_object_funcs panthor_gem_funcs = {
>  	.free = panthor_gem_free_object,
>  	.print_info = drm_gem_shmem_object_print_info,
> @@ -152,6 +163,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = panthor_gem_mmap,
> +	.status = panthor_gem_status,
>  	.export = panthor_gem_prime_export,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
>  };
> -- 
> 2.44.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
