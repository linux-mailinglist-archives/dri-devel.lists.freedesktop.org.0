Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A97C8AEC1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7D10E14A;
	Wed, 26 Nov 2025 16:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 943CE10E14A;
 Wed, 26 Nov 2025 16:20:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF453168F;
 Wed, 26 Nov 2025 08:20:24 -0800 (PST)
Received: from [10.1.30.35] (e122027.cambridge.arm.com [10.1.30.35])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E9763F73B;
 Wed, 26 Nov 2025 08:20:26 -0800 (PST)
Message-ID: <f6a49f02-8871-43e5-90e9-1d47328777ef@arm.com>
Date: Wed, 26 Nov 2025 16:20:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/16] drm/prime: Simplify life of drivers needing
 custom dma_buf_ops
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
 <20251126124455.3656651-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126124455.3656651-2-boris.brezillon@collabora.com>
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
> drm_gem_is_prime_exported_dma_buf() checks the dma_buf->ops against
> drm_gem_prime_dmabuf_ops, which makes it impossible to use if the
> driver implements custom dma_buf_ops. Instead of duplicating a bunch
> of helpers to work around it, let's provide a way for drivers to
> expose their custom dma_buf_ops so the core prime helpers can rely on
> that instead of hardcoding &drm_gem_prime_dmabuf_ops.
> 
> v5:
> - New patch
> 
> v6:
> - Pass custom dma_buf_ops directly instead of through a getter
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/drm_prime.c | 10 ++++++++--
>  include/drm/drm_drv.h       |  8 ++++++++
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 21809a82187b..86fd95f0c105 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -904,6 +904,12 @@ unsigned long drm_prime_get_contiguous_size(struct sg_table *sgt)
>  }
>  EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>  
> +static const struct dma_buf_ops *
> +drm_gem_prime_get_dma_buf_ops(struct drm_device *dev)
> +{
> +	return dev->driver->dma_buf_ops ?: &drm_gem_prime_dmabuf_ops;
> +}
> +
>  /**
>   * drm_gem_prime_export - helper library implementation of the export callback
>   * @obj: GEM object to export
> @@ -920,7 +926,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>  	struct dma_buf_export_info exp_info = {
>  		.exp_name = KBUILD_MODNAME, /* white lie for debug */
>  		.owner = dev->driver->fops->owner,
> -		.ops = &drm_gem_prime_dmabuf_ops,
> +		.ops = drm_gem_prime_get_dma_buf_ops(dev),
>  		.size = obj->size,
>  		.flags = flags,
>  		.priv = obj,
> @@ -947,7 +953,7 @@ bool drm_gem_is_prime_exported_dma_buf(struct drm_device *dev,
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	return (dma_buf->ops == &drm_gem_prime_dmabuf_ops) && (obj->dev == dev);
> +	return dma_buf->ops == drm_gem_prime_get_dma_buf_ops(dev) && obj->dev == dev;
>  }
>  EXPORT_SYMBOL(drm_gem_is_prime_exported_dma_buf);
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 42fc085f986d..1c6dae60d523 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -431,6 +431,14 @@ struct drm_driver {
>  	 * some examples.
>  	 */
>  	const struct file_operations *fops;
> +
> +	/**
> +	 * @dma_buf_ops:
> +	 *
> +	 * dma_buf_ops to use for buffers exported by this driver. When NULL,
> +	 * the drm_prime logic defaults to &drm_gem_prime_dmabuf_ops.
> +	 */
> +	const struct dma_buf_ops *dma_buf_ops;
>  };
>  
>  void *__devm_drm_dev_alloc(struct device *parent,

