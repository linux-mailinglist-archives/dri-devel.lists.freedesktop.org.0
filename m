Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1BA8B083
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 08:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3196810E838;
	Wed, 16 Apr 2025 06:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Q5t3UaES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECBB10E838
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 06:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744785632; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eTmXj77VL8/6yJFN1+igkgQ3sPq2W2Tmbj68wO8ykoK2L0nx+xZPdMQWOmIw710urIf1I/zxGQv5HIrpWF+c1rqwTfm7/o7Zbrb9CWUa/J3FuA8dkV9FUk02YdtcJcjX0iyPyKS0DwrOtTPbldIq/IY93UWlOjx7KRuoBrqwsLg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744785632;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=uffOwbW3LdAp26GtV2I4IhwpSE1us9PuCoxMk1couMw=; 
 b=nyklYvpJ9mpz07gSxfU5835vL29AHjy53iQD3aFWFgffeGVheUItqrhrUbEvTNUgENhAxkzAp2m3K5sZC2DiObrgDSnmaxFufUbw4Ul4AiNGtLJP+pAZbF0PUnLDQgkjv6SonMZZKRPHq4ODhYkCu8grCYxJ8MPKN1s5JKeu/KQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744785632; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=uffOwbW3LdAp26GtV2I4IhwpSE1us9PuCoxMk1couMw=;
 b=Q5t3UaESd3qcGE4lwHsQMFxn2bfXUuoWD/bhC6KreVEyy2n2Aof0GVf8H2tPdJKn
 xkOm8s9BWCdvoTEyvTSIMkOfEC9g6LHxVsKxY7ET1rv7Wl2fd6pxDrHD6h0lz55oKLr
 LbZApORwtXUqrwDwh6zj5wmUA+ocUnq7gvq+wxZc=
Received: by mx.zohomail.com with SMTPS id 1744785630740791.2279724986317;
 Tue, 15 Apr 2025 23:40:30 -0700 (PDT)
Message-ID: <1589ec2d-1e25-4be8-a715-afa5704f61fb@collabora.com>
Date: Wed, 16 Apr 2025 09:40:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/virtio: Use dma_buf from GEM object instance
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
References: <20250414131507.566072-1-tzimmermann@suse.de>
 <20250414131507.566072-3-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250414131507.566072-3-tzimmermann@suse.de>
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

On 4/14/25 16:12, Thomas Zimmermann wrote:
> Avoid dereferencing struct drm_gem_object.import_attach for the
> imported dma-buf. The dma_buf field in the GEM object instance refers
> to the same buffer. Prepares to make import_attach optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index ce49282198cb..1118a0250279 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -204,16 +204,15 @@ static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
>  {
>  	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
>  	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
> -	struct dma_buf_attachment *attach = obj->import_attach;
>  
>  	if (drm_gem_is_imported(obj)) {
> -		struct dma_buf *dmabuf = attach->dmabuf;
> +		struct dma_buf *dmabuf = obj->dma_buf;
>  
>  		dma_resv_lock(dmabuf->resv, NULL);
>  		virtgpu_dma_buf_unmap(bo);
>  		dma_resv_unlock(dmabuf->resv);
>  
> -		dma_buf_detach(dmabuf, attach);
> +		dma_buf_detach(dmabuf, obj->import_attach);
>  		dma_buf_put(dmabuf);
>  	}
>  

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
