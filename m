Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB81F64C3
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 11:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DEB6E8C5;
	Thu, 11 Jun 2020 09:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C7616E8C5
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 09:31:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1ABF1FB;
 Thu, 11 Jun 2020 02:31:19 -0700 (PDT)
Received: from [192.168.1.84] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A02333F73D;
 Thu, 11 Jun 2020 02:31:18 -0700 (PDT)
Subject: Re: [PATCH v2] drm/panfrost: Use kvfree() to free bo->sgts
To: Denis Efremov <efremov@linux.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200605185207.76661-1-efremov@linux.com>
 <20200608151728.234026-1-efremov@linux.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <9cb39a92-5cdf-38da-98f8-b513dcdf69db@arm.com>
Date: Thu, 11 Jun 2020 10:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608151728.234026-1-efremov@linux.com>
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2020 16:17, Denis Efremov wrote:
> Use kvfree() to free bo->sgts, because the memory is allocated with
> kvmalloc_array() in panfrost_mmu_map_fault_addr().
> 
> Fixes: 187d2929206e ("drm/panfrost: Add support for GPU heap allocations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Efremov <efremov@linux.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> ---
> Change in v2:
>   - kvfree() fixed in panfrost_gem_free_object(), thanks to Steven Price
> 
>   drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>   drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 17b654e1eb94..556181ea4a07 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -46,7 +46,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
>   				sg_free_table(&bo->sgts[i]);
>   			}
>   		}
> -		kfree(bo->sgts);
> +		kvfree(bo->sgts);
>   	}
>   
>   	drm_gem_shmem_free_object(obj);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> index ed28aeba6d59..3c8ae7411c80 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -486,7 +486,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
>   		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
>   				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
>   		if (!pages) {
> -			kfree(bo->sgts);
> +			kvfree(bo->sgts);
>   			bo->sgts = NULL;
>   			mutex_unlock(&bo->base.pages_lock);
>   			ret = -ENOMEM;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
