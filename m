Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD065C8AF17
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5253410E686;
	Wed, 26 Nov 2025 16:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6A8610E67F;
 Wed, 26 Nov 2025 16:23:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6A8168F;
 Wed, 26 Nov 2025 08:23:40 -0800 (PST)
Received: from [10.1.30.35] (e122027.cambridge.arm.com [10.1.30.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7665C3F73B;
 Wed, 26 Nov 2025 08:23:43 -0800 (PST)
Message-ID: <c08a1e37-5644-4291-afac-4420c949bef7@arm.com>
Date: Wed, 26 Nov 2025 16:23:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/16] drm/shmem: Provide a generic
 {begin,end}_cpu_access() implementation
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
 <20251126124455.3656651-3-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126124455.3656651-3-boris.brezillon@collabora.com>
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

On 26/11/2025 12:44, Boris Brezillon wrote:
> The default implementation simply takes care of invalidating/flushing
> caches around CPU accesses. It takes care of both the exporter and
> the importers, which forces us to overload the default
> ::[un]map_dma_buf() implementation provided by drm_gem.c to store the
> sgt.
> 
> v5:
> - New patch
> 
> v6:
> - Fix doc
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

One issue in the kerneldoc below, but with that fixed:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 114 +++++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h     |  10 +++
>  2 files changed, 124 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index dc94a27710e5..c91608d9d4d7 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -893,6 +893,120 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_no_map);
>  
> +/**
> + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
> + * @attach: attachment
> + * @sgt: SG table to unmap
> + * @dir: type of access done by this attachment

NIT: Above you need to do s/unmap/map/ three times ;)

Thanks,
Steve

> + *
> + * Default implementation for dma_buf_ops::map_dma_buf(). This is just a wrapper
> + * around drm_gem_map_dma_buf() that lets us set the dma_buf_attachment::priv
> + * to the sgt so that drm_gem_shmem_prime_{begin,end}_cpu_access() can sync
> + * around CPU accesses.
> + */
> +struct sg_table *
> +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> +				enum dma_data_direction dir)
> +{
> +	struct sg_table *sgt = drm_gem_map_dma_buf(attach, dir);
> +
> +	if (!IS_ERR(sgt))
> +		attach->priv = sgt;
> +
> +	return sgt;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_map_dma_buf);
> +
> +/**
> + * drm_gem_shmem_prime_unmap_dma_buf - Default unmap_dma_buf() for exported buffers
> + * @attach: attachment
> + * @sgt: SG table to unmap
> + * @dir: type of access done by this attachment
> + *
> + * Default implementation for dma_buf_ops::unmap_dma_buf(). This is just a wrapper
> + * around drm_gem_unmap_dma_buf() that lets us reset the dma_buf_attachment::priv
> + * field so that drm_gem_shmem_prime_{begin,end}_cpu_access() don't consider it
> + * as a mapped attachment to sync against.
> + */
> +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
> +				       struct sg_table *sgt,
> +				       enum dma_data_direction dir)
> +{
> +	attach->priv = NULL;
> +	drm_gem_unmap_dma_buf(attach, sgt, dir);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_unmap_dma_buf);
> +
> +/**
> + * drm_gem_shmem_prime_begin_cpu_access - Default begin_cpu_access() for exported buffers
> + * @dma_buf: The exported DMA buffer this acts on
> + * @dir: direction of the access
> + *
> + * Default implementation for dma_buf_ops::begin_cpu_access(). This only takes care of
> + * cache maintenance.
> + */
> +int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
> +					 enum dma_data_direction dir)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct drm_device *dev = obj->dev;
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	struct dma_buf_attachment *attach;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	if (shmem->sgt)
> +		dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
> +
> +	if (shmem->vaddr)
> +		invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.size);
> +
> +	list_for_each_entry(attach, &dma_buf->attachments, node) {
> +		struct sg_table *sgt = attach->priv;
> +
> +		if (sgt)
> +			dma_sync_sgtable_for_cpu(attach->dev, sgt, dir);
> +	}
> +	dma_resv_unlock(obj->resv);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_begin_cpu_access);
> +
> +/**
> + * drm_gem_shmem_prime_end_cpu_access - Default end_cpu_access() for exported buffers
> + * @dma_buf: The exported DMA buffer this acts on
> + * @dir: direction of the access
> + *
> + * Default implementation for dma_buf_ops::end_cpu_access(). This only takes care of
> + * cache maintenance.
> + */
> +int drm_gem_shmem_prime_end_cpu_access(struct dma_buf *dma_buf,
> +				       enum dma_data_direction dir)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct drm_device *dev = obj->dev;
> +	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
> +	struct dma_buf_attachment *attach;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	list_for_each_entry(attach, &dma_buf->attachments, node) {
> +		struct sg_table *sgt = attach->priv;
> +
> +		if (sgt)
> +			dma_sync_sgtable_for_device(attach->dev, sgt, dir);
> +	}
> +
> +	if (shmem->vaddr)
> +		flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
> +
> +	if (shmem->sgt)
> +		dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
> +
> +	dma_resv_unlock(obj->resv);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_end_cpu_access);
> +
>  MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 589f7bfe7506..075275d6b2fd 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -291,6 +291,16 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
>  			      struct drm_mode_create_dumb *args);
>  struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
>  							 struct dma_buf *buf);
> +struct sg_table *
> +drm_gem_shmem_prime_map_dma_buf(struct dma_buf_attachment *attach,
> +				enum dma_data_direction dir);
> +void drm_gem_shmem_prime_unmap_dma_buf(struct dma_buf_attachment *attach,
> +				       struct sg_table *sgt,
> +				       enum dma_data_direction dir);
> +int drm_gem_shmem_prime_begin_cpu_access(struct dma_buf *dma_buf,
> +					 enum dma_data_direction dir);
> +int drm_gem_shmem_prime_end_cpu_access(struct dma_buf *dma_buf,
> +				       enum dma_data_direction dir);
>  
>  /**
>   * DRM_GEM_SHMEM_DRIVER_OPS - Default shmem GEM operations

