Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B72651103
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 18:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E413710E03B;
	Mon, 19 Dec 2022 17:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742B710E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 17:10:35 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r130so8395070oih.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 09:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o415vNGiWZJMFGap7OmVii6SWD7+LBqh+wGTkPFhiOE=;
 b=IWoAh3HdFUTEYgLFYMEAL6iHGBaUB2SXaZXaPzo4lG5lxYzeDBSfWVFbtF91KFRYCx
 eW8DqhsxCe87HWzSHmv5xbFPQHa05job4UlVtldM+cPOkc5PIzZvFBa8JkDhjZtDzoSZ
 oOI/IquvnWlv92yoTHpLN5Jq3x9ujzNwN2HIHkPh21lsXxwGUVUkvCmZtA9CDjX27yCJ
 Zx8P9FeVEzD7OnZfMKe+ifkwPpQ9rOFyRBlN0gMml6FTmWiknaDOr6z+3W5kEYaZz7rg
 MI9ucXegQOrVnX2IqcLR00Wt+Nyl14+fHmS3ez8+Sja83TFCMAX11tJ4JP/70DGNOgS2
 yiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o415vNGiWZJMFGap7OmVii6SWD7+LBqh+wGTkPFhiOE=;
 b=lM7hErUr4A6EpsNzJzgwVsKLVEIIq2MNkY9eEg1E6K1J3Zb//DfUpWqI5Arqckt0mW
 cL9nTwj2uvDwvc2jiWEw0RNodQegH03J7CzdWS006Dy4QAr/w2nm1qyTfILlJ25rLU33
 SiH3ycrafE7l9VgRiOmrh2htN63IWS2MFbXCF/zEWu8KGT3Crfk3/XiEutRYSZqt/hI4
 d/az4lvLmXw/lLkwy0J7h889k1Q0gPO89o8/jRguGWbZpcdRf9jpjlHucncCI9Z/tOdn
 6ibVOAXEhQkUBFu7VdqKZlV8nA3nB/tPO5hOV68fdqzh17MksDz1q6b/WN9yzk6HCsWi
 l/dw==
X-Gm-Message-State: ANoB5pniD9aKI6h4Jo+xtpBM8e/Y2HGNcX2iYHastb2PCUPeeeguDjdB
 UJFeZe6S9JnNO9wJFUlmb5IpyGhzuizuTn6kNq/yvkJM
X-Google-Smtp-Source: AA0mqf4dXq6LEueYgWCPenepyFYAJvBJhWuXCZSaiNwDQGXZInwKN2ESNZrVlXut+TrHwJ/ytVdjkm0ZJigEepf2J7Y=
X-Received: by 2002:a54:4409:0:b0:35c:28e4:f42d with SMTP id
 k9-20020a544409000000b0035c28e4f42dmr784639oiw.38.1671469833250; Mon, 19 Dec
 2022 09:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20221219140130.410578-1-steven.price@arm.com>
In-Reply-To: <20221219140130.410578-1-steven.price@arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Dec 2022 09:10:33 -0800
Message-ID: <CAF6AEGsZgjyv7r5_xWh1M9eR6+6A16bYZy9YLKAAf0Rm1iTnCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Fix GEM handle creation ref-counting
To: Steven Price <steven.price@arm.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 6:02 AM Steven Price <steven.price@arm.com> wrote:
>
> panfrost_gem_create_with_handle() previously returned a BO but with the
> only reference being from the handle, which user space could in theory
> guess and release, causing a use-after-free. Additionally if the call to
> panfrost_gem_mapping_get() in panfrost_ioctl_create_bo() failed then
> a(nother) reference on the BO was dropped.
>
> The _create_with_handle() is a problematic pattern, so ditch it and
> instead create the handle in panfrost_ioctl_create_bo(). If the call to
> panfrost_gem_mapping_get() fails then this means that user space has
> indeed gone behind our back and freed the handle. In which case just
> return an error code.
>
> Reported-by: Rob Clark <robdclark@chromium.org>

Yeah, I like getting rid of the _create_with_handle() pattern, the
only place where that pattern works is if you immediately return the
handle to userspace (and don't otherwise touch the obj)

Reviewed-by: Rob Clark <robdclark@gmail.com>

> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++++++---------
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 16 +--------------
>  drivers/gpu/drm/panfrost/panfrost_gem.h |  5 +----
>  3 files changed, 20 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index fa619fe72086..abb0dadd8f63 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -82,6 +82,7 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>         struct panfrost_gem_object *bo;
>         struct drm_panfrost_create_bo *args = data;
>         struct panfrost_gem_mapping *mapping;
> +       int ret;
>
>         if (!args->size || args->pad ||
>             (args->flags & ~(PANFROST_BO_NOEXEC | PANFROST_BO_HEAP)))
> @@ -92,21 +93,29 @@ static int panfrost_ioctl_create_bo(struct drm_device *dev, void *data,
>             !(args->flags & PANFROST_BO_NOEXEC))
>                 return -EINVAL;
>
> -       bo = panfrost_gem_create_with_handle(file, dev, args->size, args->flags,
> -                                            &args->handle);
> +       bo = panfrost_gem_create(dev, args->size, args->flags);
>         if (IS_ERR(bo))
>                 return PTR_ERR(bo);
>
> +       ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
> +       if (ret)
> +               goto out;
> +
>         mapping = panfrost_gem_mapping_get(bo, priv);
> -       if (!mapping) {
> -               drm_gem_object_put(&bo->base.base);
> -               return -EINVAL;
> +       if (mapping) {
> +               args->offset = mapping->mmnode.start << PAGE_SHIFT;
> +               panfrost_gem_mapping_put(mapping);
> +       } else {
> +               /* This can only happen if the handle from
> +                * drm_gem_handle_create() has already been guessed and freed
> +                * by user space
> +                */
> +               ret = -EINVAL;
>         }
>
> -       args->offset = mapping->mmnode.start << PAGE_SHIFT;
> -       panfrost_gem_mapping_put(mapping);
> -
> -       return 0;
> +out:
> +       drm_gem_object_put(&bo->base.base);
> +       return ret;
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 293e799e2fe8..3c812fbd126f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -235,12 +235,8 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
>  }
>
>  struct panfrost_gem_object *
> -panfrost_gem_create_with_handle(struct drm_file *file_priv,
> -                               struct drm_device *dev, size_t size,
> -                               u32 flags,
> -                               uint32_t *handle)
> +panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
>  {
> -       int ret;
>         struct drm_gem_shmem_object *shmem;
>         struct panfrost_gem_object *bo;
>
> @@ -256,16 +252,6 @@ panfrost_gem_create_with_handle(struct drm_file *file_priv,
>         bo->noexec = !!(flags & PANFROST_BO_NOEXEC);
>         bo->is_heap = !!(flags & PANFROST_BO_HEAP);
>
> -       /*
> -        * Allocate an id of idr table where the obj is registered
> -        * and handle has the id what user can see.
> -        */
> -       ret = drm_gem_handle_create(file_priv, &shmem->base, handle);
> -       /* drop reference from allocate - handle holds it now. */
> -       drm_gem_object_put(&shmem->base);
> -       if (ret)
> -               return ERR_PTR(ret);
> -
>         return bo;
>  }
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index 8088d5fd8480..ad2877eeeccd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -69,10 +69,7 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
>                                    struct sg_table *sgt);
>
>  struct panfrost_gem_object *
> -panfrost_gem_create_with_handle(struct drm_file *file_priv,
> -                               struct drm_device *dev, size_t size,
> -                               u32 flags,
> -                               uint32_t *handle);
> +panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags);
>
>  int panfrost_gem_open(struct drm_gem_object *obj, struct drm_file *file_priv);
>  void panfrost_gem_close(struct drm_gem_object *obj,
> --
> 2.34.1
>
