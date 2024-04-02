Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A10895704
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2E010ED1A;
	Tue,  2 Apr 2024 14:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WEP49vse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B5810F1C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712068720;
 bh=sHj/53++2/xX04Sgn2wr5OxJN+WvB3bojyOITCVAkvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WEP49vsezuEq0PQjLFDglFO2Nrg5WDa5A+aKrWa/74sAWrSp2gG6dKwsg5uZ6OrmW
 wVFaiAYJN961/Db/Fczh7wM6u2dbOqy6Uxuuvs+xuiFJRJH5MlHQ2u6zFpw28+gCkO
 fM5PI323MgKDzmsJJUa8IOlNdozz6hiA6hYGbHg+DtQUyU4A/hhbkg/B2yb12eYaK3
 qrOA9sdpIHeOvcKjBuNrvNzrQunJ7bM57xRYi5FhF5wISyeNEFHU6zJsb2AR+06gr6
 gll6kUX8VRYI/nMu0etcW75cf373Cs8ilPv8LvmSJ2Ibon/NKAxTxZqWQTZNnzjmzu
 /GHsxdBtMtvIg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 812D13780624;
 Tue,  2 Apr 2024 14:38:39 +0000 (UTC)
Date: Tue, 2 Apr 2024 16:38:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
Subject: Re: [PATCH v3] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
Message-ID: <20240402163838.34003a10@collabora.com>
In-Reply-To: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
References: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Tue,  2 Apr 2024 07:14:11 -0700
Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:

> Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
> NULL(when create is false and if there is no poool attached to the

                                               ^ pool

> VM)
> 	- Change the function to return error pointers, when pool is
> 	  NULL return -ENOENT
> 	- Also handle the callers to check for IS_ERR() on failure.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")

I would explain that the code was correct, but the documentation didn't
match the function behavior, otherwise it feels a bit weird to have a
Fixes tag here.

> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is spotted by smatch and the patch is only compile tested
> 
> v1->v2: Fix the function panthor_vm_get_heap_pool() to only return error
> pointers and handle the caller sites [Suggested by Boris Brezillon]
>         - Also merge these IS_ERR() vs NULL bugs into same patch
> 
> v2->v3: pull out error checking for devm_drm_dev_alloc() failure.
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 4 ++--
>  drivers/gpu/drm/panthor/panthor_mmu.c   | 2 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 11b3ccd58f85..050b905b0453 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1090,8 +1090,8 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
>  		return -EINVAL;
>  
>  	pool = panthor_vm_get_heap_pool(vm, false);
> -	if (!pool) {
> -		ret = -EINVAL;
> +	if (IS_ERR(pool)) {
> +		ret = PTR_ERR(pool);
>  		goto out_put_vm;
>  	}
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index fdd35249169f..e1285cdb09ff 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1893,6 +1893,8 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>  			vm->heaps.pool = panthor_heap_pool_get(pool);
>  	} else {
>  		pool = panthor_heap_pool_get(vm->heaps.pool);
> +		if (!pool)
> +			pool = ERR_PTR(-ENOENT);
>  	}
>  	mutex_unlock(&vm->heaps.lock);
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5f7803b6fc48..617df2b980d0 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1343,7 +1343,7 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
>  	if (unlikely(csg_id < 0))
>  		return 0;
>  
> -	if (!heaps || frag_end > vt_end || vt_end >= vt_start) {
> +	if (IS_ERR(heaps) || frag_end > vt_end || vt_end >= vt_start) {
>  		ret = -EINVAL;
>  	} else {
>  		/* We do the allocation without holding the scheduler lock to avoid

