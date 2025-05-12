Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EB7AB365F
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 13:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6F410E381;
	Mon, 12 May 2025 11:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="StbxjW0n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5D10E18F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747050959; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aYEZSgcD+EB9jvjqajMqCQ3d/W9+ijes90sNQ9E1YQTd1nzxjjks2jaev9RuMYvLA1KiNB999hnS09IB7vjBG7M96jNZn59FuKJzWKrLq+Rk+eGPLN4fOtz0iIYp4qh/e8csZPYElmS1Ls0fsSEphAtL7iaQS46vNr3Zty+JEv8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747050959;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=G2DIHD1OXfharWQF7oaKJgz2vzq/9FVu+8f/vyaNvp8=; 
 b=ipRFcwFKx7e0NYCbB418dx3WX++pxWfLr6FWa+sJGRgMkBA+oYcaqFxXzQmqD8eJsDT0eToQT4lBjc7cI2hQvG0htMcI0Sp3UIgTdQ7b1Wlrlg2PwZLbTC9UGblaKG7AG5nO94dY2KfB2KmAb8oTOmB4q+qkKdMmmelTHShXZ78=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747050959; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=G2DIHD1OXfharWQF7oaKJgz2vzq/9FVu+8f/vyaNvp8=;
 b=StbxjW0nZnueLng5Jg7kFtVAWeulq5Eha9JXnwWpHfFQkuPMOuNDOubEfmo7U//t
 PqqphWxa3mhJdtw7Z5ZCDXxzAIsHPxkhsrWF6BRzZvebFX8eKhm8yt1AQ3c9o0VvPFR
 f3+9GsM0mg1ArxWtdRrEfh2PCwNFah2N2mU+lH9c=
Received: by mx.zohomail.com with SMTPS id 1747050955595855.4255135172975;
 Mon, 12 May 2025 04:55:55 -0700 (PDT)
Message-ID: <e1af6469-ec47-4e63-96b2-702e5445796c@collabora.com>
Date: Mon, 12 May 2025 14:55:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Fix NULL pointer deref in
 virtgpu_dma_buf_free_obj()
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
References: <20250501232419.180337-1-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250501232419.180337-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 5/2/25 02:24, Vivek Kasireddy wrote:
> There is a chance that obj->dma_buf would be NULL by the time
> virtgpu_dma_buf_free_obj() is called. This can happen for imported
> prime objects, when drm_gem_object_exported_dma_buf_free() gets
> called on them before drm_gem_object_free(). This is because
> drm_gem_object_exported_dma_buf_free() explicitly sets
> obj->dma_buf to NULL.
> 
> Therefore, fix this issue by storing the dma_buf pointer in the
> virtio_gpu_object instance and using it in virtgpu_dma_buf_free_obj.
> This stored pointer is guaranteed to be valid until the object is
> freed as we took a reference on it in virtgpu_gem_prime_import().
> 
> Fixes: 415cb45895f4 ("drm/virtio: Use dma_buf from GEM object instance")
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index f17660a71a3e..f7def8b42068 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -88,6 +88,7 @@ struct virtio_gpu_object_params {
>  
>  struct virtio_gpu_object {
>  	struct drm_gem_shmem_object base;
> +	struct dma_buf *dma_buf;
>  	struct sg_table *sgt;
>  	uint32_t hw_res_handle;
>  	bool dumb;
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 1118a0250279..722cde5e2d86 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -206,7 +206,7 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
>  	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
>  
>  	if (drm_gem_is_imported(obj)) {
> -		struct dma_buf *dmabuf = obj->dma_buf;
> +		struct dma_buf *dmabuf = bo->dma_buf;
>  
>  		dma_resv_lock(dmabuf->resv, NULL);
>  		virtgpu_dma_buf_unmap(bo);
> @@ -332,6 +332,7 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
>  
>  	obj->import_attach = attach;
>  	get_dma_buf(buf);
> +	bo->dma_buf = buf;
>  
>  	ret = virtgpu_dma_buf_init_obj(dev, bo, attach);
>  	if (ret < 0)

Applied to misc-next, thanks!

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
