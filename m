Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EBF7E7B93
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B2D10E98C;
	Fri, 10 Nov 2023 11:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145010E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 11:01:28 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A25A66073EB;
 Fri, 10 Nov 2023 11:01:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699614087;
 bh=M7g15Ds3YB0rAZrwMqFqhvf/l8gr3sjjjFteM0C28zs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Hbb8LDTQq4RSYvyQKXhwzEaFY3S/PSmM2XeVj8XNi5/pmEFm+CXppTiuTj7QD4CZx
 8co2y4KUpNxbre2QFzUUcxRA8sCPdl2Z+jxgtbG+80PTAsE9BoMeC5F14w0W1jgmz/
 OV5w1DJ/ocBfKg7xRQQelCeq/r68xhZxMOmsrL02W9qe9LuCWJhmbL6HHGAUD/0Ttf
 gHYguXb0/fxr81PZJhFrPt7GM8DXDF0KWVIHuuXNSLRCIbzrQHP/Aq36d0BSVXWFpV
 IZTIsIKBR0jzOw9XBpgwo9WUTuSuRdYKExb716IYVxzMjqPM6sGpodGY933J8AqFLT
 c9mLE9lfwOacw==
Date: Fri, 10 Nov 2023 12:01:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 17/26] drm/v3d: Explicitly get and put drm-shmem pages
Message-ID: <20231110120123.65f399af@collabora.com>
In-Reply-To: <20231029230205.93277-18-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-18-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Oct 2023 02:01:56 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> To simplify the drm-shmem refcnt handling, we're moving away from
> the implicit get_pages() that is used by get_pages_sgt(). From now on
> drivers will have to pin pages while they use sgt. V3D driver doesn't
> support shrinker, hence pages are pinned and sgt is valid as long as
> pages' use-count > 0.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/v3d/v3d_bo.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 42cd874f6810..0597c6b01b6c 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -47,6 +47,9 @@ void v3d_free_object(struct drm_gem_object *obj)
>  	/* GPU execution may have dirtied any pages in the BO. */
>  	bo->base.pages_mark_dirty_on_put = true;
>  
> +	if (!obj->import_attach)
> +		drm_gem_shmem_put_pages(&bo->base);
> +
>  	drm_gem_shmem_free(&bo->base);
>  }
>  
> @@ -135,12 +138,18 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>  		return ERR_CAST(shmem_obj);
>  	bo = to_v3d_bo(&shmem_obj->base);
>  
> -	ret = v3d_bo_create_finish(&shmem_obj->base);
> +	ret = drm_gem_shmem_get_pages(shmem_obj);
>  	if (ret)
>  		goto free_obj;
>  
> +	ret = v3d_bo_create_finish(&shmem_obj->base);
> +	if (ret)
> +		goto put_pages;
> +
>  	return bo;
>  
> +put_pages:
> +	drm_gem_shmem_put_pages(shmem_obj);
>  free_obj:
>  	drm_gem_shmem_free(shmem_obj);
>  	return ERR_PTR(ret);

