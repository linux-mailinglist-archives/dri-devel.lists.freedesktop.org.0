Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FAF83BDD9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 10:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6090D10F87A;
	Thu, 25 Jan 2024 09:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EB110F87B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706176174;
 bh=HQx2vEMacjNLr6cTRRgLHLZqhvtOE96szsA/LVX4JrE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EZ6y5rx1rs5c/H1Mm5/WsPYmq072lDVv3g4/azho/BQI+gfL1X1NdLC661txD6EK9
 NAtmw11ItXkVCKOADazT/9RgJ7CfgKx5LmsP5n4gqoptftm45qdLmJGHka4cMQcx4K
 EfUVcWmj2pfFcuFQy+qN+wGvbmVV1BF/WWhH3cHRkNidNhZXTgnEaEUKmf3LkvQ0Yb
 IfIaWiqixDZxjjIdHqGyvU+FZ7MCGImiwmhw32rXbti9wh2NqyDBvijJ6Gy7Lfssx7
 +g2FY1QtkqRvY1gbSE7+o4XOtXnq8clp3eCs9Gkf0+BeWwtYG4KnAiiRvWbzVxh8PH
 e35ZZEFEDtyHg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A79D6378000B;
 Thu, 25 Jan 2024 09:49:33 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:49:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v19 30/30] drm/panfrost: Switch to generic memory shrinker
Message-ID: <20240125104932.478fa5bd@collabora.com>
In-Reply-To: <20240105184624.508603-31-dmitry.osipenko@collabora.com>
References: <20240105184624.508603-1-dmitry.osipenko@collabora.com>
 <20240105184624.508603-31-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@gmail.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  5 Jan 2024 21:46:24 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -328,6 +328,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
>  	struct sg_table *sgt;
>  	int prot = IOMMU_READ | IOMMU_WRITE;
> +	int ret = 0;
>  
>  	if (WARN_ON(mapping->active))
>  		return 0;
> @@ -335,15 +336,32 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
>  	if (bo->noexec)
>  		prot |= IOMMU_NOEXEC;
>  
> +	if (!obj->import_attach) {
> +		/*
> +		 * Don't allow shrinker to move pages while pages are mapped.
> +		 * It's fine to move pages afterwards because shrinker will
> +		 * take care of unmapping pages during eviction.
> +		 */

That's not exactly what this shmem_pin() is about, is it? I think it's
here to meet the drm_gem_shmem_get_pages_sgt() rule stating that pages
must be pinned while the sgt returned by drm_gem_shmem_get_pages_sgt()
is manipulated. You actually unpin the GEM just after the mmu_map_sg()
call, which means pages could very well be reclaimed while the MMU
still has a mapping referencing those physical pages. And that's fine,
because what's supposed to protect against that is the fence we
register to the GEM resv at job submission time.

> +		ret = drm_gem_shmem_pin(shmem);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	sgt = drm_gem_shmem_get_pages_sgt(shmem);
> -	if (WARN_ON(IS_ERR(sgt)))
> -		return PTR_ERR(sgt);
> +	if (WARN_ON(IS_ERR(sgt))) {
> +		ret = PTR_ERR(sgt);
> +		goto unpin;
> +	}
>  
>  	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
>  		   prot, sgt);
>  	mapping->active = true;
>  
> -	return 0;
> +unpin:
> +	if (!obj->import_attach)
> +		drm_gem_shmem_unpin(shmem);
> +
> +	return ret;
>  }
