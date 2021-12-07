Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CC46B9B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 12:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE80EEAD2D;
	Tue,  7 Dec 2021 11:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E2FEAD2B;
 Tue,  7 Dec 2021 11:02:22 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 193so14230028qkh.10;
 Tue, 07 Dec 2021 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pulHoOflRb5vUNJw0Qfnz5ISbU0f6enuDwQLomYvBWQ=;
 b=AtuDXKG0HEuhOQj+9BoKzm+k9u6TNJ9tkmnFR+2NLD1B9EK5g7Ea4xnbHmaW9a1mIG
 xEh0c783RKJkmpgjLpAqL3L8F/llscUdHbjxffVjTfD4lXpluxrnkHhI1zQzLFYBRL30
 uuBfjDZGAOIqaLmdTI4/dhQG849pUhBRX4brv0tqPYG007sS3HUxEVKb7z5z1rGkjP2Y
 UftUXIo74MdzuV9MQqyV3xZsLlLCT2oerbXT7+HsCUBurjFofs/1Azdiwuq73/5B5lsd
 P9xabnYGb1EI2qZ89QEjcZnck//JX3EJ3i5ozUKtGDJ//q8JzGs7rU9Zngtb4dbexX6n
 s/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pulHoOflRb5vUNJw0Qfnz5ISbU0f6enuDwQLomYvBWQ=;
 b=gnGNt94ooX34fF3nL/cxu0Fs7urNlLLuEdVndfEbQK+FBxE9RKLOyOl7wDAy2hWA5V
 FcklQlvKkqbFy+4ZtWYUuLtfLFpRmNSK/ytCuXpzWDjXr8Eb90drFh0MVyThQwJDQCYD
 swNKVxePer1tvnxn+y5izKa+mD2bGhXokjnGanNo7m3/gYqlPp5GI2sA/7fzEYD7tTOu
 lNyg/wZZ0UlcKJmUy0DgJ4LRHYP4OkrJ7JCSGxrevgT+EUH6vCkDMAseqI0iU6lQe89K
 go3xDjYIS0KutE/XZguuE1e6zEo32Oq4/1S4KlvmkIgyQ4q3j1MW8F3OfJ8IqCEP1by5
 psEQ==
X-Gm-Message-State: AOAM533xSR3y4d1y9xDxgzDIKjq73SQFxb3arua7umP3fqh0vtiGVHFP
 cWkrTC8lJBsyjxG1NCcgTgMhbxIhQp3S0lWMirCZgApAPvmrxA==
X-Google-Smtp-Source: ABdhPJxcr5mSKAVT8Kbo1XajRLrrom8STZzW+dwThwQ/9AxLcIlTKHIDLKM8Hq+KhTXHXqqBuBtStig83DVPjub1nUU=
X-Received: by 2002:a37:a353:: with SMTP id m80mr40322424qke.7.1638874941269; 
 Tue, 07 Dec 2021 03:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <20211129134735.628712-8-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211129134735.628712-8-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 7 Dec 2021 11:01:55 +0000
Message-ID: <CAM0jSHO-rLxHLoM+mDtuQ-syUx4d_SzV5c_wpW87YTvu1X+AVg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 07/16] drm/i915: Take trylock during
 eviction, v2.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 29 Nov 2021 at 13:57, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Now that freeing objects takes the object lock when destroying the
> backing pages, we can confidently take the object lock even for dead
> objects.

That looks to be a future patch, at least with non-TTM backend? Does
something need to be re-ordered in the series?

>
> Use this fact to take the object lock in the shrinker, without requiring
> a reference to the object, so all calls to unbind take the object lock.

Hmm, the previous patch was talking about "we don't evict when
refcount = 0", but this looks to be doing something else?

>
> This is the last step to requiring the object lock for vma_unbind.
>
> Changes since v1:
> - No longer require the refcount, as every freed object now holds the lock
>   when unbinding VMA's.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  6 ++++
>  drivers/gpu/drm/i915/i915_gem_evict.c        | 34 +++++++++++++++++---
>  2 files changed, 35 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index eebff4735781..ad2123369e0d 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -405,12 +405,18 @@ i915_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr
>         list_for_each_entry_safe(vma, next,
>                                  &i915->ggtt.vm.bound_list, vm_link) {
>                 unsigned long count = vma->node.size >> PAGE_SHIFT;
> +               struct drm_i915_gem_object *obj = vma->obj;
>
>                 if (!vma->iomap || i915_vma_is_active(vma))
>                         continue;
>
> +               if (!i915_gem_object_trylock(obj))
> +                       continue;
> +
>                 if (__i915_vma_unbind(vma) == 0)
>                         freed_pages += count;
> +
> +               i915_gem_object_unlock(obj);
>         }
>         mutex_unlock(&i915->ggtt.vm.mutex);
>
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index 2b73ddb11c66..286efa462eca 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -58,6 +58,9 @@ mark_free(struct drm_mm_scan *scan,
>         if (i915_vma_is_pinned(vma))
>                 return false;
>
> +       if (!i915_gem_object_trylock(vma->obj))
> +               return false;
> +
>         list_add(&vma->evict_link, unwind);
>         return drm_mm_scan_add_block(scan, &vma->node);
>  }
> @@ -178,6 +181,7 @@ i915_gem_evict_something(struct i915_address_space *vm,
>         list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
>                 ret = drm_mm_scan_remove_block(&scan, &vma->node);
>                 BUG_ON(ret);
> +               i915_gem_object_unlock(vma->obj);
>         }
>
>         /*
> @@ -222,10 +226,12 @@ i915_gem_evict_something(struct i915_address_space *vm,
>          * of any of our objects, thus corrupting the list).
>          */
>         list_for_each_entry_safe(vma, next, &eviction_list, evict_link) {
> -               if (drm_mm_scan_remove_block(&scan, &vma->node))
> +               if (drm_mm_scan_remove_block(&scan, &vma->node)) {
>                         __i915_vma_pin(vma);
> -               else
> +               } else {
>                         list_del(&vma->evict_link);
> +                       i915_gem_object_unlock(vma->obj);
> +               }
>         }
>
>         /* Unbinding will emit any required flushes */
> @@ -234,16 +240,22 @@ i915_gem_evict_something(struct i915_address_space *vm,
>                 __i915_vma_unpin(vma);
>                 if (ret == 0)
>                         ret = __i915_vma_unbind(vma);
> +
> +               i915_gem_object_unlock(vma->obj);
>         }
>
>         while (ret == 0 && (node = drm_mm_scan_color_evict(&scan))) {
>                 vma = container_of(node, struct i915_vma, node);
>
> +
>                 /* If we find any non-objects (!vma), we cannot evict them */
> -               if (vma->node.color != I915_COLOR_UNEVICTABLE)
> +               if (vma->node.color != I915_COLOR_UNEVICTABLE &&
> +                   i915_gem_object_trylock(vma->obj)) {
>                         ret = __i915_vma_unbind(vma);
> -               else
> -                       ret = -ENOSPC; /* XXX search failed, try again? */
> +                       i915_gem_object_unlock(vma->obj);
> +               } else {
> +                       ret = -ENOSPC;
> +               }
>         }
>
>         return ret;
> @@ -333,6 +345,11 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>                         break;
>                 }
>
> +               if (!i915_gem_object_trylock(vma->obj)) {
> +                       ret = -ENOSPC;
> +                       break;
> +               }
> +
>                 /*
>                  * Never show fear in the face of dragons!
>                  *
> @@ -350,6 +367,8 @@ int i915_gem_evict_for_node(struct i915_address_space *vm,
>                 __i915_vma_unpin(vma);
>                 if (ret == 0)
>                         ret = __i915_vma_unbind(vma);
> +
> +               i915_gem_object_unlock(vma->obj);
>         }
>
>         return ret;
> @@ -393,6 +412,9 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>                         if (i915_vma_is_pinned(vma))
>                                 continue;
>
> +                       if (!i915_gem_object_trylock(vma->obj))
> +                               continue;
> +
>                         __i915_vma_pin(vma);
>                         list_add(&vma->evict_link, &eviction_list);
>                 }
> @@ -406,6 +428,8 @@ int i915_gem_evict_vm(struct i915_address_space *vm)
>                                 ret = __i915_vma_unbind(vma);
>                         if (ret != -EINTR) /* "Get me out of here!" */
>                                 ret = 0;
> +
> +                       i915_gem_object_unlock(vma->obj);
>                 }
>         } while (ret == 0);
>
> --
> 2.34.0
>
