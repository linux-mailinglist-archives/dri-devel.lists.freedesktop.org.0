Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8BA63C558
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 17:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C8D10E0C5;
	Tue, 29 Nov 2022 16:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AF010E038
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 16:40:43 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g51-20020a9d12b6000000b0066dbea0d203so9451498otg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K78waBDJGkif7za6gqKCFTtsu32p8+QANMOHhvDlwsw=;
 b=nSB5KCiZI7DAGDSJaDYZqmduGMY2KQVyAFKkhuk3fFegPUfW1cDr+c1iUFeyyJz/of
 gIWXnGnR80+eiA1FXqAvuTvQFwSGl32+QZIarxtgRB1b06ZV8BJSTW3MakSo1H1ldSmX
 vzIooVJwV5nLyqyf/vSwBCdafTX4Ltdwjdf1ZrjQy7SXEFleHcvIuE/MwVSk+lV2k63+
 ibOed6JWKqfobTPF/hiIb5IY5u6nMCD5qA5qLJDwlPdNUaRyoGrvROGiYm1aS64qJoG9
 chgwMiLL4DBl11hNz6JjP1H75mAeEECPuwTwuzX5Kcx0nZAiIcxP6iQpuvq4LuPme1lC
 likA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K78waBDJGkif7za6gqKCFTtsu32p8+QANMOHhvDlwsw=;
 b=VWHmyK+TYiVaj8JJElCxcAfSwSn09SNwIniPFR+UN1GfgftdW7L9vbfNU3YH0fF2T0
 CT6YtFx81ghZi0N5ro9NUKfnkoZ53cS8kXYUfdhkKGLZ9ntsMG37TwK7B6Px1rtBY6mv
 VYppYuUuQoQziFeCtS+Vj8QJekl+HULcoiylUObn2MhQAwJ+xAwrnNRWvHGksuLJ7ilI
 3uXbUY/KvLhI8oJ9NXqgvfmVYXgvSVSJq3e6yKvktzdXva28AL0uCQSG/CoICaI1+wxc
 EnrAlnZ+aF6OgfULq2DJrKCgnHzcKxJD9CEyN9Qs8ZMoiNBuvwUrrnSwV9hIIZoIxVUv
 faJQ==
X-Gm-Message-State: ANoB5pnJLJn4TmQ6ytAx8ek46oPwaOBBRltBpltZbg9O57zpyIYD9Xgo
 Aj40kEs8kbbhjgmWdg8xHF8N95KomXCp4wwneHk=
X-Google-Smtp-Source: AA0mqf6QNn+q3W6OtufOMJC0QkPzO9jSHQOngL9Jsl3MZqmgQD8IOdpUGysoS6cLjUDNBXcPEr/LpqoksrOxBBV2mwI=
X-Received: by 2002:a9d:75d5:0:b0:667:7361:7db5 with SMTP id
 c21-20020a9d75d5000000b0066773617db5mr21623192otl.22.1669740042594; Tue, 29
 Nov 2022 08:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20221123025723.695075-1-dmitry.osipenko@collabora.com>
 <20221123025723.695075-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20221123025723.695075-2-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 29 Nov 2022 08:40:33 -0800
Message-ID: <CAF6AEGv832O8m-7pP8qaDChA3=Y6TmBZrwf-NYwvHkvH6sVMkw@mail.gmail.com>
Subject: Re: [PATCH v9 01/11] drm/msm/gem: Prevent blocking within shrinker
 loop
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 virtualization@lists.linux-foundation.org, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 7:00 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Consider this scenario:
>
> 1. APP1 continuously creates lots of small GEMs
> 2. APP2 triggers `drop_caches`
> 3. Shrinker starts to evict APP1 GEMs, while APP1 produces new purgeable
>    GEMs
> 4. msm_gem_shrinker_scan() returns non-zero number of freed pages
>    and causes shrinker to try shrink more
> 5. msm_gem_shrinker_scan() returns non-zero number of freed pages again,
>    goto 4
> 6. The APP2 is blocked in `drop_caches` until APP1 stops producing
>    purgeable GEMs
>
> To prevent this blocking scenario, check number of remaining pages
> that GPU shrinker couldn't release due to a GEM locking contention
> or shrinking rejection. If there are no remaining pages left to shrink,
> then there is no need to free up more pages and shrinker may break out
> from the loop.
>
> This problem was found during shrinker/madvise IOCTL testing of
> virtio-gpu driver. The MSM driver is affected in the same way.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_gem.c              | 9 +++++++--
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 8 ++++++--
>  include/drm/drm_gem.h                  | 4 +++-
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index b8db675e7fb5..299bca1390aa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1375,10 +1375,13 @@ EXPORT_SYMBOL(drm_gem_lru_move_tail);
>   *
>   * @lru: The LRU to scan
>   * @nr_to_scan: The number of pages to try to reclaim
> + * @remaining: The number of pages left to reclaim
>   * @shrink: Callback to try to shrink/reclaim the object.
>   */
>  unsigned long
> -drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
> +drm_gem_lru_scan(struct drm_gem_lru *lru,
> +                unsigned int nr_to_scan,
> +                unsigned long *remaining,
>                  bool (*shrink)(struct drm_gem_object *obj))
>  {
>         struct drm_gem_lru still_in_lru;
> @@ -1417,8 +1420,10 @@ drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
>                  * hit shrinker in response to trying to get backing pages
>                  * for this obj (ie. while it's lock is already held)
>                  */
> -               if (!dma_resv_trylock(obj->resv))
> +               if (!dma_resv_trylock(obj->resv)) {
> +                       *remaining += obj->size >> PAGE_SHIFT;
>                         goto tail;
> +               }
>
>                 if (shrink(obj)) {
>                         freed += obj->size >> PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 1de14e67f96b..4c8b0ab61ce4 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -116,12 +116,14 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>         };
>         long nr = sc->nr_to_scan;
>         unsigned long freed = 0;
> +       unsigned long remaining = 0;
>
>         for (unsigned i = 0; (nr > 0) && (i < ARRAY_SIZE(stages)); i++) {
>                 if (!stages[i].cond)
>                         continue;
>                 stages[i].freed =
> -                       drm_gem_lru_scan(stages[i].lru, nr, stages[i].shrink);
> +                       drm_gem_lru_scan(stages[i].lru, nr, &remaining,
> +                                        stages[i].shrink);
>                 nr -= stages[i].freed;
>                 freed += stages[i].freed;
>         }
> @@ -132,7 +134,7 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>                                      stages[3].freed);
>         }
>
> -       return (freed > 0) ? freed : SHRINK_STOP;
> +       return (freed > 0 && remaining > 0) ? freed : SHRINK_STOP;
>  }
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -182,10 +184,12 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>                 NULL,
>         };
>         unsigned idx, unmapped = 0;
> +       unsigned long remaining = 0;
>
>         for (idx = 0; lrus[idx] && unmapped < vmap_shrink_limit; idx++) {
>                 unmapped += drm_gem_lru_scan(lrus[idx],
>                                              vmap_shrink_limit - unmapped,
> +                                            &remaining,
>                                              vmap_shrink);
>         }
>
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index a17c2f903f81..b46ade812443 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -475,7 +475,9 @@ int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>  void drm_gem_lru_init(struct drm_gem_lru *lru, struct mutex *lock);
>  void drm_gem_lru_remove(struct drm_gem_object *obj);
>  void drm_gem_lru_move_tail(struct drm_gem_lru *lru, struct drm_gem_object *obj);
> -unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru, unsigned nr_to_scan,
> +unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
> +                              unsigned int nr_to_scan,
> +                              unsigned long *remaining,
>                                bool (*shrink)(struct drm_gem_object *obj));
>
>  #endif /* __DRM_GEM_H__ */
> --
> 2.38.1
>
