Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5F3843937
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84C5113AA0;
	Wed, 31 Jan 2024 08:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EE0113A9C;
 Wed, 31 Jan 2024 08:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706690329;
 bh=2ZBAflDXD3zJXqpjp+crMkG8/SPmbN2N4SU1DhttT0c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JIhxhFEve28QOybjkrgd6475Ry0AThAhxYNPmxNdIA0aF0YKe+vANGHhTCjnzj3Et
 o3SLESKxHEl40PGpvPZnjaMueno8mKiWOL4QDP7wBGhcGRsss407F80oWxm2P7EJn/
 AMs+A5c05xo/q12gwzIVDjsvU/08BwjyMOZjcVnvv7YmBbPW9kPcd82F5yDtC9PJyT
 5Qlc7hgpZYSi+hyR8VhTqQf1zLAnrb7vogRkZA3l/UKNCjYg0RZ9aK2UW/4QaDOSZz
 LfqmxbKFb0ylBAr1fZNv8gYalLBkvSnZ3SN1IzIG2D26R4wy+MJi8FLlK+E1pFgTU7
 KOFb5xI3tDBmg==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E35B937803EE;
 Wed, 31 Jan 2024 08:38:48 +0000 (UTC)
Message-ID: <ee039551-ffb0-4ebe-88d1-5953f347cde0@collabora.com>
Date: Wed, 31 Jan 2024 11:38:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/gem: Fix double resv lock aquire
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20240131011537.31049-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240131011537.31049-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/31/24 04:15, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Since commit 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping
> functions"), the resv lock is already held in the prime vmap path, so
> don't try to grab it again.
> 
> v2: This applies to vunmap path as well
> 
> Fixes: 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping functions")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Nit: the offending commit should be 79e2cf2e7a19 ("drm/gem: Take
reservation lock for vmap/vunmap operations")

> ---
>  drivers/gpu/drm/msm/msm_gem_prime.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index 5f68e31a3e4e..0915f3b68752 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -26,7 +26,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>  {
>  	void *vaddr;
>  
> -	vaddr = msm_gem_get_vaddr(obj);
> +	vaddr = msm_gem_get_vaddr_locked(obj);
>  	if (IS_ERR(vaddr))
>  		return PTR_ERR(vaddr);
>  	iosys_map_set_vaddr(map, vaddr);
> @@ -36,7 +36,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>  
>  void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>  {
> -	msm_gem_put_vaddr(obj);
> +	msm_gem_put_vaddr_locked(obj);
>  }
>  
>  struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,

Looks good otherwise

-- 
Best regards,
Dmitry

