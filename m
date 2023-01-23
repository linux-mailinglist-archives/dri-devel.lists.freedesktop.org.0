Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E16677E13
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 15:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B910E4AD;
	Mon, 23 Jan 2023 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C0D010E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:31:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1A8CC14;
 Mon, 23 Jan 2023 06:32:36 -0800 (PST)
Received: from [10.57.89.57] (unknown [10.57.89.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 342F83F64C;
 Mon, 23 Jan 2023 06:31:54 -0800 (PST)
Message-ID: <2464d2c2-6398-434b-aa9c-301ad6308e06@arm.com>
Date: Mon, 23 Jan 2023 14:31:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm/shmem: Cleanup drm_gem_shmem_create_with_handle()
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230119224452.2880652-1-robdclark@gmail.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230119224452.2880652-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 22:44, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Once we create the handle, the handle owns the reference.  Currently
> nothing was doing anything with the shmem ptr after the handle was
> created, but let's change drm_gem_shmem_create_with_handle() to not
> return the pointer, so-as to not encourage problematic use of this
> function in the future.  As a bonus, it makes the code a bit cleaner.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Nice cleanup, one comment below:

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index f21f47737817..fa6281e43954 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -415,7 +415,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
>  }
>  EXPORT_SYMBOL(drm_gem_shmem_vunmap);
>  
> -static struct drm_gem_shmem_object *
> +static int
>  drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>  				 struct drm_device *dev, size_t size,
>  				 uint32_t *handle)
> @@ -425,7 +425,7 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>  
>  	shmem = drm_gem_shmem_create(dev, size);
>  	if (IS_ERR(shmem))
> -		return shmem;
> +		return PTR_ERR(shmem);
>  
>  	/*
>  	 * Allocate an id of idr table where the obj is registered
> @@ -434,10 +434,8 @@ drm_gem_shmem_create_with_handle(struct drm_file *file_priv,
>  	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
>  	/* drop reference from allocate - handle holds it now. */
>  	drm_gem_object_put(&shmem->base);
> -	if (ret)
> -		return ERR_PTR(ret);
>  
> -	return shmem;
> +	return ret;
>  }
>  
>  /* Update madvise status, returns true if not purged, else
> @@ -533,9 +531,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			args->size = PAGE_ALIGN(args->pitch * args->height);
>  	}
>  
> -	shmem = drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);

shmem is now unused in this function so the definition needs removing too.

Steve

> -
> -	return PTR_ERR_OR_ZERO(shmem);
> +	return drm_gem_shmem_create_with_handle(file, dev, args->size, &args->handle);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
>  

