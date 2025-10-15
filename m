Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22341BDF55E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 17:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A0610E2B9;
	Wed, 15 Oct 2025 15:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDAB210E2B9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:25:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7D91655;
 Wed, 15 Oct 2025 08:25:46 -0700 (PDT)
Received: from [10.1.31.33] (e122027.cambridge.arm.com [10.1.31.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4EB33F738;
 Wed, 15 Oct 2025 08:25:52 -0700 (PDT)
Message-ID: <38617e34-49c9-400f-85a9-10f73d1ec76e@arm.com>
Date: Wed, 15 Oct 2025 16:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/14] drm/prime: Provide default
 ::{begin,end}_cpu_access() implementations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251015130103.3634560-1-boris.brezillon@collabora.com>
 <20251015130103.3634560-4-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251015130103.3634560-4-boris.brezillon@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/10/2025 14:00, Boris Brezillon wrote:
> Hook-up drm_gem_dmabuf_{begin,end}_cpu_access() to drm_gem_sync() so
> that drivers relying on the default prime_dmabuf_ops can still have
> a way to prepare for CPU accesses from outside the UMD.
> 
> v2:
> - New commit
> 
> v3:
> - Don't return an error on NOP syncs, and document that case in a
>   comment
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_prime.c | 42 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_prime.h     |  5 +++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 43a10b4af43a..30d495c70afb 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -823,6 +823,46 @@ int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
>  
> +int drm_gem_dmabuf_begin_cpu_access(struct dma_buf *dma_buf,
> +				    enum dma_data_direction direction)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	enum drm_gem_object_access_flags access = DRM_GEM_OBJECT_CPU_ACCESS;
> +
> +	/* begin_cpu_access(DMA_TO_DEVICE) is a NOP, the sync will happen
> +	 * in the end_cpu_access() path.
> +	 */
> +	if (direction == DMA_FROM_DEVICE)
> +		access |= DRM_GEM_OBJECT_READ_ACCESS;
> +	else if (direction == DMA_BIDIRECTIONAL)
> +		access |= DRM_GEM_OBJECT_RW_ACCESS;
> +	else
> +		return 0;
> +
> +	return drm_gem_sync(obj, 0, obj->size, access);
> +}
> +EXPORT_SYMBOL(drm_gem_dmabuf_begin_cpu_access);
> +
> +int drm_gem_dmabuf_end_cpu_access(struct dma_buf *dma_buf,
> +				  enum dma_data_direction direction)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	enum drm_gem_object_access_flags access = DRM_GEM_OBJECT_DEV_ACCESS;
> +
> +	/* end_cpu_access(DMA_FROM_DEVICE) is a NOP, the sync should have
> +	 * happened in the begin_cpu_access() path already.
> +	 */
> +	if (direction == DMA_TO_DEVICE)
> +		access |= DRM_GEM_OBJECT_READ_ACCESS;
> +	else if (direction == DMA_BIDIRECTIONAL)
> +		access |= DRM_GEM_OBJECT_RW_ACCESS;
> +	else
> +		return 0;
> +
> +	return drm_gem_sync(obj, 0, obj->size, access);
> +}
> +EXPORT_SYMBOL(drm_gem_dmabuf_end_cpu_access);
> +
>  static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>  	.attach = drm_gem_map_attach,
>  	.detach = drm_gem_map_detach,
> @@ -832,6 +872,8 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>  	.mmap = drm_gem_dmabuf_mmap,
>  	.vmap = drm_gem_dmabuf_vmap,
>  	.vunmap = drm_gem_dmabuf_vunmap,
> +	.begin_cpu_access = drm_gem_dmabuf_begin_cpu_access,
> +	.end_cpu_access = drm_gem_dmabuf_end_cpu_access,
>  };
>  
>  /**
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index f50f862f0d8b..052fba039bb6 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -92,6 +92,11 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map);
>  int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
>  
> +int drm_gem_dmabuf_begin_cpu_access(struct dma_buf *dma_buf,
> +				    enum dma_data_direction direction);
> +int drm_gem_dmabuf_end_cpu_access(struct dma_buf *dma_buf,
> +				  enum dma_data_direction direction);
> +
>  struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
>  				       struct page **pages, unsigned int nr_pages);
>  struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,

