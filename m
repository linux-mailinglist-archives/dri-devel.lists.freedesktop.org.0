Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E327920A0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 08:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05010E43B;
	Tue,  5 Sep 2023 06:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41F810E43B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 06:58:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 268F96607186;
 Tue,  5 Sep 2023 07:58:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693897136;
 bh=venc7lpeLicqLmE2B/gZSt0pO4Av75I9gxi7Zr/jLJs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cis7Nqma2ewU7UBvc4iWTwax1TW5dMlpCBMG/ZkWfJYGO4Y2/3TMtcTs37JxBHSL4
 9gH5y7h5sPidOwp0mf1JP5WWEmK4yUANa1aku+3YYESU8UFbh472E/fOXxshynh+UO
 DwBYAE5AUG0/HwPqXDDSIhMSggxMgHFSAB9HZLRLXTquN/Yn4CkOUQfgT3y46VSUbj
 TBD2+zfaTlVTxYn6KJvBjjp7ApWuQzwijoeOCsVm+b9FwtxEYTs/kg6iK9eZBIpfNZ
 1+/Xf2mlsJky8kyugdiPHFId45Y9QJXxw3Ag28WxiDogDlUu/gT156SfjjvHG1Tdqq
 boFE1eKgi0ApQ==
Date: Tue, 5 Sep 2023 08:58:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v16 12/20] drm/shmem-helper: Add and use lockless
 drm_gem_shmem_get_pages()
Message-ID: <20230905085854.18203012@collabora.com>
In-Reply-To: <20230903170736.513347-13-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
 <20230903170736.513347-13-dmitry.osipenko@collabora.com>
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

On Sun,  3 Sep 2023 20:07:28 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Add lockless drm_gem_shmem_get_pages() helper that skips taking reservation
> lock if pages_use_count is non-zero, leveraging from atomicity of the
> refcount_t. Make drm_gem_shmem_mmap() to utilize the new helper.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index a0faef3e762d..d93ebfef20c7 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -227,6 +227,20 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
>  
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
> +{
> +	int ret;
> +
> +	if (refcount_inc_not_zero(&shmem->pages_use_count))
> +		return 0;
> +
> +	dma_resv_lock(shmem->base.resv, NULL);
> +	ret = drm_gem_shmem_get_pages_locked(shmem);
> +	dma_resv_unlock(shmem->base.resv);
> +
> +	return ret;
> +}
> +
>  static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
>  {
>  	int ret;
> @@ -610,10 +624,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  		return ret;
>  	}
>  
> -	dma_resv_lock(shmem->base.resv, NULL);
> -	ret = drm_gem_shmem_get_pages_locked(shmem);
> -	dma_resv_unlock(shmem->base.resv);
> -
> +	ret = drm_gem_shmem_get_pages(shmem);
>  	if (ret)
>  		return ret;
>  

