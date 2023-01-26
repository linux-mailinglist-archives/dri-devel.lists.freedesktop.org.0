Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E367CAF6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 13:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57010E66D;
	Thu, 26 Jan 2023 12:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F39910E66D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 12:36:18 +0000 (UTC)
Received: from [192.168.2.197] (109-252-117-89.nat.spd-mgts.ru
 [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9434A6602E6E;
 Thu, 26 Jan 2023 12:36:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674736577;
 bh=G23dxVomulEtMefdUSUB7DiwKvHMsAQAGCle357P/iE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=k2FKZbSOFNRYAUSUeJcX3usY4lqrL/0I9Ul1x7jvOBbzkiehYHd5BUtRMAyNS0+Bz
 kCVqgl38xb7R2LQiLvXXkkQu81Cul3Wg7UW7+weJnQD03TNI/6geF/6770kqB9oM2t
 5oUsEtaF9nIqPvPfyAuCfP65IeEYZZ77VYID7Q/9OtLc/tLMCjVcI/xr0iSXx7SefI
 awTegMoW7EHyvdkPPpP4/37nz/emqZgxMZUgLHFPb6vNbPND4YlnYHgkEI4OQkDjjW
 FG5N4odQV1V0nrl2dg6qbkrV9n34ftZe0zRVpkjer273+BgxIvAReMCzg1UT/OMC28
 NCHaZhV7+JqVg==
Message-ID: <98abc458-579b-1461-aece-7e13132c588a@collabora.com>
Date: Thu, 26 Jan 2023 15:36:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1] drm/shmem-helper: Remove another errant put in error
 path
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230108211311.3950107-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108211311.3950107-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/23 00:13, Dmitry Osipenko wrote:
> drm_gem_shmem_mmap() doesn't own reference in error code path, resulting
> in the dma-buf shmem GEM object getting prematurely freed leading to a
> later use-after-free.
> 
> Fixes: f49a51bfdc8e ("drm/shme-helpers: Fix dma_buf_mmap forwarding bug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index f21f47737817..8b20b41497e8 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -624,11 +624,14 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  	int ret;
>  
>  	if (obj->import_attach) {
> -		/* Drop the reference drm_gem_mmap_obj() acquired.*/
> -		drm_gem_object_put(obj);
>  		vma->vm_private_data = NULL;
> +		ret = dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +		/* Drop the reference drm_gem_mmap_obj() acquired.*/
> +		if (!ret)
> +			drm_gem_object_put(obj);
>  
> -		return dma_buf_mmap(obj->dma_buf, vma, 0);
> +		return ret;
>  	}
>  
>  	ret = drm_gem_shmem_get_pages(shmem);

Rob, is this change still looking good to you? r-b? Thanks!

-- 
Best regards,
Dmitry

