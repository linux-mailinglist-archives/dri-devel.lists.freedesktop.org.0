Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C38937905
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 16:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA010EC37;
	Fri, 19 Jul 2024 14:15:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D0B410EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 14:15:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 480061042;
 Fri, 19 Jul 2024 07:15:25 -0700 (PDT)
Received: from [10.1.38.23] (e122027.cambridge.arm.com [10.1.38.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B5EE3F73F;
 Fri, 19 Jul 2024 07:14:57 -0700 (PDT)
Message-ID: <41847d59-c81c-4d73-9ed4-c3b8ae62eb67@arm.com>
Date: Fri, 19 Jul 2024 15:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/panthor: enable fdinfo for memory stats
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
 <20240716201302.2939894-4-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240716201302.2939894-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 16/07/2024 21:11, Adrián Larumbe wrote:
> Implement drm object's status callback.
> 
> Also, we consider a PRIME imported BO to be resident if its matching
> dma_buf has an open attachment, which means its backing storage had already
> been allocated.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index 38f560864879..c60b599665d8 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -145,6 +145,17 @@ panthor_gem_prime_export(struct drm_gem_object *obj, int flags)
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
> @@ -154,6 +165,7 @@ static const struct drm_gem_object_funcs panthor_gem_funcs = {
>  	.vmap = drm_gem_shmem_object_vmap,
>  	.vunmap = drm_gem_shmem_object_vunmap,
>  	.mmap = panthor_gem_mmap,
> +	.status = panthor_gem_status,
>  	.export = panthor_gem_prime_export,
>  	.vm_ops = &drm_gem_shmem_vm_ops,
>  };

