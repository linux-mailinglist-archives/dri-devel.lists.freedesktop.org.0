Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACB8A4D8E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 13:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D5B112497;
	Mon, 15 Apr 2024 11:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YRIc0Fd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A60F112497
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JCZnCUrNtWBdhXVxE86ecelsjV79VztaGVj1jnrlxac=; b=YRIc0Fd1IvVankJPOSzGi9PL3n
 Gg/D4mzBrBde1zmvDDP8fLCRRhxGMPlnNe6RlB4xiY2i1ELfxawud5GJXpbG1u7VENdiz7mQYMLyd
 vF72ZAId7jHQkaDjC06CgJ95KJ6f4vUvqAxIEgAjVIxMi5a7btlWBVVsLuf01FnqFepnqqrs+I9C+
 rkrjwU87kKuf9FRXMuIwfXV2qgWNVu/5Zu4v6k9Hk3YSGA2pcJomk+e2LfXLbS6P24xitVmz4BLFX
 IS6vbOQ25+eyrBeQCttD4QtX7/zWEh4/obIvZSFmgrtsc2G5D+cyAbLxxonLuH0Cl3aC3XHpd6BGi
 ahQK7LeQ==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rwKPE-004jsR-ES; Mon, 15 Apr 2024 13:21:48 +0200
Message-ID: <b2f1624f-c9fd-4d4b-8b0e-d6ee1e3402ed@igalia.com>
Date: Mon, 15 Apr 2024 12:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/gem: Create shmem GEM object in a given
 mountpoint
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
 <20240405201753.1176914-5-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240405201753.1176914-5-mcanal@igalia.com>
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
> Create a function `drm_gem_shmem_create_with_mnt()`, similar to
> `drm_gem_shmem_create()`, that has a mountpoint as a argument. This
> function will create a shmem GEM object in a given tmpfs mountpoint.
> 
> This function will be useful for drivers that have a special mountpoint
> with flags enabled.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 30 ++++++++++++++++++++++----
>   include/drm/drm_gem_shmem_helper.h     |  3 +++
>   2 files changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 177773bcdbfd..10b7c4c769a3 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -49,7 +49,8 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
>   };
>   
>   static struct drm_gem_shmem_object *
> -__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
> +__drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private,
> +		       struct vfsmount *gemfs)
>   {
>   	struct drm_gem_shmem_object *shmem;
>   	struct drm_gem_object *obj;
> @@ -76,7 +77,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>   		drm_gem_private_object_init(dev, obj, size);
>   		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
>   	} else {
> -		ret = drm_gem_object_init(dev, obj, size);
> +		ret = drm_gem_object_init_with_mnt(dev, obj, size, gemfs);
>   	}
>   	if (ret) {
>   		drm_gem_private_object_fini(obj);
> @@ -123,10 +124,31 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
>    */
>   struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size)
>   {
> -	return __drm_gem_shmem_create(dev, size, false);
> +	return __drm_gem_shmem_create(dev, size, false, NULL);
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_shmem_create);
>   
> +/**
> + * drm_gem_shmem_create_with_mnt - Allocate an object with the given size in a
> + * given mountpoint
> + * @dev: DRM device
> + * @size: Size of the object to allocate
> + * @gemfs: tmpfs mount where the GEM object will be created
> + *
> + * This function creates a shmem GEM object in a given tmpfs mountpoint.
> + *
> + * Returns:
> + * A struct drm_gem_shmem_object * on success or an ERR_PTR()-encoded negative
> + * error code on failure.
> + */
> +struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
> +							   size_t size,
> +							   struct vfsmount *gemfs)
> +{
> +	return __drm_gem_shmem_create(dev, size, false, gemfs);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_create_with_mnt);
> +
>   /**
>    * drm_gem_shmem_free - Free resources associated with a shmem GEM object
>    * @shmem: shmem GEM object to free
> @@ -760,7 +782,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
>   	size_t size = PAGE_ALIGN(attach->dmabuf->size);
>   	struct drm_gem_shmem_object *shmem;
>   
> -	shmem = __drm_gem_shmem_create(dev, size, true);
> +	shmem = __drm_gem_shmem_create(dev, size, true, NULL);
>   	if (IS_ERR(shmem))
>   		return ERR_CAST(shmem);
>   
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index efbc9f27312b..d22e3fb53631 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -97,6 +97,9 @@ struct drm_gem_shmem_object {
>   	container_of(obj, struct drm_gem_shmem_object, base)
>   
>   struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
> +struct drm_gem_shmem_object *drm_gem_shmem_create_with_mnt(struct drm_device *dev,
> +							   size_t size,
> +							   struct vfsmount *gemfs);
>   void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
>   
>   void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem);

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
