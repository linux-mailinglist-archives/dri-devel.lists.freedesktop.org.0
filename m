Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB431C5E263
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 17:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C94810EABF;
	Fri, 14 Nov 2025 16:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9637F10EABF;
 Fri, 14 Nov 2025 16:17:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B06B1063;
 Fri, 14 Nov 2025 08:17:31 -0800 (PST)
Received: from [10.1.39.17] (e122027.cambridge.arm.com [10.1.39.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAAF33F5A1;
 Fri, 14 Nov 2025 08:17:33 -0800 (PST)
Message-ID: <fdaf7208-a096-45ee-b36a-95ce9d534143@arm.com>
Date: Fri, 14 Nov 2025 16:17:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] drm/panfrost: Provide a custom dma_buf
 implementation
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
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-12-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251030140525.366636-12-boris.brezillon@collabora.com>
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

On 30/10/2025 14:05, Boris Brezillon wrote:
> Before we introduce cached CPU mappings, we want a dma_buf
> implementation satisfying synchronization requests around CPU
> accesses coming from a dma_buf exported by our driver. Let's
> provide our own implementation relying on the default
> gem_shmem_prime helpers designed for that purpose.
> 
> v5:
> - New patch
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  1 +
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1c3c574cd64a..e3cdc0c95a56 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -852,6 +852,7 @@ static const struct drm_driver panfrost_drm_driver = {
>  
>  	.gem_create_object	= panfrost_gem_create_object,
>  	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
> +	.gem_prime_get_dma_buf_ops = panfrost_gem_prime_get_dma_buf_ops,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init = panfrost_debugfs_init,
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 0528de674a4f..070ea7108af6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -323,6 +323,25 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
>  	return bo;
>  }
>  
> +static const struct dma_buf_ops panfrost_dma_buf_ops = {
> +	.attach = drm_gem_map_attach,
> +	.detach = drm_gem_map_detach,
> +	.map_dma_buf = drm_gem_shmem_prime_map_dma_buf,
> +	.unmap_dma_buf = drm_gem_shmem_prime_unmap_dma_buf,
> +	.release = drm_gem_dmabuf_release,
> +	.mmap = drm_gem_dmabuf_mmap,
> +	.vmap = drm_gem_dmabuf_vmap,
> +	.vunmap = drm_gem_dmabuf_vunmap,
> +	.begin_cpu_access = drm_gem_shmem_prime_begin_cpu_access,
> +	.end_cpu_access = drm_gem_shmem_prime_end_cpu_access,
> +};
> +
> +const struct dma_buf_ops *
> +panfrost_gem_prime_get_dma_buf_ops(struct drm_device *dev)
> +{
> +	return &panfrost_dma_buf_ops;
> +}
> +
>  struct drm_gem_object *
>  panfrost_gem_prime_import_sg_table(struct drm_device *dev,
>  				   struct dma_buf_attachment *attach,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 8de3e76f2717..c63264464271 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -130,6 +130,8 @@ struct drm_gem_object *
>  panfrost_gem_prime_import_sg_table(struct drm_device *dev,
>  				   struct dma_buf_attachment *attach,
>  				   struct sg_table *sgt);
> +const struct dma_buf_ops *
> +panfrost_gem_prime_get_dma_buf_ops(struct drm_device *dev);
>  
>  struct panfrost_gem_object *
>  panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags);

