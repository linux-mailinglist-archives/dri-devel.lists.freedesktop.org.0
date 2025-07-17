Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932ECB08A70
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 12:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8231E10E808;
	Thu, 17 Jul 2025 10:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D602B10E7FA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 10:23:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85EDF1596;
 Thu, 17 Jul 2025 03:23:21 -0700 (PDT)
Received: from [10.1.28.24] (e122027.cambridge.arm.com [10.1.28.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC7903F6A8;
 Thu, 17 Jul 2025 03:23:26 -0700 (PDT)
Message-ID: <97149cf3-b3cb-4b90-a486-7eea5ee41b59@arm.com>
Date: Thu, 17 Jul 2025 11:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Fix leak when free gem object
To: lihongtao <lihongtao@kylinos.cn>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250710030527.167710-1-lihongtao@kylinos.cn>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250710030527.167710-1-lihongtao@kylinos.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2025 04:05, lihongtao wrote:
> obj->mappings.lock should be destroyed when free
> panfrost gem object in panfrost_gem_free_object.

mutex_destroy() doesn't actually release any resources. It is purely a
debugging feature (if CONFIG_DEBUG_MUTEXES is disabled then it is
compiled away completely).

So it's not a "leak" as such. But there is some value in using it as it
would (in debug builds) warn us if we attempt to destroy a locked mutex
or attempt to use a mutex after the destroy.

But if we're going to fix this I think we should be more complete. A
quick grep should we have 6 different mutexes in panfrost:

panfrost_device.c:      mutex_init(&pfdev->sched_lock);
panfrost_device.c:      mutex_init(&pfdev->debugfs.gems_lock);
panfrost_drv.c: mutex_init(&pfdev->shrinker_lock);
panfrost_gem.c: mutex_init(&obj->mappings.lock);
panfrost_gem.c: mutex_init(&obj->label.lock);
panfrost_perfcnt.c:     mutex_init(&perfcnt->lock);

But there's only one existing call to mutex_destroy():

panfrost_gem.c: mutex_destroy(&bo->label.lock);

It would be good to consider if the other mutexes should also be destroyed.

Thanks,
Steve

> 
> Signed-off-by: lihongtao <lihongtao@kylinos.cn>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 963f04ba2de6..00549f482eec 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -49,6 +49,7 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
>  		kvfree(bo->sgts);
>  	}
>  
> +	mutex_destroy(&bo->mappings.lock);
>  	drm_gem_shmem_free(&bo->base);
>  }
>  

