Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1115636512
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0746E10E5A1;
	Wed, 23 Nov 2022 15:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78C4F10E5A1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:58:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D6161FB;
 Wed, 23 Nov 2022 07:58:27 -0800 (PST)
Received: from [10.57.87.10] (unknown [10.57.87.10])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 262FE3F73B;
 Wed, 23 Nov 2022 07:58:16 -0800 (PST)
Message-ID: <f390d9ec-e8b2-a10d-bd2e-011ec879c615@arm.com>
Date: Wed, 23 Nov 2022 15:58:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v9 03/11] drm/gem: Add evict() callback to
 drm_gem_object_funcs
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221123025723.695075-1-dmitry.osipenko@collabora.com>
 <20221123025723.695075-4-dmitry.osipenko@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20221123025723.695075-4-dmitry.osipenko@collabora.com>
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

On 23/11/2022 02:57, Dmitry Osipenko wrote:
> Add new common evict() callback to drm_gem_object_funcs and corresponding
> drm_gem_object_evict() helper. This is a first step on a way to providing
> common GEM-shrinker API for DRM drivers.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 15 +++++++++++++++
>  include/drm/drm_gem.h     | 12 ++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 299bca1390aa..c0510b8080d2 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1458,3 +1458,18 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>  	return freed;
>  }
>  EXPORT_SYMBOL(drm_gem_lru_scan);
> +
> +/**
> + * drm_gem_object_evict - helper to evict backing pages for a GEM object
> + * @obj: obj in question
> + */
> +bool
> +drm_gem_object_evict(struct drm_gem_object *obj)
> +{
> +	dma_resv_assert_held(obj->resv);
> +
> +	if (obj->funcs->evict)
> +		return obj->funcs->evict(obj);
> +
> +	return false;
> +}

This function needs exporting for the module build to work correctly.

Steve

> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index b46ade812443..add1371453f0 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -172,6 +172,16 @@ struct drm_gem_object_funcs {
>  	 * This is optional but necessary for mmap support.
>  	 */
>  	const struct vm_operations_struct *vm_ops;
> +
> +	/**
> +	 * @evict:
> +	 *
> +	 * Evicts gem object out from memory. Used by the drm_gem_object_evict()
> +	 * helper. Returns true on success, false otherwise.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	bool (*evict)(struct drm_gem_object *obj);
>  };
>  
>  /**
> @@ -480,4 +490,6 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
>  			       unsigned long *remaining,
>  			       bool (*shrink)(struct drm_gem_object *obj));
>  
> +bool drm_gem_object_evict(struct drm_gem_object *obj);
> +
>  #endif /* __DRM_GEM_H__ */

