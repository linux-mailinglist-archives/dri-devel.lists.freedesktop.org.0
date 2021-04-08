Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85918357F6B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3144C6EA47;
	Thu,  8 Apr 2021 09:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F2A6EA47
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:37:00 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id c4so1518856qkg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 02:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghzoHE8k0viCzGCIXUnUb1wmrbHaDWfO8HjiU066O5o=;
 b=PVbRM/22xY28WeeeXUVsnvlTolRNlGTfWj3YwP6DiZ/EVeaVUQhVv7loyTrFhwc+nP
 Yl56oDANvOX16JH2jUgStFjNXf2rAeMCWadmCAXfIyS2dX1hKhQmAba5gpzD3czKJqwY
 xor4O22UEoNO/BZIDDcNezrtQIzvyQxammj0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghzoHE8k0viCzGCIXUnUb1wmrbHaDWfO8HjiU066O5o=;
 b=LU4vLDWZC6gzB8Ao+fuL5OhaTd6YosG2QmJi1tUqsdtgQ4x445c+nDnui4dGbYi214
 KpdLvuW/YcKTQQw0L7+DhXs1spHR7oWwLU2VPP1joiETv8uXTgvFP1CWlk8OKkBy/aC0
 YkP/4oBaBFsTiRpB3+jcNflJZ0aHpkQVdwmdkeVaMHBNSKfto2CsnjU+0STeE27NA68r
 d5k5trATMTRmAoXQ5/pG49aCQJpd978uItqIIW5bPXLwP7ZaxT2rxG6iZYvM7DmqICnp
 s/GAFL1vm8e3damK1YBac2B1m9AqDQTjODBagvAeAUcm9J4VSBtm5Lij8Hgnq8i9A2a8
 OO0A==
X-Gm-Message-State: AOAM531x7DRGQ6w91WI31JhZ5DChcCosLOx952E3woF+Lz9dOf9dPU7s
 LJJhYItZE4bdnP9NFBNU7t76vRnR7bcSw+CQnCQbiQ==
X-Google-Smtp-Source: ABdhPJy0VZh68sbDGfVx/USnKKb7xczieJsPs3t+EAlcUBcHHDIsp9ppQtPlhF20C7VLgw19SE4ZU0Fmwwr2Kuztc+E=
X-Received: by 2002:a05:620a:2190:: with SMTP id
 g16mr7412243qka.241.1617874619944; 
 Thu, 08 Apr 2021 02:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093448.3897988-1-stevensd@google.com>
In-Reply-To: <20210408093448.3897988-1-stevensd@google.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 8 Apr 2021 18:36:49 +0900
Message-ID: <CAD=HUj4up04e5kto3zhABdjxPtBMAchkSJx_WshZmTRcD-fTow@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: use newly allocated stub fences
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, I forgot to checkpatch this, I'll resend it momentarily.

-David

On Thu, Apr 8, 2021 at 6:34 PM David Stevens <stevensd@chromium.org> wrote:
>
> From: David Stevens <stevensd@chromium.org>
>
> Allocate a new private stub fence in drm_syncobj_assign_null_handle,
> instead of using a static stub fence.
>
> When userspace creates a fence with DRM_SYNCOBJ_CREATE_SIGNALED or when
> userspace signals a fence via DRM_IOCTL_SYNCOBJ_SIGNAL, the timestamp
> obtained when the fence is exported and queried with SYNC_IOC_FILE_INFO
> should match when the fence's status was changed from the perspective of
> userspace, which is during the respective ioctl.
>
> When a static stub fence started being used in by these ioctls, this
> behavior changed. Instead, the timestamp returned by SYNC_IOC_FILE_INFO
> became the first time anything used the static stub fence, which has no
> meaning to userspace.
>
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  drivers/dma-buf/dma-fence.c   | 33 ++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_syncobj.c | 28 ++++++++++++++++++++--------
>  include/linux/dma-fence.h     |  1 +
>  3 files changed, 53 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index d64fc03929be..6081eb962490 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -26,6 +26,11 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>  static DEFINE_SPINLOCK(dma_fence_stub_lock);
>  static struct dma_fence dma_fence_stub;
>
> +struct drm_fence_private_stub {
> +       struct dma_fence base;
> +       spinlock_t lock;
> +};
> +
>  /*
>   * fence context counter: each execution context should have its own
>   * fence context, this allows checking if fences belong to the same
> @@ -123,7 +128,9 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>  /**
>   * dma_fence_get_stub - return a signaled fence
>   *
> - * Return a stub fence which is already signaled.
> + * Return a stub fence which is already signaled. The fence's
> + * timestamp corresponds to the first time after boot this
> + * function is called.
>   */
>  struct dma_fence *dma_fence_get_stub(void)
>  {
> @@ -141,6 +148,30 @@ struct dma_fence *dma_fence_get_stub(void)
>  }
>  EXPORT_SYMBOL(dma_fence_get_stub);
>
> +/**
> + * dma_fence_allocate_private_stub - return a private, signaled fence
> + *
> + * Return a newly allocated and signaled stub fence.
> + */
> +struct dma_fence *dma_fence_allocate_private_stub(void)
> +{
> +       struct drm_fence_private_stub *fence;
> +
> +       fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +       if (fence == NULL)
> +               return ERR_PTR(-ENOMEM);
> +
> +       spin_lock_init(&fence->lock);
> +       dma_fence_init(&fence->base,
> +                      &dma_fence_stub_ops,
> +                      &fence->lock,
> +                      0, 0);
> +       dma_fence_signal(&fence->base);
> +
> +       return &fence->base;
> +}
> +EXPORT_SYMBOL(dma_fence_allocate_private_stub);
> +
>  /**
>   * dma_fence_context_alloc - allocate an array of fence contexts
>   * @num: amount of contexts to allocate
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 349146049849..c6125e57ae37 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -350,12 +350,15 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>   *
>   * Assign a already signaled stub fence to the sync object.
>   */
> -static void drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
> +static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>  {
> -       struct dma_fence *fence = dma_fence_get_stub();
> +       struct dma_fence *fence = dma_fence_allocate_private_stub();
> +       if (IS_ERR(fence))
> +              return PTR_ERR(fence);
>
> -       drm_syncobj_replace_fence(syncobj, fence);
> -       dma_fence_put(fence);
> +       drm_syncobj_replace_fence(syncobj, fence);
> +       dma_fence_put(fence);
> +       return 0;
>  }
>
>  /* 5s default for wait submission */
> @@ -469,6 +472,7 @@ EXPORT_SYMBOL(drm_syncobj_free);
>  int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>                        struct dma_fence *fence)
>  {
> +       int ret;
>         struct drm_syncobj *syncobj;
>
>         syncobj = kzalloc(sizeof(struct drm_syncobj), GFP_KERNEL);
> @@ -479,8 +483,13 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
>         INIT_LIST_HEAD(&syncobj->cb_list);
>         spin_lock_init(&syncobj->lock);
>
> -       if (flags & DRM_SYNCOBJ_CREATE_SIGNALED)
> -               drm_syncobj_assign_null_handle(syncobj);
> +       if (flags & DRM_SYNCOBJ_CREATE_SIGNALED) {
> +               ret = drm_syncobj_assign_null_handle(syncobj);
> +               if (ret < 0) {
> +                       drm_syncobj_put(syncobj);
> +                       return ret;
> +               }
> +       }
>
>         if (fence)
>                 drm_syncobj_replace_fence(syncobj, fence);
> @@ -1322,8 +1331,11 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>         if (ret < 0)
>                 return ret;
>
> -       for (i = 0; i < args->count_handles; i++)
> -               drm_syncobj_assign_null_handle(syncobjs[i]);
> +       for (i = 0; i < args->count_handles; i++) {
> +               ret = drm_syncobj_assign_null_handle(syncobjs[i]);
> +               if (ret < 0)
> +                       break;
> +       }
>
>         drm_syncobj_array_free(syncobjs, args->count_handles);
>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 9f12efaaa93a..6ffb4b2c6371 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -587,6 +587,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>  }
>
>  struct dma_fence *dma_fence_get_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);
>
>  #define DMA_FENCE_TRACE(f, fmt, args...) \
> --
> 2.31.0.208.g409f899ff0-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
