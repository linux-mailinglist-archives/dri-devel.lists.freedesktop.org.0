Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C2296B8D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 10:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA4B6E4DD;
	Fri, 23 Oct 2020 08:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF3B6E0A0;
 Fri, 23 Oct 2020 08:55:54 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id b129so466002vsb.1;
 Fri, 23 Oct 2020 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VrgWV1XWbcuCg9GaCDJeiAri9+wMdkyvxmkhnkdh2XQ=;
 b=k/zsz1D5kJL1QqFMhfky40jSWvVoK56aDfPqEapqNR77K9tqGrd7nOc1uPV2aCqEUi
 zdJiZw63yV2i6Hyji7F8b2+zdTgoO3KCuEb2BVqZf19YRYt7SvvZ3iKem19to/08p5CC
 tEaqVviVrkFaN6n4z6ASWYejJEtreiSXQh9LqgKBZt9Fr5/2wXAIr3as9GGztW5Vm0WT
 PgvCAejIHZlkLsdy+GWOn2dMxAWhabc8tcJ/pwkCklLkRjeKH5JP2Mes39LVbAhlz7m5
 15pGx9iAjwTwLTYNKVnreYjuAZMYWVlKmTJBqhhDOD0qiqXMBhNncp8RzBE9qKWc9KuT
 bxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VrgWV1XWbcuCg9GaCDJeiAri9+wMdkyvxmkhnkdh2XQ=;
 b=NHj5ytEzkk16cAxAQXU1fa479azOyjTmjwd8iYPDaaNxjSMU/bOguNifyUDyvEIVhL
 kqeeT5OXJshdWsXXO53yVj3Jbs/XvbvQaM64Cpj8+ozOL57XA5Ebke3LB+WHLRBUUwHo
 +6HhEEZFAphvArGhHkBBlOBshI8W4jjcUvzoF0TBmtCxvqia6Xc15BXoKtvRBMjw4deJ
 x4WKpec8znVprgfgINW5FPvjERmxvZFNBQuEAYWvz44K7II0wWM+Z1H2L2e62jydlPS8
 L2BlKjR+9OVG5hLiYpiEz7Zp11ZerA+qZwrSnzr8SJSGNcHcbZmhI3AQLfm4VU2liZO1
 +AwA==
X-Gm-Message-State: AOAM533/XhYNOz72RXhP0re/sRjObN1iJelSzxz1Y+BXcMsBBPYTpdUX
 kNQgL7Vt2/r9M1NhJbi13or1h+E8ijBxej1p44o=
X-Google-Smtp-Source: ABdhPJxzw/TzwHl8NsIg10rvRwEW2mPINuyDLe8SZgJ7I5reykwZdVAlN/5t6G6QC7KBmfvF1V0QRkpdTfuZ4Fmj9gY=
X-Received: by 2002:a05:6102:31b5:: with SMTP id
 d21mr563635vsh.19.1603443353482; 
 Fri, 23 Oct 2020 01:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201019204636.139997-1-robdclark@gmail.com>
 <20201019204636.139997-7-robdclark@gmail.com>
In-Reply-To: <20201019204636.139997-7-robdclark@gmail.com>
From: =?UTF-8?Q?Kristian_H=C3=B8gsberg?= <hoegsberg@gmail.com>
Date: Fri, 23 Oct 2020 10:55:42 +0200
Message-ID: <CAOeoa-e+ObTCG+KFvkT7NJngHvDyDoc+zNTyOpJqRkL=8TxqVg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v3 06/23] drm/msm/gem: Move locking in
 shrinker path
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 10:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Move grabbing the bo lock into shrinker, with a msm_gem_trylock() to
> skip over bo's that are already locked.  This gets rid of the nested
> lock classes.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c          | 24 +++++----------------
>  drivers/gpu/drm/msm/msm_gem.h          | 29 ++++++++++----------------
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 27 +++++++++++++++++-------
>  3 files changed, 35 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index e0d8d739b068..1195847714ba 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -17,8 +17,6 @@
>  #include "msm_gpu.h"
>  #include "msm_mmu.h"
>
> -static void msm_gem_vunmap_locked(struct drm_gem_object *obj);
> -
>
>  static dma_addr_t physaddr(struct drm_gem_object *obj)
>  {
> @@ -693,20 +691,19 @@ int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv)
>         return (madv != __MSM_MADV_PURGED);
>  }
>
> -void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
> +void msm_gem_purge(struct drm_gem_object *obj)
>  {
>         struct drm_device *dev = obj->dev;
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>
>         WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> +       WARN_ON(!msm_gem_is_locked(obj));
>         WARN_ON(!is_purgeable(msm_obj));
>         WARN_ON(obj->import_attach);
>
> -       mutex_lock_nested(&msm_obj->lock, subclass);
> -
>         put_iova(obj);
>
> -       msm_gem_vunmap_locked(obj);
> +       msm_gem_vunmap(obj);
>
>         put_pages(obj);
>
> @@ -724,11 +721,9 @@ void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass)
>
>         invalidate_mapping_pages(file_inode(obj->filp)->i_mapping,
>                         0, (loff_t)-1);
> -
> -       msm_gem_unlock(obj);
>  }
>
> -static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
> +void msm_gem_vunmap(struct drm_gem_object *obj)
>  {
>         struct msm_gem_object *msm_obj = to_msm_bo(obj);
>
> @@ -741,15 +736,6 @@ static void msm_gem_vunmap_locked(struct drm_gem_object *obj)
>         msm_obj->vaddr = NULL;
>  }
>
> -void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass)
> -{
> -       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> -
> -       mutex_lock_nested(&msm_obj->lock, subclass);
> -       msm_gem_vunmap_locked(obj);
> -       msm_gem_unlock(obj);
> -}
> -
>  /* must be called before _move_to_active().. */
>  int msm_gem_sync_object(struct drm_gem_object *obj,
>                 struct msm_fence_context *fctx, bool exclusive)
> @@ -986,7 +972,7 @@ static void free_object(struct msm_gem_object *msm_obj)
>
>                 drm_prime_gem_destroy(obj, msm_obj->sgt);
>         } else {
> -               msm_gem_vunmap_locked(obj);
> +               msm_gem_vunmap(obj);
>                 put_pages(obj);
>         }
>
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index d55d5401a2d2..c5232b8da794 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -162,6 +162,13 @@ msm_gem_lock(struct drm_gem_object *obj)
>         mutex_lock(&msm_obj->lock);
>  }
>
> +static inline bool __must_check
> +msm_gem_trylock(struct drm_gem_object *obj)
> +{
> +       struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +       return mutex_trylock_recursive(&msm_obj->lock) == MUTEX_TRYLOCK_SUCCESS;

This can just be

    return mutex_trylock(&msm_obj->lock) == 1;

now, right?

> +}
> +
>  static inline int
>  msm_gem_lock_interruptible(struct drm_gem_object *obj)
>  {
> @@ -190,6 +197,7 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
>
>  static inline bool is_purgeable(struct msm_gem_object *msm_obj)
>  {
> +       WARN_ON(!msm_gem_is_locked(&msm_obj->base));
>         WARN_ON(!mutex_is_locked(&msm_obj->base.dev->struct_mutex));
>         return (msm_obj->madv == MSM_MADV_DONTNEED) && msm_obj->sgt &&
>                         !msm_obj->base.dma_buf && !msm_obj->base.import_attach;
> @@ -197,27 +205,12 @@ static inline bool is_purgeable(struct msm_gem_object *msm_obj)
>
>  static inline bool is_vunmapable(struct msm_gem_object *msm_obj)
>  {
> +       WARN_ON(!msm_gem_is_locked(&msm_obj->base));
>         return (msm_obj->vmap_count == 0) && msm_obj->vaddr;
>  }
>
> -/* The shrinker can be triggered while we hold objA->lock, and need
> - * to grab objB->lock to purge it.  Lockdep just sees these as a single
> - * class of lock, so we use subclasses to teach it the difference.
> - *
> - * OBJ_LOCK_NORMAL is implicit (ie. normal mutex_lock() call), and
> - * OBJ_LOCK_SHRINKER is used by shrinker.
> - *
> - * It is *essential* that we never go down paths that could trigger the
> - * shrinker for a purgable object.  This is ensured by checking that
> - * msm_obj->madv == MSM_MADV_WILLNEED.
> - */
> -enum msm_gem_lock {
> -       OBJ_LOCK_NORMAL,
> -       OBJ_LOCK_SHRINKER,
> -};
> -
> -void msm_gem_purge(struct drm_gem_object *obj, enum msm_gem_lock subclass);
> -void msm_gem_vunmap(struct drm_gem_object *obj, enum msm_gem_lock subclass);
> +void msm_gem_purge(struct drm_gem_object *obj);
> +void msm_gem_vunmap(struct drm_gem_object *obj);
>  void msm_gem_free_work(struct work_struct *work);
>
>  /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index 482576d7a39a..2dc0ffa925b4 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -52,8 +52,11 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>                 return 0;
>
>         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> +               if (!msm_gem_trylock(&msm_obj->base))
> +                       continue;
>                 if (is_purgeable(msm_obj))
>                         count += msm_obj->base.size >> PAGE_SHIFT;
> +               msm_gem_unlock(&msm_obj->base);
>         }
>
>         if (unlock)
> @@ -78,10 +81,13 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
>                 if (freed >= sc->nr_to_scan)
>                         break;
> +               if (!msm_gem_trylock(&msm_obj->base))
> +                       continue;
>                 if (is_purgeable(msm_obj)) {
> -                       msm_gem_purge(&msm_obj->base, OBJ_LOCK_SHRINKER);
> +                       msm_gem_purge(&msm_obj->base);
>                         freed += msm_obj->base.size >> PAGE_SHIFT;
>                 }
> +               msm_gem_unlock(&msm_obj->base);
>         }
>
>         if (unlock)
> @@ -107,15 +113,20 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>                 return NOTIFY_DONE;
>
>         list_for_each_entry(msm_obj, &priv->inactive_list, mm_list) {
> +               if (!msm_gem_trylock(&msm_obj->base))
> +                       continue;
>                 if (is_vunmapable(msm_obj)) {
> -                       msm_gem_vunmap(&msm_obj->base, OBJ_LOCK_SHRINKER);
> -                       /* since we don't know any better, lets bail after a few
> -                        * and if necessary the shrinker will be invoked again.
> -                        * Seems better than unmapping *everything*
> -                        */
> -                       if (++unmapped >= 15)
> -                               break;
> +                       msm_gem_vunmap(&msm_obj->base);
> +                       unmapped++;
>                 }
> +               msm_gem_unlock(&msm_obj->base);
> +
> +               /* since we don't know any better, lets bail after a few
> +                * and if necessary the shrinker will be invoked again.
> +                * Seems better than unmapping *everything*
> +                */
> +               if (++unmapped >= 15)
> +                       break;
>         }
>
>         if (unlock)
> --
> 2.26.2
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
