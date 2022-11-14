Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B5B627F92
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 14:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9B310E0A0;
	Mon, 14 Nov 2022 13:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD15910E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 13:00:24 +0000 (UTC)
Received: from [192.168.2.143] (109-252-117-140.nat.spd-mgts.ru
 [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B13D36601817;
 Mon, 14 Nov 2022 13:00:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1668430823;
 bh=I7Rpp4vjv2bTlnUA9D9XQHB0GDaagjm7RngqTua3rzg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=igy5/gKa0meQyDSAnpXboPvHhDqBpu3sZRKp7BSN63XidUujuFhe/QkCkj9ksZrZl
 1wrpJtwHWvo1AMCr/pRckEbsGNXc/0a5FP7uyBXXvQdxC70iHfM1ry/4TZpmZV5GkB
 vd411yki9WjopoPKbZHSmrIXy6BpkNk09dNRytfwL7ftYwwC8pb7oMg5SMm0w+1GJg
 aVu4/l7GIxMzwknBylROzQprq5edkl5QeIycQDk4BhoPcBaHScVchEAU8bFtOZWx4d
 kp6GNPyUprE9FWX1UWlchYvSlP3wXVWanhNfgjPUw4FaZBc/Qknb6jIZYxNj9lOGcK
 odD971GP7Mj0w==
Message-ID: <36fff1bc-1c72-b254-9d7f-4b344cc711d3@collabora.com>
Date: Mon, 14 Nov 2022 16:00:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1] drm/gem-vram: Fix deadlock in drm_gem_vram_vmap()
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Vyukov <dvyukov@google.com>
References: <20221113233850.427704-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20221113233850.427704-1-dmitry.osipenko@collabora.com>
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

On 11/14/22 02:38, Dmitry Osipenko wrote:
> Recently DRM framebuffer core and all drivers were moved to unlocked
> vmapping functions that take the reservation lock. The drm_gem_vram_vmap()
> was missed out by accident and now deadlocks drivers that use drm_gem_vram
> helpers when framebuffer is updated, like Bochs driver. Remove the locking
> from drm_gem_vram_v[un]map() functions to fix the deadlock.
> 
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 125160b534be..b6c7e3803bb3 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -433,25 +433,19 @@ int drm_gem_vram_vmap(struct drm_gem_vram_object *gbo, struct iosys_map *map)
>  {
>  	int ret;
>  
> -	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> +	dma_resv_assert_held(gbo->bo.base.resv);
>  
>  	ret = drm_gem_vram_pin_locked(gbo, 0);
>  	if (ret)
> -		goto err_ttm_bo_unreserve;
> +		return ret;
>  	ret = drm_gem_vram_kmap_locked(gbo, map);
>  	if (ret)
>  		goto err_drm_gem_vram_unpin_locked;
>  
> -	ttm_bo_unreserve(&gbo->bo);
> -
>  	return 0;
>  
>  err_drm_gem_vram_unpin_locked:
>  	drm_gem_vram_unpin_locked(gbo);
> -err_ttm_bo_unreserve:
> -	ttm_bo_unreserve(&gbo->bo);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_vmap);
> @@ -467,16 +461,10 @@ EXPORT_SYMBOL(drm_gem_vram_vmap);
>  void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
>  			 struct iosys_map *map)
>  {
> -	int ret;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
> -	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
> -		return;
> +	dma_resv_assert_held(gbo->bo.base.resv);
>  
>  	drm_gem_vram_kunmap_locked(gbo, map);
>  	drm_gem_vram_unpin_locked(gbo);
> -
> -	ttm_bo_unreserve(&gbo->bo);
>  }
>  EXPORT_SYMBOL(drm_gem_vram_vunmap);
>  

Applied to drm-misc-next

-- 
Best regards,
Dmitry

