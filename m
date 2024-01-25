Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686283C882
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 17:47:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604BE10E6A6;
	Thu, 25 Jan 2024 16:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A02110E6A6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 16:47:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E5B71763;
 Thu, 25 Jan 2024 08:48:05 -0800 (PST)
Received: from [10.1.27.41] (e122027.cambridge.arm.com [10.1.27.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454BA3F5A1;
 Thu, 25 Jan 2024 08:47:17 -0800 (PST)
Message-ID: <08fd5c89-9fec-4fc8-b0a3-03e4ab9447d7@arm.com>
Date: Thu, 25 Jan 2024 16:47:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 17/30] drm/panfrost: Fix the error path in
 panfrost_mmu_map_fault_addr()
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-18-dmitry.osipenko@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240105184624.508603-18-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/01/2024 18:46, Dmitry Osipenko wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> If some the pages or sgt allocation failed, we shouldn't release the
> pages ref we got earlier, otherwise we will end up with unbalanced
> get/put_pages() calls. We should instead leave everything in place
> and let the BO release function deal with extra cleanup when the object
> is destroyed, or let the fault handler try again next time it's called.
> 
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index bd5a0073009d..4a0b4bf03f1a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -502,11 +502,18 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	mapping_set_unevictable(mapping);
>  
>  	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
> +		/* Can happen if the last fault only partially filled this
> +		 * section of the pages array before failing. In that case
> +		 * we skip already filled pages.
> +		 */
> +		if (pages[i])
> +			continue;
> +
>  		pages[i] = shmem_read_mapping_page(mapping, i);
>  		if (IS_ERR(pages[i])) {
>  			ret = PTR_ERR(pages[i]);
>  			pages[i] = NULL;
> -			goto err_pages;
> +			goto err_unlock;
>  		}
>  	}
>  
> @@ -514,7 +521,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
>  					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
>  	if (ret)
> -		goto err_pages;
> +		goto err_unlock;
>  
>  	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
>  	if (ret)
> @@ -537,8 +544,6 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>  
>  err_map:
>  	sg_free_table(sgt);
> -err_pages:
> -	drm_gem_shmem_put_pages_locked(&bo->base);
>  err_unlock:
>  	dma_resv_unlock(obj->resv);
>  err_bo:

