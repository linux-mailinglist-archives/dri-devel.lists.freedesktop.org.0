Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852C83BCE2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6861610F1A3;
	Thu, 25 Jan 2024 09:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1E110F1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706173795;
 bh=NHDMTimolpsRG953VM4h8IMbAP81NqnGQx5H5gz6gU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K0ZTZHJe5DZ9eZa4kY8kwa5c00th4E7Z2PjeeRbHuwJy+8xK/N6CC4lfGXky/r0OS
 Ihti4C3jApFsg/nNsItAAgnCZVanT3LBCNg2G1sFAy51jNUrvge1o6Uwk5w6/oiK/z
 x1YmGTJBGb7WpMkpwXmLkQtfGeMHxptiY+aPjYksvCVR5E9zFb9OZd13mHYsvnXwrF
 gXt0zN7eYiCnXuUPVM3ZFmPRITxlhSAaclIA0JKi7W8W3qi6YSYvWwXufIkmmDQdj+
 PUuRzQeWW1/1mxvg7r9NOM34GUFf7XYV2PARmb4wSE72XJpZhIXWU0JMvNviujWGvL
 SOBFRw/I5nb8Q==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A788237813C4;
 Thu, 25 Jan 2024 09:09:54 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:09:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 23/30] drm/shmem-helper: Export
 drm_gem_shmem_get_pages_sgt_locked()
Message-ID: <20240125100953.34340d4f@collabora.com>
In-Reply-To: <20240105184624.508603-24-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-24-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Jan 2024 21:46:17 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Export drm_gem_shmem_get_pages_sgt_locked() that will be used by virtio-gpu
> shrinker during GEM swap-in operation done under the held reservation lock.
> 

Nit: I'd move that patch before "drm/shmem-helper: Add common memory
shrinker", because you'll need to call
drm_gem_shmem_get_pages_locked() and
drm_gem_shmem_get_pages_sgt_locked() if you want to repopulate the MMU
page table after when an eviction happened (see my comment on patch 22).

> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 22 +++++++++++++++++++++-
>  include/drm/drm_gem_shmem_helper.h     |  1 +
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 59cebd1e35af..8fd7851c088b 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -875,12 +875,31 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>  
> -static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
> +/**
> + * drm_gem_shmem_get_pages_sgt_locked - Provide a scatter/gather table of pinned
> + *                                      pages for a shmem GEM object
> + * @shmem: shmem GEM object
> + *
> + * This is a locked version of @drm_gem_shmem_get_sg_table that exports a
> + * scatter/gather table suitable for PRIME usage by calling the standard
> + * DMA mapping API.
> + *
> + * Drivers must hold GEM's reservation lock when using this function.
> + *
> + * Drivers who need to acquire an scatter/gather table for objects need to call
> + * drm_gem_shmem_get_pages_sgt() instead.
> + *
> + * Returns:
> + * A pointer to the scatter/gather table of pinned pages or error pointer on failure.
> + */
> +struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	struct drm_gem_object *obj = &shmem->base;
>  	int ret;
>  	struct sg_table *sgt;
>  
> +	dma_resv_assert_held(shmem->base.resv);
> +
>  	if (shmem->sgt)
>  		return shmem->sgt;
>  
> @@ -904,6 +923,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>  	kfree(sgt);
>  	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_get_pages_sgt_locked);
>  
>  /**
>   * drm_gem_shmem_get_pages_sgt - Pin pages, dma map them, and return a
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index df97c11fc99a..167f00f089de 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -149,6 +149,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
>  
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
> +struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem);
>  
>  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>  			      struct drm_printer *p, unsigned int indent);

