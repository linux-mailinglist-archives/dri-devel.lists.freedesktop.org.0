Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5541758D8BB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 14:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F6AD3012;
	Tue,  9 Aug 2022 12:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CAED2FD8;
 Tue,  9 Aug 2022 12:22:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id z22so14865481edd.6;
 Tue, 09 Aug 2022 05:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ENuHlbjz1pAGwfnMCHPOCMjJ7lm1GDfyKj1z+dAIomI=;
 b=LMIaO6KtyGfCMjyVolJLKx6pqbNHzm3nbsNhqOHQndZno2haGHemi3OKK32fd8ySvw
 xgI+8JOLck1XBBmrsobUtHo8q+Yy6RQKem2rama65pGIowkD9JGg5hjeTSBzjNg8Wj/B
 HdmJ9PE9f4BtDpOV6+oT7BpKQhoyjSh6tyWfkSG/3QPKHXBRT9jQ9V1sNlzkmTabTQ6J
 V+NbP+XPgk6LB4GuLotNzXDERUjM0BaxjTyt5nDUg5ZIA0ZaG3PfCxpJINWR0Tq5/HRZ
 M524vztuqbClD1dkMf4OHIXJDQTbdzqDEltcfto09QtOkUPWJUdWc3eSn0glyWzhzcTp
 n6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ENuHlbjz1pAGwfnMCHPOCMjJ7lm1GDfyKj1z+dAIomI=;
 b=sBsK8U3PDtq1wn8b5yLhA+nY6iZ/Uo+B1Jq1D9IGuo03/eyHsUAZAs8cqwNTonzkjN
 s9bHt84RdmUiUd0iHB736GaTneRAdGpJHD6YyS3ewhg5DUwoCgNcL2Nd7P1fmgEt/C2V
 zGTUmBbvF5ek1rrK89Nfx6c9Nc8a3Lly5UDwNzkFDtXc7etQlYZv2y2GlpYSdt4TsufT
 WMudooEc82OOzeHq51pgSUdiA7AkXiwzkaXUDur5Z8iJEsypAtlviQRj7E1gRzGsgRXM
 c+vPEC56MLc6I4Swlyxm0ljqhB8EhTMZz8QZQPGlbS1/Hyay/Gx/wTTxoMQkKCY6zHeM
 l8NA==
X-Gm-Message-State: ACgBeo3MTMSaBwreCNBzjZIt0lh8b6rUEgn8JVX/sraLrcdlvWEPIj2P
 moyFbJeZvZxniWwXcYk27aw=
X-Google-Smtp-Source: AA6agR6pH7ES5csxKm46AMTJYImmVr1iiIFX65pwfW8why81zsLtDKWioSrAedC4PXxv1rnvVNUAUg==
X-Received: by 2002:a05:6402:538a:b0:43a:298e:bc2b with SMTP id
 ew10-20020a056402538a00b0043a298ebc2bmr21686576edb.125.1660047768338; 
 Tue, 09 Aug 2022 05:22:48 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 cn15-20020a0564020caf00b0043ba0cf5dbasm5886236edb.2.2022.08.09.05.22.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 05:22:47 -0700 (PDT)
Message-ID: <a08c001f-b0e8-4e7c-6d63-16b2a0e7a505@gmail.com>
Date: Tue, 9 Aug 2022 14:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH v2 2/5] drm/gem: Take reservation lock for
 vmap/vunmap operations
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220725151839.31622-1-dmitry.osipenko@collabora.com>
 <20220725151839.31622-3-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220725151839.31622-3-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.07.22 um 17:18 schrieb Dmitry Osipenko:
> The new common dma-buf locking convention will require buffer importers
> to hold the reservation lock around mapping operations. Make DRM GEM core
> to take the lock around the vmapping operations and update QXL and i915
> drivers to use the locked functions for the case where DRM core now holds
> the lock. This patch prepares DRM core and drivers to transition to the
> common dma-buf locking convention where vmapping of exported GEMs will
> be done under the held reservation lock.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_client.c                 |  4 ++--
>   drivers/gpu/drm/drm_gem.c                    | 24 ++++++++++++++++++++
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 ++---
>   drivers/gpu/drm/drm_prime.c                  |  4 ++--
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c   |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c             | 17 +++++++-------
>   drivers/gpu/drm/qxl/qxl_prime.c              |  4 ++--
>   include/drm/drm_gem.h                        |  3 +++
>   8 files changed, 46 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index af3b7395bf69..e9a1cd310352 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -323,7 +323,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>   	 * fd_install step out of the driver backend hooks, to make that
>   	 * final step optional for internal users.
>   	 */
> -	ret = drm_gem_vmap(buffer->gem, map);
> +	ret = drm_gem_vmap_unlocked(buffer->gem, map);
>   	if (ret)
>   		return ret;
>   
> @@ -345,7 +345,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>   {
>   	struct iosys_map *map = &buffer->map;
>   
> -	drm_gem_vunmap(buffer->gem, map);
> +	drm_gem_vunmap_unlocked(buffer->gem, map);
>   }
>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>   
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb0c2d041f13..8b92846112ef 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1171,6 +1171,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
>   	int ret;
>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (!obj->funcs->vmap)
>   		return -EOPNOTSUPP;
>   
> @@ -1186,6 +1188,8 @@ EXPORT_SYMBOL(drm_gem_vmap);
>   
>   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (iosys_map_is_null(map))
>   		return;
>   
> @@ -1197,6 +1201,26 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   }
>   EXPORT_SYMBOL(drm_gem_vunmap);
>   
> +int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	int ret;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	ret = drm_gem_vmap(obj, map);
> +	dma_resv_unlock(obj->resv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_vmap_unlocked);
> +
> +void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	dma_resv_lock(obj->resv, NULL);
> +	drm_gem_vunmap(obj, map);
> +	dma_resv_unlock(obj->resv);
> +}
> +EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
> +
>   /**
>    * drm_gem_lock_reservations - Sets up the ww context and acquires
>    * the lock on an array of GEM objects.
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 61339a9cd010..135cd4a96ea9 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -354,7 +354,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
>   			ret = -EINVAL;
>   			goto err_drm_gem_vunmap;
>   		}
> -		ret = drm_gem_vmap(obj, &map[i]);
> +		ret = drm_gem_vmap_unlocked(obj, &map[i]);
>   		if (ret)
>   			goto err_drm_gem_vunmap;
>   	}
> @@ -376,7 +376,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
>   		obj = drm_gem_fb_get_obj(fb, i);
>   		if (!obj)
>   			continue;
> -		drm_gem_vunmap(obj, &map[i]);
> +		drm_gem_vunmap_unlocked(obj, &map[i]);
>   	}
>   	return ret;
>   }
> @@ -403,7 +403,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
>   			continue;
>   		if (iosys_map_is_null(&map[i]))
>   			continue;
> -		drm_gem_vunmap(obj, &map[i]);
> +		drm_gem_vunmap_unlocked(obj, &map[i]);
>   	}
>   }
>   EXPORT_SYMBOL(drm_gem_fb_vunmap);
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index b75ef1756873..1bd234fd21a5 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -678,7 +678,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	return drm_gem_vmap(obj, map);
> +	return drm_gem_vmap_unlocked(obj, map);
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>   
> @@ -694,7 +694,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	drm_gem_vunmap(obj, map);
> +	drm_gem_vunmap_unlocked(obj, map);
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 5ecea7df98b1..cc54a5b1d6ae 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
>   	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>   	void *vaddr;
>   
> -	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> +	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>   	if (IS_ERR(vaddr))
>   		return PTR_ERR(vaddr);
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index b42a657e4c2f..a64cd635fbc0 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -168,9 +168,16 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
>   		bo->map_count++;
>   		goto out;
>   	}
> -	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +
> +	r = __qxl_bo_pin(bo);
>   	if (r)
>   		return r;
> +
> +	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +	if (r) {
> +		__qxl_bo_unpin(bo);
> +		return r;
> +	}
>   	bo->map_count = 1;
>   
>   	/* TODO: Remove kptr in favor of map everywhere. */
> @@ -192,12 +199,6 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
>   	if (r)
>   		return r;
>   
> -	r = __qxl_bo_pin(bo);
> -	if (r) {
> -		qxl_bo_unreserve(bo);
> -		return r;
> -	}
> -
>   	r = qxl_bo_vmap_locked(bo, map);
>   	qxl_bo_unreserve(bo);
>   	return r;
> @@ -247,6 +248,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
>   		return;
>   	bo->kptr = NULL;
>   	ttm_bo_vunmap(&bo->tbo, &bo->map);
> +	__qxl_bo_unpin(bo);
>   }
>   
>   int qxl_bo_vunmap(struct qxl_bo *bo)
> @@ -258,7 +260,6 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
>   		return r;
>   
>   	qxl_bo_vunmap_locked(bo);
> -	__qxl_bo_unpin(bo);
>   	qxl_bo_unreserve(bo);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
> index 142d01415acb..9169c26357d3 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   	int ret;
>   
> -	ret = qxl_bo_vmap(bo, map);
> +	ret = qxl_bo_vmap_locked(bo, map);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -71,5 +71,5 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
>   {
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   
> -	qxl_bo_vunmap(bo);
> +	qxl_bo_vunmap_locked(bo);
>   }
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 87cffc9efa85..bf3700415229 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -420,4 +420,7 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>   int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>   			    u32 handle, u64 *offset);
>   
> +int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +
>   #endif /* __DRM_GEM_H__ */

