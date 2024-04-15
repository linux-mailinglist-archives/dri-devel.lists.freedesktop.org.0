Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EF8A4D6D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13D911248A;
	Mon, 15 Apr 2024 11:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e5AXg0Ic";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7008811248A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=weNV9644mW14iFid21PfgaT8UQzuuarZM+tbqJ7b8i8=; b=e5AXg0IctLThhaUMxJ4X3GJ7ZQ
 1cO0GQmUWAJOEZpTlvysK3+U7jgtt9pf9ybCmsIqeNHwXyYXqcfUCgoJk4RW0QQCOEjmoasxbjy01
 9toT34PH8oVEka0PNOYkHtINdfYRFeQN0c2GxpCvmUxa5KHQrcADOzhW+oNlXqP+BkFwxUKLozVvJ
 Gx85s9zty1qcvyY+6VYWyrd9HSThMdoGvW0EqIdWp9pfs+hRYp6qpIxmytLQCq65kmZLtNi5/Yu9O
 jpE01s8meYfJKUejkZG4jLHIOx3l3mAKnE62xQEpKKA/OA5p0ZlI7eDpbNoH+c6IsPr/whhLl/4bL
 iKD0qY3g==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwKJc-004jkX-2U; Mon, 15 Apr 2024 13:16:00 +0200
Message-ID: <af6a4dfe-b92a-4685-879f-879c66ec760b@igalia.com>
Date: Mon, 15 Apr 2024 12:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/gem: Create a drm_gem_object_init_with_mnt()
 function
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240405201753.1176914-1-mcanal@igalia.com>
 <20240405201753.1176914-3-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240405201753.1176914-3-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 05/04/2024 19:29, Maíra Canal wrote:
> For some applications, such as applications that uses huge pages, we might
> want to have a different mountpoint, for which we pass mount flags that
> better match our usecase.
> 
> Therefore, create a new function `drm_gem_object_init_with_mnt()` that
> allow us to define the tmpfs mountpoint where the GEM object will be
> created. If this parameter is NULL, then we fallback to `shmem_file_setup()`.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/drm_gem.c | 34 ++++++++++++++++++++++++++++++----
>   include/drm/drm_gem.h     |  3 +++
>   2 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index d4bbc5d109c8..74ebe68e3d61 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -114,22 +114,32 @@ drm_gem_init(struct drm_device *dev)
>   }
> 
>   /**
> - * drm_gem_object_init - initialize an allocated shmem-backed GEM object
> + * drm_gem_object_init_with_mnt - initialize an allocated shmem-backed GEM
> + * object in a given shmfs mountpoint
> + *
>    * @dev: drm_device the object should be initialized for
>    * @obj: drm_gem_object to initialize
>    * @size: object size
> + * @gemfs: tmpfs mount where the GEM object will be created. If NULL, use
> + * the usual tmpfs mountpoint (`shm_mnt`).
>    *
>    * Initialize an already allocated GEM object of the specified size with
>    * shmfs backing store.
>    */
> -int drm_gem_object_init(struct drm_device *dev,
> -			struct drm_gem_object *obj, size_t size)
> +int drm_gem_object_init_with_mnt(struct drm_device *dev,
> +				 struct drm_gem_object *obj, size_t size,
> +				 struct vfsmount *gemfs)
>   {
>   	struct file *filp;
> 
>   	drm_gem_private_object_init(dev, obj, size);
> 
> -	filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
> +	if (gemfs)
> +		filp = shmem_file_setup_with_mnt(gemfs, "drm mm object", size,
> +						 VM_NORESERVE);
> +	else
> +		filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
> +
>   	if (IS_ERR(filp))
>   		return PTR_ERR(filp);
> 
> @@ -137,6 +147,22 @@ int drm_gem_object_init(struct drm_device *dev,
> 
>   	return 0;
>   }
> +EXPORT_SYMBOL(drm_gem_object_init_with_mnt);
> +
> +/**
> + * drm_gem_object_init - initialize an allocated shmem-backed GEM object
> + * @dev: drm_device the object should be initialized for
> + * @obj: drm_gem_object to initialize
> + * @size: object size
> + *
> + * Initialize an already allocated GEM object of the specified size with
> + * shmfs backing store.
> + */
> +int drm_gem_object_init(struct drm_device *dev, struct drm_gem_object *obj,
> +			size_t size)
> +{
> +	return drm_gem_object_init_with_mnt(dev, obj, size, NULL);
> +}
>   EXPORT_SYMBOL(drm_gem_object_init);

I would be tempted to static inline this one but see what other people 
think. (One wise kernel legend was once annoyed by trivial wrappers / 
function calls. But some other are then annoyed by static inlines.. so 
dunno.) For either flavour:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> 
>   /**
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bae4865b2101..2ebf6e10cc44 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -472,6 +472,9 @@ void drm_gem_object_release(struct drm_gem_object *obj);
>   void drm_gem_object_free(struct kref *kref);
>   int drm_gem_object_init(struct drm_device *dev,
>   			struct drm_gem_object *obj, size_t size);
> +int drm_gem_object_init_with_mnt(struct drm_device *dev,
> +				 struct drm_gem_object *obj, size_t size,
> +				 struct vfsmount *gemfs);
>   void drm_gem_private_object_init(struct drm_device *dev,
>   				 struct drm_gem_object *obj, size_t size);
>   void drm_gem_private_object_fini(struct drm_gem_object *obj);
> --
> 2.44.0
> 
> 
