Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF4650CED
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 15:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717CC10E2A3;
	Mon, 19 Dec 2022 14:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 97ABA10E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:01:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3640FEC;
 Mon, 19 Dec 2022 06:02:03 -0800 (PST)
Received: from [10.57.88.85] (unknown [10.57.88.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A173F71A;
 Mon, 19 Dec 2022 06:01:20 -0800 (PST)
Message-ID: <e4b64666-9420-ae86-af38-377029d4ef27@arm.com>
Date: Mon, 19 Dec 2022 14:01:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/panfrost: Fix GEM handle creation UAF
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221216233355.542197-1-robdclark@gmail.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20221216233355.542197-1-robdclark@gmail.com>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 open list <linux-kernel@vger.kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/12/2022 23:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Relying on an unreturned handle to hold a reference to an object we
> dereference is not safe.  Userspace can guess the handle and race us
> by closing the handle from another thread.  The _create_with_handle()
> that returns an object ptr is pretty much a pattern to avoid.  And
> ideally creating the handle would be done after any needed dererencing.
> But in this case creation of the mapping is tied to the handle creation.
> Fortunately the mapping is refcnt'd and holds a reference to the object,
> so we can drop the handle's reference once we hold a mapping reference.

Thanks for spotting this, it's a small window but definitely a bug.

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  7 +++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 10 +++++++---
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 2fa5afe21288..aa5848de647c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -98,6 +98,13 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>  		return PTR_ERR(bo);
>  
>  	mapping = panfrost_gem_mapping_get(bo, priv);
> +
> +	/*
> +	 * Now that the mapping holds a reference to the bo until we no longer
> +	 * need it, we can safely drop the handle's reference.
> +	 */
> +	drm_gem_object_put(&bo->base.base);
> +
>  	if (!mapping) {
>  		drm_gem_object_put(&bo->base.base);

This !mapping call to drm_gem_object_put() is suspicious. It doesn't
make any sense and if it can be reached is going to drive the reference
count negative. So I don't think the bug is completely gone.

If user space does the trick of freeing the handle between the call to
panfrost_gem_create_with_handle() and panfrost_gem_mapping_get() then
even with the extra reference we now have the call to
panfrost_gem_mapping_get() will fail and two references are dropped.

I think the whole _create_with_handle() approach was a bad idea and it's
best to simply drop the _with_handle part. I'll post a patch tidying
this up along with removing the drm_gem_object_put() in the !mapping case.

Thanks,

Steve

>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 293e799e2fe8..e3e21c500d24 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -234,6 +234,10 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
>  	return &obj->base.base;
>  }
>  
> +/*
> + * NOTE: if this succeeds, both the handle and the returned object have
> + * an outstanding reference.
> + */
>  struct panfrost_gem_object *
>  panfrost_gem_create_with_handle(struct drm_file *file_priv,
>  				struct drm_device *dev, size_t size,
> @@ -261,10 +265,10 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
>  	 * and handle has the id what user can see.
>  	 */
>  	ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
> -	/* drop reference from allocate - handle holds it now. */
> -	drm_gem_object_put(&shmem->base);
> -	if (ret)
> +	if (ret) {
> +		drm_gem_object_put(&shmem->base);
>  		return ERR_PTR(ret);
> +	}
>  
>  	return bo;
>  }

