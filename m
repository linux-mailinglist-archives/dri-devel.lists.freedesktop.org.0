Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0268B99028
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 10:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A2710E081;
	Wed, 24 Sep 2025 08:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="kQHyoH/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Wed, 24 Sep 2025 08:59:31 UTC
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com
 [91.218.175.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE71510E081
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:59:31 +0000 (UTC)
Message-ID: <32f3c69f-707e-4aa9-b194-fe3ec03b238e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1758703934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYNC1rG2t0+kQP3BUDxKLt1f8D62AXnHOOQELNROhqQ=;
 b=kQHyoH/xlyE5JnXsy1fFqWBnUuXHhW08+TE2uVOpsBnouPSj7apW1bzFZOlt0TIrwGuHQm
 rtI/BRtTxpH5S26xB88ypGI4JaPimWZ/yzZJxkkzEV8NV1/34VU69lLI+iX0o874C8OG0u
 7PFhd8YlpVGj0bIOloCPC7ylKBzecPg=
Date: Wed, 24 Sep 2025 16:52:08 +0800
MIME-Version: 1.0
Subject: Re: drm/lsdc: Use drm_gem_dumb_map_offset() helper
To: 15620332615@163.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhuoheng Li <lizhuoheng@kylinos.cn>
References: <20250812124418.30914-1-15620332615@163.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20250812124418.30914-1-15620332615@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,

On 2025/8/12 20:44, 15620332615@163.com wrote:
> From: Zhuoheng Li <lizhuoheng@kylinos.cn>
>
> Replace the open-coded mmap offset calculation in the LSDC
> driver with the drm_gem_dumb_map_offset() helper. This avoids
> code duplication and ensures consistency with other DRM
> drivers.


OK, thank you.


> No functional changes intended.


There is a *small* functional change though.

The drm_gem_dumb_map_offset() don't allow imported objects
to be mapped. While, our driver could, in theory, import
a dmabuf and create a GTT object base on it. Then, we
could do some software rendering with the CPU.


> Signed-off-by: Zhuoheng Li <lizhuoheng@kylinos.cn>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c |  2 +-
>   drivers/gpu/drm/loongson/lsdc_gem.c | 16 ----------------
>   drivers/gpu/drm/loongson/lsdc_gem.h |  5 -----
>   3 files changed, 1 insertion(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index 12193d2a301a..7638cb6dd9b2 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -44,7 +44,7 @@ static const struct drm_driver lsdc_drm_driver = {
>   
>   	.debugfs_init = lsdc_debugfs_init,
>   	.dumb_create = lsdc_dumb_create,
> -	.dumb_map_offset = lsdc_dumb_map_offset,
> +	.dumb_map_offset = drm_gem_dumb_map_offset,
>   	.gem_prime_import_sg_table = lsdc_prime_import_sg_table,
>   	DRM_FBDEV_TTM_DRIVER_OPS,
>   };
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..107efd240756 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -246,22 +246,6 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
>   	return 0;
>   }
>   
> -int lsdc_dumb_map_offset(struct drm_file *filp, struct drm_device *ddev,
> -			 u32 handle, uint64_t *offset)
> -{
> -	struct drm_gem_object *gobj;
> -
> -	gobj = drm_gem_object_lookup(filp, handle);
> -	if (!gobj)
> -		return -ENOENT;
> -
> -	*offset = drm_vma_node_offset_addr(&gobj->vma_node);
> -
> -	drm_gem_object_put(gobj);
> -
> -	return 0;
> -}
> -
>   void lsdc_gem_init(struct drm_device *ddev)
>   {
>   	struct lsdc_device *ldev = to_lsdc(ddev);
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.h b/drivers/gpu/drm/loongson/lsdc_gem.h
> index 92cbb10e6e13..f79f06874286 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.h
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.h
> @@ -14,11 +14,6 @@ lsdc_prime_import_sg_table(struct drm_device *ddev,
>   			   struct dma_buf_attachment *attach,
>   			   struct sg_table *sg);
>   
> -int lsdc_dumb_map_offset(struct drm_file *file,
> -			 struct drm_device *dev,
> -			 u32 handle,
> -			 uint64_t *offset);
> -
>   int lsdc_dumb_create(struct drm_file *file,
>   		     struct drm_device *ddev,
>   		     struct drm_mode_create_dumb *args);
