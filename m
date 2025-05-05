Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271DAA988C
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 18:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C8210E2EE;
	Mon,  5 May 2025 16:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="cAoOxarF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2016210E2EE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 16:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746461832; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hLR9hSdDS7XYPasdP22M3tfHzVPYm8hHTm4cppzXUSJYApbn/LlVUe/TFVgWPeYzEtI+aEbMaieeMoSZ9oyXrxfDRhyWrgS9dTdC6UIib0CO0kHSnXeBhsPJUiiG14MMdaX3L87CIKIx2WLUMJSR/LcPeoc1pCH2GmzUOwruaK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746461832;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nQDlP5BMRrcxIX/cFSVWpYY+/K8QE2DhSbx6zT8dnNQ=; 
 b=H6xodiFz6Wc6NRsiOs+Rc0DBILp2Y06Xr6eE6yPaum6jsnqRafx7jpD2oQ+UV7TWVbsXQ7eTCtnQP5xm8AInX7VPAmbKZ7y4+ovx6X3wtHUIQWR3+hrXA6KVvmHzR86WrWWDwQy23rGpK7vuud2qKFfakxKOlpRL19/ZGCxi0yE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746461832; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nQDlP5BMRrcxIX/cFSVWpYY+/K8QE2DhSbx6zT8dnNQ=;
 b=cAoOxarFluiOLvwTHhvkfrsAm/MhfV5grC6LiBoJjsBLxn6Hures/oTBnP9guq38
 i0qzJY8bIK4Z3DUdj7/rH0Ph6cpDCMZoIgtMtOIi7QEE3Iii1vlFR2UJTj6VUqFFSW/
 MprDPy9CpE5QB75vrgxRcYk+qzRTR1D7ZpVbIsb4=
Received: by mx.zohomail.com with SMTPS id 1746461830838727.9365002723141;
 Mon, 5 May 2025 09:17:10 -0700 (PDT)
Message-ID: <ba724d8e-f2e2-49e7-88ac-4b0ae5b49e4d@collabora.com>
Date: Mon, 5 May 2025 19:17:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Fix NULL pointer deref in
 virtgpu_dma_buf_free_obj()
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
References: <20250501232419.180337-1-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
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

drm_gem_is_imported() checks whether obj->dma_buf is NULL, hence
drm_gem_is_imported() can't be used here too?

-- 
Best regards,
Dmitry
