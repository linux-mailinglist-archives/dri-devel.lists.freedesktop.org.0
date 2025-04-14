Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EACA87CB9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B491610E528;
	Mon, 14 Apr 2025 10:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="laOD47Zm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5CE10E528
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744624949;
 bh=5IVjsEniU2mkwuPLr2MwBLeHBzN3l2oR/G0NhuIPwWE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=laOD47Zmxk4rjRQHFaWHX4evMwumXe1rJ68+w+YsDulcljL6kePS8kEr4zmN/61LB
 4Dwd4PM1zICi8h7xeWvMWMz3Yoea7m75TVhLOA4LFWw3eyFPK2fcyWNgRHfXJS4JpN
 DqT2csp5mlNBz//xCEAAAcsrSioqrUeRXWeOF1hRflyl8Ew4n0ucshdJWMD98mbHK3
 R+hMBRB0PvX5eNmVv41udTAwK8i7CaQD+KjSk7QbUH+2zavd2CjOrOq8/ncOn+4uqb
 EBVnPl4w/vetx3NEV/4urZ5f41Lv8Vmp26qF6ytLEIUtsrwt5OD0DKAUHSv7RsJBpQ
 TC7wHgo9pxSEA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E652417E0FA7;
 Mon, 14 Apr 2025 12:02:28 +0200 (CEST)
Date: Mon, 14 Apr 2025 12:02:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dmitry.osipenko@collabora.com, airlied@gmail.com, simona@ffwll.ch,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/client: Do not pin in drm_client_buffer_vmap()
Message-ID: <20250414120225.39d43086@collabora.com>
In-Reply-To: <20250404132907.225803-2-tzimmermann@suse.de>
References: <20250404132907.225803-1-tzimmermann@suse.de>
 <20250404132907.225803-2-tzimmermann@suse.de>
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

On Fri,  4 Apr 2025 15:23:31 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Pin and vmap are two distict operations. Do not mix them.
> 
> The helper drm_client_buffer_vmap() maps the pages for fbdev-dma
> and fbdev-shmem. In both cases, the vmap operation ensures that
> the pages are available until the vunmap happens. And as the pages
> in DMA or SHMEM areas cannot be moved, there is no reason to call
> pin. Hence remove the pin call.
> 
> Update drm_client_buffer_vunmap() accordingly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_client.c | 22 +++++-----------------
>  1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index f1de7faf9fb45..154693066a127 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -303,34 +303,23 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
>   * Returns:
>   *	0 on success, or a negative errno code otherwise.
>   */
> -int
> -drm_client_buffer_vmap(struct drm_client_buffer *buffer,
> -		       struct iosys_map *map_copy)
> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
> +			   struct iosys_map *map_copy)
>  {
>  	struct drm_gem_object *gem = buffer->gem;
>  	struct iosys_map *map = &buffer->map;
>  	int ret;
>  
>  	drm_gem_lock(gem);
> -
> -	ret = drm_gem_pin_locked(gem);
> -	if (ret)
> -		goto err_drm_gem_pin_locked;
>  	ret = drm_gem_vmap_locked(gem, map);
> -	if (ret)
> -		goto err_drm_gem_vmap;
> -
>  	drm_gem_unlock(gem);
>  
> +	if (ret)
> +		return ret;
> +
>  	*map_copy = *map;
>  
>  	return 0;
> -
> -err_drm_gem_vmap:
> -	drm_gem_unpin_locked(buffer->gem);
> -err_drm_gem_pin_locked:
> -	drm_gem_unlock(gem);
> -	return ret;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>  
> @@ -349,7 +338,6 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  
>  	drm_gem_lock(gem);
>  	drm_gem_vunmap_locked(gem, map);
> -	drm_gem_unpin_locked(gem);
>  	drm_gem_unlock(gem);
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap);

